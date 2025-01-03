package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformNetworkModule(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../../Modules/Azurerm_Vnet",
	})

	func TestTerraformvirtualmachine(t *testing.T) {
		terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
			TerraformDir: "../../../Modules/Azurerm_VM",
		})
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
	validate(t,terraformOptions)

	Output := terraform.Output(t, terraformOptions, "Vnet_output")
	assert.NotEmpty(t, Output)
	//assert.Equal(t, "expected_value", output)
}
