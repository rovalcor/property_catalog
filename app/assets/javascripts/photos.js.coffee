# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
    $('#sortable').sortable(
      axis: 'y'
      items: '.item'
      cursor: 'move'

      sort: (e, ui) ->
        ui.item.addClass('active-item-shadow')
      stop: (e, ui) ->
        ui.item.removeClass('active-item-shadow')
        # highlight the row on drop to indicate an update
        ui.item.children('td').effect('highlight', {}, 1000)
      update: (e, ui) ->
        item_id = ui.item.attr('id')
        console.log(item_id)
        position = ui.item.index()
        console.log(position)
        $.ajax(
          type: 'POST'
          url: '/photos/update_order'
          dataType: 'json'
          data: { photo_id: item_id, rank_order_position: position }
        )
    )