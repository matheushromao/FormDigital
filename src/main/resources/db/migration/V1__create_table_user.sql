CREATE TABLE tb_user (
    id         BIGINT       NOT NULL AUTO_INCREMENT,
    username   VARCHAR(50)  NOT NULL,
    email      VARCHAR(255) NOT NULL,
    password   VARCHAR(60)  NOT NULL,
    active     BOOLEAN      NOT NULL DEFAULT TRUE,
    created_at DATETIME(6)  NOT NULL,

    PRIMARY KEY (id),
    CONSTRAINT uk_tb_user_username UNIQUE (username),
    CONSTRAINT uk_tb_user_email    UNIQUE (email)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
