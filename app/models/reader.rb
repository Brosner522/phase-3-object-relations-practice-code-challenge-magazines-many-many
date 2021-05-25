class Reader < ActiveRecord::Base
# Returns a collection of all `Subscription` instances for this reader
    has_many :subscriptions
# Returns a collection of all `Magazine` instances that this reader is subscribed to
    has_many :magazines, through: :subscriptions
    
 ### Aggregate and Association
   
    def subscribe(magazine, price)
        Subscription.create(price: price, magazine_id: magazine.id, reader_id: self.id)
        #Subscription.create(price: price, magazine: magazine, reader: self)
    end

    def total_subscriptions_price
        self.subscriptions.sum( :price )
    end

    def cancel_subscription(magazine)
        sub = Subscription.find_by(magazine_id: magazine.id, reader_id: self.id)
        if sub 
            sub.destroy
        end
    end
end