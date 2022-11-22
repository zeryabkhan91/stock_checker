require "test_helper"

describe Stock do

  describe '#italy' do

    let(:urls) { ["https://www.foodspring.it/test1",
              "https://www.foodspring.it/test2",
              "https://www.foodspring.it/test3"] }

    describe 'in stock_links' do
      before do
        StockCheckerService.any_instance.stubs(:open_and_read).returns(read_file("out_of_stock_italy"))
        # send in stock for test1 and for rest of url's send out of stock
        StockCheckerService.any_instance.stubs(:open_and_read).with("https://www.foodspring.it/test1").returns(read_file("in_stock_italy"))
      end

      it 'should return array of links that are in stock' do
        response = Stock.in_stock_links(urls)
        # Only test 1 returned for instock
        assert_equal(response["https://www.foodspring.it/test1"], "in stock")
        assert_equal(response["https://www.foodspring.it/test2"], "out of stock")
        assert_equal(response["https://www.foodspring.it/test3"], "out of stock")
      end
    end
  end

  describe '#germany' do

    let(:urls) { ["https://www.foodspring.de/test1",
              "https://www.foodspring.de/test2",
              "https://www.foodspring.de/test3"] }

    describe 'in stock_links' do
      before do
        StockCheckerService.any_instance.stubs(:open_and_read).returns(read_file("out_of_stock_germany"))
        # send in stock for test2 and for rest of url's send out of stock
        StockCheckerService.any_instance.stubs(:open_and_read).with("https://www.foodspring.de/test2").returns(read_file("in_stock_germany"))
      end

      it 'should return array of links that are in stock' do
        response = Stock.in_stock_links(urls)
        # Only test 2 returned for instock
        assert_equal(response["https://www.foodspring.de/test1"], "out of stock")
        assert_equal(response["https://www.foodspring.de/test2"], "in stock")
        assert_equal(response["https://www.foodspring.de/test3"], "out of stock")
      end
    end
  end

  describe '#french' do

    let(:urls) { ["https://www.foodspring.fr/test1",
              "https://www.foodspring.fr/test2",
              "https://www.foodspring.fr/test3"] }

    describe 'in stock_links' do
      before do
        StockCheckerService.any_instance.stubs(:open_and_read).returns(read_file("out_of_stock_french"))
        # send in stock for test3 and for rest of url's send out of stock
        StockCheckerService.any_instance.stubs(:open_and_read).with("https://www.foodspring.fr/test3").returns(read_file("in_stock_french"))
      end

      it 'should return array of links that are in stock' do
        response = Stock.in_stock_links(urls)
        # Only test 3 returned for instock
        assert_equal(response["https://www.foodspring.fr/test1"], "out of stock")
        assert_equal(response["https://www.foodspring.fr/test2"], "out of stock")
        assert_equal(response["https://www.foodspring.fr/test3"], "in stock")
      end
    end
  end

  describe '#spain' do

    let(:urls) { ["https://www.foodspring.es/test1",
              "https://www.foodspring.es/test2",
              "https://www.foodspring.es/test3"] }

    describe 'in stock_links' do
      before do
        StockCheckerService.any_instance.stubs(:open_and_read).returns(read_file("out_of_stock_spain"))
        # send in stock for test1 and for rest of url's send out of stock
        StockCheckerService.any_instance.stubs(:open_and_read).with("https://www.foodspring.es/test1").returns(read_file("in_stock_spain"))
      end

      it 'should return array of links that are in stock' do
        response = Stock.in_stock_links(urls)
        # Only test 1 returned for instock
        assert_equal(response["https://www.foodspring.es/test1"], "in stock")
        assert_equal(response["https://www.foodspring.es/test2"], "out of stock")
        assert_equal(response["https://www.foodspring.es/test3"], "out of stock")
      end
    end
  end

  describe '#austria' do

    let(:urls) { ["https://www.foodspring.at/test1",
              "https://www.foodspring.at/test2",
              "https://www.foodspring.at/test3"] }

    describe 'in stock_links' do
      before do
        StockCheckerService.any_instance.stubs(:open_and_read).returns(read_file("out_of_stock_austria"))
        # send in stock for test1 and for rest of url's send out of stock
        StockCheckerService.any_instance.stubs(:open_and_read).with("https://www.foodspring.at/test1").returns(read_file("in_stock_austria"))
      end

      it 'should return array of links that are in stock' do
        response = Stock.in_stock_links(urls)
        # Only test 1 returned for instock
        assert_equal(response["https://www.foodspring.at/test1"], "in stock")
        assert_equal(response["https://www.foodspring.at/test2"], "out of stock")
        assert_equal(response["https://www.foodspring.at/test3"], "out of stock")
      end
    end
  end

  describe '#swiss' do

    let(:urls) { ["https://www.foodspring.ch/test1",
              "https://www.foodspring.ch/test2",
              "https://www.foodspring.ch/test3"] }

    describe 'in stock_links' do
      before do
        StockCheckerService.any_instance.stubs(:open_and_read).returns(read_file("out_of_stock_swiss"))
        # send in stock for test1 and for rest of url's send out of stock
        StockCheckerService.any_instance.stubs(:open_and_read).with("https://www.foodspring.ch/test1").returns(read_file("in_stock_swiss"))
      end

      it 'should return array of links that are in stock' do
        response = Stock.in_stock_links(urls)
        # Only test 1 returned for instock
        assert_equal(response["https://www.foodspring.ch/test1"], "in stock")
        assert_equal(response["https://www.foodspring.ch/test2"], "out of stock")
        assert_equal(response["https://www.foodspring.ch/test3"], "out of stock")
      end
    end
  end

  describe '#netherlands' do

    let(:urls) { ["https://www.foodspring.nl/test1",
              "https://www.foodspring.nl/test2",
              "https://www.foodspring.nl/test3"] }

    describe 'in stock_links' do
      before do
        StockCheckerService.any_instance.stubs(:open_and_read).returns(read_file("out_of_stock_netherlands"))
        # send in stock for test1 and for rest of url's send out of stock
        StockCheckerService.any_instance.stubs(:open_and_read).with("https://www.foodspring.nl/test1").returns(read_file("in_stock_netherlands"))
      end

      it 'should return array of links that are in stock' do
        response = Stock.in_stock_links(urls)
        # Only test 1 returned for instock
        assert_equal(response["https://www.foodspring.nl/test1"], "in stock")
        assert_equal(response["https://www.foodspring.nl/test2"], "out of stock")
        assert_equal(response["https://www.foodspring.nl/test3"], "out of stock")
      end
    end
  end

  describe '#belgium' do

    let(:urls) { ["https://www.foodspring.be/test1",
              "https://www.foodspring.be/test2",
              "https://www.foodspring.be/test3"] }

    describe 'in stock_links' do
      before do
        StockCheckerService.any_instance.stubs(:open_and_read).returns(read_file("out_of_stock_belgium"))
        # send in stock for test1 and for rest of url's send out of stock
        StockCheckerService.any_instance.stubs(:open_and_read).with("https://www.foodspring.be/test1").returns(read_file("in_stock_belgium"))
      end

      it 'should return array of links that are in stock' do
        response = Stock.in_stock_links(urls)
        # Only test 1 returned for instock
        assert_equal(response["https://www.foodspring.be/test1"], "in stock")
        assert_equal(response["https://www.foodspring.be/test2"], "out of stock")
        assert_equal(response["https://www.foodspring.be/test3"], "out of stock")
      end
    end
  end

  def read_file(name)
    filepath = "#{Rails.root}/test/fixtures/files/#{name}.html"
    File.read(filepath)
  end
end

