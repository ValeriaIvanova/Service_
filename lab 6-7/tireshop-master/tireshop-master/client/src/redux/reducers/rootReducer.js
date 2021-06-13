import { productsReducer } from "./productsReducer";
import { combineReducers } from "redux";
import { userReducer } from "./userReducer";

export const rootReducer = combineReducers({products: productsReducer, user: userReducer})