require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    describe "normal items" do
      it "reduces the quality by 1 " do
        items = [Item.new("Item", 5, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 4
      end

      it "decrease the quality by 2 if sellIn is < 0" do
        items = [Item.new("Item", 0, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 3
      end

      it "reduces the sellIn by 1" do
        items = [Item.new("Item", 5, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
      end
    end

    describe "Backstage passes" do
      it "value increases by 2 times if sellIn is <= 10" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10,8)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 10
      end
    end
  end
end
