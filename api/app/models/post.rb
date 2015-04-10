class Post < ActiveRecord::Base
  serialize :meta
  enum event: { push: 0 }
end
