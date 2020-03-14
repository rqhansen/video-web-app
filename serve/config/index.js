
module.exports.limitSeconds = 259200000;
module.exports.connectConfig = { //数据库连接池的配置
    // host: '127.0.0.1',
    // user: 'root',
    // password: 'admin',
    // database: 'movie'
    // host: '154.92.17.228',
    host: '42.51.29.9',
    user: 'movie',
    password: 'admin',
    database: 'movie'
}
module.exports.movieTypes = [ //电影类型
    { '1': 'action' },
    { '2': 'comedy' },
    { '3': 'romance' },
    { '4': 'science' },
    { '5': 'drama' },
    { '6': 'suspense' },
    { '7': 'war' },
    { '8': 'thrill' },
    { '9': 'horror' },
    { '10': 'disaster' },
    { '11': 'cartoon' }
];


module.exports.handleTokenParams = {
    secret: "rq's movie web app"
};

