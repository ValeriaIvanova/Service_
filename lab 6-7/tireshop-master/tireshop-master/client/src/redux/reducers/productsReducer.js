import {
    GET_ALL_DISCS,
    GET_ALL_PRODUCTS, GET_ALL_TIRES,
    GET_DISC_MAKERS, GET_DISCS_COUNT_BY_BRAND, GET_DISCS_COUNT_BY_BREND, GET_DISCS_COUNT_BY_COUNTRY, GET_DISCS_SIZES,
    GET_PRODUCT,
    GET_TIRE_MAKERS, SET_ADMIN_LOADING, SET_ADMIN_MODAL, SET_ADMIN_MODAL_TYPE,
    SET_CURRENTPAGE, SET_EDIT_ITEM,
    SET_LOADING,
    SET_MODAL, SET_MODAL_LOADING, SET_MODAL_TYPE
} from "../types";

const initialState = {
    products: [],
    productsCount: 36,
    product: {},
    loading: false,
    currentPage: 1,
    perPage: 36,
    modalLoading: false,
    modal: false,
    modalId: null,
    modalType: 0,
    tireMakers: [],
    discMakers: [],
    discs: [],
    tires: [],
    discSizes: [],
    adminLoading: false,
    adminModal: false,
    adminModalType: 0,
    editItem: null,
    discsCountByCountry: 0,
    discsCountByBrand: 0
}

const handlers = {
    [SET_LOADING]: state => ({...state, loading: true}),
    [SET_ADMIN_LOADING]: state => ({...state, adminLoading: true}),
    [SET_CURRENTPAGE]: (state, action) => ({...state, currentPage: action.payload}),
    [GET_ALL_PRODUCTS]: (state, action) => ({...state, products: action.payload.tires, productsCount: action.payload.productsCount, loading: false}),
    [GET_PRODUCT]: (state, action) => ({...state, product: action.payload, loading: false}),
    [GET_TIRE_MAKERS]: (state, action) => ({...state, tireMakers: action.payload}),
    [GET_DISC_MAKERS]: (state, action) => ({...state, discMakers: action.payload}),
    [SET_MODAL]: (state, action) => ({...state, modal: action.payload.bool, modalId: action.payload.id}),
    [SET_MODAL_LOADING]: state => ({...state, modalLoading: true}),
    [SET_MODAL_TYPE]: (state, action) => ({...state, modalType: action.payload}),
    [SET_ADMIN_MODAL_TYPE]: (state, action) => ({...state, adminModalType: action.payload}),
    [SET_ADMIN_MODAL]: (state, action) => ({...state, adminModal: action.payload}),
    [GET_ALL_DISCS]: (state, action) => ({...state, discs: action.payload, adminLoading: false}),
    [GET_ALL_TIRES]: (state, action) => ({...state, tires: action.payload}),
    [GET_DISCS_SIZES]: (state, action) => ({...state, discSizes: action.payload}),
    [SET_EDIT_ITEM]: (state, action) => ({...state, editItem: action.payload}),
    [GET_DISCS_COUNT_BY_COUNTRY]: (state, action) => ({...state, discsCountByCountry: action.payload}),
    [GET_DISCS_COUNT_BY_BRAND]: (state, action) => ({...state, discsCountByBrand: action.payload}),
    DEFAULT: state => state
}

export const productsReducer = (state = initialState, action) => {
    const handler = handlers[action.type] || handlers.DEFAULT
    return handler(state, action)
}