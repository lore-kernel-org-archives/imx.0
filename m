Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2934848A9;
	Mon, 19 Oct 2026 05:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389215; cv=none; b=Wls4/CJyo3X/nMrCnVC1d43RFLjKNSW59dvsx2GhX+X+JtvE8TfjIrEPYlKOEfigSAkxjmrRHG7+6qzaFwv4aI/6gipIvXf3/Ys1nhXXO8d2lfCP2Me5IyOeWPWGFwV2hbp1YIr6U48Jo6iz/fu7j/3i+VzsyZiUmLCQgBl4jOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389215; c=relaxed/simple;
	bh=Odbrb2g/txfb1JtG5kb/n0FRk7MR1WMWlgdmU0jJ1X0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=c5kXSHEhRd1lToyLMyjL8lzfG13jDQT1TSeq301Ku3yhAKEos0sTqqDFGCpE+YeDo5YLcGQVecfrpZyCZkfRkZwgEuzIgMLy6moKWx9Pq443306eXznzUE0u/xmxu+/PLe5PPntp9rNkh0pPaxlUDEjJREMG6F4C6hhwtc3eAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OFYMXqBa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFYMXqBa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7193A1F000C5;
	Mon, 19 Oct 2026 05:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792389127;
	bh=rkza5uVRf34cN3QyerCAeal95ev4k8kEa3sElA7jHBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OFYMXqBanYhuS4CFmXxh8oVGz7ZlxTDx99/nflQfpNGVEaiEVutaAGucoj/4rUSL2
	 rz3hIzTqv1ClPFoQ882yy3Wx7us2HvNYAyOShCcD/kLMDH76WsMRQLYpQEY5MrT0bJ
	 r9HSi4bTDPBje+MLoTf5XG4fGZmllMDFpLiQk7u9F7Sjqxot97R1iea3ozk4lcZybZ
	 BUfQEK+TsjcAgmMbIAlLbZ6MURi5H/GuBzyMBSGgapvI3Jkm4WBsb87Wj6bmqYZ5de
	 vWlvBqNAAkslUahxpbivyXgSpCslTlVD1ZKkF69u2OoTmCg8anOfBfKVfOyxC+YfWI
	 rwbKUfSsqLf0A==
Message-ID: <sashiko-outbox-176673@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] i3c: master: svc: Add Amlogic A9 glue layer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junyi Zhao" <junyi.zhao@amlogic.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>
In-Reply-To: <20261019-a9_i3c-v1-3-329d819d621f@amlogic.com>
References: <20261019-a9_i3c-v1-0-329d819d621f@amlogic.com>
 <20261019-a9_i3c-v1-3-329d819d621f@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 05:52:07 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] i3c: master: svc: broken probe deferral in amlogic_i3c_probe()
- [Medium] i3c: master: svc: clock enable leak in amlogic_i3c_remove()
- [Medium] i3c: master: svc: i3c-amlogic: missing I3C_AO_FCLK_DIV_CTRL rest=
ore on resume
- [Medium] i3c: master: svc: incorrect fclk rate and divider math in amlogi=
c_i3c_probe()
--

commit cf70cd7b59395de84561d30a5e3b3862aa275ac4
Author: Junyi Zhao <junyi.zhao@amlogic.com>

i3c: master: svc: Add Amlogic A9 glue layer

This commit adds an Amlogic A9 glue driver for the Silvaco SVC I3C
controller, providing Amlogic-specific clock and runtime PM handling while
reusing the common SVC I3C core driver.

> diff --git a/drivers/i3c/master/svc/i3c-amlogic.c b/drivers/i3c/master/sv=
c/i3c-amlogic.c
> new file mode 100644
> index 0000000000000..82300d6ae5a31
> --- /dev/null
> +++ b/drivers/i3c/master/svc/i3c-amlogic.c
> @@ -0,0 +1,250 @@

[ ... ]

