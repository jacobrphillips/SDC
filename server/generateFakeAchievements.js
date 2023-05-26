import faker from "faker";

const generateFakeAchievement = () => {
  const achievement = {
    product_id: faker.datatype.number({ min: 1, max: 10000 }),
    name: faker.lorem.word(),
    xp: faker.datatype.number({ min: 1, max: 100 }),
    image: faker.image.imageUrl(),
    trophy_type: faker.random.arrayElement(["Bronze", "Silver", "Gold", "Platinum"]),
  };

  return achievement;
};

export default generateFakeAchievement;
