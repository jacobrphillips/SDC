import faker from "faker"

const generateFakeMedia = () => {
  const url = faker.internet.url();
  const alt = faker.lorem.words(3);
  const product_id = faker.datatype.number({ min: 1, max: 100 });
  const mediatype = faker.random.arrayElement(['image', 'video']);
  const img = faker.image.imageUrl();

  return {
    url,
    alt,
    product_id,
    mediatype,
    img,
  };
};

export default generateFakeMedia;
