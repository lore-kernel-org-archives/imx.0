Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D8735F5E7
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234514; cv=none; b=SgmX6BjvBmzRv+sGWruuEIgCXnccUB5Fx0Y6MA7Y8jciPgNQ6l++ZwkRehezPaKHrq+MKP0ZN3FDA7dU50pE1MrXrxbJMKWSCuFkcNL71y1qOXbHtNyqjL6bIDN/KTPh336ZQn3YjbS3A8G4Bz3sx/2Jlk/UroVh1sEKkDL1BJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234514; c=relaxed/simple;
	bh=ryD6LIpT8rRhdZv2fuyxpSMhPdjuWmTFlsiAA/oKStg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=snOa9E4e/2nDjG4QrhPKAffaAVQJmh1ASh+mgCAa+O1WadTS9kdkZzw0mxwDGQYrr94vI4PFVHrdPYUJUOj1r2JWJ2oNWAQ0IdvfbAISLq1CA+eJqq82gZnHnAIg4BfF4KUdeI+hqzGRvUNGE9n9jD4iuvVGXhuSCGxcHAIswuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxGWqoPJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxGWqoPJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55621F000E9;
	Tue, 28 Jul 2026 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785234511;
	bh=rVXZCecJueW2Xd69nm+9AuctY4ckLwcyM1aDiNa4PY8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QxGWqoPJsRbQRT4j0sJEQPzElczWx/ULLXdCqtnhUROhGFSxmHENxbngRyDO1bjvv
	 yN0MHA2qiKMKdLKxQuIKtNQKRhc6NdqxR8I4MKy0YYGLOIGn2KsbqN3MA4QbQc8EGI
	 GLh7QhhH/36PZ0TuIR+FtuBw8DDc9n6JAdZ5aZY45dDWsvjccgPopqEQGoDR+xcu21
	 vhv9fMSn3cMXz7GQ7YCUQG4wMcchiQ3gZrgWAoIdTeg0etlLzS4MzPcNPSYHYOzX9s
	 v0c2k3AmHJ6ZtOCNh3WLGd04sNRocS0rffjBCo6A7zUqgS2sVl06HDDeStePiTu5t9
	 AP38jY9mwlltA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] spi: spi-nxp-fspi: propagate clock reconfig
 failures in nxp_fspi_select_mem()
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260728-fspi-clock-v2-3-dbe786a4a6eb@nxp.com>
References: <20260728-fspi-clock-v2-0-dbe786a4a6eb@nxp.com>
 <20260728-fspi-clock-v2-3-dbe786a4a6eb@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 10:28:31 +0000
Message-Id: <20260728102831.B55621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Critical] Incomplete state rollback on `nxp_fspi_select_mem()` failure l=
eaves cached flags out of sync and the controller permanently stuck in Stop=
 mode.
- [High] Error handling in `nxp_fspi_select_mem()` leaves hardware clocks d=
isabled while PM runtime remains active, leading to deferred synchronous ex=
ternal aborts and unbalanced clock disables.

Pre-existing issues:
- [High] Missing `pm_runtime_put_noidle()` when `pm_runtime_get_sync()` fai=
ls, leaking the PM runtime usage counter.
- [High] The return value of `nxp_fspi_default_setup()` is completely ignor=
ed, masking initialization and clock setup failures.
- [High] The timeout error from polling the controller status is completely=
 discarded in `nxp_fspi_exec_op()`.
--

--- Patch [3]: [PATCH v2 3/3] spi: spi-nxp-fspi: propagate clock reconfig f=
ailures in nxp_fspi_select_mem() ---
commit dbeb737d74251745ba44e92f371ba23d08069151
Author: Haibo Chen <haibo.chen@nxp.com>

spi: spi-nxp-fspi: propagate clock reconfig failures in nxp_fspi_select_mem=
()

