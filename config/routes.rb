Rails.application.routes.draw do
  scope 'pay_fast', controller: "pay_fast" do
    post :paid
    get  :success
    get  :cancel
    get  :form
  end
end
