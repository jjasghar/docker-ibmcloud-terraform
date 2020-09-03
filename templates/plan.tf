# Configure the IBM Cloud Provider
provider "ibm" {
  ibmcloud_api_key    = "{{ ibmcloud_api_key }}"
}

data "ibm_space" "spacedata" {
  space = "dev"   # this will be different if you aren't is this space
  org   = "Developer Advocacy" # this will be different if you aren't is this org
}

data "ibm_org" "org" {
  org = "${data.ibm_space.spacedata.org}"
}

data "ibm_space" "space" {
  org   = "${data.ibm_space.spacedata.org}"
  space = "${data.ibm_space.spacedata.space}"
}

data "ibm_account" "account" {
  org_guid = "${data.ibm_org.org.id}"
}

resource "ibm_container_cluster" "{{ name }}" {
  count           = "{{ count }}"
  name            = "{{ name }}-${count.index}"
  datacenter      = "{{ datacenter }}"
  machine_type    = "{{ machine_type }}"
  hardware        =  "{{ hardware }}"
  public_vlan_id  =  "{{ public_vlan_id }}"
  private_vlan_id =  "{{ private_vlan_id }}"
  kube_version    =  "{{ kube_version }}"
  tags            =  [ {{ tags }} ]
  default_pool_size      = "{{ default_worker_pool_size }}"
  {% if entitlement == "cloud_pak" %}
    entitlement = "cloud_pak"
  {% else %}
  {% endif %}
}


