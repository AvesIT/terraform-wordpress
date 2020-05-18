resource "helm_release" "wp-install" {
  name = "wp-${var.name}"
  repository = data.helm_repository.bitnami.metadata.0.name
  chart = "wordpress"
  namespace = var.namespace
  version = var.chart_version 
  
  set {
    name = "image.tag"
    value = var.wp_version
  }
  set {
    name = "wordpressSkipInstall"
    value = "true"
  }
  set {
    name = "service.type"
    value = "ClusterIP"
  }
  set {
    name = "ingress.enabled"
    value = "true"
  }
  set {
    name = "ingress.hostname"
    value = var.main_url
  }
  set {
    name = "ingress.extraHosts"
    value = var.extraURL
  }
  set {
    name = "ingress.extraTLS"
    value = var.extraTLS
  }
  set {
    name = "ingress.certManager"
    value = "true"
  }
  set {
    name = "ingress.annotations.certmanager\\.k8s\\.io\\/cluster-issuer"
    value = var.cluster_issuer
  }
  set {
    name = "ingress.tls"
    value = "true"
  }
  set {
    name = "persistence.storageClass"
    value = var.storage_class
  }
  set {
    name = "persistence.size"
    value = var.storage_size
  }
  set {
    name = "persistence.accessMode"
    value = var.storage_mode
  }
  set {
    name = "mariadb.enabled"
    value = "false"
  }
  set {
    name = "externalDatabase.host"
    value = var.db_uri
  }
  set {
    name = "externalDatabase.port"
    value = "3306"
  }
  set {
    name = "externalDatabase.user"
    value = mysql_user.this_install.user
  }
  set {
    name = "externalDatabase.password"
    value = random_password.this_install.result
  }
  set {
    name = "externalDatabase.database"
    value = mysql_database.this_install.name
  }
  set {
    name = "allowEmptyPassword"
    value = "false"
  }
  set {
    name = "healthcheckHttps"
    value = "true"
  }
  set {
    name = "wordpressScheme"
    value = "https"
  }
}

resource "mysql_database" "this_install" {
  name = "wp_${var.name}"
}

resource "mysql_user" "this_install" {
  user = "wp_${var.name}"
  host = var.db_connect_range
  plaintext_password = random_password.this_install.result
}

resource "mysql_grant" "this_install" {
  user = mysql_user.this_install.user
  host = mysql_user.this_install.host
  database = mysql_database.this_install.name
  privileges = [ "ALL PRIVILEGES" ]
}

resource "random_password" "this_install" {
  keepers = {
    database = mysql_database.this_install.name
  }
  length = 16
  special = "false"
}

data "helm_repository" "bitnami" {
  name = "bitnami"
  url = "https://charts.bitnami.com/bitnami"
}

