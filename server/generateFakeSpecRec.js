import faker from "faker";

function generateFakeSpecRec() {
  const fakeSpecsRec = [];

  const specsRec = {
    os: faker.random.arrayElement(["Windows", "Mac OS", "Linux"]),
    processor: faker.random.arrayElement(["Intel", "AMD"]),
    memory: faker.random.arrayElement(["8GB", "16GB", "32GB"]),
    storage: faker.random.arrayElement(["256GB SSD", "512GB SSD", "1TB HDD"]),
    directx: faker.random.arrayElement(["DirectX 11", "DirectX 12"]),
    logins: faker.random.arrayElement(["Single player", "Multiplayer"]),
    languageSupported: faker.random.arrayElement([
      "English",
      "French",
      "German",
      "Spanish",
    ]),
    graphics: faker.random.arrayElement(["NVIDIA GeForce", "AMD Radeon"]),
    other: faker.random.words(5),
  };

  fakeSpecsRec.push(specsRec);
  return fakeSpecsRec;
}

export default generateFakeSpecRec;
