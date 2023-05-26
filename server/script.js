import http from 'k6/http';
import { randomIntBetween } from 'https://jslib.k6.io/k6-utils/1.2.0/index.js';
import { sleep } from 'k6';

export default function () {
    let id = randomIntBetween(1, 10003);
  http.get(`http://localhost:3000/api/product/${id}`);
  sleep(1);
}