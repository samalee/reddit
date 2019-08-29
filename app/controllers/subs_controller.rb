class SubsController < ApplicationController
  # M odel - All the logic on the table or record, database restraints, associations
  # V iew - User interactionl, front end portion, keep the logic to a minimum
  # C ontorllers/Routes - directs traffic, actions - what you can do on the webpage. 
    #HTTP VERBS
  # C Create -> POST
  # R Read -> GET
  # U Update -> PUT/PATCH
  # D Destroy -> DELETE

  # All Actions Must return a response
    # HTML XML JSON or redirect to an action that does
    # HMTL by Default, hmtl page of the action name action.html.erb

  # Callbacks - perform logic at certain actions
  # before_action
  # after_action
  # skip_before_action
  # skip_after_action

  #before_action :method_to_call - all method
                                  # execept:
  #before_action :method_to_call, only: [:index, :show, :new]

  # Partials are common / shared views 

  # READ - GET
    # Page will see and interact with
    # shows record from the db onto the pages

    # index action - see all of the record for the table
      # @model_names = model_names.all
      # gets all the recrods and set them to a variable

    # show action - see a single record, it requires id
      # @model_name = Model_name.find(params[:id])

    # new action - display the new record form, creates the record in memory 
    # record in memory
      # @model_name = Model_name.new

    # edit action - displays the edit record form, id
      # @model_name = Model_name.find(params[:id])

    # Create / POST
      # - create aaction create a record from the new action
      # @model_name = MOdel_name.new(model_name_params)

      # if @model_name.save
      #   do something

      # else
      #   render :new
      # end

    # UPDATE / PUT PATCH
      # - update action, edit a record, edit for, id
      # @mode_name = Model.name.find(params[:id])
      # if @model_name.update(model_name_params)
        #do something
      #else
      # render :edit
    #end

    # Destroy / DELETE
      # - delete a record, id
      # Model_name.find(params[:id]).destroy
      # do something

  # model_name_params
    # - pass certain attr

  # private
  #   def model_name_params
  #     params.require(:model_name).permit(:attr, :everything that table)
  #   end

  # before_action :set_sub, onl: [:show, :update, :edit, :destroy]

  # def index
  #   @subs = Sub.all
  # end

  # def show
  #   @sub = Sub.find(params[:id])
  # end

  # def new
  #   @sub = Sub.new
  #   render partial: 'form'
  # end

  # def create
  #   @sub = Sub.new(sub_name_params)

  #   if @sub.save
  #     redirect_to subs_path
  #   else
  #     render :new
  #   end
  # end

  # def edit
  #   @sub = Sub.find(params[:id])
  #   render partial: 'form'
  # end


  # def update
  #   @sub = Sub.find(params[:id])
    
  #   if @sub.update(sub_params)
  #     redirect_to subs_path
  #   else 
  #     render :edit
  #   end
  # end

  # def destroy
  #   Sub.find(params[:id]).destroy
  #   redirect_ subs_path
  # end

  # private sub_params
  #   params.require(:sub).permit(:name)
  # end

  # before_action :set_sub, only: [:show, :update, :edit, :destroy]
  def index
    @subs = Sub.all
  end
  # show action - see a single record, id 
    # @model_name = Model_name.find(params[:id])
  def show
    @sub = Sub.find(params[:id])
  end
  # new action - display the new record form, creates the 
    # record in memory
      # @model_name = Model_name.new
  def new
    @sub = Sub.new
    render partial: 'form'
  end
  # Create / POST 
    # - create action create a record, from the new action 
    
    # @model_name = Model_name.new(model_name_params)
    # if @model_name.save
    #   do something
    # else
    #   render :new
    # end
  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to subs_path 
    else
      render :new 
    end
  end
  # edit action - displays the edit record form, id
    # @model_name = Model_name.find(params[:id])
  def edit
    @sub = Sub.find(params[:id])
    render partial: 'form'
  end
  # UPDATE / PUT PATCH
    # - update action, edit a record, edit form , id 
    #   @model_name = Model_name.find(params[:id])
    #   if @model_name.update(model_name_params)
    #     do something
    #   else
    #     render :edit
    #   end
  def update
    @sub = Sub.find(params[:id])
    
    if @sub.update(sub_params)
      redirect_to subs_path
    else
      render :edit
    end
  end
  # Destroy / DELETE
  # - destroy action delete a record, id 
  
  # Model_name.find(params[:id]).destroy
  # do something
  def destroy
    Sub.find(params[:id]).destroy
    redirect_to subs_path
  end
  # model_name_params
    # - pass certain attr 
  # private 
  #   def model_name_params
  #     params.require(:model_name).permit(:attr, :everything that table has)
  #   end
  private 
    def sub_params
      params.require(:sub).permit(:name)
    end
    def set_sub
      @sub = Sub.find(params[:id])
    end
end

