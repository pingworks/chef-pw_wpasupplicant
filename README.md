# pw_wpasupplicant-cookbook

Installs and configures wpasupplicant

## Supported Platforms

Ubuntu 14.04

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['pw_wpasupplicant']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### pw_wpasupplicant::default

Include `pw_wpasupplicant` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[pw_wpasupplicant::default]"
  ]
}
```

## License and Authors

Author:: Christoph Lukas (<christoph.lukas@gmx.net>)
