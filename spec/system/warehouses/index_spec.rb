require 'rails_helper'

RSpec.describe 'Index of all Warehouses page', type: :system do
  it 'has a table of warehouses', :js do
    create_list(:warehouse, 4)
    warehouse = create(:warehouse, street: 'Tabora', city: 'Manila', province:
    'NCR')

    visit '/warehouses'

    expect(page).to have_a_warehouse_table
    # expect(page).to have_a_new_warehouses_button
    expect(page).to have_warehouses_with(count: 5)
    expect(page).to have_table_header_with(text: '  Street')
    expect(page).to have_table_header_with(text: 'City')
    expect(page).to have_table_header_with(text: 'Province')
    expect(page).to have_table_header_with(text: 'Updated At')
    expect(page).to have_column_for('street', value: 'Tabora', record: warehouse)
    expect(page).to have_column_for('city', value: 'Manila', record: warehouse)
    expect(page).to have_column_for('province', value: 'NCR', record: warehouse)
    expect(page).to have_actions_of('Show', path: "/warehouses/#{warehouse.id}", record: warehouse)
  end

  private

  def have_a_warehouse_table
    have_css('table#warehouse-table')
  end

  def have_a_new_warehouses_button
    have_link('New Warehouse', href: '/warehouses/new')
  end

  def have_warehouses_with(count:)
    have_css('table tbody tr', count: count)
  end

  def have_table_header_with(text:)
    have_css('table thead tr th', text: text)
  end

  def have_column_for(name, value:, record:)
    have_css("table tbody tr#warehouse--#{record.id} td#warehouse--#{record.id}_#{name}", text: value)
  end

  def have_actions_of(title, path:, record:, **params)
    within("table tbody tr#warehouse--#{record.id} td#warehouse--#{record.id}_actions") do
      have_link(title, href: path)
    end
  end
end
