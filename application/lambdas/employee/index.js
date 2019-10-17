const CRUD = require("crud.js");
const UUIDv4 = require("uuid/v4")

exports.handler = async (event, _) => {
    const requestBody = event.httpMethod !== 'GET' ?
        JSON.parse(event.body) :
        event.queryStringParameters;

    let statusCode = 400;
    let body = "";

    switch (event.httpMethod) {
        case 'GET':
            body = CRUD.readItem({
                uid: requestBody.uid
            });
            statusCode = 200;
            break;

        case 'POST':
            body = CRUD.createItem({
                uid: UUIDv4(),
                name: requestBody.name,
                age: requestBody.age
            });
            statusCode = 201;
            break;

        case 'PUT':
            body = CRUD.updateItem({
                uid: requestBody.uid
            }, {
                name: requestBody.name,
                age: requestBody.age
            });
            statusCode = 200;
            break;

        case 'DELETE':
            body = CRUD.deleteItem({
                uid: requestBody.uid
            });
            statusCode = 204;
            break;

        default:
            break;
    }

    return { statusCode, body };
}
