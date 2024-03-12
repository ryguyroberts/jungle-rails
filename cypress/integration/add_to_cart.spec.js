describe('example to-do app', () => {
  beforeEach(() => {
    // vist the home page before each test
    cy.visit('http://localhost:3000')

  })

  it("There is products on the page", () => {
  cy.get(".products article").should("be.visible");
  });
  
  it("Click on 'Add to Cart' button", () => {
    // Find and click on the "Add to Cart" button
    cy.get(".products article").first().find("form.button_to button.btn").click({ force: true });

    // Test for 1 but
    cy.get('a.nav-link[href="/cart"]').should('contain', `My Cart (1)`);
  });

});
