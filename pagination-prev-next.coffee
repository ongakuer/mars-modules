_ = require('dd://modules/underscore/1.3.3/underscore')

type0prev = (prevtext)-> 
    prev =  '<a id="d_pagination_prev"  href="' + dian.data.pagination.prev.url + '">' + prevtext + '</a>'


type0next = (nexttext)-> 
    next =  '<a id="d_pagination_next"  href="' + dian.data.pagination.next.url + '" >' + nexttext + '</a>'
   

type0 = (prevtext,nexttext) ->
    if !_.isEmpty(dian.data.pagination.prev) then write(type0prev(prevtext))
    if !_.isEmpty(dian.data.pagination.next) then write(type0next(nexttext))


pagination =(prevtext,nexttext) ->
    if _.isObject(dian.data.pagination) 
        type0(prevtext,nexttext)

exports.pagination = pagination