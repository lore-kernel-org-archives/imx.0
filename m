Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158DF1898F3
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 16:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429971; cv=none; b=u2uBlxhLrOUlm0/4rm1PRLBK8I9BIjSJSzg3Tbi2bv8i4kHytTqpq1JSAQEkF+GsTjOD3xPO1IP0lcGo05r6pbnf4M24byB1VnxhTVFGiHHd+tsjecee5Zy9jC+SQjR2aHSzKBSt9mpebcghKVxG8ZBDBOb5LrDpT9UDRABYoBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429971; c=relaxed/simple;
	bh=35F4cwD/nlOTdqpbRF/g2qwU6A/s/jWVS/PZIIxYZQg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MTLyWomNP/WEN/ES7e+P/9LswJm/Qk+LtGJ8asVaKppgoijnYSPt2I8Ys/YPbzpScJJwNcSzb01joMRxbPCwd59OyaaPD42r49JZ3dxHaumndjSZW7Fay55HQk53l1EN0dSKWieYlzEm30V04iXgmPRxLPN6kY3+M4fxegrpf84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ce/wQMO2; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ce/wQMO2"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDA2F20003;
	Fri, 23 Aug 2024 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724429968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGoYbKzQa3GXqZypdwCwdebcsHe5jiKHQseAXFC7eXA=;
	b=Ce/wQMO2CzuqN1Dc8v4VbnCV0r4T7/QWH7RsVeZUsdzvKgXpc4PlA027pYZ7uTOGQT2jSB
	c0Ma/QM87/jNcTN+2Lv3le8a3qzHTC/PS0ZmmE+Xi3WRJL3gIIMepAE1V5boJd0+Xd8+Ra
	x2HifcNejGNRn8+nAV4P7nQhMG3rObXBdOcxKo1IENnpcX08lWnUGW1pUBHi7REDjmWoIj
	uluPSUS74agLT93+u3XQPnGTowm8X+WYKOOjMIjZoZ+Z+XUsEOBFY05rcjZonHoZq09vhj
	EsmYTeHXehCvZBLzaUkMttE+0D0BV21gzcJUieIqkH+sd5IfdnfosZKjgBYNWw==
Date: Fri, 23 Aug 2024 18:19:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 09/11] i3c: master: svc: use spinlock_saveirq at
 svc_i3c_master_ibi_work()
Message-ID: <20240823181927.7a003c36@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-9-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-9-7d69f7b0a05e@nxp.com>
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

Frank.Li@nxp.com wrote on Mon, 19 Aug 2024 12:02:03 -0400:

> According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:
>=20
> The I3C Controller shall hold SCL Low while the Bus is in I3C/I2C Transfe=
r,

				    low				    transfer

> ACK/NACK Phase. But maximum stall time is 100us. We have to disable irq a=
nd

and/or (I'm not sure)				the IRQs

> schedule during whole I3C transaction, otherwise, I3C bus timeout will

prevnet scheduling during the whole 		the      may
timeout.

> happen if any irq or schedule happen during transaction.
>=20
> Replace mutex with spinlock_saveirq() to make sure finish whole i3c

			wrong name	to avoid stalling SCL...

> transaction without stall SCL more than 100us.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Yes, 100us is low, and that's why I initially did my best to enforce
auto ack/nack. We cannot make sure this limit will not be crossed, and
when it's the case, we need to handle the consequences.

> ---
>  drivers/i3c/master/svc-i3c-master.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index 161ccd824443b..fbb6cef405577 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -432,7 +432,16 @@ static void svc_i3c_master_ibi_work(struct work_stru=
ct *work)
>  	u32 status, val;
>  	int ret;
> =20
> -	mutex_lock(&master->lock);

Don't you still need this lock for other concurrency reasons?

> +	/*
> +	 * According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:
> +	 *
> +	 * The I3C Controller shall hold SCL Low while the Bus is in I3C/I2C Tr=
ansfer, ACK/NACK
> +	 * Phase. But maximum stall time is 100us. We have to disable irq and s=
chedule during whole
> +	 * I3C transaction, otherwise, I3C bus timeout will happen if any irq o=
r schedule happen
> +	 * between transaction..
> +	 */
> +	guard(spinlock_irqsave)(&master->xferqueue.lock);
> +
>  	/*
>  	 * IBIWON may be set before SVC_I3C_MCTRL_REQUEST_AUTO_IBI, causing
>  	 * readl_relaxed_poll_timeout() to return immediately. Consequently,
> @@ -452,7 +461,7 @@ static void svc_i3c_master_ibi_work(struct work_struc=
t *work)
>  	       master->regs + SVC_I3C_MCTRL);
> =20
>  	/* Wait for IBIWON, should take approximately 100us */
> -	ret =3D readl_relaxed_poll_timeout(master->regs + SVC_I3C_MSTATUS, val,
> +	ret =3D readl_relaxed_poll_timeout_atomic(master->regs + SVC_I3C_MSTATU=
S, val,
>  					 SVC_I3C_MSTATUS_IBIWON(val), 0, 1000);

This means you lock one CPU for 100us doing nothing every time you send
a frame, that's not possible. Actually the delay was already very small
(could have been set to ~10 maybe) but this is not possible.

>  	if (ret) {
>  		dev_err(master->dev, "Timeout when polling for IBIWON\n");
> @@ -525,7 +534,6 @@ static void svc_i3c_master_ibi_work(struct work_struc=
t *work)
> =20
>  reenable_ibis:
>  	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
> -	mutex_unlock(&master->lock);
>  }
> =20
>  static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
>=20


Thanks,
Miqu=C3=A8l
