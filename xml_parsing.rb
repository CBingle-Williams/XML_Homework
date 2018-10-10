require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
  end

  def xpath_get_prices
    @menu.xpath("//price")
  end

  def get_item
    @menu.xpath("//food")
  end
  
  # Place your methods here

end