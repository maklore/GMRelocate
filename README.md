<h1 align="center">GMRelocate</h1>
<h4 align="center">Relocates the player within or between rooms to target instance or object.</h4>

## Basic setup
- Create a script in GameMaker.
- Copy code from [GMRelocate.gml](https://github.com/maklore/GMRelocate/blob/main/scripts/GMRelocate/GMRelocate.gml) and paste to script.
- Create player object (recommended to set as persistent).
- Initialize GMRelocate in player objects `Create` event.
  ```gml
  GMRelocate.init(self);
  ```
- Add to player objects `Room Start` event.
  ```gml
  GMRelocate.relocate();
  ```
- Add to player objects `End Step` event.
  ```gml
  GMRelocate.reset();
  ```
  > Resets when the player object is no longer colliding with the relocator object.
- Create the relocator object.
  - Add to any collision with player check.
    ```gml
    GMRelocate.goto(target_instance, target_room);
    ```
  - The `target_instance` can be either an object, instance, or as is.
  - The `target_room` can be either a room, empty, or as is.

  - If the names stay as is then you can use `Variable Definitions` as shown below.
  <img width="930" height="450" alt="Screenshot_20260717_220306" src="https://github.com/user-attachments/assets/f2a2e477-5ca2-491f-bd6e-d631018b51b1" />
  
  - In the rooms, add the relocator object to wherever you want the player relocation triggers to be.
  - Rename the relocator objects instance to something that determines the destination.
  - Set the `Variables` of the instances in the room editor. (Examples below)
    
  <img width="360" height="550" alt="Screenshot_20260717_212034" src="https://github.com/user-attachments/assets/f7b88215-f1cb-4bcf-9b73-8ec806911ef5" /> <img width="360" height="550" alt="Screenshot_20260717_212126" src="https://github.com/user-attachments/assets/c4f9ab0b-271c-4486-9b3e-7e2b53e2c28e" />

- Good luck and enjoy!
