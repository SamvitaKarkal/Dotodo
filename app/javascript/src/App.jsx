import React, { useState, useEffect } from "react";
import { Route, Switch, BrowserRouter as Router } from "react-router-dom";
import { either, isEmpty, isNil } from "ramda";

import Dashboard from "components/Dashboard";
import CreateTask from "components/Tasks/CreateTask";
import { registerIntercepts, setAuthHeaders } from "apis/axios";
import { initializeLogger } from "common/logger";

const App = () => {
  useEffect(() => {
    initializeLogger();
  }, []);

  return (
    <Router>
      <Switch>
        <Route exact path="/tasks/create" component={CreateTask} />
        <Route exact path="/dashboard" component={Dashboard} />
      </Switch>
    </Router>
  );
};

export default App;
