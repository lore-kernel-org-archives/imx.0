Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901098;
	b=LqbfOCgjiZl3x+lqn69I6QQ/OBsdg0IepmHjMhVP3ratJvcFZ3gy7/QIE92aDWKl8YIc
	 hYYf46i1jB8QwM+g+Hf2CNbrcBd0JmvQNtAVvQkocEywV0L8r5AfosaLXyMYSKOsoA5XM
	 DzgTg8K/3E8vMEW4ineT7JibVNyZ1EZzQeJ3K49Wm2AnZ61I75HQ88/vLXZR0wD9SFCF0
	 QeRgX3UFOfL2x9BQLtC0ImBaGg0cE+Vb4PSbnKqk8s939B0rTmR4hnMJdbhq5Jpae8RfZ
	 SP2xyUynFiXYPi4UhU+RhcsRH0pRpyKfDLRlplGO+sOCxJY2w0PsJRD5Rnyb+vRXmBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901098;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DRLY/XEdn+bTO8kt7HS98J3lRMl4u8FkkC7S4KIzV5Y=;
	b=5hK68pD2/3MluxEyd6EKaB6Z3K9A5MW+5Q+T37AmcGjCyLpvufVT1N14Ry36wPRsrV2c
	 ljPJIvIEvp22LMNbFnL0OYh8hmxBbCdpJ23qPz8LlKJm3nQDOI0Lko7b3dy4QbXOHSfPR
	 EQ03K3qKzViZZRtPs4K2EstUX32Yt1aiPAHzHujFcco3/YD8Ax0ZHI2MIx84Z9uqCeF03
	 Aj1UJN4zoooDNUxOGJ2bfSB9tKlfDKk0IUpL6ySTmRxwihKEGvG1pnCTPchNRW8deeK2A
	 uTHCHJ2Zww/dJtGR1Vk9ZtUalyuKb40jdxe/FrNFJ1Zl1FtO0d1B2KsNt9x5CsUl52A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kxeNacyI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CEA606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kxeNacyI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F39C1F000C4;
	Tue, 17 Nov 2026 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794901097;
	bh=DRLY/XEdn+bTO8kt7HS98J3lRMl4u8FkkC7S4KIzV5Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kxeNacyImU3NJmGZMbjjuOSydzX0ntY7qDcwjeVt0iSEcO3eB3kxoQWVvolbm3bha
	 pFZtaK0LwB7oMZDEUNKcpEqB9n136hic8CoIK1rY6dQbwbzLc9CmM+1b+PJYmsDncj
	 J9mrCmNn7lCCWhcInoU2uwW7mYs/uXx77ZYSmq7aKK/uh0VGFRVBss/49ZFqhhKHA3
	 ew3YefMsCo39r4euhDsl578neOLrt6savyzSMzSvvGRn0xsoo8nL8wyQVIkoRi537x
	 Q+ENNsonI4XN1UhZQdkYd+nY8vm6JpYPjYc8TOE+nZm+hdgncetK+sJFYXHAhOks3B
	 HtU3AzjJJTbXg==
Message-ID: <sashiko-outbox-218364@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] irqchip/imx-intmux: Use
 devm_pm_runtime_set_active_enabled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peng Fan" <peng.fan@linux.dev>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261117-imx-intmux-v1-8-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
 <20261117-imx-intmux-v1-8-189e7e0ad98d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:38:16 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] irqchip/imx-intmux: unexpected runtime_suspend() in devres
  teardown
- [High] irqchip/imx-intmux: unexpected runtime suspend in
  pm_runtime_disable_action()
--

commit 2bb337f25f51814af4aab296ab2a9e9b51b12962
Author: Peng Fan <peng.fan@nxp.com>

irqchip/imx-intmux: Use devm_pm_runtime_set_active_enabled()

This commit replaces manual pm_runtime_set_active(), pm_runtime_enable(),
pm_runtime_disable(), and pm_runtime_set_suspended() calls with
devm_pm_runtime_set_active_enabled().

> diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-i=
ntmux.c
> index 1f6e5d9c797aa..770656ef10ece 100644
> --- a/drivers/irqchip/irq-imx-intmux.c
> +++ b/drivers/irqchip/irq-imx-intmux.c
> @@ -234,9 +234,11 @@ static int imx_intmux_probe(struct platform_device *=
pdev)
>  	data->channum =3D channum;
>  	raw_spin_lock_init(&data->lock);
> =20
> +	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
>  	pm_runtime_get_noresume(&pdev->dev);
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> =20
>  	for (i =3D 0; i < channum; i++) {
>  		data->irqchip_data[i].chanidx =3D i;
> @@ -286,7 +288,6 @@ static int imx_intmux_probe(struct platform_device *p=
dev)
>  							     hwirq));
>  		irq_dispose_mapping(data->irqchip_data[i].irq);
>  	}
> -	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_put_noidle(&pdev->dev);
>  	return ret;
>  }

[Severity: High]
Can removing pm_runtime_disable() from the probe error path cause a NULL
pointer dereference in imx_intmux_runtime_suspend() when channel setup
fails?

If irq_of_parse_and_map() or devm_irq_domain_create_linear() fails,
platform_set_drvdata() has not been called yet, and pm_runtime_put_noidle()
drops usage_count to 0 while runtime PM is still enabled and RPM_ACTIVE.
During devres teardown, pm_runtime_disable_action() calls
pm_runtime_dont_use_autosuspend() before pm_runtime_disable(), which runs
update_autosuspend() -> rpm_idle() -> rpm_suspend() synchronously.
imx_intmux_runtime_suspend() then reads a NULL dev_get_drvdata(dev) and
dereferences data->channum.

> @@ -312,11 +313,8 @@ static void imx_intmux_remove(struct platform_device=
 *pdev)
>  		irq_dispose_mapping(data->irqchip_data[i].irq);
>  	}
> =20
> -	pm_runtime_disable(&pdev->dev);
> -	if (ret >=3D 0) {
> +	if (ret >=3D 0)
>  		pm_runtime_put_noidle(&pdev->dev);
> -		pm_runtime_set_suspended(&pdev->dev);
> -	}
>  }

[Severity: High]
Does dropping pm_runtime_disable() in imx_intmux_remove() cause
data->ipg_clk to be disabled and unprepared twice on unbind?

imx_intmux_remove() resumes the device (enabling data->ipg_clk) and then
calls pm_runtime_put_noidle(), leaving usage_count at 0 while runtime PM is
enabled and RPM_ACTIVE.  When devres teardown runs
pm_runtime_disable_action(), pm_runtime_dont_use_autosuspend() synchronously
suspends the device via imx_intmux_runtime_suspend(), which calls
clk_disable_unprepare(data->ipg_clk) before the devm_clk_get_enabled()
release action disables and unprepares data->ipg_clk a second time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-imx-intmux=
-v1-0-189e7e0ad98d@nxp.com?part=3D8
