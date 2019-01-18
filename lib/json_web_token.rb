class JsonWebToken

 class << self
 	#secret to encode and decode token
   def encode(payload, exp = 24.hours.from_now)
     payload[:exp] = exp.to_i
     
     #Testing Rails.application.secrets.secret_key_base
     JWT.encode(payload, Rails.application.secrets.secret_key_base)
   end

   def decode(token)
     body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
     HashWithIndifferentAccess.new body
   rescue
  
   end
 end
end