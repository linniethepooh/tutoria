company = Company.new ({
  name: "ABC Ltd",
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
  file: "https://www.youtube.com/embed/6hRC6qoa1E"
})
tutorial1.save

tutorial2 = Tutorial.new ({
  subtitle: "Dude!",
  product: "Surf",
  title: "How to surf like a pro",
  description: "Instruction on how to surf any wave that comes your way.",
  public: true,
  company: company,
  file: "https://www.youtube.com/embed/dBmHlpliXfk"
})
tutorial2.save

tutorial3 = Tutorial.new ({
  subtitle: "Quack",
  product: "Ducks",
  title: "How to count ducks",
  description: "Instructions how to count ducks simply with out losing count.",
  public: true,
  company: company,
  file: "https://www.youtube.com/embed/0iJOP-BUnO4"
})
tutorial3.save

i = 0
5.times do
  i += 10
  step = Step.new({
      tutorial: tutorial,
      start_time: i,
      description: "this is some random step text so you know what to do in this step of the tutorial you are currently watching and learning some cool stuff to build after you watched and read this step, and before you notice the next step is already there",
      headline: "Iam a step headline"
  })
  step.save
  question = Question.new({
    content: "gr8 b8 m8. i rel8 str8 appreci8 nd congratul8. i r8 dis b8 an 8/8.?#{rand(0..100)}",
    step: step
  })
  question.save
  answer = Answer.new({
    content: " stretch posts longer than the nile's str8s. well be the captains of b8 4chan our first m8s the growth r8 will spread to reddit and like reel est8 and be a flow r8 of gr8 b8 like a blind d8 well coll8 meet me upst8 where we can convers8 or ice sk8 or lose w8 infl8 our hot air baloons and fly tail g8. we cood land in kuw8, eat a soup pl8 followed by a dessert pl8 the payment r8 wont be too ir8 and hopefully our currency wont defl8.",
    question: question
  })
  answer.save
  # 2 Questions and answer per step
  question = Question.new({
    content: "im sure everyone would appreci8 no h8? #{rand(0..100)}",
    step: step
  })
  question.save
  answer = Answer.new({
    content: " stretch posts longer than the nile's str8s. well be the captains of b8 4chan our first m8s the growth r8 will spread to reddit and like reel est8 and be a flow r8 of gr8 b8 like a blind d8 well coll8 meet me upst8 where we can convers8 or ice sk8 or lose w8 infl8 our hot air baloons and fly tail g8. we cood land in kuw8, eat a soup pl8 followed by a dessert pl8 the payment r8 wont be too ir8 and hopefully our currency wont defl8.",
    question: question
  })
  answer.save
end

user = User.new ({
  username: "MR. T",
  first_name: "Testo",
  last_name: "steron",
  email: "lol@lol.com",
  password: "yournamehere",
  password_confirmation: "yournamehere",
  company: company
})
user.save
