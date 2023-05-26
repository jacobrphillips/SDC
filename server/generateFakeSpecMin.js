import faker from "faker"

function generateFakeSpecsMin() {
  const fakeSpecsMin = [];

  
    const specsMin = {
      section_header: faker.lorem.sentence(),
      languages: faker.lorem.words(),
      os: faker.lorem.word(),
      processor: faker.lorem.words(),
      memory: faker.datatype.number({ min: 1, max: 32 }) + ' GB',
      storage: faker.datatype.number({ min: 128, max: 2048 }) + ' GB',
      directx: faker.datatype.number({ min: 9, max: 12 }),
      logins: faker.datatype.boolean() ? 'Single-player' : 'Multi-player',
      product_id: null, // Will be assigned later
      graphics: faker.lorem.word(),
      other: faker.lorem.sentence(),
    };

    fakeSpecsMin.push(specsMin);
 

  return fakeSpecsMin;
}

export default generateFakeSpecsMin;
