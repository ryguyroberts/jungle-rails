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

    // Optionally, you can assert that the cart state is updated after clicking the button
    // For example, you can check if the cart count increases or a message confirming the addition appears
  });

});
