import React, { useState, useEffect } from "react";

import Container from "components/Container";
import TaskForm from "./Form/TaskForm";
import tasksApi from "apis/tasks";

const CreateTask = ({ history }) => {
  const [title, setTitle] = useState("");
  // const [userId, setUserId] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async event => {
    event.preventDefault();
    try {
      await tasksApi.create({ task: { title } });
      setLoading(false);
      history.push("/dashboard");
    } catch (error) {
      setLoading(false);
      logger.error(error);
    }
  };

  // const fetchUserDetails = async () => {
  //   try {
  //     const response = await usersApi.list();
  //     setUsers(response.data.users);
  //     setUserId(response.data.users[0].id);
  //     setPageLoading(false);
  //   } catch (error) {
  //     logger.error(error);
  //     setPageLoading(false);
  //   }
  // };

  // useEffect(() => {
  //  fetchUserDetails();
  // }, []);

  // if (pageLoading) {
  //   return <PageLoader />;
  // }

  return (
    <Container>
      <TaskForm
        setTitle={setTitle}
        loading={loading}
        handleSubmit={handleSubmit}
      />
    </Container>
  );
};

export default CreateTask;
