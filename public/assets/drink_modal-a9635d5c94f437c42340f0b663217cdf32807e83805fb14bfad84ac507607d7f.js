$(function(){$("#modal-2").on("change",function(){$(this).is(":checked")?$("body").addClass("modal-open"):$("body").removeClass("modal-open")}),$(".modal-fade-screen, .modal-close").on("click",function(){$(".modal-state:checked").prop("checked",!1).change()}),$(".modal-inner").on("click",function(o){o.stopPropagation()})});