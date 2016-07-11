class RequestType < ActiveRecord::Base
  validates :verb, presence: true, uniqueness: true

  has_many :payload_requests

  def self.frequent_request_types
    group(:verb).order('count_all DESC').count
  end

  def self.verb_list
    pluck(:verb)
  end
end
