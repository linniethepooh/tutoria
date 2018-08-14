company = Company.new ({
  name: "ikea",
  main_logo: "https://www.freepnglogos.com/uploads/abc-png-logo/news-abc-png-logo-3.png",
  address: "Pall Mall",
  city: "London",
  zipcode: "SW98BZ",
  country: "United Kingdom"
})
company.save

tutorial = Tutorial.new ({
  subtitle: "Climb",
  product: "Hydraulic Powered Robotic",
  title: "How to Make Hydraulic Powered Robotic Arm from Cardboard",
  description: "In this video I show you how to make robotic arm from cardboard, it's quite fun to plaw with.",
  public: true,
  company: company,
  file: "https://www.youtube.com/embed/P2r9U4wkjcc"
})
tutorial.save

tutorial1 = Tutorial.new ({
    subtitle: "Bang",
  product: "Fireworks",
  title: "How to make your own fireworks safely",
  description: "Instruction on how to make homemade fireworks easily and safely.",
  public: true,
  company: company,
})
tutorial1.save

tutorial2 = Tutorial.new ({
  subtitle: "Dude!",
  product: "Surf",
  title: "How to surf like a pro",
  description: "Instruction on how to surf any wave that comes your way.",
  public: true,
  company: company,
})
tutorial2.save

tutorial3 = Tutorial.new ({
  subtitle: "Quack",
  product: "Ducks",
  title: "How to count ducks",
  description: "Instructions how to count ducks simply with out losing count.",
  public: true,
  company: company,
})
tutorial3.save

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
  step.save
  i += 10
end

user = User.new ({
  username: "MR. T",
  first_name: "Testo",
  last_name: "steron",
  email: "lol@lol.com",
  password: "yournamehere",
  password_confirmation: "yournamehere",
  company: company,
  admin: true
})
user.save
