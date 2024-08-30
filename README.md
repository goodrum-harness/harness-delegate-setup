# Harness Custom Delegate Setup
Dynamically build and manage Harness Delegate image creation and management

## Summary
The purpose of this repository is to serve as an example of how to build a custom Harness Delegate and automate the addition of tools into the delegate.

For more information on required SDKs, visit the current documentation
https://developer.harness.io/docs/platform/delegates/delegate-reference/delegate-required-sdks/

## Building Image
In order to build, leverage a container image creation tool and set the context to the `docker` directory.  When running the `docker build` command, multiple BUILD_ARGS can be provided to control some of the handling of the image creation.  Those include:
| Argument | Type | Description | Default |
| --- | --- | --- | --- |
| REPOSITORY | string | When pulling from a container registry, this value would be the organization or | harness |
| IMAGE | string | Container image name used as the base for the new image| delegate |
| TAG | string | Container image tag used as the base for the new image | latest |
| ADDITIONAL_PACKAGES | Space delimited list of strings | Identifies which packages script should be installed into the image being created | |

## Adding or modifying tool scripts

***Note:** If build argument `ADDITIONAL_PACKAGES` is `all` then every package installer script in the `scripts` directory will be run.*

The `updates.sh` script will read the `ADDITIONAL_PACKAGES` build argument to determine which included tool scripts to install.  In addition, the `os_packages.txt` file contains a list of operating system packages to install into the delegate.

Adding a new tool installation package requires the addition of a script in the `scripts` directory named as `install_<TOOLNAME>.sh` (e.g. `install_helm.sh`)

The package installer is expected to be a simple BASH script which will perform all required steps to install and configure the tool.

## Adding Custom Certificates and TrustStores
The configuration and setup simply requires that the certificates are added to the directory `docker/certificates` and the Java TrustStores are added to `docker/java_truststore`. The Dockerfile will automatically install those in the correct locations

For more information on Custom Certificates and Java TrustStore configurations, visit the current documentation
https://developer.harness.io/docs/platform/delegates/secure-delegates/install-delegates-with-custom-certs

## Authors
Harness Implementation Engineering Team

## License

MIT License. See [LICENSE](LICENSE) for full details.
