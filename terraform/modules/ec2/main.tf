// Public Instance
resource "aws_instance" "public_instance" {
    count = var.public_instance_count
    ami = data.aws_ami.ubuntu-18_04.id
    instance_type = var.public_instance_type
    key_name = var.key_name
    iam_instance_profile = var.iam_instance_profile
    user_data = var.user_data
    
    // Network Configurations
    subnet_id = "${element(var.subnet_ids, count.index)}"
    vpc_security_group_ids = var.security_group_ids
    
    tags = {
        "Name" = "${var.tier}-${var.public_instance_name}-${count.index + 1}"
    }
}



# // Private Instance
# resource "aws_instance" "private_instance" {
    
# }