package terraform

import input.tfplan as tfplan
import data.utils

deny[reason] {
    utils.greater_than_zero(tfplan.variables.check.value)

    reason := "Variable `check` is greater than set value."
}
