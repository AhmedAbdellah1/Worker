## Wroker

I developed the Worker app to make it easier for users to submit and request services efficiently.
The application contains multiple authentication using JWT and also uses the service layer pattern concept and also uses laravel notifications.

## Features
- Administrator (Admin): 
* Has the authority to approve or reject services.
* Can provide reasons for rejecting services.
* Can manage users and services.

- Worker:
* Can create and edit services.
* Can view requests, ratings, and comments on services.
* Can post and interact with posts.

-Client:
* Can request services, rate them, and leave comments.
* Can browse posts and comment on them.

## Other features include:
* Implementation of a multi-authentication system using JWT for security.
* Adoption of the service layer pattern to control data operations.
* Inclusion of email verification through a verification code.
* Users can rate services using a star rating system and leave comments.
* Implementation of a search system to filter services by service name, price, or service provider name.
* importing and exporting data to Excel files.

## Requirements

* PHP Laravel
* MySQL
* Laravel Excel for Excel export
* Spatie library  for search system to filter services
* laravel notifications

## Installation and Usage

For detailed installation and usage instructions, please look below steps
* download Or clone project
* Go to the folder application usin cd commend
* Run (composer install) on your terminal
* Run (copy .env.example .env)
* Run (php artisan key:generatore)
* Run (php artisan serve)
  
## Contact
- For any inquiries or feedback, please feel free to contact us at ahmed.abdellah664@gmail.com
