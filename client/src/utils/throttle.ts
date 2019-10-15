/**
 * 节流函数
 */
export const throttle = (fn:() => any,delay:number) => {

    delay = delay || 200;
    let timer: number = 0;
    let current: number = 0;
    let past:number = 0;
    let context: any = '';
    let args: any = '';

    function execute() {
        // @ts-ignore
        fn.call(context, args);
        past = current;
    }

    return function () {
        // @ts-ignore
        context = this;
        args = arguments;
        if (timer) { //清除上一次的定时任务
            clearTimeout(timer);
            timer = 0;
        }

        current = +new Date();
        if (!past) { //一开始执行一次
            execute()
        } else {
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