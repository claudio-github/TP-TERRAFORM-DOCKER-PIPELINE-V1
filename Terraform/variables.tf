variable "name" {
  description = "(Required) Specifies the name of the resources. Changing this forces a new resource to be created."
  type        = string
  default = "talentpoolproject0001"
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
  default = "eastus"
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = string
  default     = null
}

