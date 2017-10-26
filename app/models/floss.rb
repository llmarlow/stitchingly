class Floss < ApplicationRecord
  has_many :user_flosses
  has_many :users, through: :user_flosses

  def self.get_flosses(params)
    @brand = params["brand"].to_s
    @type = params["type"].to_s
    @sort = params["sort"].to_s
    if @brand == "" and @type == "" then 
      @brand = "DMC" 
      @type = "Stranded Cotton"
    end
    if @sort != "colour" then
       @sort = "flossnumber"
    end
    if @brand != "" and @type != "" then
      @flosses = Floss.where(:brand => @brand, :floss_type => @type).order(@sort)
    elsif @brand != "" and @type == "" then
      @flosses = Floss.where(:brand => @brand).order(@sort)
    elsif @brand == "" and @type != "" then
      @flosses = Floss.where(:floss_type => @type).order(@sort)
    end
    return @flosses
  end

  def self.by_brand_and_type(brand = nil, type = nil)
    return where(brand: brand, floss_type: type) if brand && type
    return where(brand: brand) if brand
    return where(floss_type: type) if type
    all
  end


  def user_floss
    self.user_flosses.where(floss: self).first
  end

  def user_floss_quantity
    self.user_floss.floss_quantity
  end
end