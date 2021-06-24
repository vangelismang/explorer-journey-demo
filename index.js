const express = require('express');
const app = express();
const cors = require('cors');
const port = 3000;
const router = require('./routes/authorRoute');

app.use(cors());
app.use(express.json());
app.use(
    express.urlencoded({
        extended: true,
    })
);

app.get('/', (req, res) => {
    res.json({'message': 'ok'});
})

app.use('/authors', router);


app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
});