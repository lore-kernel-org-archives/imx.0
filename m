Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617532;
	b=nJ72AIb8b699L3yKdilpgTisjUdOvhyC43VU9rU7JQCL/I0no8h0KS1Fe/N2v3UPOuSi
	 fPLMerMYYqwjvA4dJJahLJHai7A5zcmHTBsRG95CVDP3KyVFAQgvmsSVkPIoibbba4sZZ
	 rpA35rlHB0HlMoDeFhcMzfIfqMQz0BnJEobXIvK5ZPsuJx/grkw7BwBlOkDKdhH7dDyjr
	 5zAciXnaYOA8t3wcXp7X17fs7+NuDzTIT/LX3dT2N7ZBxUBw1Cn+RIUdGu2MMjraPXPtY
	 q3gA96Tsc+qyMBbhlvBI8WKTbjM8U1LPDWxFuM3JUVDIBmRhuZ8BuQDQ2nOHx9fbLMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617532;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=IQ9fZw32uZVF3Ywd8chKQW0lakTMcQKc2jgAvfNuIBI=;
	b=mrFSDk6777Wb2NUpa3lx6/6lZZcQKB+9ITwpu8ST3RcVWJGwkHPa1KAIrTVuU9021hBy
	 mUjXSuD23MmuDFWfGvsJN0ucr5hskMcneLXIj/GbaGIO9WXybB+0bSvn18N4ggx4FxWLE
	 bFwN7jgD2cPqOTbrylJKC9E3GpWyu+F12fEc2mfU4ftXTbyrnn5bjB+dJjuXWfqIwYnHb
	 Tcg16mzPU9jpymlK0pcI5ZzOdXt/RmdzNcQlpDsQLlwORIJH/JTPvxPaCkHQQmXGwEEHc
	 sU6pzQ+z1YL0tw1shiCBVUl0eAWtiZKU/xOnLF1RF6alZV0ShQc2gDqQznr1EOp1Viw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F03606A321
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 14:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F03606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <84e1cc8b3977f011950e68ca69c46dff1a395175.camel@crapouillou.net>
Subject: Re: [PATCH 08/12] rtc: jz4740: clear the wake IRQ on unbind
From: Paul Cercueil <paul@crapouillou.net>
To: Prasanth R <ragaprasanth@gmail.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team	 <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Support Opensource	 <support.opensource@diasemi.com>,
 CL Wang <cl634@andestech.com>, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-mips@vger.kernel.org, Prasanth
 R <prasanth.r@lineo.co.jp>
Date: Wed, 25 Nov 2026 15:38:45 +0100
In-Reply-To: <20261125072026.2997493-9-prasanth.r@lineo.co.jp>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
	 <20261125072026.2997493-9-prasanth.r@lineo.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Prasanth,

Le mercredi 25 novembre 2026 =C3=A0 16:20 +0900, Prasanth R a =C3=A9crit=C2=
=A0:
> From: Prasanth R <ragaprasanth@gmail.com>
>=20
> The driver has no remove callback, so the wake IRQ set with
> dev_pm_set_wake_irq() and the wakeup source enabled with
> device_init_wakeup() are never released on unbind.
>=20
> When the driver is bound again, dev_pm_set_wake_irq() finds the old wake
> IRQ, warns "wake irq already initialized" and returns -EEXIST, so probe
> fails with "Failed to set wake irq" and the RTC cannot be bound again.
>=20
> Use the device-managed variants so both are released on unbind.
>=20
> Compile-tested only.
>=20
> I used an AI assistant (Claude) to find this and write the change.
>=20
> Fixes: 3b2dc19ff9a1 ("rtc: jz4740: use dev_pm_set_wake_irq() to simplify
> code")

Should probably Cc: stable@vger.kernel.org then.

> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>

(Your family name is R?)

> ---
> =C2=A0drivers/rtc/rtc-jz4740.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
> index 32c331f3f..41501c9ed 100644
> --- a/drivers/rtc/rtc-jz4740.c
> +++ b/drivers/rtc/rtc-jz4740.c
> @@ -367,9 +367,9 @@ static int jz4740_rtc_probe(struct platform_device *p=
dev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, rtc);
> =C2=A0
> -	device_init_wakeup(dev, true);
> +	devm_device_init_wakeup(dev);

I see devm_device_init_wakeup() can return an error, which should be handle=
d.

Cheers,
-Paul

> =C2=A0
> -	ret =3D dev_pm_set_wake_irq(dev, irq);
> +	ret =3D devm_pm_set_wake_irq(dev, irq);
> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(dev, ret, "Failed to set wake irq\n");
> =C2=A0
