import React from 'react';
import { Pagination } from "react-bootstrap";
import { useDispatch, useSelector } from "react-redux";
import { setCurrentPage } from "../../redux/actions/products";
import './Pagination.css'

const PaginationComp = () => {
    const dispatch = useDispatch()
    const {currentPage, productsCount, perPage} = useSelector(state => state.products)
    const pageCount = Math.ceil(productsCount / perPage)
    const pages = []
    if(pageCount) {
        for(let i = 0; i < pageCount; i++)
            pages.push(i)
    }

    const handleClick = (event) => {
        const newPage = Number(event.target.innerHTML)
        console.log(newPage)
        if(newPage)
            dispatch(setCurrentPage(newPage))
    }

    return (
            <Pagination style={{justifyContent: 'center'}}>
                <Pagination.First disabled={currentPage === 1} style={{color: 'black'}} onClick={() => dispatch(setCurrentPage(1))} />
                <Pagination.Prev disabled={currentPage === 1} onClick={() => dispatch(setCurrentPage(currentPage-1))} />

                {pages.map(elem => <Pagination.Item active={elem === currentPage-1} key={elem} onClick={handleClick}>{elem+1}</Pagination.Item>)}

                <Pagination.Next disabled={currentPage === pageCount} onClick={() => dispatch(setCurrentPage(currentPage+1))} />
                <Pagination.Last disabled={currentPage === pageCount} onClick={() => dispatch(setCurrentPage(pageCount))} />
            </Pagination>
    );
};

export default PaginationComp;
