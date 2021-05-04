import axios from "axios";

const list = () => axios.get("/users");
//get method to prepopulate select in TaskForm
const usersApi = {
  list,
};

export default usersApi;

//defines all APIs related to user model
