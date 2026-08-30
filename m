Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3432DC783
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788096280; cv=none; b=mez6kOf0IwSky4ONfvb2hb4AIWJp7X+h7nJhN+JrCUFWeSQVGIL3sWdlha+QDyrmm6QsbqJFn8l1xNStQBCjb7XYO/8If43ge8mbq1Lnu1380S2aCrprxvkx0aY37lpSmWX8UQyOdoLT+mSfXyMmDecW1qeJvdog0jTqm/MUFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788096280; c=relaxed/simple;
	bh=Qf9x5qhpMBaZv8br3grz2Fy8rBixbyeYi/dOMikqJVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nzv+Hupu0Wetz/dkIcNIzDmGRwAJr3DPQd2UVGkpK5UoOdZ5nwECw+LSdMX7XxP6kee4h7n+CmSxmAq5r0KS4dY60qvot9i9SEW4lBYb8U18vr3e5WGWZ+SbfrETD8ecEVVV3K+fayp3Ooton/rnfrm3cWz8jPJG9lOMZWcY7IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOuKh9Q5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOuKh9Q5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F4D1F000E9;
	Sun, 30 Aug 2026 13:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788096278;
	bh=OIFrnCoY9kMxX9sM6aHNvOTUtHtAgUbi5mfSgtH0OwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MOuKh9Q5LizUJfQt4lOphrnNbNDJ69cCUjf83IyDEM5oy8q9/B2FSGB+rFGKqx8qT
	 rNhdZK55FyGer3FOSSKSAKM2ji80D/XoBe5+7rNcdrx7WsTLxiYo2ArB2T8zN8SXDR
	 gtf/bHX9wYwx2plOlSjnOrhDFe283yaX87KNERzAq7t/VQowsBAj0Hnenh8tgpZsPs
	 Tqst6XDtUBPNwBEVbCYXx89IkgCzcTl7QETHORbvj9YO2XDTwEWj3XMYbgMf9m8ePC
	 4y3/9Gr1x2PKex4DN7ABRD1PpUfTH44zuyPFwuAa0PJK02qxv0F81tzhBqE4YqEP2W
	 CVHIksEIhZn3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwrng: imx-rngc: propagate clock enable errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260830131253.2718-1-pengpeng@iscas.ac.cn>
References: <20260830131253.2718-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 13:24:37 +0000
Message-Id: <20260830132438.31F4D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The IRQ handler accesses hardware registers without ensuring the d=
evice is in an active PM state, which causes synchronous external aborts (b=
us errors) if the clock is disabled.
- [High] Stale completion state from lack of reinit_completion causes inval=
id hardware state reads.
--

commit 2504f9e54a2f61f40b7332a04558df267648996f
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

hwrng: imx-rngc: propagate clock enable errors

imx_rngc_probe() reads hardware registers after enabling its clock without
checking the result, and the runtime resume callback always reports success
after the same unchecked operation. Propagate clock-enable errors before
accessing the RNG and to the runtime-PM core on resume.

> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/i=
mx-rngc.c
> index 7693328f10564..00a21d62c79c3 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -266,7 +266,9 @@ static int __init imx_rngc_probe(struct platform_devi=
ce *pdev)
>  	if (irq < 0)
>  		return irq;
> =20
> -	clk_prepare_enable(rngc->clk);
> +	ret =3D clk_prepare_enable(rngc->clk);
> +	if (ret)
> +		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but I have a question about the
clock management during probe failure.

If imx_rngc_self_test() fails later in imx_rngc_probe(), the driver manually
disables the clock:

    if (self_test) {
        ret =3D imx_rngc_self_test(rngc);
        if (ret) {
            clk_disable_unprepare(rngc->clk);
            return dev_err_probe(&pdev->dev, ret, "self test failed\n");
        }
    }

However, the IRQ is registered with devm_request_irq() just before the
self-test, so it remains active until devres unwinds.

If a spurious interrupt occurs, or if the hardware asserts an interrupt from
the failed self-test right after the clock is disabled, the IRQ handler will
execute:

drivers/char/hw_random/imx-rngc.c:imx_rngc_irq() {
    ...
    status =3D readl(rngc->base + RNGC_STATUS);
    rngc->err_reg =3D readl(rngc->base + RNGC_ERROR);
    ...
}

Could this cause a synchronous external abort due to the MMIO access without
the clock being enabled?

Should the IRQ be disabled or unregistered before disabling the clock in th=
is
error path, or should the IRQ handler verify the PM state before accessing
registers?


[Severity: High]
This is also a pre-existing issue, but does this driver have a potential ra=
ce
condition with its completion mechanism?

The driver initializes the completion once in imx_rngc_probe():

    init_completion(&rngc->rng_op_done);

It then waits on this completion in imx_rngc_init():

    ret =3D wait_for_completion_timeout(&rngc->rng_op_done,
                                      msecs_to_jiffies(RNGC_SEED_TIMEOUT));

And also in imx_rngc_self_test():

    ret =3D wait_for_completion_timeout(&rngc->rng_op_done,
                                      usecs_to_jiffies(RNGC_SELFTEST_TIMEOU=
T));

If a hardware operation times out, the function returns an error without
consuming a completion event.

If the hardware finishes the operation shortly after the timeout and trigge=
rs
the interrupt handler:

drivers/char/hw_random/imx-rngc.c:imx_rngc_irq() {
    ...
    if (status & (RNGC_STATUS_SEED_DONE | RNGC_STATUS_ST_DONE))
        complete(&rngc->rng_op_done);
    ...
}

This increments the completion counter. Because the driver never calls
reinit_completion(), could the next call to imx_rngc_init() or
imx_rngc_self_test() immediately return success from
wait_for_completion_timeout() without actually waiting for the new operation
to finish?

Could this lead to reading uninitialized or stale data, compromising the
random number generator's security?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830131253.2718=
-1-pengpeng@iscas.ac.cn?part=3D1
