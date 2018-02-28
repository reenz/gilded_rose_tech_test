require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "reduces the quality by 1 for normal item" do
      items = [Item.new("Item", 5, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 4
    end

    it "reduces the sellIn by 1 for normal item" do
      items = [Item.new("Item", 5, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 4
    end
  end

end
