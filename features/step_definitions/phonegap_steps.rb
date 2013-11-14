Given(/^Web page is fully loaded$/) do 
  wait_for_webview_refresh
end

Then(/^I am on the page with header "(.*?)"$/) do |title|
  result = query("cordovaWebView css:'*'").select {|el| el["textContent"] == title}
  if (result.empty?)
    raise "The page's header is not '#{title}'"
  end
end

Then(/^I see button with text "(.*?)" on the page$/) do |label|
  result = query("cordovaWebView css:'a'").select {|el| el["textContent"] == label}
  if (result.empty?)
    raise "The page doesn't contains any button with text '#{label}'"
  end
end

Then(/^I see "(.*?)" on the page$/) do |label|
 result = query("cordovaWebView css:'*'").select {|el| el["textContent"] == label}
 if (result.empty?)
  raise "The page doesn't contains text '#{label}'"
 end
end

Then(/^I see input with id "(.*?)" on the page$/) do |id|
 result = query("cordovaWebView css:'input\##{id}'")
 if (result.empty?)
  raise "The page doesn't contains input with id '#{id}'"
 end
end

Then(/^I press the "(.*?)" button on the page$/) do |label|
  res = false
  elements = query("cordovaWebView css:'a'").select {|el| el["textContent"] == label}
  elements.each do |element|
    res = touch(element)
    if res["success"]
      res = true
    end
  end

  if not res
    raise "Could not click button '#{label}'"
  end

end

Then(/^I enter "(.*?)" into input with id "(.*?)" on the page$/) do |text, id|
  enter_text_by_instrumentation("cordovaWebView css:'input\##{id}'", text)
end
