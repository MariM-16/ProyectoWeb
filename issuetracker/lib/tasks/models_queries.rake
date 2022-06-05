namespace :db do
    task :populate_fake_data => :environment do
        # If you are curious, you may check out the file
        # RAILS_ROOT/test/factories.rb to see how fake
        # model data is created using the Faker and
        # FactoryBot gems.
        puts "Populating database"
        # 10 event venues is reasonable...
        create_list(:ticket, 10)
        # 50 customers with orders should be alright
        create_list(:user_with_tickets, 50)
        # You may try increasing the number of events:
        create_list(:executive_with_tickets, 3)
      end

    task :model_queries => :environment do
        puts("Query 0: Sample query; show the names users available")
        result = User.select(:first_name).distinct.map { |x| x.first_name }
        puts(result)
        puts("EOQ") # End Of Query -- always add this line after a query.
        puts("")

        puts("Query 1: Get all tickets created by a user.")
        result = Ticket.joins(:user).where(user_id:2).select(:id).map { |x| x.id }
        puts("Ticket ID:", result)
        puts("EOQ")
        puts("")
        
        puts("Query 2: Get all users who have tickets in ’open’ state.")
        result = User.joins(:tickets).where(tickets:{state: "open"}).select(:id).distinct.map { |x| x.id }
        puts("User ID:", result)
        puts("EOQ")
        puts("")
        
        puts("Query 3: Get all users who have all of their tickets in ’closed’ state.")  
        #User.find_by_sql("SELECT u.id FROM users u JOIN tickets t ON u.id=t.user_id GROUP BY t.state HAVING t.state!='open'")      
        result = User.all.select("user_id").group("user_id").where("state = 'close'").joins(:tickets).count.select(:id).distinct.map { |x| x.id }
        result2= User.all.select("user_id").group("user_id").where("state = 'close'").joins(:tickets).count
        puts(result)
        puts("Tickets close: ", result2)
        puts("EOQ")
        puts("")
        
        puts("Query 4: Get all tickets that have been assigned to an executive in a date range.")
        result= Ticket.find_by_sql("SELECT id FROM tickets WHERE executive_id = 5 AND creation_date BETWEEN '2022-04-01' AND '2022-05-30'").map { |x| x.id }
        puts("Ticket ID in a specific date range:", result)
        puts("EOQ")
        puts("")
        
        puts("Query 5: Get all resolutions of a ticket")  
        result= Response.where(ticket_id:1).select(:id).map {|x| x.id}
        puts("Responses ID: ",result)
        puts("EOQ")
        puts("")
        
        puts("Query 6 Get all ratings of a given executive")
        result = Performance.where("executive_id = 4").select(:evaluation).map { |x| x.evaluation }
        puts("Executive evaluation: ",result)
        puts("EOQ")
        puts("")
              
        puts("Query 7: Get the average rating of a given executive") 
        result=Performance.where('executive_id = 4').average('evaluation')
        puts("Average rating: ",result)
        puts("EOQ")
        puts("")
        
        puts("Query 8: Get all comments from a ticket, chronologically.")          
        result = Comment.where(ticket_id: 1).order(comment_date: "asc").select(:id).map { |x| x.id}
        puts("Comments in chronological order: ",result)
        puts("EOQ")
        puts("")
        
        puts("Query 9: Get all users with administrative privileges in the system.")    
        result = User.where(roll: [2,3,4]).select(:id).map { |x| x.id}
        puts("Users administrative privileges: ",result)
        puts("EOQ")
        puts("")
        
        puts("Query 10: Users should have a unique username and/or email address. Attempt to create two users with the same unique attribute and show the validation error that occur in this case.")    
        result = 'User.create(email:"maria@gmail.com", first_name:"Maria", last_name: "Marin", phone:"99999", roll_id:1)'           
        msj= 'User Exists? (0.4ms)  SELECT 1 AS one FROM "users" WHERE "users"."email" = ? LIMIT ?  [["email", "maria@gmail.com"], ["LIMIT", 1]] TRANSACTION (0.1ms)  rollback transaction'
        puts("User create: ")
        puts(result)
        puts("Validation error: ")
        puts(msj)
        puts("EOQ")
        puts("")
        
        puts("Query 11: E-mail addresses should be well-formed. Attempt to update a model with an ill-formatted email address and show the validation error that occurs.")    
        result = 'User.create(email:"jperezm@gmailcom", first_name:"Julio", last_name: "Perez", phone:"56599", roll_id:1)'
        msj='User Exists? (0.3ms)  SELECT 1 AS one FROM "users" WHERE "users"."email" = ? LIMIT ?  [["email", "jperezm@gmailcom"], ["LIMIT", 1]] TRANSACTION (0.1ms)  rollback transaction'
        puts("User create: ")
        puts(result)
        puts("Validation error: ")
        puts(msj)
        puts("EOQ")
    end
end

