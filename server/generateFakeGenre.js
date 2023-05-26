import faker from "faker"

function generateFakeGenre() {
  const name = faker.random.word();
  const product_id = faker.datatype.number();
  const url = faker.internet.url();

  return {
    name,
    product_id,
    url,
  };
}

export default generateFakeGenre;
