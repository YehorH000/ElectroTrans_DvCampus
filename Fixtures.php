<?php
declare(strict_types=1);
class Fixtures
{
    /**
     * @var PDO $connection
     */
    private static $connection;
    /**
     * @return void
     */
    public function generate(): void
    {
        $connection = $this->getConnection();
        try {
            $connection->beginTransaction();
            $this->cleanup();
            $connection->commit();
            $connection->beginTransaction();

            $this->generateEmployes(100);
            $this->generateTransport(15);
            $this->generateSalary(100000);
            $this->generateIncome(100000);

            $connection->commit();
        } catch (Exception $e) {
            $connection->rollBack();
            echo $e->getMessage();
        }
    }
    private function getRandomName(): string
    {
        static $randomNames = ['Lukas','Tanya','Ewan','Fletcher','Matthew','Marc','Ciaran','Jackson','Rafael','Solomon','Muhammed','Norbert','Damon','Laverna','Annice','Brandie','Emogene','Cinthia','Magaret','Daria','Ellyn','Rhoda','Debbra','Reid','Desire','Sueann','Shemeka','Julian','Winona','Billie','Michaela','Loren','Zoraida','Jacalyn','Lovella','Bernice','Kassie','Natalya','Whitley','Katelin','Danica','Willow','Noah','Tamera','Veronique','Cathrine','Jolynn','Meridith','Moira','Vince','Fransisca','Irvin','Catina','Jackelyn','Laurine','Freida','Torri','Terese','Dorothea','Landon','Emelia','Frank','Dewey','Ronan','Harold','Farhan','Tomas','Harrison','Carlos','Joel','Catinaft','Jackelftyn','Laurinfte','Freidaft','Torrift','Tereseft','Dorotheaft','Landonft','Emeliaft','Frankft','Dewefty','Ronftan','Harold','Farfthan','Toftmas','Harrftison','Carlftos','Jftel'];
        return $randomNames[array_rand($randomNames)];
    }

