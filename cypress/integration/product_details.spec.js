describe('example to-do app', () => {
  beforeEach(() => {
    // vist the home page before each test
    cy.visit('http://localhost:3000')

  })

  it("There is products on the page", () => {
  cy.get(".products article").should("be.visible");
  });

  it("Click on a product link", () => {
    // Select the link wrapping the product image and name
    cy.get(".products article a").first().click();

    // Could also check for maybe a certain article or something here
    cy.url().should('include', '/products/');
  });
});
