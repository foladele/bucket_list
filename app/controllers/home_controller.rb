class HomeController < ApplicationController
  def index
  	@buckets = Bucket.all
  end
end
