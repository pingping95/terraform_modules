module "ec2" {
    source = "../../modules/ec2"

    public_instance_type = var.pub_instance_type
    public_instance_name = var.pub_instance_name
    tier = var.tier
    subnet_ids = var.subnet_ids
    key_name = var.key_pair
    security_group_ids = var.sg_ids
}