# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# NOTE: seed投入対象のテーブルのデータを削除する
Birthday::Character.delete_all
Birthday::Brand.delete_all

Birthday::Brand.create!(
  [
    {
      name: "学マス",
      name_kana: "ガクマス",
      formal_name: "学園アイドルマスター",
      formal_name_kana: "ガクエンアイドルマスター",
      color: "#f39800",
      born_on: Date.new(2024, 5, 16)
    },
    {
      name: "アイマス",
      name_kana: "アイマス",
      formal_name: "THE IDOLM@STER",
      formal_name_kana: "アイドルマスター",
      color: "#ff74b8",
      born_on: Date.new(2005, 7, 26)
    },
    {
      name: "シャニマス",
      name_kana: "シャニマス",
      formal_name: "THE IDOLM@STER SHINY COLORS",
      formal_name_kana: "アイドルマスター シャイニーカラーズ",
      color: "#8dbbff",
      born_on: Date.new(2018, 4, 24)
    }
  ]
)

gakuen = Birthday::Brand.find_by(name: "学マス")

Birthday::Character.create!(
  [
    {
      last_name: "花海",
      last_name_kana: "ハナミ",
      first_name: "咲季",
      first_name_kana: "サキ",
      color: "#e30f25",
      born_on: Date.new(2008, 4, 2),
      brand: gakuen
    },
    {
      last_name: "月村",
      last_name_kana: "ツキムラ",
      first_name: "手毬",
      first_name_kana: "テマリ",
      color: "#0c7bbb",
      born_on: Date.new(2008, 6, 3),
      brand: gakuen
    },
    {
      last_name: "藤田",
      last_name_kana: "フジタ",
      first_name: "ことね",
      first_name_kana: "コトネ",
      color: "#f8c112",
      born_on: Date.new(2008, 4, 29),
      brand: gakuen
    },
    {
      last_name: "雨夜",
      last_name_kana: "アマヤ",
      first_name: "燕",
      first_name_kana: "ツバメ",
      color: "#7b68ee",
      born_on: Date.new(2006, 5, 20),
      brand: gakuen
    },
    {
      last_name: "有村",
      last_name_kana: "アリムラ",
      first_name: "麻央",
      first_name_kana: "マオ",
      color: "#7f1184",
      born_on: Date.new(2007, 1, 18),
      brand: gakuen
    },
    {
      last_name: "葛城",
      last_name_kana: "カツラギ",
      first_name: "リーリヤ",
      first_name_kana: "リーリヤ",
      color: "#eafdff",
      born_on: Date.new(2008, 7, 24),
      brand: gakuen
    },
    {
      last_name: "倉本",
      last_name_kana: "クラモト",
      first_name: "千奈",
      first_name_kana: "チナ",
      color: "#f68b1f",
      born_on: Date.new(2008, 8, 1),
      brand: gakuen
    },
    {
      last_name: "紫雲",
      last_name_kana: "シウン",
      first_name: "清夏",
      first_name_kana: "スミカ",
      color: "#7cfc00",
      born_on: Date.new(2008, 11, 11),
      brand: gakuen
    },
    {
      last_name: "篠澤",
      last_name_kana: "シノサワ",
      first_name: "広",
      first_name_kana: "ヒロ",
      color: "#00afcc",
      born_on: Date.new(2009, 12, 21),
      brand: gakuen
    },
    {
      last_name: "十王",
      last_name_kana: "ジュオウ",
      first_name: "星南",
      first_name_kana: "セナ",
      color: "#f6ae54",
      born_on: Date.new(2006, 12, 7),
      brand: gakuen
    },
    {
      last_name: "秦谷",
      last_name_kana: "ハタヤ",
      first_name: "美鈴",
      first_name_kana: "ミスズ",
      color: "#7a99cf",
      born_on: Date.new(2009, 2, 6),
      brand: gakuen
    },
    {
      last_name: "花海",
      last_name_kana: "ハナミ",
      first_name: "佑芽",
      first_name_kana: "ウメ",
      color: "#ea533a",
      born_on: Date.new(2009, 4, 1),
      brand: gakuen
    },
    {
      last_name: "姫崎",
      last_name_kana: "ヒメサキ",
      first_name: "莉波",
      first_name_kana: "リナミ",
      color: "#f6adc6",
      born_on: Date.new(2007, 3, 5),
      brand: gakuen
    }
  ]
)
