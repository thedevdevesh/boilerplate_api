# Boilerplate API

## Description

Boilerplate API is a Ruby on Rails application that provides a robust API for managing surveys and responses. It allows users to create surveys, submit responses, and manage survey data. This project is designed to be a starting point for building survey-based applications with an easy-to-use API structure.

### Key Features:
- **Survey Management**: Users can create surveys with questions and options.
- **Response Management**: Users can submit responses to surveys.
- **API Endpoints**: RESTful API endpoints for survey and response management.
- **Validation**: Data validation to ensure accuracy and integrity.

The API is developed using **Ruby on Rails** with **RSpec** for testing and **PostgreSQL** for the database.

---

## Technologies Used

- **Ruby on Rails**: Framework for building the application.
- **RSpec**: Testing framework for Ruby.
- **FactoryBot**: Used for creating test data.
- **PostgreSQL**: Database for storing survey and response data.

---

## Setup Instructions

### Prerequisites

Before setting up the project, ensure you have the following installed:

- **Ruby** (version 3.x)
- **Rails** (version 7.x)
- **PostgreSQL** for the database

### Install the Application

1. **Clone the Repository**  
   Clone the repository to your local machine:

   ```bash
   git clone https://github.com/thedevdevesh/boilerplate_api.git
   cd boilerplate_api
   ```

2. **Install Dependencies**  
   Install the required gems using Bundler:

   ```bash
   bundle install
   ```

3. **Set Up the Database**  
   Create and migrate the database:

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the Application**  
   Run the Rails server:

   ```bash
   rails server
   ```

   The API will be available at http://localhost:3000

## Running Tests

This project uses RSpec for testing. Here's how to run the tests:

### Run All Tests

To run the complete test suite, use the following command:

```bash
bundle exec rspec
```

### View Test Results

After running the tests, you'll see output similar to this (the actual results will depend on your setup):

```bash
Finished in 0.08456 seconds (files took 0.50419 seconds to load)
21 examples, 0 failures, 1 pending

Failed examples:
rspec ./spec/models/survey_spec.rb:19 # Survey can have many responses
rspec ./spec/requests/responses_spec.rb:10 # Responses POST /surveys/:survey_id/responses with valid parameters creates a new response
```

### Test Coverage

To measure code coverage, you can use SimpleCov or any other code coverage tool integrated into the RSpec setup.

## API Endpoints

The API provides several endpoints for managing surveys and responses. Here are the main ones:

### Survey Endpoints

- `POST /surveys`  
  Create a new survey. Requires the title and description of the survey.

### Response Endpoints

- `POST surveys/:survey_id/responses`  
  Create a new response for a specific survey.

- `GET surveys/:survey_id/responses`  
  Retrieve all responses for a specific survey.

- `GET /surveys/:survey_id/responses/:id`  
  Retrieve a specific response by ID for a survey.

- `PUT/PATCH /surveys/:survey_id/responses/:id`  
  Update a specific response.

- `DELETE /surveys/:survey_id/responses/:id`  
  Delete a specific response.

## Example API Request

Here's an example of how to create a new survey using cURL:

```bash
curl -X POST \
  http://localhost:3000/surveys \
  -H 'Content-Type: application/json' \
  -d '{
    "survey": {
      "title": "Customer Feedback",
      "description": "Please provide your feedback about our service"
    }
  }'
```


curl -X POST \
  http://localhost:3000/surveys \
  -H 'Content-Type: application/json' \
  -d '{
    "title": "Customer Feedback Survey",
    "description": "A survey to gather feedback from customers"
  }'
Response:

{
  "id": 1,
  "title": "Customer Feedback Survey",
  "description": "A survey to gather feedback from customers",
  "created_at": "2024-12-20T00:00:00.000Z",
  "updated_at": "2024-12-20T00:00:00.000Z"
}