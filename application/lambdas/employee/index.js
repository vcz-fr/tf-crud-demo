const CRUD = require("crud.js");
const UUIDv4 = require("uuid/v4")

exports.handler = async (event, _) => {
    const requestBody = event.httpMethod !== 'GET' ?
        JSON.parse(event.body) :
        event.queryStringParameters;

    let statusCode = 200;
    let body = "";

    switch (event.httpMethod) {
        case 'GET':
            body = CRUD.readItem({ cid: requestBody.cid });
            statusCode = 200;
            break;

        case 'POST':
            body = CRUD.createItem({ cid: UUIDv4(), name: requestBody.name, age: requestBody.age });
            statusCode = 201;
            break;

        case 'PUT':
            body = CRUD.updateItem({ cid: requestBody.cid }, { name: requestBody.name, age: requestBody.age });
            statusCode = 200;
            break;

        case 'DELETE':
            body = CRUD.deleteItem({ cid: requestBody.cid });
            statusCode = 204;
            break;

        default:
            break;
    }

    return { statusCode, body };
}
