// Generated by CoffeeScript 1.3.3

/*
    // Save a reference to the global object (`window` in the browser, `global`
    // on the server).

    // let's glue:
        // ajax
        // post
        // each
        // inArray

    // won't support fetchHeaders synchronous requests
*/


(function() {
  var sGlue;

  sGlue = {};

  window.senchaGlue = sGlue;

  sGlue.ajax = function(opts) {
    var newOpts;
    newOpts = {
      url: opts.url,
      method: opts.type,
      headers: opts.headers,
      jsonData: opts.data
    };
    return Ext.Ajax.request(newOpts);
  };

  sGlue.each = function(list, iterator) {
    return _.each(list, function(el, key) {
      return iterator(key, el);
    });
  };

  sGlue.inArray = function(element, array) {
    return _.indexOf(array, element);
  };

  sGlue.post = function(url, data, callback, headers) {
    var glueCallback, opts;
    glueCallback = function(response, status, xhr) {
      try {
        data = JSON.parse(response.responseText);
      } catch (e) {
        data = response.responseText;
      }
      return callback(data, status, xhr);
    };
    opts = {
      url: url,
      method: 'POST',
      params: data,
      success: glueCallback,
      headers: headers
    };
    return Ext.Ajax.request(opts);
  };

}).call(this);
