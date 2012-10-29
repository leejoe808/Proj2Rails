# app/controllers/workers_controller.rb
class WorkersController < ApplicationController
  def index
    @workers = Worker.all
    # new lines
    respond_to do |format|
      format.html { render :html => @workers }
      format.json { render :json => @workers }
    end
    # new lines ends
  end
  def create
    require "digest/md5"
    pass = Digest::MD5.hexdigest(params[:password])
    Worker.create(:name => params[:name],
      :username => params[:username],
      :password => pass,
      :department => params[:department])
  end
  def selectWorker
    @worker = Worker.all
  end
  #def update
   # require "digest/md5"
    #pass = Digest::MD5.hexdigest(params[:password])
    #worker = Worker.find_by_id(params[:id])
    #worker.update_attributes(:name => params[:name],
     # :username => params[:username],
      #:password => pass,
      #:department => params[:department])
  #end
  def update
    require "digest/md5"
    pass = Digest::MD5.hexdigest(params[:password])
    ne = params[:name]
    un = params[:username]
    dep = params[:department]
    id = params[:worker_id]
    @worker = Worker.find_by_id(id)
    @worker = Worker.update_attribute(:name => ne, 
      :username => un, :password => pass, :deparment => dep)
  end
  def delete
    id = params[:worker_id]
    @worker = Worker.find_by_id(id)
    if @worker.destroy
      redirect_to :controller => "workers", :action => "selectWorker"
    end
  end
  def login
    if params[:username] == nil
      username = password = ""
    else
      username = params[:username]
      password = params[:password]
    end
    conn = ActiveRecord::Base.connection
    idString = conn.select_value("select get_id('" +
      username + "','" + password + "')")
    id = idString.to_i
    cookies.signed[:id] = id
    if id == 1
      redirect_to :controller => "workers", 
        :action => "admin"
    elsif id > 1
      redirect_to :controller => "workshops", :action => "index"
    end 
  end
  def logout
    cookies.signed[:id] = nil;
    redirect_to :controller => "workshops", :action => "summary"
  end
end
