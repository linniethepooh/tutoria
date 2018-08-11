class TutorialsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  after_action :verify_authorized, except: [:show, :index], unless: :skip_pundit?
  before_action :find_tutorial, only: [:show, :edit, :update]
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

  def index
  end

  def show
    @steps = @tutorial.steps
    CaptionJob.perform_later
  end

  def destroy
  end

  def new
    @tutorial = Tutorial.new()
    authorize @tutorial
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def find_tutorial
    @tutorial = Tutorial.find(params[:id])
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end
