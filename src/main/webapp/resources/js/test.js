$(document).ready(function(){
    var loadPosts = function(){
        //데이터를 ajax로 불러옴
        $.ajax({
            url:'https://shielded-fortress-32957.herokuapp.com/php/load.php',
            data: { },
            dataType: 'jsonp', 
            success: function(data){
                if(data.result == "success"){
            //음식
            var ui = $('<ui data-role="listview" data-inset="true" data-filter="true" class="ui-listview ui-listview-inset ui-corner-all ui-shadow"></ui').appendTo($('.content-primary'));
            $('<li data-role="list-divider" role="heading" class="ui-li-divider ui-bar-inherit ui-first-child"></li>').text('Foods').appendTo(ui);
            //음료
            var ui2 = $('<br><ui data-role="listview" data-inset="true" data-filter="true" class="ui-listview ui-listview-inset ui-corner-all ui-shadow"></ui').appendTo($('.content-primary'));
            $('<li data-role="list-divider" role="heading" class="ui-li-divider ui-bar-inherit ui-first-child"></li>').text('Drink').appendTo(ui2);
                    var cnt = data.data.length;
                    for(var i = 0; i < cnt; i++){
                        var lev = data.data[i].lev;
                        var id = data.data[i].id;
                        var food_name = data.data[i].food_name;
                        var price = data.data[i].price;
                        var size = data.data[i].size;
                        var price = data.data[i].price;
                        var img = data.data[i].img;
                        if(lev == 1){
                        var item = $('<li class="ui-li-has-thumb ui-last-child" style:"margin-top:0px;margin-bottom:0px"></li>').attr('data-id', id).addClass(ui);
                        var itemText = $('<li data-transition="slide" class="ui-btn ui-btn-icon-right ui-icon-carat-r"></li>').appendTo(item);
                        //이미지불러오기
                            $('<img style="height:100%; width:90px; margin-top:3px; margin-left:5px;"></img>').attr('src','https://shielded-fortress-32957.herokuapp.com/php/image/'+img).appendTo(itemText);
                        //이까지
                        $('<h3 style="display:inline"></h3>').text(food_name).appendTo(itemText);
                       var itemMenu = $('<br><p style="display:inline"><font color="red" >Price : '+price+'원</font></p>').appendTo(itemText);
                        $('<br><p style="display:inline"></p>').text(size).appendTo(itemText);
                        if(sessionStorage.mpsn == "admin"){        
                            $('<button></button>').addClass('mainBtnDel').text('삭제하기').appendTo(itemMenu)   
                        }
                        else if(sessionStorage.mpsn == "caddie"){  
                            var form = $('<form class=ajax'+food_name+' style="display:inline;"</form>').appendTo(itemMenu);
                            var select = $('<select name="order_qtt"></select>').appendTo(form);   
                            var option = $('<option value="1">1</option><option value = "2">2</option><option value="3">3</option><option value="4">4</option>') .appendTo(select);
                            var cfood_name = $('<input type="hidden" name="food_name" value="'+food_name+'"></input>').appendTo(form);
                            var price= $('<input type="hidden" name="price" value="'+price+'"></input>').appendTo(form);
                            var cid = $('<input type="hidden" name="id" value="'+sessionStorage.user+'"></input>').appendTo(form);
                            var input = $('<input type="button" value="주문" onClick="send(this.form);">').appendTo(form);
                        }
                        item.appendTo($(ui));
                    }else if(lev == 2){
                        var item2 = $('<li class="ui-li-has-thumb ui-last-child"></li>').attr('data-id', id).addClass(ui2);
                        var itemText2 = $('<li data-transition="slide" class="ui-btn ui-btn-icon-right ui-icon-carat-r"></li>').appendTo(item2);
                                   //이미지불러오기
                        $('<img style="height:100%; width:90px; margin-top:3px; margin-left:5px;"></img>').attr('src','https://shielded-fortress-32957.herokuapp.com/php/image/'+img).appendTo(itemText2);
                        //이까지
                        $('<h3 style="display:inline"></h3>').text(food_name).appendTo(itemText2);
                       var itemMenu2 = $('<br><p style="display:inline"><font color="red" >Price : '+price+'원</font></p>').appendTo(itemText2);
                        $('<br><p style="display:inline"></p>').text(size).appendTo(itemText2);
                    if(sessionStorage.mpsn == "admin"){        
                            $('<button></button>').addClass('mainBtnDel').text('삭제하기').appendTo(itemMenu2)   
                        }else if(sessionStorage.mpsn == "caddie"){  
                            var form = $('<form class=ajax'+food_name+' style="display:inline ;"</form>').appendTo(itemMenu2);
                            var select = $('<select name="order_qtt"></select>').appendTo(form);   
                            var option = $('<option value="1">1</option><option value = "2">2</option><option value="3">3</option><option value="4">4</option>') .appendTo(select);
                            var cfood_name = $('<input type="hidden" name="food_name" value="'+food_name+'"></input>').appendTo(form);
                            var price= $('<input type="hidden" name="price" value="'+price+'"></input>').appendTo(form);
                            var cid = $('<input type="hidden" name="id" value="'+sessionStorage.user+'"></input>').appendTo(form);
                            var input = $('<input type="button" value="주문" onClick="send(this.form);">').appendTo(form);
                        }
                        item2.appendTo($(ui2));
                    }
                    }
                } else{
                }
            },
            error: function(){
                window.alert('오류가 발생하였습니다.iiiiii')
            }
        });
       }
        loadPosts(); 
});