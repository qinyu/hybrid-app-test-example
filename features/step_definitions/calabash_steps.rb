require 'calabash-android/calabash_steps'

Given(/^I am on the "(.*?)" page$/) do |title|
  wait_for_webview_refresh do
    res = query("webView css:'.ui-title'")[0]["textContent"]
    if (title != res)
      raise "The page's title is not '#{title}'"
    end
  end
end

Then(/^I enter text "(.*?)" into field with id "(.*?)" in the page$/) do |text, id|
  set_text("webView css:\##{id}", text)
end
