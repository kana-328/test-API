require 'csv'
require 'zip'

DLURL           = "http://www.post.japanpost.jp/zipcode/dl/kogaki/zip/ken_all.zip"
SAVEDIR         = "db/"
CSVROW_PREFNAME = 6
CSVROW_CITYNAME = 7

savePath = ""

# 住所CSVダウンロード、解答し保存
open(URI.escape(DLURL)) do |file|
  ::Zip::File.open_buffer(file.read) do |zf|
    zf.each do |entry|
      savePath = SAVEDIR + entry.name
      zf.extract(entry, savePath) { true }
    end
  end
end

# 住所CSVを読み込みDBに保存
CSV.foreach(savePath, encoding: "Shift_JIS:UTF-8") do |row|
  prefName = row[CSVROW_PREFNAME]
  cityName = row[CSVROW_CITYNAME]
  prefecture = Prefecture.find_or_create_by(:name => prefName)
  City.find_or_create_by(:name => cityName, prefecture_id: prefecture.id)
end
User.create!(name: 'example', email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?