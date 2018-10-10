require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @xml_menu = GuiseppesMenu.new
  end

  it "no price should be more than £10" do
    @xml_menu.xpath_get_prices.each do |price|
      expect(price.text.to_i).to be < (10)
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    @xml_menu.get_item.each do |item|
      if item.xpath("/name").text != 'Full Breakfast'
        expect(item.xpath("/calories").text.to_i).to be < (1000)
      end
    end
  end

  it "should have all waffle dishes stating you get two waffles" do
    @xml_menu.get_item.each do |item|
      if item.xpath("/name").text.include? "Waffles"
        expect(item.xpath("/description").text.include? "Two").to eq(true)
      end
    end
  end

end
