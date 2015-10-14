function logChange(val) {
  console.log("Selected: " + val);
}




var SelectBox = React.createClass({
  render: function() {
    var options = this.props.options
    options.unshift({value: null, label: 'Select a project (optional)'})
    var selectOptions = [];
    for (var i=0; i < options.length; i++) {
      selectOptions.push(<option value="{options[i]['value']}" key={i}>{options[i]['label']}</option>);
    }

    return (
      <select defaultValue="B">
      {selectOptions}
      </select>
      );
  }
});