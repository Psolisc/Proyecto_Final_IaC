variable "image-id" {
    type        = string
    description = "The id of the machine image (AMI) to use for the server"
    default     = "ami-08c40ec9ead489470"

    validation {
        condition     = length(var.image-id) > 4 && substr(var.image-id, 0, 4) == "ami-"
        error_message = "The image-id value must be a valid AMI id, starting with \"ami-\"."
    }
}

variable "instance-type" {
    type        = string
    description = "Instance type"
    default     = "t2.micro"
}    

variable "key-name" {
    type        = string
    description = "Key name for EC2 instance"
    default     = "demo-challenge"
} 