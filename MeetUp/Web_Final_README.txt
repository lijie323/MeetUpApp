Final project: template 1

Group Members 1: Song Gao  CNet ID: gaosong1989
Group Members 2: Jie Li  CNet ID: lijie323

Instruction:

*Before run this program: bundle install to install gems rmagick and carrierwave, which is used to upload and display images.

*Before run this program: You should rake db:reset and it will add seed data automatically

1. We have created an Admin account in program.The name is: Admin.The password is: 123456. You can change the password and other profiles.But you can't change name.

2. In Admin account. You can destroy of edit any of user, comment, meetup, group. Despit of this, you have permission equal to normal user.

3. If you are a normal user, you should sign up an account first.

4. Any time you click "Groups", all the group will be listed.

5. Any time you click "My Profile", you can edit all attributes of your account. And check the group you have added.

6. You can create a group and destroy a group you create

7. You can join in a group.

8. If you are a member of the group. You can new a Meetup and make comments in any Meetup.

9. If you create a meetup, you also can delete the it.

10.You can see other's comment and other's Meetup.

11.You can search with topics or group name.



core elements:

1. 12 pts) Demonstrate best-practice use of Rails MVC architecture
           True

2. 12 pts) Use all four HTTP methods at least once
           True(resouce) in config/routes.rb

3. 12 pts) Allow users to sign up, sign in, and sign out using cookie-based sessions.
           True(When sign in, it will be kept in cookies)

4. 5 pts) User accounts must use industry-strength password encryption or OAuthcompliant authentication data exchange.
          True(password_digest)

5. 5 pts) Contain at least six models
          True(7 models)

6. 5 pts) Contain at least one many-to-many association
          True(Topic to Group)

7. 5 pts) Use at least three model callbacks
          True(before_validation :convert_email
               after_create :send_welcome_email
               after_destroy :send_delete_email) in app/models/user.rb

8. 5 pts) Use at least three validation rules
          True(validates_presence_of :name, :password, :password_confirmation, :email
               validates_uniqueness_of :email, :name
               validates_format_of :email, :with =>) in app/models/user.rb

9. 5 pts) Maintain HTTP session state (e.g. user authentication)
          True(When sign in. the state will keep until timeout)

10. 2 pts) Use at least one controller filter
          True(before_filter :authorize_user, :only => [:show, :edit, :update]) in app/contollrers/users_controller.rb

11. 2 pts) Populate the database via seed data
          True(Seed for Topic and Admin of User) in db/seeds/rb


Elective Components

1. 20 pts) Use and demonstration of understanding of at least one of the following:
           1.4. Using ActionMailer to send email as a response to user action
           True(Send Email when Sign up and Admin destroy a user) in app/mailers, app/views/user_mailer, app/models/user.rb

