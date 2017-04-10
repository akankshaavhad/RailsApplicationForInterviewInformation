class UserInterview < ApplicationRecord
  belongs_to :user
    validates :interviewdate, presence: true
    validates :companyname, presence: true

  
  after_create :reminder
  @@REMINDER_TIME = 5.minutes # minutes before appointment

  # Notify our appointment attendee X minutes before the appointment time
    def reminder
    ENV['TWILIO_NUMBER'] = '+19803656325'
    ENV['TWILIO_ACCOUNT_SID']= 'AC42b26049da2a7e3556c17a940b75d163'
    ENV['TWILIO_AUTH_TOKEN'] = 'e099f1d5f14b1ddcfcf9376bafb5e3c5'
     
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    
    #time_str = ((self.interviewdate).localtime).strftime("%I:%M%p on %b. %d, %Y")
    reminder = "Hi. Just FUCK OFF"
    
    message = @client.account.messages.create(
      :from => @twilio_number,
      :to => '+17043450672',
      :body => reminder,
    )
    puts message.to
    end
    
  def when_to_run
    interviewdate - @@REMINDER_TIME
  end

  handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }
end
