import { useState, useEffect } from "react";

function EditionsAddons({ id }) {
  const [editions, setEditions] = useState([]);
  const [addOns, setAddOns] = useState([]);

  useEffect(() => {
    fetch(`http://localhost:3001/api/editions/${id}`)
      .then((result) => {
        if (result.status === 404) {
          return [];
        } else {
          return result.json();
        }
      })
      .then((data) => setEditions(data));

    fetch(`http://localhost:3001/api/add-ons/${id}`)
      .then((result) => {
        if (result.status === 404) {
          return [];
        } else {
          return result.json();
        }
      })
      .then((data) => setAddOns(data));
  }, [id]);

  const display = (item) => {
    let type = "EDITION";
    if (!item.name.toLowerCase().includes("edition")) {
      type = "ADD-ON";
    }
    return (
      <div className="flex flex-col mb-5" key={item.id}>
        <div className="flex bg-neutral-800 border-b border-neutral-700 rounded-t">
          <a href={item.pageUrl} target="_blank">
            <img
              className="w-72 h-40 rounded-ss"
              src={item.image}
              alt={item.name}
            />
          </a>
          <div>
            <div className="flex flex-row">
              <div className="flex flex-row justify-center items-center py-2 m-3 px-4 bg-neutral-700 rounded-sm text-sm">
                {item.name.toLowerCase().includes("standard")
                  ? "BASE GAME"
                  : type}
              </div>
              <div className="flex items-center m-2">
                <a href={item.pageUrl} target="_blank">
                  {item.name}
                </a>
              </div>
            </div>
            <div className="flex items-center px-3">
              <p className="max-w-lg text-neutral-400">{item.description}</p>
            </div>
          </div>
        </div>
        <div className="flex flex-row justify-end items-center p-5 gap-3 bg-neutral-800 rounded-b">
          <div className="text-lg">${item.price}</div>
          <button className="flex justify-center items-center px-12 py-3 border border-neutral-700 rounded-sm transition-all ease-linear hover:bg-neutral-700">
            ADD TO CART
          </button>
          <button className="flex justify-center items-center text-sm px-8 py-3 border border-neutral-700 rounded transition-all ease-linear hover:bg-neutral-700">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              strokeWidth="2"
              stroke="currentColor"
              className="w-6 h-6 mr-1"
            >
              <path
                strokeLinecap="round"
                strokeLinejoin="round"
                d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z"
              />
            </svg>
            ADD TO WISHLIST
          </button>
        </div>
      </div>
    );
  };

  const editionsAddons = {
    editions: (
      <div>
        <h1 className="text-xl my-5">Editions</h1>
        {editions.map((edition) => display(edition))}
      </div>
    ),
    addons: (
      <div>
        <h1 className="text-xl my-5">Add-Ons</h1>
        {addOns.map((addon) => display(addon))}
      </div>
    ),
  };

  return (
    <div>
      {editions.length !== 0 ? editionsAddons.editions : null}
      {addOns.length !== 0 ? editionsAddons.addons : null}
    </div>
  );
}

export default EditionsAddons;
