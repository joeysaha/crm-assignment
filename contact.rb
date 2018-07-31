class Contact
  @@contact_list = []
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contact_list = new_contact
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contact_list
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    found_contact = false
    @@contact_list.each do |info|
      if info.downcase == id.downcase
        puts "#{info}"
        found_contact = true
      end
    end
    if found_contact == false
      puts "Could not find your contact."
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(update_contact)
    found_contact = false
    @@contact_list.each do |info|
      if info == update_contact
        found_contact = true
        puts "Would you like to change the \'first name\', \'last name\', \'email\', or \'note\'?
        Please type it in below as one of the four choices.  Please mind your spelling."
        answer = gets.chomp.downcase.to_s
        if answer == "first name"
          puts "What would you like to change the first name to?"
          @first_name = gets.chomp.to_s
        elsif answer == "last name"
          puts "What would you like to change the last name to?"
          @last_name = gets.chomp.to_s
        elsif answer == "email"
          puts "What would you like to change the email to?"
          @email = gets.chomp.to_s
        elsif answer == "note"
          puts "What would you like to change the note to?"
          @note = gets.chomp.to_s
        else
          puts "Your answer is invalid. Start over"
          break
        end
      end
      if found_contact == false
        puts "Your contact doesn't exist in your list."
      end
    end          
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by

  end

  # This method should delete all of the contacts
  def self.delete_all

  end

  def full_name

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete

  end

  # Feel free to add other methods here, if you need them.

end

contact = Contact.new('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
