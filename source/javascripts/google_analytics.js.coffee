
class @GoogleAnalytics

  @load: ->
    # If Turbolinks is supported, set up a callback to track pageviews on page:change.
    # If it isn't supported, just track the pageview now.
    if typeof Turbolinks isnt 'undefined' and Turbolinks.supported
      document.addEventListener "page:change", (->
        GoogleAnalytics.trackPageview(document.location.pathname)
      ), true
    else
      GoogleAnalytics.trackPageview(document.location.pathname)

  @trackPageview: (url) ->
    unless GoogleAnalytics.isLocalRequest()
      ga('send', 'pageview', {
        'page': url,
        'title': document.title
      });

  @isLocalRequest: ->
    GoogleAnalytics.documentDomainIncludes "local"

  @documentDomainIncludes: (str) ->
    document.domain.indexOf(str) isnt -1

GoogleAnalytics.load()