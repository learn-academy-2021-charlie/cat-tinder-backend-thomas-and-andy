require 'rails_helper'

RSpec.describe "Jobs", type: :request do
  describe "GET /index" do
    it 'gets a list of jobs' do
      # create a job
      Job.create(job_title:'Back-End Developer',
      job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
      job_salary: '51k - $131k',
      might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
      img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU')
      # make a request
      get '/jobs'
      job = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(job.length).to eq 1
  end
end


describe "POST /create" do
  it 'creates a job' do
    job_params = {
      job: {
        job_title:'Back-End Developer',
        job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
        job_salary: '51k - $131k',
        might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU'
      }
    }
    # make a request
    post '/jobs', params: job_params
    new_job = Job.first
    expect(response).to have_http_status(200)
    expect(new_job.job_title).to eq 'Back-End Developer'
    expect(new_job.job_description).to eq 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.'
    expect(new_job.job_salary).to eq '51k - $131k'
    expect(new_job.might_enjoy).to eq ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills'
    expect(new_job.img).to eq 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU'

  end
end

describe "PATCH /update" do
  it 'updates a job' do
    # create the job
    job_params = {
      job: {
        job_title:'Back-End Developer',
        job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
        job_salary: '51k - $131k',
        might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU'
      }
    }
    post '/jobs', params: job_params
    job = Job.first
    # update the job
    updated_job_params = {
      job: {
        job_title:'Back-End Developer',
        job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
        job_salary: '70k - $131k',
        might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU'
      }
    }
    patch "/jobs/#{job.id}", params: updated_job_params
    updated_job = Job.find(job.id)
    expect(response).to have_http_status(200)
    expect(updated_job.job_salary).to eq '70k - $131k'
  end
end


describe "DELETE /destroy" do
  it 'destroys a job' do
    # create the job
    Job.create(job_title:'Both-End Developer',
    job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
    job_salary: '51k - $131k',
    might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
    img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU')
    # make a request
    job = Job.first
    delete "/jobs/#{job.id}"
    expect(response).to have_http_status(200)
    expect(Job.all.length).to eq 0

  end
end
it "doesn't create a job without a job_title" do
  job_params = {
    job: {
      
      job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
      job_salary: '51k - $131k',
      might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
      img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU'
    }
  }
  # Send the request to the  server
  post '/jobs', params: job_params
  # expect an error if the job_params does not have a job_title
  expect(response.status).to eq 422
  # Convert the JSON response into a Ruby Hash
  json = JSON.parse(response.body)
  # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
  expect(json['job_title']).to include "can't be blank"
  end

  it "doesn't create a job without a job_description" do
    job_params = {
      job: {
        job_title:'Back-End Developer',
        job_salary: '51k - $131k',
        might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU'
      }
    }
    # Send the request to the  server
    post '/jobs', params: job_params
    # expect an error if the job_params does not have a job_title
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['job_description']).to include "can't be blank"
  end

  it "doesn't create a job without a name" do
    job_params = {
      job: {
        job_title:'Back-End Developer',
        job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
        might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU'
      }
    }
    # Send the request to the  server
    post '/jobs', params: job_params
    # expect an error if the job_params does not have a job_title
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['job_salary']).to include "can't be blank"
  end

  it "doesn't create a job without a might_enjoy" do
    job_params = {
      job: {
        job_title:'Back-End Developer',
        job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
        job_salary: '51k - $131k',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRO3HY7FVQlFhJyuh0fDg_5rfm8dbsKYiHiVQ&usqp=CAU'
      }
    }
    # Send the request to the  server
    post '/jobs', params: job_params
    # expect an error if the job_params does not have a job_title
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['might_enjoy']).to include "can't be blank"
  end

  it "doesn't create a job without an img" do
    job_params = {
      job: {
        job_title:'Back-End Developer',
        job_description: 'Back-end developers create, code, and improve the server, server-side applications, and databases that, when combined with front-end codes, help create a functional, seamless experience for the end-user. They study industry trends, create or improve back-end processes and codes, and work with others to design a better program.',
        job_salary: '51k - $131k',
        might_enjoy: ' If you like working more methodically, enjoy manipulating data, and have strong organizational skills',
      }
    }
    # Send the request to the  server
    post '/jobs', params: job_params
    # expect an error if the job_params does not have a job_title
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['img']).to include "can't be blank"
  end

end