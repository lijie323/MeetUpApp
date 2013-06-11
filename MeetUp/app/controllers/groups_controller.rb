class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @group = Group.find(params[:id])
    @meetups = Meetup.where("group_id = ?", @group.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(params[:group])
    @group.user_id = session[:user_id]
    respond_to do |format|
      if @group.save
        @topics = Topic.all
        format.html {render 'addtopic'}
        # format.html { redirect_to @group, notice: 'Group was successfully created.' }
        # format.json { render json: @group, status: :created, location: @group }
      else
        format.html { render action: "new" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :no_content }
    end
  end

  def addtopic
    @t = params[:topic]
    if @t.present?
      $i = 0
      while $i < @t.length
        @gwt = GroupWithTopic.new
        @gwt.group_id = params[:gid]
        @gwt.topic_id = @t[$i]
        @gwt.save
        $i += 1
      end

      respond_to do |format|
        format.html { redirect_to groups_url, notice: 'Group was successfully created.' }
        # format.json { render json: @group, status: :created, location: @group }
      end
    else
      respond_to do |format|
        format.html {redirect_to :back}
      end
    end
  end

  def join
    @group = Group.find(params[:gid])
    if(@group.user_id != session[:user_id])
      @member = Membership.new
      @member.user_id = session[:user_id]
      @member.group_id = params[:gid]
      @member.save
      respond_to do |format|
        format.html { redirect_to @group, notice:'You have joined the group successfully'}
        format.json { render json: @group }
      end
    else
      respond_to do |format|
        format.html { redirect_to @group, notice:'You can not join yourself.'}
        format.json { render json: @group }
      end
    end
  end

  def quit
    @e = Membership.where("group_id=? AND user_id=?",params[:gid],session[:user_id])
    if @e.present?
      @e.destroy_all

    end
    redirect_to root_url
  end
end
