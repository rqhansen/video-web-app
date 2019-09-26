interface ISearchInfo {
    page: string, //当搜索的页数
    searchName: string //当前搜索的电影名称   
}

const searchInfo: ISearchInfo = {
    page: '1',
    searchName: ''
}

export default searchInfo