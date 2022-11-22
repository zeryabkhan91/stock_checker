require 'uri'
require 'open-uri'

class StockCheckerService

  VALID_INSTOCK_STRINGS = [
                          "in stock",
                          "voeg toe aan winkelwagen",
                          "lo voglio!",
                          "ajouter au panier",
                          "¡lo quiero!",
                          "in den warenkorb",
                          "ajouter au panier",
                          "voeg toe aan winkelwagen",
                          "ajouter au panier"
                          ]

  COUNTRIES_PRE_POST = {
                        "countries" => {
                            "uk" => {"pre" => "available\"></span>", "post" => "</div><div class=\"product-detail-unit-info\">"},
                            "it" => {"pre" => "<span id=\"addToCart\" class=\"addToCart-label\">", "post" => "</span>"},
                            "fr" => {"pre" => "<span id=\"addToCart\" class=\"addToCart-label\">", "post" => "</span>"},
                            "es" => {"pre" => "<span id=\"addToCart\" class=\"addToCart-label\">", "post" => "</span>"},
                            "at" => {"pre" => "<span id=\"addToCart\" class=\"addToCart-label\">", "post" => "</span>"},
                            "ch" => {"pre" => "<span id=\"addToCart\" class=\"addToCart-label\">", "post" => "</span>"},
                            "nl" => {"pre" => "<span id=\"addToCart\" class=\"addToCart-label\">", "post" => "</span>"},
                            "be" => {"pre" => "<span id=\"addToCart\" class=\"addToCart-label\">", "post" => "</span>"},
                            "de" => {"pre" => "<span id=\"addToCart\" class=\"addToCart-label\">", "post" => "</span>"}
                        }
                       }

  def initialize(url: nil)
    @url = url
  end

  def instock_url?
    VALID_INSTOCK_STRINGS.include?(request_food_spring.downcase.strip)
  end

  private

  def request_food_spring
    response = open_and_read(@url)
    country = country_domain
    if COUNTRIES_PRE_POST["countries"].key?(country)
      pre = COUNTRIES_PRE_POST["countries"][country]["pre"]
      post = COUNTRIES_PRE_POST["countries"][country]["post"]
      response.include?(pre) ? response.split(pre)[1].split(post)[0] : ""
    else
      ""
    end
  end


  def country_domain
    URI.parse(@url).host.split(".").last
  end

  def open_and_read(url)
    URI.open(url).read
  end
end
