Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E433D4E9
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 03:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784257204; cv=none; b=ERJkMnO3ndZ59yi2i3/7NlsEkx7JllP1CkeZJNhpkcGobRcbB444vDaISyQbl8NVY2ZO7kYC1JxSx+6kUcOGTQxsL7BSRkadustLEBHqYgYNTnZj2//787/y3v+Abe0NynvcqJwqUd92AulmhvAGkF4DwdH2PePQ5ZfNSM97YdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784257204; c=relaxed/simple;
	bh=XB+6zRIlXSDtIUYSlZ18JnfhRNHQtab6s6o8D1mLlFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HemefXVQyzaSo9m8Pr2hB8IVjzY3IPQTjbtYELuIBb649JChxFvQ5145EIWZUqB+OAb3wPQz05LmUFSiDVJg5pHVdT1OGLD60ahtik4bDU66jVd5RQNUrKIrADJi7IV1vi0iG20sXNTJFOs+8iNdJQ4sEWgS5yOx8rUxnV0GCVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDd8VrR/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDd8VrR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3141F1F000E9;
	Fri, 17 Jul 2026 03:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784257202;
	bh=GEeUXHf6FwMrQyrJqHyWsQfPHLtj/I3hSbpRaFB4YwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kDd8VrR/ZSvRdovI7v79dAjJbiOwqUkEh82e5EpYv05Z03OBC0o8jzdbX0B45+p4Q
	 /cxqFiXtJ9YToD5iReBbrjZ6+iQ/BxqZQa69TngpV9thurkU+I0rr94kfrIJ4LZZ3m
	 cJZfwHvoKzm2880JLQidn3IRoyzMBT9V8Dks8wT15iaxHJzBWgDC/O3LvSs4M+YaXG
	 TOKZRu7KWkCzvoyqYUDElDbBbw6qywDy2laDC42sUmWn9cGAaTHqr3eFp8fY2dPjei
	 8sI4PWDJfdQDi2L6gmj3MCjhsR8QxpL1irsddj1zo2PCFyil4JEqREGWnBeDlwdQ3W
	 2d+i+iYnpJItg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] thermal/drivers: Remove redundant error messages on
 IRQ request failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: imx@lists.linux.dev, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
In-Reply-To: <20260717024733.374913-1-panchuang@vivo.com>
References: <20260717024733.374913-1-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 03:00:01 +0000
Message-Id: <20260717030002.3141F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] PM runtime usage counter is leaked on multiple error paths in `imx=
91_tmu_probe()`.
- [High] Double decrement of the Runtime PM usage counter in the error hand=
ling path of `imx_thermal_probe()`.
- [High] Global static array `proc_thermal_msi_map` is corrupted across dev=
ices and on probe failures.
- [High] The IRQ domain created for over-current interrupts in `soctherm_oc=
_int_init()` is permanently leaked and can cause a Use-After-Free.
--

--- Patch [1]: [PATCH v2] thermal/drivers: Remove redundant error messages =
on IRQ request failure ---
commit c2aa5d21cea82c30c0f98a72f0af891902e951bd
Author: Pan Chuang <panchuang@vivo.com>
Subject: thermal/drivers: Remove redundant error messages on IRQ request fa=
ilure

This patch removes redundant driver-specific dev_err() and dev_err_probe()=
=20
logging when devm_request_irq() or devm_request_threaded_irq() fails across=
=20
various thermal drivers. The core IRQ subsystem already provides detailed=20
error messages for these failures.

[ ... ]

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
This is a pre-existing issue, but does this error path leak the PM runtime
usage counter?

Looking at imx91_tmu_probe(), the usage counter is incremented earlier with
pm_runtime_get_noresume(). If devm_request_threaded_irq() fails, returning
directly bypasses the pm_runtime_put(dev) call at the end of the function.
Because the device persists across probe failures like -EPROBE_DEFER, the
usage counter will accumulate on every retry, preventing the device from
ever entering runtime suspend.

[ ... ]

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
> -	}

[Severity: High]
This is a pre-existing issue, but is there a double decrement of the PM
runtime usage counter on error paths in imx_thermal_probe()?

pm_runtime_resume_and_get() automatically drops the usage counter if it
fails. If it fails, the code jumps to the disable_runtime_pm label:

disable_runtime_pm:
        pm_runtime_put_noidle(data->dev);
        pm_runtime_disable(data->dev);

Since the usage count was already dropped internally by the failed get
operation, this second decrement underflows the usage counter, corrupting
the PM core state tracking.

[ ... ]

> diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_devi=
ce_pci.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_device_p=
ci.c
> index c693d934103af..c5131423ec9bd 100644
> --- a/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c
> +++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c
> @@ -308,10 +308,8 @@ static int proc_thermal_setup_msi(struct pci_dev *pd=
ev, struct proc_thermal_pci
>  		ret =3D devm_request_threaded_irq(&pdev->dev, irq, proc_thermal_irq_ha=
ndler,
>  						proc_thermal_irq_thread_handler,
>  						0, KBUILD_MODNAME, pci_info);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Request IRQ %d failed\n", irq);
> +		if (ret)
>  			goto err_free_msi_vectors;
> -		}
> =20
>  		proc_thermal_msi_map[i] =3D irq;
>  	}

[Severity: High]
This isn't a bug introduced by this patch, but does the use of the global
static array proc_thermal_msi_map cause corruption across devices?

If multiple PCI thermal devices exist on the system, probing a second
device overwrites the mappings in this shared array. When an interrupt
arrives, proc_thermal_match_msi_irq() will fail to match the IRQ for any
device except the last probed one, leading to ignored thermal events.
Additionally, on probe failure, proc_thermal_free_msi() looping over this
shared array might attempt to free IRQs belonging to another active device.

[ ... ]

> diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soc=
therm.c
> index d8e988a0d43e9..f74acf13b24d2 100644
> --- a/drivers/thermal/tegra/soctherm.c
> +++ b/drivers/thermal/tegra/soctherm.c
> @@ -2007,10 +2007,8 @@ static int soctherm_interrupts_init(struct platfor=
m_device *pdev,
>  					IRQF_ONESHOT,
>  					dev_name(&pdev->dev),
>  					tegra);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "request_irq 'thermal_irq' failed.\n");
> +	if (ret < 0)
>  		return ret;
> -	}

[Severity: High]
This is a pre-existing issue, but does returning early here leak the IRQ
domain created in soctherm_oc_int_init()?

soctherm_oc_int_init() allocates a new linear IRQ domain and assigns it to
the static global pointer soc_irq_cdata.domain. If we return ret here, the
domain is abandoned. Furthermore, tegra_soctherm_remove() does not call
irq_domain_remove(). Since the ops pointer points to module memory, this
leaves a dangling pointer in the kernel's global IRQ domain list, leading
to a potential Use-After-Free after module unload.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717024733.3749=
13-1-panchuang@vivo.com?part=3D1
