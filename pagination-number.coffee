_ = require('dd://modules/underscore/1.3.3/underscore')
dp = dian.data.pagination

initTotal = -> '<span id="d_total">' + 'Page ' +  dp.current_number + ' of ' + dp.total + '</span>'

initFirst = (f)-> 
    '<a id="d_first" href=' + dp.first.url + ' title="首页">' + f + '</a>'

initLast = (l)-> 
    '<a id="d_last" href=' + dp.last.url + ' title="尾页">' + l + '</a>'

initPrev = (p)-> 
    '<a id="d_pagination_prev"  href="' + dp.prev.url + '" title="上一页">' + p + '</a>'

initNext = (n)-> 
    '<a id="d_pagination_next"  href="' + dp.next.url + '" title="下一页">' + n + '</a>'

paginationLoop = (c)->
        pageLoop = (page) ->
            if page.current 
                '<span class="' + c + '">' + page.number + '</span>'
            else
                '<a href=' + page.url +  '>' + page.number + '</a>'

        (pageLoop(page) for page in dp.pages).join('')

pagination =({ total:t ,prev:p ,next:n ,first:f ,last:l ,number:m,class:c }) ->

    if _.isObject(dp) 

        if t and t? then write( initTotal() )
        
        if dp.current_number isnt 1 and f isnt null and f isnt "" and f? then write( initFirst(f) )

        if !_.isEmpty(dp.prev) and p isnt null and p isnt "" and p? then write( initPrev(p) )

        if m and m? then write(paginationLoop(c))

        
        if !_.isEmpty(dp.next) and n isnt null and n isnt "" and n? then write( initNext(n) )

        if dp.current_number isnt dp.total and l isnt null and l isnt "" and l? then write( initLast(l) )
    
exports.pagination = pagination