module_rg = {
    rg1 = {
        name = "WebsureApp"
        location = "mexico central"
    }
}

vnmod = {
  vn1 = {
   name = "promovn"
    location = "mexico central"
    resource_group_name = "Promo-RG"
    address_space = ["10.0.0.0/16"]
  }
}

snmod = {
  sn1 = {
    name = "promosn1"
  virtual_network_name = "promovn"
  address_prefixes = ["10.0.0.0/24"]
  resource_group_name = "Promo-RG"
  }
}

vmmod = {
  vm1 = {
    virtual_network_name = "promovn"
    publicipname = "Promo-PIP1"
     resource_group_name = "Promo-RG"
      location = "mexico central"
      nicname = "promonic1"
      VMname = "promovm1"

  }

  vm2 = {
     virtual_network_name = "promovn"
    publicipname = "Promo-PIP2"
     resource_group_name = "Promo-RG"
      location = "mexico central"
      nicname = "promonic2"
      VMname = "promovm2"

  }

  vm3 = {
     virtual_network_name = "promovn"
    publicipname = "Promo-PIP3"
     resource_group_name = "Promo-RG"
      location = "mexico central"
      nicname = "promonic3"
      VMname = "promovm3"

  }
}


nsgmod = {
  nsg1={
    virtual_network_name = "promovn"
    nsgname = "promovm1_NSG"
     resource_group_name = "Promo-RG"
      location = "mexico central"
      security_rule_name = "promovm1_securityrule"
  }

  nsg2={
    virtual_network_name = "promovn"
    nsgname = "promovm2_NSG"
     resource_group_name = "Promo-RG"
      location = "mexico central"
      security_rule_name = "promovm1_securityrule"
  }

  nsg3={
    virtual_network_name = "promovn"
    nsgname = "promovm3_NSG"
     resource_group_name = "Promo-RG"
      location = "mexico central"
      security_rule_name = "promovm1_securityrule"
  }
}