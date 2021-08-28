require 'rails_helper'

RSpec.describe Dev, type: :model do
  it "should validatedev_title" do
   dev = Dev.create(
    age: 24,
    technologies: "React, Rails, Postgresql",
    skills: "teamwork, networking, designing, managing databases",
    enjoys: 'frontend and backend, and exploring with my dog',
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6JXKaE1oy1Y7to20R9fpWzn11LEB-PZYqDg&usqp=CAU"
    )
    expect(dev.errors[:name]).to_not be_empty
  end
  it "should validatedev_description" do
   dev = Dev.create(name: 'Melissa',
    technologies: "React, Rails, Postgresql",
    skills: "teamwork, networking, designing, managing databases",
    enjoys: 'frontend and backend, and exploring with my dog',
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6JXKaE1oy1Y7to20R9fpWzn11LEB-PZYqDg&usqp=CAU"
    )
    expect(dev.errors[:age]).to_not be_empty
  end
  it "should validatedev_salary" do
   dev = Dev.create(name: 'Melissa',
    age: 24,
    skills: "teamwork, networking, designing, managing databases",
    enjoys: 'frontend and backend, and exploring with my dog',
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6JXKaE1oy1Y7to20R9fpWzn11LEB-PZYqDg&usqp=CAU"
    )
    expect(dev.errors[:technologies]).to_not be_empty
  end
  it "should validate might_enjoy" do
   dev = Dev.create(name: 'Melissa',
    age: 24,
    technologies: "React, Rails, Postgresql",
    enjoys: 'frontend and backend, and exploring with my dog',
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6JXKaE1oy1Y7to20R9fpWzn11LEB-PZYqDg&usqp=CAU"
    )
    expect(dev.errors[:skills]).to_not be_empty
  end
  it "should validate img" do
   dev = Dev.create(name: 'Melissa',
    age: 24,
    technologies: "React, Rails, Postgresql",
    skills: "teamwork, networking, designing, managing databases",
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6JXKaE1oy1Y7to20R9fpWzn11LEB-PZYqDg&usqp=CAU"
    )
    expect(dev.errors[:enjoys]).to_not be_empty
  end

  it "should validatedev_description length to be >= 10 characters" do
   dev = Dev.create(name: 'Melissa',
    age: 24,
    technologies: "React, Rails, Postgresql",
    skills: "teamwork, networking, designing, managing databases",
    enjoys: 'frontend and backend, and exploring with my dog',
    )
    expect(dev.errors[:img]).to_not be_empty
  end
end
