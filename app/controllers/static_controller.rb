class StaticController < ApplicationController
  def dashboard
  end

  def logout
    session['logged'] = ''
    redirect_to root_path
  end

  def login
  end

  def check_login
    if params['username'] == ENV['username'] &&
       params['password'] == ENV['password']
      session['logged'] = 'true'
      redirect_to matches_path(admin: true)
    else
      redirect_to '/login'
    end
  end

end
