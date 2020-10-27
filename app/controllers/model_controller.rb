# def create_room_table(code)
#     table_name = "room" + code.to_s + "s"
#     table_sym = table_name.to_sym
  
#    unless  ActiveRecord::Base.connection.table_exists? table_sym
#      ActiveRecord::Base.connection.create_table table_sym do |t|
#        t.integer :created_by
#        t.string :text
#      end
#      orm(table_name)
#    end
#   end
