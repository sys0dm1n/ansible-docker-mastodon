# ansible-docker-mastodon
Using ANSIBLE to deploy Mastodon Docker instance with Nginx reverse proxy and Let's Encrypt SSL certificate

## Requirement:
Mastodon server OS:

* Ubuntu 16.04 LTS
* Docker and Docker-compose installed

Having ANSIBLE installed on the instance from where you will be executing this role

## Tips

### To make an account an admin on your Mastodon instance:

        cd /home/mastodon/
        docker-compose run --rm web rails mastodon:make_admin USERNAME=example
      
Then logout and log back in.
    
### Restarting the Mastodon server:

        cd /home/mastodon/
        docker-compose stop
        docker-compose up -d
The above commands restart the docker container for you. This should really only be done to troubleshoot errors.

***

- Ref.: [Mastodon installation](https://fediwiki.info/mastodon_install.html)
- Ref.: [Mastodon Github Repository](https://github.com/tootsuite/mastodon)
- Ref.: [ANSIBLE Modules](http://docs.ansible.com/ansible/list_of_all_modules.html)
- Ref.: [how to secure Nginx with let's encrypt on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04)
- Ref.: [ANSIBLE let's encrypt Nginx setup](https://gist.github.com/mattiaslundberg/ba214a35060d3c8603e9b1ec8627d349)
