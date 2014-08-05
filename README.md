## Simple app that uses OffsitePayments PayFast integration

### Setup

#### Step 1.

```
bundle install
```

Then you should specify callback urls in `app/views/pay_fat/form.html.erb`:

```erb
<%= payment_service_for 'order-id-in-your-system', 'merchant-id', amount: 'amount-of-payment',
                                                                  service: :pay_fast,
                                                                  credential2: 'merchant-key',
                                                                  credential3: 'passphrase' do |s| %>

  <% s.item_name 'Name' %>
  <% s.return_url 'http://URL/pay_fast/success' %>
  <% s.cancel_url 'http://URL/pay_fast/cancel' %>
  <% s.notify_url 'http://URL/pay_fast/paid' %>
  <%= submit_tag "Submit" %>
<% end %>
```

`return_url`, `cancel_url`, `notify_url` are callback urls.

`return_url` - The URL where the user is returned to after payment has been successfully taken.
`cancel_url` - The URL where the user should be redirected should they choose to cancel their payment while on the PayFast system.
`notify_url` - The URL which is used by PayFast to post the Instant Transaction Notifications (ITNs) for this transaction.

You can check out all payment variables [here](https://www.payfast.co.za/c/std/website-payments-variables)

#### Step 2.

Navigate to `http://SITE/pay_fast/form` and press submit button. Next you should log in PayFast's sandbox with these credentials:

> User account:
> Username: sbtu01@payfast.co.za
> Password: clientpass

After making a payment you'll be redirected to `return_url` including ITN request that will be sended to your `notify_url`.
