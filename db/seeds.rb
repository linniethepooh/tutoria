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
  subtitle: "Hello",
  product: "Homemade Soda Machine",
  title: "How to Make Soda Fountain Machine",
  description: "Instruction on how to make a soda machine with three different drinks at home",
  public: true,
  company: company,
  file: "//vjs.zencdn.net/v/oceans.mp4"
})
tutorial.save


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
    headline: "hi iam a headline",
    content: "gr8 b8 m8. i rel8 str8 appreci8 nd congratul8. i r8 dis b8 an 8/8. plz no h8, i'm str8 ir8. cr8 more cant w8. we shood convers8 i wont ber8, my number is 8888888 ask for N8. no calls l8 or out of st8. if on a d8, ask K8 to loc8. even with a full pl8 i always hav time to communic8 so dont hesit8. dont forget to medit8 and particip8 and masturb8 to allevi8 ur ability to tabul8 the f8. we should meet up m8 and convers8 on how we can cre8 more gr8 b8, im sure everyone would appreci8 no h8.",
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
