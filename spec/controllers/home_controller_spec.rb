require 'rails_helper'

RSpec.describe HomeController, type: :controller do
	it{ is_expected.to use_before_filter :authenticate_user! }
end
