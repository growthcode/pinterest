# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# deleting previous seeds
user_count = 0
User.all.each do |user|
  if user.organization == "Faker_Seed"
    user_count += 1
    puts "================= Seed User '##{user_count}' ================="
    puts "Object: #{user}"
    puts "Name: #{user.name}"
    puts "Email: #{user.email}"

    pins_count = user.pins.count
    "Pins deleted #{pins_count}"

    user.destroy

    puts  "\n"
    puts "#{user.name} and projects -- DESTROYED" + "\n\n"
  end
end




# project and pap_action variables to be used
pins_array = []

model_seed_hash = {priority_array: [1, 1, 2, 2, 3, 3, 4, 4, 5, 5], state_of_action_array: ["complete", "complete", "not ready", "not ready","complete", "not ready", "not ready","complete", "not ready", "not ready"]}

hethe_person_1 = {acting_person: "Hethe Berg", acting_person_title: "Programmer"}
person_2 = {acting_person: Faker::Name.name, acting_person_title: Faker::Name.title}
person_3 = {acting_person: Faker::Name.name, acting_person_title: Faker::Name.title}
person_array = [hethe_person_1, person_2, person_3]


# 1 seed with the same email and user information
hethe = User.create!(
  name: "Hethe Berg",
  email: "asdf@asdf.com",
  password: 'asdfasdf',
  password_confirmation: 'asdfasdf',
)

projects_array.each do |project|
  hethe.projects.create!(project_name: project)
end

projects_array.each do |project|
  hethe_project_model_seed_hash = model_seed_hash
  position_iterator = 0
  10.times do 
    position_iterator += 1
    person_array_local = person_array
    random_person = person_array_local.sample
    hethe.projects.find_by_project_name(project).pap_actions.create!(
        acting_person: random_person[:acting_person],
        acting_person_title: random_person[:acting_person_title],
        action_statement: Faker::Hacker.verb.capitalize + " the " + Faker::Hacker.ingverb + " " + Faker::Hacker.adjective + " " + Faker::Hacker.noun + ".",
        description: Faker::Hacker.say_something_smart + " (Faker::Hacker.say_something_smart)",
        priority: hethe_project_model_seed_hash[:priority_array].sample,
        position: position_iterator,
        state_of_action: hethe_project_model_seed_hash[:state_of_action_array].sample
      )
  end 
end 


# 5 random seeds with projects and associated actions
5.times do 
  user_first_name = Faker::Name.first_name
  user_last_name = Faker::Name.last_name
  user_email = Faker::Internet.safe_email(user_first_name) 

  user = User.create!(
    first_name: user_first_name,
    last_name: user_last_name,
    email: user_email,
    password: 'asdfasdf',
    password_confirmation: 'asdfasdf',
    organization: 'Faker_Seed'
  )

  projects_array.each do |project|
    user.projects.create!(project_name: project)
  end

  projects_array.each do |project|
    project_model_seed_hash = model_seed_hash
    position_iterator = 0
    10.times do 
      position_iterator += 1
      person_array_local = person_array
      random_person = person_array_local.sample
      user.projects.find_by_project_name(project).pap_actions.create!(
          acting_person: random_person[:acting_person],
          acting_person_title: random_person[:acting_person_title],
          action_statement: Faker::Hacker.verb.capitalize + " the " + Faker::Hacker.ingverb + " " + Faker::Hacker.adjective + " " + Faker::Hacker.noun + ".",
          description: Faker::Hacker.say_something_smart + " (Faker::Hacker.say_something_smart)",
          priority: project_model_seed_hash[:priority_array].sample,
          position: position_iterator,
          state_of_action: project_model_seed_hash[:state_of_action_array].sample
        )
    end 
  end
end
