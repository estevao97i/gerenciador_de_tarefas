class UserSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  
  attributes :id, :name
end
