const db = require('./db');

async function save(body) {
    await db.query(
        `INSERT INTO author(firstName, lastName, year_of_birth)
         VALUES ('${body.first}', '${body.last}', '${body.yob}');`);

    return 'Author saved successfully!'
}

module.exports = {
    save
}