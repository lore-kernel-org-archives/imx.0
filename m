Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676BC41B351
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468056; cv=none; b=OLTCxvViJbUW4PnMVUtNZUCKVrq66Kr+nzZZ3LouTfkL8PcswRudkDXQjU301uNUH7dTdMN03WTaXiS4mJ+iAiahGjR3G9OYRQ2t9gkS7K+oqrTHBZVqdazPNeMOvH4jL1+pO1qk2t8n8ARWcM4t0ZFjOPJaDylyw2qTJx0njJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468056; c=relaxed/simple;
	bh=0Dly/K1fpHf6jNYWK8kzIVX3YYjOqRl73kYdjmbt2Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZV8w9LX5xKC0VsGtarpJH3di+5gKdEuWoWtBuVZok3svUaCyY1d1KvQK8bHC9vPSP/D7l/eSdm2bOwL6fp3sKpJVhAE6YCJ0lgtFjVcmbUyZ3M+KAmRUBDV85l6vrKWlkt8c2LU0LR4Ushud3INJP4N/t2U+X0W4YBfAfnSL8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=OW7jSdks; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="OW7jSdks"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1vx5uO-0000000AEDW-3S4f;
	Mon, 02 Mar 2026 17:14:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=twQe7m5x4QDzYF5myGO1qmalh+JuN/K7HsbfYxfx4IQ=; b=OW7jSdksduYz+IKSvOLDkKN61z
	3stPn86I1Zpe3QM5ckzmWFy9QKdsLUm1afvc7mqa9jqSrsSe/HF2/UDMZ62nQEWps7ipDbyFKPiVR
	B+i33nquzzN1C2mXfxh21wa5Gu4aAS/qpyikokftCREziVEfX/TnqygdkoVhF04Dhv6A+qn5OvTkU
	vIA0BdP9CNGr3KG2rGgl7NeB6ktSCXuuxxCtOOKSwVx2SsE3wwuLUMj0qMAMS2pyIhfk68kfDoOFQ
	1iFMM+u2zIw2O5oxhtUVW/Ql/PbtbqWjgYRdj0qwgQyK8kB0uCv7WxaiKTVaGvQN0LxGpEg200Mnx
	Qv/VMSDA==;
Date: Mon, 2 Mar 2026 17:14:07 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Kalle Niemi <kaleposti@gmail.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Mukesh Kumar Savaliya
 <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya
 <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Branden Scott <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Vignesh R <vigneshr@ti.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Patrice
 Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Linus Walleij
 <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, Matti Vaittinen
 <mazziesaccount@gmail.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF
 node through the adapter struct
Message-ID: <20260302171407.5afe3b12@kemnade.info>
In-Reply-To: <CAMRc=Mcg7_MAGA2_Ue7etOHvLOxpRs7aOBHxRM3AdAHyscFxDw@mail.gmail.com>
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
	<20260302160923.53abf2ea@kemnade.info>
	<CAMRc=Mcg7_MAGA2_Ue7etOHvLOxpRs7aOBHxRM3AdAHyscFxDw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Mar 2026 16:42:58 +0100
Bartosz Golaszewski <brgl@kernel.org> wrote:

> On Mon, Mar 2, 2026 at 4:11=E2=80=AFPM Andreas Kemnade <andreas@kemnade.i=
nfo> wrote:
> >
> > On Mon, 2 Mar 2026 12:38:27 +0200
> > Kalle Niemi <kaleposti@gmail.com> wrote:
> > =20
> > > =EF=BB=BFOn 3/2/26 10:55, Bartosz Golaszewski wrote: =20
> > > > On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail=
.com> wrote: =20
> > > >> On 2/23/26 11:05, Bartosz Golaszewski wrote: =20
> > > >>> In order to stop i2c bus drivers from dereferencing the struct de=
vice
> > > >>> embedded in struct i2c_adapter, let's allow configuring the parent
> > > >>> device and OF-node of the adapter directly through dedicated fiel=
ds.
> > > >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualc=
omm.com>
> > > >>> --- =20
> > > >> Hello,
> > > >> Automated driver test system bisected this commit to be the first =
bad
> > > >> commit, linux-next next-20260227 was tested. Failed tests include =
driver
> > > >> tests for ROHM PMIC and accelerometers, which are connected to
> > > >> BeagleBone Black.
> > > >> The failed driver tests all fail to first i2cget and the tests stop
> > > >> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such f=
ile or
> > > >> directory". =20
> > > > Wolfram: well, now it would actually be useful to know which commit
> > > > exactly is the culprit so maybe splitting the changes is not a bad
> > > > idea after all.
> > > > Kalle: which i2c bus driver fails here? Any errors in kernel log?
> > > > Bart =20
> > >
> > > Hello Bart,
> > >
> > > i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel=
 log. I got two failures without the dmesg available (this is bugged test s=
equence, and not a kernel crash), but those got the same stdout message "Co=
uld not open file ...." as all others.
> > > =20
> > Probably I am using the same host driver
> >
> > tested on OMAP3 DM3730, result: i2c drivers get bound to their devices,
> > no obvious trouble. But controllers are registered with high indexes.
> >
> > localhost:~# i2cdetect -l
> > i2c-3   i2c             OMAP I2C adapter                        I2C ada=
pter
> > i2c-4   i2c             OMAP I2C adapter                        I2C ada=
pter
> > i2c-5   i2c             OMAP I2C adapter                        I2C ada=
pter
> > localhost:~# uname -a
> > Linux localhost 7.0.0-rc1-next-20260227 #27 SMP Mon Mar  2 11:56:27 CET=
 2026 armv7l Linux
> >
> > Regards,
> > Andreas =20
>=20
> Hi! Does the change I posted earlier in this thread help?
>=20
It does *not* as written earlier.

Just for comparison, with the offending patch reverted, it
looks like this:

localhost:~# i2cdetect -l
i2c-0	i2c       	OMAP I2C adapter                	I2C adapter
i2c-1	i2c       	OMAP I2C adapter                	I2C adapter
i2c-2	i2c       	OMAP I2C adapter                	I2C adapter


So as long only kernel drivers are used and matched via devicetree compatib=
le
nothing seems to care about the change of bus numbers.

Regards,
Andreas
