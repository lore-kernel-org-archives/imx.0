Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9707B3E9C11
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791450792; cv=none; b=SsHSyANokKZHCL7TQ52+kelNqpVwxc+HgudB2KBHvD45cqlC5rZQDSXSGLYKdeuLtl6V79eGeALAOE2O2Mvafteusf8ZAXSYvjWXGm2YTuvXnu/aET1pyE4EyHuDtr/qX6C/IqjKeSG40wpFhl94GiKaUYyjhYKRH5ekYn+N6Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791450792; c=relaxed/simple;
	bh=90n6qDxpXHXjopvZQpNCTSZGflXLuJsjQGljFL/Dcy0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=i4WviJtsAx3hAybxaskdFURSZdJgfCbCQPc0c0h5aT6uYnGdP4xEW2lxK0rRNonk6g61cEUHsCoyJg5Jinkzd0P1tkKkqxWMbgCncfvk0Pg7S7kEDERaL2jfF4yFVh4DpUv4vxYduLKoecLDzy9gmcaNYebmyfpUNe+dRzdaFsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLXwu2pR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLXwu2pR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63D41F000FF;
	Thu,  8 Oct 2026 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791450789;
	bh=b0mXAItSe3POnN36gR2+lkcCIlYAJHd0GGfLooMD+BE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TLXwu2pRB4JQXVXOlNcCFNEGB5smUb2XSHbilnbFrRxnpuNlH6kndlGeiTC0tTBuw
	 r9/OD9M39weJdX+nVLtZOJFHjQrmZNCNb9Imjb9kiJTv1mUDRy2IQqgaTJxJA9tVnI
	 /MEj/EuHewZ8uKYkMUpOW31YX+HjP5g3E4Zv7Irk32b/esTW/40EF6c2oAzWZPXK57
	 SgNZzthG1a/n2jWCvonOwuYhCxdaqzX+TEiYxTEty8bH8PpEKMbc5y/pugdb3G+vnh
	 i9aNbXbEtQ+vc5bUTtNth31kVYNWxSPodDiDYZ95lkzjbaF18B9SbPYkDYMPyel126
	 6v+Ob8ZZQ/MLA==
Message-ID: <sashiko-outbox-163905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] irqchip/imx-irqsteer: Let devres own the clock
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261008090231.796511-7-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-7-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:13:08 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pm: clock underflow warning on devres cleanup if pm_runtime_resu=
me_and_get() fails
--

commit 7ea8370844753a72ff02a8217ace864b04cf2175
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Let devres own the clock

This commit transitions the imx-irqsteer driver to use devm_clk_get_enabled=
()
for clock lifecycle management. It also limits runtime PM callbacks to
clk_enable() and clk_disable() since preparation is handled by devres.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index fa233de9bc2b2..15ee50f65d54c 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
[ ... ]
> @@ -273,15 +266,23 @@ static int imx_irqsteer_probe(struct platform_devic=
e *pdev)
>  	platform_set_drvdata(pdev, data);
> =20
>  	return 0;
> -out:
> -	clk_disable_unprepare(data->ipg_clk);
> -	return ret;
>  }
> =20
>  static void imx_irqsteer_remove(struct platform_device *pdev)
>  {
>  	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev);
> -	int i;
> +	int i, ret;
> +
> +	/*
> +	 * The device may be runtime-suspended here, in which case the runtime
> +	 * suspend callback has already dropped the clock enable count. Resume
> +	 * it so the devres clk_disable_unprepare(), which runs after remove(),
> +	 * finds the clock enabled and stays balanced. On success drop the
> +	 * usage count again with pm_runtime_put_noidle(): it must not trigger a
> +	 * suspend (which would re-disable the clock) and must not leak to the
> +	 * next probe of this persistent device.
> +	 */
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> =20
>  	for (i =3D 0; i < irqsteer_data->irq_count; i++) {
>  		if (!irqsteer_data->irq[i])
> @@ -294,8 +295,8 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =20
>  	irq_domain_remove(irqsteer_data->domain);
> =20
> -	if (!pm_runtime_status_suspended(&pdev->dev))
> -		clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	if (ret >=3D 0)
> +		pm_runtime_put_noidle(&pdev->dev);

[Severity: Medium]
If pm_runtime_resume_and_get() fails, the device remains suspended and its
clock remains disabled.

Since devres owns the clock via devm_clk_get_enabled(), won't devres
unconditionally call clk_disable_unprepare() after imx_irqsteer_remove()
returns?

Could this trigger a WARN(core->enable_count =3D=3D 0) in the clock framewo=
rk and
unbalance the clock state?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008090231.7965=
11-1-Zhipeng.wang_1@oss.nxp.com?part=3D6
