variable "url" {
    type = string
    description = "(optional) describe your variable"
    default = "https://api.github.com/users"
}

data "http" "example" {
  url = var.url

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}

output "body" {
    value = data.http.example.body
}