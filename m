Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57ED186C
	for <imx@lists.linux.dev>; Thu, 19 Oct 2023 06:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j0GI8bvB"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 686D21BF209;
	Thu, 19 Oct 2023 06:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697696959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hBt1h1Kqzm6IuFVzkjAP6Bod2gcSjnAEsTh8WsDQW+Y=;
	b=j0GI8bvBwAaZ2zM1B3cTzCy0Jv55rxzHDlyv1qSHtgTmX2kZuUlsbZEHTpDnnwaEacjmdB
	iRrKQPJFAnWLWKjvKf1fiHoUWiQjPIDAzestnqWR+1Z8SibH8ZvI0CZ37v+qmmi8qWD3ya
	fmXNoSTxkblCQqbvGnEGddW0JsZgyVw1uCCsBx5ff/frvQOHlfAhUH6exUMuVU61GQy22b
	v9SH0dh++idyoJqEXZJnE9h6iPIoBclGL7XIYmzTR4r/U9D/8CwClSRidS4IpRzWyGSmkt
	ahSg9w6PsVQCjTj9NYUznGNiyO9hLHRzyV0Vo2TOnW3g3pJHuBJqDA7etV+tkw==
Date: Thu, 19 Oct 2023 08:29:16 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 3/6] i3c: master: svc: fix ibi may not return
 mandatory data byte
Message-ID: <20231019082916.25a536fd@xps-13>
In-Reply-To: <20231018155926.3305476-4-Frank.Li@nxp.com>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
	<20231018155926.3305476-4-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Wed, 18 Oct 2023 11:59:23 -0400:

> MSTATUS[RXPEND] is only updated after the data transfer cycle started. Th=
is
> creates an issue when the I3C clock is slow, and the CPU is running fast
> enough that MSTATUS[RXPEND] may not be updated when the code reach checki=
ng
> point. As a result, mandatory data are being missed.

reaches

can be missed

> Add a wait for MSTATUS[COMPLETE] to ensure that all mandatory data is
> already in FIFO.
>=20
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>=20
> Notes:
>     Change from v1 to v2
>     - update commit message
>       it also works without mandatory bytes

This could be mentioned in the commit log?

>=20
>  drivers/i3c/master/svc-i3c-master.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index abebef666b2bb..dd06b7c9333f1 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -332,6 +332,7 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_m=
aster *master,
>  	struct i3c_ibi_slot *slot;
>  	unsigned int count;
>  	u32 mdatactrl;
> +	int ret, val;
>  	u8 *buf;
> =20
>  	slot =3D i3c_generic_ibi_get_free_slot(data->ibi_pool);
> @@ -341,6 +342,13 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_=
master *master,
>  	slot->len =3D 0;
>  	buf =3D slot->data;
> =20
> +	ret =3D readl_relaxed_poll_timeout(master->regs + SVC_I3C_MSTATUS, val,
> +						SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
> +	if (ret) {
> +		dev_err(master->dev, "Timeout when polling for COMPLETE\n");
> +		return ret;
> +	}
> +
>  	while (SVC_I3C_MSTATUS_RXPEND(readl(master->regs + SVC_I3C_MSTATUS))  &&
>  	       slot->len < SVC_I3C_FIFO_SIZE) {
>  		mdatactrl =3D readl(master->regs + SVC_I3C_MDATACTRL);


Thanks,
Miqu=C3=A8l
