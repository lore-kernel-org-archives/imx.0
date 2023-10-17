Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDAD43AB0
	for <imx@lists.linux.dev>; Tue, 17 Oct 2023 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jLeluP3O"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E47960009;
	Tue, 17 Oct 2023 14:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcsvGRK8K2SUzbeAUGwaIsZjtuCIZBWqXi6HsY6/W7o=;
	b=jLeluP3OIKI9b6XdjpiJc/1HViOWLCs+g1EW7wYY9HMIoUykPDihy3LYuK0xTxbHXZecs4
	cHZ/ySeCVN29gKCayPAR2ucMKBmIykrD/HQdbg81buS0sa2cS6r3yfjID377X5rN0koOm2
	y+jHGj2w8WrBR6h3Vv4c+eR7++RlQFBLAK5yGvk/ex8Osl4V1BBsyB/1nSd8Nla8kU4G0L
	RotH1V+WBRDQYaWsAqqA+dCYIU+GOOzq3jXrFY2J6zPUPXzKWV5j1D3qaN/7SdDB0iQuey
	y0AiQoJv1B0Pg87Ulh+5ITnMI50MKm465bND49+29RK75wTPgrquvGxKihvZMw==
Date: Tue, 17 Oct 2023 16:29:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 5/6] i3c: master: svc: fix SDA keep low when polling
 IBIWON timeout happen
Message-ID: <20231017162924.3a4b4200@xps-13>
In-Reply-To: <20231016153232.2851095-6-Frank.Li@nxp.com>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-6-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Mon, 16 Oct 2023 11:32:31 -0400:

> Need call svc_i3c_master_emit_stop() release bus.

Can you please elaborate this commit message please?

> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index 5ab68d6e439d..5bca369d6912 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -403,6 +403,7 @@ static void svc_i3c_master_ibi_work(struct work_struc=
t *work)
>  					 SVC_I3C_MSTATUS_IBIWON(val), 0, 1000);
>  	if (ret) {
>  		dev_err(master->dev, "Timeout when polling for IBIWON\n");
> +		svc_i3c_master_emit_stop(master);
>  		goto reenable_ibis;
>  	}
> =20


Thanks,
Miqu=C3=A8l
