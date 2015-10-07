require 'rails/generators'
require 'securerandom'

module DeviseMultipleTokenAuth
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path("../templates", __FILE__)
    class_option :orm

    desc "Sets up rails project token authentication with devise with columns for push notification data"
    def self.next_migration_number(path)
      sleep 1
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    end

    def create_migrations
      filepath = "#{self.class.source_root}/migrations/add_push_notification_columns_to_devices.rb"
      name = File.basename(filepath)
      migration_template "migrations/#{name}", "db/migrate/#{name}"

      # Dir["#{self.class.source_root}/migrations/*.rb"].sort.each do |filepath|
      #   name = File.basename(filepath)
      #   migration_template "migrations/#{name}", "db/migrate/#{name}"
      # end
    end
  end

end