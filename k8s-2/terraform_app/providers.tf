terraform { 
  required_providers { 
    kubernetes = { 
    source  = "hashicorp/kubernetes" 
    version = ">= 2.11.0" 
    } 

    null = {
      source = "hashicorp/null"
      version = ">= 3.1.1"
    }
  }
}

provider "kubernetes" { 
    config_path = "~/.kube/config" 
}
