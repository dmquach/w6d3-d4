# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string           not null
#  likeable_id   :bigint           not null
#  liker_id      :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :liker,
  class_name: :User
end
