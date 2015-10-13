var options = [
    { value: 'one', label: 'One' },
    { value: 'two', label: 'Two' }
];

function logChange(val) {
    console.log("Selected: " + val);
}

var selectOptions = [
  {value: 'a', label: 'apple'}, 
  {value: 'b', label: 'banana'}
];
for (var i=0; i < 2; i++) {
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