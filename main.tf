resource "helm_release" "wp" {
  name       = "wp-${var.name}"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  namespace  = var.namespace
  version    = var.chart_version

  set {
    name  = "image.pullPolicy"
    value = "Always"
  }
  set {
    name  = "image.debug"
    value = var.debug
  }
  set {
    name  = "image.tag"
    value = var.wp_version
  }
  set {
    name  = "image.repository"
    value = var.image_repository
  }
  set {
    name  = "wordpressSkipInstall"
    value = "true"
  }
  set {
    name  = "service.type"
    value = "ClusterIP"
  }
  set {
    name  = "ingress.enabled"
    value = "true"
  }
  set {
    name  = "ingress.hostname"
    value = var.main_url
  }

  set {
    name  = "ingress.certManager"
    value = "true"
  }
  set {
    name  = "ingress.annotations.cert-manager\\.io\\/cluster-issuer"
    value = var.cluster_issuer
  }
  set {
    name  = "ingress.tls"
    value = "true"
  }
  set {
    name  = "persistence.storageClass"
    value = var.storage_class
  }
  set {
    name  = "persistence.size"
    value = var.storage_size
  }
  set {
    name  = "persistence.accessMode"
    value = var.storage_mode
  }
  set {
    name  = "mariadb.enabled"
    value = "false"
  }
  set {
    name  = "externalDatabase.host"
    value = var.db_uri
  }
  set {
    name  = "externalDatabase.port"
    value = "3306"
  }
  set {
    name  = "externalDatabase.user"
    value = mysql_user.wp.user
  }
  set_sensitive {
    name  = "externalDatabase.password"
    value = random_password.wp.result
  }
  set {
    name  = "externalDatabase.database"
    value = mysql_database.wp.name
  }
  set {
    name  = "allowEmptyPassword"
    value = "false"
  }
  set {
    name  = "healthcheckHttps"
    value = "true"
  }
  set {
    name  = "wordpressScheme"
    value = "https"
  }
  set {
    name  = "replicaCount"
    value = var.replicas
  }
}

resource "mysql_database" "wp" {
  name = "wp_${var.name}"
}

resource "mysql_user" "wp" {
  user               = "wp_${var.name}"
  host               = var.db_connect_range
  plaintext_password = random_password.wp.result
}

resource "mysql_grant" "wp" {
  user       = mysql_user.wp.user
  host       = mysql_user.wp.host
  database   = mysql_database.wp.name
  privileges = ["ALL PRIVILEGES"]
}

resource "random_password" "wp" {
  keepers = {
    database = mysql_database.wp.name
  }
  length  = 16
  special = "false"
}
