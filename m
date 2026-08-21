Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073A34734E4
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308004; cv=none; b=IWruMBS2upOChNdJbT9GaTXql7YfzTGX8dOkzHi4lt6J7XmJ/DbPCymvZ2EipVCjGEdkmBVYBORKnKWvXy1FkWws0RtC8LqNkVXqJEWrYa1KBwBEGSnT1nm//gc6u71kDgOPVRv7XtaOyj9Ni/l3Tj/igRQjS9anOlFFWvOvuV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308004; c=relaxed/simple;
	bh=wIXj2SuP6uoNstqLC7DT6nEBeawfgv6RTEs8p4N5cOM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d+sjLvNSv9q8KMnBc5Ma9K1t3pZF4PgZDUjEe4rnTgcHupiv6ExS3a4x8LDFY9cIaxKMXbUpKgKEobnMujZJ0r55twqBBWbUYqEJc+TZSWtJZAEsFwwfTWBqmmTV6tK+zdVEUh+1Xfi+wz27HGyD8B5Nm/iXXhjZHM2/jRHuErg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QN/mPWBB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QN/mPWBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BD041F00A3D;
	Fri, 21 Aug 2026 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307995;
	bh=jTsjWGnd61M/jtlx2pBn9JVpaWrd7kBrJyBEsgbRfMc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QN/mPWBBPcMfkWW57rRxu0o8lyjo5aWgJ0Hp6791IxQPpknguBGyveV/0ZP8HI+vj
	 HTRjbjtEgFssrG6AGoN3TiAPcQrEPGs9UZgIdsNLpuiOQQSbIRjcGkrbKRlH7+3E/U
	 gzNKGXuozdgNX5Zd2Zf2pl3qbN2NO3VDSrTEqxrsT7sbNTiXX3TKINmZRrQV5SXSgs
	 vra/9RzNGmDaP9EWgszmtafuM0L+li1JI0GCQyrm2wZa6cHfjhSp3Wu648g0k+bDx2
	 9xm3UEh3t2UtlIiuOb5k/UHsmgBo5432OWGbv+oPoBHIYmi1xm3rjGlPikSjUuVGAs
	 +t9UEmVcfBthA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/9] irqchip/imx-irqsteer: Let devres own the clock
 and runtime PM
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260821101039.4037925-7-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
 <20260821101039.4037925-7-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:26:34 +0000
Message-Id: <20260821102635.4BD041F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing pm_runtime_put_noidle() in remove() causes a usage counter=
 leak, permanently breaking autosuspend upon driver rebind.
- [Medium] Ignoring the return value of pm_runtime_resume_and_get() in remo=
ve() can lead to a clock enable count underflow during devres cleanup.
--

--- Patch [6]: [PATCH v5 6/9] irqchip/imx-irqsteer: Let devres own the cloc=
k and runtime PM ---
commit 57b65e0ae0ccb7952253c0bbf59f0e1f037ea934
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Let devres own the clock and runtime PM

In preparation for making the driver unbindable/reloadable, let the
driver core own the clock and runtime PM lifetime so that the probe()
error path and remove() do not have to hand-balance them.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index b63bf957ab884..c2f58787f9a86 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c

[ ... ]

> @@ -289,6 +292,14 @@ static void imx_irqsteer_remove(struct platform_devi=
ce *pdev)
>  	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev);
>  	int i;
> =20
> +	/*
> +	 * The device may be runtime-suspended here, in which case the
> +	 * runtime suspend callback has already dropped the clock enable
> +	 * count. Resume it so the devres clk_disable_unprepare(), which
> +	 * runs after remove(), finds the clock enabled and stays balanced.
> +	 */
> +	pm_runtime_resume_and_get(&pdev->dev);

[Severity: Medium]
Is it safe to ignore the return value of pm_runtime_resume_and_get() here?

If it fails (for example, if clk_enable() fails in imx_irqsteer_resume()),=
=20
the device will remain suspended and the clock disabled. When devres=20
subsequently runs clk_disable_unprepare() during cleanup, wouldn't this=20
cause a clock enable count underflow?

[Severity: High]
Does this leak the runtime PM usage counter on driver unbind?

pm_runtime_resume_and_get() increments dev->power.usage_count on success,=20
but there doesn't appear to be a matching pm_runtime_put_noidle() or simila=
r=20
put call before imx_irqsteer_remove() returns.

Since the devres action registered by devm_pm_runtime_set_active_enabled()=
=20
only calls pm_runtime_disable() (which does not drop the usage count),=20
wouldn't this permanently break autosuspend when the driver is rebound?

> +
>  	for (i =3D 0; i < irqsteer_data->irq_count; i++) {
>  		if (!irqsteer_data->irq[i])
>  			break;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821101039.4037=
925-1-Zhipeng.wang_1@oss.nxp.com?part=3D6
