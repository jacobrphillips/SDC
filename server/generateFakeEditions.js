import faker from "faker";

function generateFakeEdition() {
  const price = faker.datatype.number({ min: 10, max: 100 });
  const name = faker.commerce.productName();
  const description = faker.lorem.sentences(3);
  const product_id = faker.datatype.number({ min: 1, max: 10 }); // Adjust the range as per your product IDs
  const image = faker.image.imageUrl();
  const pageurl = faker.internet.url();

  return {
    price,
    name,
    description,
    product_id,
    image,
    pageurl,
  };
}

export default generateFakeEdition;
