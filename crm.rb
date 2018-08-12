require_relatative 'contact'

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
    when 6 then delete_all_entries
    when 7 then exit
    end
  end

  def add_new_contact
    puts "Enter first name:"
    first_name = gets.chomp.to_s

    puts "Enter last name:"
    last_name = gets.chomp.to_s

    puts "Enter email address:"
    email = gets.chomp.to_s

    puts "Enter a note:"
    note = gets.chomp.to_s

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print "Enter the first name of your contact:"
    name = gets.chomp.to_s.downcase

    puts contact = Contact.find_by(1, name)
    options_menu
    puts "Select the option to change:"
    option = gets.chomp.to_i

    if option >= 1 && option <= 5
      if option < 5
        puts "Enter updated info:"
        updated_info = gets.chomp.to_s.downcase
        contact.update(option, updated_info)
        puts contact
      else
        return
      end
    else
      puts "Invalid Input."
      return
    end
  end

  def delete_contact
    puts "Enter the last name of the person you'd like to remove:"
    lastname = gets.chomp.to_s.downcase
    contact = Contact.find_by(2,lastname)
    contact.delete
    puts "\nThe entry was removed.\n"
  end

  def display_all_contacts
    Contact.all
  end

  def delete_all_entries
    Contact.delete_all
  end

  def search_by_attribute
    puts "Options Menu"
    options_menu
    puts "What would you like to search by?"
    answer = gets.chomp.to_i
    if answer >= 1 && answer <= 5
      if answer < 4
        puts "What would you specifically like to search for?"
        search = gets.chomp.to_s.downcase
        contact = Contact.find_by(answer, search)
        puts contact
      elsif answer == 4
        puts "Can't search by notes."
        return
      end
    else
      puts "Invalid Input."
      return
    end
  end

  def options_menu
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] Email Address'
    puts '[4] Notes'
    puts '[5] Return'
  end
end