> +static int default_i3c_fclk_rate_init(struct svc_i3c_master *master,
> +				      struct clk *fclk, unsigned long rate)
> +{
> +	int err;
> +
> +	err =3D clk_set_rate(fclk, rate);
> +	if (err)
> +		return dev_err_probe(master->dev, err,
> +				     "setting fast clock rate failed\n");
> +
> +	return 0;
> +}
> +
> +static int ao_i3c_fclk_rate_init(struct svc_i3c_master *master,
> +				 struct clk *fclk, unsigned long rate)
> +{
> +	unsigned int div_cnt, reg_val;
> +	unsigned long fin_freq =3D clk_get_rate(fclk);
> +
> +	if (!fin_freq)
> +		return dev_err_probe(master->dev, -EINVAL,
> +				     "can't get I3C fast clock rate\n");
> +
> +	div_cnt =3D div64_u64(fin_freq, rate);
> +	if (!div_cnt || div_cnt > I3C_AO_FCLK_DIV_MASK)
> +		return dev_err_probe(master->dev, -EINVAL,
> +				     "requested fast clock frequency too low\n");
> +
> +	reg_val =3D I3C_AO_FCLK_DIV_EN | I3C_AO_FCLK_EN | (div_cnt - 1);
> +	writel(reg_val, master->regs + I3C_AO_FCLK_DIV_CTRL);
> +
> +	return 0;
> +}
> +
> +static int amlogic_i3c_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	const struct amlogic_i3c_drvdata *data;
> +	struct svc_i3c_master *master;
> +	struct amlogic_i3c_priv *priv;
> +	struct clk *fclk;
> +	int ret, i;

[ ... ]

> +	priv->num_clks =3D devm_clk_bulk_get_all(dev, &priv->clks);
> +	if (priv->num_clks < 0)
> +		return dev_err_probe(dev, -EINVAL, "can't get I3C clocks\n");

[Severity: High]
Should amlogic_i3c_probe() pass priv->num_clks instead of -EINVAL to
dev_err_probe() here?

When devm_clk_bulk_get_all() returns -EPROBE_DEFER because the clock
controller has not probed yet, passing a hardcoded -EINVAL causes
dev_err_probe() to log an error and abort probing permanently instead of
deferring.

> +
> +	for (i =3D 0; i < priv->num_clks; i++) {
> +		if (!strcmp(priv->clks[i].id, "fast_clk"))
> +			break;
> +	}
> +
> +	if (i =3D=3D priv->num_clks)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "can't get I3C peripheral clock\n");
> +
> +	if (IS_ERR(priv->clks[i].clk))
> +		return PTR_ERR(priv->clks[i].clk);
> +	fclk =3D priv->clks[i].clk;
> +
> +	ret =3D clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "can't enable I3C clocks\n");
> +
> +	master->dev =3D dev;
> +	master->bsp_priv =3D priv;
> +	ret =3D data->fclk_rate_init(master, fclk, I3C_DEFAULT_FCLK_RATE);
> +	if (ret)
> +		goto err_disable_clks;
> +	master->fclk_rate =3D I3C_DEFAULT_FCLK_RATE;

[Severity: Medium]
Can the divider math in ao_i3c_fclk_rate_init() and the hardcoded
master->fclk_rate assignment in amlogic_i3c_probe() fail probe on a 24 MHz
input clock or produce an inaccurate fclk_rate?

In ao_i3c_fclk_rate_init(), div_cnt =3D div64_u64(fin_freq, rate) truncates=
 via
integer division:

1. For the Always-On I3C controller, fast_clk is a9_ao_sys_i3c, which is
   gated from a9_ao_sys (muxed between the 24 MHz ao_xtal and sys). When
   fin_freq is 24 MHz, div64_u64(24000000, 25000000) evaluates to 0, causing
   ao_i3c_fclk_rate_init() to fail probe with -EINVAL.

2. When fin_freq is not an exact multiple of 25 MHz (for example, a
   166.67 MHz sys clock), div64_u64(fin_freq, rate) truncates down to 6,
   configuring I3C_AO_FCLK_DIV_CTRL for 27.78 MHz while master->fclk_rate is
   hardcoded to I3C_DEFAULT_FCLK_RATE (25 MHz). Similarly, in
   default_i3c_fclk_rate_init(), clk_set_rate() rounds to the closest rate
   supported by the clock tree rather than guaranteeing 25 MHz. When the
   actual clock rate exceeds 25 MHz, svc_i3c_master_bus_init() and
   svc_i3c_master_set_speed() compute ppbaud, odbaud, and i2cbaud assuming
   25 MHz, which can drive push-pull SCL above the 12.5 MHz MIPI I3C limit.

