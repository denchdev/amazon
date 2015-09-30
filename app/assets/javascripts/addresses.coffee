$('#use-billing-address').change ->
  if @checked
    $('#shipping-address').fadeOut()
    $('#use_billing_address').val 'yes'
  else
    $('#shipping-address').fadeIn()
    $('#use_billing_address').val 'no'


