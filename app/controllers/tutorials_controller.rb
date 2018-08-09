class TutorialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  after_action :verify_authorized, except: [:show, :index], unless: :skip_pundit?

  def index
  end

  def show
  end

  def destroy
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
