function logChange(val) {
    console.log("Selected: " + val);
}

var options = [
  {value: 'a', label: 'apple'}, 
  {value: 'b', label: 'banana'}
];
var selectOptions = [];
// for (var i=0; i < 2; i++) {
for (var i=0; i < options.length; i++) {
    selectOptions.push(<option value="A">Apple</option>);
}

var SelectBox = React.createClass({
  render: function() {
    return (
      <select value="B">
        {selectOptions}
      </select>
    );
  }
});