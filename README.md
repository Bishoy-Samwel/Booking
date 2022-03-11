# Booking Lesson API

## Table of Contents

- [About the Project](#about-the-project)
- [Built With](#built-with)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [API Documentation](#api-documentation)
- [Contributing](#contributing)
- [Author](#author)
- [Acknowledgements](#acknowledgements)

## About Project
The aim of this project is to provide a RESTful API that will help manage connecting stduents with available teachers, and manage teachers available time slots.


<!-- ![screenshot](./screenshot.png) -->

## [API DOCUMENTION](#api-documentation)

- Coming Soon

## Built With

- Ruby 2.7.1
- Rails 6.0.4.7
- Postgresql

## Getting Started

- Clone this repo https://github.com/Bishoy-Samwel/Booking/
  ```
  git clone https://github.com/Bishoy-Samwel/Booking.git
  ```
- Navigate to Booking folder
  ```
  cd Booking
  ```
- On the terminal, while in the 'Booking' directory, run the following to install dependency:
  ```
  bundle install
  ```
- At this point, you still don't have the Postgress database. Run the following to get setup:

  - Ensure that postgresql service is up and runnning
    `sudo service postgresql start`
  - Create the database
    `rails db:create`

  - Migrate the database
    `rails db:migrate`

- To interact with the project, run:

  ```
  rails server
  ```

  OR

  ```
  rails s
  ```

- Go to the browser and enter
  `http://localhost:3000`

### Prerequisites

- Ensure you have these installed:

  - Git
  - Ruby 2.7.1
  - Ruby on rails `gem install rails`

- You also need to ensure your yarn is upto date
  ```
  yarn install --check-files
  ```

### API Documentation
- link (Coming soon)

# Main Endpoints
`POST` request to `/students/?name=Spike`:
- This will create new student with name Spike

`POST` request to `/teachers/?name=Max`:
- This will create new teacher with name Max

`POST` request to `/lessons/?name=Physics&duration=3`:
- This will create new teacher with name Art, and 3 hours duration

`POST` request to `/availabilities/?teacher_id=1&start_time=2022-10-04 6:00:00&end_time=2022-10-04 10:00:00`:
- This will create new available time slot for teacher with id 1, with start_time=2022-10-04 6:00:00, and end_time=2022-10-04 10:00:00 and 4 hours duration

`POST` request to `/sessions/?lesson_id=1&student_id=1`:
- This will check if there is any available teacher for a duration of lesson with id 1, 
- If the teacher is found it will book a new session with earliest start_time.
- Modify the availaility time of this teacher when the session is booked.
## Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Bishoy-Samwel/Booking/issues).

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/newFeature`)
3. Commit your Changes (`git commit -m 'Add some newFeature'`)
4. Push to the Branch (`git push -u origin feature/newFeature`)
5. Open a Pull Request

## Authors

👤 **Bishoy Samwel Faheem**

- GitHub: [@Bishoy Samwel Faheem](https://github.com/Bishoy-Samwel)
- LinkedIn: [Bishoy Samwel](https://www.linkedin.com/in/bishoy-samwuel-ss/)
- Twitter: [@bisho](https://twitter.com/BishoFaheem15)

## Acknowledgements

Credits go to the following for providing guides on Ruby on Rails Association

- [**Rails Guides**](https://guides.rubyonrails.org/)

## Show your support

Give a ⭐️ if you like this project!
