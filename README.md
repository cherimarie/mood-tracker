# Objective
Allow users to track events and moods, help them find correlations.

## Features:

 - User can define moods and events, or choose from a pre-populated list
 - User can export data, with some events or moods excluded
 - Interactive data visualization provided to help user find patterns

## Use Cases:

- User starts a new medication, they and their doctor both want to see if there are any behavioral or emotional side effects. User tracks when they take the medication and how they feel several times a day, then expors the data to share with their doctor.
- User suspects they have an allergy to a specific food. They track their moods throughout each day, and when they eat the suspect food, then looks for effect food might be having.

## Concerns:

- This will be very personal information, data security needs to be top priority.
- Data visualization will be complex, working with arbitrary data sets.
  - Moods will have to be good/bad, on a scale. Ex:
    - name: "nervous", severity: -8
  - x axis time, y axis severity good bad mood, all events are on 0 y axis