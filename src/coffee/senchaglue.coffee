###
    // Save a reference to the global object (`window` in the browser, `global`
    // on the server).

    // let's glue:
        // ajax
        // post
        // each
        // inArray

    // won't support fetchHeaders synchronous requests
###
sGlue = {};

window.senchaGlue = sGlue;

sGlue.ajax = (opts) ->
    newOpts =
        url: opts.url
        method: opts.type
        headers: opts.headers
        jsonData: opts.data

    Ext.Ajax.request newOpts

sGlue.each = (list, iterator) ->
    _.each list, (el, key) ->
        iterator key, el

sGlue.inArray = (element, array) ->
    _.indexOf array, element

sGlue.post = (url, data, callback, headers) ->
    # callback takes data, status, xhr
    glueCallback = (response, status, xhr) ->
        try
            data = JSON.parse response.responseText
        catch e
            data = response.responseText

        callback data, status, xhr

    opts =
        url: url
        method: 'POST'
        params: data
        success: glueCallback
        headers: headers

    Ext.Ajax.request opts





