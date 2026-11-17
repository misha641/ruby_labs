
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @medicines = current_user.medicines
                             .order(created_at: :desc)
  end
end
