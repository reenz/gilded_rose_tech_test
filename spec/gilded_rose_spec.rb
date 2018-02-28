require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    describe "Normal items" do
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
      it "value increases by 1 if sellIn is > 10" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 15,8)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 9
      end

      it "value increases by 2 if sellIn is <= 10" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10,8)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 10
      end

      it "value increases by 3 if sellIn is <= 5" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5,20)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 23
      end

      it "value becomes 0 if sellIn is 0" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0,15)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 0
      end
    end

    describe "Aged Brie" do
      it "quality increases the older it gets" do
        items = [Item.new("Aged Brie",10,10),Item.new("Aged Brie",10,11)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 11
        expect(items[1].quality).to eq 12
      end
    end

    describe "Sulfuras, Hand of Ragnaros" do
      it "quality is 80 and it never alters" do
        items = [Item.new("Sulfuras, Hand of Ragnaros",1,80), Item.new("Sulfuras, Hand of Ragnaros",0,80)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 80
        expect(items[1].quality).to eq 80
      end
    end
  end
end
