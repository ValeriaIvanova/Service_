import { SET_ROLE } from "../types";

const initialState = {
    role: 0
}

const handlers = {
    [SET_ROLE]: (state, action) => ({...state, role: action.payload}),
    DEFAULT: state => state
}

export const userReducer = (state = initialState, action) => {
    const handler = handlers[action.type] || handlers.DEFAULT
    return handler(state, action)
}