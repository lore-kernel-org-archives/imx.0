Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795598340;
	b=qAXOWk8u0WdVEcQRQ6QzffHrDjn1y8h/eLdmMqwMaaxng+Ihgzer5U6YWxJENWsaHkX3
	 bWCd2URFq4iyR+6Hg5ZrKgojycNzbzsqyWxOJktaUBPyDE9lThvLJnPifTxs8HLJh43Zg
	 b099R++Bzgq9LAlLEE+T/dIoUAf68OGbTmjbRKi7goyC3xp4Q6wrDLm+ejqyZ0povdxLi
	 t4u6stHdML7HCLa7Kg7wnOC6RRbqjCNVEya0s8cUL4+NbeZRmMF3kF9Lzpksh2S2iuN7H
	 AXpdukP6aVHL+oU+23e1UmGGZcV/GYGtTEWragZcANkHda2V1Ach4b3WZb52FRRxh8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=G2pU++T3tD+tmGyFtl1Nv5aGN0H0XWEVrsx+kHagZgU=;
	b=HB48JcPSE2Dj8cAitNs3WsnMoJbGOTy1XSlfXsf329f6cCQGYAZuUvsoVh047uj6P9hA
	 t1kkFosG/Cbd9v1XDRNKs3eeD8g+6W+M5yyBiMj7VFcqOGLntRgYiXYemS2vy4nllv7DI
	 DmTK+5Q26XUXrzzwfd5uCt+88JRWCxToCOo0XfQGj3fU/UhVcl9Y0FTjBjVsaidxwaq8V
	 sHD60iXCB/dfhqbIv8ZOtpbQmV/XCb7pLLSAOOUbxS3y9fhPoF8Gou2ReDKHc8irqExz0
	 AvVZRZPvChpJkXERtsiKi/SLYugc+Y1ypIo6GEphWm/atpyz7U16IsbUR0DglVlK0pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NUWHpIRD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BA0606A693
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 09:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67BA0606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NUWHpIRD
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 03FE420227C;
	Wed, 25 Nov 2026 10:18:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795598336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G2pU++T3tD+tmGyFtl1Nv5aGN0H0XWEVrsx+kHagZgU=;
	b=NUWHpIRDlROu5QfbaYS1pqZe+7mb6TlYhitoJdVAN7dzZCNPqt0jciWNeFUpQaXN/mwR3V
	PPv/UdupcQm2oQKDE9qxIWQNYr0G2eej8Hx01Gy+BwJaOBPXSAz5YUjjDrUD96zpdRXmYn
	+cWlfjzVW4mWu0wIwpRlYNCrXdDOfHLA9Y+26zJC+po9IhcaUXgkvyYEyp/Uo1CoIxKpdy
	7ZWCCqH/0+FW+g9SACka6JEA4hM8VOoeQheaF2m2SPeJKz/jTLKLzq2r9OVdT00Hdbe2Cs
	cXgQRvZQh73G6O7nXbUtG02n1qeyceSSCP6aw+CCEhUyykK03KAtAEbb6Etqbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795598336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G2pU++T3tD+tmGyFtl1Nv5aGN0H0XWEVrsx+kHagZgU=;
	b=WIQuXForrUxbZj1ZLOKtvyBrWvFaZPIIWR6RaXxWoiWy6dzgnZN/WHtyzDqs3xBL1WKNCf
	2HDMD3dXkLIYwsbcE9Mrj8Ik1Ran+0siLnPbPZerIQ/w/XICJomT+nfQ54xRj7DgPB1hyO
	szUdMjl72Tfnl3iOiQBBKeCdtAiYRoyGT9Hzlx/gdjzda85qkEX5LwVtgUHGvSC07KJR2w
	P+o/poLQ15F68pnCKwqCMTgPVkhE/kAoaEpti3xhcFVvWzi+RDVm6VJwdhzls3adlI+f/q
	dhvt8DLHfBVJ7u69ge6hg2b7zDcV2ktuetwamDuF9oz0rnPAL0wUn8Dr7Y+ESw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795598336; a=rsa-sha256;
	cv=none;
	b=dlRC6oIgk4ou6lgyRk6gIrOaWT4JF6goh6lS+8gbaCvhiby05o6V8EvwZPKYMfCCBG6xsL
	XUexA9XNQYyinMmQuM9vCkgGNPxM6yQO2TdxieDmSC51+ucvvAzzqXv0uuI+f9FnfpuTFd
	fY0PpbYb13lKfkeG+MP7s24gCS7PZeDR3/290oPiq7VyLuzHuMNlldaWeJnFxHONlyG5Te
	C9MXKRiQHD/1m6pNJkozWnE1axyXJ00IqShICWJbPX/NKj6vGJ/Zvq1yMFv/XgXRrXxIzW
	mCspbzQ5JBXnskgJ39t4XZAqBD5RU5NTjHJDGOF4EUb5kpqOi0fSKnFWAFXlAg==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id DC69E1BF4F2; Wed, 25 Nov 2026 10:18:55 +0100 (CET)
