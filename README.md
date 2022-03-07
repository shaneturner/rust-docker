# Local Rust dev setup for docker

Local docker environment for developing is rust, using docker-compose. Includes ZSH with Oh My Zsh.

## Installation

Fastest way is:

```
npx degit shaneturner/rust-docker#main YOUR-PROJECT-NAME
cd YOUR-PROJECT-NAME
npm install
```

## Configuration

You will need to add your local user to .env file

First create a blank `.env` file in the base directory or copy the example file `.env.example` to `.env`

```BASH
cp .env-example .env
```

Then add the appropriate values for your user to the new .env file

```BASH
USER=[YOUR LOCAL USERNAME HERE]
```
Change the NULL values to the values supllied in your Cloudlfar account.

## Usage

```
docker-compose build
docker-compose run rust
```
