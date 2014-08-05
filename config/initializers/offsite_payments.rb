require 'offsite_payments/action_view_helper'

ActionView::Base.send(:include, OffsitePayments::ActionViewHelper)

OffsitePayments.mode = :test
