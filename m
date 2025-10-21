Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6342C0279
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 08:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037147; cv=none; b=pUuqvddLSbW9hLvU6q7MxxnXbHdiNMgMCgLFyqy8AFsr6cL8BVYfU1ySMWdz4FdV228qlKCokWjwD/u0wBDDE/5bHubzSETqaQhl5zA/iVlYvdyaak/7ewbUattLaOSSBhPcG4amoI0kJvDhKf9iTPUTPSKnjj3hvC02neW2n0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037147; c=relaxed/simple;
	bh=9fiLN+EEhzVcDY8eLscZxHDGP6JG0wWCA1s6ugOtUJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndmlQdfrCXniEoIsD1mxoYKz1mFKZ2jdvoebCVS2ipMK45SMh0yddVuSU7hUdgcIz5rFC5+NgJ3oXVghqvQqMVUnOaqhQY7KhXJ9aqYiAEbK/24lQU1iKgRZyg/KvHdvghHOZUBCEHw3SavBDHtOT5Adc8wOJlvuNPl3XXeTE4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0EQ0J8o3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0EQ0J8o3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47157119d8bso7553255e9.3
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 01:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761037143; x=1761641943; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6IhEXhH0GzZkxVr6xhPi4zF+UYRepWWZmFoVPtiXnCQ=;
        b=0EQ0J8o3sWOzyItrbO/d750Kzvm0Jnauel0cgX061aXRVVQQuChMmXrBVlWfKoEpin
         Uu9Rd4c/Yq9yR/MKHXjg6HCEWGz2GgBFg5aD45o9sBUtOn7EhAFfc5g9dMUhem9kk+aV
         KwJER8uEGRbzhf9y17ET7kKYHXzuK2b2JvdW2PhSh0XykBj70hlV2r3DADCg1aoBvGUp
         ObmbN3T9pTuGfT4nhufIHv0xHMauUBYuBtZDr8d/UJM6vY96jBGsKj/1iD7cspNKRe8i
         pQtE6piVIdKS+ILDGX2Wc53MEZ6wORoPtfwJF3U5uvFEYq7qxGZYNYJRCH17xMmeNHTq
         vptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037143; x=1761641943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IhEXhH0GzZkxVr6xhPi4zF+UYRepWWZmFoVPtiXnCQ=;
        b=j0iTBFIEAQLW883PZPJQljJFUZ5Kq537ZGUGLQq9cfpwmi8XYcl3Fj6h6OIKXt3jwK
         ytPnO6tT2qs0Xb/y/7QDXtOsXQJaNfwZiBrcVYeTl5FAL4TOVz9JPFUapafnld8e+JnU
         WL89ZW1h+H26LmoFGWCa9zKue9HSexyA4zxMBdzhUzuM77vt3NzUYN2NKV8lV5bGzMCy
         lNdw5+OF5ZW+1LObr+gY5Bmx28dUotEi+/fLo+/6lJCpxtaPyF5tJ9FfYdzYZY2U8T+d
         HWArNqlckX8c/4gOWyaoS1rbB2E1IrtN38p9vNF9YhWTjTwwTvozCz+9AlBvQO4zOtsR
         UI6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzWsWVyF6d3/qvWPyi2S20CV8gyw++D5TiKePwJSmbph6XeOlzNaltRJiQSsYNtCK2tSg=@lists.linux.dev
X-Gm-Message-State: AOJu0YztbOjsm84WzxX0/h3zJubpYs3sfM7fBclVJG/9EZyduujE9RSb
	PC+bkKF9fK7QuCd1jTASSwx3q8vw7jJ7XL9LEByoe9mVFWDn62r8UgUYubQBxQ3xMIw=
X-Gm-Gg: ASbGncuhqbqfg6mAYOs3bPhOwAKUmifoy1l06hlQicmfOc2ikM6nSi8V+6WF9t8eXU/
	GBh7hXKlYsBTtq4reqo2VFCvhkIkac4f2lKFFOiYNKQDODaViIEIedxClGfPyeFAnuvh5IFvTaQ
	oQkvq+uE/znqhplcwvc+sxqO4PcUXYdMLpF3phz9j1KyWxwxHTT03YlSOjxSiR0YhQfK8tRWf9O
	WeV/B1cmc54EqHjxCkRvQPGgSXoUAZeLNeFJnEoapFvHcDg+zFLk4OE4Yc6fhXL5wVmI+CQTG1m
	i0GL3YoZ3wcUwqUgAMEatzaIBCzrKL8htbDVl4zbA9yiVjusPY2RC1+j4OO6S8wqre6AxmYmyV0
	apTa6bQvXqorv9u/Z9AjqdFeKjusvJqfsw8SbJQRj/5sJ4xo9GPkt3Fc4kQMAyqhfGR9N0lwqQ6
	+2WTpYW4FydIcCA7ZugWoGX7M8YDTdLPq61ZAheSZpKXVrh+gDmHaZ
