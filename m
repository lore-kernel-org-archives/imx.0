Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F3314F6F
	for <imx@lists.linux.dev>; Thu, 19 Oct 2023 06:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fuvTJqA3"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4651E1BF203;
	Thu, 19 Oct 2023 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697697113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxEr3Vdk9ayXK9kV3+O24G8W+TiMjxVEUmGPMuzDVM4=;
	b=fuvTJqA3k5kxHNR5Hvihjvm6FlelgtmEY6TTMUTffRAflGVS+zjkrIiabIpCjn/0tChyNq
	Y3LdIQFSBOgJJraBcairiwgN9ZDgz7oo4hgOAIT6BFP3Z2yRC2hLfm6T7xf6ElbOUR/bxh
	IbCACnyE4gCKt0Zb6bAh4j2I/ZmjM8GzpBrZkDBPz/yMJrK87u+3cHpSX53SpoAGGz7jcJ
	ZVtC8dCQPt4p3jdZdpnsz1X6CFq90vpe7biGKzn5uLPyT/QLdWrbDCXRNibBhnKXzokm/s
	XL0Ljm5IZflwaKHHEDB8H7VngAdR6Dv/31jz5wfqrzxfYsStUq2uzV6xLNLorg==
Date: Thu, 19 Oct 2023 08:31:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 Resent 5/6] i3c: master: svc: fix SDA keep low when
 polling IBIWON timeout happen
Message-ID: <20231019083151.3bd10536@xps-13>
In-Reply-To: <20231018155926.3305476-6-Frank.Li@nxp.com>
References: <20231018155926.3305476-1-Frank.Li@nxp.com>
	<20231018155926.3305476-6-Frank.Li@nxp.com>
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

Frank.Li@nxp.com wrote on Wed, 18 Oct 2023 11:59:25 -0400:

> If IBIWON timeout happen, SDA line will always keep low because miss emit
> stop.

"
Upon IBIWON timeout, the SDA line will always be kept low if we don't
emit a stop. Calling svc_i3c_master_emit_stop() there will let the bus
return to idle state.
"

With this commit log,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

>=20
> Call svc_i3c_master_emit_stop() to let i3c bus come back to idle statue
> when IBIWON timeout happen.
>=20
> Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>=20
> Notes:
>     Change from v1 to v2
>     - Update commite message
>=20
>  drivers/i3c/master/svc-i3c-master.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index b113460f059c3..1a57fdebaa26d 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -404,6 +404,7 @@ static void svc_i3c_master_ibi_work(struct work_struc=
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
