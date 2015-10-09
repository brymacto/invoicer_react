var Menu = React.createClass({
  render: function() {
    return (
      <div className="fixed">
        <nav className="top-bar" data-topbar role="navigation">
          <ul className="title-area">
            <li className="name">
              <h1><a href="#">Invoicer</a></h1>
            </li>
            <li className="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
          </ul>
          <section className="top-bar-section">
            <ul className="left">
              <li><a href="/">Time Entries</a></li>
              <li><a href="/projects/">Projects</a></li>
            </ul>
          </section>
        </nav>
      </div>
    );
  }
});