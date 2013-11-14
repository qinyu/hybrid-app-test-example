require 'calabash-android/calabash_steps'

def wait_for_webview_refresh(times=30, interval=1)
  loaded = false
  times.times do
    exists = element_exists("cordovaWebView") || element_exists("webView") 
    loaded = exists && performAction("get_load_progress")["message"] == "100"
    if loaded
      yield if block_given?
      return   
    end
    begin
      Timeout::timeout(interval) {}
    rescue Timeout::Error
      next
    end
  end
  raise "Could not load page in #{times * interval} seconds"
end

def set_cordova_text(uiquery, txt)
  uiquery.slice!(0, "cordovaWebView".length)
  if uiquery =~ /(css|xpath):'\s*(.*)'/
    r = performAction("set_cordova_text", $1, $2, txt)
    JSON.parse(r["message"])
  else
   raise "Invalid query #{uiquery}"
  end
end

def enter_text_by_instrumentation(uiquery, txt)
  performAction("enter_text_by_instrumentation", uiquery, txt)
end