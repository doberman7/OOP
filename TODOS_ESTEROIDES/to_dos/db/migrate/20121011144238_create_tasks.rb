class CreateTasks < ActiveRecord::Migration  

  def change
    # Completa con las columnas que necesites
    create_table :tasks do |t|
      t.string :name
      #documentacion para determinar el valor por defaul del status en:
      #http://api.rubyonrails.org/classes/ActiveRecord/Migration.html
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
