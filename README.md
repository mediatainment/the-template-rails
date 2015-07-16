EasySite Boilerplate by mediatainment productions
===

This app is a boilerplate to jumpstart a rails app. So the most basic setup is already done. Rename the app (see below), set the ```ENV`` Variables and you are good to go. 
Read the ```.gemfile``` to see what's already installed.

Setup
===

1. Rename the app
2. Set ENV VARS
3. Build the database
4. Generate an admin  (admin:rescue)
5. Start workers
6. Start app

ENV
===

You can also put a ```.env``` file into your project root containing the env files


These variables must be set to run the app correctly:

    SECRET_TOKEN:              YOUR_SUPER_SECRET_TOKEN
    HOST:                      localhost:3000
    MAIL_SENDER_EMAIL_ADDRESS: YOUR_EMAIL
    MAIL_SENDER_PASSWORD:      YOUR_PASSWORD
    MAIL_SENDER_PORT:          587
    MAIL_SENDER_SERVER_HOST:   YOUR_SMTP_SERVER
    MAIL_SENDER_TLS:           false
    MAIL_SENDER_USERNAME:      YOUR_EMAIL
    MAIL_SYSTEM_ADMIN:         YOUR_EMAIL

Rake Tasks
===

Generates an admin with email **demo@demo.com** and passwort **asdfasdf1**

    admin:rescue

Rename the app
===

    rails g rename:app_to Your-New-Name

You must also change the **config/database_yml** file  

Generate Admin
---

    admin:rescue

Authentication
---

This template uses the ```devise``` gem.

The role management is handled by ```cancancan``` and its roles are handled in the ```Ability``` model

Preconfigured Sites
===

This template offers the following sites already setup

* / (index/home)
* /contact (index/contact)
* /users
* /roles
* /einloggen
* /ausloggen
* /registrieren
* /password
* /bestaetigen
* /entsperren

Navigation
===

The navigation can be set in ```/config/navigation.rb```.

SEO
===

Meta Tags
---

    set_meta_tags :keywords => %w[keyword1 Keyword2 KeyWord3]
    set_meta_tags :description => "All text about keywords, other keywords"
    set_meta_tags :title => 'Member Login'
    set_meta_tags :site => 'Site Title', :title => 'Member Login', :reverse => true



Translation
===

https://github.com/globalize/globalize
    
Do not use the change method, use up and down!

    class CreatePosts < ActiveRecord::Migration
      def up
        create_table :posts do |t|
          t.timestamps
        end
        Post.create_translation_table! :title => :string, :text => :text
      end
      def down
        drop_table :posts
        Post.drop_translation_table!
      end
    end


InPlaceEditing
===

To make a piece of Text inplace-editable, wrap it into an element (a span usually) with class "rest-in-place". The editor needs 3 pieces of information to work: a URL, an object name and the attribute name. These are provided as follows:

put attributes into the element, like this:
    
    <span class="rest-in-place" data-url="/users/1" data-object="user" data-attribute="name" data-placeholder="Enter a name">
      <%= @user.name %>
    </span>
    
if any of these attributes is missing, DOM parents of the element are searched for them. That means you can write something like:

    <div data-object="user" data-url="/users/1">
      Name:  <span class="rest-in-place" data-attribute="name" ><%= @user.name %></span><br/>
      eMail: <span class="rest-in-place" data-attribute="email"><%= @user.email %></span>
    </div>

You can completely omit the URL to use the current document's URL. With proper RESTful controllers this should always work, the explicit URL-attribute is for cases when you want to edit a resource that is displayed as part of a non-RESTful webpage.

Rails provides the DOM helper that constructs a DOM id out of an ActiveRecord for you. So, your HTML page may look like this:

    <div id="<%= dom_id @user # == "user_1" %>">
      Name:  <span class="rest-in-place" data-attribute="name" ><%= @user.name %></span><br/>
      eMail: <span class="rest-in-place" data-attribute="email"><%= @user.email %></span>
    </div>
    
REST in Place recognizes dom_ids of this form and derives the object parameter from them, so that (with the current documents URL used) you really only need to provide the attributes name in most cases.

Note that a manually defined (in the element or in one of the parents) object always overrides dom_id recognition.

REST in Place supports multiple form types. The default type is a input field, a textarea is also supported. To select a form type use the data-formtype attribute in the element and set it to the name of your formtype ( input, or textarea ).

To write your own form types, just extend the RestInPlace.forms object and select your new form type throught the data-formtype attribute.

Elements with the class rest-in-place are picked up automatically upon document.ready. For other elements, grab them via jQuery and call .restInPlace() on the jQuery object.

    $('.my-custom-class').restInPlace()

Events
---

A REST in Place instance triggers four different events on the element that it's associated with:

activate.rest-in-place when starting the editing of the element. Triggering the event is the first thing that happens, before any processing and form building takes place. That means you can use this event to modify the content of the element (for example to remove number/date formatting).
ready.rest-in-place when the form has been built. This event can be used e.g. to change the size of the field or textarea.
success.rest-in-place with the data retrieved from the server as an extra parameter after a successful save on the server. This event is triggered at the very latest moment, after the element has been restored with the data from the server. This means you can use the event handler to further modify the data and overwrite the displayed value (useful for number/date formatting for example).
failure.rest-in-place after an error occurred. The second argument will be jQuery's responseJSON, so it is possible to handle (for instance) server-side validation errors.
    
    $('#my-editable-element').bind('failure.rest-in-place', function(event, json) {
        $el = $(this);
        attr = $el.data("attribute");
        error_message = json[attr].join(", ");
        $el.after("<span class='error'>#{error_message}</span>");
    });
    update.rest-in-place immediately before sending the update to the server
    
    abort.rest-in-place when the user aborts the editing process.
    Bind to these events through the jQuery event mechanisms:
    
    $('#my-editable-element').bind('success.rest-in-place', function(event, data){
      console.log("Yay it worked! The new value is", data.whatever);
    });
    
Example
---
    Your routes.rb:

resources :users

Your app/controllers/users_controller.rb:

    class UsersController < ApplicationController
      def show
        @user = User.find params[:id]
        respond_to do |format|
          format.html
          format.json {render :json => @user}
        end
      end
    
      def update
        @user = User.find params[:id]
        if @user.update_attributes!(params[:user])
          respond_to do |format|
            format.html { redirect_to( @person )}
            format.json { render :json => @user }
          end
        else
          respond_to do |format|
            format.html { render :action  => :edit } # edit.html.erb
            format.json { render :nothing =>  true }
          end
        end
      end
    end
    Your app/views/users/show.html.erb:

    <div id="<%= dom_id @user %>">
      ID: <%= @user.id %><br />
      Name: <span class="rest-in-place" data-formtype="input" data-attribute="name"><%= @user.name %></span><br/><br/>
      Hobbies: <span class="rest-in-place" data-formtype="textarea" data-attribute="hobbies"><%= @user.hobbies %></span>
    </div>
    
You can run this example by running to the testapp included in this plugin with script/server (SQLite3 required) and visiting localhost:3000/users/

Hint: you might need to set up the database first. Copy and edit testapp/config/database.yml.sample accordingly. If you don't want to use the included SQLite3 database, run rake db:create and rake db:schema:load.

FileUpload with Carrierwave
===

Set ENV Variables
    
    S3_KEY
    S3_SECRET
    S3_BUCKET_NAME
    S3_REGION

Visit website to get more Infos
# https://github.com/carrierwaveuploader/carrierwave






copyright by Jan Jezek
