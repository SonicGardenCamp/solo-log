module ShopsHelper
  def genre(key)
    case key
    when "japanese_food"
      "和食"
    when "western_food"
      "洋食"
    when "chinese_food"
      "中華"
    when "italian_food"
      "イタリアン"
    when "pub"
      "居酒屋"
    when "bar"
      "バー"
    end
  end
end
