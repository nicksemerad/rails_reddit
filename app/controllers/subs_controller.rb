class SubsController < ApplicationController
#MVC
  #models -- logic on the tables 
  #views -- what the user sees and interacts with
  #controllers -- traffic directors

    #skinny controllers / fat  models
      #controllers should be simple, models should contain the logic
#Actions - what you can do in the app
  #always return one of three things. response(html, xml, json)
  #if it doesnt return a response, then redirect to an action that does

  #READ -- GET
    #index - show all records in the table

        # def index
        #   @model_name(s) = Model_name.all
        # end

    #show - show single record (needs an ID)

      # def show
      #   @model_name = Model_name.find(params[:id])
      # end 

    #edit - shows the updating form for a single record, (needs an ID)

      # def edit
      #   @model_name = Model_name.find(params[:id])
      # end

    #new - create form, creates a record in memory

      # def new
      #   @model_name = Model_name.new
      # end

  #CREATE -- POST
    #create - creates a new record in the database, from the new action

        # def create
        #   @model_name = Model_name.new(model_name_params)
        #   if @model_name.save
        #     do something or redirect somewhere
        #   else
        #     render :new
        #   end
        # end
        # .
        # .
        # . put this down low
        # private
        #   #this passes in certain actions
        #   def model_name_params
        #     params.require(:model_name).permit(:attr, :attr1, :attr2(no id/created@/updated@))
        #   end

  #UPDATE -- PUT
    #update - updates a single record in db, from the edit form

          # def update
          #   @model_name = Model_name.find(params[:id])
          #   if @model_name.update(model_name_params)
          #     do something or redirect somewhere
          #   else
          #     render :edit
          #   end
          # end

  #DESTROY -- DELETE
    #destroy - deletes the record from the db, needs ID

    # def destroy
    #   @model_name = Model_name.find(params[:id]).destroy

    #   redirect elsewhere
    # end

#Before action to keep things DRY
before_action :set_sub, only: [:show, :edit, :update, :destroy]



  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
    render partial: 'form'
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path
    else
      render partial: "form"
    end
  end

  def edit
    render partial: 'form'
  end

  def update
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render partial: "form"
    end
  end

  def destroy
    @sub.destroy

    redirect_to subs_path
  end


  private

  def set_sub
    @sub = Sub.find(params[:id])
  end

  def sub_params
    params.require(:sub).permit(:name)
  end
end
