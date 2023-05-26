import faker from "faker"

function generateFakeSocials(numRecords) {
  const socials = [];

  for (let i = 0; i < numRecords; i++) {
    const url = faker.internet.url();
    const name = faker.company.companyName();
    const product_id = faker.datatype.number();

    const social = {
        url: url || faker.internet.url(),
      name,
      product_id,
    };

    socials.push(social);
  }

  return socials;
}

export default generateFakeSocials;