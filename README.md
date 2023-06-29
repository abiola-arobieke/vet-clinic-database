<a name="readme-top"></a>

<div align="center">
  <h3><b>Vet Clinic Database</b></h3>
</div>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

# 📖 Vet Clinic Database <a name="about-project"></a>

<img width="752" alt="Screenshot 2023-06-29 at 16 40 55" src="https://github.com/abiola-arobieke/vet-clinic-database/assets/114492335/669863df-ede0-4bc9-9e4f-6a4d09eec030">

**Vet Clinic Database** is a relational database for initial data structure for a vet clinic. It has a table that store animals' information such as name, date_of_birth, weight etc.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>SQL</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

### Key Features <a name="key-features"></a>

- **Create a database named vet_clinic**
- **Create a animals table**
- **Add columns to the animals table**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Demo Link](Comming Soon)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

PostgreSQL server installed and running

psql installed

In order to run this project you need:
to install git on your computer. Follow the instruction on the page to do so
[Click here ](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and follow the instruction on the page to install git

### Setup

Open your preferred folder in the terminal

```sh
  cd vet-clinic
```

Clone this repository to your desired folder:
Using the commands below:

```sh
  git clone https://github.com/abiola-arobieke/vet_clinic-database.git
```

Open the project on your code editor

### Usage

```sh
   run with cmd (no need to install)
```

## 👥 Authors <a name="authors"></a>

👤 **Author**

- GitHub: [@abiola-arobieke](https://github.com/abiola-arobieke)
- Linkedin: [@abiola-arobieke](https://linkedin.com/in/abiola-arobieke)
- Twitter: [@abiola_arobieke](https://twitter.com/abiola_arobieke)

EXPLAIN ANALYZE SELECT visit_total FROM animals WHERE id = 4;
EXPLAIN ANALYZE SELECT * FROM Vet_Summary WHERE vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Add animals' owners database]**
- [ ] **[Add clinic employees database]**
- [ ] **[Add visits database]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/abiola-arobieke/vet_clinic-database/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

If you like this project... Give it a Star

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank the Microverse team for the learning opportunity

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
