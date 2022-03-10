class TaskSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :dash

  attributes :id, :name_task, :schedule_id
end
