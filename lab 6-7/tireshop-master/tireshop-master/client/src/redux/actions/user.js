import { SET_ROLE } from "../types";

export const setRole = (role) => {
    return {type: SET_ROLE, payload: role}
}
