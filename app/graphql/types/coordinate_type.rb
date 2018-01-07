# file name has to be the same with underscore
Types::CoordinateType = GraphQL::ObjectType.define do
  name 'CoordinateType'
  description 'A pair of auto generated coordinates'

  field :latitude, types.Float do
    resolve ->(o, _, _) {o.first}
  end

  field :longitude, types.Float do
    resolve ->(o, _, _) {o.last}
  end
end