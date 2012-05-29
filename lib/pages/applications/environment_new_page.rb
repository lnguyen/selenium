class EnvironmentNewPage < BaseClassPage

  text_field(:environment_name, :id => "environment_name")
  text_field(:domain_name,      :id => "app_deployment_new_domain_name")

  select_list(:framework_environment,     :id => "framework_env")
  select_list(:runtime,                   :id => "environment_ruby_version")
  select_list(:region,                    :id => "environment_region")
  select_list(:database_stack,            :id => "db_stack_name")
  select_list(:database_backup_interval,  :id => "environment_backup_interval")
  select_list(:database_backup_window,    :id => "environment_backup_window")
  select_list(:snapshot_limit,            :id => "environment_snapshot_limit")
  select_list(:stack,                     :id => "environment_stack_label")

  radio_button(:passenger_2,  :id => "nginx_passenger")
  radio_button(:passenger_3,  :id => "nginx_passenger3")
  radio_button(:unicorn,      :id => "nginx_unicorn")
  radio_button(:puma,         :id => "nginx_puma")
  radio_button(:trinidad,     :id => "trinidad")

  checkbox(:ssh_all, :id => "select-all-keypairs")

  button(:create_environment, :class => "action submit")

  def create_new_environment(environment_name, framework_environment, application_stack, runtime, domain_name, region, database_stack, database_backup_interval, database_backup_window, snapshot_limit, stack)

    self.environment_name = environment_name
    self.framework_environment = framework_environment
    self.runtime = runtime
    self.domain_name = domain_name
    self.region = region
    self.database_stack = database_stack
    self.database_backup_interval = database_backup_interval
    self.database_backup_window = database_backup_window
    self.snapshot_limit = snapshot_limit
    self.stack = stack
    self.check_ssh_all

    case application_stack
    when "passenger 2"
      self.select_passenger_2
    when "passenger 3"
      self.select_passenger_3
    when "unicorn"
      self.select_unicorn
    when "puma"
      self.select_puma
    when "trinidad"
      self.select_trinidad
    end

    self.create_environment
    ClusterNewPage.new @browser
  end


end
