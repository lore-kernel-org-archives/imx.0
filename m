Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0691FDE31
	for <imx@lists.linux.dev>; Mon, 25 May 2026 04:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779683359; cv=none; b=Ht3mdf5K4e8UTVEniOfIHrnJjG30Wq2ACGpbux8zVVU2i+zoM8XbARLP4zO/JkrS2uUfC81axD+U7Mtik/Dx9cvLi1+vMOdwLcRDjjWakCfishoRHc6XJoMcu+48w/PuIKoTk12QCvIYAEncEwK2TBYz+K8VmYVSY0v9AN9Arn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779683359; c=relaxed/simple;
	bh=mWwRhgkVbgmoXT1sBHnwT/WNMmOOSpAw7P8GwkeJ7Vg=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=evbtJN1xtuxdjjYgjXd4JzhG4CUJQ9VDNRz+3VsN8ynH+uE1P4QWJAXQ1NTSh49zxyI/Z1wtNGfJdRzWuu9Col2Qv6c0k78CSJFH0t/WoPeQax4J35OozePOnfOs2zPoK/uO5kd2aiG+0wHI1j02gQ2i5WhE52h+XYQW4IjUPsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Di2UPZ+Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Di2UPZ+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B3F1F000E9;
	Mon, 25 May 2026 04:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779683357;
	bh=erwTOJ9ClVZ2ZUyv//T4Rhn4dbAM8ps75ECVXzSuQeM=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=Di2UPZ+YL1Xa3pEa+MUy6RyWTXKTyeAEyQgpceQl5dskF411UYKkPEAtnK51v/qj4
	 lOaIJOHXIEVc2ahywK88Uq3sxpgG3lZfLcox2k4oVLWts0P3ENwColBa9C9+UG0uwT
	 0rDVrK4GGrm94/0F6YxsVNdd2fKRLR3jSNSURKYfOQZwbPZioGFqGKgIfiXGbtoQlG
	 NCtNxZtzjUePTBiyDgInGrXzPMwjvPg8ZGyr1Jx80r6zveNWMZi4laIUJ8zUz7ox0V
	 5LriN+a708+vZD404e0galizH6UHXAkgaOclXzSYH7cS0Y2LbGFG68lcvTC0zvvACA
	 /m8edffIt42VQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] i2c: imx-lpi2c: mark I2C adapter when hardware is
 powered down
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525031450.3183421-1-carlos.song@oss.nxp.com>
References: <20260525031450.3183421-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 04:29:16 +0000
Message-Id: <20260525042917.95B3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Dangling pointer to `i2c_client` on target registration failur=
e leading to Use-After-Free.
- [High] Unprotected hardware access in ISR leading to system crash.
--

commit 43cbdbf57da49883728164e0b8b6eb17dc962844
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: mark I2C adapter when hardware is powered down

This commit marks the I2C adapter as suspended during noirq suspend and blo=
cks
new transfers until resume. This prevents workqueues from triggering I2C
transfers while hardware resources like clocks and pinctrl are unavailable.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index a01c236964819..01ee38131ef2e 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -1635,7 +1635,18 @@ static int __maybe_unused lpi2c_suspend_noirq(stru=
ct device *dev)
>  {
> -	return pm_runtime_force_suspend(dev);
> +	struct lpi2c_imx_struct *lpi2c_imx =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	i2c_mark_adapter_suspended(&lpi2c_imx->adapter);
> +
> +	ret =3D pm_runtime_force_suspend(dev);

[Severity: High]
This is a pre-existing issue, but can an interrupt fire after we suspend he=
re?

Because the IRQ is requested with IRQF_NO_SUSPEND, it isn't automatically
disabled during the noirq phase of system suspend. On platforms like imx7ulp
where the driver doesn't free the IRQ in its runtime suspend callback,
calling pm_runtime_force_suspend() disables the device clocks.

If the interrupt line is asserted while the clocks are disabled, will
lpi2c_imx_isr() attempt to read from unclocked registers and cause a bus
fault?

Should the ISR verify the runtime PM state using pm_runtime_get_if_active()
before accessing hardware registers?

> +	if (ret) {
> +		i2c_mark_adapter_resumed(&lpi2c_imx->adapter);
> +		return ret;
> +	}
> +
> +	return 0;
>  }

[ ... ]

>  static int __maybe_unused lpi2c_resume_noirq(struct device *dev)
> @@ -1655,6 +1666,8 @@ static int __maybe_unused lpi2c_resume_noirq(struct=
 device *dev)
>  	if (lpi2c_imx->target)
>  		lpi2c_imx_target_init(lpi2c_imx);

[Severity: Critical]
This is a pre-existing issue, but does this dereference a dangling pointer
if target registration previously failed?

If lpi2c_imx_register_target() fails during pm_runtime_resume_and_get(), it
returns an error early without clearing lpi2c_imx->target. The I2C core
handles this failure by unregistering and freeing the client structure.

When the system resumes, will lpi2c_resume_noirq() check this now-dangling
lpi2c_imx->target pointer, and will lpi2c_imx_target_init() then
dereference it when accessing lpi2c_imx->target->addr, resulting in
a use-after-free?

> +	i2c_mark_adapter_resumed(&lpi2c_imx->adapter);
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525031450.3183=
421-1-carlos.song@oss.nxp.com?part=3D1
