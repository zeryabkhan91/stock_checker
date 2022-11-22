# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  `ruby 2.7.3`

* System dependencies

* Configuration

* To Run the application you need to follow following steps:
  1. GoTo project directory
  2. Enter to Rails console `rails console`
  3. Create an array containing URLs you want to check, I am providing following array as sample
  ```
  URLS = ["https://www.foodspring.co.uk/shape-shake-2-0", "https://www.foodspring.co.uk/starter-pack", "https://www.foodspring.fr/barre-paleo-bio-pack-de-12", "https://www.foodspring.fr/gelules-omegas-3"]
  ```
  4. Call the start method of the implementation which is writen inside `stock.rb`
  ```
  Stock.in_stock_links(URLS)
  ```

* How to run the test suite
  `rails test`

* Test implementation
  1. Downloaded sample html files for in stock and out of stock products and stores in fixture/files
  2. Added separate test case for every country URL's
  3. Mocked some URL's to send `out of stock` and some to send `in stock` sample files
  4. Call in_stock_links function from Stock file and input the respective country URL's
  5. Add assertions to check that response has correct URL

* Services (job queues, cache servers, search engines, etc.)
  There is a service named `StockCheckerService` which accepts a url of a product. Then it will send request to that url and validate if that product is not stock or not.

* Coding techniques
  - Used hashes to return url details i.e in stock or out of stock, as hash key mapping are fast to access
  - Used `open-uri` library to parse url request because using `Net:Http` gives redirection error which is handled in open-uri

* Deployment instructions

* ...
