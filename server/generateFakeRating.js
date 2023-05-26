import faker from "faker"

const generateFakeRating = () => {
  const rating = {
    product_id: null,
    title: faker.lorem.words(3),
    icon: faker.image.imageUrl(),
    created_at: faker.date.recent(),
  };

  return rating;
};

export default generateFakeRating;
