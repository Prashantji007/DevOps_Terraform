package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformExample(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../", // Path to Terraform code
	}

	// Clean up resources after test
	defer terraform.Destroy(t, terraformOptions)

	// Run terraform init and apply
	terraform.InitAndApply(t, terraformOptions)

	// Verify Terraform output
	output := terraform.Output(t, terraformOptions, "example_output")
	assert.Equal(t, "expected_value", output)
}
