class CreateTasks < ActiveRecord::Migration
  def change
    # Completa con las columnas que necesites
    create_table :tasks do |t|
      #ALEXIS no uses signo "="
      #no funcionará
                    #t.string = :name
      t.string :name
      #ALEXIS no se escribe bolean, lleva doble oo
      t.boolean :status
      t.timestamps
    end
  end
end
