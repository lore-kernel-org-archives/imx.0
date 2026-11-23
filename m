Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466754;
	b=k/fDIIkVXcCYG8Ko8W/mgqqtl7yLNQnpa+5SzdObEQ0aoRiMzn8OpDqZn64BTUydQfNG
	 TXFq6UhJc7Avrt/lqqOlq3ZUzg76vgyvXwGN4wOHAP1Jiqr01UFC/PpaA8zMY30wNwGbv
	 KrfG4/ZpmID7SJUkH6069GA85Lj6vos0lravL6oqKx7qph1vIZIxFRpAfCX+jq56Sjdb/
	 EIsxZypzhL812urPUyMF+eCBC8l08NGSaTd4U+pqbQgM/cv+58I5iAE1EurJrL4mpXaS9
	 ILXt1cx0SQYetNQ/p1vuEo+QezYi22S9fkbZUtU0KgarmVi+r9dfGKbl/GHkM+zruzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466754;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=V4sr6w3eFWO2gINwFYygyNXMbQFEWmee131lVjXzBfQ=;
	b=YNbtN5la159lknkX9tzVgOTNFuH42NTbg0cGtN/lLOnJle7RbtafvXWfsGvwGIFsgAJo
	 l5NJGeWxBBKVOE3LZlLpvi0nG+q6AK1TQJ7FGLJNLMBs0iMYMqFG66185Ovxe6OrVOTEs
	 c1D6lSLhYS6u9h9qCplZ9dMKkRnhKH7c/dtsJK9KDQ+1QHZLOioZx6+KRZlwXNOX0JV7P
	 rKitIKfk0AQWJ/SMUwzfmjQq5hVl2Ev0QG0Bu0lQjGvAGP5k1d/MzJTvKfkw8O52EmGyU
	 IJcNdRR3J9sToEX0ks3prpe2s63nidVukM+FQpWb2jTLgnid+09uWHeQ0ZbSzmaJ8bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPH4E1am;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6748C606A31E;
	Mon, 23 Nov 2026 20:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YPH4E1am
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E6B1F000C0;
	Mon, 23 Nov 2026 20:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795466753;
	bh=V4sr6w3eFWO2gINwFYygyNXMbQFEWmee131lVjXzBfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YPH4E1amYZ/VUznsxsqx3AcZnN3PRfa0LSb+GIG4o6/EmkcDQzPzq5Fs7gIM3XutJ
	 TQrVKXQDBcdYX9MOpcAqD+ZxwUnaXRL0iCWLkSKvktz7XQg0lJUB+G3aTPUAYy53kH
	 5ESc1o5OWASbyOw2fAgImXTkQdZUr2lcTrEfMJ9vmqttGiqH9GXZcv5L3ls56HMeSc
	 EEwmlT9aWkVevGrc1AzJgWHIYRXHw/tU6dEtL/gzd1CvVYs8yb8S52OJ+kvB33uNfx
	 I31mvvWRJXW6YhLtWbETGuDt0kIHhWohsyuHPofV94N8VsMWNNlB2WVgR7qreUSmIj
	 KL42Bv6XJhEvQ==
Message-ID: <sashiko-outbox-230020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] timer-imx-gpt: Allow 32K clock to be used as a
 clock source
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123-imx6-idlestop-v1-2-e32f1f44e46f@kemnade.info>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
 <20261123-imx6-idlestop-v1-2-e32f1f44e46f@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 20:45:53 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] clocksource/drivers/imx-gpt: 0xff min_delta in
  mxc_clockevent_init() at 32kHz
--

commit 0ecf0128c84aa5f3ec6bfdf07afd50c02de8f373
Author: Andreas Kemnade <andreas@kemnade.info>

timer-imx-gpt: Allow 32K clock to be used as a clock source

This commit configures the i.MX GPT TCTL register to select the 32 kHz
clock and enable stop mode when the peripheral clock runs at 32768 Hz.

> diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/ti=
mer-imx-gpt.c
> index 8335bd7f8c6ce..3c023da565564 100644
> --- a/drivers/clocksource/timer-imx-gpt.c
> +++ b/drivers/clocksource/timer-imx-gpt.c

[ ... ]

> @@ -314,14 +316,19 @@ static void imx6dl_gpt_setup_tctl(struct imx_timer =
*imxtm)
>  	u32 tctl_val;
> =20
>  	tctl_val =3D V2_TCTL_FRR | V2_TCTL_WAITEN | MXC_TCTL_TEN;
> -	if (clk_get_rate(imxtm->clk_per) =3D=3D V2_TIMER_RATE_OSC_DIV8) {
> +	if (clk_get_rate(imxtm->clk_per) =3D=3D V2_TIMER_RATE_OSC_DIV8)  {
>  		tctl_val |=3D V2_TCTL_CLK_OSC_DIV8;
>  		/* 24 / 8 =3D 3 MHz */
>  		writel_relaxed(7 << V2_TPRER_PRE24M, imxtm->base + MXC_TPRER);
>  		tctl_val |=3D V2_TCTL_24MEN;
> -	} else {
> +	} else if (clk_get_rate(imxtm->clk_per) =3D=3D 32768)
> +		/*
> +		 * if powered by that always on clock, it is feasible to let
> +		 * it run in stop mode, too, allowing lower idle states
> +		 */
> +		tctl_val |=3D V2_TCTL_CLK_32K | V2_TCTL_STOPEN;
> +	else
>  		tctl_val |=3D V2_TCTL_CLK_PER;
> -	}
> =20
>  	writel_relaxed(tctl_val, imxtm->base + MXC_TCTL);
>  }

[Severity: High]
Does running clk_per at 32768 Hz leave the hardcoded 0xff min_delta in
mxc_clockevent_init() too large?

drivers/clocksource/timer-imx-gpt.c:mxc_clockevent_init() {
	...
	clockevents_config_and_register(ced, clk_get_rate(imxtm->clk_per),
					0xff, 0xfffffffe);
	...
}

At 32768 Hz, 255 ticks sets min_delta_ns to ~7.78 ms, so
clockevents_program_event() clamps every shorter hrtimer and scheduler
tick (such as HZ=3D250 or HZ=3D1000) to ~7.78 ms (~128.5 Hz).

In addition, mxc_clocksource_init() unconditionally calls
register_current_timer_delay() with freq =3D 32768, which fails with a
pr_err() in arch/arm/lib/delay.c because a 30517 ns tick exceeds the
1000 ns resolution limit, falling back to jiffies-based calibrate_delay()
while jiffies are advancing at the clamped ~128.5 Hz rate and
miscalibrating loops_per_jiffy.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-imx6-idles=
top-v1-0-e32f1f44e46f@kemnade.info?part=3D2
