
function getHead() {
    return document.getElementsByTagName('head')[0];
}

function getHttpEquiv() {
    return document.getElementById('httpEquiv');
}

function getMeta(id:string) {
    return document.getElementById(id);
}

function createMeta ( name: string, id: string, content:string ) {
    let meta = document.createElement('meta');
    meta.name = name;
    meta.id = id;
    meta.content = content;
    return meta;
}

export const setTitle = (content: string) => {
    document.title = content;
}

export const setMeta = ( name:string,id:string,content:string ) => {
    const head = getHead();
    const meta = getMeta(id);
    if(meta) {
        // @ts-ignore
        meta.content = content;
    } else {
        const meta = createMeta(name,id,content);
        const charset = getHttpEquiv();
        head.insertBefore(meta,charset);
    }
}
