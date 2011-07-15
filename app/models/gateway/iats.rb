class Gateway::Iats < Gateway
  preference :login, :string
  preference :password, :string

  def provider_class
    ActiveMerchant::Billing::IatsGateway
  end	
end
