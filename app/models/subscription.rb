class Subscription < ActiveRecord::Base
# Returns the `Reader` instance for this subscription
    belongs_to :reader
# Returns the `Magazine` instance for this subscription
    belongs_to :magazine

### Aggregate and Association
   
    def print_details
        puts "#{self.reader.name} subscribed to #{self.magazine.title} for $#{self.price}"

    end




end