Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07843FB067
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 12:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786192583; cv=none; b=Vx2jGBGJJg3glUXZ8CIA5QZ+AqR7ILq+/tee56/uFyfx+ZWbOwvFgxlgKv/aL8oQrqKdLxbdhu+jGDSgGqzX1ZgfRrQuWH5hZqsN2DA/rv0U0mBcQ6mIvUKdieKe5D0ZkZxI2X5LmeBHRxYoLaofrBVD4jmD2dQAFufQPZceDto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786192583; c=relaxed/simple;
	bh=ZO2Lk8qticPBYODBCVNAP0g3pMR6bJEhWB7/+kspiYk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jmCzv5kFuTaj7E+8E04sHv6HWl1OLC5WtRvRzToUV/tpNvSHCbsaUUNcqBMCEO5fF+ROUgiJwJAf5iBqX3e4wvSV1aDq5BuScO8+7GzaCE/K2E3hq05nXq1MzszDXZRd4LUJerAwN5bpOOvUaNtKi4Fv/ktWhraC7Z03F44oQJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7O44FPJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7O44FPJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27FE1F000E9;
	Sat,  8 Aug 2026 12:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786192572;
	bh=XqzHzxTClGx0Q5x9+gP9AH6+y77X+N4qlUwY+fX+ZNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h7O44FPJzvJX3BmI+IjIK9hnHXyPyXMNGcA+l++76j+staiMxK8IilzodJJ6K8+iV
	 iIUmsxwZfKs+4Zlb6j7JuE4jA2GcnlADT5SQnQqJ5u/6+xFwtv3Wan4smp4I4NNwyM
	 HPdIRn+0+RrnF+qVhHADSDs9yVNUtTCGfwCaq+gfiy9VF0hPykGUwQjAVQBnRLcCDN
	 6NYmOtzbtNyg3D4EURQUL2sNJFUjgB1gWM0oUk/8KL1uFT0rWqOvpFyid0yiguHf40
	 7sGmocOZTadVbr3XTQwn+ZB24lAGuxm9x2qdKeVEctpU359MhPf8SRzBHNXEZCLUkb
	 JQpMrmQ8I0aQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/imx: dcss: fix autosuspend cleanup during teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org
In-Reply-To: <20260808122354.2825209-1-lgs201920130244@gmail.com>
References: <20260808122354.2825209-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 12:36:11 +0000
Message-Id: <20260808123611.D27FE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Double Hardware Suspend / Clock Disable caused by synchronous rpm_=
idle.

Pre-existing issues:
- [High] TOCTOU Race Condition during driver teardown.
- [High] Hardware register access while runtime suspended leads to system c=
rash.
--

--- Patch [1]: [PATCH] drm/imx: dcss: fix autosuspend cleanup during teardo=
wn ---
commit 57aed202fd27fa66b9bc5448a0fe4df074c91e5c
Author: Guangshuo Li <lgs201920130244@gmail.com>

drm/imx: dcss: fix autosuspend cleanup during teardown

This patch adds a missing pm_runtime_dont_use_autosuspend() call during
driver teardown before disabling runtime PM. This ensures the usage count
remains balanced if the autosuspend delay is set to a negative value while
enabled.

> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dc=
ss/dcss-dev.c
> index 7fd0c4c14205d..51398852cdc2b 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -234,6 +234,7 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
>  {
>  	if (!pm_runtime_suspended(dcss->dev)) {

[Severity: High]
This isn't a bug introduced by this patch, but does this check have a race
condition with the PM worker?

If the autosuspend timer expires exactly when dcss_dev_destroy() is called,
is it possible for the PM worker thread to execute dcss_dev_runtime_suspend=
()
concurrently with this block? Both paths would call dcss_ctxld_suspend()
and dcss_clocks_disable() at the same time.

Should pm_runtime_disable() be called before this check to wait for pending
transitions and prevent new ones?

>  		dcss_ctxld_suspend(dcss->ctxld);
>  		dcss_clocks_disable(dcss);
>  	}
> =20
>  	of_node_put(dcss->of_port);
> =20
> +	pm_runtime_dont_use_autosuspend(dcss->dev);

[Severity: High]
Could this newly added call trigger a double hardware suspend and clock
disable?

If the device is active during teardown (e.g., the autosuspend delay hasn't
expired), the code above manually executes dcss_ctxld_suspend() and
dcss_clocks_disable(). When pm_runtime_dont_use_autosuspend() is then
called, it drops the autosuspend flag and synchronously calls rpm_idle().

Because the usage count is 0 and the device is still marked RPM_ACTIVE,
this will synchronously invoke the driver's runtime suspend callback:

dcss_dev_destroy()
  pm_runtime_dont_use_autosuspend()
    rpm_idle()
      dcss_dev_runtime_suspend()
        dcss_clocks_disable()

This causes a second clock disable and suspend. Should this call be moved
after pm_runtime_disable(), where disable_depth > 0 would safely prevent the
PM callbacks from executing?

>  	pm_runtime_disable(dcss->dev);
> =20
>  	dcss_submodules_stop(dcss);

[Severity: High]
This is a pre-existing issue, but can this call cause a bus fault if the
device was already runtime suspended?

If dcss_dev_destroy() is called when the device is runtime suspended,
the manual dcss_clocks_disable() above is skipped. dcss_submodules_stop()
is then unconditionally called, which executes submodule exit functions lik=
e:

dcss_submodules_stop()
  dcss_scaler_exit()
    dcss_writel(0, ch->base_reg + DCSS_SCALER_CTRL);

Since dcss_submodules_stop() only calls dcss_clocks_enable() but doesn't
power on the PM domain, doesn't writing to these MMIO registers cause a
synchronous external abort?

> =20
>  	dcss_clks_release(dcss);
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808122354.2825=
209-1-lgs201920130244@gmail.com?part=3D1
