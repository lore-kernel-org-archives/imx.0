Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F621CCED2
	for <imx@lists.linux.dev>; Tue,  1 Oct 2024 20:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727813722; cv=none; b=DgOxbwFSZte0wtjwEvqypi1DphpXa6u9hzxSQ+2Y4Wx6OE6Z01j4k05ggu0A6zLQwMVQfGrEt8t+2bqjjc5iZX1zL4gf6iE2oV8Pjn5+8FjjpahRK5SQkRIXw//1AMngfxwRiz43QZjHVsjqeR6VUrOFGecMMbYs1EwoXJY0aNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727813722; c=relaxed/simple;
	bh=ClRUkUeUojv7NVZJNhAM1y9ZnjIkXjwjDTMvzl96td8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZBiKEGeu7sThPwYZoe3PV8qJIdB0DMChHh82OX5sIdRamLPXwPasf+J/qyq0UgGmwKTrctumV+iF+SjiDVLJzgpHG1bhVXeODYf0KCZ1xTBEDv5R343CAPkQ/KxKF8+L6CpvJMxqVShUG2z17ldRhNn70PM37bcrisjkRYxIKKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TkkmKc3A; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TkkmKc3A"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E617A60003;
	Tue,  1 Oct 2024 20:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727813713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BQJpm4VO4nXgcGNm9i9gLOY8aV30KkAXa+C6ebyrRxY=;
	b=TkkmKc3AAoYxmKBplahY0/NL007XhBTzr+zYuf4cpbr6A/nAQmGwSSqwJJ95BgIt6jyNtX
	bHcxU1tulTsjkWiJc2Uzq2Nmv8OIHP7V+xbGy1kE6gN2pb1/hni2no+Qe0LZgqqrspf1BJ
	tErhj7aJkqwbX0XTlfXEsU5ZZ9gucj4h3Jp2sMG2iyx5cNxcSRjhEifeqXF4Q2kfm4Rqyu
	lirN4gVLciU2lowjVhQu9mMIQUE4GdGSZjV09U/rdwLnioihZq2lSD0MDNXOEBcdXe7mD+
	AJ56Q297sIldkvwyk5xPgusCh9Gm52trA2afq+PYU+XgYddLczGGvzni2jXeiA==
Date: Tue, 1 Oct 2024 22:15:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 4/6] i3c: master: svc: use spin_lock_irqsave at
 svc_i3c_master_ibi_work()
Message-ID: <20241001221509.7d418d15@xps-13>
In-Reply-To: <20241001-svc-i3c-hj-v5-4-480ab8aed849@nxp.com>
References: <20241001-svc-i3c-hj-v5-0-480ab8aed849@nxp.com>
	<20241001-svc-i3c-hj-v5-4-480ab8aed849@nxp.com>
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

Frank.Li@nxp.com wrote on Tue, 01 Oct 2024 12:02:53 -0400:

> According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:
>=20
> The I3C Controller shall hold SCL low while the Bus is in ACK/NACK Phase =
of
> I3C/I2C transfer. But maximum stall time is 100us. The IRQs have to be
> disabled to prevent schedule during the whole I3C transaction, otherwise,
> the I3C bus timeout may happen if any irq or schedule happen during
> transaction.
>=20
> Replace mutex with spin_lock_irqsave() to avoid stalling SCL more than
> 100us.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v3-v4
> - improve commit message
> - needn't mutex here, other place already use spin_lock_saveirq to protent
> i3c transfer.
> ---
>  drivers/i3c/master/svc-i3c-master.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index 5df0ec02d73ce..1ee6ce186195c 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -436,7 +436,16 @@ static void svc_i3c_master_ibi_work(struct work_stru=
ct *work)
>  	u32 status, val;
>  	int ret;
> =20
> -	mutex_lock(&master->lock);
> +	/*
> +	 * According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:
> +	 *
> +	 * The I3C Controller shall hold SCL low while the Bus is in ACK/NACK P=
hase of I3C/I2C
> +	 * transfer. But maximum stall time is 100us. The IRQs have to be disab=
led to prevent
> +	 * schedule during the whole I3C transaction, otherwise, the I3C bus ti=
meout may happen if
> +	 * any irq or schedule happen during transaction.
> +	 */
> +	guard(spinlock_irqsave)(&master->xferqueue.lock);
> +
>  	/*
>  	 * IBIWON may be set before SVC_I3C_MCTRL_REQUEST_AUTO_IBI, causing
>  	 * readl_relaxed_poll_timeout() to return immediately. Consequently,
> @@ -456,7 +465,7 @@ static void svc_i3c_master_ibi_work(struct work_struc=
t *work)
>  	       master->regs + SVC_I3C_MCTRL);
> =20
>  	/* Wait for IBIWON, should take approximately 100us */
> -	ret =3D readl_relaxed_poll_timeout(master->regs + SVC_I3C_MSTATUS, val,
> +	ret =3D readl_relaxed_poll_timeout_atomic(master->regs + SVC_I3C_MSTATU=
S, val,
>  					 SVC_I3C_MSTATUS_IBIWON(val), 0, 1000);

If we now are holding a spinlock and expect this to happen within
100us, then I guess the timeout should be reduced?

>  	if (ret) {
>  		dev_err(master->dev, "Timeout when polling for IBIWON\n");
> @@ -529,7 +538,6 @@ static void svc_i3c_master_ibi_work(struct work_struc=
t *work)
> =20
>  reenable_ibis:
>  	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
> -	mutex_unlock(&master->lock);
>  }
> =20
>  static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
>=20

Otherwise,

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miqu=C3=A8l
