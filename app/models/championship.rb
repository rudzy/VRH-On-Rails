class Championship < ActiveRecord::Base
  has_many :seasons

  validates :name, presence: true, uniqueness: true

  def current_season
    self.seasons.order(:created_at).last
  end

  def self.n2
    @nat2 ||= Championship.find_by(name: "National 2")
  end

  def self.n4
    @nat4 ||= Championship.find_by(name: "National 4")
  end

  def self.jeunesse
    @jeunesse ||= Championship.find_by(name: "Jeunesse")
  end

end
