variable "access_token" {
  description = "access_token"
  type        = string
  sensitive   = true
}

variable "project_id"{
  description = "project_id"
  type        = string
  default     = "airline1-sabre-wolverine"
}

variable "region"{
  description = "region"
  type        = string
  default     = "us-central1"
}
