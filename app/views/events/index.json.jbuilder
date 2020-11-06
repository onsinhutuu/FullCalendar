json.array!(@events) do |event|
  json.extract! event, :id, :title, :body
  json.start event.start_date
  json.end event.end_date
  json.url event_url(event, format: :html)
end
# こうすることで、{"id":"1", "title":"タイトル", "description":"説明", "start":"日付1", "end":"日付2"
# , "url":"some_address"}のようにjsonファイルが作られ、カレンダーが読み込めるデータになります。
# url項目があることで、カレンダーの予定にurlが埋め込まれ、クリックすると予定の詳細に飛ぶことができます。

