#encoding:utf-8
class IndexController < ApplicationController
  def index
    render :layout => false    
  end

  def login
    if request.post?
      username = params[:username]
      password = params[:password]
      
      admin = Admin.login(username,password) 
      if(admin)
        redirect_to(:action=>'index')
        return 
      else
        @error_msg = '用户名或密码错误！'
      end
    end
    if(defined?(@error_msg))
      puts @error_msg
    end
    render :layout => false
  end
end
