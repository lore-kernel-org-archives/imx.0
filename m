Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB4E376466
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 03:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783566009; cv=none; b=g/AjoyVYrx7O/pvpqBqzuKIxQYa/MuQJ1IXQHslzveKNV8biJuQD63vTWBQHW0t+2j6T6xv8oiUKC308uqpWfL67AtrWdfEBq330gJYzu9dE6W+kz+xpb5KTdf60BsCuizQ8xdSUipk8R81XlHEYrPXOfdCcmZqoBLSrs/xJjyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783566009; c=relaxed/simple;
	bh=/fIuUzsh5mbgMTZ9pyQWpBHECPI/bV5pjrA8ljMrUIg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B0w0KNYQa7jwj9Mj1XrJNSTpNn3rKtKDb0EeigF2KUjBDNbGzozfAoEmhCDkTnyg3LspEvNuQLGLPXPlbRcm6cFcCcOYYIg2gLCQqywbDSM8M/QtislM24usgHJVRxgw/C9629NpY4NS0/6UvfYthE8GlGw/ebIdrLPstnN+LvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGw7Y4ws; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGw7Y4ws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A5A1F00A3A;
	Thu,  9 Jul 2026 03:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783566007;
	bh=30Z4YnaeodJKgHZKqo9nhpFfXw0UZguepRT1WuWGlk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGw7Y4wsAdjjsruETTqPOKIJ9rhkzhGQXk5dFMyfEXEJxJYhGJ5o13c++L9L4keJs
	 Q/rCQMjbwWJg914a9LDvl7UZ2280Fiplm2lVWhXSaEx2E9KvStblmisypTj50LMvY6
	 jk08lw5EqA77qWCdLB8fRhBishlsB6wypGg2h12EZaj9TDiM85hEEHpLsEgjAwahlk
	 ix9RMcbu/eCldAPfFr0Jd9vAS1ud3MMXtqNziVbQkhhhkCs7DMYIxYQSGlycd+rtpV
	 0BqAXipsiLn6t2lIW8O9SOVWfrCTKefC4N8M0J6rsFC25BTuYRkHjEkWV8sN8G+YdO
	 oZHwR5vtr0nqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/18] thermal/drivers/imx91: Remove redundant
 dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260709023048.599150-19-panchuang@vivo.com>
References: <20260709023048.599150-1-panchuang@vivo.com>
 <20260709023048.599150-19-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 03:00:07 +0000
Message-Id: <20260709030007.B3A5A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Driver unbind causes a fatal hardware access and double-disabl=
e of the TMU clock if the device is suspended.
- [Critical] Hardware is accessed before asynchronous PM resume completes, =
and PM usage count leaks on error.
- [Critical] Reading the temperature via sysfs when the thermal zone is dis=
abled causes a kernel crash due to unclocked hardware access.
- [High] PM runtime usage counter is permanently leaked on error paths in `=
imx91_tmu_probe()`.
- [High] The IRQ handler accesses hardware registers without verifying the =
device is runtime-active, risking a bus error.
--

--- Patch [18]: [PATCH 18/18] thermal/drivers/imx91: Remove redundant dev_e=
rr_probe() ---
commit 49fc5692bf44b8731b85be1cb5d7f3ecfbbc5b8d
Author: Pan Chuang <panchuang@vivo.com>

thermal/drivers/imx91: Remove redundant dev_err_probe()

The devm_request_threaded_irq() now automatically logs detailed error
messages on failure. This eliminates the need for driver-specific
dev_err_probe() calls that previously printed generic messages.

> diff --git a/drivers/thermal/imx91_thermal.c b/drivers/thermal/imx91_ther=
mal.c
> index 25915bb702bea..274eee3031429 100644
> --- a/drivers/thermal/imx91_thermal.c
> +++ b/drivers/thermal/imx91_thermal.c
> @@ -331,7 +331,7 @@ static int imx91_tmu_probe(struct platform_device *pd=
ev)
>  					IRQF_ONESHOT, "imx91_thermal", tmu);
> =20
>  	if (ret < 0)
> -		return dev_err_probe(dev, ret, "failed to request alarm irq\n");
> +		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does this error path permane=
ntly
leak the PM runtime usage counter?

