# System Design Capstone

## Summary 

The System Design Capstone project aimed to implement a scaled backend for a full stack application resembling Epic Games' store product page. Through the utilization of technologies such as Node, Express, Postgres Database, Docker, Redis, and Digital Ocean, optimizations including containerization, migration, and caching were implemented to enhance scalability, performance, and response times, leading to improved throughput and a solid baseline for further optimization.

### Project Video

[![Project Video](https://img.youtube.com/vi/Bg1VuG6H8H4/0.jpg)](https://youtu.be/Bg1VuG6H8H4)

## Table of Contents

- [Introduction](#introduction-to-the-project)
- [Technologies Used](#technologies-used)
- [Challenges and Refactoring](#challenges-and-refactoring)
- [Optimizations Implemented](#optimizations-implemented)
- [Load Tests and Metrics](#load-tests-and-metrics)
- [Findings and Results](#findings-and-results)
- [Conclusion and Moving Forward](#conclusion-and-moving-forward)

## Introduction to the Project

I recently worked on a project where my responsibility was to implement a scaled backend for a full stack application that aimed to replicate Epic Games' store product page.

The application allowed clients to request information about video games, displaying details such as the game's name, rating, video trailer, description, genre, and product information like the developer, publisher, release date, and platform.

To implement the scaled backend, I utilized various technologies including Node, Express, Postgres Database, k6, Faker.js, Docker, Redis, and Digital Ocean.

Within the Postgres database, I incorporated 10,000 records of fake data generated using Faker.js. This simulated the stock of video games and their corresponding product information that would be available to customers.

## Technologies Used

Here are the technologies used in this project:

- Node
- Express
- Postgres Database
- k6
- Faker.js
- Docker
- Redis
- Digital Ocean

## Challenges and Refactoring

One of the significant challenges I encountered during the implementation of the scaled backend was refactoring the project's backend to conduct load tests and utilize Digital Ocean.

The project I inherited was originally developed with Supabase from another organization, and I did not have the rights to seed this database with thousands of records. To overcome this, I migrated the tables along with the seeded data to a Postgres image within a Docker container. I accomplished this by referencing the table definitions and seeded data, creating SQL files in the project's directory. I then created a Docker container containing a Postgres image using Docker Compose, initializing it with the newly created SQL files.

Another obstacle I faced was during the base load tests using k6 to send metrics to Grafana. Simulating 5,000 concurrent users exceeded the expected push interval configuration for InfluxDB, resulting in a cascade of failed requests and occasional timeout errors during the load tests. To address this, I optimized my load test script to simulate only 100 virtual users, reducing the amount of generated data and the number of requests made to ensure data can be processed and sent within the configured interval.

After overcoming these challenges by refactoring the original backend infrastructure and adjusting the load test scripts, I established an excellent baseline for my application's performance, providing a starting point for further optimization.

## Optimizations Implemented

Initially, the server and database architecture for the application followed a distributed monolith approach. To enhance scalability and performance, I implemented several optimizations.

I containerized the Express servers using Docker Compose to ensure consistent deployment and ease of scalability. To host the Express container, I set up a Digital Ocean droplet. Additionally, I created a separate Digital Ocean droplet with a Postgres database cluster where I migrated the tables and seeded the database with 10,000 records of fake data using faker js.

To compare the metrics of the application's original architecture, I consolidated the isolated Express servers into a single file that I then pushed into a Docker container. This container was then deployed to Digital Ocean to simplify the infrastructure and reduce overhead.

I also dockerized a Redis server and deployed it to its own Digital Ocean droplet. Redis caching was utilized to enhance caching mechanisms and improve the overall performance of the application.

## Load Tests and Metrics

During the load tests, specifically breakpoint tests, I conducted both base and vertically scaled configurations. The base test consisted of one virtual machine with 2 virtual CPUs and 2 GB of Intel RAM. The test had a duration of 10 minutes with 100 virtual users. It ramped up from 0 to 100 virtual users over 2 minutes, stayed at 100 virtual users for 5 minutes, and then ramped down over 3 minutes until reaching 0 virtual users. The vertically scaled tests utilized one virtual machine with 4 virtual CPUs and 8 GB of Intel RAM, maintaining the same durations and ramp-up/ramp-down configurations as the base tests.

When collecting the test data, the key metrics I focused on were response time, throughput, and error rate. These metrics provide valuable insights into the application’s performance bottlenecks, scalability, and stability.

The three architectures measured were the original distributed monolith architecture, a single server monolith architecture, and then the single server architecture implemented with Redis.

## Findings and Results

The findings for average response time indicated that the distributed monolith architecture exhibited higher response times compared to the single server monolith. However, introducing Redis caching to the single server monolith significantly improved response times.

In terms of average throughput, the single server monolith with Redis achieved the highest throughput, indicating effective utilization of caching mechanisms. On the other hand, the distributed monolith had the lowest throughput.

Regarding the error rate, it remained relatively consistent across different architectures and scaling configurations. The single server monolith with Redis exhibited the highest error rate, likely due to the significantly higher request load per second compared to the other architectures.

## Conclusion and Moving Forward

In conclusion, the introduction of Redis caching improved the application's performance, resulting in lower response times and higher throughput. The distributed monolith architecture faced challenges in achieving optimal response times and throughput compared to the single server monolith.

To further optimize the application, potential bottlenecks include identifying and optimizing resource-intensive components in the distributed monolith architecture, exploring horizontal scaling options to distribute the load more effectively, and conducting further analysis to understand the factors contributing to the higher error rates.
