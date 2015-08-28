require 'securerandom'

module DeviseMultipleTokenAuth
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path("../templates", __FILE__)
      class_option :orm

      desc "Sets up rails project token authentication with devise"
      def self.next_migration_number(path)
        sleep 1
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

  #     def insert_into_user_model
  #       inject_into_file "app/models/user.rb", after: /^class\sUser < ActiveRecord::Base/ do
  #         <<-'RUBY'

  # ################################################################################ 
  # ## PeterGate Roles
  # ## The :user role is added by default and shouldn't be included in this list.
  # has_many :devices, class_name: DeviseMultipleTokenAuth::Device
  # ################################################################################
 
  #         RUBY
  #       end
  #     end

      def copy_initializer
        template "devise_multiple_token_auth.rb", "config/initializers/devise_multiple_token_auth.rb"
      end

      def create_migrations
        Dir["#{self.class.source_root}/migrations/*.rb"].sort.each do |filepath|
          name = File.basename(filepath)
          migration_template "migrations/#{name}", "db/migrate/#{name}"
        end
      end
    end
  end
end