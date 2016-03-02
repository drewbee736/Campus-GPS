class Picture < ActiveRecord::Base
  belongs_to:location
  belongs_to:intersection
end
