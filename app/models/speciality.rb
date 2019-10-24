class Speciality < ApplicationRecord
    has_many :doc_spec
    has_many :doctors, through: :doc_spec
end