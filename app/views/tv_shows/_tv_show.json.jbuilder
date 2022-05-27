json.extract! tv_show, :id, :name, :summary, :release_date, :rating, :created_at, :updated_at
json.url tv_show_url(tv_show, format: :json)
