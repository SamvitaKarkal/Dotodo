import React from "react";
// import { Route, Switch, BrowserRouter as Router } from "react-router-dom";
import Dashboard from "components/Dashboard";
import { Route, Switch, BrowserRouter as Router } from "react-router-dom";

// const App = () => {
//   // useEffect(() => {
//   //   /*eslint no-undef: "off"*/
//   //   initializeLogger();
//   //   logger.info("Log from js-logger");
//   // }, []);
  
//   return (
//     // <Router>
//     //   <Switch>
//     //     <Route exact path="/" render={() => <div>Home</div>} />
//     //     <Route exact path="/about" render={() => <div>About</div>} />
//     //   </Switch>
//     // </Router>

//     <h1>This is App.jsx</h1>
//   );
// };

const App = () => {
  return (
    <Router>
      <Switch>
        {/* // <--- rest of the code if any -----> */}
        <Route exact path="/dashboard" component={Dashboard} />
      </Switch>
    </Router>
  );
};
export default App;