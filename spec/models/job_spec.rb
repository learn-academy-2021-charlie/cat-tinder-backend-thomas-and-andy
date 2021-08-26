require 'rails_helper'

RSpec.describe Job, type: :model do
  it "should validate job_title" do
    job =  Job.create(job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
    job_salary: '51k - $131k',
    might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU')
    expect(job.errors[:job_title]).to_not be_empty
  end
  it "should validate job_description" do
    job =  Job.create(job_title:'Back-End Developer',
    job_salary: '51k - $131k',
    might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU')
    expect(job.errors[:job_description]).to_not be_empty
  end
  it "should validate job_salary" do
    job =  Job.create(job_title:'Back-End Developer',
    job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
    might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU')
    expect(job.errors[:job_salary]).to_not be_empty
  end
  it "should validate might_enjoy" do
    job =  Job.create(job_title:'Back-End Developer',
    job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
    job_salary: '51k - $131k',
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU')
    expect(job.errors[:might_enjoy]).to_not be_empty
  end
  it "should validate img" do
    job =  Job.create(job_title:'Back-End Developer',
    job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
    job_salary: '51k - $131k',
    might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills')
    expect(job.errors[:img]).to_not be_empty
  end

  it "should validate job_description length to be >= 10 characters" do
    job =  Job.create(job_title:'Back-End Developer',
    job_description: 'Back',
    job_salary: '51k - $131k',
    might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills', img:"jbsf")
    expect(job.errors[:job_description]).to_not be_empty
  end
end