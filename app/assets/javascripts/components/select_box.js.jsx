function logChange(val) {
  console.log("Selected: " + val);
}




var SelectBox = React.createClass({
  render: function() {
    var options = this.props.options
    var selectOptions = [];
    for (var i=0; i < options.length; i++) {
      selectOptions.push(<option value="A">Apple</option>);
    }

    return (
      <select value="B">
      {selectOptions}
      </select>
      );
  }
});