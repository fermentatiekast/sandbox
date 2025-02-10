Feature: Controlling the climate of the cabinet.

	Scenario: adding a product
		Given we have an empty cabinet
		When we add yoghurt
		Then the cabinet climate targets A
		
