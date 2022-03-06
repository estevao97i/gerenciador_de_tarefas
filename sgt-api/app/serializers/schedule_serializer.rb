class ScheduleSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash
  attributes :id, :date, :user_id, :task_id 
end
