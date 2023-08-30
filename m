Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C19525E
	for <imx@lists.linux.dev>; Wed, 30 Aug 2023 16:06:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 4EAFBCB840
	for <imx@lists.linux.dev>; Wed, 30 Aug 2023 15:54:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11279FF805;
	Wed, 30 Aug 2023 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693410839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oi9bdR5IDoywXio4JSGMkFbpZz4FjKhq3Oh8bcaX1wE=;
	b=KtPCsMuZ5YdkYsWMf1/CYZXUyzOP9Y9jNIW9Ubez9F6Ih4o7nMfAMfdvrF5Lp+wQKC9l1w
	rUlfnoZXDtIs0lXKDdx8jawwcYT7DkFoOnZd/GafvHt2dhMIc2gLzbyYe13s4PJalpPyxa
	BCf10pY+5ZAbXHzIZ74D+MnR+2+g3+CWBhCLaZO38qHpH8tzO8sqRLmrrA990mT14jUSj6
	mkgURjjVMSuQgyz6+CB/o769KXvZnQRkNyBasbvbepH5DJY0Tlfbb+KOEV6wRLgw7JuGMQ
	pfXRMApBnZsWh7wy6s2tsRsOqCGYUxLZ5ymJNYglmCyEKxV0R0x89aIPepiztQ==
Date: Wed, 30 Aug 2023 17:53:55 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i3c: master: fixes i3c bus driver probe failure
 if no i3c device attached
Message-ID: <20230830175355.4bc2b8d2@xps-13>
In-Reply-To: <20230830141727.3794152-1-Frank.Li@nxp.com>
References: <20230830141727.3794152-1-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Wed, 30 Aug 2023 10:17:26 -0400:

> In i3c_master_bus_init()
> {	...
> 	ret =3D i3c_master_rstdaa_locked(master, I3C_BROADCAST_ADDR);
> 	if (ret && ret !=3D I3C_ERROR_M2)
> 			  ^^^ // it is enum i3c_error_code
> 	...
> }
>=20
> In dw-i3c-master.c implementation:
> dw_i3c_ccc_set()
> {	...
> 	ret =3D xfer->ret;
> 	if (xfer->cmds[0].error =3D=3D RESPONSE_ERROR_IBA_NACK)
> 		ccc->err =3D I3C_ERROR_M2;
>=20
> 	dw_i3c_master_free_xfer(xfer);
>=20
> 	return ret;
> }
>=20
> Return enum i3c_error_code when error happen in i3c_master_rstdaa_locked(=
).

I am sorry but the commit log needs to be worked on.

>=20
> Cc: stable@vger.kernel.org
> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>=20
> Notes:
>     Change from v1 to v2:
>     - cc stable
>=20
>  drivers/i3c/master.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 08aeb69a78003..00a82f3ab9ac0 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -783,6 +783,9 @@ static int i3c_master_rstdaa_locked(struct i3c_master=
_controller *master,
>  	ret =3D i3c_master_send_ccc_cmd_locked(master, &cmd);
>  	i3c_ccc_cmd_dest_cleanup(&dest);
> =20
> +	if (ret)
> +		ret =3D cmd.err;

Shouldn't this happen in i3c_master_send_ccc_cmd_locked()?

> +
>  	return ret;
>  }
> =20


Thanks,
Miqu=C3=A8l
