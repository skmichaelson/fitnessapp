module FriendshipsHelper
  def new_friend_message_body(friend)
    message = <<-MESSAGE_BODY
    Greetings! \n\n
    
    We just wanted to let you know that #{friend.username} has accepted
    your friend request. You should check out their profile or send them a message! \n\n
    
    Find more friends on this site by visiting the user index page. 
    Remember, you're more likely to achieve your goals if you stay accountable to each other! \n\n
      
    Best of luck, \n\n
    
    The AppleCinnamon Team
    MESSAGE_BODY
    
    return message.html_safe
  end
  
  def new_friend_subject_line
    "You have a new friend!"
  end
end
