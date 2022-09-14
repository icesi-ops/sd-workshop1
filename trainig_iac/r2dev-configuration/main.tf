module "logic"{
    source                  = "../logic"
    location    = "South US"
    environment  = "prod"
    service     = "distri"
}