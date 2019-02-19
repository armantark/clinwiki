import _ from 'lodash';
// aggToField
export default (val) => _.get({
  average_rating: 'average rating',
  tags: 'tags',
  overall_status: 'status',
  study_type: 'type',
  sponsors: 'sponsors',
  facility_names: 'facilities',
  facility_states: 'states',
  facility_cities: 'cities',
  start_date: 'start date',
  completion_date: 'completion date',
  phase: 'phase',
  browse_condition_mesh_terms: 'mesh term',
  browse_interventions_mesh_terms: 'browse intervention mesh term',
  interventions_mesh_terms: 'interventions',
}, val, val);
