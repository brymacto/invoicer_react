function logChange(val) {
  console.log("Selected: " + val);
}




var SelectBox = React.createClass({
  render: function() {
    var options = this.props.options
    options.unshift({value: null, label: 'Select a project (optional)'})
    var selectOptions = [];
    for (var i=0; i < options.length; i++) {
      selectOptions.push(<option value="{options[i]['value']}" key={i} onChange={this.handleChange}>{options[i]['label']}</option>);
    }

    return (
      <select defaultValue="B" name="project_id" onChange={this.handleChange}>
      {selectOptions}
      </select>
      );
  },
  handleChange: function(e) {
      console.log('select changed');
  }
  
});