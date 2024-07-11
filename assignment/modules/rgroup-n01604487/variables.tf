variable "resource_group_name" {
  type        = string
  default     = "n01604487-RG"
}

variable "location" {
  type        = string
  default     = "Central Canada"  
}

variable "tags" {
  type        = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "sreehari"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
