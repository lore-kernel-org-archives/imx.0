Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE6418A6A9
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724430165; cv=none; b=l523KMuEa1syGJG9gV7QeQ06MZAvVUQLILOzFQUNLOUCFuwqXfCmroUbv3+QVFAtX/btkoqmzkkiY92KMwbXubNrNd2fCORlqb9CGc+tCHVAZeq9MdUD3G9NrkzYJtVLGpUQqXhBTNBAoVGP/aHLwvbZof62s7nDAbZ1gZOVBwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724430165; c=relaxed/simple;
	bh=lfUBL2AIr79LkgcCBnHySmnR5d9p6zN0glP5iosaLK4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NKOZ2CBz/SeI3ckKEx+QGrq8viiTJZ9obIN8nfue37+Nr25KJcHTbhpOLHgQGUNlDt0c++QzWNzW00lGkC4xGkv7bw4793zbsTfRUq7BSqa8A7MxfovH/EeRmOC0PEWXCC6HG2jqIUc+izjswhVIYzcrwPugYPyXtwKqFMD+4O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ayf+nahe; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ayf+nahe"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F22132000A;
	Fri, 23 Aug 2024 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724430161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6F56iukWQmBKV4FnNA9eGRhnnKZh7f5FQn4pHMuYTo=;
	b=ayf+nahesCes2xk0GsQMQ2Lp6XTVqom0g0ioc1dzKBHm2CpY+8aXOURfJFfbKDCiW0RJrV
	eOyZe4VHBpQvrE5stkxdh6dPRhUIIRe4rS6yCNDqcbvk6jyYdzSXts9crXq1UsrULd7TEb
	etl12fizgZ7EL5WVsLBGSKvh1loDTfofKq3wfU4RH/0o/1StE3hsSTRijFLgVeis6JG5kf
	fmfDaUVbE3Tu+ruIOiycqNTRiiZi2NwNn6CbJ33ejUVyh6YpJtk7/6xRRSm95hYg6Mc+wu
	Dz3mWkDBkbsxGkaOy4PpCtOBlIaouv4nMlrdZW1Kn008vEMMZzgJlTMoSIptow==
Date: Fri, 23 Aug 2024 18:22:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 10/11] i3c: master: svc: wait for Manual ACK/NACK
 Done before next step
Message-ID: <20240823182240.4096619b@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-10-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-10-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
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

Frank.Li@nxp.com wrote on Mon, 19 Aug 2024 12:02:04 -0400:

> Wait for the controller to complete emitting ACK/NACK, otherwise the next
> command may be omitted by the hardware.
>=20
> Add command done check at svc_i3c_master_nack(ack)_ibi() and change return

	a "command done" check in

the reutnr type

> type to int to indicate wait done timeout.

		flag possible timeouts.

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index fbb6cef405577..2010495906eb3 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -384,10 +384,12 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c=
_master *master,
>  	return 0;
>  }
> =20
> -static void svc_i3c_master_ack_ibi(struct svc_i3c_master *master,
> +static int svc_i3c_master_ack_ibi(struct svc_i3c_master *master,
>  				   bool mandatory_byte)
>  {
>  	unsigned int ibi_ack_nack;
> +	int ret;
> +	u32 reg;
> =20
>  	ibi_ack_nack =3D SVC_I3C_MCTRL_REQUEST_IBI_ACKNACK;
>  	if (mandatory_byte)
> @@ -396,18 +398,31 @@ static void svc_i3c_master_ack_ibi(struct svc_i3c_m=
aster *master,
>  		ibi_ack_nack |=3D SVC_I3C_MCTRL_IBIRESP_ACK_WITHOUT_BYTE;
> =20
>  	writel(ibi_ack_nack, master->regs + SVC_I3C_MCTRL);
> +
> +	ret =3D readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS, reg,
> +					SVC_I3C_MSTATUS_MCTRLDONE(reg), 1, 1000);

Still concerned about the _atomic.

> +	return ret;

	return readl...

> +
>  }

Otherwise LGTM

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
