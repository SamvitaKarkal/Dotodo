task :populate_with_sample_data do
    puts 'Seeding with sample data...'
    user_details = { name: 'John',
                     email: 'John@example.com',
                     password: 'qwerty',
                     password_confirmation: 'qwerty' }
    User.create! user_details
    puts 'Done! Now you can login with "John@example.com" using password "qwerty"'
end