company = Company.new ({
  name: "ikea",
  main_logo: "https://www.freepnglogos.com/uploads/abc-png-logo/news-abc-png-logo-3.png",
  address: "Pall Mall",
  city: "London",
  zipcode: "SW98BZ",
  country: "United Kingdom"
})
company.save!

tutorial = Tutorial.new ({
  subtitle: "Climb",
  product: "Hydraulic Powered Robotic",
  title: "How to Make Hydraulic Powered Robotic Arm from Cardboard",
  description: "In this video I show you how to make robotic arm from cardboard, it's quite fun to plaw with.",
  public: true,
  company_id: company.id,
  materials: "2 Pairs of jeans. 2 Sport shorts. 3 Shorts.",
  file: "https://www.youtube.com/embed/P2r9U4wkjcc"
})
tutorial.save!
89.times do
  View.create!({
    start_time: DateTime.now,
    end_time: DateTime.now,
    location: "United Kingdom",
    device: "iPad",
    tutorial_id: tutorial.id
  })
end

tutorial1 = Tutorial.new ({
    subtitle: "Bang",
  product: "Fireworks",
  title: "How to make your own fireworks safely",
  description: "Instruction on how to make homemade fireworks easily and safely.",
  public: true,
  company_id: company.id,
  materials: "2 Pairs of jeans. 2 Sport shorts. 3 Shorts.",
  file: "https://www.youtube.com/embed/6hRC6qoa1E"
})
tutorial1.save!
104.times do
  View.create!({
    start_time: DateTime.now,
    end_time: DateTime.now,
    location: "United Kingdom",
    device: "iPad",
    tutorial_id: tutorial1.id
  })
end

tutorial2 = Tutorial.new ({
  subtitle: "Dude!",
  product: "Surf",
  title: "How to surf like a pro",
  description: "Instruction on how to surf any wave that comes your way.",
  public: true,
  company_id: company.id,
  materials: "2 Pairs of jeans. 2 Sport shorts. 3 Shorts.",
  file: "https://www.youtube.com/embed/dBmHlpliXfk"
})
tutorial2.save!
76.times do
  View.create!({
    start_time: DateTime.now,
    end_time: DateTime.now,
    location: "United Kingdom",
    device: "iPad",
    tutorial_id: tutorial2.id
  })
end

tutorial3 = Tutorial.new ({
  subtitle: "Quack",
  product: "Ducks",
  title: "How to count ducks",
  description: "Instructions how to count ducks simply with out losing count.",
  public: true,
  company_id: company.id,
  materials: "2 Pairs of jeans. 2 Sport shorts. 3 Shorts.",
  file: "https://www.youtube.com/embed/0iJOP-BUnO4"
})
tutorial3.save!
38.times do
  View.create!({
    start_time: DateTime.now,
    end_time: DateTime.now,
    location: "United Kingdom",
    device: "iPhone",
    tutorial_id: tutorial3.id
  })
end

i = 0
a = 0
5.times do
  a += 1
  step = Step.new({
      tutorial: tutorial,
      start_time: i,
      description: "this is some random step text so you know what to do in this step of the tutorial you are currently watching and learning some cool stuff to build after you watched and read this step, and before you notice the next step is already there",
      headline: "Step #{a}"
  })
  step.save!
  i += 10
end

user = User.new ({
  username: "MR. T",
  first_name: "Testo",
  last_name: "steron",
  email: "lol@lol.com",
  password: "yournamehere",
  password_confirmation: "yournamehere",
  status: "manager",
  company_id: company.id,
  admin: true
})
user.save!

user2 = User.new ({
  username: "madmike",
  first_name: "Mike",
  last_name: "Maddington",
  email: "mm@lol.com",
  password: "yournamehere",
  password_confirmation: "yournamehere",
  status: "staff",
  company_id: company.id,
  admin: true
})
user2.save!

user3 = User.new ({
  username: "peggyweggy",
  first_name: "Peg",
  last_name: "Weg",
  email: "pw@lol.com",
  password: "yournamehere",
  password_confirmation: "yournamehere",
  status: "staff",
  company_id: company.id,
  admin: true
})
user3.save!

user4 = User.new ({
  username: "dingdong",
  first_name: "Ding",
  last_name: "Dong",
  email: "bell@lol.com",
  password: "yournamehere",
  password_confirmation: "yournamehere",
  status: "staff",
  company_id: company.id,
  admin: true
})
user4.save!

question = Question.create ({
  content: "Do you love birds? I do!",
  step_id: 1,
})

question2 = Question.create ({
  content: "At what depth are the tastiest fish? ",
  step_id: 2,
})
