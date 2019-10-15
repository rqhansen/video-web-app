/**
 * 节流函数
 */
// @ts-ignore
export const throttle = (fn,delay) => {
    delay = delay || 200;
    // @ts-ignore
    let timer, current, past, context, args;

    function execute() {
        // @ts-ignore
        fn.call(context, args);
        // @ts-ignore
        past = current;
    }

    return function () {
    // @ts-ignore
        context = this;
        args = arguments;
        // @ts-ignore
        if (timer) { //清除上一次的定时任务
            // @ts-ignore
            clearTimeout(timer);
            timer = null;
        }

        current = +new Date();
        // @ts-ignore
        if (!past) { //一开始执行一次
            execute()
        } else {
            // @ts-ignore
            let diff = delay - (current - past);
            if (diff <= 0) {
                execute();
            } else {
                timer = setTimeout(function () {
                    execute();
                }, diff)
            }
        }
    }
}