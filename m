Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467593;
	b=fXM8h96Wg6BebWl6knpf2Is4HE/pWaad2gqiRVDMCtPMv+sTEUH/BXtTSgYRSLaL5rP1
	 8g4UGKXcvoHjayU/GvlIrmJqEhbdb5t7ECIJi4H0/LNAwupDbcYURj4Dhtgp5h2ROMaaY
	 fbPjJqucSB1s67q06Gs0l2iQBhbw29lVc+GMw794SqBnlSL7HGTxuxo7nF5saWH6z6P6Y
	 tJ4++hddKZ15xz4RxrCsvVTSehCXYoI9Ax+ibypBlURGnU60SKhI71rXykW42nCaLVzx/
	 uQJ62uruNlW36wdB63a6O4EDGjMFm5Pc0fXWLRYKCFy0EChza3dJ/OxOqajOP7jMPIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467593;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Qw4hfbbu4FwntsAYB2w1KD6ARMrVO1jw8q1lK4qJHKo=;
	b=D9O3UgMI8MYSQgC45RgzFdy/Xpcdz+/QvUEpHvmSJuwehMwshxdsNgq8OjbLySJL6HJT
	 BGLoQ4bsF7PsYPSnzu+LZaTUKrALxtnMrEmR6N9KJvYuL4IzyHwBSIosTwjpovEVWuYvn
	 HGgrhMWpij7O4XnFqyFWdgEIh6nXrscLsv2oyIlJqVlb9ahub/WB1DJrnRahkm7FHYLgO
	 ZxtZ3jwsShvjqmQaxRwLqoxu/qAJfJDaXHOLT0n7o3LEDR42FhwGLobgdwrfCfpjbIEqW
	 4nCncdVptrPDoLmIIz7LC+bamRtArppP077Rx8gXPFibTQ+yAkUCiG3oc6gWxnB0Jgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Q/VOB4/k";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0316606A31E;
	Mon, 23 Nov 2026 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q/VOB4/k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF091F000CF;
	Mon, 23 Nov 2026 20:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467592;
	bh=Qw4hfbbu4FwntsAYB2w1KD6ARMrVO1jw8q1lK4qJHKo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q/VOB4/kSRRxHt482+WKNPyoldnKDimNbh8BxxSZDOgPSdF+RjhhP5Z0C+uX30s4z
	 vgZR//BoISJYAbC76DQzoQqhhhBW4AOPDOfqWxzfWXN9G978pGcDLnxgSOZaU3OUxl
	 ynt0jip00Rzgb8g1j+eDhvtUkHnxb4Tupzw+YsTaLb/OB+qv8O8H1wvjMpZmVZHAn7
	 yEKSBanf2YMUxnV7LwexE97yE9ek5kznhL9nU1gxRliDK8aay8ji6YUpJkUGQjTy7r
	 EUFV5pTSeSf+nxn2wwxo5LeyNKa9lfx4HdbSa6VCkmTL2QPrJ2umJwSCqVwFnk9jFZ
	 jrNYmhRYgUNnw==
Message-ID: <sashiko-outbox-230043@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: imx: kobo-clarahd: Use 32K clock for the
 timer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andreas Kemnade" <andreas@kemnade.info>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261123-imx6-idlestop-v1-3-e32f1f44e46f@kemnade.info>
References: <20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info>
 <20261123-imx6-idlestop-v1-3-e32f1f44e46f@kemnade.info>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 20:59:52 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] ARM: dts: imx: kobo-clarahd: missing Signed-off-by trailer in
  commit message
- [High] ARM: dts: imx: overriding gpt1 per clock with 32K CKIL degrades
  system timer
--

commit f6e6f44334678659ba2ecc2406ebe0d33a2e4544
Author: Andreas Kemnade <andreas@kemnade.info>

> ARM: dts: imx: kobo-clarahd: Use 32K clock for the timer
>
> To avoid depending on PLL infrastructure for timekeeping, use 32K timer
> for the timer.

[Severity: High]
The commit message is missing a Signed-off-by: tag.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts b/arch/ar=
m/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
> index 1000ee8b807aa..2e907c4163629 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts
> @@ -46,6 +46,11 @@ &gpio_keys {
>  	pinctrl-0 =3D <&pinctrl_gpio_keys>;
>  };
> =20
> +&gpt1 {
> +	clocks =3D <&clks IMX6SLL_CLK_GPT_BUS>,
> +		 <&clks IMX6SLL_CLK_CKIL>;
> +};
> +
>  &i2c1 {
>  	pinctrl-names =3D "default","sleep";
>  	pinctrl-0 =3D <&pinctrl_i2c1>;

[Severity: High]
Does overriding gpt1's per clock with the 32.768 kHz IMX6SLL_CLK_CKIL
degrade system timekeeping on i.MX6SLL, where gpt1 is the only system
timer?

In drivers/clocksource/timer-imx-gpt.c, mxc_clockevent_init() registers
the clockevent device with a hardcoded min_delta of 0xff ticks:

drivers/clocksource/timer-imx-gpt.c:mxc_clockevent_init() {
	...
	clockevents_config_and_register(ced, clk_get_rate(imxtm->clk_per),
					0xff, 0xfffffffe);
	...
}

At 32768 Hz, 255 ticks is ~7.78 ms, so clockevents_program_event() clamps
every timer or hrtimer wakeup below 7.78 ms (including scheduler ticks at
CONFIG_HZ >=3D 200 and short cpuidle sleeps) to 7.78 ms.

At 32768 Hz, mxc_clocksource_init() also reduces sched_clock and
clocksource resolution to ~30.5 us, and register_current_timer_delay()
rejects imx_delay_timer because its resolution exceeds 1000 ns, falling
back to loop-based udelay() on a board with cpufreq scaling.  In addition,
the GPT clock inputs are internal to the i.MX6SLL SoC, so overriding the
per clock in the board DTS does not describe board-specific hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-imx6-idles=
top-v1-0-e32f1f44e46f@kemnade.info?part=3D3
