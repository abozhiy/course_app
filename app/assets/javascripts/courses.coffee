$ ->
  PrivatePub.subscribe '/courses', (data, channel) ->
    console.log(data)
    course = $.parseJSON(data['course'])
    $('.new_course_value').html(course.value.toFixed(2))
