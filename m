Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5738D3630BC
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 02:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783565754; cv=none; b=edcpQ7ge4PsIInLctmIkM7sID/x7/D2eKt6641VPcG6xD/CdZ4UgCHfaxLCfvQUBjuOJhx0t/M+PuJaIJjczWTtR2DxSWLrOW3E6T7jTWZPnilFa+1v62s4CdPKqVWg7r5sGdAdDy1UTDS0QO7oO6GkXAf+p4I7In13wg2/MdY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783565754; c=relaxed/simple;
	bh=7LifIfnsBdzs6MBSu9hLJl0GF0AY9mSd0kX/PR+Qwbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UaUZ10PXjOuUbLuz/An6TaC3utyg7mvNPsqTwr+lpS8p+OPGSs7nbO6NO1la89Q8bEvRx2KqlSjDtvGdMXsNCbSKRq83d80xApNb5WXPAbzYFIyN5FLKIFhe3FOi+RoL5jDobYHD+aZ83mIP+L0bDcATGBWw9rdc7IkDLZGMtOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K41FhYau; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K41FhYau"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046E31F000E9;
	Thu,  9 Jul 2026 02:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783565753;
	bh=/ALbJdAnVAkyAdwUS62BIVQfC66m0/+9ICe9CgjlMoM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K41FhYauMLOdh3akiZTIfprSStaZ34L3VngpTLpkEs/RKdZv15ULBiHRUfGevPAe3
	 DjmvY+I2YTwLo/bCXqNGS5hg98/2vcea57eyQl9tgMk+8T1ans+ivUs4giE+tDaQwB
	 Tk/SZInuRoTe+fE7kaayJ8TM3gVIld1qibFAY7Y+ie21o2rfHh5+Nc7YFbIBNF0z9p
	 CCwaQz4EQa4c7LXTe0AC2i00L6O2Qyah7qQAeLgW9fxwpe6E0uLAgUOXYyg7kOqXsa
	 Uplc5EJXQRgOQDZUeJw6+t4Q1U7Mb+dNhjjDxaVQDcsggswbwJMvWGfxplOu2wB3aG
	 xrzRlsW4MmNrg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/18] thermal/drivers/imx: Remove redundant dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260709023048.599150-6-panchuang@vivo.com>
References: <20260709023048.599150-1-panchuang@vivo.com>
 <20260709023048.599150-6-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 02:55:52 +0000
Message-Id: <20260709025553.046E31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The thermal zone device `data->tz` is dereferenced after it is fre=
ed if the temperature alarm interrupt fires during module removal.
--

--- Patch [5]: [PATCH 05/18] thermal/drivers/imx: Remove redundant dev_err(=
) ---
commit 27d7703d9347749240647995387a1e21fab7887b
Author: Pan Chuang <panchuang@vivo.com>

thermal/drivers/imx: Remove redundant dev_err()
   =20
The devm_request_threaded_irq() now automatically logs detailed error
messages on failure. This eliminates the need for driver-specific
dev_err() calls that previously printed generic messages.

> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 5aaacbc534786..416d89c6287ad 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -732,10 +732,8 @@ static int imx_thermal_probe(struct platform_device =
*pdev)
>  	ret =3D devm_request_threaded_irq(dev, data->irq,
>  			imx_thermal_alarm_irq, imx_thermal_alarm_irq_thread,
>  			0, "imx_thermal", data);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to request alarm irq: %d\n", ret);
> +	if (ret < 0)
>  		goto thermal_zone_unregister;

[Severity: High]
This is a pre-existing issue, but could this lead to a use-after-free if the
temperature alarm interrupt fires during module removal?

Because the alarm IRQ is requested using devm_request_threaded_irq(), its
lifetime is tied to the device unbind phase via devres, meaning it is only
freed after the remove function finishes. However, in imx_thermal_remove(),
the thermal zone device is unregistered and freed:

drivers/thermal/imx_thermal.c:imx_thermal_remove() {
	...
	thermal_zone_device_unregister(data->tz);
	...
}

Since the devm resources are cleaned up only after remove() returns, the IRQ
remains active while and after data->tz is freed. If the interrupt fires
during this window, wouldn't the threaded handler dereference the freed
data->tz?

drivers/thermal/imx_thermal.c:imx_thermal_alarm_irq_thread() {
	...
	thermal_zone_device_update(data->tz, THERMAL_EVENT_UNSPECIFIED);
	...
}

> -	}
> =20
>  	pm_runtime_put(data->dev);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709023048.5991=
50-1-panchuang@vivo.com?part=3D5
