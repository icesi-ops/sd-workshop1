module "logic"{
    source                  = "../logic"
    location                = "Brazil South"
    environment  = "prod"
    service     = "distri"
}