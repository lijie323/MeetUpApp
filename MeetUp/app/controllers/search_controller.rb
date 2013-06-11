class SearchController < ApplicationController
  def search
    @key = params[:q]
    puts @key
    puts '------------------'
    @topi = Topic.find_by_name(@key)
    puts '------------------'
    @GwithN = Group.where("name = ?", @key)
    if @topi.present?
      puts @topi.name
      @GwithT = GroupWithTopic.where("topic_id = ?", @topi.id)
    end

  end
end
