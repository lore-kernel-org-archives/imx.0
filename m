Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691643;
	b=Ex9caEOeHW9OGGRtJ+AnXBG8xOdhIxwnXUhGIyeYanydk8pNFMb4IyN5BAh1pu/yvnN/
	 KmcyD++ZP3piHY3qveyyUi9NTicc8e6jeXij1MCBZH/UJE1w3a1QNVa25ltyHAcEYyjxF
	 8dpZvIqjRz5h4kmsNOf9xdqJgrqSfRq+4s8fDhrQc2rQgI1GBDa6bC4DqEI5aitPFOEIA
	 qUtslHzarjHSyqRK3B3HVpNm08b6ERsFPzkf/Rio+VLvTj4crvlMtPLkEtp/QvQl65hay
	 hiGKXRDFsr+FKrqoJvMYEgDHRx2uqbD6lperz3GzIpbl/CFcRjo/HBO8jroy0OjyCpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691643;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VEUGBS5H5UOXhhfNeblNGivYRklYJG60u1ibM6gPMlY=;
	b=pRse3vwCF2//0nc6pfZb0vBv+j0ODVTF7uPmWhWp23g2IHDH8YuSHWzY6HnL8bwlsqIY
	 yZeNDxIzpXAwxWqSSEbnH4GlaSGiQmBWATJ56rGA/6Dmsvxzw10Jz3X55bwN6CGddHd6a
	 Zs22Vlkmn0ILIzvB5chUdTJ4FOyF6XskD9xMX6bzcAt4eHeUV8Pn9LKzkHONu2MILKnNx
	 5w4/Ns33fFo4CytjvRPmL7/TTyNvWD9PgId5Z7lCYWmMtS+U2AFLC5tZBiSRRfpjxUOY1
	 7WoTkvKzTczYM4RZSyD2s1mhuyKF5d2o4oKliwEYO9JOOdWmknatB2MAZsWNjFvJUMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4NRZAKH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B817606A31C;
	Thu, 26 Nov 2026 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m4NRZAKH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9321F000C4;
	Thu, 26 Nov 2026 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795691643;
	bh=VEUGBS5H5UOXhhfNeblNGivYRklYJG60u1ibM6gPMlY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m4NRZAKHH4YZRVANSwEp+3uE1mtedCM2N7sXZG6JMs8hAB9lPlohoZfYr7JCB9gI8
	 ZOtzhGsl+mZdYXUUn8P9QY2Z8oHAwbWQx7l2UUIbro4mgbof+VVmDLE4XmjHzMyYPn
	 1m5wiVVWR8qdrPUakS/yPK6vebcvkGYSS1/1R2ZW2cJXL5geTz5+SM0h3HhP6HOMv+
	 1CiDs5whhG+1myEUh2Cq465sbzB6PVitHLbNy1/uIS+1Oz510eqPM0TfaNVH92uKQO
	 5MSyIqMzDq9uh9fN11lnGzmQvbW4vQTvnFGJHbqYJJNG/d2hSVXLsiQBKSASh3LVOH
	 vCF4+HARdTMzg==
Message-ID: <sashiko-outbox-235351@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] timer-imx-gpt: Allow 32K clock to be used as a
 clock source
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261126-imx6-idlestop-v2-2-c6987e7a392f@kemnade.info>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
 <20261126-imx6-idlestop-v2-2-c6987e7a392f@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 11:14:02 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] clocksource/drivers/timer-imx-gpt: use-after-free in
  mxc_timer_init_dt() [1]
--

commit 870748ba8cec003b2bb83b77fde7449ddd3b4055
Author: Andreas Kemnade <andreas@kemnade.info>

timer-imx-gpt: Allow 32K clock to be used as a clock source

This commit configures the i.MX GPT timer control register and minimum
clockevent delta to allow using the 32.768 kHz clock as a clock source.

> diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/ti=
mer-imx-gpt.c
> index 8335bd7f8c6ce..85fd36fe1c760 100644
> --- a/drivers/clocksource/timer-imx-gpt.c
> +++ b/drivers/clocksource/timer-imx-gpt.c

[ ... ]

> @@ -281,8 +284,7 @@ static int __init mxc_clockevent_init(struct imx_time=
r *imxtm)
>  	ced->rating =3D 200;
>  	ced->cpumask =3D cpumask_of(0);
>  	ced->irq =3D imxtm->irq;
> -	clockevents_config_and_register(ced, clk_get_rate(imxtm->clk_per),
> -					0xff, 0xfffffffe);
> +	clockevents_config_and_register(ced, rate, rate =3D=3D 32768 ? 3 : 0xff=
, 0xfffffffe);
> =20
>  	return request_irq(imxtm->irq, mxc_timer_interrupt,
>  			   IRQF_TIMER | IRQF_IRQPOLL, "i.MX Timer Tick", ced);

[Severity: Critical]
This problem wasn't introduced by this patch, but can a failure in
request_irq() cause a use-after-free on imxtm->ced [1]?

mxc_clockevent_init() registers imxtm->ced with
clockevents_config_and_register() before calling request_irq().  If
request_irq() fails, the error propagates through _mxc_timer_init() to
mxc_timer_init_dt(), which frees imxtm while the clockevents core still
holds a reference to the registered ced:

drivers/clocksource/timer-imx-gpt.c:mxc_timer_init_dt() {
	...
	ret =3D _mxc_timer_init(imxtm);
	if (ret)
		goto err_kfree;
	...
err_kfree:
	kfree(imxtm);
	return ret;
}

Requesting the IRQ before calling clockevents_config_and_register() would
avoid leaving a registered clock_event_device behind on failure.

[1] https://sashiko.dev/#/bug/linux-b33465da-04a0-4dc9-8c09-6d0b6a5ad47b

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-imx6-idles=
top-v2-0-c6987e7a392f@kemnade.info?part=3D2
