-- Table: public.dep_emp

-- DROP TABLE public.dep_emp;

CREATE TABLE public.dep_emp
(
    emp_no integer NOT NULL,
    dept_no character varying(10) COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT fk_dep_emp_dept_no FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_dep_emp_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employee (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.dep_emp
    OWNER to postgres;


-- Table: public.dep_manager

-- DROP TABLE public.dep_manager;

CREATE TABLE public.dep_manager
(
    dept_no character varying(10) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT fk_dep_manager_dept_no FOREIGN KEY (dept_no)
        REFERENCES public.departments (dept_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_dep_manager_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employee (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.dep_manager
    OWNER to postgres;


-- Table: public.departments

-- DROP TABLE public.departments;

CREATE TABLE public.departments
(
    dept_no character varying(10) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (dept_no)
)

TABLESPACE pg_default;

ALTER TABLE public.departments
    OWNER to postgres;


-- Table: public.employee

-- DROP TABLE public.employee;

CREATE TABLE public.employee
(
    emp_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    gender character varying(1) COLLATE pg_catalog."default" NOT NULL,
    hire_date date NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY (emp_no)
)

TABLESPACE pg_default;

ALTER TABLE public.employee
    OWNER to postgres;


-- Table: public.salaries

-- DROP TABLE public.salaries;

CREATE TABLE public.salaries
(
    emp_no integer NOT NULL,
    salary integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employee (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.salaries
    OWNER to postgres;


-- Table: public.title

-- DROP TABLE public.title;

CREATE TABLE public.title
(
    emp_no integer NOT NULL,
    title character varying(40) COLLATE pg_catalog."default" NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    CONSTRAINT fk_title_emp_no FOREIGN KEY (emp_no)
        REFERENCES public.employee (emp_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.title
    OWNER to postgres;