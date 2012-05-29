class ClusterNewPage < BaseClassPage
  
  radio_button(:single_instance,  :id => "configuration_single")
  radio_button(:basic_cluster,    :id => "configuration_cluster")
  radio_button(:custom,           :id => "configuration_custom")

  select_list(:external_address,        :id => "cluster_configuration_ip_id")
  select_list(:app_instance_size,       :id => "cluster_configuration_instance_size")
  select_list(:database_instance_size,  :id => "cluster_configuration_db_instance_size")
  select_list(:database_slave_size,     :id => "cluster_configuration_db_slave_size")
  select_list(:util_size,               :id => "util_size")


  text_field(:app_num_instances,  :id => "cluster_configuration_app_server_count")
  text_field(:app_volume,         :id => "cluster_configuration_data_volume_size")
  text_field(:database_volume,    :id => "cluster_configuration_db_volume_size")
  text_field(:util_name,          :id => "util_name")
  text_field(:util_volume,        :id => "util_size")

  button(:add_util,             :class => "add_util_server")
  button(:boot_configuration,   :class => "submit action")

  def add_single_instance
    self.external_address = "use amazon public hostname"
    self.select_single_instance
    self.boot_configuration
  end

  def add_util_instance(name, size, volume)
    self.util_name = name
    self.util_size = size
    self.util_volume = volume
    self.add_util
  end
  

  

end
