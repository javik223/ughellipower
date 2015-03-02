/*!
 * ExpressionEngine - by EllisLab
 *
 * @package		ExpressionEngine
 * @author		EllisLab Dev Team
 * @copyright	Copyright (c) 2003 - 2012, EllisLab, Inc.
 * @license		http://expressionengine.com/user_guide/license.html
 * @link		http://expressionengine.com
 * @since		Version 2.0
 * @filesource
 */

EE.publish=EE.publish||{};
EE.publish.category_editor=function(){var b=[],c=$("<div />"),e=$('<div id="cat_modal_container" />').appendTo(c),d={},j={},g=EE.BASE+"&C=admin_content&M=category_editor&group_id=",i,f,a,k={},l=$("<div />");e.css({height:"100%",padding:"0 20px 0 0",overflow:"auto"});c.dialog({autoOpen:!1,height:475,width:600,modal:!0,resizable:!1,title:EE.publish.lang.edit_category,open:function(){$(".ui-dialog-content").css("overflow","hidden");$(".ui-dialog-titlebar").focus();$("#cat_name").focus();EE.publish.file_browser.category_edit_modal()}});
$(".edit_categories_link").each(function(){var a=this.href.substr(this.href.lastIndexOf("=")+1);$(this).data("gid",a);b.push(a)});for(a=0;a<b.length;a++)d[b[a]]=$("#cat_group_container_"+[b[a]]),d[b[a]].data("gid",b[a]),j[b[a]]=$("#cat_group_container_"+[b[a]]).find(".cat_action_buttons").remove();i=function(a){d[a].text("loading...").load(g+a+"&timestamp="+ +new Date+" .pageContents table",function(){f.call(d[a],d[a].html(),!1)})};f=function(a,h){var b=$(this),d=b.data("gid"),a=$.trim(a);b.hasClass("edit_categories_link")&&
(b=$("#cat_group_container_"+d));if("<"!==a.charAt(0)&&h)return i(d);b.closest(".cat_group_container").find("#refresh_categories").show();var k=$(a),g,m,n;if(k.find("form").length){e.html(k);k=e.find("input[type=submit]");g=e.find("form");m=g.find("#cat_name");n=g.find("#cat_url_title");m.keyup(function(){m.ee_url_title(n)});var o=function(a){var h=a||$(this),a=h.serialize(),h=h.attr("action");$.ajax({url:h,type:"POST",data:a,dataType:"html",beforeSend:function(){l.html(EE.lang.loading)},success:function(a){a=
$.trim(a);c.dialog("close");"<"==a[0]?(a=$(a).find(".pageContents"),0==a.find("form").length&&l.html(a),a=a.wrap("<div />").parent(),f.call(b,a.html(),!0)):f.call(b,a,!0)},error:function(a){a=$.parseJSON(a.responseText);c.html(a.error)}});return!1};g.submit(o);var p={};p[k.remove().attr("value")]={text:EE.publish.lang.update,click:function(){o(g)}};c.dialog("open");c.dialog("option","buttons",p);c.one("dialogclose",function(){i(d)})}else j[d].clone().appendTo(b).show();return!1};a=function(a){a.preventDefault();
$(this).hide();var h=$(this).data("gid"),b=".pageContents";if($(this).hasClass("edit_cat_order_trigger")||$(this).hasClass("edit_categories_link"))b+=" table";h||(h=$(this).closest(".cat_group_container").data("gid"));$(this).hasClass("edit_categories_link")&&(k[h]=d[h].find("input:checked").map(function(){return this.value}).toArray());d[h].find("label").hide();d[h].append(l.html(EE.lang.loading));$.ajax({url:$(this).attr("href")+"&timestamp="+ +new Date+b,dataType:"html",success:function(a){var c=
"",a=$.trim(a);"<"==a.charAt(0)&&(a=$(a).find(b),c=$("<div />").append(a).html(),0==a.find("form").length&&l.html(c));f.call(d[h],c,!0)},error:function(a){a=$.parseJSON(a.responseText);$loading.text(a.error);f.call(d[h],a.error,!0)}})};$(".edit_categories_link").click(a);$(".cat_group_container a:not(.cats_done, .choose_file)").live("click",a);$(".cats_done").live("click",function(){var a=$(this).closest(".cat_group_container"),b=a.data("gid");$(".edit_categories_link").each(function(){$(this).data("gid")==
b&&$(this).show()});a.text("loading...").load(EE.BASE+"&C=content_publish&M=category_actions&group_id="+a.data("gid")+"&timestamp="+ +new Date,function(c){a.html($(c).html());$.each(k[b],function(b,c){a.find("input[value="+c+"]").attr("checked","checked")})});return!1})};Number.prototype.is_integer=String.prototype.is_integer=function(){var b=parseInt(this,10);return isNaN(b)?!1:this==b&&this.toString()==b.toString()};
EE.publish.get_percentage_width=function(b){return b.attr("data-width")&&b.attr("data-width").slice(0,-1).is_integer()?parseInt(b.attr("data-width"),10):10*Math.round(10*(b.width()/b.parent().width()))};
EE.publish.save_layout=function(){var b=0,c={},e={},d=0,j=!1,g=$("#tab_menu_tabs li.current").attr("id");$(".main_tab").show();$("#tab_menu_tabs a:not(.add_tab_link)").each(function(){if($(this).parent("li").attr("id")&&"menu_"==$(this).parent("li").attr("id").substring(0,5)){var a=$(this).parent("li").attr("id").substring(5),f=$(this).parent("li").attr("id").substring(5),g=$(this).parent("li").attr("title");d=0;visible=!0;$(this).parent("li").is(":visible")?(lay_name=a,c[lay_name]={},c[lay_name]._tab_label=
g):(j=!0,visible=!1);$("#"+f).find(".publish_field").each(function(){var a=$(this),b=this.id.replace(/hold_field_/,""),a=EE.publish.get_percentage_width(a),f=$("#sub_hold_field_"+b+" .markItUp ul li:eq(2)");100<a&&(a=100);f="undefined"!==f.html()&&"none"!==f.css("display")?!0:!1;a={visible:"none"===$(this).css("display")||!1===visible?!1:!0,collapse:"none"===$("#sub_hold_field_"+b).css("display")?!0:!1,htmlbuttons:f,width:a+"%"};!0===visible?(a.index=d,c[lay_name][b]=a,d+=1):e[b]=a});!0===visible&&
b++}});if(!0==j){var i,f,a=0;for(darn in c){f=darn;for(i in c[f])c[f][i].index>a&&(a=c[f][i].index);break}$.each(e,function(){this.index=++a});jQuery.extend(c[f],e)}EE.tab_focus(g.replace(/menu_/,""));0===b?$.ee_notice(EE.publish.lang.tab_count_zero,{type:"error"}):0===$("#layout_groups_holder input:checked").length?$.ee_notice(EE.publish.lang.no_member_groups,{type:"error"}):$.ajax({type:"POST",dataType:"json",url:EE.BASE+"&C=content_publish&M=save_layout",data:"XID="+EE.XID+"&json_tab_layout="+
encodeURIComponent(JSON.stringify(c))+"&"+$("#layout_groups_holder input").serialize()+"&channel_id="+EE.publish.channel_id,success:function(a){"success"===a.messageType?$.ee_notice(a.message,{type:"success"}):"failure"===a.messageType&&$.ee_notice(a.message,{type:"error"})}})};
EE.publish.remove_layout=function(){if(0===$("#layout_groups_holder input:checked").length)return $.ee_notice(EE.publish.lang.no_member_groups,{type:"error"});$.ajax({type:"POST",url:EE.BASE+"&C=content_publish&M=save_layout",data:"XID="+EE.XID+"&json_tab_layout={}&"+$("#layout_groups_holder input").serialize()+"&channel_id="+EE.publish.channel_id+"&field_group="+EE.publish.field_group,success:function(){$.ee_notice(EE.publish.lang.layout_removed+' <a href="javascript:location=location">'+EE.publish.lang.refresh_layout+
"</a>",{duration:0,type:"success"});return!0}});return!1};EE.publish.change_preview_link=function(){$select=$("#layout_preview select");$link=$("#layout_group_preview");base=$link.attr("href").split("layout_preview")[0];$link.attr("href",base+"layout_preview="+$select.val());$.ajax({url:EE.BASE+"&C=content_publish&M=preview_layout",type:"POST",dataType:"json",data:{XID:EE.XID,member_group:$select.find("option:selected").text()}})};
EE.date_obj_time=function(){var b=new Date,c=b.getHours(),b=b.getMinutes(),e="";10>b&&(b="0"+b);"us"==EE.date.format&&(e=12>c?" AM":" PM",0!=c&&(c=(c+11)%12+1));10>c&&(c="0"+c);return" '"+c+":"+b+e+"'"}();file_manager_context="";
function disable_fields(b){var c=$(".main_tab input, .main_tab textarea, .main_tab select, #submit_button"),e=$("#submit_button"),d=$("#holder").find("a");b?(disabled_fields=c.filter(":disabled"),c.attr("disabled",!0),e.addClass("disabled_field"),d.addClass("admin_mode"),$("#holder div.markItUp, #holder p.spellcheck").each(function(){$(this).before('<div class="cover" style="position:absolute;width:98%;height:50px;z-index:9999;"></div>').css({})}),$(".contents, .publish_field input, .publish_field textarea").css("-webkit-user-select",
"none")):(c.removeAttr("disabled"),e.removeClass("disabled_field"),d.removeClass("admin_mode"),$(".cover").remove(),disabled_fields.attr("disabled",!0),$(".contents, .publish_field input, .publish_field textarea").css("-webkit-user-select","auto"))}
$(document).ready(function(){var b,c;$("#layout_group_submit").click(function(){EE.publish.save_layout();return!1});$("#layout_group_remove").click(function(){EE.publish.remove_layout();return!1});$("#layout_preview select").change(function(){EE.publish.change_preview_link()});$("a.reveal_formatting_buttons").click(function(){$(this).parent().parent().children(".close_container").slideDown();$(this).hide();return!1});$("#write_mode_header .reveal_formatting_buttons").hide();$("a.glossary_link").click(function(){$(this).parent().siblings(".glossary_content").slideToggle("fast");
$(this).parent().siblings(".smileyContent .spellcheck_content").hide();return!1});!0===EE.publish.smileys&&($("a.smiley_link").toggle(function(){$(this).parent().siblings(".smileyContent").slideDown("fast",function(){$(this).css("display","")})},function(){$(this).parent().siblings(".smileyContent").slideUp("fast")}),$(this).parent().siblings(".glossary_content, .spellcheck_content").hide(),$(".glossary_content a").click(function(){var b=$(this).closest(".publish_field"),a=b.attr("id").replace("hold_field_",
"field_id_");b.find("#"+a).insertAtCursor($(this).attr("title"));return!1}));if(EE.publish.autosave&&EE.publish.autosave.interval){var e=!1;c=function(){e||(e=!0,setTimeout(b,1E3*EE.publish.autosave.interval))};b=function(){var b;1===$("#tools:visible").length?c():(b=$("#publishForm").serialize(),$.ajax({type:"POST",dataType:"json",url:EE.BASE+"&C=content_publish&M=autosave",data:b,success:function(a){a.error?console.log(a.error):a.success?(a.autosave_entry_id&&$("input[name=autosave_entry_id]").val(a.autosave_entry_id),
$("#autosave_notice").text(a.success)):console.log("Autosave Failed");e=!1}}))};var d=$("textarea, input").not(":password,:checkbox,:radio,:submit,:button,:hidden"),j=$("select, :checkbox, :radio, :file");d.bind("keypress change",c);j.bind("change",c)}if(EE.publish.pages){var d=$("#pages__pages_uri"),g=EE.publish.pages.pagesUri;d.val()||d.val(g);d.focus(function(){this.value===g&&$(this).val("")}).blur(function(){""===this.value&&$(this).val(g)})}void 0!==EE.publish.markitup.fields&&$.each(EE.publish.markitup.fields,
function(b){$("#"+b).markItUp(mySettings)});EE.publish.setup_writemode=function(){var b=$("#write_mode_writer"),a=$("#write_mode_textarea"),c,d,e;a.markItUp(myWritemodeSettings);$(window).resize(function(){var a=$(this).height()-117;b.css("height",a+"px").find("textarea").css("height",a-67-17+"px")}).triggerHandler("resize");$(".write_mode_trigger").overlay({closeOnEsc:!1,closeOnClick:!1,top:"center",target:"#write_mode_container",mask:{color:"#262626",loadSpeed:200,opacity:0.85},onBeforeLoad:function(){var b=
this.getTrigger()[0].id;e=b.match(/^id_\d+$/)?$("#field_"+b):$("#"+b.replace(/id_/,""));c=e.getSelectedRange();a.val(e.val())},onLoad:function(){a.focus();a.createSelection(c.start,c.end);var b=this;b.getClosers().unbind("click").click(function(a){a.srcElement=this;b.close(a)})},onBeforeClose:function(b){b=$(b.srcElement).closest(".close");b.hasClass("publish_to_field");b.hasClass("publish_to_field")&&(d=a.getSelectedRange(),e.val(a.val()),e.createSelection(d.start,d.end));e.focus()}})};!0===EE.publish.show_write_mode&&
EE.publish.setup_writemode();$(".hide_field span").click(function(){var b=$(this).parent().parent().attr("id").substr(11),a=$("#hold_field_"+b),b=$("#sub_hold_field_"+b);"block"==b.css("display")?(b.slideUp(),a.find(".ui-resizable-handle").hide(),a.find(".field_collapse").attr("src",EE.THEME_URL+"images/field_collapse.png")):(b.slideDown(),a.find(".ui-resizable-handle").show(),a.find(".field_collapse").attr("src",EE.THEME_URL+"images/field_expand.png"));return!1});$(".close_upload_bar").toggle(function(){$(this).parent().children(":not(.close_upload_bar)").hide();
$(this).children("img").attr("src",EE.THEME_URL+"publish_plus.png")},function(){$(this).parent().children().show();$(this).children("img").attr("src",EE.THEME_URL+"publish_minus.gif")});$(".ping_toggle_all").toggle(function(){$("input.ping_toggle").each(function(){this.checked=!1})},function(){$("input.ping_toggle").each(function(){this.checked=!0})});EE.user.can_edit_html_buttons&&($(".markItUp ul").append('<li class="btn_plus"><a title="'+EE.lang.add_new_html_button+'" href="'+EE.BASE+"&C=myaccount&M=html_buttons&id="+
EE.user_id+'">+</a></li>'),$(".btn_plus a").click(function(){return confirm(EE.lang.confirm_exit,"")}));$(".markItUpHeader ul").prepend('<li class="close_formatting_buttons"><a href="#"><img width="10" height="10" src="'+EE.THEME_URL+'images/publish_minus.gif" alt="Close Formatting Buttons"/></a></li>');$(".close_formatting_buttons a").toggle(function(){$(this).parent().parent().children(":not(.close_formatting_buttons)").hide();$(this).parent().parent().css("height","13px");$(this).children("img").attr("src",
EE.THEME_URL+"images/publish_plus.png")},function(){$(this).parent().parent().children().show();$(this).parent().parent().css("height","auto");$(this).children("img").attr("src",EE.THEME_URL+"images/publish_minus.gif")});$(".tab_menu li:first").addClass("current");!0==EE.publish.title_focus&&$("#title").focus();"new"==EE.publish.which&&$("#title").bind("keyup blur",function(){$("#title").ee_url_title($("#url_title"))});"n"==EE.publish.versioning_enabled?$("#revision_button").hide():$("#versioning_enabled").click(function(){$(this).attr("checked")?
$("#revision_button").show():$("#revision_button").hide()});EE.publish.category_editor();if(EE.publish.hidden_fields){EE._hidden_fields=[];var i=$("input");$.each(EE.publish.hidden_fields,function(b){EE._hidden_fields.push(i.filter("[name="+b+"]")[0])});$(EE._hidden_fields).after('<p class="hidden_blurb">This module field only shows in certain circumstances. This is a placeholder to let you define it in your layout.</p>')}});