When(/^отправил запрос на страницу "([^"]*)"$/) do |url|
  @response = Net::HTTP.get_response((URI(url)))
end

When(/^код ответа "([^"]*)"$/) do |code|
  assert_equal(code, @response.code.to_s)
end

When(/^произошёл редирект на "([^"]*)"$/) do |url|
  assert_equal(url, @response.header['location'])
end

When(/^отправил GET запрос с параметрами:$/) do |table|
  @response = RestClient.get($suggest_request, {params: table.rows_hash})
end

When(/^отправил GET запрос без параметров$/) do
  @response = RestClient.get$suggest_request
end

When(/^"([^"]*)" массив ответа содержит данные:$/) do |array, table|
  json = JSON.parse(@response.body)
  expected_values = table.rows_hash
  expected_values.each do |value|
    assert_equal(json['result'][array.to_i-1][value[0]], value[1])
  end
end