module ConfessionsHelper

def display_likes(confession)
    votes = confession.votes_for.up.by_type(Amitian)
    return list_likers(votes) 
  end

def display_dislikes(confession)
    votes = confession.votes_for.down.by_type(Amitian)
    return list_dislikers(votes) 
    count_dislikers(votes)
  end


  private

  def list_likers(votes)
    amitian_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        amitian_names.push(link_to voter.fullname,
                                voter,
                                class: 'amitian-name')
      end
      if votes.size <= 6
      amitian_names.to_sentence.html_safe + like_plural(votes)
  	elsif votes.size > 6
  		count = link_to (votes.count-3).to_s+' others like this' , '' , remote: true
  	  amitian_names.take(3).to_sentence.html_safe + ' with ' + count
  	end
    end
  end

  def list_dislikers(votes)
    amitian_names = []
    unless votes.blank?
      votes.voters.each do |voter|
        amitian_names.push(voter.fullname)
      end
     if votes.size <= 9
      amitian_names.to_sentence.html_safe+ dislike_plural(votes)
  else
  		amitian_names.take(2).to_sentence.html_safe + ' with ' + (votes.count-2).to_s+' others dislikes this'
    end
    end
  end

  def like_plural(votes)
    return ' like this' if votes.count > 1
    ' likes this'
  end
  def dislike_plural(votes)
    return ' dislike this' if votes.count > 1
    ' dislikes this'
  end

end
