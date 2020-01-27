class SearchController < ApplicationController
  def index
  end

 def show
    search_term = params['q'].capitalize
    response = RestClient.get "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?client_id=277ef29692f9a70d511415dc60592daf4cf2c6f6552d3e1b769924b2f2e2e6fe&client_secret=d6106f26e8ff5b749a606a1fba557f44eb3dca8f48596847770beb9b643ea352"
    json = JSON.parse response
    	@widgetname = json["name"]
    	@widgetsdiscription = json ["discrition"]
    end

    # For creating a New Widget 
    def create
    @widget = Widget.new(widget_params)
	   respond_to do |format|
      if @widget.save
        format.html { redirect_to @widget, notice: 'widget discription was successfully created.' }
        format.json { render :show, :created,  @widget }
      else
        format.html { render :new }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end


  # Edit/Widget
  def edit
    @widget = Widget.find(params[:widget_id])
    @widget = @widget.name
  end

  # DELETE /widget/
  def destroy
    @widget.destroy
    respond_to do |format|
      format.html { redirect_to widgets_url, notice: 'Widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