If an error occurs during probe (e.g., in devm_thermal_of_zone_register(),
platform_get_irq(), or devm_request_threaded_irq()), the function returns
without dropping the usage counter.

The usage counter incremented by pm_runtime_get_noresume(dev) earlier in
probe is never decremented, preventing the device and its parent power
domain from entering low-power states.

> =20
>  	pm_runtime_put(dev);
> =20

[Severity: Critical]
This is a pre-existing issue, but does driver unbind cause a fatal hardware
access if the device is suspended?

drivers/thermal/imx91_thermal.c:imx91_tmu_action_remove() {
	struct imx91_tmu *tmu =3D data;

	/* disable tmu */
	imx91_tmu_enable(tmu, false);
}

During driver unbind, devres executes cleanup actions in reverse order:
pm_runtime_disable() (which does not wake the device), followed by
imx91_tmu_action_remove(), and finally clk_disable_unprepare() from
devm_clk_get_enabled().

If the device is suspended (its normal idle state), its clock is already
disabled.

Calling imx91_tmu_enable() writes to hardware registers without a clock, wh=
ich
can cause a fatal bus fault that crashes the system.

Will the devres clock cleanup also underflow the clock reference count?

[Severity: High]
This is a pre-existing issue, but does the IRQ handler access hardware
registers without verifying the device is runtime-active?

drivers/thermal/imx91_thermal.c:imx91_tmu_alarm_irq() {
	struct imx91_tmu *tmu =3D data;
	u32 val;

	val =3D readl_relaxed(tmu->base + IMX91_TMU_STAT0);
...
}

The interrupt handler reads IMX91_TMU_STAT0 unconditionally. The driver does
not disable the IRQ during imx91_tmu_runtime_suspend().

If a spurious interrupt fires, or if an interrupt is raised mid-flight
concurrently with the device entering runtime suspend, the handler will
access unclocked hardware, resulting in a fatal bus fault.

Should the handler use pm_runtime_get_if_active() to verify the device is
powered before touching registers?

[Severity: Critical]
This is a pre-existing issue, but is hardware accessed here before the
asynchronous PM resume completes?

drivers/thermal/imx91_thermal.c:imx91_tmu_change_mode() {
...
	if (mode =3D=3D THERMAL_DEVICE_ENABLED) {
		ret =3D pm_runtime_get(tmu->dev);
		if (ret < 0)
			return ret;

		writel_relaxed(IMX91_TMU_CTRL0_THR1_IE | IMX91_TMU_CTRL0_THR1_MASK,
			       tmu->base + IMX91_TMU_CTRL0 + REG_CLR);
...
}

The driver uses pm_runtime_get(), which queues an asynchronous resume and
returns 0 if the device was suspended.

The driver then immediately accesses hardware registers, racing ahead of the
actual clock enablement in imx91_tmu_runtime_resume(). Accessing unclocked
hardware causes a fatal bus fault.

Additionally, if pm_runtime_get() returns a negative error code, the driver
returns directly without dropping the usage counter, causing a PM leak.

Should pm_runtime_resume_and_get() be used instead?

[Severity: Critical]
This is a pre-existing issue, but does reading the temperature via sysfs wh=
en
the thermal zone is disabled cause a kernel crash?

drivers/thermal/imx91_thermal.c:imx91_tmu_get_temp() {
	struct imx91_tmu *tmu =3D thermal_zone_device_priv(tz);
	s16 data;

	/* DATA0 is 16bit signed number */
	data =3D readw_relaxed(tmu->base + IMX91_TMU_DATA0);
...
}

When the thermal zone is disabled via sysfs, imx91_tmu_change_mode() calls
pm_runtime_put(), suspending the device and disabling its clock.

The thermal core does not block sysfs reads of the temp attribute while the
zone is disabled.

When any user reads the temperature, imx91_tmu_get_temp() directly accesses
the IMX91_TMU_DATA0 register without ensuring the device is resumed.

Accessing unclocked registers triggers a bus fault, allowing an unprivileged
user to cause a Denial of Service.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709023048.5991=
50-1-panchuang@vivo.com?part=3D18