Date: Wed, 25 Nov 2026 10:18:55 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Prasanth R <ragaprasanth@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, imx@lists.linux.dev, 
	Support Opensource <support.opensource@diasemi.com>, Prasanth R <prasanth.r@lineo.co.jp>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, CL Wang <cl634@andestech.com>, 
	linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/12] rtc: snvs: clear the wake IRQ on unbind
Message-ID: <mo4vj2higl2dmabkeslouimdgoeofqlkyjnngytv5wmub2h4w3@t2ayiiw4qaoz>
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
 <20261125072026.2997493-2-prasanth.r@lineo.co.jp>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125072026.2997493-2-prasanth.r@lineo.co.jp>

Hi Prasanth,

thanks for the patches, please see below.

On 26-11-25 16:20, Prasanth R wrote:
> From: Prasanth R <ragaprasanth@gmail.com>
> 
> The driver has no remove callback, so the wake IRQ set with
> dev_pm_set_wake_irq() and the wakeup source enabled with
> device_init_wakeup() are never released on unbind.
> 
> When the driver is bound again, dev_pm_set_wake_irq() finds the old
> wake IRQ, warns "wake irq already initialized" and returns -EEXIST, so
> the driver prints "failed to enable irq wake".
> 
> Use the device-managed variants so both are released on unbind.
> 
> Tested on an i.MX6Q SABRE-SD board by unbinding and binding the driver
> through sysfs.
> 
> I used an AI assistant (Claude) to find this and write the change.
> 
> Fixes: e7afddb2b4d2 ("rtc: snvs: use dev_pm_set_wake_irq() to simplify code")
> Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> ---
>  drivers/rtc/rtc-snvs.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
> index d99a352d6..647952dcd 100644
> --- a/drivers/rtc/rtc-snvs.c
> +++ b/drivers/rtc/rtc-snvs.c
> @@ -383,8 +383,11 @@ static int snvs_rtc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	device_init_wakeup(&pdev->dev, true);
> -	ret = dev_pm_set_wake_irq(&pdev->dev, data->irq);
> +	ret = devm_device_init_wakeup(&pdev->dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "failed to init wakeup, %d\n", ret);

If there is an error you should return here. I would also suggest to at
a proper failure handling for devm_device_init_wakeup() on all the other
patches, albeit these drivers may not handle it today. Furthermore these
days dev_err_probe() should be used during probe, so you have a pattern
like:

if (ret)
	return dev_err_probe(&pdev->dev, ret, "failed to init wakeup\n");

Regards,
  Marco

> +
> +	ret = devm_pm_set_wake_irq(&pdev->dev, data->irq);
>  	if (ret)
>  		dev_err(&pdev->dev, "failed to enable irq wake\n");
>  
> -- 
> 2.43.0
> 
> 
> 
