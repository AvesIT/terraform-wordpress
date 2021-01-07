# terraform-wordpress

Terraform Module to deploy a wordpress site in a Kubernetes Cluster.

## Usage

See `examples/example.tf` for example usage of the module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| helm | ~> 1.3.0 |
| kubernetes | ~> 1.13.0 |
| mysql | ~> 1.9.0 |
| random | ~> 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| helm | ~> 1.3.0 |
| mysql | ~> 1.9.0 |
| random | ~> 2.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| chart\_version | Chart version | `string` | `""` | no |
| cluster\_issuer | Certmanager cluster-issuer for this ingress | `string` | `"letsencrypt-staging"` | no |
| db\_connect\_range | IP address (in MySQL format) that connections are tolerated from. For instance, a node ip range, service range or pod range | `string` | `"10.42.%"` | no |
| db\_uri | Hostname:port to connect to underlying database | `string` | `"mariadb"` | no |
| debug | Enable debug for the container | `bool` | `false` | no |
| extraURL | Extra hosts to be added to the ingress | `list(string)` | `[]` | no |
| image\_registry | Container registry to get image from | `string` | `"docker.io"` | no |
| image\_repository | Repository to get image from | `string` | `"bitnami/wordpress"` | no |
| main\_url | Main hostname/url for deployment | `string` | `"example.com"` | no |
| name | Deployment name | `string` | `"example"` | no |
| namespace | Deployment namespace | `string` | `"example_namespace"` | no |
| replicas | Number of replica pods desired | `number` | `1` | no |
| storage\_class | Kubernetes Storage class used for permanent storage | `string` | `"nfs"` | no |
| storage\_mode | Mount mode for storage | `string` | `"ReadWriteMany"` | no |
| storage\_size | Size of storage needed for the website | `string` | `"2Gi"` | no |
| wp\_version | Version of WordPress to run (image tag) | `string` | `"latest"` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing

We encourage you to contribute to this project in whatever way you like!

## Versioning

[Semantic Versioning 2.x](https://semver.org/)

In a nutshell:

> Given a version number MAJOR.MINOR.PATCH, increment the:
>
> 1. MAJOR version when you make incompatible API changes,
> 2. MINOR version when you add functionality in a backwards-compatible manner, and
> 3. PATCH version when you make backwards-compatible bug fixes.
>
> Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Maintainer

https://github.com/AvesIT


