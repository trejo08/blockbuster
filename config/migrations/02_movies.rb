Sequel.migration do
  up do
    create_table(:movies) do
      primary_key :id
      String :name, null: false
      String :description
      String :image_url
    end
  end

  down do
    drop_table(:artists)
  end
end