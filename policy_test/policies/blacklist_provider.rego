# Prevent specified providers from being used
package terraform

import input.tfplan as tfplan
import data.utils

# Blacklisted Terraform providers
not_allowed_provider = [
  "null"
]

deny[reason] {
    resource := tfplan.resource_changes[_]
    action := resource.change.actions[count(resource.change.actions) - 1]
    utils.array_contains(["create", "update"], action)  # allow destroy action

    provider_name := utils.get_basename(resource.provider_name)
    utils.array_contains(not_allowed_provider, provider_name)

    reason := sprintf(
        "%s: provider type %q is not allowed",
        [resource.address, provider_name]
    )
}
