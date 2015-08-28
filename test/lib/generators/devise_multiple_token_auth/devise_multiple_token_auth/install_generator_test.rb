require 'test_helper'
require 'generators/devise_multiple_token_auth/install/install_generator'

module DeviseMultipleTokenAuth
  class DeviseMultipleTokenAuth::InstallGeneratorTest < Rails::Generators::TestCase
    tests DeviseMultipleTokenAuth::InstallGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
