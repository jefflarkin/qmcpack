
INCLUDE("${PROJECT_SOURCE_DIR}/CMake/test_labels.cmake")

# Runs unit tests
FUNCTION( ADD_UNIT_TEST TESTNAME TEST_BINARY )
    MESSAGE("Adding test ${TESTNAME}")
    IF ( USE_MPI )
        ADD_TEST(NAME ${TESTNAME} COMMAND ${MPIEXEC} ${MPIEXEC_NUMPROC_FLAG} 1 ${TEST_BINARY} ${ARGN})
        #SET_TESTS_PROPERTIES( ${TESTNAME} PROPERTIES ENVIRONMENT OMP_NUM_THREADS=1 )
    ELSE()
        ADD_TEST(NAME ${TESTNAME} COMMAND ${TEST_BINARY} ${ARGN})
        #SET_TESTS_PROPERTIES( ${TESTNAME} PROPERTIES ENVIRONMENT OMP_NUM_THREADS=1 )
    ENDIF()
    SET(TEST_LABELS_TEMP "")
    ADD_TEST_LABELS( ${TESTNAME} TEST_LABELS_TEMP )
    SET_PROPERTY(TEST ${TESTNAME} APPEND PROPERTY LABELS "unit")
ENDFUNCTION()
