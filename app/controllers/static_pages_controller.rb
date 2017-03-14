class StaticPagesController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "help", :help_path
  def home
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
