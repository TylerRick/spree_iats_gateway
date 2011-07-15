require "spree_iats_gateway/version"
require 'spree_core'

module SpreeIatsGateway
  class Railtie < Rails::Engine
    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      require 'active_merchant'
      require 'active_merchant/billing/iats_gateway'
      ActiveMerchant::Billing::IatsGateway
      
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      
      Gateway::Iats.register
    end

    config.to_prepare &method(:activate).to_proc
  end
end
