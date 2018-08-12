
require_relative 'contact_copy'

class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end

  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    contact = find_contact

    if contact
      puts "What would you like to update about the contact?"
      puts '[1] First Name'
      puts '[2] Last Name'
      puts '[3] Email'
      puts '[4] Note'
      print 'Enter a number: '
      choice = gets.chomp.to_i

      print 'What would you like the new value to be: '
      new_value = gets.chomp

      case choice
      when 1 then contact.update('first_name', new_value)
      when 2 then contact.update('last_name', new_value)
      when 3 then contact.update('email', new_value)
      when 4 then contact.update('note', new_value)
      end

      puts 'Updated!'
    else
      puts "Sorry, the contact you're looking for doesn't seem to exist"
    end
  end

  def delete_contact
    contact = find_contact

    if contact
      contact.delete
      puts 'Contact deleted!'
    else
      puts "Sorry, the contact you're looking for doesn't seem to exist"
    end
  end

  def display_all_contacts
    p Contact.all
  end

  def search_by_attribute
    puts 'What attribute would you like to search by?'
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] Email'
    puts '[4] Note'
    print 'Enter a number: '
    choice = gets.chomp.to_i

    puts "What's the value you're searching for? (ie. Barbara):"
    value = gets.chomp

    case choice
    when 1 then contact = Contact.find_by('first_name', value)
    when 2 then contact = Contact.find_by('last_name', value)
    when 3 then contact = Contact.find_by('email', value)
    when 4 then contact = Contact.find_by('note', value)
    end

    if contact
      p contact
    else
      puts "Sorry, the contact you're looking for doesn't seem to exist"
    end
  end

  def find_contact
    puts 'First we need to find the contact'
    print "Enter the ID of the contact: "
    id = gets.chomp.to_i
    contact = Contact.find(id)
  end

end

crm = CRM.new('CRM 1')
crm.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
