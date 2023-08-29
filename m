Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0FE13FF4
	for <imx@lists.linux.dev>; Tue, 29 Aug 2023 09:28:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id DF7E4CDE63
	for <imx@lists.linux.dev>; Tue, 29 Aug 2023 09:16:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 508541BF207;
	Tue, 29 Aug 2023 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1693300574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9vq4ofEpHyOMcy5b5TahWFabzG08hTAP6j/W1z24Ls4=;
	b=EO9fZGZj4zW35tOltEoCC0KpG+J/t9xY52fGD7MMn72vc92p0culeB24Sgw72b9zWBgMUD
	5VpQCIv7B2+DUz9b0Usyfy2zTQdDbEqrRqDulP6p3yMfFykZ73BfupGRbpbkyN4T8SZ+s6
	USd0LZqzAkTcK3Po6m7jLwAsvEKZ8bA0ou9F9fxY78WLQI9ffiFmkGAKKlMIgCXfn1Q0Eb
	qJMJNCVk6GO/jZhdtxBDbt6s3liyg5P/xI9TMDyeYvOpD2igO+ibBZ3zc12jd0VPt+l8Pp
	BN2ZRWvewcN0gJ/KjqXTl/2xYSsEzIsrqs06RJnUSFAHfAscyD02TITD62DXbw==
Date: Tue, 29 Aug 2023 11:16:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org (moderated
 list:SILVACO I3C DUAL-ROLE MASTER), linux-kernel@vger.kernel.org (open
 list), imx@lists.linux.dev
Subject: Re: [PATCH 2/2] i3c: master: svc: fix probe failure when no i3c
 device exist
Message-ID: <20230829111611.12f91348@xps-13>
In-Reply-To: <20230828192502.3525418-2-Frank.Li@nxp.com>
References: <20230828192502.3525418-1-Frank.Li@nxp.com>
	<20230828192502.3525418-2-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Mon, 28 Aug 2023 15:25:02 -0400:

> If there are not i3c device, all ccc command will get NACK. Set

		no					NACKed?

> i3c_ccc_cmd::err as I3C_ERROR_M2.

This sentence should come last and be slightly more explicit.

> Return success when no i3c device found at svc_i3c_master_do_daa_locked().

Please explain why this is important/useful.

> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")

Shall we consider a backport into stable kernels?

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index 770b40e28015e..a5620103acb73 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -789,6 +789,9 @@ static int svc_i3c_master_do_daa_locked(struct svc_i3=
c_master *master,
>  				 */
>  				break;
>  			} else if (SVC_I3C_MSTATUS_NACKED(reg)) {
> +				/* No I3C devices attached */
> +				if (dev_nb =3D=3D 0)
> +					break;

\n ?

>  				/*
>  				 * A slave device nacked the address, this is
>  				 * allowed only once, DAA will be stopped and
> @@ -1263,11 +1266,17 @@ static int svc_i3c_master_send_ccc_cmd(struct i3c=
_master_controller *m,
>  {
>  	struct svc_i3c_master *master =3D to_svc_i3c_master(m);
>  	bool broadcast =3D cmd->id < 0x80;
> +	int ret;
> =20
>  	if (broadcast)
> -		return svc_i3c_master_send_bdcast_ccc_cmd(master, cmd);
> +		ret =3D svc_i3c_master_send_bdcast_ccc_cmd(master, cmd);
>  	else
> -		return svc_i3c_master_send_direct_ccc_cmd(master, cmd);
> +		ret =3D svc_i3c_master_send_direct_ccc_cmd(master, cmd);
> +
> +	if (ret)
> +		cmd->err =3D I3C_ERROR_M2;
> +
> +	return ret;
>  }
> =20
>  static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,


Thanks,
Miqu=C3=A8l
