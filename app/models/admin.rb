#encoding:utf-8
class Admin < ActiveRecord::Base
  set_table_name 'admin'
  attr_accessible :username,:password,:name,:email,:addtime,:logintime,:loginip,:status

  def self.login(username,password)
    admin = Admin.where(:username=>username).where(:password=>self.pwd(password)).limit(1)
    if(admin.empty?)
      return false
    else
      return true
    end
  end

  def self.pwd(password)
    return Digest::MD5.hexdigest(password)
  end 
end
