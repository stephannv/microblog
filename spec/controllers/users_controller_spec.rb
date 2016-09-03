require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	it{ is_expected.to use_before_filter :authenticate_user! }
end
