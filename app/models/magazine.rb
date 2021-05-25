

class Magazine < ActiveRecord::Base
# Returns a collection of all `Subscription` instances for this magazine
# Gives us instance method
    has_many :subscriptions
# Returns a collection of all `Reader` instances who are subscribed to this magazine
    has_many :readers, through: :subscriptions
  
### Aggregate and Association

    def email_list
        # get all readers associated with magazine
        # get all readers' emails
        emails_arr = self.readers.map do |reader_inst|
            reader_inst.email
        #format list accordingly
        end
        emails_arr.join(";")
    end

    def self.most_popular
        # get all magazines
        #compare how many subs each magazine has
        # Magazine.first.subscriptions.length
        max_mag = Magazine.all.max_by do |mag_inst|
            mag_inst.subscriptions.length
        end
    end
end