class Todo < ApplicationRecord
  # attributes :detail, :done
  belongs_to :list
end