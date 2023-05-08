function prefecture (){

    const pullDownButton = document.querySelectorAll('.area_btn');


    pullDownButton.forEach(function(element, index) {
      //変数取得
      const prefArea = document.getElementById('pref-area');
      const prefLists = document.querySelectorAll('.pref_list');
      const areaOverlay = document.getElementById('area-overlay');
      const prefList = document.getElementById('pref-list-' + (index+1));
      const prefs = document.querySelectorAll('.pref');


      //地域ボタンの色
      /*
      element.addEventListener('mouseover', function(){
        element.setAttribute("style", "background-color:#FFBEDA;")
      });
      element.addEventListener('mouseout', function(){
        element.removeAttribute("style")
      });
      */

      //都道府県の表示
      element.addEventListener('click', function() {
        prefArea.setAttribute("style", "display:block;")
        areaOverlay.setAttribute("style", "display:block;")
        prefLists.forEach(function(pref_lists) {
          pref_lists.setAttribute("style", "display:none;")
        });
        prefList.setAttribute("style", "display:flex;")
        //都道府県ボタンの色
        prefs.forEach(function(pref) {
          pref.addEventListener('mouseover', function(){
            pref.setAttribute("style", "background-color:#ababab;")
          })
          pref.addEventListener('mouseout', function(){
            pref.removeAttribute("style")
          })
        });
      });

      areaOverlay.addEventListener('click', function() {
        prefList.setAttribute("style", "display:none;")
        areaOverlay.setAttribute("style", "display:none;")
      });

    });


};

window.addEventListener('turbolinks:load', prefecture);

