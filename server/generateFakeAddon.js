import faker from "faker";

const generateFakeAddon = () => {
  const addon = {
    name: faker.commerce.productName(),
    price: faker.datatype.number({ min: 1, max: 100 }),
    description: faker.lorem.paragraph(),
    product_id: null, // Will be assigned later
    image: faker.image.imageUrl(),
    pageurl: faker.internet.url(),
  };

  return addon;
};

export default generateFakeAddon;
