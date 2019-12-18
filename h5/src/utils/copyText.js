/**
 * 复制文本
 */
export function copyText(text) {
    var container = document.body
    var isRTL = document.documentElement.getAttribute('dir') == 'rtl'
    var copyDom = document.getElementsByClassName('copyDom')
    if (copyDom && copyDom.length > 0) {
        container.removeChild(copyDom[0])
    }
    var fakeElem = document.createElement('textarea')
    // Prevent zooming on iOS
    fakeElem.style.fontSize = '12pt'
    // Reset box model
    fakeElem.style.border = '0'
    fakeElem.style.padding = '0'
    fakeElem.style.margin = '0'
    // Move element out of screen horizontally
    fakeElem.style.position = 'absolute'
    fakeElem.style[isRTL ? 'right' : 'left'] = '-9999px'
    // Move element to the same position vertically
    var yPosition = window.pageYOffset || document.documentElement.scrollTop
    fakeElem.style.top = yPosition + 'px'

    fakeElem.setAttribute('readonly', '')
    fakeElem.className = 'copyDom'
    fakeElem.value = text
    container.appendChild(fakeElem)
    fakeElem.select()
    fakeElem.setSelectionRange(0, fakeElem.value.length)

    window.selectedText = fakeElem.value
    var succeeded = void 0

    try {
        succeeded = document.execCommand('copy')
    } catch (err) {
        succeeded = false
    }
    return succeeded
}