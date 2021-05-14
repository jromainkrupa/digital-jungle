class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing_entrepreneur, :landing_contributor]

end
