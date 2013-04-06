namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_projects
    make_assigned_projects
  end
end

def make_users
  admin = User.create!(name:     "ban",
                       password: "levanban",
                       password_confirmation: "levanban")
  admin.toggle!(:admin)
  9.times do |n|
    name  = "name#{n}"    
    password  = "levanban"
    User.create!(name:     name,
                 password: password,
                 password_confirmation: password)
  end
end

def make_projects
  3.times do |n|
    name = "ProjectName#{n}"
    desc = "*********Description for project #{n}***********"
    Project.create!(name: name,
                    description: desc)
  end

end

def make_assigned_projects
  3.times do |n|
    user_id = [n*3+2, n*3+3, n*3+4]
    AssignedProject.create!(user_id: user_id[0],
                            project_id: n+1)
    AssignedProject.create!(user_id: user_id[1],
                            project_id: n+1)
    AssignedProject.create!(user_id: user_id[2],
                            project_id: n+1)
  end
end