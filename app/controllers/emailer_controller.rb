class EmailerController < ApplicationController
  def contact(name = params[:name], mail = params[:mail], denomination = params[:denomination], subject = params[:subject], message = params[:message], sent_at = Time.now)
    SendMailMailer.welcome(name, mail, denomination, subject, message).deliver_now
    puts 'Mail sent!'
    puts name
  end
end
