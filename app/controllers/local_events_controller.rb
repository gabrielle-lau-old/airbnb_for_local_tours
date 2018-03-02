class LocalEventsController < ApplicationController
  before_action :current_user_must_be_local_event_host, :only => [:edit, :update, :destroy]

  def current_user_must_be_local_event_host
    local_event = LocalEvent.find(params[:id])

    unless current_user == local_event.host
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @local_events = LocalEvent.all

    render("local_events/index.html.erb")
  end

  def show
    @sign_up = SignUp.new
    @local_event = LocalEvent.find(params[:id])

    render("local_events/show.html.erb")
  end

  def new
    @local_event = LocalEvent.new

    render("local_events/new.html.erb")
  end

  def create
    @local_event = LocalEvent.new

    @local_event.event_name = params[:event_name]
    @local_event.date = params[:date]
    @local_event.city = params[:city]
    @local_event.host_id = params[:host_id]

    save_status = @local_event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/local_events/new", "/create_local_event"
        redirect_to("/local_events")
      else
        redirect_back(:fallback_location => "/", :notice => "Local event created successfully.")
      end
    else
      render("local_events/new.html.erb")
    end
  end

  def edit
    @local_event = LocalEvent.find(params[:id])

    render("local_events/edit.html.erb")
  end

  def update
    @local_event = LocalEvent.find(params[:id])

    @local_event.event_name = params[:event_name]
    @local_event.date = params[:date]
    @local_event.city = params[:city]
    @local_event.host_id = params[:host_id]

    save_status = @local_event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/local_events/#{@local_event.id}/edit", "/update_local_event"
        redirect_to("/local_events/#{@local_event.id}", :notice => "Local event updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Local event updated successfully.")
      end
    else
      render("local_events/edit.html.erb")
    end
  end

  def destroy
    @local_event = LocalEvent.find(params[:id])

    @local_event.destroy

    if URI(request.referer).path == "/local_events/#{@local_event.id}"
      redirect_to("/", :notice => "Local event deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Local event deleted.")
    end
  end
end
