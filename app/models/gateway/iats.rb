class Gateway::Iats < Gateway
  preference :login, :string
  preference :password, :string

  def provider_class
    ActiveMerchant::Billing::IatsGateway
  end	

  # This is overridden in order to:
  # * set cc_type (since it is nil by default)
  def purchase(money, credit_card, options = {})
    credit_card.cc_type ||= ActiveMerchant::Billing::CreditCard.type?(credit_card.number)
    provider.purchase(money, credit_card, options)
  end

  def void(response_code, creditcard, options = {})
    ActiveMerchant::Billing::Response.new(false, "Iats Gateway: Void is not supported", {:error => "Iats Gateway: Void is not supported"})
  end
end
