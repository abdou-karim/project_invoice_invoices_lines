<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220415120420 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE invoice_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE invoice_lines_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE invoice (id INT NOT NULL, invoice_date DATE NOT NULL, invoice_number INT NOT NULL, customer_id INT NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE TABLE invoice_lines (id INT NOT NULL, invoice_id_id INT NOT NULL, description TEXT NOT NULL, quantity DOUBLE PRECISION NOT NULL, vat_amount DOUBLE PRECISION NOT NULL, total_with_vat DOUBLE PRECISION NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX IDX_72DBDC23429ECEE2 ON invoice_lines (invoice_id_id)');
        $this->addSql('ALTER TABLE invoice_lines ADD CONSTRAINT FK_72DBDC23429ECEE2 FOREIGN KEY (invoice_id_id) REFERENCES invoice (id) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SCHEMA public');
        $this->addSql('ALTER TABLE invoice_lines DROP CONSTRAINT FK_72DBDC23429ECEE2');
        $this->addSql('DROP SEQUENCE invoice_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE invoice_lines_id_seq CASCADE');
        $this->addSql('DROP TABLE invoice');
        $this->addSql('DROP TABLE invoice_lines');
    }
}
