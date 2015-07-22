class ThingsController < ApplicationController
  def index
    @things = Thing.rank(:row_order).all
  end
  def new
    @thing = Thing.new
  end
  def show
    @thing = Thing.find(params[:id])
  end
  def create
    @thing = Thing.create(thing_params)


      if @thing.save
        redirect_to things_path
      else
        render :new
      end

  end

  def update_row_order
    @thing = Thing.find(thing_params[:thing_id])
    @thing.row_order_position = thing_params[:row_order_position]
    @thing.save

    render nothing: true
  end

  private

   def set_thing
     @thing = Thing.find(params[:id])
   end

   def thing_params
     params.require(:thing).permit(:thing_id, :title, :description, :row_order_position)
   end
end
