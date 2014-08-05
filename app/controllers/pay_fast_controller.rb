class PayFastController < ApplicationController
  skip_before_action :verify_authenticity_token

  # ITN request
  def paid
    amount = 123 # It's amount of the order, e.g Order.where(...).amount
    notify = OffsitePayments::Integrations::PayFast::Notification.new(request.raw_post, passphrase: "passphrase",
                                                                                        remote_ip: request.remote_ip,
                                                                                        amount: amount)

    if notify.acknowledge
      if notify.complete?
        puts 'COMPLETE'
        puts notify.transaction_id
      else
        puts 'Something went wrong'
      end
    else
      puts 'fail'
    end

    render text: :nothing
  end

  # cancel payment
  def cancel
    render text: "cancel url return"
  end

  # simple redirect
  def success
    render text: "success url return"
  end
end
