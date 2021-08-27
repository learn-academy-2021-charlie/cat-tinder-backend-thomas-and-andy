require 'rails_helper'

RSpec.describe "Devs", type: :request do
  describe "GET /index" do
    it 'gets a list of devs' do
      # create a job
      Dev.create( 
        name: 'Jordan',
        age: 21,
        technologies: 'JS, HTML, CSS, React',
        skills:'designing, art, teamwork',
        enjoys: 'being creative, designing user experiences',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'
      )
      # make a request
      get '/devs'
      dev = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(dev.length).to eq 1
  end
end


describe "POST /create" do
  it 'creates a dev' do
    dev_params = {
      dev:   {
        name: 'Jordan',
        age: 21,
        technologies: 'JS, HTML, CSS, React',
        skills: 'designing, art, teamwork',
        enjoys: 'being creative, designing user experiences',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'
      }
    }
    # make a request
    post '/devs', params: dev_params
    new_dev = Dev.first
    expect(response).to have_http_status(200)
    expect(new_dev.name).to eq 'Jordan'
    expect(new_dev.age).to eq 21
    expect(new_dev.technologies).to eq 'JS, HTML, CSS, React'
    expect(new_dev.skills).to eq 'designing, art, teamwork'
    expect(new_dev.enjoys).to eq 'being creative, designing user experiences'
    expect(new_dev.img).to eq 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'

  end
end

describe "PATCH /update" do
  it 'updates a dev' do
    # create the dev
    dev_params = {
      dev:   {
        name: 'Jordan',
        age: 21,
        technologies: 'JS, HTML, CSS, React',
        skills: 'designing, art, teamwork',
        enjoys: 'being creative, designing user experiences',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'
      }
    }
    post '/devs', params: dev_params
    dev = Dev.first
    # update the job
    updated_dev_params = {
      dev:   {
        name: 'Joe',
        age: 21,
        technologies: 'JS, HTML, CSS, React',
        skills: 'designing, art, teamwork',
        enjoys: 'being creative, designing user experiences',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'
      }
    }
    patch "/devs/#{dev.id}", params: updated_dev_params
    updated_dev = Dev.find(dev.id)
    expect(response).to have_http_status(200)
    expect(updated_dev.name).to eq 'Joe'
  end
end


describe "DELETE /destroy" do
  it 'destroys a dev' do
    # create the dev
    Dev.create(
      name: 'Jordan',
      age: 21,
      technologies: 'JS, HTML, CSS, React',
      skills: 'designing, art, teamwork',
      enjoys: 'being creative, designing user experiences',
      img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'
    )
    # make a request
    dev = Dev.first
    delete "/devs/#{dev.id}"
    expect(response).to have_http_status(200)
    expect(Dev.all.length).to eq 0

  end
end
it "doesn't create a dev without a name" do
  dev_params = {
    dev:   {
    
      age: 21,
      technologies: 'JS, HTML, CSS, React',
      skills: 'designing, art, teamwork',
      enjoys: 'being creative, designing user experiences',
      img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'
    }
  }
  # Send the request to the  server
  post '/devs', params: dev_params
  # expect an error if the job_params does not have a job_title
  expect(response.status).to eq 422
  # Convert the JSON response into a Ruby Hash
  json = JSON.parse(response.body)
  # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
  expect(json['name']).to include "can't be blank"
  end

  it "doesn't create a job without an age" do
    dev_params = {
      dev:   {
        name: 'Jordan',
        technologies: 'JS, HTML, CSS, React',
        skills: 'designing, art, teamwork',
        enjoys: 'being creative, designing user experiences',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'
      }
    }
    # Send the request to the  server
    post '/devs', params: dev_params
    # expect an error if the job_params does not have a job_title
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['age']).to include "can't be blank"
  end

  it "doesn't create a dev without technologies" do
    dev_params = {
      dev:   {
        name: 'Jordan',
        age: 21,
        skills: 'designing, art, teamwork',
        enjoys: 'being creative, designing user experiences',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'
      }
    }
    # Send the request to the  server
    post '/devs', params: dev_params
    # expect an error if the job_params does not have a job_title
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['technologies']).to include "can't be blank"
  end

  it "doesn't create a dev without skills" do
    dev_params = {
      dev:   {
        name: 'Jordan',
        age: 21,
        technologies: 'JS, HTML, CSS, React',
        enjoys: 'being creative, designing user experiences',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'
      }
    }
    # Send the request to the  server
    post '/devs', params: dev_params
    # expect an error if the job_params does not have a job_title
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['skills']).to include "can't be blank"
  end

  it "doesn't create a dev without an enjoys" do
    dev_params = {
      dev:   {
        name: 'Jordan',
        age: 21,
        technologies: 'JS, HTML, CSS, React',
        skills: 'designing, art, teamwork',
        img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVklogCsMdyvFJbNylZ4k3i3LoJMoqFHVV1A&usqp=CAU'
      }
    }
    # Send the request to the  server
    post '/devs', params: dev_params
    # expect an error if the job_params does not have a job_title
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['enjoys']).to include "can't be blank"
  end

  it "doesn't create a dev without an image" do
    dev_params = {
      dev:   {
        name: 'Jordan',
        age: 21,
        technologies: 'JS, HTML, CSS, React',
        skills: 'designing, art, teamwork',
      }
    }
    # Send the request to the  server
    post '/devs', params: dev_params
    # expect an error if the job_params does not have a job_title
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['img']).to include "can't be blank"
  end
end
