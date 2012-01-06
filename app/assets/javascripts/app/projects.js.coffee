$ ->
  
  $('.show-task-description').click ->
    $(this).parent().parent().siblings().toggle()
    $(this).text if $(this).text().indexOf('hide') < 0 then 'hide full description >' else 'show full description >'
    
    false
    
    
# Check that the current project has completed cloning
$.extend
  check_project_cloning: ->
    
    getProject = ->
      $.getJSON location, (data) ->
        if data.cloned_at == null
          time_diff = new Date().getTime() - Date.parse(data.created_at)
          
          # older than 15 minutes and cloning has still not completed.
          if time_diff > 900
            msg = "Cloning seems to have failed as it has been running for over 15 minutes now."
            $('#clone-msg').addClass('error').removeClass('info').text msg
          else
            setTimeout getProject, 5000
        else
          window.location.reload false
    
    setTimeout getProject, 5000