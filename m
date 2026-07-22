Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614848C3E2
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710812; cv=none; b=IA214LiWlXHkeji3sOzzdo+McwdaQiEsOlAtBT4Z3QgQZGJO+qxwmcW3smZZn/X8SSNfi4bpnj+I3kFdUb41LFY+Xja8cdypr6EyHj5L76v+Ms8+WcEtOt22FridDy8pfHF0EQldhf+j0mcrZ8XZjvOZC1Ru94/wmjMCb0yXSqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710812; c=relaxed/simple;
	bh=ZIl6ncBqbUrWujLXqP0hdbCr9CFAGTZM8uLxwa4vsB4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nLpcTA1Qo6JxAGTBOGjWVx8nD7oOp6Y1tsUrRV5ObItli25JeyG5IkADRLw5rrGR8wZVMwUhRxfeRGyLyFXermRwyoq4zeyaIHutulGlWErXjY5dVfbbqSBUC9IpIT4v5Yzlje56UEAtVvjcmZD1fI1Nl3XEwSaWy4NtV3DPWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwT0ltC/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwT0ltC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E021F000E9;
	Wed, 22 Jul 2026 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784710811;
	bh=GEjbdz2FGEBZx1ZDquUX9pefc2row75jYcGj71SXF1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WwT0ltC/vWtIAZP0ecXksO5pcLgLnx5wps+RjEwyaQ+lx4en1S0IeAWh2r/wfp7Ur
	 TL3ix2kD/iYYSqrt43haQB6rBkI/GgVrPlx+aECvQIKskv/0Vs2NidvUyM50+IVsHg
	 SaZRvoOL4IPbSTvG0YRtWY40y6+gSpm1LCv7Dieu/oPgZixcFS2+eoNHx5KrGk6VaI
	 BTfIAbnz5GR2QeapygFxNF9M+OloQanOA6f65Uw8G3GRsHoS3geLv8Mjt+SAkh7wk8
	 8K0x9oWXMdipl3SYfsZP4iTla7VncddEngZOey8QX5BfldF0PpessHAgnFW6HOb4Zp
	 GHoGlmL6hRQLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] thermal/drivers/imx: Disable clock on runtime resume
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Can Peng" <pengcan@kylinos.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260722084909.463437-1-pengcan@kylinos.cn>
References: <20260722084909.463437-1-pengcan@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 09:00:10 +0000
Message-Id: <20260722090011.11E021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing pm_runtime_put() in imx_get_temp() error path.
- [High] Unbalanced pm_runtime_put_noidle() in probe error path and remove =
causes usage counter underflow.
- [High] Potential Use-After-Free of data->tz in the thermal alarm IRQ hand=
ler during device removal.
- [High] Missing thermal_zone_device_unregister() causes a resource leak wh=
en pm_runtime_resume_and_get() fails during probe.
--

--- Patch [1]: [PATCH] thermal/drivers/imx: Disable clock on runtime resume=
 failure ---
commit 623893dc8c9eeba8997b3f891585bf7c9155faa2
Author: Can Peng <pengcan@kylinos.cn>
Date:   Wed Jul 22 08:49:09 2026 +0000

    thermal/drivers/imx: Disable clock on runtime resume failure
   =20
    imx_thermal_runtime_resume() enables the thermal clock before
    powering up the sensor and enabling measurements.
   =20
    If either regmap_write() fails, the function returns with the clock
    still enabled. This leaves the clock enable count unbalanced after a
    failed runtime resume.
   =20
    Disable the clock on those failure paths before returning the error.

> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 5aaacbc534786..b0e88b6a9352a 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -832,12 +832,12 @@ static int imx_thermal_runtime_resume(struct device=
 *dev)

[ ... ]

>  	/*
>  	 * According to the temp sensor designers, it may require up to ~17us
> @@ -846,6 +846,11 @@ static int imx_thermal_runtime_resume(struct device =
*dev)
>  	usleep_range(20, 50);
> =20
>  	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(data->thermal_clk);
> +
> +	return ret;
>  }

[Severity: High]
This isn't a bug introduced by this patch, but doesn't this error path in
imx_get_temp() leak the PM usage counter permanently?

drivers/thermal/imx_thermal.c:imx_get_temp() {
    ...
	ret =3D pm_runtime_resume_and_get(data->dev);
	if (ret < 0)
		return ret;

	regmap_read(map, soc_data->temp_data, &val);

	if ((val & soc_data->temp_valid_mask) =3D=3D 0)
		return -EAGAIN;
    ...
}

If pm_runtime_resume_and_get() succeeds, but the hardware returns an
invalid temperature mask, the function returns directly without calling
pm_runtime_put(). Does this prevent the device from ever entering runtime
suspend?

[Severity: High]
This is a pre-existing issue, but does pm_runtime_put_noidle() cause a
usage counter underflow when pm_runtime_resume_and_get() fails during probe?

drivers/thermal/imx_thermal.c:imx_thermal_probe() {
    ...
	ret =3D pm_runtime_resume_and_get(data->dev);
	if (ret < 0)
		goto disable_runtime_pm;
    ...
disable_runtime_pm:
	pm_runtime_put_noidle(data->dev);
    ...
}

Since pm_runtime_resume_and_get() already decrements the usage counter
internally on failure, doesn't calling pm_runtime_put_noidle() double-drop
the count?

A similar issue appears to be present in imx_thermal_remove():

drivers/thermal/imx_thermal.c:imx_thermal_remove() {
	struct imx_thermal_data *data =3D platform_get_drvdata(pdev);

	pm_runtime_put_noidle(data->dev);
	pm_runtime_disable(data->dev);
    ...
}

Does unconditionally dropping the usage count here leave the hardware
active without being synchronously suspended before removal?

[Severity: High]
This is a pre-existing issue, but is there a potential use-after-free
involving data->tz during device removal?

drivers/thermal/imx_thermal.c:imx_thermal_remove() {
    ...
	thermal_zone_device_unregister(data->tz);
	imx_thermal_unregister_legacy_cooling(data);
}

The alarm interrupt was requested using devm_request_threaded_irq() in prob=
e,
so it remains active until after imx_thermal_remove() completes. If the
interrupt fires during this window, wouldn't imx_thermal_alarm_irq_thread()
dereference the freed data->tz?

[Severity: High]
This isn't a bug introduced by this patch, but is there a resource leak
if pm_runtime_resume_and_get() fails during probe?

drivers/thermal/imx_thermal.c:imx_thermal_probe() {
    ...
	ret =3D pm_runtime_resume_and_get(data->dev);
	if (ret < 0)
		goto disable_runtime_pm;
    ...
thermal_zone_unregister:
	thermal_zone_device_unregister(data->tz);
disable_runtime_pm:
	pm_runtime_put_noidle(data->dev);
	pm_runtime_disable(data->dev);
    ...
}

By jumping to disable_runtime_pm, the code skips the thermal_zone_unregister
label. Does this leave the thermal zone device registered and leak the
subsystem structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722084909.4634=
37-1-pengcan@kylinos.cn?part=3D1
