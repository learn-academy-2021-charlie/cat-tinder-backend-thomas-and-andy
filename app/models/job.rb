class Job < ApplicationRecord
    validates :job_title, :job_description, :job_salary, :might_enjoy, :img, presence:true

    validates :job_description, length: { minimum: 10 }
end
