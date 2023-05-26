import faker from "faker";

const generateFakeAnotherRating = () => {
  const title = faker.lorem.words(3);
  const review = faker.lorem.paragraph();
  const rating = faker.datatype.number({ min: 1, max: 5 }).toString();
  const author = faker.name.findName();
  const product_id = faker.datatype.number({ min: 1, max: 100 });
  const url = faker.internet.url();

  return {
    title,
    review,
    rating,
    author,
    product_id,
    url,
  };
};

export default generateFakeAnotherRating;
