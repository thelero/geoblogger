class PostsController < ApplicationController
  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.find(:all, :order => :created_at)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @posts }
    end
  end
  
  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html { render :layout => "googleMaps" }
      format.xml { render :xml => @post }
    end
  end
  
  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
        
    respond_to do |format|
      format.html { render :layout => "googleMaps" }
      format.xml { render :xml => @post }
    end
  end
  
  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    render :layout => "googleMaps"
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
        
    respond_to do |format|
      if @post.save
        flash[:notice] = "Post #{@post.title} was successfully created."
        format.html { redirect_to(:action => 'show', :id => @post.id) }
        format.xml { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])
        
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = "Post #{@post.title} was successfully updated."
        format.html { redirect_to(:action => 'show') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml { head :ok }
    end
  end





end
