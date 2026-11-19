Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795062939;
	b=hHSjpxFYZYW20QBXUFEK4KrB0JFA8sdwOINW5eyxOIcCcDzF84PpkjoL7ml6m5xZgTl4
	 JF2lmGkXbYh0+QHFdhumrwHrFwyM74x9QVM0f8ogidfgEsCEYQYMYhWMtEWB/8nzir5PQ
	 IKB/SYq88c4hj4z74xwVWobE/rNag1CkacWzHjXxgG7YTCawTDDJ7iQn37RmKc3+9+su0
	 QKtklMsowYsQR9iXNYHHL7lCeKntIK/S/nWN572dMGboypas28UZhKTp/koTkn92mRHwN
	 8OOngT6zm1YgBjoUn+lmyJ5in0dwLKAaEFj4VA3Q8fNc2tIp5ay6F5KkUPg2DGunH6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795062939;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Cw+SWX+I9U9ZVipeYJ5+oY+ioFr5kAi2QmhoV+/X388=;
	b=u2u6Ua7ojFuyfr7AO6QiNPwOc8ssuk+FwjABhLD+PU7bKGbf4stsH947sYkkG0m+IEqy
	 qscmvfhhwJw7usvS0Ef0etjzkQWNxBr/RxCRz7g59GD7D05XCxea9u20p9FMrfnMT2dFw
	 qU+EiLvJhuCFBXdnKjbuhu7DLb1036yO98rk3So/vmu32IieOU3cM+NtKjtD3IMWCnxWy
	 ti1A37BU0gdD5biGsAmr0aJ/sYJAia/bP9qxqgvjFHO6ntHiOPX/4iXXpzQdwqJcu5uWd
	 Rk63wNjPoz4mA4tqxWtsbj1bQ4kIHYdFgNgucnV7SlHqzafGKH+6QgQAR6lbmWCyfVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JcxcYKoX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F87606A325;
	Thu, 19 Nov 2026 04:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JcxcYKoX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F661F000C4;
	Thu, 19 Nov 2026 04:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795062939;
	bh=Cw+SWX+I9U9ZVipeYJ5+oY+ioFr5kAi2QmhoV+/X388=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JcxcYKoXzb8yFd6HXPq1yuVc4cJ7iYmDjD73nna9kl6hcD4SZHa8ZLHenoMPBRVPs
	 3C3CXgiCVW6AIUD6BPhsPWgcpcZRRvFCtrsFB7sSyF7M2IngF67HC3+hqFFjR7+EtI
	 ynIZFi7g5EB3jqVfAaLzrCafVTgvxI+baG1cIW5kTQBhNtgP05nm4patqBMqSGoQJ6
	 AkYevRdIhP1E2xWBXkbfRNYa323n9wVwbI7HxFjDs8el0y0rvDHg2A1K1otjO8SdZ4
	 UlmIQiBvvxD1ThW2dcx+Q1n6v3vGpzwm6E2OcU/aAdyvookAeBVFnx7G5lPOrIG1lt
	 Mv4OHf/0hW94Q==
Message-ID: <sashiko-outbox-222447@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] i3c: master: svc: Add amlogic a9 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261119-a9_i3c-v5-2-6ec51f8fb59d@amlogic.com>
References: <20261119-a9_i3c-v5-0-6ec51f8fb59d@amlogic.com>
 <20261119-a9_i3c-v5-2-6ec51f8fb59d@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 04:35:37 +0000
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
- [Medium] i3c: master: svc: clocks left enabled in
  svc_i3c_master_remove()
--

commit 3c43a1b9aa9bf261826430f4095843da1b45b5e2
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i3c: master: svc: Add amlogic a9 support

This commit adds Amlogic A9 EE-domain and AO-domain I3C controller support
to the Silvaco I3C master driver, registering the AO variant's internal
fast_clk divider chain with the common clock framework and configuring the
fast_clk rate during probe.

> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index e700392f0801f..d7381710657e2 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c

[ ... ]

