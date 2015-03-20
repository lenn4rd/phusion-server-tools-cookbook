# phusion-server-tools Cookbook

This cookbook installs [phusion-server-tools](https://github.com/phusion/phusion-server-tools).

## Requirements

- `git` has to be installed

## Attributes

#### phusion-server-tools::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['phusion-server-tools']['binaries']</tt></td>
    <td>Array</td>
    <td>Binaries to symlink to /usr/local/bin</td>
    <td><tt>['silence-unless-failed', 'truncate']</tt></td>
  </tr>
</table>

## Usage

Include `phusion-server-tools` in your node's `run_list`:

```json
{
  "name": "node",
  "run_list": [
    "recipe[phusion-server-tools]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: [Lennard Timm](https://github.com/lenn4rd)
