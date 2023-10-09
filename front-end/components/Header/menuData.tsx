import { Menu } from "@/types/menu";

const menuData: Menu[] = [
  {
    id: 1,
    title: "Swap",
    path: "/",
    newTab: false,
  },
  {
    id: 2,
    title: "Liquidity",
    path: "/about",
    newTab: false,
  },
  {
    id: 33,
    title: "Earn",
    path: "/blog",
    newTab: false,
  },
  {
    id: 3,
    title: "NFT",
    newTab: false,
    submenu: [
      {
        id: 31,
        title: "Marketplace",
        path: "/about",
        newTab: false,
      },
      {
        id: 32,
        title: "Mint",
        path: "/contact",
        newTab: false,
      },
      {
        id: 33,
        title: "NFTFI",
        path: "/blog",
        newTab: false,
      },
    ],
  },
  {
    id: 4,
    title: "Info",
    newTab: false,
    submenu: [
      {
        id: 41,
        title: "I DO",
        path: "/about",
        newTab: false,
      },
      {
        id: 42,
        title: "Docs",
        path: "/contact",
        newTab: false,
      }
    ],
  },
];
export default menuData;
