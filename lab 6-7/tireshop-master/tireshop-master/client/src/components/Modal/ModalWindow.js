import React from 'react';
import EditModal from "./EditModal";
import CreateModal from "./CreateModal";
import { useSelector } from "react-redux";

const ModalWindow = (props) => {
    const {modalType} = useSelector(state => state.products)

    return (
        <>
            {modalType === 0 && <EditModal {...props} />}
            {modalType === 1 && <CreateModal {...props} />}
        </>
    )


};

export default ModalWindow;
