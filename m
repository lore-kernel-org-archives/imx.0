Received: from mx-relay03-hz1.antispameurope.com (mx-relay03-hz1.antispameurope.com [94.100.132.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A776B2E6CA2
	for <imx@lists.linux.dev>; Tue, 21 Oct 2025 09:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.203
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761039548; cv=pass; b=d6K/9K/JXST5ROAk3eDzcimx37urV2fucIGZUB09//WHWZx407UFDkXWIttCD7ci3QKWeY7fSqhsJoWmd/+Ov/Vq6JEhaXmAppm4hpqrJjIZxiT7yWOJ0Cxw7bxd6I+gjpOYHRTaZIkqJlthGFqlydjS+UWPBQWdV4b72pi7K/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761039548; c=relaxed/simple;
	bh=eKhIEr2wdHZOdT7ow5a3AzpUQkJ0Ei2/IGrS1CI/pVM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a9P4LMQW/pWBPd22wm2TwsPkEI+uqD3JstK+rI253RAoLMm528KjYP69Teqrmnq3tRn7JVJjhlOmip4tsqgaioTHRhlJJPXhnSTwbTSfBw/QEQ+ZZOdhtuprSS9sTtZThcwrPT+7WdSxtAVJIl4OYTNuxyoCyZjZ6On+ob3ZBus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=GhuPK0AS; arc=pass smtp.client-ip=94.100.132.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="GhuPK0AS"
ARC-Authentication-Results: i=1; mx-gate03-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=i9zmwlits19MWVeZiMnlveUvVwY/OpDAaLlQOnMopBQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761039485;
 b=N9Uwco2kQOILf7p6DNd/Of/6DSRfSe8r1cUramy2UDeNc203+ezsBD/VyswnQQ89ZFwDAmcP
 aWYvpc+Y8JpeXfiymqos0zpYM77Yw/o7TFKbvmR9nzEwWHpgefCi7tXtjI2vd0FsR7AtJfNLd6O
 ///ojfBOhU0t7N1SIcF0ku1XuUmz1MQM/+og0YiL09mDlfbIjMbVq/qFXk5RMktIyGqDstuNRJu
 QrLexI2kGKtaJ8jilHIO1Mph5J6AH6UFyWvsdaq9bHwwpapRoKehMoT2jPEI8A2iQ8TkYwRU24j
 UZUT1E3EMDjkZ5Ov1VK+8odW3+DNcK2/8g09RA9FIdrdg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761039485;
 b=WjDkXFNTwk+iE2VhKCqwsOWnWLUWaF0uIH1My5QOUP4Ud0iF00Iatb6nEMd4Q/gTT9JYR3zX
 uC7VNsDGwyzGnJJs55U6YxNKpe9aqb4yGEdDZzmh0Lk99bFfqLV6lXcuqYMQYUZdd0HaL9R7A/1
 J1xNGkfd36ahCw5jnC6wQuStf/Ys3EDsmuCNTxZRU9pt60O1NsKFRtUiC04nePkYswImMV4AEpb
 2URxNPYKGGaRRvJxNj2GunX3ZcGdEZO9n4oy7QtPpm8RMbOfXTJH9jcuVWlhiVIKbyXQHVRLGeD
 WFSoYmggg1sElx3UF+0p5Wy5Tw3teg0Di630yFwF48kew==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay03-hz1.antispameurope.com;
 Tue, 21 Oct 2025 11:38:04 +0200
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 11E9CA41274;
	Tue, 21 Oct 2025 11:37:38 +0200 (CEST)
Message-ID: <1963351b2e50c537418293e6ab9293576a239c98.camel@ew.tq-group.com>
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org,  imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Date: Tue, 21 Oct 2025 11:37:37 +0200
In-Reply-To: <lgse44as4k6fpzarztfnfl7wbxq2bfg5k7m7l6xlsyx23pmem4@khal3tytgwjn>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
	 <cdkpp74ra2ltr7h46psutkwnzyvl4iegcicnhqqj7svm5trltm@w2egfj5nryjm>
	 <7d3df04c482e71760ccc941469c99412b608c92b.camel@ew.tq-group.com>
	 <lgse44as4k6fpzarztfnfl7wbxq2bfg5k7m7l6xlsyx23pmem4@khal3tytgwjn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-cloud-security-sender:matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay03-hz1.antispameurope.com with 4crRzQ6tXCzdsVM
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:b6a1ef41415f75c94556ef2ddcc8cb65
X-cloud-security:scantime:8.361
DKIM-Signature: a=rsa-sha256;
 bh=i9zmwlits19MWVeZiMnlveUvVwY/OpDAaLlQOnMopBQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761039484; v=1;
 b=GhuPK0ASxcKAWyBAZU8ceevenaEp8ilI3855X3cfsifl3ON5RVRgbSzWn/7kXFCify6zla73
 DwUAZ4JjDUgTrOinBOFC+WqCly+Z1plUGOQpjIfHDVlq4Y3bRt1fVPVUuBM6CaPErQDu4Ooid9h
 GIq6le+wfQ+k2zEg7LzYr3luKeXYg1hkAjDU6JskNxVV+5NeHmCoWKCSKGboylF6eutWkLvJPDU
 IFLmJw35dxJtei1OOK2XqB9miVIY8YG66Ha3aQpK03naBhX1N4mWHFSA1VHJEVRx6tdyZaAi7RN
 ZXLC58ViAl4bhIsoudj7R3dDoAFFVSfNJRo8xO8V6jSgw==

On Tue, 2025-10-21 at 10:59 +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello Matthias,
>=20
> On Mon, Oct 20, 2025 at 10:09:29AM +0200, Matthias Schiffer wrote:
> > On Fri, 2025-10-17 at 17:01 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > On Thu, Oct 16, 2025 at 01:37:30PM +0200, Matthias Schiffer wrote:
> > > > The CTS GPIO is only evaluated when the CRTSCTS termios flag is ena=
bled;
> > > > it should be possible to enable the flag when only GPIO and no hard=
ware-
> > > > controlled RTS/CTS are available. UCR2_IRTS is kept enabled in this=
 case,
> > > > so the hardware CTS is ignored.
> > > >=20
> > > > Fixes: 58362d5be352 ("serial: imx: implement handshaking using gpio=
s with the mctrl_gpio helper")
> > > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com=
>
> > > > ---
> > > >  drivers/tty/serial/imx.c | 10 +++++-----
> > > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > > >=20
> > > > diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> > > > index 500dfc009d03e..4a54a689a0603 100644
> > > > --- a/drivers/tty/serial/imx.c
> > > > +++ b/drivers/tty/serial/imx.c
> > > > @@ -1117,8 +1117,8 @@ static void imx_uart_set_mctrl(struct uart_po=
rt *port, unsigned int mctrl)
> > > >  			ucr2 |=3D UCR2_CTS;
> > > >  			/*
> > > >  			 * UCR2_IRTS is unset if and only if the port is
> > > > -			 * configured for CRTSCTS, so we use inverted UCR2_IRTS
> > > > -			 * to get the state to restore to.
> > > > +			 * configured for hardware-controlled CRTSCTS, so we use
> > > > +			 * inverted UCR2_IRTS to get the state to restore to.
> > > >  			 */
> > > >  			if (!(ucr2 & UCR2_IRTS))
> > > >  				ucr2 |=3D UCR2_CTSC;
> > > > @@ -1780,7 +1780,7 @@ imx_uart_set_termios(struct uart_port *port, =
struct ktermios *termios,
> > > >  	if ((termios->c_cflag & CSIZE) =3D=3D CS8)
> > > >  		ucr2 |=3D UCR2_WS;
> > > > =20
> > > > -	if (!sport->have_rtscts)
> > > > +	if (!sport->have_rtscts && !sport->have_rtsgpio)
> > > >  		termios->c_cflag &=3D ~CRTSCTS;
> > > > =20
> > > >  	if (port->rs485.flags & SER_RS485_ENABLED) {
> > >=20
> > > This hunk makes sense.
> > >=20
> > > > @@ -1794,7 +1794,7 @@ imx_uart_set_termios(struct uart_port *port, =
struct ktermios *termios,
> > > >  		else
> > > >  			imx_uart_rts_inactive(sport, &ucr2);
> > > > =20
> > > > -	} else if (termios->c_cflag & CRTSCTS) {
> > > > +	} else if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts) {
> > >=20
> > > I agree to add the parens here and consider this more readable than t=
he
> > > alternative
> > >=20
> > > 	} else if (termios->c_cflag & CRTSCTS && sport->have_rtscts) {
> > >=20
> > > . Note there is no real win here. If the port doesn't have RTS/CTS it
> > > doesn't matter if it tries to control the RTS line. While you could
> > > argue it shouldn't set the line, it only makes an externally observab=
le
> > > difference if one of the SoC's pads is muxed to its RTS function.
> > > I claim it's more robust in this case (i.e. no uart-has-rtscts proper=
ty
> > > but a pinmux for the RTS line) to control the line according to the R=
TS
> > > setting. This is (at least IMO) better and more expected than driving
> > > this line to a constant level. So I oppose to this hunk.
> > >=20
> > > >  		/*
> > > >  		 * Only let receiver control RTS output if we were not requested
> > > >  		 * to have RTS inactive (which then should take precedence).
> > > > @@ -1803,7 +1803,7 @@ imx_uart_set_termios(struct uart_port *port, =
struct ktermios *termios,
> > > >  			ucr2 |=3D UCR2_CTSC;
> > > >  	}
> > > > =20
> > > > -	if (termios->c_cflag & CRTSCTS)
> > > > +	if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts)
> > > >  		ucr2 &=3D ~UCR2_IRTS;
> > > >  	if (termios->c_cflag & CSTOPB)
> > > >  		ucr2 |=3D UCR2_STPB;
> > >=20
> > > Hmm, not sure. On one hand the same argument applies as above, but on
> > > the other if there are pins that are not explicitly configured but st=
ill
> > > in their CTS function this might affect operation in a bad way.
> > > Also this affects the (very usual) configuration where only RX, TX an=
d
> > > RTS are used and CTS is not. In this case have_rtscts is true (right?=
)
> > > and then if there is an accidental CTS pin this is bad and not fixed =
by
> > > your change. Hmmm...
> >=20
> > I think it makes sense to always keep UCR2_IRTS set when have_rtscts is=
 unset,
> > as otherwise there might be two separate CTS signals in the accidental =
CTS pin
> > case - the hardware + the GPIO one, both affecting the UART operation.
>=20
> With that change you break setups that have an RTS-GPIO but rely on the
> HW pin for the CTS function. Not sure how common that is, but in this
> case you only want the first code change. You could argue that in that
> case have_rtscts should be set, but that's somewhat fuzzy.

Such a setup should set have_rtscts IMO. In any case, my patch would not br=
eak
existing setups, as the CRTSCTS flag simply cannot be set for !have_rtscts
without these changes.

>=20
> > If we keep this change (the 3rd), the 2nd should also be included for
> > consistency in the code path where I just changed a comment - there, UC=
R2_CTSC
> > is set only when UCR2_IRTS is unset. The 2nd and 3rd change together ke=
ep
> > imx_uart_set_mctrl and imx_uart_set_termios aligned.
> >=20
> > >=20
> > > So in sum the 2nd and 3rd code change is controversial. If the first =
one
> > > already fixes the problem you're facing, I suggest to go for only tha=
t.
> > > If you still think that the 3rd (and maybe even the 2nd) change is a
> > > good idea, I'd request to do that in a separate commit as this is a
> > > separate problem. Also the commit log only describes the first change=
,
> > > doesn't it?
> >=20
> > The commit message describes the first and third change; the second is =
included
> > to keep the setup consistent. I don't think these changes can be separa=
ted well
> > - the second and third change only affect a case that couldn't occur wi=
thout the
> > first (as (termios->c_cflag & CRTSCTS) && !sport->have_rtscts would nev=
er have
> > been true). My suggestion would be that I extend the commit message to =
explain
> > each change in detail.
>=20
> I'd still request to split the patch in at least two patches. The first
> code change is to allow rts-gpios to work at all. The two later patches
> change details about how HW pins are controlled in the presence of
> rts-gpios

Okay, will do.

Best,
Matthias


>=20
> Best regards
> Uwe

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
