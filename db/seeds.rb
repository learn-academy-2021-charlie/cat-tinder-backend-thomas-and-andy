# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 jobs = [
  {
    job_title: 'Front-End Developer',
    job_description: 'A Front End Developer, or Front End Web Developer, is responsible for using their knowledge of programming languages to code user-side applications, including visual elements like menu bars, clickable buttons and the overall layout of websites or web applications. Their duties include communicating with clients to identify their needs, optimizing websites for different formats like desktops and mobile phones and running tests to ensure code strings perform the correct functions.',
    job_salary: '$50k - $115k',
    might_enjoy: 'If you are artistic, enjoy design, and have a passion for understanding and creating user experiences.',
    img: 'data:image/jpeg;base64,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PcIiIAiIgCIiAIiIAiIgCIiAIiIAiIgCIiALEgbyyRAYXRvBLo3gs0QgxujeCXRvLJEBhdG8F7dG8skQkxujeC8ujeCzRCDC6N5egLJFJIREUAIiIArO1E++/Q/OVYqztRPvv0PzlEtiY7kPbmQloxZqPFZL1bEmYj2nXIQq1z3EYF1RgQtLa7tPRuVhdNEWGdmzIhtd2no3Kwumm13aejcrC6aImdkZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZENru09G5WF002u7T0blYXTREzsZEebXdp6NysLprutS7J2akuqOqIVzXBCu9cx1buuV7Fxp2Qz76IocmZRikz//2Q==',
  },
  {
    job_title:'Back-End Developer',
    job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
    job_salary: '51k - $131k',
    might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU',
  },
  {
    job_title: 'Full-Stack Developer',
    job_description: 'A Full Stack Developer, or Full Stack Software Engineer, is a Computer Programmer who uses coding to operate on both front- and back-end systems. Their main duties include creating user interactions on various websites and platforms, writing code optimized for mobile and developing databases and services for functionality.',
    job_salary: '54k - $115k',
    might_enjoy: 'if you want to be well rounded and have the opportunity to develop creative designs and experience some data manipulation in the backend to keep things balanced.',
    img: 'data:image/jpeg;base64,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'
  },
];

jobs.each do |attributes|
    Job.create attributes
    puts "creating job #{attributes}"




    devs = [
  {
    name: 'Tobi',
    age: 27,
    technologies: "SQL, MongoDb,AWS",
    skills: "teamwork, teaching, calculating",
    enjoys: 'working with pure data, and D&D',
    img: "data:image/jpeg;base64,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"
  },
  {
    name: 'Jordan',
    age: 21,
    technologies: "JS, HTML, CSS, React",
    skills: "designing, art, teamwork",
    enjoys: 'being creative, designing user experiences',
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU"
  },
  {
    name: 'Melissa',
    age: 24,
    technologies: "React, Rails, Postgresql",
    skills: "teamwork, networking, designing, managing databases",
    enjoys: 'frontend and backend, and exploring with my dog',
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6JXKaE1oy1Y7to20R9fpWzn11LEB-PZYqDg&usqp=CAU"
  }
]


devs.each do |attributes|
  Dev.create attributes
  puts "creating a dev #{attributes}"
end

  end