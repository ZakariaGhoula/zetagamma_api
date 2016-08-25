class SendMailMailer < ApplicationMailer
  default from: 'webmail@zetagamma.fr',
          return_path: 'webmail@zetagamma.fr',
          to: 'contact@zetagamma.fr',
          delivery_method_options: {address: 'SSL0.OVH.NET',
                                    port: 587,
                                    domain: 'zetagamma.fr',
                                    user_name: 'website@zetagamma.fr',
                                    password: 'Website_ZG_2016',
                                    authentication: 'plain',
                                    enable_starttls_auto: true}

  def welcome(name, email, denomination, subject, message)
    @stringMsg = "Nouvelle demande de contact, de la part de " + name + ", " + email + ".\n\n\nSociété/dénomination: " + denomination + ".\n\nSujet: " + subject + "\n\n\nMessage:\n" + message + "\n\n#### Fin du message ###"
    mail(from: '"Webmail - ' + name + '" <webmail@zetagamma.fr>', subject: subject) do |format|
      format.text { render text: @stringMsg }
    end
  end
end
