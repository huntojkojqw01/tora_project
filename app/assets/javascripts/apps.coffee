$(document).on "turbolinks:load",()->
	$("#gaiyou_btn").click ()->
		$("#gaiyou").show()
		$("#review").hide()
		$("#kuchikomi").hide()
		$(this).addClass('disabled')
		$("#review_btn").removeClass('disabled')
		$("#kuchikomi_btn").removeClass('disabled')
	$("#kuchikomi_btn").click ()->
		$("#kuchikomi").show()
		$("#review").hide()
		$("#gaiyou").hide()
		$(this).addClass('disabled')
		$("#review_btn").removeClass('disabled')
		$("#gaiyou_btn").removeClass('disabled')
	$("#review_btn").click ()->
		$("#review").show()
		$("#gaiyou").hide()
		$("#kuchikomi").hide()
		$(this).addClass('disabled')
		$("#gaiyou_btn").removeClass('disabled')
		$("#kuchikomi_btn").removeClass('disabled')
	$("#app_picture").change ->		
		$(this).closest('form').find('label img').attr('src', window.URL.createObjectURL(this.files[0]))
		$(this).closest('form').find('input[type="submit"]').attr("style",'display:inline-block')
	$("#app_description").click ->
		$(this).attr("readonly", false)
	$("#app_description").change ->		
		$(this).closest('form').find('input[type="submit"]').attr("style",'display:inline-block')
	if($('#type').text().length>0)
		$('#sidebar a#'+$('#type').text()).addClass('active')
	$("#sidebar input#value").on "keyup", ()->
		$.get
			url: '/apps?value='+$(this).val()
			success: (data)->
				$('#apps').replaceWith($(data).find('#apps').clone())
				$("a.readmore").click ()->		
					$(this).closest('div.eachCategory').find('#sukoshi').toggle()
					$(this).closest('div.eachCategory').find('#zenbu').toggle()
					if($(this).text()=='もっと見る')
						$(this).text('隠す')
					else
						$(this).text('もっと見る')
			dataType: 'html'
			failure: ()->
				console.log('get apps failed')
	$("#sidebar #top").click ()->		
		$.get
			url: '/tops'
			success: (data)->
				$('#apps').replaceWith($(data).find('#apps').clone())
			dataType: 'html'
			failure: ()->
				console.log('get tops failed')
	$("a.readmore").click ()->		
		$(this).closest('div.eachCategory').find('#sukoshi').toggle()
		$(this).closest('div.eachCategory').find('#zenbu').toggle()
		if($(this).text()=='もっと見る')
			$(this).text('隠す')
		else
			$(this).text('もっと見る')