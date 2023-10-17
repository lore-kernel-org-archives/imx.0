Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E0E43AB0
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 14:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FVx2NcnS"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 766781C000F;
	Tue, 17 Oct 2023 14:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H06xgNvMXJ6SsKeqQHp4zd1+AMWk0M/uohUueGKhjos=;
	b=FVx2NcnSpS/Z73Uly6cHt9btSMQoc4RAgx41qBu8AKj2oPSyP6tJ5g1ieSTjwXnshVThzk
	1LRWrrwh0VrKQvUe8rR6wbz6H1JVlFfokY9kn2kGU6r+NTh9ek9B1ovnPJimHa97l9Ett8
	i9MOCy8m6zKndFEBMpizrD2+/IWZ4J8+1vkazQn9TXiJAWp/M68DhiePEjRYS5geN0YafT
	FU7T4rjIwG4qpFCvrmu5SU4xD67syeulWtAJ6mpXsUQH2aNFThcHNzPSXzGj3GhkS/5HwN
	XNguK95pRaH0l9I2fhyJMItol2v4SpQWNHOXGqJZu16pgGFj+oX4rmLH5YWHXw==
Date: Tue, 17 Oct 2023 16:28:46 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/6] i3c: master: svc: fix check wrong status register
 in irq handler
Message-ID: <20231017162846.188d7a78@xps-13>
In-Reply-To: <20231016153232.2851095-5-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-5-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:32:30 -0400:

> svc_i3c_master_irq_handler() wrong check register SVC_I3C_MINTMASKED. It

				wrongly checks
> should be SVC_I3C_MSTATUS.

Ah right, good catch.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

>=20
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index c252446b2bc5..5ab68d6e439d 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -475,7 +475,7 @@ static void svc_i3c_master_ibi_work(struct work_struc=
t *work)
>  static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
>  {
>  	struct svc_i3c_master *master =3D (struct svc_i3c_master *)dev_id;
> -	u32 active =3D readl(master->regs + SVC_I3C_MINTMASKED);
> +	u32 active =3D readl(master->regs + SVC_I3C_MSTATUS);
> =20
>  	if (!SVC_I3C_MSTATUS_SLVSTART(active))
>  		return IRQ_NONE;


Thanks,
Miqu=C3=A8l
