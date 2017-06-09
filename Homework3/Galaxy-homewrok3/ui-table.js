define(["utils/utils"],function(a){var b=Backbone.View.extend({row:null,row_count:0,optionsDefault:{content:"No content available.",onchange:null,ondblclick:null,onconfirm:null,cls:"ui-table",cls_tr:""},events:{click:"_onclick",dblclick:"_ondblclick"},initialize:function(b){this.options=a.merge(b,this.optionsDefault);var c=$(this._template(this.options));this.$thead=c.find("thead"),this.$tbody=c.find("tbody"),this.$tmessage=c.find("tmessage"),this.setElement(c),this.row=this._row()},addHeader:function(a){var b=$("<th></th>");b.append(a),this.row.append(b)},appendHeader:function(){this.$thead.append(this.row),this.row=$("<tr></tr>")},add:function(a,b,c){var d=$("<td></td>");b&&d.css("width",b),c&&d.css("text-align",c),d.append(a),this.row.append(d)},append:function(a,b){this._commit(a,b,!1)},prepend:function(a,b){this._commit(a,b,!0)},get:function(a){return this.$el.find("#"+a)},del:function(a){var b=this.$tbody.find("#"+a);b.length>0&&(b.remove(),this.row_count--,this._refresh())},delAll:function(){this.$tbody.empty(),this.row_count=0,this._refresh()},value:function(a){this.before=this.$tbody.find(".current").attr("id"),void 0!==a&&(this.$tbody.find("tr").removeClass("current"),a&&this.$tbody.find("#"+a).addClass("current"));var b=this.$tbody.find(".current").attr("id");return void 0===b?null:(b!=this.before&&this.options.onchange&&this.options.onchange(a),b)},size:function(){return this.$tbody.find("tr").length},_commit:function(a,b,c){this.del(a),this.row.attr("id",a),c?this.$tbody.prepend(this.row):this.$tbody.append(this.row),b&&(this.row.hide(),this.row.fadeIn()),this.row=this._row(),this.row_count++,this._refresh()},_row:function(){return $('<tr class="'+this.options.cls_tr+'"></tr>')},_onclick:function(a){var b=this.value(),c=$(a.target).closest("tr").attr("id");""!=c&&c&&b!=c&&(this.options.onconfirm?this.options.onconfirm(c):this.value(c))},_ondblclick:function(){var a=this.value();a&&this.options.ondblclick&&this.options.ondblclick(a)},_refresh:function(){0==this.row_count?this.$tmessage.show():this.$tmessage.hide()},_template:function(a){return'<div><table class="'+a.cls+'"><thead></thead><tbody></tbody></table><tmessage>'+a.content+"</tmessage><div>"}});return{View:b}});
//# sourceMappingURL=../../../maps/mvc/ui/ui-table.js.map