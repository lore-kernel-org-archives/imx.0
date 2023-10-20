Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A9A1CF85
	for <imx@lists.linux.dev>; Fri, 20 Oct 2023 13:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iAr0lMGu"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2F44240017;
	Fri, 20 Oct 2023 13:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697810164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=guw01RKGbn1f3hLQyDo30kntXr8E8ttJ8J7CZjAKzjs=;
	b=iAr0lMGu8lG5QiztzmvYFF7EeDTGk7e9deIr8sIygM2F03wozOgIGiI1DoxPx8aTtaoQrQ
	vQj0cte+G92WrfW2bba0M9XqksyCfSaq066ICISm66+OzOTimCLmNrX94ybnzwfQFuAsDA
	BaSQPVy2KSCZhyEVQgbhgfx/QMvd8Vxybkk1Huhvisek5eSEmgwGJ4YRew64YWuUKQ1Z/h
	IaobZza12XF0rPFnjtI4Yn46Paq8xIm4fG61Wqy0/qwwSjAK421P1H0DFf8bbmrRAEWTcR
	TwUlFvxG+TzbUj3KO3FnjkOxOCcpR4hmt6gj1dKdktqBER+rPr3iX5qnCDomvw==
Date: Fri, 20 Oct 2023 15:56:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] i3c: master: svc: fix wrong data return when IBI
 happen during start frame
Message-ID: <20231020155603.52cc7206@xps-13>
In-Reply-To: <20231019222725.3598022-3-Frank.Li@nxp.com>
References: <20231019222725.3598022-1-Frank.Li@nxp.com>
	<20231019222725.3598022-3-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Frank,

Frank.Li@nxp.com wrote on Thu, 19 Oct 2023 18:27:21 -0400:

>      =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =
=E2=94=8F=E2=94=80=E2=94=80=E2=94=90  =E2=94=8F=E2=94=80=E2=94=80=E2=94=90 =
 =E2=94=8F=E2=94=80=E2=94=80=E2=94=90  =E2=94=8F=E2=94=80=E2=94=80=E2=94=90=
  =E2=94=8F=E2=94=80=E2=94=80=E2=94=90  =E2=94=8F=E2=94=80=E2=94=80=E2=94=
=90  =E2=94=8F=E2=94=80=E2=94=80=E2=94=90  =E2=94=8F=E2=94=80=E2=94=80=E2=
=94=90  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
> SCL: =E2=94=98     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=9B  =E2=94=94=E2=94=80=E2=94=80=E2=94=9B  =E2=94=94=E2=94=80=E2=94=
=80=E2=94=9B  =E2=94=94=E2=94=80=E2=94=80=E2=94=9B  =E2=94=94=E2=94=80=E2=
=94=80=E2=94=9B  =E2=94=94=E2=94=80=E2=94=80=E2=94=9B  =E2=94=94=E2=94=80=
=E2=94=80=E2=94=9B  =E2=94=94=E2=94=80=E2=94=80=E2=94=9B  =E2=94=94=E2=94=
=80=E2=94=80=E2=94=98
>      =E2=94=80=E2=94=80=E2=94=80=E2=94=90                       =E2=94=8C=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90     =E2=94=8C=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=90
> SDA:    =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=98     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=98     =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98 =
          =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80
>      xxx=E2=95=B1    =E2=95=B2=E2=95=B1                                  =
      =E2=95=B2=E2=95=B1    =E2=95=B2=E2=95=B1    =E2=95=B2=E2=95=B1    =E2=
=95=B2
>    : xxx=E2=95=B2IBI =E2=95=B1=E2=95=B2               Addr(0x0a)         =
      =E2=95=B1=E2=95=B2 RW =E2=95=B1=E2=95=B2NACK=E2=95=B1=E2=95=B2 S  =E2=
=95=B1
>=20
> If an In-Band Interrupt (IBI) occurs and IBI work thread is not immediate=
ly
> scheduled, When svc_i3c_master_priv_xfers() initiates the I3C transfer and

nit:		when

> attempts to send address 0x7e, the target interprets it as an
> IBI handler and returns the target address 0x0a.
>=20
> However, svc_i3c_master_priv_xfers() does not handle this case and procee=
ds
> with other transfers, resulting in incorrect data being returned.
>=20
> Add IBIWON check in svc_i3c_master_xfer(). In case this situation occurs,
> return a failure to the driver.
>=20
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Cc: stable@vger.kernel.org
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---


Thanks,
Miqu=C3=A8l
