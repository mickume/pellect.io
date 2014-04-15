
require 'figaro'
   
module AnalyticsHelper
  def tracking_tag
    
    unless Figaro.env.tracking_url == 'localhost'
      
      piwik_code = <<-EOF
      <!-- Piwik -->
      <script type="text/javascript">
        var _paq = _paq || [];
        _paq.push(['trackPageView']);
        _paq.push(['enableLinkTracking']);
        (function() {
          var u=(("https:" == document.location.protocol) ? "https" : "http") + "://#{Figaro.env.tracking_url}/";
          _paq.push(['setTrackerUrl', u+'piwik.php']);
          _paq.push(['setSiteId', #{Figaro.env.tracking_id}]);
          var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript';
          g.defer=true; g.async=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
        })();
      </script>
      <noscript><p><img src="http://stats.ratchet.cc/piwik.php?idsite=#{Figaro.env.tracking_id}" style="border:0;" alt="" /></p></noscript>
      <!-- End Piwik Code -->
      EOF
      
      piwik_code.html_safe
    end
  end
end