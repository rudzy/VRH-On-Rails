class Player < ActiveRecord::Base
  include Decorable

  belongs_to :team, required: true

  has_many :goals, inverse_of: :scorer
  has_many :assists, class_name: "Goal", inverse_of: :passer

  has_attached_file :photo, styles: { medium: "400x400>", thumb: "200x200#" }, default_url: "/img/missing_player_:style.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  enum position: {attaquant: 0, defenseur: 1, goalie: 2}


  def position=(pos)
    super(Player.positions[pos])
  end

end
