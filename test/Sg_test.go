package test

import (
	"net/http"
	"os"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestIntegrationsg(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../example",
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
	duration := time.Duration(200) * time.Second
	time.Sleep(duration)
	url := terraform.Output(t, terraformOptions, "web")

	resp, err := http.Get(url)
	if err != nil {
		os.Exit(1)

	}
	if resp == nil {
		os.Exit(2)
	}

}