X-Google-Smtp-Source: AGHT+IEPcLd9/n5F1+QuIF7nieqqGGUi36BPkr1gfJfsN/uEgAe7OHzy0yVFsDSD/cg47SwqEIucgQ==
X-Received: by 2002:a05:600c:4e89:b0:46f:b42e:e392 with SMTP id 5b1f17b1804b1-47117931c1dmr109512065e9.39.1761037142883;
        Tue, 21 Oct 2025 01:59:02 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47496cf3b51sm11749855e9.9.2025.10.21.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 01:59:02 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:59:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
Message-ID: <lgse44as4k6fpzarztfnfl7wbxq2bfg5k7m7l6xlsyx23pmem4@khal3tytgwjn>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
 <cdkpp74ra2ltr7h46psutkwnzyvl4iegcicnhqqj7svm5trltm@w2egfj5nryjm>
 <7d3df04c482e71760ccc941469c99412b608c92b.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zf3jpk3mzmqfofqf"
Content-Disposition: inline
In-Reply-To: <7d3df04c482e71760ccc941469c99412b608c92b.camel@ew.tq-group.com>


--zf3jpk3mzmqfofqf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
MIME-Version: 1.0

Hello Matthias,

On Mon, Oct 20, 2025 at 10:09:29AM +0200, Matthias Schiffer wrote:
> On Fri, 2025-10-17 at 17:01 +0200, Uwe Kleine-K=F6nig wrote:
> > On Thu, Oct 16, 2025 at 01:37:30PM +0200, Matthias Schiffer wrote:
> > > The CTS GPIO is only evaluated when the CRTSCTS termios flag is enabl=
ed;
> > > it should be possible to enable the flag when only GPIO and no hardwa=
re-
> > > controlled RTS/CTS are available. UCR2_IRTS is kept enabled in this c=
ase,
> > > so the hardware CTS is ignored.
> > >=20
> > > Fixes: 58362d5be352 ("serial: imx: implement handshaking using gpios =
with the mctrl_gpio helper")
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > ---
> > >  drivers/tty/serial/imx.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> > > index 500dfc009d03e..4a54a689a0603 100644
> > > --- a/drivers/tty/serial/imx.c
> > > +++ b/drivers/tty/serial/imx.c
> > > @@ -1117,8 +1117,8 @@ static void imx_uart_set_mctrl(struct uart_port=
 *port, unsigned int mctrl)
> > >  			ucr2 |=3D UCR2_CTS;
> > >  			/*
> > >  			 * UCR2_IRTS is unset if and only if the port is
> > > -			 * configured for CRTSCTS, so we use inverted UCR2_IRTS
> > > -			 * to get the state to restore to.
> > > +			 * configured for hardware-controlled CRTSCTS, so we use
> > > +			 * inverted UCR2_IRTS to get the state to restore to.
> > >  			 */
> > >  			if (!(ucr2 & UCR2_IRTS))
> > >  				ucr2 |=3D UCR2_CTSC;
> > > @@ -1780,7 +1780,7 @@ imx_uart_set_termios(struct uart_port *port, st=
ruct ktermios *termios,
> > >  	if ((termios->c_cflag & CSIZE) =3D=3D CS8)
> > >  		ucr2 |=3D UCR2_WS;
> > > =20
> > > -	if (!sport->have_rtscts)
> > > +	if (!sport->have_rtscts && !sport->have_rtsgpio)
> > >  		termios->c_cflag &=3D ~CRTSCTS;
> > > =20
> > >  	if (port->rs485.flags & SER_RS485_ENABLED) {
> >=20
> > This hunk makes sense.
> >=20
> > > @@ -1794,7 +1794,7 @@ imx_uart_set_termios(struct uart_port *port, st=
ruct ktermios *termios,
> > >  		else
> > >  			imx_uart_rts_inactive(sport, &ucr2);
> > > =20
> > > -	} else if (termios->c_cflag & CRTSCTS) {
> > > +	} else if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts) {
> >=20
> > I agree to add the parens here and consider this more readable than the
> > alternative
> >=20
> > 	} else if (termios->c_cflag & CRTSCTS && sport->have_rtscts) {
> >=20
> > . Note there is no real win here. If the port doesn't have RTS/CTS it
> > doesn't matter if it tries to control the RTS line. While you could
> > argue it shouldn't set the line, it only makes an externally observable
> > difference if one of the SoC's pads is muxed to its RTS function.
> > I claim it's more robust in this case (i.e. no uart-has-rtscts property
> > but a pinmux for the RTS line) to control the line according to the RTS
> > setting. This is (at least IMO) better and more expected than driving
> > this line to a constant level. So I oppose to this hunk.
> >=20
> > >  		/*
> > >  		 * Only let receiver control RTS output if we were not requested
> > >  		 * to have RTS inactive (which then should take precedence).
> > > @@ -1803,7 +1803,7 @@ imx_uart_set_termios(struct uart_port *port, st=
ruct ktermios *termios,
> > >  			ucr2 |=3D UCR2_CTSC;
> > >  	}
> > > =20
> > > -	if (termios->c_cflag & CRTSCTS)
> > > +	if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts)
> > >  		ucr2 &=3D ~UCR2_IRTS;
> > >  	if (termios->c_cflag & CSTOPB)
> > >  		ucr2 |=3D UCR2_STPB;
> >=20
> > Hmm, not sure. On one hand the same argument applies as above, but on
> > the other if there are pins that are not explicitly configured but still
> > in their CTS function this might affect operation in a bad way.
> > Also this affects the (very usual) configuration where only RX, TX and
> > RTS are used and CTS is not. In this case have_rtscts is true (right?)
> > and then if there is an accidental CTS pin this is bad and not fixed by
> > your change. Hmmm...
>=20
> I think it makes sense to always keep UCR2_IRTS set when have_rtscts is u=
nset,
> as otherwise there might be two separate CTS signals in the accidental CT=
S pin
> case - the hardware + the GPIO one, both affecting the UART operation.

With that change you break setups that have an RTS-GPIO but rely on the
HW pin for the CTS function. Not sure how common that is, but in this
case you only want the first code change. You could argue that in that
case have_rtscts should be set, but that's somewhat fuzzy.

> If we keep this change (the 3rd), the 2nd should also be included for
> consistency in the code path where I just changed a comment - there, UCR2=
_CTSC
> is set only when UCR2_IRTS is unset. The 2nd and 3rd change together keep
> imx_uart_set_mctrl and imx_uart_set_termios aligned.
>=20
> >=20
> > So in sum the 2nd and 3rd code change is controversial. If the first one
> > already fixes the problem you're facing, I suggest to go for only that.
> > If you still think that the 3rd (and maybe even the 2nd) change is a
> > good idea, I'd request to do that in a separate commit as this is a
> > separate problem. Also the commit log only describes the first change,
> > doesn't it?
>=20
> The commit message describes the first and third change; the second is in=
cluded
> to keep the setup consistent. I don't think these changes can be separate=
d well
> - the second and third change only affect a case that couldn't occur with=
out the
> first (as (termios->c_cflag & CRTSCTS) && !sport->have_rtscts would never=
 have
> been true). My suggestion would be that I extend the commit message to ex=
plain
> each change in detail.

I'd still request to split the patch in at least two patches. The first
code change is to allow rts-gpios to work at all. The two later patches
change details about how HW pins are controlled in the presence of
rts-gpios

Best regards
Uwe

--zf3jpk3mzmqfofqf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj3S1IACgkQj4D7WH0S
/k7Z8Af/cWYKmLfxl83DzxoQYDzAkl5mc0eGGuFSd+935aXR3UXsKCXljIplfmlo
73v0Jo4EYPsEco0YCWBDGKPINHThAqK3lhrsirCAUr9BakxqQIjdBYMTk4QBmGWT
M8x1wYdlUr4u0qotAftYkNkQMrcJyGft6Esgw3OcYTdI/mXhvWs1abPlt8C5aUHz
/pC1rnJcUfjcMpHmiJ1foMw+p4qv4LtoJUveI39CRpVcroqA4pLrsux/9bTkyTvw
dZDtQ/bWgkC08BU7FXOPF/8oE9vKtKLjMUQfHvxWyaAG9nxnEWhJQ/8JYVuFmqk0
9PDRESuEIsEEFaFupc+7hBuznu85PA==
=sWEK
-----END PGP SIGNATURE-----

--zf3jpk3mzmqfofqf--
