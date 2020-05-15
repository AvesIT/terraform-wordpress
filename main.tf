resource "helm_release" "wp-install" {
  name = "wp-${var.customer_name}"
  repository = data.helm_repository.bitnami.metadata.0.name
  chart = "wordpress"
  namespace = var.customer_namespace
  version = var.wp_version
  
  set {
    name = "image.tag"
    value = "5.4.1"
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
    name = "persistence.storageClass"
    value = var.storage_class
  }
  set {
    name = "persistence.size"
    value = var.storage_size
  }
  set {
    name = "persistence.accessMode"
    value = "ReadWriteMany"
  }
  set {
    name = "mariadb.enabled"
    value = "false"
  }
  set {
    name = "externalDatabase.host"
    value = "${helm_release.sql-wordpress.name}-${helm_release.sql-wordpress.chart}.${kubernetes_namespace.db.metadata.0.name}"
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
}

resource "mysql_database" "this_install" {
  name = "wp_${var.customer_name}"
}

resource "mysql_user" "this_install" {
  user = "wp_${var.customer_name}"
  host = "10.42.%"
  plaintext_password = random_password.starmanswp.result
}

resource "mysql_grant" "this_install" {
  user = mysql_user.this_install.user
  host = mysql_user.this_install.host
  database = mysql_database.this_install.name
  privileges = [ "ALL PRIVILEGES" ]
}

resource "random_password" "starmanswp" {
  keepers = {
    database = mysql_database.this_install.name
  }
  length = 16
}

