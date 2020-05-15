# terraform-wordpress

Terraform Module to deploy a wordpress site in a Kubernetes Cluster.

## Usage

See `examples/example.tf` for example usage of the module.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | Name of customer | string | `example` | no |
| namespace | Namespace to put this in | string | `example` | no |
| wp_version | Version of wordpress to deploy | string | `latest` | no |
| main_url | URL to expose via an ingress | string | `example.org` | no |
| storage_size | Size for permanent storage | string | `2Gi` | no |
| storage_class | Storage Class used for above storage | string | `nfs` | no
| storage_mode | Mount mode for above storage | string | `ReadWriteMany` | no
| db_uri | Connect string for database | string | `mariadb` | no
| db_connect_range | Allowed IP range of pods | string | `10.42.%` | no

## Outputs

None at current
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


