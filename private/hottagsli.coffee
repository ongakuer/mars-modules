hottags = ->
	star = "<ul>"

	tagloop = (tag) ->
        """
        <li><a href="#{tag.url}" title="#{tag.count}个话题">#{tag.name} (#{tag.count})</a></li>
        """
	each = (tagloop(tag) for tag in dian.data.tags).join('')

	end = "</ul>"
    
	write( star + each + end )

exports.hottags = hottags