<?php
use PHPUnit\Framework\TestCase;
use ARPI\Helper\ODM\EntityManager;
use ARPI\Helper\ODM\EntityRepository;
use ARPI\Helper\ODM\UnitOfWork;
use ARPI\Helper\ODM\Snapshots\SnapshotStorage;

class EntityManagerTest extends TestCase
{
    private $entityManager;
    private $mongoUri = 'mongodb://localhost:27017';
    private $dbName = 'testdb';
    private $sessionId = 'session123';

    protected function setUp(): void
    {
        $this->entityManager = new EntityManager($this->mongoUri, $this->dbName, $this->sessionId);
    }

    public function testConstructorInitializesDependencies()
    {
        $this->assertInstanceOf(EntityRepository::class, $this->entityManager->getRepository());
        $this->assertInstanceOf(UnitOfWork::class, $this->entityManager->getUnitOfWork());
    }

    public function testFindDelegatesToRepository()
    {
        $repo = $this->createMock(EntityRepository::class);
        $repo->expects($this->once())
            ->method('find')
            ->with('SomeEntity', 1)
            ->willReturn((object)['id' => 1]);
        $reflection = new ReflectionProperty($this->entityManager, 'repository');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $repo);

        $result = $this->entityManager->find('SomeEntity', 1);
        $this->assertEquals(1, $result->id);
    }

    public function testPersistDelegatesToUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $uow->expects($this->once())
            ->method('persist');
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $this->entityManager->persist((object)[]);
    }

    public function testRemoveDelegatesToUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $uow->expects($this->once())
            ->method('remove');
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $this->entityManager->remove((object)[]);
    }

    public function testFlushDelegatesToUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $uow->expects($this->once())
            ->method('flush');
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $this->entityManager->flush();
    }

    public function testRollbackDelegatesToUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $uow->expects($this->once())
            ->method('rollback');
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $this->entityManager->rollback();
    }

    public function testClearDelegatesToUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $uow->expects($this->once())
            ->method('clear');
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $this->entityManager->clear();
    }

    public function testIsEntityDirtyDelegatesToUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $uow->expects($this->once())
            ->method('isEntityDirty')
            ->willReturn(true);
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $result = $this->entityManager->isEntityDirty((object)[]);
        $this->assertTrue($result);
    }

    public function testGetDirtyEntitiesDelegatesToUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $uow->expects($this->once())
            ->method('getDirtyEntities')
            ->willReturn([1,2,3]);
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $result = $this->entityManager->getDirtyEntities();
        $this->assertEquals([1,2,3], $result);
    }

    public function testSetDirtyCheckingEnabledDelegatesToUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $uow->expects($this->once())
            ->method('setDirtyCheckingEnabled')
            ->with(true);
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $this->entityManager->setDirtyCheckingEnabled(true);
    }

    public function testSetSnapshotStorageDelegatesToUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $storage = $this->createMock(SnapshotStorage::class);
        $uow->expects($this->once())
            ->method('setSnapshotStorage')
            ->with($storage);
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $this->entityManager->setSnapshotStorage($storage);
    }

    public function testGetSessionIdDelegatesToUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $uow->expects($this->once())
            ->method('getSessionId')
            ->willReturn('session123');
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $result = $this->entityManager->getSessionId();
        $this->assertEquals('session123', $result);
    }

    public function testGetUnitOfWorkReturnsUnitOfWork()
    {
        $uow = $this->createMock(UnitOfWork::class);
        $reflection = new ReflectionProperty($this->entityManager, 'unitOfWork');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $uow);

        $result = $this->entityManager->getUnitOfWork();
        $this->assertSame($uow, $result);
    }

    public function testGetRepositoryReturnsRepository()
    {
        $repo = $this->createMock(EntityRepository::class);
        $reflection = new ReflectionProperty($this->entityManager, 'repository');
        $reflection->setAccessible(true);
        $reflection->setValue($this->entityManager, $repo);

        $result = $this->entityManager->getRepository();
        $this->assertSame($repo, $result);
    }
}
