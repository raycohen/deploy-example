class DemoController < ApplicationController
  def index
    active_html = get_activated_html_from_redis
    inject_meta_tag(active_html)
    render text: active_html
  end

  private

  def get_activated_html_from_redis
    $redis.get("paperless-demo:index:current-content")
  end

  def get_active_version
    $redis.get("paperless-demo:index:current")
  end

  def demo_data
    {
      :version => get_active_version
    }
  end

  def escaped_demo_data_json
    Rack::Utils.escape_html(demo_data.to_json)
  end

  def inject_meta_tag(html)
    html.insert(inside_head_tag_position(html), <<-HTML.strip)    
      <meta name="demo-data" content="#{escaped_demo_data_json}">
    HTML
  end

  def inside_head_tag_position(html)
    head_tag_position = html.index("<head")
    html.index(">", head_tag_position) + 1
  end
end
