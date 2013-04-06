class Project < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :assigned_projects
 
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