    /**
     * @return PDO
     */
    public function getConnection(): PDO
    {
        if (null === self::$connection) {
            self::$connection = new PDO('mysql:host=127.0.0.1:3357;dbname=ElektroTrans', 'root', 'root', []);
            self::$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        return self::$connection;
    }
    private function cleanup(): void
    {
        $connection = $this->getConnection();
        $connection->exec('DELETE FROM employes WHERE employe_id > 10');
        $connection->exec('ALTER TABLE employes AUTO_INCREMENT = 11');
        $connection->exec('DELETE FROM transport WHERE transport_id > 3');
        $connection->exec('ALTER TABLE transport AUTO_INCREMENT = 4');
        $connection->exec('DELETE FROM salary WHERE user_id > 9 ');
        $connection->exec('ALTER TABLE salary AUTO_INCREMENT = 10');
        $connection->exec('DELETE FROM position WHERE position_id > 10');
        $connection->exec('ALTER TABLE position AUTO_INCREMENT = 11');
        $connection->exec('DELETE FROM trans_for_employe WHERE position_id > 10');
        $connection->exec('ALTER TABLE trans_for_employe AUTO_INCREMENT = 11');
    }
    /**
     * @param int $employeCount
     * @throws Exception
     */
    public function generateEmployes(int $employeCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();
        // === CREATE USERS ===
        $start = microtime(true);
        $positionId = $employeName = $employeSurname = $dob = $dateOfStart =  '';
        $minWorkTimestamp = $currentTimestamp - (31556952 * 25);
        $maxWorkTimestamp = $currentTimestamp - (31556952 * 1);
        $minAgeTimestamp = $currentTimestamp - (31556952 * 45);
        $maxAgeTimestamp = $currentTimestamp - (31556952 * 20);
        $statement = $connection->prepare(<<<SQL
    INSERT INTO employes (position_id, employe_name, employe_surname , date_of_start, dob)
    VALUES (:positionId, :employeName, :employeSurname, :dateOfStart, :dob)
    ON DUPLICATE KEY UPDATE dob=VALUES(dob), position_id=VALUES(postion_id);
SQL
        );
        $statement->bindParam(':positionId', $positionId);
        $statement->bindParam(':employeName', $employeName);
        $statement->bindParam(':employeSurname', $employeSurname);
        $statement->bindParam(':dateOfStart', $dateOfStart);
        $statement->bindParam(':dob', $dob);
        for ($employeId =11; $employeId < $employeCount; $employeId++) {
            $positionId = random_int(1, 10);
            $employeName = $this->getRandomName();
            $employeSurname = $this->getRandomName();
            $timestampPosition = random_int($minWorkTimestamp, $maxWorkTimestamp);
            $dateOfStart = date('Y-m-d', $timestampPosition);
            $timestamp = random_int($minAgeTimestamp, $maxAgeTimestamp);
            $dob = date('Y-m-d', $timestamp);
            $statement->execute();
        }
        echo 'Create users: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $salaryCount
     * @throws Exception
     */
    public function generateSalary(int $salaryCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();
        // === CREATE salary ===
        $start = microtime(true);
        $employeID = $positionId = $dateSalary = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO salary (employe_id, position_id, date)
    VALUES (:employeID, :positionId, :dateSalary)
SQL
        );
        $statement->bindParam(':employeID', $employeID, PDO::PARAM_INT);
        $statement->bindParam(':positionId', $positionId, PDO::PARAM_INT);
        $statement->bindParam(':$dateSalary', $dateSalary);
        for($salaryId = 10; $salaryId < $salaryCount; $salaryId++) {
            $employeID = random_int(1, 100);
            $positionId = random_int(1, 15);
            $timestampSalary = random_int($currentTimestamp - (31556952 * 10), $currentTimestamp);
            $dateSalary = date('Y-m-d', $timestampSalary);
        }
        echo 'Create purchases: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $transportCount
     * @throws Exception
     */
    public function generateTransport(int $transportCount): void
    {
        $connection = $this->getConnection();
        //=== Create Transport ===
        $start = microtime(true);
        $transportName = $numberTrans = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO transport (transport_name, number)
    VALUES (:transportName, :numberTrans) ON DUPLICATE KEY UPDATE number=VALUES (number)
SQL
        );
        $statement->bindParam(':transportName', $transportName);
        $statement->bindParam(':numberTrans', $numberTrans, PDO::PARAM_INT);
        for ($transportId = 3; $transportId < $transportCount; $transportId++) {
            $transportName = uniqid();
            $numberTrans = random_int(1000, 9999);
            $statement->execute();
        }
        echo 'Create transport: ' . (microtime(true) - $start) . "\n";
    }

    /**
     * @param int $incomeCount
     * @throws Exception
     */
    public function generateIncome(int $incomeCount): void
    {
        $connection = $this->getConnection();
        $currentTimestamp = time();
        // === CREATE INCOME ===
        $start = microtime(true);
        $employeId = $transportId = $deilyEarn = $dateIncome = '';
        $statement = $connection->prepare(<<<SQL
    INSERT INTO trans_for_employe (employe_id, transport_id, deily_earnings, date)
    VALUES (:employeId, :transportId, :deilyEarn, :dateIncome)
    ON DUPLICATE KEY UPDATE employe_id=VALUES(employe_id), date=VALUES(date);
SQL
        );
        $statement->bindParam(':employeId', $employeId, PDO::PARAM_INT);
        $statement->bindParam(':transportId', $transportId, PDO::PARAM_INT);
        $statement->bindParam(':deilyEarn', $deilyEarn, PDO::PARAM_INT);
        $statement->bindParam(':dateIncome', $dateIncome);
        for ($earningsId = 35; $earningsId < $incomeCount; $earningsId++) {
            $employeId = random_int(1, 100);
            $transportId = random_int(1, 15);
            $deilyEarn = random_int(100,100000);
            $timestampEarn = random_int($currentTimestamp - (31556952 * 15), $currentTimestamp);
            $dateIncome = date('Y-m-d', $timestampEarn);
            $statement->execute();
        }
        echo 'Create income: ' . (microtime(true) - $start) . "\n";
    }
}
$fixturesGenerator = new Fixtures();
$fixturesGenerator->generate();