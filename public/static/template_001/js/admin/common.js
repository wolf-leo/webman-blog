async function fetchApi(url, param, close, reload) {
    await fetch(url, {
        method: 'post',
        body: JSON.stringify(param || {}),
        headers: {'Content-Type': 'application/json'}
    }).then(function (response) {
        return response.json()
    }).then(function (res) {
        let code = res.code || 0
        if (code != '1') {
            layer.msg(res.msg, {icon: 0})
            return false
        }
        layer.msg(res.msg, {icon: 1})
        if (close) {
            setTimeout(function () {
                layer.closeAll()
            }, 700)
        }
        if (reload) {
            setTimeout(function () {
                window.parent.location.reload();
                parent.layer.close(parent.layer.getFrameIndex(window.name));
            }, 700)
        }
        return true
    })
}

function getArea() {
    if (isWap()) return ['100%', '100%'];
    return ['75%', '80%'];
}

function isWap() {
    let isWap = {
        Android: function () {
            return navigator.userAgent.match(/Android/i) ? true : false;
        },
        BlackBerry: function () {
            return navigator.userAgent.match(/BlackBerry/i) ? true : false;
        },
        iOS: function () {
            return navigator.userAgent.match(/iPhone|iPad|iPod/i) ? true : false;
        },
        Windows: function () {
            return navigator.userAgent.match(/IEMobile/i) ? true : false;
        },
        any: function () {
            return (isWap.Android() || isWap.BlackBerry() || isWap.iOS() || isWap.Windows());
        }
    };
    return isWap.any();
}

console.log("%c wolfcode-blog 程序支持：https://www.wolfcode.net", "font-size:18px;color:blue;text-fill-color:red;-webkit-text-stroke: 1px red;")