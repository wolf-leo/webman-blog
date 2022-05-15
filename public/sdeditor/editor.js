/**
 * 作用：SDCMS富媒体编辑器
 * 官网：Https://www.sdcms.cn
 * 作者：IT平民
 * ===========================================================================
 * 您可以使用本软件用于商业目的，但是您必须保留SDCMS的版权，并且确保代码开源；
 * 未经授权不允许对本程序代码以任何形式任何目的的再发布。
 * ===========================================================================
 **/

!function (a) {
    if (a.fn.editor) return !1;
    var b = 0;
    a.fn.editor = function (c) {
        var e, f, g, h, k, l, m, n, o, p, q, r, s, t, u, v, w, x, d = "ui_editor_id_" + b;
        return void 0 == a(this[0]).attr("id") ? a(this[0]).attr("id", d) : d = this.get(0).id, this.getHtml = function () {
            return this[0].getHtml()
        }, this.setHtml = function (a) {
            return this[0].setHtml(a)
        }, this.addHtml = function (a) {
            return this[0].addHtml(a)
        }, this.insertHtml = function (a) {
            return this[0].insertHtml(a)
        }, this.async = function () {
            return this[0].async()
        }, this.mode = function (a) {
            return this[0].changeMode(a)
        }, this.editorPath = function () {
            var b = "";
            return a("script[src*=editor]").each(function () {
                var a = this.src;
                return a.match(/editor[^\/]*\.js/i) ? (b = a.replace(/[\?#].*$/, "").replace(/(^|[\/\\])[^\/]*$/, "$1"), !1) : void 0
            }), b
        }, this.loadCss = function (b) {
            0 == a("#sdcms-editor").length && a("head").append('<link id="sdcms-editor" rel="stylesheet" type="text/css" href="' + b + "css/editor.css?v=" + Math.random() + '" />')
        }, e = this.editorPath(), this.loadCss(e), f = navigator.userAgent.toLowerCase(), g = f.match(/(iPhone|Android|mobile)/i) ? !0 : !1, h = !(f.indexOf("applewebkit") > -1 || f.indexOf("firefox") > -1), k = {a: "link", td: "table", pre: "pre", p: "p", div: "div"}, l = {
            img: "image",
            audio: "music",
            video: "video"
        }, m = ["宋体", "微软雅黑", "楷体", "黑体", "隶书", "Pingfang SC", "arial", "arial black", "verdana", "impact"], n = ["12", "13", "14", "15", "16", "18", "20", "22", "24", "26", "28", "30", "36"], o = [{t: "左对齐", c: "justifyleft"}, {t: "居中", c: "justifycenter"}, {t: "右对齐", c: "justifyright"}, {t: "两端对齐", c: "justifyfull"}], p = [{t: "项目列表", c: "InsertUnorderedList"}, {
            t: "数字列表",
            c: "InsertOrderedList"
        }], q = ["FFFFFF", "333333", "FF0100", "FFDA00", "A4E143", "38D9F0", "4EA8EE", "9570E7", "F3F3F3", "CCCCCC", "FEF3F1", "FEFCDA", "EDF6E8", "E6FBFA", "EBF4FC", "F1EDF7", "DDDDDD", "A5A5A5", "FCD5D0", "F9EDA6", "D4E9D7", "C8E6EA", "CCE0F2", "DAD6EA", "888888", "494949", "EE7976", "E7B323", "99C191", "79C6CE", "6EAAD7", "9D8EC2", "41464C", "000000", "BF1A1E", "AD720E", "1C7232", "1C7892", "18439D", "521B78"], r = ["FFFFFF", "FACCCC", "FFEBCC", "CDE8CC", "CCE0F5", "EBD6FF", "F3F3F3", "F06665", "FFC266", "FFFF66", "66A3E0", "C285FF"], s = [{
            t: "段落",
            c: "p",
            s: 16
        }, {t: "标题1", c: "h1", s: 28}, {t: "标题2", c: "h2", s: 24}, {t: "标题3", c: "h3", s: 20}, {t: "引用", c: "pre", s: 16}], t = {key: "_editor_page_", html: '<hr class="ui_editor_pagebreak" noshade="noshade" contentEditable="false">'}, u = ["meta", "script", "object", "form"], v = "V1.1.1", w = {
            toolbar: "full",
            mode: "html",
            height: 300,
            value: "",
            pagebreak: "",
            upload: "",
            file: "file",
            save: "",
            auto: !0,
            params: {},
            hide: !0,
            arrow: !1,
            autosave: !0,
            autofocus: !1,
            plug: {}
        }, x = a.extend({}, w, c), x.height = "auto" == x.height ? "" : x.height, x.arrow = "full" == x.toolbar ? !1 : x.arrow, x.height = "min" == x.toolbar ? 250 : x.height, t.key = "" != x.pagebreak ? x.pagebreak : t.key, this.each(function () {
            var c, f, w, y, z, A, B, C, D, E, F, G;
            if (b++, c = this, c.cmd = c.bookmark = c.actname = c.parent = c.timer = c.table = "", c.isfullscreen = c.isPop = c.isDrag = !1, c.source = a(c), c.values = x.value, c.hide = x.hide, c.mode = x.mode, c.height = x.height, c.upload = x.upload, c.file = x.file, c.saveurl = x.save, c.autoupload = x.auto, c.params = x.params, c.autosave = x.autosave, c.headline = x.headline, c.toolbar = x.toolbar, c.fontfamily = x.fontfamily, c.fontsize = x.fontsize, c.color = x.color, c.bgcolor = x.bgcolor, c.arrow = x.arrow, c.pagebreak = t, c.plug = x.plug, c.autofocus = x.autofocus, c.fileList = [], c.filekey = [], a(c).css("display", "none"), f = a(c).attr("name") || a(c).attr("class") || d, c.isTextarea = !0, "textarea" != a(c)[0].tagName.toLowerCase() && (w = a('<textarea name="' + f + '"" style="display:none;border:0;height:0;"></textarea>'), a(c).after(w), c.source = w, c.isTextarea = !1), c.toolbars = {
                full: {
                    left: ["headline", "fontfamily", "fontsize", "fontcolor", "bgcolor", "|", "justifyleft", "justifycenter", "justifyright", "justifyfull", "|", "link", "unlink", "subscript", "superscript", "|", "image", "music", "video", "upload", "br", "bold", "italic", "underline", "strikethrough", "removeformat", "|", "InsertOrderedList", "InsertUnorderedList", "indent", "outdent", "|", "emoji", "table", "line", "pagebreak", "|", "code", "auto", "date", "down"],
                    right: ["html", "fullscreen", "br", "preview", "about"]
                },
                admin: {left: ["headline", "fontfamily", "fontsize", "fontcolor", "bgcolor", "|", "bold", "italic", "underline", "strikethrough", "|", "list", "align", "indent", "outdent", "|", "subscript", "superscript", "link", "unlink", "|", "emoji", "table", "image", "upload", "down", "line", "pagebreak", "auto"], right: ["html", "fullscreen", "about"]},
                mini: {left: ["headline", "fontcolor", "bold", "italic", "underline", "strikethrough", "list", "align", "|", "link", "unlink", "image", "emoji"], right: ["html", "fullscreen", "about"]}
            }, c.menu = c.toolbars[c.toolbar] ? c.toolbars[c.toolbar] : c.toolbars.full, "object" == typeof x.toolbar && (c.menu = x.toolbar), c.button = {
                headline: {
                    name: "标题", arrow: !0, html: function () {
                        var a = c.headline || s, b = '<ul class="ui_editor_ul">';
                        for (i = 0; i < a.length; i++) b += '<li data-cmd="' + a[i].c + '" style="font-size:' + a[i].s + "px;" + (a[i].c.indexOf("h") > 0 ? "font-weight:bold;" : "") + '">' + a[i].t + "</li>";
                        return b += "</ul>"
                    }, even: function () {
                        c.editor.find(".ui_editor_ul li").click(function () {
                            var b = a(this).data("cmd");
                            c.loadBookmark(), c.exec("FormatBlock", b), c.hidePanel()
                        })
                    }
                }, fontfamily: {
                    name: "字体", arrow: !0, html: function () {
                        var a = c.fontfamily || m, b = '<ul class="ui_editor_ul">';
                        for (i = 0; i < a.length; i++) b += '<li data-size="' + a[i] + '" style="font-family:' + a[i] + '">' + a[i] + "</li>";
                        return b += "</ul>"
                    }, even: function () {
                        c.editor.find(".ui_editor_ul li").click(function () {
                            var e, b = a(this).data("size"), d = "fontfamily";
                            c.actname = d, c.loadBookmark(), e = a("<span/>", {text: c.getSel()}).css("font-family", b).prop("outerHTML"), c.insertHtml(e), c.hidePanel(), c.active("fontfamily", 0)
                        })
                    }
                }, fontsize: {
                    name: "字体大小", arrow: !0, html: function () {
                        var a = c.fontsize || n, b = '<div class="ui_editor_ul_wrap"><ul class="ui_editor_ul">';
                        for (i = 0; i < a.length; i++) b += '<li data-size="' + a[i] + '" style="font-size:' + a[i] + 'px">' + a[i] + "px</li>";
                        return b += "</ul></div>"
                    }, even: function () {
                        c.editor.find(".ui_editor_ul li").click(function () {
                            var e, b = a(this).data("size"), d = "fontsize";
                            c.actname = d, c.loadBookmark(), e = a("<span/>", {text: c.getSel()}).css("font-size", b + "px").prop("outerHTML"), c.insertHtml(e), c.hidePanel(), c.active("fontsize", 0)
                        })
                    }
                }, fontcolor: {
                    name: "字体颜色", arrow: !0, html: function () {
                        var a = c.color || q, b = '<div class="ui-editor-color">';
                        for (b += '  <div class="ui-editor-color-box">', i = 0; i < a.length; i++) b += '<div class="ui-editor-color-item" data-color="' + a[i] + '"><span><i style="background:#' + a[i] + '"></i></span></div>';
                        return b += "  </div>", b += '  <div class="ui-editor-color-self"><span><i class="ui-editor-icon-hash"></i></span><input type="text" maxlength="6"><button type="button" data-type="clear">清空</button><button type="button" data-type="confirm">确定</button></div>', b += "</div>"
                    }, even: function () {
                        c.colorEven("fontcolor", "forecolor")
                    }
                }, bgcolor: {
                    name: "背景颜色", arrow: !0, html: function () {
                        return c.button.fontcolor.html()
                    }, even: function () {
                        c.colorEven("bgcolor", "backcolor")
                    }
                }, bold: {name: "加粗 Ctrl+B"}, italic: {name: "斜体 Ctrl+I"}, underline: {name: "下划线 Ctrl+U"}, strikethrough: {name: "删除线"}, list: {
                    name: "列表", icon: "InsertUnorderedList", arrow: !0, html: function () {
                        var a = p, b = '<ul class="ui_editor_ul ui_editor_list">';
                        for (i = 0; i < a.length; i++) b += '<li data-cmd="' + a[i].c + '" ' + (c.actname == a[i].c ? 'class="active"' : "") + '><i class="ui-editor-icon-' + a[i].c + '"></i>' + a[i].t + "</li>";
                        return b += "</ul>"
                    }, even: function () {
                        c.editor.find(".ui_editor_ul li").click(function () {
                            var b = a(this).data("cmd");
                            c.actname = b, c.exeCmd(b), c.hidePanel(), c.active("InsertUnorderedList", 0)
                        })
                    }
                }, InsertUnorderedList: {name: "项目列表"}, InsertOrderedList: {name: "数字列表"}, indent: {name: "增加缩进"}, outdent: {name: "减少缩进"}, align: {
                    name: "对齐", icon: "justifyleft", arrow: !0, html: function () {
                        var a = o, b = '<ul class="ui_editor_ul ui_editor_align">';
                        for (i = 0; i < a.length; i++) b += '<li data-cmd="' + a[i].c + '" ' + (c.actname == a[i].c ? 'class="active"' : "") + '><i class="ui-editor-icon-' + a[i].c + '"></i>' + a[i].t + "</li>";
                        return b += "</ul>"
                    }, even: function () {
                        c.editor.find(".ui_editor_align li").click(function () {
                            var b = a(this).data("cmd");
                            c.actname = b, c.exeCmd(b), c.hidePanel(), c.active("justifyleft", 0)
                        })
                    }
                }, justifyleft: {name: "左对齐"}, justifycenter: {name: "居中"}, justifyright: {name: "右对齐"}, justifyfull: {name: "两端对齐"}, subscript: {name: "下标"}, superscript: {name: "上标"}, link: {
                    name: "链接", dialog: function () {
                        var b, d, e, f, g;
                        for (a(".ui-dialog").remove(), b = url = title = target = "", d = c.getParent("a"), e = "添加链接", d.length > 0 && (b = d.html() || "", url = d.attr("href") || "", title = d.attr("title") || "", target = d.attr("target") || "", e = "编辑链接"), "" == b && (b = c.getSel(), target = " checked"), target = "" != target ? "checked" : "", f = [{n: "文本", e: "text", v: b}, {n: "链接", e: "url", v: url}, {
                            n: "描述",
                            e: "title",
                            v: title
                        }], g = "", i = 0; i < f.length; i++) g += '<div class="ui-editor-form-group">', g += '    <div class="ui-editor-input-group">', g += '        <span class="ui-editor-before">' + f[i].n + "</span>", g += '        <input type="text" id="editor_link_' + f[i].e + '" class="ui-editor-form-ip ' + (1 == i ? "ui-editor-radius-none" : "ui-editor-radius-left-none") + '" value="' + f[i].v + '">', "url" == f[i].e && (g += '        <span class="ui-editor-after"><label class="ui-editor-checkbox"><input type="checkbox" id="editor_link_new" value="1" ' + target + "><i></i>新窗</label></span>"), g += "    </div>", g += "</div>";
                        c.dialog({
                            title: e, text: g, width: "400px", ok: function (b) {
                                var e = a("#editor_link_text").val(), f = a("#editor_link_url").val(), g = a("#editor_link_title").val(), h = a("#editor_link_new").is(":checked"), i = h ? "_blank" : "";
                                return "" == e ? (c.msg({id: "#editor_link_text", msg: "文本不能为空"}), void 0) : c.input(e) ? (c.msg({id: "#editor_link_text", msg: "文本设置错误"}), void 0) : "" != f && c.input(f) ? (c.msg({id: "#editor_link_url", msg: "网址设置错误"}), void 0) : "" != g && c.input(g, "text") ? (c.msg({
                                    id: "#editor_link_title",
                                    msg: "描述设置错误"
                                }), void 0) : (c.loadBookmark(), 0 === d.length && (e ? c.insertHtml('<a href="#editor_link_url">' + e + "</a>") : c._exec("createlink", "#editor_link_url"), d = a('a[href$="#editor_link_url"]', c.doc)), d.attr("href", f), c.setAttr(d, "" != i, "target", i), c.setAttr(d, "" != g, "title", g), d.html(e), c.tipsHide(), b.close(), void 0)
                            }
                        })
                    }
                }, unlink: {
                    name: "取消链接", even: function () {
                        if (!h) {
                            var a = c.focusNode();
                            do if ("A" == a.tagName) {
                                c.removeNode(a);
                                break
                            } while (a = a.parentNode)
                        }
                    }
                }, removeformat: {name: "清除格式"}, line: {
                    name: "水平线", click: function () {
                        c.insertHtml("<hr>")
                    }
                }, pagebreak: {
                    name: "分页符", click: function () {
                        c.insertHtml(c.pagebreak.html)
                    }
                }, music: {
                    name: "音乐", dialog: function () {
                        var b, d, e, f, g, h;
                        for (a(".ui-dialog").remove(), b = autoplay = "", d = c.parent, e = c.isSdcms("audio", d), f = "添加音乐", d.length > 0 && e && (b = d.attr("src") || "", autoplay = d.attr("autoplay") || "", f = "编辑音乐"), "" == b && (autoplay = "autoplay"), g = "", g += '<div class="ui-editor-form-group">', g += '    <div class="ui-editor-input-group">', g += '        <span class="ui-editor-before">网址</span>', g += '        <input type="text" id="editor_music_url" class="ui-editor-form-ip ui-editor-radius' + ("" == c.upload ? "-left" : "") + '-none" value="' + b + '">', "" != c.upload && (g += '        <span class="ui-editor-after" id="ui_editor_file_upload">上传</span>'), g += "    </div>", g += "</div>", g += '<div class="ui-editor-form-group">', g += '    <div class="ui-editor-input-group">', g += '        <span class="ui-editor-before">播放</span>', g += '        <select id="editor_music_auto" class="ui-editor-form-ip ui-editor-radius-left-none">', h = [{
                            t: "自动播放",
                            v: "autoplay"
                        }, {t: "手动播放", v: ""}], i = 0; i < h.length; i++) g += '        <option value="' + h[i].v + '" ' + (autoplay == h[i].v ? " selected" : "") + ">" + h[i].t + "</option>";
                        g += "        </select>", g += "    </div>", g += "</div>", c.dialog({
                            title: f, text: g, width: "400px", ok: function (b) {
                                var f = a("#editor_music_url").val(), g = a("#editor_music_auto").val();
                                return "" == f ? (c.msg({id: "#editor_music_url", msg: "网址不能为空"}), void 0) : c.input(f) ? (c.msg({id: "#editor_music_url", msg: "网址设置错误"}), void 0) : "" != g && c.input(g, "en") ? (c.msg({
                                    id: "#editor_music_auto",
                                    msg: "播放设置错误"
                                }), void 0) : (c.loadBookmark(), e || (c.insertHtml('<p align="center"><audio src="#editor_temp_url" controls="controls" preload="true"></audio></p>'), d = a('audio[src$="#editor_temp_url"]', c.doc)), d.attr("src", f), c.setAttr(d, "autoplay" == g, "autoplay", "autoplay"), c.tipsHide(), b.close(), void 0)
                            }
                        })
                    }, even: function () {
                        if ("" != c.upload) {
                            a("#ui_editor_file_upload").prepend('<input type="file" tabindex="-1" accept=".mp3,.m4a" class="ui-editor-upload">');
                            var b = a(".ui-editor-upload");
                            b.change(function () {
                                var d = b[0].files[0];
                                null != d && c.ajaxUpload({
                                    data: d, action: "music", success: function (b) {
                                        a("#editor_music_url").val(b.msg)
                                    }
                                })
                            })
                        }
                    }
                }, video: {
                    name: "视频", dialog: function () {
                        var b, d, e, f, g, h;
                        for (a(".ui-dialog").remove(), b = width = height = autoplay = "", d = c.parent, e = c.isSdcms("video", d), f = "添加视频", d.length > 0 && e && (b = d.attr("src") || "", width = d.attr("width") || "", height = d.attr("height") || "", autoplay = d.attr("autoplay") || "", f = "编辑视频"), "" == b && (autoplay = "autoplay"), g = "", g += '<div class="ui-editor-form-group">', g += '    <div class="ui-editor-input-group">', g += '        <span class="ui-editor-before">网址</span>', g += '        <input type="text" id="editor_video_url" class="ui-editor-form-ip ui-editor-radius' + ("" == c.upload ? "-left" : "") + '-none" value="' + b + '">', "" != c.upload && (g += '        <span class="ui-editor-after" id="ui_editor_file_upload">上传</span>'), g += "    </div>", g += "</div>", g += '<div class="ui-editor-form-group">', g += '    <div class="ui-editor-input-group">', g += '        <span class="ui-editor-before">播放</span>', g += '        <select id="editor_video_auto" class="ui-editor-form-ip ui-editor-radius-left-none">', h = [{
                            t: "自动播放",
                            v: "autoplay"
                        }, {t: "手动播放", v: ""}], i = 0; i < h.length; i++) g += '        <option value="' + h[i].v + '" ' + (autoplay == h[i].v ? " selected" : "") + ">" + h[i].t + "</option>";
                        g += "        </select>", g += "    </div>", g += "</div>", g += '<div class="ui-editor-form-group">', g += '    <div class="ui-editor-input-group">', g += '        <span class="ui-editor-before">宽度</span><input type="text" id="editor_video_width" class="ui-editor-form-ip ui-editor-radius-left-none ui-editor-mr" maxlength="5" value="' + width + '">', g += '        <span class="ui-editor-before ui-editor-ml">高度</span><input type="text" id="editor_video_height" class="ui-editor-form-ip ui-editor-radius-left-none" maxlength="5" value="' + height + '">', g += "    </div>", g += "</div>", c.dialog({
                            title: f,
                            text: g,
                            width: "400px",
                            ok: function (b) {
                                var f = a("#editor_video_url").val(), g = a("#editor_video_auto").val(), h = a("#editor_video_width").val(), i = a("#editor_video_height").val();
                                return "" == f ? (c.msg({id: "#editor_video_url", msg: "网址不能为空"}), void 0) : c.input(f) ? (c.msg({id: "#editor_video_url", msg: "网址设置错误"}), void 0) : "" != g && c.input(g, "en") ? (c.msg({id: "#editor_video_auto", msg: "播放设置错误"}), void 0) : "" != h && c.input(h, "int") ? (c.msg({id: "#editor_video_width", msg: "宽度设置错误"}), void 0) : "" != i && c.input(i, "int") ? (c.msg({
                                    id: "#editor_video_height",
                                    msg: "高度设置错误"
                                }), void 0) : (c.loadBookmark(), e || (c.insertHtml('<p align="center"><video src="#editor_temp_url" controls="controls" preload="true"></video></p>'), d = a('video[src$="#editor_temp_url"]', c.doc)), d.attr("src", f), c.setAttr(d, "autoplay" == g, "autoplay", "autoplay"), c.setAttr(d, h > 0, "width", h), c.setAttr(d, i > 0, "height", i), c.tipsHide(), b.close(), void 0)
                            }
                        })
                    }, even: function () {
                        if ("" != c.upload) {
                            a("#ui_editor_file_upload").prepend('<input type="file" tabindex="-1" accept=".mp4" class="ui-editor-upload">');
                            var b = a(".ui-editor-upload");
                            b.change(function () {
                                var d = b[0].files[0];
                                null != d && c.ajaxUpload({
                                    data: d, action: "video", success: function (b) {
                                        a("#editor_video_url").val(b.msg)
                                    }
                                })
                            })
                        }
                    }
                }, table: {
                    name: "表格", html: function () {
                        return '<div class="ui-editor-table"><div class="ui-editor-table-box"><div class="ui-editor-table-off"></div><div class="ui-editor-table-on"></div><div class="ui-editor-table-num">1 × 1</div></div></div>'
                    }, even: function () {
                        var b = c.editor.find(".ui-editor-table"), d = c.editor.find(".ui-editor-table-on"), e = c.editor.find(".ui-editor-table-num");
                        a(b).hover(function () {
                            var g = 0, h = 0;
                            a(this).mousemove(function (c) {
                                var f = c.clientX - b.offset().left - 5, i = c.clientY - b.offset().top + a(window).scrollTop() - 5;
                                180 >= f && 180 >= i && (g = Math.ceil(f / 18), h = Math.ceil(i / 18), a(d).css({width: 18 * g + "px", height: 18 * h + "px"}), a(e).html(g + " × " + h))
                            }), a(this).mousedown(function () {
                                var b = '<table class="ui-table ui-table-border ui-table-hover ui-table-striped" width="100%">\n';
                                for (b += "<tbody>\n", i = 0; h > i; i++) {
                                    for (b += "<tr>\n", j = 0; g > j; j++) b += "    <td></td>\n";
                                    b += "</tr>\n"
                                }
                                b += "</tbody>\n", b += "</table>\n", c.insertHtml(b), c.hidePanel(), c.active("table", 0)
                            })
                        })
                    }
                }, emoji: {
                    name: "表情", html: function () {
                        var c, d, a = '<div class="ui-editor-emoji">', b = [[128512, 128591], [129296, 129342], [127792, 127879], [128112, 128175], [129412, 129412]];
                        for (i = 0; i < b.length; i++) for (c = b[i], d = c[0]; d <= c[1]; d++) a += '<div class="ui-editor-emoji-item">&#' + d + ";</div>";
                        return a += "</div>"
                    }, even: function () {
                        c.editor.find(".ui-editor-emoji-item").click(function () {
                            c.loadBookmark(), c.insertHtml(a(this).html()), c.hidePanel(), c.active("emoji", 0)
                        })
                    }
                }, image: {
                    name: "图像", dialog: function () {
                        var b, d, e, f, g, h;
                        for (a(".ui-dialog").remove(), b = alt = width = height = align = hspace = vspace = "", d = c.parent, e = c.isSdcms("img", d), f = "插入图像", d.length > 0 && e && (b = d.attr("src") || "", alt = d.attr("alt") || "", width = d.attr("width") || "", height = d.attr("height") || "", align = d.attr("align") || "", hspace = d.attr("hspace") || "", vspace = d.attr("vspace") || "", f = "编辑图像"), g = [{t: "默认", v: ""}, {t: "左对齐", v: "left"}, {t: "居中", v: "center"}, {
                            t: "右对齐",
                            v: "right"
                        }], h = "", h += '<div class="ui-editor-form-group">', h += '    <div class="ui-editor-input-group">', h += '        <span class="ui-editor-before">图像</span>', h += '        <input type="text" id="editor_image_src" class="ui-editor-form-ip ui-editor-radius' + ("" == c.upload ? "-left" : "") + '-none" value="' + b + '">', "" != c.upload && (h += '        <span class="ui-editor-after" id="ui_editor_file_upload">上传</span>'), h += "    </div>", h += "</div>", h += '<div class="ui-editor-form-group">', h += '    <div class="ui-editor-input-group">', h += '        <span class="ui-editor-before">对齐</span>', h += '        <select id="editor_image_align" class="ui-editor-form-ip ui-editor-radius-left-none">', i = 0; i < g.length; i++) h += '        <option value="' + g[i].v + '" ' + (align == g[i].v ? " selected" : "") + ">" + g[i].t + "</option>";
                        h += "        </select>", h += "    </div>", h += "</div>", h += '<div class="ui-editor-form-group">', h += '    <div class="ui-editor-input-group">', h += '        <span class="ui-editor-before">描述</span>', h += '        <input type="text" id="editor_image_alt" class="ui-editor-form-ip ui-editor-radius-left-none" value="' + alt + '">', h += "    </div>", h += "</div>", h += '<div class="ui-editor-form-group editor_image_text">', h += '    <div class="ui-editor-text-center">', h += '        <a href="javascript:;" class="editor_image_hide ui-editor-text-gray">其他参数<span class="ui_editor_arrow"></span></a>', h += "    </div>", h += "</div>", h += '<div class="ui-editor-form-group editor_image_other ui-editor-hide">', h += '    <div class="ui-editor-input-group">', h += '        <span class="ui-editor-before">宽度</span><input type="text" id="editor_image_width" class="ui-editor-form-ip ui-editor-radius-left-none ui-editor-mr" maxlength="5" value="' + width + '">', h += '        <span class="ui-editor-before ui-editor-ml">高度</span><input type="text" id="editor_image_height" class="ui-editor-form-ip ui-editor-radius-left-none" maxlength="5" value="' + height + '">', h += "    </div>", h += "</div>", h += '<div class="ui-editor-form-group editor_image_other ui-editor-hide">', h += '    <div class="ui-editor-input-group">', h += '        <span class="ui-editor-before">水平间距</span><input type="text" id="editor_image_hspace" class="ui-editor-form-ip ui-editor-radius-left-none ui-editor-mr" maxlength="4" value="' + hspace + '">', h += '        <span class="ui-editor-before ui-editor-ml">垂直间距</span><input type="text" id="editor_image_vspace" class="ui-editor-form-ip ui-editor-radius-left-none" maxlength="4" value="' + vspace + '">', h += "    </div>", h += "</div>", c.dialog({
                            title: f, text: h, width: "400px", ok: function (b) {
                                var f = a("#editor_image_src").val(), g = a("#editor_image_alt").val(), h = a("#editor_image_width").val(), i = a("#editor_image_height").val(), j = a("#editor_image_align").val(), k = a("#editor_image_hspace").val(), l = a("#editor_image_vspace").val();
                                return "" == f ? (c.msg({id: "#editor_image_src", msg: "图像不能为空"}), void 0) : c.input(f) ? (c.msg({id: "#editor_image_src", msg: "图像设置错误"}), void 0) : "" != g && c.input(g, "text") ? (c.msg({id: "#editor_image_alt", msg: "描述设置错误"}), void 0) : "" != h && c.input(h, "int") ? (c.msg({id: "#editor_image_width", msg: "宽度设置错误"}), void 0) : "" != i && c.input(i, "int") ? (c.msg({
                                    id: "#editor_image_height",
                                    msg: "高度设置错误"
                                }), void 0) : "" != j && c.input(j, "en") ? (c.msg({id: "#editor_image_align", msg: "对齐设置错误"}), void 0) : "" != k && c.input(k, "int") ? (c.msg({id: "#editor_image_hspace", msg: "水平间距设置错误"}), void 0) : "" != l && c.input(l, "int") ? (c.msg({
                                    id: "#editor_image_vspace",
                                    msg: "垂直间距设置错误"
                                }), void 0) : (c.loadBookmark(), e || (c.insertHtml('<img src="' + f + '#editor_temp_url" />'), d = a('img[src$="#editor_temp_url"]', c.doc)), d.attr("src", f), c.setAttr(d, "" != g, "alt", g), c.setAttr(d, "" != h && h > 0, "width", h), c.setAttr(d, "" != i && i > 0, "height", i), c.setAttr(d, "" != j, "align", j), c.setAttr(d, "" != k && k > 0, "hspace", k), c.setAttr(d, "" != l && l > 0, "vspace", l), c.tipsHide(), b.close(), void 0)
                            }
                        })
                    }, even: function () {
                        if (a(".editor_image_hide").click(function () {
                            a(".editor_image_other").removeClass("ui-editor-hide"), a(".editor_image_text").addClass("ui-editor-hide")
                        }), "" != c.upload) {
                            a("#ui_editor_file_upload").prepend('<input type="file" tabindex="-1" accept=".gif,.jpg,.jpeg,.png" class="ui-editor-upload">');
                            var b = a(".ui-editor-upload");
                            b.change(function () {
                                var d = b[0].files[0];
                                null != d && c.ajaxUpload({
                                    data: d, action: "image", success: function (b) {
                                        a("#editor_image_src").val(b.msg), a("#editor_image_alt").val(b.name)
                                    }
                                })
                            })
                        }
                    }
                }, upload: {
                    name: "附件上传", dialog: function () {
                        var b = "";
                        b += '<div class="ui-editor-upload-multiple">', b += '    <div class="ui-editor-upload-btn ui-editor-btn">选择文件<input type="file" multiple class="ui-editor-upload-choose"></div>', b += '    <div class="ui-editor-upload-btn ui-editor-btn ui-editor-btn-blue ui-editor-ml ui-editor-upload-begin">开始上传</div>', b += '    <div class="ui-editor-upload-body">', b += '        <div class="ui-editor-upload-drop"><i class="ui-editor-icon-upload"></i>请将文件拖到此处</div>', b += '        <div class="ui-editor-upload-list ui-editor-hide">', b += '            <table width="100%">', b += "                <thead>", b += "                <tr>", b += '                    <th>文件</th><th width="120">大小</th><th width="80">状态</th><th width="60">操作</th>', b += "                </tr>", b += "               </thead>", b += '                <tbody class="ui-editor-upload-tbody">', b += "                </tbody>", b += "            </table>", b += "        </div>", b += "    </div>", b += "</div>", c.dialog({
                            title: "附件上传",
                            text: b,
                            width: "600px",
                            ok: function (b) {
                                var f, d = a(".ui-editor-upload-tbody"), e = d.find("tr").length;
                                return e > 0 ? (f = 0, d.find("tr").each(function () {
                                    var d = a(this).attr("data-url"), e = a(this).attr("data-state"), g = a(this).attr("data-type"), h = a(this).children().eq(0).html(), i = '<p><a href="' + d + '" target="_blank" title="' + h + '">' + h + "</a></p>";
                                    if (3 == e && "" != d) {
                                        switch (f = 1, g) {
                                            case"img":
                                                i = '<img src="' + d + '" alt="' + h + '">';
                                                break;
                                            case"music":
                                                i = '<p align="center"><audio src="' + d + '" controls="controls" preload="true"></audio></p>';
                                                break;
                                            case"video":
                                                i = '<p align="center"><video src="' + d + '" controls="controls" preload="true"></video></p>'
                                        }
                                        c.insertHtml(i)
                                    }
                                }), 0 == f ? (c.msg({id: ".ui-editor-upload-begin", msg: "请先上传", time: 3}), void 0) : (b.close(), void 0)) : (c.msg({id: ".ui-editor-upload-choose", msg: "请选择文件", time: 3}), void 0)
                            }
                        })
                    }, even: function () {
                        var b = a(".ui-editor-upload-drop"), e = a(".ui-editor-upload-choose"), f = a(".ui-editor-upload-begin"), g = a(".ui-editor-upload-list"), h = a(".ui-editor-upload-tbody"), j = function (a) {
                            var c, b = ["Bytes", "KB", "MB"];
                            return 0 == a ? "n/a" : (c = parseInt(Math.floor(Math.log(a) / Math.log(1024))), (a / Math.pow(1024, c)).toFixed(1) + " " + b[c])
                        }, k = function (a, b) {
                            var c = "file";
                            return a.indexOf("image/") >= 0 ? "img" : a.indexOf("audio/") >= 0 && (b.indexOf(".mp3") >= 0 || b.indexOf(".m4a") >= 0) ? "music" : a.indexOf("video/") >= 0 && b.indexOf(".mp4") >= 0 ? "video" : c
                        }, l = function (a) {
                            if (a.indexOf(".") >= 0) {
                                var b = a.split(".");
                                return a.replace("." + b[b.length - 1], "")
                            }
                            return a
                        }, m = function (a) {
                            var b, d, e, f, g, h;
                            if (a.length < 1) return !1;
                            for (i = 0; i < a.length; i++) b = a[i], d = b.name, e = b.size, f = d + e, g = k(b.type, d), -1 == c.filekey.indexOf(f) ? (h = [b, l(d), e, 1, "准备", "", "", g], n(h), c.fileList.push(h), c.filekey.push(f)) : c.msg({id: ".ui-editor-upload-choose", msg: "重复添加", time: 3});
                            c.autoupload && o()
                        }, n = function (a) {
                            var b = '<tr data-state="' + a[3] + '" data-url="' + a[6] + '" data-type="' + a[7] + '">', c = 2 == a[3] ? '<span class="ui-editor-tips" data-that="' + d + '" data-title="' + a[5] + '">' + a[4] + "</span>" : a[4];
                            b += "    <td>" + a[1] + "</td><td>" + j(a[2]) + "</td><td>" + c + '</td><td><a href="javascript:;">删除</a></td>', b += "</tr>", h.append(b)
                        }, o = function () {
                            var e, f, g, b = 0, d = h.find("tr");
                            for (e = 0; e < d.length; e++) f = d.eq(e), g = a(f).attr("data-state"), 1 == g && (b++, c.AjaxUpMore({index: e, source: f}));
                            0 == b && c.msg({id: ".ui-editor-upload-begin", msg: "没有文件需要上传", time: 3})
                        };
                        b.on("dragenter", function () {
                            a(this).addClass("active")
                        }), b.on("dragover", function () {
                            return !1
                        }), b.on("dragleave", function () {
                            a(this).addClass("active")
                        }), b.on("drop", function (c) {
                            return m(c.originalEvent.dataTransfer.files), b.addClass("ui-editor-hide"), g.removeClass("ui-editor-hide"), a(this).removeClass("active"), !1
                        }), b.on("click", function () {
                            e.click()
                        }), b.hover(function () {
                            a(this).addClass("active")
                        }, function () {
                            a(this).removeClass("active")
                        }), e.on("change", function () {
                            "" != a(this).val() && (m(this.files), b.addClass("ui-editor-hide"), g.removeClass("ui-editor-hide"), e.val(""))
                        }), h.on("click", "a", function () {
                            var d = a(this).parents("tr"), e = d.index();
                            d.remove(), c.fileList.splice(e, 1), c.filekey.splice(e, 1), 0 == c.fileList.length && (b.removeClass("ui-editor-hide"), g.addClass("ui-editor-hide"))
                        }), f.on("click", function () {
                            o()
                        })
                    }
                }, auto: {
                    name: "自动排版", html: function () {
                        var c, a = [{n: "清理设置", e: "other", d: 1, c: 1, s: [{n: "清除空行", e: "cleanEmptyline", t: "checkbox", v: "", c: 0}, {n: "清除无用代码", e: "cleanUselessCode", t: "checkbox", v: "", c: 1}, {n: "清除CSS", e: "cleanClass", t: "checkbox", v: "", c: 0}]}, {n: "符号转换", e: "charSwitch", d: 0, c: 1, s: [{n: "全角转半角", e: "charSwitchValue", t: "radio", v: "tohalf", c: 1}, {n: "半角转全角", e: "charSwitchValue", t: "radio", v: "tofull", c: 0}]}, {
                            n: "首行缩进",
                            e: "indent",
                            d: 0,
                            c: 1,
                            s: [{n: "空格缩进", e: "indentValue", t: "radio", v: "space", c: 1}, {n: "样式缩进", e: "indentValue", t: "radio", v: "css", c: 0}, {n: "清除缩进", e: "indentValue", t: "radio", v: "none", c: 0}]
                        }, {n: "段落对齐", e: "textAlign", d: 0, c: 0, s: [{n: "默认", e: "textAlignValue", t: "radio", v: "none", c: 1}, {n: "左对齐", e: "textAlignValue", t: "radio", v: "left", c: 0}, {n: "居中", e: "textAlignValue", t: "radio", v: "center", c: 0}, {n: "右对齐", e: "textAlignValue", t: "radio", v: "right", c: 0}]}, {
                            n: "表格对齐",
                            e: "tableAlign",
                            d: 0,
                            c: 0,
                            s: [{n: "默认", e: "tableAlignValue", t: "radio", v: "none", c: 1}, {n: "左对齐", e: "tableAlignValue", t: "radio", v: "left", c: 0}, {n: "居中", e: "tableAlignValue", t: "radio", v: "center", c: 0}, {n: "右对齐", e: "tableAlignValue", t: "radio", v: "right", c: 0}]
                        }, {n: "图片对齐", e: "imageAlign", d: 0, c: 0, s: [{n: "默认", e: "imageAlignValue", t: "radio", v: "none", c: 1}, {n: "左对齐", e: "imageAlignValue", t: "radio", v: "left", c: 0}, {n: "居中", e: "imageAlignValue", t: "radio", v: "center", c: 0}, {n: "右对齐", e: "imageAlignValue", t: "radio", v: "right", c: 0}]}], b = '<div class="ui-editor-form">';
                        for (i = 0; i < a.length; i++) {
                            for (c = a[i].s, b += '    <div class="ui-editor-row' + (i > 0 ? " ui-editor-mt" : "") + '">', b += '        <div class="ui-editor-pr"><label class="ui-editor-checkbox"><input type="checkbox" name="' + a[i].e + '" ' + (a[i].c ? "checked" : "") + " " + (1 == a[i].d ? "disabled" : "") + "><i></i>" + a[i].n + "</label></div>", b += "        <div>", j = 0; j < c.length; j++) b += '            <label class="ui-editor-' + c[j].t + '"><input type="' + c[j].t + '" name="' + c[j].e + '" value="' + c[j].v + '" ' + (c[j].c ? "checked" : "") + "><i></i>" + c[j].n + "</label>";
                            b += "        </div>", b += "    </div>"
                        }
                        return b += '    <div class="ui-editor-row ui-editor-mt">', b += '        <button type="button" class="ui-editor-btn ui-editor-btn-blue">执行</button>', b += "    </div>", b += "</div>"
                    }, even: function () {
                        c.editor.find(".ui-editor-form button").click(function () {
                            var e, f, g, h, b = {}, d = c.editor.find(".ui-editor-form input");
                            for (i = 0; i < d.length; i++) e = a(d[i]).attr("name"), f = a(d[i]).attr("type"), g = a(d[i]).is(":checked"), h = a(d[i]).val(), "other" != e && ("checkbox" == f ? b[e] = g : "radio" == f && g && (b[e] = h));
                            c.hidePanel(), c.typeSet(b)
                        })
                    }
                }, code: {
                    name: "代码", html: function () {
                        var d, a = ["html", "css", "javascript", "java", "php", "python", "c", "c++", "c#", "xml", "ruby"], b = '<div class="ui_editor_ul_wrap"><ul class="ui_editor_ul ui_editor_code">';
                        for (i = 0; i < a.length; i++) d = a[i], "c++" == d && (d = "cand"), "c#" == d && (d = "cplus"), b += '<li data-cmd="' + d + '">' + c.fristToUp(a[i]) + "</li>";
                        return b += "</ul></div>"
                    }, even: function () {
                        c.editor.find(".ui_editor_code li").click(function () {
                            var d, b = a(this).data("cmd");
                            c.loadBookmark(), d = c.getParent("pre"), d.length > 0 ? d.attr("class", "lang-" + b) : c.insertHtml('<pre class="lang-' + b + '"></pre>'), c.hidePanel()
                        })
                    }
                }, down: {
                    name: "远程图片下载", click: function () {
                        c.dialog({
                            title: "操作提示", text: '<div class="ui-editor-mb">确定要保存远程图片吗？</div>', ok: function (b) {
                                var d = c.getHtml(), e = "content=" + encodeURIComponent(d);
                                for (key in c.params) e += "&" + key + "=" + params[key];
                                a.ajax({
                                    url: c.saveurl, type: "post", data: e, error: function () {
                                        console.log(b.responseText)
                                    }, success: function (a) {
                                        c.setHtml(a), c.msg({id: ".ui-editor-icon-down", tool: !0, msg: "处理完成", time: 3})
                                    }
                                }), b.close()
                            }
                        })
                    }
                }, date: {
                    name: "日期", click: function () {
                        var a = new Date, b = a.getFullYear(), d = ("0" + (a.getMonth() + 1)).slice(-2), e = ("0" + a.getDate()).slice(-2);
                        c.insertHtml(b + "-" + d + "-" + e)
                    }
                }, clear: {
                    name: "清空内容", click: function () {
                        c.dialog({
                            title: "操作提示", text: '<div class="ui-editor-mb">确定要清空当前文档吗？</div>', ok: function (a) {
                                c.setHtml(""), a.close()
                            }
                        })
                    }
                }, preview: {
                    name: "预览", click: function () {
                        var a = window.screen, b = window.open("", "Preview", "toolbar=yes,location=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=" + Math.round(.9 * a.width) + ",height=" + Math.round(.8 * a.height) + ",left=" + Math.round(.05 * a.width)), d = b.document;
                        d.open(), d.write(c.frameHtml(c.getHtml())), d.close(), b.focus()
                    }
                }, html: {
                    name: "Html代码", click: function () {
                        c.changeMode("html")
                    }
                }, fullscreen: {
                    name: "全屏", click: function () {
                        c.fullscreen("fullscreen")
                    }
                }, about: {
                    name: "关于", html: function () {
                        return '<div class="ui-editor-help"><strong>Sdcms富文本编辑器</strong><br><span>版本：</span>' + v + '<br></div>'
                    }
                }
            }, c.btData = function (a) {
                var d, b = {name: null, arrow: "", icon: ""};
                try {
                    d = c.button[a], b = {name: d["name"] ? d["name"] : "", arrow: c.arrow ? d["arrow"] ? "<em></em>" : "" : "", icon: d["icon"] ? d["icon"] : ""}
                } catch (e) {
                }
                return b
            }, c.focus = function () {
                c.win.focus()
            }, c.frameHtml = function (a) {
                var b = "<!DOCTYPE html>";
                return b += "<head>", b += '<meta http-equiv="Content-Type" content="text/html; charset=utf-8">', b += '<link rel="stylesheet" href="' + e + "css/iframe.css?v=" + Math.random() + '"/>', b += "<title>预览</title>", b += "</head>", b += '<body contentEditable="true" spellcheck="false">' + a + "</body>", b += "</html>"
            }, c.colorEven = function (b, d) {
                var e = c.editor.find(".ui-editor-color-item"), f = c.editor.find(".ui-editor-color-self button"), g = c.editor.find(".ui-editor-color-self input");
                e.hover(function () {
                    g.val(a(this).data("color"))
                }), e.click(function () {
                    var e = a(this).data("color");
                    if ("" != e) {
                        if (c.input(e, "color")) return c.msg({id: f, msg: "颜色值错误"}), void 0;
                        c.actname = b, c.loadBookmark(), c.exec(d, "#" + e), c.hidePanel(), c.active(b, 0)
                    }
                }), f.click(function () {
                    var h, e = a(this).data("type");
                    if ("confirm" == e) {
                        if (h = g.val(), "" != h && c.input(h, "color")) return c.msg({id: f, msg: "颜色值错误"}), void 0;
                        c.actname = b, c.loadBookmark(), c.exec(d, "#" + h), c.hidePanel(), c.active(b, 0)
                    } else g.val("")
                })
            }, c.plug) for (key in c.plug) c.button[key] = c.plug[key];
            if (c.fristToUp = function (a) {
                return a = a.toLowerCase().replace(/\b[a-z]/g, function (a) {
                    return a.toUpperCase()
                })
            }, c.dataURItoBlob = function (a) {
                var b, c, d, e;
                for (b = a.split(",")[0].indexOf("base64") >= 0 ? atob(a.split(",")[1]) : unescape(a.split(",")[1]), c = a.split(",")[0].split(":")[1].split(";")[0], d = new Uint8Array(b.length), e = 0; e < b.length; e++) d[e] = b.charCodeAt(e);
                return new Blob([d], {type: c})
            }, c.ajaxUpload = function (b) {
                var d, e, f, g, h, i, j, k;
                console.log("正在上传，请稍等。"), d = b.data || {}, e = c.params || {}, f = b.success || null, g = c.upload || "", h = b.isblob || !1, i = b.source || "", j = b.action || "image", k = new FormData, h ? k.append(c.file, d, "sdcms.png") : k.append(c.file, d);
                for (key in e) k.append(key, e[key]);
                a.ajax({
                    url: g + (-1 == g.indexOf("?") ? "?" : "&") + "action=" + j, type: "post", data: k, contentType: !1, processData: !1, dataType: "json", xhr: function () {
                        var b = a.ajaxSettings.xhr();
                        return b.upload.addEventListener("progress", function (a) {
                            var b = (100 * (a.loaded / a.total)).toFixed(2);
                            c.msg({id: "#ui_editor_file_upload", msg: "正在上传：" + b + "%", time: 5})
                        }), b
                    }, error: function (a) {
                        c.msg({id: "#ui_editor_file_upload", msg: "服务器出错，打开控制台查看"}), console.log(a.responseText)
                    }, success: function (a) {
                        "success" == a.state ? (f(a, i), c.msg({id: "#ui_editor_file_upload", msg: "上传成功", time: 5})) : c.msg({id: "#ui_editor_file_upload", msg: a.msg, time: 5})
                    }, complete: function () {
                        a(".ui-editor-upload").val(""), console.log("上传结束")
                    }
                })
            }, c.AjaxUpMore = function (b) {
                var e = b.index, f = c.upload || "", g = b.source || "", h = a(g).children(), i = c.params || {}, j = new FormData;
                j.append(c.file, c.fileList[e][0]);
                for (key in i) j.append(key, i[key]);
                a.ajax({
                    url: f + (-1 == f.indexOf("?") ? "?" : "&") + "action=all", type: "post", data: j, contentType: !1, processData: !1, dataType: "json", xhr: function () {
                        var b = a.ajaxSettings.xhr();
                        return b.upload.addEventListener("progress", function (a) {
                            var b = (100 * (a.loaded / a.total)).toFixed(2);
                            h.eq(2).html(b + "%")
                        }), b
                    }, error: function (b) {
                        c.fileList[e][3] = "2", c.fileList[e][4] = "失败", c.fileList[e][5] = "系统错误", a(g).attr("data-state", "2"), h.eq(2).html('<span class="ui-editor-tips" data-that="' + d + '" data-title="请查看控制台消息">失败</span>'), console.log(b.responseText)
                    }, success: function (b) {
                        "success" == b.state ? (a(g).attr("data-state", "3"), a(g).attr("data-url", b.msg), c.fileList[e][3] = "3", c.fileList[e][4] = "成功", c.fileList[e][6] = b.msg, h.eq(2).html("成功")) : (c.fileList[e][3] = "2", c.fileList[e][4] = "失败", c.fileList[e][5] = b.msg, a(g).attr("data-state", "2"), h.eq(2).html('<span class="ui-editor-tips" data-that="' + d + '" data-title="' + b.msg + '">失败</span>'))
                    }, complete: function () {
                        var d = !0;
                        a(".ui-editor-upload-tbody").find("tr").each(function () {
                            1 == a(this).attr("data-state") && (d = !1)
                        }), d && c.msg({id: ".ui-editor-upload-begin", msg: "上传完成", time: 3})
                    }
                })
            }, c.toHalf = function (a) {
                var c, d, b = "";
                for (c = 0; c < a.length; c++) d = a.charCodeAt(c), b += d >= 65281 && 65373 >= d ? a.charAt(c) : 12288 == d ? String.fromCharCode(a.charCodeAt(c) - 12288 + 32) : a.charAt(c);
                return b
            }, c.toFull = function (a) {
                var c, b = mark = "";
                for (c = 0; c < a.length; c++) b += 32 == a.charCodeAt(c) ? String.fromCharCode(12288) : a.charCodeAt(c) < 127 ? a.charAt(c) : a.charAt(c);
                return b
            }, c.typeSet = function (b) {
                var d, e, h, f = c.getHtml(), g = !1;
                if (b.cleanEmptyline && (f = f.replace(/[\r\n]/g, ""), g = !0), b.cleanUselessCode && (f = f.replace(/&nbsp;/gi, " ").replace(/>\s+</gm, "> <").replace(/ +/gi, " "), g = !0), g && c.setHtml(f), b.cleanClass) for (d = a(c.doc).find("*"), i = 0; i < d.length; i++) a(d[i]).removeAttr("class style");
                if (b.charSwitch && (switchCharsNode = function (a) {
                    if ("#text" == a.nodeName) return a.nodeValue = "tohalf" == b.charSwitchValue ? c.toHalf(a.nodeValue) : c.toFull(a.nodeValue), void 0;
                    for (var d = a.lastChild; null != d; d = d.previousSibling) switchCharsNode(d)
                }, switchCharsNode(c.doc.body)), b.indent) for (d = a(c.doc).find("p"), i = 0; i < d.length; i++) h = a(d[i]), h.css({textIndent: ""}), h.html(h.html().replace(/^[　 ]+/g, "")), "space" == b.indentValue ? h.html("　　" + h.html()) : h.css({textIndent: "2em"});
                if (b.textAlign) for (d = a(c.doc).find("p"), e = b.textAlignValue, i = 0; i < d.length; i++) "none" == e ? a(d[i]).removeAttr("align") : a(d[i]).attr("align", e);
                if (b.tableAlign) for (d = a(c.doc).find("td"), e = b.tableAlignValue, i = 0; i < d.length; i++) "none" == e ? a(d[i]).removeAttr("align") : a(d[i]).attr("align", e);
                if (b.imageAlign) for (d = a(c.doc).find("img"), e = b.imageAlignValue, i = 0; i < d.length; i++) "none" == e ? a(d[i]).removeAttr("align") : a(d[i]).attr("align", e)
            }, c.save = function () {
                c.autosave && c.async()
            }, c.async = function () {
                var a = c.getHtml();
                "" != a && (a = a.replace(new RegExp(c.pagebreak.html, "g"), c.pagebreak.key), a = c.cleanWord(a), a = c.cleanHtml(a), h && (a = a.replace(/<pre(\s+[^>]*?)?>([\s\S]*?)<\/pre>/gi, function (a, b, c) {
                    return "<pre" + (void 0 != b ? b : "") + ">" + c.replace(/<br>/g, "") + "</pre>"
                }))), c.source.val(a)
            }, c.isSdcms = function (b, c) {
                if (0 == c.length) return !1;
                var d = a(c).prop("outerHTML");
                return d.substring(1, b.length + 1) == b ? !0 : !1
            }, c.input = function (a, b) {
                var c = /^[0-9A-Za-z\u0391-\uFFE5.\/:?&-_#]+$/;
                switch (b) {
                    case"int":
                        c = /^[0-9]+$/;
                        break;
                    case"en":
                        c = /^[a-z]+$/;
                        break;
                    case"color":
                        c = /^[a-zA-Z0-9]+$/;
                        break;
                    case"text":
                        c = /^[0-9A-Za-z\u0391-\uFFE5-_,|. ]+$/
                }
                return c.test(a) ? !1 : !0
            }, c.cleanWord = function (a) {
                return "" != a && a.match(/mso(-|normal)|WordDocument/i) && (a = a.replace(/<meta[\s\S]*?>/gi, "").replace(/<![\s\S]*?>/gi, "").replace(/<style[^>]*>[\s\S]*?<\/style>/gi, "").replace(/<script[^>]*>[\s\S]*?<\/script>/gi, "").replace(/<w:[^>]+>[\s\S]*?<\/w:[^>]+>/gi, "").replace(/<o:[^>]+>[\s\S]*?<\/o:[^>]+>/gi, "").replace(/<xml>[\s\S]*?<\/xml>/gi, "").replace(/<(?:table|td)[^>]*>/gi, function (a) {
                    return a.replace(/border-bottom:([#\w\s]+)/gi, "border:$1")
                }), a = a.replace(/<!--[\s\S]*?-->|<!(--)?\[[\s\S]+?\](--)?>|<style(\s+[^>]*?)?>[\s\S]*?<\/style>/gi, ""), a = a.replace(/<\/?\w+:[^>]*>/gi, ""), a = a.replace(/\r?\n/gi, "")), a
            }, c.cleanHtml = function (a) {
                if ("" != a) {
                    a = a.replace(/(<(\/?)(\w+))((?:\s+[\w-]+\s*=\s*(?:"[^"]*"|'[^']*'|[^>\s]+))*)\s*((\/?)>)/g, function (a, b, c, d, e, f) {
                        return e = e.replace(/(onclick|ondblclick|onerror|onmousedown|onmouseup|onmousemove|onmouseover|onmouseout|onmouseenter|onmouseleave|onmousewheel|onkeydown|onkeypress|onkeyup|onchange|onselect|onsubmit|onreset|onblur|onfocus|onload|onunload)=\s*('[^"]*"|'[^']*'|[^>\s]+)/gi, ""), e.match(/(alert\(|eval\(|expression\(|prompt\(|base64\(|vbscript\(|msgbox\(|unescape\()/i) ? b + f : b + e + f
                    }), a = a.replace(/<!?\/?(DOCTYPE|html|body|meta)(\s+[^>]*?)?>/gi, "");
                    for (var b = 0; b < u.length; b++) a = a.replace(new RegExp("<" + u[b] + "[^>]*>.*?</" + u[b] + ">", "gim"), "")
                }
                return a
            }, c.formatHtml = function (a) {
                return "" != a && (a = a.replace(/\s*<(p|table|tr|hr|div|object|ol|li|ul|h[1-6])(?![a-z])/gi, "\n<$1").replace(/<\/(p|table|div|object|ol|ul|h[1-6])>\s*/gi, "</$1>\n").replace(/(<(?:br|hr)(?![a-z0-9])[^>]*>)\s*/gi, "$1\n").replace(/^\s*/, "").replace(/\s*$/, "")), a
            }, c.getHtml = function () {
                var b = "html" == c.mode ? a(c.doc.body).html() : c.editor.find(".ui-editor-code textarea").val();
                return "<p><br></p>" == b || "<br>" == b ? "" : c.formatHtml(b)
            }, c.setHtml = function (b, d) {
                return "code" == c.mode && 1 != d ? (c.textarea.val(b), void 0) : (a(c.doc.body).html(b), void 0)
            }, c.addHtml = function (b) {
                return "code" == c.mode ? (c.textarea.val(c.textarea.val() + b), void 0) : (a(c.doc.body).append(b), void 0)
            }, c.showPanel = function (b) {
                var d = c.cmd, e = c.tool.find(".ui-editor-action-" + d).closest("a"), f = e.offset().left, g = e.offset().top + e.outerHeight() - a(window).scrollTop(), h = document.body.clientWidth, i = h - f - e.outerWidth();
                c.panel.css({display: "block", left: f + "px", top: g + "px"}).html(b), f + c.panel.outerWidth() > h && i + c.panel.outerWidth() > h ? (f = (h - c.panel.outerWidth()) / 2, c.panel.css({left: f + "px", right: "auto"})) : f + c.panel.outerWidth() > h && i + c.panel.outerWidth() <= h && c.panel.css({left: "auto", right: i + "px"})
            }, c.hidePanel = function () {
                c.panel.css({display: "none", left: 0, right: "auto"}).html("")
            }, c.removePop = function () {
                a(".ui-editor-popup").remove()
            }, c.changeMode = function (b) {
                var d;
                "html" == c.mode ? (c.htmlToPage(), c.active(b, 1), c.iframe.css("display", "none"), c.editor.find(".ui-editor-code").css("display", "block"), c.textarea.css("display", "block"), d = c.getHtml(), d = d.replace(new RegExp("(\r\n)"), ""), c.editor.find(".ui-editor-code textarea").val(d), c.tool.find("a").each(function () {
                    "html" != a(this).data("cmd") && "about" != a(this).data("cmd") && a(this).addClass("ui-editor-disabled")
                }), c.mode = "code") : (c.active(b, 0), d = c.editor.find(".ui-editor-code textarea").val(), "" != d && (d = c.pageToHtml(d), d = c.cleanWord(d), d = c.cleanHtml(d), d = c.formatHtml(d)), c.setHtml(d, 1), c.editor.find(".ui-editor-code").css("display", "none"), c.textarea.css("display", "none"), c.iframe.css("display", "block"), c.tool.find("a").removeClass("ui-editor-disabled"), c.mode = "html"), c.removePop()
            }, c.fullscreen = function (b) {
                if (0 == c.isfullscreen) {
                    c.active(b, 1), c.editor.addClass("ui-editor-full"), c.editor.find(".ui-editor-icon-fullscreen").addClass("ui-editor-icon-exit-fullscreen");
                    var d = a(window).height() - c.tool.height();
                    c.iframe.css("height", d + "px"), c.textarea.css("height", d + "px"), c.isfullscreen = !0
                } else c.editor.removeClass("ui-editor-full"), c.editor.find(".ui-editor-icon-fullscreen").removeClass("ui-editor-icon-exit-fullscreen"), c.iframe.css("height", c.height + "px"), c.textarea.css("height", c.height + "px"), c.isfullscreen = !1, c.active(b, 0);
                c.removePop()
            }, c.active = function (a, b) {
                (0 != b || 1 != c.isfullscreen || "fullscreen" != a) && null != a && "" != a && (1 == b ? c.editor.find(".ui-editor-icon-" + a).closest("a").addClass("active") : c.editor.find(".ui-editor-icon-" + a).closest("a").removeClass("active"), "align" == a && 1 == b && c.active("justifyleft", 1), "list" == a && 1 == b && c.active("InsertUnorderedList", 1))
            }, c.exeCmd = function (a) {
                c.cmd = a, c.focus(), c.hidePanel(), c.saveBookmark();
                var b = c.button[a];
                return a.indexOf("justify") >= 0 && c.parent ? (a = a.replace("justify", ""), c.setAttr(c.parent, "full" != a, "align", a), void 0) : b.html || b.dialog || b.click ? ("upload" == a && (c.fileList = [], c.filekey = []), b.html && c.showPanel(b.html()), b.click && b.click(c), b.dialog && (c.hidePanel(), c.removePop(), b.dialog(c)), b.even && b.even(c), void 0) : (c.exec(a), c.parent = "", void 0)
            }, c.exec = function (a, b) {
                b = void 0 != b ? b : null, "FormatBlock" == a && h && (b = "<" + b + ">");
                try {
                    c.doc.execCommand(a, !1, b)
                } catch (d) {
                    c.insertHtml(b)
                }
                c.isPop = !1
            }, c.insertHtml = function (a) {
                if ("code" != c.mode) if (h) {
                    c.focus();
                    var d = (c.getSel(), c.getRng());
                    d.insertNode && (d.deleteContents(), d.insertNode(d.createContextualFragment(a)), d.collapse(!1))
                } else c.exec("insertHTML", a)
            }, c.pageToHtml = function (a) {
                if ("" != a) {
                    var b = c.pagebreak;
                    a = a.replace(new RegExp(b.key, "g"), b.html)
                }
                return a
            }, c.htmlToPage = function () {
                var e, b = c.pagebreak, d = a(c.doc).find("hr");
                for (i = 0; i < d.length; i++) e = a(d[i]), "ui_editor_pagebreak" == e.attr("class") && e.replaceWith(b.key)
            }, c.htmlCode = function (a) {
                return c.isTextarea && (a = a.replace(/<pre(\s+[^>]*?)?>([\s\S]*?)<\/pre>/gi, function (a, b, d) {
                    return d = c.unhtml(d), "<pre" + (void 0 != b ? b : "") + ">" + d.replace(/&lt;br&gt;/g, "") + "</pre>"
                })), a
            }, c.unhtml = function (a) {
                return a ? a.replace(/[<">']/g, function (a) {
                    return {"<": "&lt;", "&": "&amp;", '"': "&quot;", ">": "&gt;", "'": "&#39;"}[a]
                }) : ""
            }, c.setAttr = function (a, b, c, d) {
                b ? a.attr(c, d) : a.removeAttr(c)
            }, c.saveBookmark = function () {
                if ("html" == c.mode && h) {
                    var b = c.getRng();
                    b = b.cloneRange ? b.cloneRange() : b, c.bookmark = {top: a(c.win).scrollTop(), rng: b}
                }
            }, c.loadBookmark = function () {
                var b, d;
                "html" == c.mode && h && (b = c.bookmark.rng, d = c.getSel(), d.removeAllRanges(), d.addRange(b), a(c.win).scrollTop(c.bookmark.top), c.bookmark = null)
            }, c.getParent = function (b) {
                var d = c.getRng(), e = d.commonAncestorContainer;
                return d.collapsed || d.startContainer === d.endContainer && d.startOffset - d.endOffset < 2 && d.startContainer.hasChildNodes() && (e = d.startContainer.childNodes[d.startOffset]), b = b ? b : "*", e = a(e), e.is(b) || (e = a(e).closest(b)), e
            }, c.removeNode = function (a) {
                for (; a.firstChild;) a.parentNode.insertBefore(a.firstChild, a);
                a.parentNode.removeChild(a)
            }, c.focusNode = function () {
                var a, b = c.getSel().focusNode;
                return b ? b : (a = c.getRng(), a.length ? a.item(0).parentNode : a.parentElement ? a.parentElement() : null)
            }, c.getRng = function (a) {
                var b, d;
                try {
                    a || (b = c.getSel(), d = b.rangeCount > 0 ? b.getRangeAt(0) : b.createRange ? b.createRange() : null), d || (d = c.doc.createRange ? c.doc.createRange() : c.doc.body.createTextRange())
                } catch (e) {
                }
                return d
            }, c.getSel = function () {
                return c.win.getSelection ? c.win.getSelection() : c.doc.selection
            }, c.dialog = function (b) {
                var h, i, j, k, l, d = this, e = {title: "", text: "", width: "", height: "", type: 0}, f = a.extend({}, e, b), g = a('<div class="ui-editor-dialog-mask"></div>');
                a("body").append(g), g.fadeIn(function () {
                    a(this).css("display", "block")
                }), h = "", h += '<div class="ui-editor-dialog" id="ui_editor_dialog">', h += '<div class="ui-editor-dialog-header">', h += '<div class="ui-editor-dialog-title">' + f.title + "</div>", h += '<div class="ui-editor-dialog-close"><i class="ui-editor-icon-close"></i></div>', h += "</div>", i = dialog_padding = "", 1 == f.type ? (i = '<iframe src="' + f.text + '" class="ui-editor-dialog-iframe" frameborder="0" border="0" scrolling="auto" allowtransparency="false" marginwidth="0" marginheight="0"></iframe>', dialog_padding = " ui-editor-dialog-body-iframe") : i = f.text, h += '<div class="ui-editor-dialog-body' + dialog_padding + '">' + i + "</div>", h += '<div class="ui-editor-dialog-footer"><button class="ui-editor-btn ui-editor-btn-blue ui-editor-dialog-ok ui-editor-mr">确定</button>', h += '<button class="ui-editor-btn ui-editor-dialog-close ui-editor-ml">取消</button>', h += "</div>", h += "</div>", dialog = a(h), a("body").append(dialog), null != f.width && dialog.css({width: f.width}), null != f.height && (1 == f.type ? (f.height.indexOf("%") >= 0 && (j = f.height.replace("%", ""), f.height = a(window).height() * j / 100), dialog.find(".ui-editor-dialog-iframe").css({height: f.height}), dialog.find(".ui-editor-dialog-footer").css({"border-width": "0"})) : dialog.css({height: f.height})), k = (a(window).width() - dialog.outerWidth()) / 2, l = (a(window).height() - dialog.outerHeight()) / 2, dialog.css({
                    top: l,
                    left: k
                }).addClass("ui-editor-dialog-in"), d.close = function () {
                    dialog.removeClass(f.am).addClass("ui-editor-dialog-out").remove(), g.fadeOut(300, function () {
                        a(this).remove()
                    }), c.tipsHide(), c.parent = ""
                }, dialog.find(".ui-editor-dialog-close").click(function () {
                    d.close()
                }), dialog.find(".ui-editor-dialog-ok").click(function () {
                    f.ok(d)
                })
            }, c.hasScrollbar = function () {
                return document.body.scrollHeight > (window.innerHeight || document.documentElement.clientHeight)
            }, c.msg = function (a) {
                c.tipsShow({text: a.msg, id: a.id, tool: a.tool, align: "top-left"})
            }, c.tipsShow = function (b) {
                var d, e, f, g;
                if (c.tipsHide(), b.time = b.time || 3, b.tool = b.tool || !1, d = a(b.id), e = 0, f = 0, void 0 != d.css("display")) {
                    switch (b.tool && (d = a(b.id, c.tool)), 0 == d.length && (d = a(c.win)), g = a('<div class="ui-editor-tips-show ui-editor-tips-show-' + b.align + '">' + b.text + "</div>"), a("body").append(g), b.align) {
                        case"top":
                            e = d.offset().left - g.outerWidth() / 2 + d.outerWidth() / 2 + (c.hasScrollbar() ? -10 : -8), f = d.offset().top - g.outerHeight() - 10;
                            break;
                        case"top-left":
                            e = d.offset().left, f = d.offset().top - g.outerHeight() - 10;
                            break;
                        case"right":
                            e = d.offset().left + d.outerWidth() + 10, f = d.offset().top - g.outerHeight() / 2 + d.outerHeight() / 2;
                            break;
                        case"bottom":
                            e = d.offset().left - g.outerWidth() / 2 + d.outerWidth() / 2, f = d.offset().top + d.outerHeight() + 10
                    }
                    d.hasClass("ui-editor-icon") && !c.isfullscreen && (e += 10), g.css({left: e + "px", top: f + "px", position: "absolute"}), b.time > 0 && (c.timer = setInterval(function () {
                        a(".ui-editor-tips-show").remove()
                    }, 1e3 * b.time))
                }
            }, c.tipsHide = function () {
                clearInterval(c.timer), a(".ui-editor-tips-show").remove()
            }, c.insertRow = function (b, c) {
                var e, f, g, h, d = a(b).closest("table");
                d.find("td").removeClass("ui-editor-selected"), e = a(b).parent("tr"), f = a(b).parent("tr").prevAll().length + 1, g = a(d).find("tr").length, h = e.clone(!0), h.find("td").removeAttr("bgcolor").empty(), "after" == c ? g > f ? e.next().before(h) : a(d).append(h) : 1 == f ? a(d).prepend(h) : e.prev().after(h)
            }, c.insertCol = function (b, c) {
                var e, d = a(b).closest("table");
                d.find("td").removeClass("ui-editor-selected"), e = a(b).prevAll().length, "before" == c ? a(d).find("tr").each(function () {
                    a(this).children("td").each(function (b) {
                        b == e && a(this).before("<td></td>\n")
                    })
                }) : a(d).find("tr").each(function () {
                    a(this).children("td").each(function (b) {
                        b == e && a(this).after("\n<td></td>")
                    })
                })
            }, c.delRow = function (b, c) {
                var d, e, f;
                "row" == c ? (d = a(b).closest("table"), e = a(b).parent("tr").prevAll().length + 1, f = a(d).find("tr").length, e == f && 1 == f ? a(b).closest("table").remove() : a(b).closest("tr").remove()) : (e = a(b).prevAll().length + 1, f = a(b).parent("tr").find("td").length, d = a(b).closest("table"), e == f && 1 == f ? a(b).closest("table").remove() : a(d).find("tr :nth-child(" + e + ")").remove())
            }, c.delTable = function (b) {
                a(b).closest("table").remove()
            }, y = a(c).val() || a(c).html() || "", "" == y && (y = c.values), y = c.htmlCode(y), y = c.pageToHtml(y), z = "", A = c.menu.left || [], g) for (B = c.menu.right || ["about"], i = 0; i < B.length; i++) A.push(B[i]);
            for (i = 0; i < A.length; i++) if ("|" == A[i]) z += '<a class="ui-editor-mid' + (g ? "s" : "") + '"></a>'; else if ("br" == A[i]) z += '<a class="ui-editor-br' + (g ? "s" : "") + '"></a>'; else {
                if (C = c.btData(A[i]), f = C.name, D = C.arrow, E = C.icon ? C.icon : A[i], "" == c.upload && "upload" == A[i] || "" == c.saveurl && "down" == A[i]) continue;
                z += '<a href="javascript:;" class="ui-editor-icon ui-editor-tips" data-that="' + d + '" data-title="' + f + '" data-cmd="' + A[i] + '"><i class="ui-editor-icon-' + E + " ui-editor-action-" + A[i] + '"></i>' + D + "</a>"
            }
            if (F = "", !g) for (B = c.menu.right || ["about"], -1 == B.indexOf("about") && B.push(["about"]), i = 0; i < B.length; i++) "|" == B[i] ? F += '<a class="ui-editor-mid' + (g ? "s" : "") + '"></a>' : "br" == B[i] ? F += '<a class="ui-editor-br' + (g ? "s" : "") + '"></a>' : (C = c.btData(B[i]), f = C.name, D = C.arrow, E = C.icon ? C.icon : B[i], F += '<a href="javascript:;" class="ui-editor-icon ui-editor-tips" data-that="' + d + '" data-title="' + f + '" data-cmd="' + B[i] + '"><i class="ui-editor-icon-' + E + " ui-editor-action-" + B[i] + '"></i>' + D + "</a>");
            G = '<div class="ui-editor-wrap" id="ui_editor_' + b + '">', G += '    <div class="ui-editor-tool" id="ui_editor_tool_' + b + '"><div class="ui-editor-tool-left">' + z + '</div><div class="ui-editor-tool-right">' + F + '</div><div class="ui-editor-panel" id="ui_editor_panel_' + b + '"></div></div>', G += '    <div class="ui-editor-html"><iframe id="ui_editor_iframe_' + b + '" height="' + c.height + 'px" frameborder="0" scrolling="auto"></iframe><div class="ui-editor-code"><textarea id="ui_editor_textarea_' + b + '" style="height:' + c.height + 'px;display:none;"></textarea></div></div>', G += '    <div class="ui-editor-dragBg" id="ui_editor_dragBg_' + b + '"></div><div class="ui-editor-drag" id="ui_editor_drag_' + b + '"><i class="ui-editor-icon-drag"></i></div>', G += "</div>", a(c).after(G), c.form = a(c).closest("form"), c.editor = a("#ui_editor_" + b), c.tool = a("#ui_editor_tool_" + b), c.panel = a("#ui_editor_panel_" + b), c.iframe = a("#ui_editor_iframe_" + b), c.textarea = a("#ui_editor_textarea_" + b), c.dragBg = a("#ui_editor_dragBg_" + b), c.drag = a("#ui_editor_drag_" + b), c.win = c.iframe[0].contentWindow, c.doc = c.win.document, c.doc.open(), c.doc.write(c.frameHtml(y)), c.doc.close(), h && (c.doc.body.contentEditable = "true"), c.doc.designMode = "On", c.autofocus && c.focus(), "code" == c.mode && (c.mode = "html", c.changeMode("code")), a(c.drag).bind("mousedown", function (b) {
                var d, e;
                c.isDrag = !0, c.removePop(), c.hidePanel(), c.editor.css({position: "relative"}), c.dragBg.css({display: "block"}), d = b.clientY, e = c.iframe.outerHeight(), a(document).mousemove(function (a) {
                    if (c.isDrag) {
                        var b = a.clientY - d;
                        e + b > 100 ? (c.iframe.css({height: e + b + "px"}), c.textarea.css({height: e + b + "px"})) : (c.iframe.css({height: "100px"}), c.textarea.css({height: "100px"}))
                    }
                }).mouseup(function () {
                    c.isDrag = !1, c.dragBg.css({display: "none"}), c.editor.css({position: ""})
                })
            }), c.tool.find("a.ui-editor-icon").click(function (b) {
                if (!a(this).hasClass("ui-editor-disabled")) {
                    c.focus(), c.active(c.cmd, 0), b.preventDefault();
                    var d = a(this).data("cmd");
                    "" != d && (c.saveBookmark(), c.active(d, 1), c.exeCmd(d), c.parent = "")
                }
            }), c.panel.hover(function () {
            }, function () {
                c.active(c.cmd, 0), c.hidePanel(), c.removePop()
            }), a(document).scroll(function () {
                c.hidePanel(), c.removePop(), c.tipsHide()
            }), a(c.doc).scroll(function () {
                c.removePop()
            }), a(document).click(function (b) {
                var d = a(".ui-editor-wrap");
                d != b.target && 0 === d.has(b.target).length && (c.active(c.cmd, 0), c.hidePanel()), a(c.doc).find("table td").removeClass("ui-editor-selected"), c.save()
            }), c.textarea.click(function () {
                c.hidePanel()
            }), a(c.doc).bind("paste", function () {
                setTimeout(function () {
                    var d, e, f, b = a(c.doc).find("img");
                    for (i = 0; i < b.length; i++) d = a(b[i]), e = d.attr("src"), "data:image" == e.substr(0, 10) && (f = c.dataURItoBlob(e), c.ajaxUpload({
                        data: f, isblob: !0, source: d, success: function (a, b) {
                            b.attr("src", a.msg)
                        }
                    }))
                }, 100)
            }), a(c.doc).click(function (b) {
                var f, g, h, j, l, m, n, o, p, q;
                if (c.active(c.cmd, 0), c.hidePanel(), c.menu.left, a.each(c.button, function (a) {
                    var d = a;
                    "align" == d && (d = "justifyleft"), "list" == d && (d = "InsertUnorderedList");
                    try {
                        c.doc.queryCommandState(d) ? (c.actname = d, c.active(d, 1)) : c.active(d, 0)
                    } catch (e) {
                    }
                }), f = b.target, g = k[f.tagName.toLowerCase()], g && (c.removePop(), c.isPop = !0, h = a(f).offset().left + c.iframe.offset().left + a(f).outerWidth() / 2, j = c.iframe.offset().top - a(window).scrollTop() + (a(f).offset().top - a(c.doc).scrollTop()) + a(f).outerHeight() + 20, ("p" == g || "div" == g) && (c.parent = a(f)), "link" == g && (c.parent = a(f), c.parent && (l = c.parent.attr("href") || "", m = '<div class="ui-editor-popup"><div class="ui-editor-popup-link">', m += '<div class="ui-editor-popup-open ui-editor-tips" data-that="' + d + '" data-title="打开链接"><a href="' + l + '" target="_blank">' + l + '</a></div><div class="ui-editor-popup-mid"></div>', m += '<div class="ui-editor-popup-icon ui-editor-tips" data-that="' + d + '" data-title="修改链接"><a href="javascript:;" class="ui-popup-edit" data-cmd="link" data-that="' + d + '"><i class="ui-editor-icon-editlink"></i></a></div><div class="ui-editor-popup-mid"></div>', m += '<div class="ui-editor-popup-icon ui-editor-tips" data-that="' + d + '" data-title="清除链接"><a href="javascript:;" class="ui-popup-unlink" data-that="' + d + '"><i class="ui-editor-icon-unlink"></i></a></div>', m += "</div></div>", a("body").append(m), h -= a(".ui-editor-popup").outerWidth() / 2, a(".ui-editor-popup").css({
                    left: h + "px",
                    top: j + "px",
                    display: "block"
                }))), "pre" == g && (c.parent = a(f), m = '<div class="ui-editor-popup"><div class="ui-editor-popup-link">', m += '<div class="ui-editor-popup-icon ui-editor-tips" data-that="' + d + '" data-title="上方新增行"><a href="javascript:;" class="ui-popup-line" data-cmd="' + g + '" data-that="' + d + '" data-type="before"><i class="ui-editor-icon-before"></i></a></div><div class="ui-editor-popup-mid"></div>', m += '<div class="ui-editor-popup-icon ui-editor-tips" data-that="' + d + '" data-title="下方新增行"><a href="javascript:;" class="ui-popup-line" data-cmd="' + g + '" data-that="' + d + '" data-type="after"><i class="ui-editor-icon-after"></i></a></div><div class="ui-editor-popup-mid"></div>', m += '<div class="ui-editor-popup-icon ui-editor-tips" data-that="' + d + '" data-title="删除"><a href="javascript:;" class="ui-popup-del" data-that="' + d + '"><i class="ui-editor-icon-delete"></i></a></div>', m += "</div></div>", a("body").append(m), h -= a(".ui-editor-popup").outerWidth() / 2, a(".ui-editor-popup").css({
                    left: h + "px",
                    top: j + "px",
                    display: "block"
                })), "table" == g && (c.parent = a(f), n = b.target, o = a(n).closest("table"), c.parent))) {
                    for (o.find("td").not(a(n)).removeClass("ui-editor-selected"), a(n).addClass("ui-editor-selected"), p = c.bgcolor || r, q = '<div class="ui-editor-popup-bgcolor">', q += '  <div class="ui-editor-bgcolor-box">', i = 0; i < p.length; i++) q += '<div class="ui-editor-bgcolor-item" data-color="' + p[i] + '" data-that="' + d + '"><span><i style="background:#' + p[i] + '"></i></span></div>';
                    for (q += "  </div>", q += "</div>", m = '<div class="ui-editor-popup ui-editor-popup-table"><div class="ui-editor-popup-link">', p = [{a: "addrow", n: "插入行-上方", c: "before", i: "insertrowbefore", o: ""}, {a: "addrow", n: "插入行-下方", c: "after", i: "insertrowafter", o: ""}, {a: "addcol", n: "插入列-左侧", c: "before", i: "insertcolbefore", o: ""}, {a: "addcol", n: "插入列-右侧", c: "after", i: "insertcolafter", o: ""}, {a: "delrow", n: "删除行", c: "row", i: "delrow", o: ""}, {
                        a: "delrow",
                        n: "删除列",
                        c: "col",
                        i: "delcol",
                        o: ""
                    }, {a: "deltable", n: "删除表格", c: "deltable", i: "deltable", o: ""}, {
                        a: "color",
                        n: "背景颜色",
                        c: "",
                        i: "bgcolor",
                        o: q
                    }], i = 0; i < p.length; i++) m += '<div class="ui-editor-popup-icon ui-editor-tips" data-that="' + d + '" data-title="' + p[i].n + '"><a href="javascript:;" class="ui-popup-' + p[i].a + '" data-cmd="' + p[i].c + '" data-that="' + d + '" data-type="table"><i class="ui-editor-icon-' + p[i].i + '"></i>' + p[i].o + "</a></div>" + (i != p.length - 1 && 3 != i ? '<div class="ui-editor-popup-mid"></div>' : "");
                    m += "</div></div>", a("body").append(m), h -= a(".ui-editor-popup").outerWidth() / 2, a(".ui-editor-popup").css({left: h + "px", top: j + "px", display: "block"})
                }
            }), a(c.doc).mousedown(function (b) {
                var e, f, g, h, j, k;
                if (a(c.doc).find("table td").removeClass("ui-editor-selected"), e = b.target, f = l[e.tagName.toLowerCase()], f) {
                    if (c.removePop(), g = a(e).offset().left + c.iframe.offset().left, h = c.iframe.offset().top - a(window).scrollTop() + (a(e).offset().top - a(c.doc).scrollTop()), ("image" == f || "music" == f || "video" == f) && (c.isfullscreen && 10 >= g && (g = 0), h < c.iframe.offset().top - a(window).scrollTop() && (h = c.iframe.offset().top - a(window).scrollTop()), c.parent = a(e), c.parent.length > 0)) {
                        for (j = '<div class="ui-editor-popup ui-editor-popup-row"><div class="ui-editor-popup-link">', k = [{a: "edit", n: "修改", c: f, i: "editlink"}, {a: "align", n: "左对齐", c: "left", i: "left"}, {a: "align", n: "右对齐", c: "right", i: "right"}, {a: "align", n: "取消对齐", c: "delete", i: "canel"}, {
                            a: "del",
                            n: "删除",
                            c: "",
                            i: "delete"
                        }], i = 0; i < k.length; i++) ("music" != f && "video" != f || "align" != k[i].a) && (j += '<div class="ui-editor-popup-icon ui-editor-tips" data-that="' + d + '" data-align="right" data-title="' + k[i].n + '"><a href="javascript:;" class="ui-popup-' + k[i].a + '" data-cmd="' + k[i].c + '" data-that="' + d + '" data-type="image"><i class="ui-editor-icon-' + k[i].i + '"></i></a></div>' + (i != k.length - 1 ? '<div class="ui-editor-popup-mid"></div>' : ""));
                        j += "</div></div>", a("body").append(j), g = g - a(".ui-editor-popup").outerWidth() - 15, c.isfullscreen && g <= a(".ui-editor-popup").outerWidth() && (g = 0), a(".ui-editor-popup").css({left: g + "px", top: h + "px", display: "block"})
                    }
                    c.saveBookmark()
                } else c.removePop()
            }), a(document).off("click", ".ui-popup-addrow").on("click", ".ui-popup-addrow", function () {
                var c = a(this).data("cmd"), d = a(this).data("that"), e = a("#" + d)[0];
                e.insertRow(e.parent, c), e.removePop()
            }), a(document).off("click", ".ui-popup-addcol").on("click", ".ui-popup-addcol", function () {
                var b = a(this).data("cmd"), c = a(this).data("that"), d = a("#" + c)[0];
                d.insertCol(d.parent, b), d.removePop()
            }), a(document).off("click", ".ui-popup-delrow").on("click", ".ui-popup-delrow", function () {
                var b = a(this).data("cmd"), c = a(this).data("that"), d = a("#" + c)[0];
                d.delRow(d.parent, b), d.removePop()
            }), a(document).off("click", ".ui-popup-deltable").on("click", ".ui-popup-deltable", function () {
                var b = a(this).data("that"), c = a("#" + b)[0];
                c.delTable(c.parent), c.removePop()
            }), a(document).off("click", ".ui-popup-edit").on("click", ".ui-popup-edit", function () {
                var b = a(this).data("cmd"), c = a(this).data("that"), d = a("#" + c)[0];
                d.saveBookmark(), d.active(b, 1), d.exeCmd(b), d.removePop()
            }), a(document).off("click", ".ui-popup-unlink").on("click", ".ui-popup-unlink", function () {
                var b = a(this).data("that"), c = a("#" + b)[0], d = "unlink";
                c.active(d, 1), c.exeCmd(d), c.removePop()
            }), a(document).off("click", ".ui-popup-color").on("click", ".ui-popup-color", function () {
                var c = a(this).data("that"), d = a("#" + c)[0];
                a(".ui-editor-popup-bgcolor").toggle(), d.isPop = !0
            }), a(document).off("click", ".ui-editor-bgcolor-item").on("click", ".ui-editor-bgcolor-item", function () {
                var c = a(this).data("that"), d = a("#" + c)[0], e = a(this).data("color");
                d.parent.attr("bgcolor", e), d.removePop()
            }), a(document).off("click", ".ui-popup-align").on("click", ".ui-popup-align", function () {
                var c = a(this).data("that"), d = a("#" + c)[0], e = a(this).data("cmd");
                a(this).data("type"), "delete" != e ? d.parent.attr("align", e) : d.parent.removeAttr("align"), d.removePop()
            }), a(document).off("click", ".ui-popup-line").on("click", ".ui-popup-line", function () {
                var b = a(this).data("that"), c = a(this).data("type"), d = a("#" + b)[0], e = a(this).data("cmd"), f = a(d.parent).closest(e);
                "before" == c ? f.before("<p>&nbsp;</p>") : f.after("<p>&nbsp;</p>"), d.removePop()
            }), a(document).off("click", ".ui-popup-del").on("click", ".ui-popup-del", function () {
                var b = a(this).data("that"), c = a("#" + b)[0];
                a(c.parent).remove(), c.parent = "", c.removePop()
            }), a(document).off("mouseenter", ".ui-editor-tips").on("mouseenter", ".ui-editor-tips", function () {
                var b, c, d;
                a(this).hasClass("ui-editor-disabled") || (b = a(this).data("align") || "", c = a(this).data("that"), d = a("#" + c)[0], b = "" == b ? "top" : b, "" != a(this).data("title") && (d.isfullscreen && "top" == b && a(this).hasClass("ui-editor-icon") && (b = "bottom"), d.tipsShow({text: a(this).data("title"), id: this, align: b})))
            }), a(document).off("mouseleave", ".ui-editor-tips").on("mouseleave", ".ui-editor-tips", function () {
                var b = a(this).data("that"), c = a("#" + b)[0];
                c.tipsHide()
            }), a(document).off("click", ".ui-editor-tips").on("click", ".ui-editor-tips", function () {
                var b = a(this).data("that"), c = a("#" + b)[0];
                c.tipsHide()
            }), a(c.doc).keyup(function (a) {
                (46 == a.keyCode || 8 == a.keyCode && h) && c.removePop()
            })
        })
    }
}(jQuery);