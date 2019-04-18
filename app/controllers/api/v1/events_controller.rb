class Api::V1::EventsController < Api::V1::BaseController

   def index
    @events = Event.all
  end

   def new
    @event = Event.new
  end

  def create
    #the following 3 lines are for ngrok to work, can delete after no need ngrok
    response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'
    response.headers['Access-Control-Allow-Credentials'] = 'true'
    response.headers['Access-Control-Allow-Headers'] = 'accept, content-type'
    @event = Event.new(event_params)
    @event.save
  end

   def event_params
    params.require(:event).permit(:id, :description, :timestamp, :page, :customer_id, :shop_id)
  end
end
