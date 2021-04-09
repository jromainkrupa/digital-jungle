class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def choose_universe
  end

  def entrepreneur_tutorial
  end

  def contributor_tutorial
  end
end
