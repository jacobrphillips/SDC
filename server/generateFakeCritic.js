import faker from "faker";

const generateFakeCritic = () => {
  const critic = {
    product_id: faker.datatype.number({ min: 1, max: 10000 }),
    name: faker.name.findName(),
    rating: faker.random.arrayElement(["Positive", "Neutral", "Negative"]),
    created_at: faker.date.past(),
  };

  return critic;
};

const numberOfCritics = 1; // Adjust the number of critics as needed
const fakeCritics = [];

for (let i = 1; i <= numberOfCritics; i++) {
  const critic = generateFakeCritic();
  fakeCritics.push(critic);
}

export default generateFakeCritic;