This commit modifies nxp_fspi_select_mem() to return an error code if
clk_set_rate() or clock enabling fails. It also updates nxp_fspi_exec_op()
to check this return value and bail out to prevent accessing registers while
the clock is gated off.

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -922,12 +922,19 @@ static void nxp_fspi_select_mem(struct nxp_fspi *f,=
 struct spi_device *spi,
>  	nxp_fspi_clk_disable_unprep(f);
> =20
>  	ret =3D clk_set_rate(f->clk, rate);
> -	if (ret)
> -		return;
> +	if (ret) {
> +		/*
> +		 * clk_set_rate() failed with the clocks already disabled.
> +		 * Re-enable them so the enable count matches what the caller's
> +		 * pm_runtime_put() (runtime_suspend) will drop.
> +		 */
> +		nxp_fspi_clk_prep_enable(f);
> +		return ret;

[Severity: Critical]
If clk_set_rate() fails and we return early here, does this leave the
controller permanently in stop mode?

Earlier in nxp_fspi_select_mem(), the controller is placed into stop mode:

    reg =3D fspi_readl(f, f->iobase + FSPI_MCR0);
    fspi_writel(f, reg | FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);

Since the early return bypasses the exit from stop mode at the end of the
function, the controller remains stopped. Additionally, f->flags might have
been updated with FSPI_DTR_MODE. If a subsequent SPI operation matches the
fast-path check at the beginning of nxp_fspi_select_mem(), it would bypass
reconfiguration and attempt to execute commands on a stopped controller,
resulting in a hang.

[ ... ]

> @@ -1132,7 +1141,16 @@ static int nxp_fspi_exec_op(struct spi_mem *mem, c=
onst struct spi_mem_op *op)
>  				   FSPI_STS0_ARB_IDLE, 1, POLL_TOUT, true);
>  	WARN_ON(err);
> =20
> -	nxp_fspi_select_mem(f, mem->spi, op);
> +	err =3D nxp_fspi_select_mem(f, mem->spi, op);

[Severity: High]
This is a pre-existing issue, but does assigning to err here discard the
timeout error from fspi_readl_poll_tout() immediately above?

If fspi_readl_poll_tout() times out, it returns -ETIMEDOUT to err, which is
flagged by WARN_ON(), but the function does not abort. Instead, err is
immediately overwritten by nxp_fspi_select_mem(), causing subsequent
operations to execute on a busy controller.

> +	if (err) {
> +		/*
> +		 * On failure the FlexSPI clock may be left disabled, so avoid
> +		 * any further register access (which would trigger a synchronous
> +		 * external abort) and bail out.
> +		 */
> +		pm_runtime_put_autosuspend(f->dev);

[Severity: High]
If nxp_fspi_select_mem() fails and leaves the clocks physically disabled, d=
oes
calling pm_runtime_put_autosuspend() leave the PM runtime state out of sync?

pm_runtime_put_autosuspend() maintains the RPM_ACTIVE state until the
autosuspend timer expires. If a subsequent SPI operation begins before the
timer fires, pm_runtime_get_sync() will succeed without re-enabling the
clocks. nxp_fspi_exec_op() will then attempt register access while the clock
is gated off, triggering a synchronous external abort.

If no operation occurs, the timer fires and runtime_suspend will disable
the already-gated clocks, potentially causing an enable count underflow.

> +		return err;
> +	}
> =20
>  	nxp_fspi_prepare_lut(f, op);

[ ... ]

For pre-existing issues not directly modified by this patch, there are a few
other observations in this file:

[Severity: High]
This is a pre-existing issue, but does nxp_fspi_exec_op() leak the PM
runtime usage counter if pm_runtime_get_sync() fails?

drivers/spi/spi-nxp-fspi.c:nxp_fspi_exec_op() {
    ...
    err =3D pm_runtime_get_sync(f->dev);
    if (err < 0) {
        dev_err(f->dev, "Failed to enable clock %d\n", __LINE__);
        return err;
    }
    ...
}

If pm_runtime_get_sync() returns a negative error code, the usage counter
remains incremented. Returning immediately without calling
pm_runtime_put_noidle() permanently prevents the device from runtime
suspending again.

[Severity: High]
This is a pre-existing issue, but are initialization and clock setup failur=
es
being masked during probe and resume?

drivers/spi/spi-nxp-fspi.c:nxp_fspi_probe() {
    ...
    nxp_fspi_default_setup(f);
    ...
}

The return value of nxp_fspi_default_setup() is completely ignored in both
nxp_fspi_probe() and nxp_fspi_runtime_resume(). If clk_set_rate() or clock
enabling fails inside setup, the driver proceeds as if the hardware is
fully initialized, which could lead to silent failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-fspi-clock=
-v2-0-dbe786a4a6eb@nxp.com?part=3D3
