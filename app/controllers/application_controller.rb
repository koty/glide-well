class ApplicationController < ActionController::Base
  before_action :authenticate_user! # 追記 (userの部分はmodel名)
end
