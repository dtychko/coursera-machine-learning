function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

h = sigmoid(X * theta);
for i = 1:m
    if y(i) == 1
        J = J - log(h(i));
    else
        J = J - log(1 - h(i));
    end
end
J = J / m;
delta = 0;
for j = 2:size(theta)
    delta = delta + theta(j)^2;
end
J = J + (lambda / (2 * m)) * delta;

%for j = 1:size(grad)
%    grad(j) = (1 / m) * ((h - y)' * X(:,j));
%end
grad = (1 / m) * (X' * (h - y));
grad_delta = theta;
grad_delta(1) = 0;
grad_delta = (lambda / m) * grad_delta;
grad = grad + grad_delta;

% =============================================================

end