###Cloud vars
variable "token" {
  description = "Yandex Cloud security OAuth token"
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID where resources will be created"
}

variable "cloud_id" {
  description = "Yandex Cloud ID where resources will be created"
}

###net vars
variable "vpc_name" {
  type        = string
  default     = "example_network"
  description = "VPC net & subnet name"
}

variable "default_zone" {
  description = "Yandex Cloud default Zone for provisoned resources"
  default     = "ru-central1-a"
}

variable "subnet-zones" {
  description = "Yandex Cloud default Zone for provisoned resources"
  default     = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]
}

variable "cidr" {
  type    = map(list(string))
  default = {
    stage = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  }
}

###VMs vars
variable "yc_image_family" {
  description = "family"
  default     = "ubuntu-2004-lts"
}

variable "image_id" {
  default = "fd8mk346omlpmp2rvng7"
}

variable "instance_cores" {
  description = "Cores per one instance"
  default     = "2"
}

variable "instance_memory" {
  description = "Memory in GB per one instance"
  default     = "2"
}

###Examle vars
variable "cluster_size" {
  default = 3
}