3. Because (div_cnt - 1) is written into the 8-bit I3C_AO_FCLK_DIV_MASK fie=
ld
   (GENMASK(7, 0)), the maximum supported divider is I3C_AO_FCLK_DIV_MASK +=
 1
   (256), so checking div_cnt > I3C_AO_FCLK_DIV_MASK is off by one.

Should ao_i3c_fclk_rate_init() round the divider up (for example with
DIV_ROUND_UP_ULL) and update master->fclk_rate to the actual divided or
queried clock rate?

> +
> +	pm_runtime_set_autosuspend_delay(dev, SVC_I3C_PM_TIMEOUT_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);

[ ... ]

> +static void amlogic_i3c_remove(struct platform_device *pdev)
> +{
> +	struct svc_i3c_master *master =3D platform_get_drvdata(pdev);
> +
> +	svc_i3c_master_remove(master);
> +
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +}

[Severity: Medium]
Does amlogic_i3c_remove() leak clock prepare and enable references on
priv->clks when the device is still active at removal time?

In amlogic_i3c_probe(), clocks are acquired via devm_clk_bulk_get_all() and
manually enabled with clk_bulk_prepare_enable(priv->num_clks, priv->clks).

During removal, svc_i3c_master_remove() calls
i3c_master_unregister()->svc_i3c_master_bus_cleanup(), which resumes the
device via pm_runtime_resume_and_get() and calls
pm_runtime_put_autosuspend().

If CONFIG_PM is disabled (where runtime PM helpers are no-ops), or if runti=
me
suspend is prevented at removal time (for example via sysfs power/control or
because svc_i3c_master_enable_hotjoin() incremented master->dev's runtime PM
usage count without a matching put in svc_i3c_master_remove()),
pm_runtime_dont_use_autosuspend() will not invoke
amlogic_i3c_runtime_suspend().

Should amlogic_i3c_remove() check !pm_runtime_status_suspended(&pdev->dev)
after pm_runtime_disable(&pdev->dev) and call clk_bulk_disable_unprepare()
and pm_runtime_set_suspended(&pdev->dev)?

> +
> +static int __maybe_unused amlogic_i3c_runtime_suspend(struct device *dev)
> +{
> +	struct svc_i3c_master *master =3D dev_get_drvdata(dev);
> +	struct amlogic_i3c_priv *priv =3D master->bsp_priv;
> +
> +	svc_i3c_save_regs(master);
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +	pinctrl_pm_select_sleep_state(dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused amlogic_i3c_runtime_resume(struct device *dev)
> +{
> +	struct svc_i3c_master *master =3D dev_get_drvdata(dev);
> +	struct amlogic_i3c_priv *priv =3D master->bsp_priv;
> +	int ret;
> +
> +	pinctrl_pm_select_default_state(dev);
> +	ret =3D clk_bulk_prepare_enable(priv->num_clks, priv->clks);
> +	if (ret)
> +		return ret;
> +
> +	svc_i3c_restore_regs(master);
> +
> +	return 0;
> +}

[Severity: Medium]
On "amlogic,i3c-ao-a9" devices, can I3C_AO_FCLK_DIV_CTRL lose its
configuration across suspend and resume?

During probe, ao_i3c_fclk_rate_init() writes I3C_AO_FCLK_DIV_EN,
I3C_AO_FCLK_EN, and the divider into master->regs + I3C_AO_FCLK_DIV_CTRL.

When suspending and resuming via amlogic_i3c_runtime_suspend() and
amlogic_i3c_runtime_resume() (which are also used for system sleep via
pm_runtime_force_suspend() and pm_runtime_force_resume()),
svc_i3c_save_regs() and svc_i3c_restore_regs() only save and restore
SVC_I3C_MCONFIG and SVC_I3C_MDYNADDR.

If the controller loses register state during suspend or hibernation,
wouldn't I3C_AO_FCLK_DIV_CTRL remain unconfigured on resume unless it is
saved and restored or re-initialized?

[ ... ]

> --=20
> 2.47.3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-a9_i3c-v1-=
0-329d819d621f@amlogic.com?part=3D3
