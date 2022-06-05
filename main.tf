module "cardano_node" {
  source    = "./modules/cardano_node"
}

module "remote_state_locking" {
  source              = "./modules/remote_state"
  name_prefix          = "cardano-node"
  backend_output_path = "./backend.tf"
}
