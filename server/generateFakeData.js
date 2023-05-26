import faker from "faker";

  const generateFakeProduct = () => {
    const product = {
      title: faker.commerce.productName(),
      esrb_desc: faker.lorem.sentence(),
      esrb: faker.random.arrayElement(['E', 'E10+', 'T', 'M', 'AO']),
      price: faker.commerce.price(),
      developer: faker.company.companyName(),
      publisher: faker.company.companyName(),
      releasedate: faker.date.past(),
      platform: faker.random.arrayElement(['PC', 'PlayStation', 'Xbox', 'Nintendo Switch']),
      description: faker.lorem.paragraph(),
      refundtype: faker.random.arrayElement(['Full', 'Partial', 'No Refund']),
      storyboard: faker.lorem.paragraph(),
      refund_link: faker.internet.url(),
      picture: faker.datatype.boolean(),
      color: faker.commerce.color(),
      esrb_img: faker.datatype.boolean(),
      add_ons: faker.datatype.boolean(),
      achievements: faker.datatype.boolean(),
      description_img: faker.datatype.boolean(),
      overall_rating: faker.datatype.float({ min: 1, max: 10, precision: 0.1 }),
      total_achievements: faker.datatype.number({ min: 0, max: 1000 }),
    };
  
    return product;
  };
  

const numberOfProducts = 10000;
const fakeProducts = [];

for (let i = 0; i < numberOfProducts; i++) {
  fakeProducts.push(generateFakeProduct());
}

export default fakeProducts;
