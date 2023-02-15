Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6383C1E
	for <imx@lists.linux.dev>; Wed, 15 Feb 2023 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676453433; x=1707989433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NJQn0RdCQFmqMu33c+jcEHuRrDNL/mnCpNrQOD/Rq9M=;
  b=qeGLg5CyPQyqHuiCabsxPvFCtFOjcJ9Wv/1J82sBCBPwfnxAnWlwSgRa
   Kt+vbcEQ7RfOQHb9Emt7D2AxjK+ZuH5nPqWRm4svQgrVaq8W1MrNFCps8
   pq88zJGwaNnV3dUZGOTj0UbnIws+iLGQRSeIktSO1UToa5dPwk9Wzhs2o
   sF4w7Bmmd4dne2hyggUlSK5ISd3uCO/rN6+SQBS+Hn1OJsmX8aZhaK2vw
   jDkx+jW9rSqB+nwwaW7oLhczssoeeH0HOO29kDgm0fbi0GIXZXX4e/KhM
   3u1t3hC6iLkjyHabUboV5Mw75PwYAjiUgCOUmRXVsD3vijBUS8zY6Xl5J
   w==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; 
   d="scan'208";a="29094832"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 15 Feb 2023 10:29:21 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 15 Feb 2023 10:29:21 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 15 Feb 2023 10:29:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1676453361; x=1707989361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NJQn0RdCQFmqMu33c+jcEHuRrDNL/mnCpNrQOD/Rq9M=;
  b=JK7V1se9k6H61buiqPJeKdpFY1ttn9knreaxBWHDXXXHO3XcRSD8h3jl
   Jd1wbRUlq+dZMnvibIg/RAHNvdeAwvqen/omGRMWQgbmWnaekS7Z73KYl
   +xliGEAsy1A+edEisuS6+tAc3ff4wuOvrrGHZZXpMsI+wJwPN1X4SnU83
   gS9OKdLo6Jx42TVvvXL6rYgJq7eNd+5niSdcT2EHhlsjPQBHtHrmccZwO
   w7Sbc3LP/GGcf7hkCMbiefuV4MwnegPgQkGzQgJUNrxaRW4iriCfSrtzX
   n6dTu099pg+Clp4axq1JBPNCPXg+rKn42/yHfwW2Z72zIvNPyGAlblfsP
   g==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; 
   d="scan'208";a="29094831"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 15 Feb 2023 10:29:20 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C32BE280056;
	Wed, 15 Feb 2023 10:29:20 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] gpio: mxc: remove static allocation of GPIO base
Date: Wed, 15 Feb 2023 10:29:20 +0100
Message-ID: <5941337.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMRc=Mfv-fQPa6Sz9jQ-2BgcZkAsTN=T6UKKnLUUs=exRHiZsA@mail.gmail.com>
References: <20230214224642.3804927-1-shenwei.wang@nxp.com> <CAMRc=Mfv-fQPa6Sz9jQ-2BgcZkAsTN=T6UKKnLUUs=exRHiZsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Am Mittwoch, 15. Februar 2023, 09:29:36 CET schrieb Bartosz Golaszewski:
> On Tue, Feb 14, 2023 at 11:47 PM Shenwei Wang <shenwei.wang@nxp.com> wrot=
e:
> > The latest gpio driver framework will give the following warning
> > when it detects the static allocation of the GPIO bases.
> >=20
> > "[    1.329312] gpio gpiochip0: Static allocation of GPIO base is
> > deprecated, use dynamic allocation."
> >=20
> > This patch removes the static allocation of GPIO base to get rid
> > of the warning message.
> >=20
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >=20
> >  drivers/gpio/gpio-mxc.c | 2 --
> >  1 file changed, 2 deletions(-)
> >=20
> > diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> > index d5626c572d24..07948175441c 100644
> > --- a/drivers/gpio/gpio-mxc.c
> > +++ b/drivers/gpio/gpio-mxc.c
> > @@ -450,8 +450,6 @@ static int mxc_gpio_probe(struct platform_device
> > *pdev)
> >=20
> >         port->gc.request =3D gpiochip_generic_request;
> >         port->gc.free =3D gpiochip_generic_free;
> >         port->gc.to_irq =3D mxc_gpio_to_irq;
> >=20
> > -       port->gc.base =3D (pdev->id < 0) ? of_alias_get_id(np, "gpio") =
* 32
> > :
> > -                                            pdev->id * 32;
> >=20
> >         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
> >         if (err)
> >=20
> > --
> > 2.34.1
>=20
> This is one of the drivers for which we can't do it yet:
> https://lore.kernel.org/linux-gpio/20230120104647.nwki4silrtd7bt3w@pengut=
ron
> ix.de/

I just send a patch for adding generic GPIO alias support at [1].

Having that support added this patch should apply without adding a regressi=
on.

Best regards,
Alexander

[1] https://lore.kernel.org/linux-gpio/20230215092421.143199-1-alexander.st=
ein@ew.tq-group.com/T/#u
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


