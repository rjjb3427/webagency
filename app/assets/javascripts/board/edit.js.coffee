//= require application
//= require editor/HuskyEZCreator

oEditors = []
nhn.husky.EZCreator.createInIFrame
  oAppRef: oEditors
  elPlaceHolder: "recipe_recipe_content_attributes_content"
  sSkinURI: "/editor/index"
  fCreator: "createSEditorInIFrame"

$("#new_recipe").submit ->
  oEditors[0].exec "UPDATE_CONTENTS_FIELD", []
  try
    elClicked.form.submit()