import faker from "faker";

function generateFakeFeature(productId) {
  const name = faker.lorem.word();
  const url = faker.internet.url();

  return {
    name,
    product_id: productId,
    url,
  };
}

export default generateFakeFeature;
