const { Pool } = require("pg");
const faker = require("faker");

const connectionString = "postgres://postgres:docker@database:5432/epic";
const pool = new Pool({ connectionString: connectionString });

(async () => {
  try {
    // Connect to the database
    const client = await pool.connect();

    const { default: fakeProducts } = await import("./generateFakeData.js");
    const { default: generateFakeAchievement } = await import(
      "./generateFakeAchievements.js"
    );
    const { default: generateFakeAddon } = await import(
      "./generateFakeAddon.js"
    );
    const { default: generateFakeCritic } = await import(
      "./generateFakeCritic.js"
    );
    const { default: generateFakeEdition } = await import(
      "./generateFakeEditions.js"
    );
    const { default: generateFakeRating } = await import(
      "./generateFakeRating.js"
    );
    const { default: generateFakeFeature } = await import(
      "./generateFakeFeature.js"
    );
    const { default: generateFakeGenre } = await import(
      "./generateFakeGenre.js"
    );
    const { default: generateFakeMedia } = await import(
      "./generateFakeMedia.js"
    );
    const { default: generateFakeAnotherRating } = await import(
      "./generateFakeAnotherRating.js"
    );
    const { default: generateFakeSocials } = await import(
      "./generateFakeSocial.js"
    );
    const { default: generateFakeSpecMin } = await import(
      "./generateFakeSpecMin.js"
    );
    const { default: generateFakeSpecRec } = await import(
      "./generateFakeSpecRec.js"
    );

    // Insert the fake products into the database
    await Promise.all(
      fakeProducts.map(async (product) => {
        const query = `
          INSERT INTO product (
            title, esrb_desc, esrb, price, developer, publisher, 
            releasedate, platform, description, refundtype, storyboard, 
            refund_link, picture, color, esrb_img, add_ons, achievements, 
            description_img, overall_rating, total_achievements
          )
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20)
          RETURNING id
        `;

        const values = [
          product.title,
          product.esrb_desc,
          product.esrb,
          product.price,
          product.developer,
          product.publisher,
          product.releasedate,
          product.platform,
          product.description,
          product.refundtype,
          product.storyboard,
          product.refund_link,
          product.picture,
          product.color,
          product.esrb_img,
          product.add_ons,
          product.achievements,
          product.description_img,
          product.overall_rating,
          product.total_achievements,
        ];

        const result = await client.query(query, values);
        const productId = result.rows[0].id; // Retrieve the generated product ID

        // Generate fake achievements for the current product
        const numberOfAchievements = 1; // Adjust the number of achievements as needed
        const fakeAchievements = [];

        for (let i = 1; i <= numberOfAchievements; i++) {
          const achievement = generateFakeAchievement();
          achievement.product_id = productId; // Assign the product ID to the achievement
          fakeAchievements.push(achievement);
        }

        // Insert the fake achievements into the database
        await Promise.all(
          fakeAchievements.map(async (achievement) => {
            const achievementQuery = `
              INSERT INTO achievements (product_id, name, xp, image, trophy_type)
              VALUES ($1, $2, $3, $4, $5)
            `;

            const achievementValues = [
              achievement.product_id,
              achievement.name,
              achievement.xp,
              achievement.image,
              achievement.trophy_type,
            ];

            await client.query(achievementQuery, achievementValues);
          })
        );

        // Generate fake addons for the current product
        const numberOfAddons = 1; // Adjust the number of addons as needed
        const fakeAddons = [];

        for (let i = 1; i <= numberOfAddons; i++) {
          const addon = generateFakeAddon();
          addon.product_id = productId; // Assign the product ID to the addon
          fakeAddons.push(addon);
        }

        // Insert the fake addons into the database
        await Promise.all(
          fakeAddons.map(async (addon) => {
            const addonQuery = `
              INSERT INTO addons (name, price, description, product_id, image, pageurl)
              VALUES ($1, $2, $3, $4, $5, $6)
            `;

            const addonValues = [
              addon.name,
              addon.price,
              addon.description,
              addon.product_id,
              addon.image,
              addon.pageurl,
            ];

            await client.query(addonQuery, addonValues);
          })
        );

        // Generate fake critics for the current product
        const numberOfCritics = 1; // Adjust the number of critics as needed
        const fakeCritics = [];

        for (let i = 1; i <= numberOfCritics; i++) {
          const critic = generateFakeCritic();
          critic.product_id = productId; // Assign the product ID to the critic
          fakeCritics.push(critic);
        }

        // Insert the fake critics into the database
        await Promise.all(
          fakeCritics.map(async (critic) => {
            const criticQuery = `
              INSERT INTO critics (product_id, name, rating, created_at)
              VALUES ($1, $2, $3, $4)
            `;

            const criticValues = [
              critic.product_id,
              critic.name,
              critic.rating,
              critic.created_at,
            ];

            await client.query(criticQuery, criticValues);
          })
        );

        // Generate fake editions for the current product
        const numberOfEditions = 1; // Adjust the number of editions as needed
        const fakeEditions = [];

        for (let i = 1; i <= numberOfEditions; i++) {
          const edition = generateFakeEdition();
          edition.product_id = productId; // Assign the product ID to the edition
          fakeEditions.push(edition);
        }

        // Insert the fake editions into the database
        await Promise.all(
          fakeEditions.map(async (edition) => {
            const editionQuery = `
              INSERT INTO editions (price, name, description, product_id, image, pageurl)
              VALUES ($1, $2, $3, $4, $5, $6)
            `;

            const editionValues = [
              edition.price,
              edition.name,
              edition.description,
              edition.product_id,
              edition.image,
              edition.pageurl,
            ];

            await client.query(editionQuery, editionValues);
          })
        );

        // Generate fake ratings for the current product
        const numberOfRatings = 1; // Adjust the number of ratings as needed
        const fakeRatings = [];

        for (let i = 1; i <= numberOfRatings; i++) {
          const rating = generateFakeRating();
          rating.product_id = productId; // Assign the product ID to the rating
          fakeRatings.push(rating);
        }

        // Insert the fake ratings into the database
        await Promise.all(
          fakeRatings.map(async (rating) => {
            const ratingQuery = `
              INSERT INTO epicratings (product_id, title, icon, created_at)
              VALUES ($1, $2, $3, $4)
            `;

            const ratingValues = [
              rating.product_id,
              rating.title,
              rating.icon,
              rating.created_at,
            ];

            await client.query(ratingQuery, ratingValues);
          })
        );

        // Generate fake features for the current product
        const numberOfFeatures = 1; // Adjust the number of features as needed
        const fakeFeatures = [];

        for (let i = 1; i <= numberOfFeatures; i++) {
          const feature = generateFakeFeature();
          feature.product_id = productId; // Assign the product ID to the feature
          fakeFeatures.push(feature);
        }

        // Insert the fake features into the database
        await Promise.all(
          fakeFeatures.map(async (feature) => {
            const featureQuery = `
              INSERT INTO features (name, product_id, url)
              VALUES ($1, $2, $3)
            `;

            const featureValues = [
              feature.name,
              feature.product_id,
              feature.url,
            ];

            await client.query(featureQuery, featureValues);
          })
        );
        // Generate fake genres for the current product
        const numberOfGenres = 1; // Adjust the number of genres as needed
        const fakeGenres = [];

        for (let i = 1; i <= numberOfGenres; i++) {
          const genre = generateFakeGenre();
          genre.product_id = productId; // Assign the product ID to the genre
          fakeGenres.push(genre);
        }

        // Insert the fake genres into the database
        await Promise.all(
          fakeGenres.map(async (genre) => {
            const genreQuery = `
      INSERT INTO genres (name, product_id, url)
      VALUES ($1, $2, $3)
    `;

            const genreValues = [genre.name, genre.product_id, genre.url];

            await client.query(genreQuery, genreValues);
          })
        );

        const numberOfMedia = 1; // Adjust the number of media as needed
        const fakeMedia = [];

        for (let i = 1; i <= numberOfMedia; i++) {
          const media = generateFakeMedia();
          media.product_id = productId; // Assign the product ID to the media
          fakeMedia.push(media);
        }

        await Promise.all(
          fakeMedia.map(async (media) => {
            const mediaQuery = `
              INSERT INTO media (url, alt, product_id, mediatype, img)
              VALUES ($1, $2, $3, $4, $5)
            `;

            const mediaValues = [
              media.url,
              media.alt,
              media.product_id,
              media.mediatype,
              media.img,
            ];

            await client.query(mediaQuery, mediaValues);
          })
        );
        // Generate fake ratings for the current product
        const numberOfAnotherRatings = 1; // Adjust the number of ratings as needed
        const fakeAnotherRatings = [];

        for (let i = 1; i <= numberOfAnotherRatings; i++) {
          const anotherRating = generateFakeAnotherRating();
          anotherRating.product_id = productId; // Assign the product ID to the rating
          fakeAnotherRatings.push(anotherRating);
        }

        // Insert the fake ratings into the database
        await Promise.all(
          fakeAnotherRatings.map(async (anotherrating) => {
            const ratingQuery = `
      INSERT INTO ratings (title, review, rating, author, product_id, url)
      VALUES ($1, $2, $3, $4, $5, $6)
    `;

            const ratingValues = [
              anotherrating.title,
              anotherrating.review,
              anotherrating.rating,
              anotherrating.author,
              anotherrating.product_id,
              anotherrating.url,
            ];

            await client.query(ratingQuery, ratingValues);
          })
        );
        const numberOfSocials = 1; // Adjust the number of social media entries as needed
        const fakeSocials = [];
        for (let i = 1; i <= numberOfSocials; i++) {
          const social = generateFakeSocials(1); // Pass the number of records to generate
          social.product_id = productId; // Assign the product ID to the social media entry
          fakeSocials.push(social);
        }
        await Promise.all(
          fakeSocials.map(async (social) => {
            const socialQuery = `
              INSERT INTO socials (url, name, product_id)
              VALUES ($1, $2, $3)
            `;

            const socialValues = [social.url, social.name, social.product_id];

            await client.query(socialQuery, socialValues);
          })
        );
        // Generate fake minimal specifications for the current product
        const numberOfSpecsMin = 1; // Adjust the number of minimal specifications as needed
        const fakeSpecsMin = generateFakeSpecMin(numberOfSpecsMin);

        // Insert the fake minimal specifications into the database
        await Promise.all(
          fakeSpecsMin.map(async (specsMin) => {
            const specsMinQuery = `
              INSERT INTO specs_min (section_header, languages, os, processor, memory, storage, directx, logins, product_id, graphics, other)
              VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)
            `;

            const specsMinValues = [
              specsMin.section_header,
              specsMin.languages,
              specsMin.os,
              specsMin.processor,
              specsMin.memory,
              specsMin.storage,
              specsMin.directx,
              specsMin.logins,
              specsMin.product_id,
              specsMin.graphics,
              specsMin.other,
            ];

            await client.query(specsMinQuery, specsMinValues);
          })
        );
        const numberOfSpecsRec = 1; // Adjust the number of recommended specifications as needed
        const fakeSpecsRec = generateFakeSpecRec(numberOfSpecsRec);
        await Promise.all(
          fakeSpecsRec.map(async (specsRec) => {
            const specsRecQuery = `
              INSERT INTO specs_rec (os, processor, memory, storage, directx, logins, language_supported, product_id, graphics, other)
              VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10 )
            `;

            const specsRecValues = [
              specsRec.os,
              specsRec.processor,
              specsRec.memory,
              specsRec.storage,
              specsRec.directx,
              specsRec.logins,
              specsRec.language_supported,
              specsRec.product_id,
              specsRec.graphics,
              specsRec.other,
            ];

            await client.query(specsRecQuery, specsRecValues);
          })
        );
      })
    );

    // Disconnect from the database
    client.release();

    console.log("Seeding completed successfully!");
  } catch (error) {
    console.error("Error occurred during seeding:", error);
  } finally {
    // Close the database pool
    pool.end();
  }
})();
