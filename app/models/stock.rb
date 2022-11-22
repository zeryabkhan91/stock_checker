class Stock

  def self.in_stock_links(product_urls = ["https://www.foodspring.co.uk/shape-shake-2-0", "https://www.foodspring.co.uk/starter-pack", "https://www.foodspring.fr/barre-paleo-bio-pack-de-12", "https://www.foodspring.fr/gelules-omegas-3"])
    urls = {}
    product_urls.each do |url|
      begin
        response = StockCheckerService.new(url: url).instock_url?
        if response
          urls.merge!(url => "in stock")
        else
          urls.merge!(url => "out of stock")
        end

      rescue StandardError => e
        urls.merge!(url => "link not found")
        next
      end
    end

    urls
  end
end
