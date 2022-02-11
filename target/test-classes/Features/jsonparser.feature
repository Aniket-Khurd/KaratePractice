Feature: json parser demo

  Scenario: simple json parsing
    * def jsonObject =
      """
      [
      {
      "name" : "Aniket",
      "city" : "Daund"
      }
      {
      "name" : "Prakash",
      "city" : "Pune"
      }
      ]
      """
    * print jsonObject
    * print jsonObject[0]
    * print jsonObject[0].name
    * print jsonObject[1].name + ", " + jsonObject[1].city

  Scenario: complex json parsing
    * def jsonObject =
      """
      {"menu": {
      "id": "file",
      "value": "File",
      "popup": {
      "menuitem": [
        {"value": "New", "onclick": "CreateNewDoc()"},
        {"value": "Open", "onclick": "OpenDoc()"},
        {"value": "Close", "onclick": "CloseDoc()"}
      ]
      }
      }
      }
      """
      * print jsonObject
      * print jsonObject.menu
      * print jsonObject.menu.id
      * print jsonObject.menu.value
      * print jsonObject.menu.popup
      * print jsonObject.menu.popup.menuitem
      * print jsonObject.menu.popup.menuitem[0].value
      * print jsonObject.menu.popup.menuitem[0].onclick
      * print jsonObject.menu.popup.menuitem[2].value + ", " + jsonObject.menu.popup.menuitem[2].onclick
