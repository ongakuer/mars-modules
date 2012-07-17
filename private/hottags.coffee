hottags =({class:c}) ->
    tagloop = (tag) ->
        """
        <a href="#{tag.url}" class="#{c}" title="#{tag.count}个话题">#{tag.name}</a>
        """
    (tagloop(tag) for tag in dian.data.tags).join('')
exports.hottags = hottags