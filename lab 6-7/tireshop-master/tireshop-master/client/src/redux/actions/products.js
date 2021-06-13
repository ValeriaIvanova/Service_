import {
    GET_ALL_DISCS,
    GET_ALL_PRODUCTS,
    GET_ALL_TIRES,
    GET_DISC_MAKERS, GET_DISCS_COUNT_BY_BRAND,
    GET_DISCS_COUNT_BY_BREND,
    GET_DISCS_COUNT_BY_COUNTRY,
    GET_DISCS_SIZES,
    GET_PRODUCT,
    GET_TIRE_MAKERS,
    SET_ADMIN_LOADING,
    SET_ADMIN_MODAL,
    SET_ADMIN_MODAL_TYPE,
    SET_CURRENTPAGE,
    SET_EDIT_ITEM,
    SET_LOADING,
    SET_MODAL,
    SET_MODAL_LOADING,
    SET_MODAL_TYPE
} from "../types";
import axios from "axios";


export const setCurrentPage = (page) => {
    return {type: SET_CURRENTPAGE, payload: page}
}

export const setLoading = () => {
    return {type: SET_LOADING}
}

export const setModal = (bool, id) => {
    return {type: SET_MODAL, payload: {bool, id}}
}

export const setModalLoading = () => {
    return {type: SET_MODAL_LOADING}
}

export const setModalType = (type) => {
    return {type: SET_MODAL_TYPE, payload: type}
}


export const adminLoading = () => {
    return {type: SET_ADMIN_LOADING}
}

export const setAdminModal = (bool) => {
    return {type: SET_ADMIN_MODAL, payload: bool}
}

export const setAdminModalType = (type) => {
    return {type: SET_ADMIN_MODAL_TYPE, payload: type}
}

export const getAllProducts = () => {
    return async dispatch => {
        try {
            dispatch(setLoading())
            const tires = await axios.get('http://localhost:9090/api/tire').then(response => response.data)
            dispatch({type: GET_ALL_PRODUCTS, payload: {tires, productsCount: tires.length}})
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const getProduct = (id) => {
    return async dispatch => {
        try {
            dispatch(setLoading())
            const product = await axios.get(`http://localhost:9090/api/tire/${id}`).then(response => response.data)
            dispatch({type: GET_PRODUCT, payload: product[0]})
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const editProduct = (id, data) => {
    return async dispatch => {
        try {
            const newProduct = await axios.put('http://localhost:9090/api/tire/edit', {
                ...data, id
            })
            dispatch(getAllProducts())
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const setEditItem = (id) => {
    return {type: SET_EDIT_ITEM, payload: id}
}

export const getTireMakers = () => {
    return async dispatch => {
        try {
            const tireMakers = await axios.get('http://localhost:9090/api/tire/getTireMakers').then(response => response.data)
            dispatch({type: GET_TIRE_MAKERS, payload: tireMakers})
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const getDiscMakers = () => {
    return async dispatch => {
        try {
            const discMakers = await axios.get('http://localhost:9090/api/tire/getDiscMakers').then(response => response.data)
            dispatch({type: GET_DISC_MAKERS, payload: discMakers})
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const getDiscSizes = () => {
    return async dispatch => {
        try {
            const discSizes = await axios.get('http://localhost:9090/api/disc/sizes').then(response => response.data)
            dispatch({type: GET_DISCS_SIZES, payload: discSizes})
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const deleteProduct = (id) => {
    return async dispatch => {
        try {
            await axios.delete(`http://localhost:9090/api/tire/${id}`)
            dispatch(getAllProducts())
        }
        catch (e) {
            console.log(e.message)
        }
    }
}

export const createProduct = (data) => {
    return async dispatch => {
        try {
            await axios.post(`http://localhost:9090/api/tire/create`, {...data})
            dispatch(getAllProducts())
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const getAllTires = () => {
    return async dispatch => {
        try {
            const tires = await axios.get(`http://localhost:9090/api/tire/tires`).then(response => response.data)
            dispatch({type: GET_ALL_TIRES, payload: tires})
        } catch (e) {
            console.log(e.message)
        }
    }
}


export const getAllDiscs = () => {
    return async dispatch => {
        try {
            dispatch(adminLoading())
            const discs = await axios.get(`http://localhost:9090/api/disc`).then(response => response.data)
            dispatch({type: GET_ALL_DISCS, payload: discs})
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const createDiscs = (data) => {
    return async dispatch => {
        try {
            await axios.post(`http://localhost:9090/api/disc/create`, {...data})
            dispatch(getAllDiscs())
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const deleteDisc = (id) => {
    console.log(id)
    return async dispatch => {
        try {
            await axios.delete(`http://localhost:9090/api/disc/${id}`)
            dispatch(getAllDiscs())
        }
        catch (e) {
            console.log(e.message)
        }
    }
}


export const updateDiscs = (id, data) => {
    return async dispatch => {
        try {
            const newProduct = await axios.put('http://localhost:9090/api/disc/edit', {
                ...data, id
            })
            dispatch(getAllDiscs())
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const getDiscsCountByCountry = (country) => {
    return async dispatch => {
        try {
            if(!country)
                dispatch({type: GET_DISCS_COUNT_BY_COUNTRY, payload: 0})
            else {
                const count = await axios.get(`http://localhost:9090/api/disc/country?country=${country}`).then(response => response.data)
                dispatch({type: GET_DISCS_COUNT_BY_COUNTRY, payload: count})
            }
        } catch (e) {
            console.log(e.message)
        }
    }
}

export const getDiscsCountByBrand = (brand) => {
    return async dispatch => {
        console.log(brand)
        try {
            if(!brand)
                dispatch({type: GET_DISCS_COUNT_BY_BRAND, payload: 0})
            else {
                console.log(brand)
                const count = await axios.get(`http://localhost:9090/api/disc/brand?brand=${brand}`).then(response => response.data)
                console.log(count)
                dispatch({type: GET_DISCS_COUNT_BY_BRAND, payload: count})
            }
        } catch (e) {
            console.log(e.message)
        }
    }
}