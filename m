Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2611644470
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NlRsGPFL"
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 552E1CA619
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 14:21:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57382FF813;
	Tue, 17 Oct 2023 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9F2O1hUuTA305YQvsLaxDl9n6cTOvILCqabWe62sTuY=;
	b=NlRsGPFLgtMCAaHHKHIsiue0/sUOs/plEshex/IKlbhSyq0suiV7m7NE/LORSpRExgQ2fz
	XeNmCFzogXqDT8X3m6g8py1l1ydb/ahFi+6jnDw0bcY3hqTKPk+tk+nbEGoPwxJZQBSACt
	Csn+ND7pcJBTqMamp/SBFgV573b7UjMV7dIjuArL7w12RqQexTtbyoExuxpnZ3A4dNyu7n
	OKtMBw1e6EUyxTLr/TZeg1xH7yH+XLlJXFczDNjdmbu3KtpQoFfPJVoXqK7o/0lh9fvRFX
	07ouiYh+EJHSV2GDSqcugF9HisdikqRCUlG46/gm453qcX3E7X7oUGpCX3ANcQ==
Date: Tue, 17 Oct 2023 16:21:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/6] i3c: master: svc: fix wrong data return when IBI
 happen during start frame
Message-ID: <20231017162132.361be2c3@xps-13>
In-Reply-To: <20231016153232.2851095-3-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-3-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:32:28 -0400:

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
> In-Band Interrupt (IBI) occurred and IBI work thread may not to be

If an In-Band...	occurs and the IBI work thread is not
immediately scheduled, when svc... initiates an I3C transfer and
attempts...

> scheduled. When svc_i3c_master_priv_xfers() initiates the I3C transfer
> frame and attempts to send address 0x7e, the target interprets it as an
> IBI handler and returns the target address 0x0a.
>=20
> However, svc_i3c_master_priv_xfers() does not handle this case and procee=
ds
> with other transfers, resulting in incorrect data being returned.
>=20
> IBIWON check has been added in svc_i3c_master_xfer(). In case this

Add IBIWON check in svc_...

> situation occurs, a failure is now returned to the driver.

			return a failure...

>=20
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index ebdb3ea1af9d..0f57a5f75e39 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1009,6 +1009,9 @@ static int svc_i3c_master_xfer(struct svc_i3c_maste=
r *master,
>  	u32 reg;
>  	int ret;
> =20
> +	/* clean SVC_I3C_MINT_IBIWON w1c bits */
> +	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
> +
>  	writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
>  	       xfer_type |
>  	       SVC_I3C_MCTRL_IBIRESP_NACK |
> @@ -1027,6 +1030,23 @@ static int svc_i3c_master_xfer(struct svc_i3c_mast=
er *master,
>  		goto emit_stop;
>  	}
> =20
> +	/*
> +	 * According to I3C spec ver 1.1.1, 5.1.2.2.3 Consequence of Controller=
 Starting a Frame
> +	 * with I3C Target Address.
> +	 *
> +	 * The I3C Controller normally should start a Frame, the Address may be=
 arbitrated, and so
> +	 * the Controller shall monitor to see whether an In-Band Interrupt req=
uest, a Controller
> +	 * Role Request (i.e., Secondary Controller requests to become the Acti=
ve Controller), or
> +	 * a Hot-Join Request has been made.
> +	 *
> +	 * If missed IBIWON check, the wrong data will be return. When IBIWON h=
appen, return falure
> +	 * and yeild the above events handler.

Typos: yeild and falure

> +	 */
> +	if (SVC_I3C_MSTATUS_IBIWON(reg)) {
> +		ret =3D -ENXIO;
> +		goto emit_stop;
> +	}
> +
>  	if (rnw)
>  		ret =3D svc_i3c_master_read(master, in, xfer_len);
>  	else

With all the typos fixed:

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
