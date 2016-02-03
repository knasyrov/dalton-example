class NgController < ApplicationController
  def index
  end

  def template
    render file: "angular/#{params[:path]}", layout: false
  end
end
