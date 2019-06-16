class Rocket extends GameObject{
  Ship ship, enemy;
  float damage;
  public Rocket(PVector position, PVector velocity, PVector maxVelocity, PVector acceleration, Rect[] hitboxes, Ship s, float damage) {
    super(position,velocity, maxVelocity, acceleration, hitboxes);
    ship = s;
    enemy = ship.getEnemyShip();
    this.damage = damage;
  } 
  
  void update(float secsPassed, float dt){
    setAcceleration(enemy.getPosition().sub(getPosition()));
    applyVelocity();
  }
  
  Ship getShip() {
    return ship;
  }
  Ship getEnemy() {
    return enemy;
  }
  
  float getDam() {
    return damage;
  }
  
  void display(float secsPassed, float dt){
    pushMatrix();
    translate(getPosition().x , getPosition().y);
    fill(32, 52, 204);
    rectMode(CORNER);
    rect(0, 0, getHitBoxes()[0].width(), getHitBoxes()[0].height(), 0, getHitBoxes()[0].height() / 2, getHitBoxes()[0].width() / 2, 0);
    popMatrix();
  }
}