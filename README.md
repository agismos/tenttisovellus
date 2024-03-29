<h1>Tenttisovellus</h1>

Sovelluksen käyttäjä on opettaja tai opiskelija. Käyttäjä voi luoda tunnuksen
joko opettajan tai opiskelijan roolissa. Jos tunnuksen luo opettajan roolissa,
tarvitaan salainen avain.

Sovellusta voi tässä vaiheessa testata paikallisesti. Kloonaamisen jälkeen on luotava
.env-tiedosto, joka määritellään näin:

```bash
DATABASE_URL=<tietokannan-paikallinen-osoite>
SECRET_KEY=<salainen-avain>
TEACHER_KEY=<salainen-avain-opettajan-rekisteröitymistä-varten>
```
Kohtaan TEACHER_KEY tulee keksiä salasana, joka täytyy antaa opettajan tunnusta luotaessa.

Tämän jälkeen ajetaan seuraavat komennot:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r ./requirements.txt
psql < schema.sql
flask run
```

Sovelluksen ominaisuudet:

<ul>
  <li>Käyttäjä voi kirjautua sisään ja ulos sekä luoda uuden tunnuksen.</li>
  <li>Opiskelija näkee listan tenteistä ja voi ilmoittautua tenttiin.</li>
  <li>Käyttäjä näkee yhteenvedon omista tiedoista.</li>
  <li>Opettaja pystyy luomaan uuden tentin.</li>
  <li>Opettaja pystyy lisäämään tenttiin kysymyksiä ja vastauksia. Vastaukset
      tallentuvat tietokantaan questions, jossa näkyy onko vastaus oikein vai väärin.</li>
  <li>Opettaja näkee yhteenvedon tekemästään tentistä sekä voi lisätä ja poistaa kysymyksiä.</li>
  <li>Opettaja näkee yhteenvedon opiskelijoiden kurssisuorituksista.</li>
  <li>Opiskelija voi tenttiä tentin, johon on ilmoittautunut.</li>
</ul>

Ideoita jatkokehittämiseen:

<ul>
  <li>Opiskelija näkee yhteenvedon tekemistään tenteistä; oliko vastaus oikein/väärin.</li>
  <li>Myös opettaja voi tehdä tentin (kokeilun vuoksi).</li>
  <li>Opettaja näkee opiskelijoiden suorituksista, mihin kysymyksiin on vastattu oikein ja mihin väärin.</li>
  <li>Tenttiä luodessa opettaja voi määrittää, monenko pisteen arvoinen kysymys on. Nyt kaikki kysymykset ovat 1 pisteen arvoisia.
  Tämä ominaisuus edellyttää muutosta tietokantaan questions.</li>