> @@ -2163,9 +2229,214 @@ static const struct svc_i3c_drvdata npcm845_drvda=
ta =3D {
> =20
>  static const struct svc_i3c_drvdata svc_default_drvdata =3D {};
> =20
> +/**
> + * struct aml_i3c_ao_clk - container for the AO variant's internal fast =
clock
> + * @div_en: enables the internal divider
> + * @div: bus clock divider
> + * @gate: output gate of the generated fast clock
> + * @lock: spinlock shared by the gate and divider register operations
> + *
> + * The clock HW structures are registered with the clock framework and m=
ust
> + * stay alive for the whole driver lifetime, so they are kept along with=
 the
> + * shared lock used by their gate/divider operations.
> + */
> +struct aml_i3c_ao_clk {
> +	struct clk_gate div_en;
> +	struct clk_divider div;
> +	struct clk_gate gate;
> +	spinlock_t lock;
> +};
> +
> +/**
> + * aml_ao_i3c_tail_clocks - register the AO variant's internal fast clock
> + * @master: I3C master controller
> + * @parent: parent clock of the internal divider chain; must be "pclk", =
the
> + *          only clock the AO variant exposes (see silvaco,i3c-master.ya=
ml)
> + *
> + * Register the internal divider chain that produces the AO variant's
> + * fast_clk and append it to the clk bulk array as "fast_clk". The caller
> + * must run with the clocks enabled since the divider registers are
> + * accessed during registration. The appended clock is prepared and
> + * enabled here as well, because clk_bulk_prepare_enable() already ran
> + * in the probe with the original clock list.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +static int aml_ao_i3c_tail_clocks(struct svc_i3c_master *master, struct =
clk *parent)
> +{
> +	struct device *dev =3D master->dev;
> +	struct clk_bulk_data *new_clks;
> +	struct clk_init_data init =3D {};
> +	struct aml_i3c_ao_clk *ao;
> +	struct clk *fclk;
> +	char name[64];
> +	int ret;

[ ... ]

> +	ret =3D devm_clk_hw_register(dev, &ao->gate.hw);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register %s\n", name);
> +
> +	fclk =3D devm_clk_hw_get_clk(dev, &ao->gate.hw, NULL);
> +	if (IS_ERR(fclk))
> +		return dev_err_probe(dev, PTR_ERR(fclk),
> +				     "tail i3c fast clock failed\n");
> +
> +	/*
> +	 * Keep the clk bulk state balanced for the following
> +	 * clk_bulk_disable_unprepare() calls (error paths and runtime PM).
> +	 */
> +	ret =3D clk_prepare_enable(fclk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't enable fast_clk\n");
> +
> +	new_clks =3D devm_kcalloc(dev, master->num_clks + 1, sizeof(*new_clks),
> +				GFP_KERNEL);
> +	if (!new_clks) {
> +		clk_disable_unprepare(fclk);
> +		return -ENOMEM;
> +	}
> +
> +	memcpy(new_clks, master->clks,
> +	       master->num_clks * sizeof(*master->clks));
> +	new_clks[master->num_clks].id =3D "fast_clk";
> +	new_clks[master->num_clks].clk =3D fclk;
> +	master->clks =3D new_clks;
> +	master->num_clks++;
> +
> +	return 0;
> +}

[Severity: Medium]
Can this leave the internal divider clocks prepared and enabled when the
driver is unbound while the device is not runtime-suspended?

drivers/i3c/master/svc-i3c-master.c:svc_i3c_master_remove() {
	struct svc_i3c_master *master =3D platform_get_drvdata(pdev);

	i3c_master_unregister(&master->base);

	pm_runtime_dont_use_autosuspend(&pdev->dev);
	pm_runtime_disable(&pdev->dev);
}

svc_i3c_master_remove() relies on svc_i3c_runtime_suspend() to disable
master->clks.  If the device is still active when removed (for example when
CONFIG_PM is disabled, runtime PM is set to "on" in sysfs, or hotjoin held
a runtime PM reference), devres unregisters ao->gate.hw, ao->div.hw and
ao->div_en.hw while fclk is still prepared and enabled, triggering a
WARNING in clk_unregister() and leaking the prepare/enable count on pclk.
Calling clk_bulk_disable_unprepare() in svc_i3c_master_remove() when
!pm_runtime_status_suspended(&pdev->dev) would avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-a9_i3c-v5-=
0-6ec51f8fb59d@amlogic.com?part=3D2
