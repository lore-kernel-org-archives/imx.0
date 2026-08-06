Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F800390222
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 21:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.86.107.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052080; cv=none; b=aDXs5qD6Jnf6N/YvPz8ImhNfMF9QcNhMSabwPoGYdPOuMVTQ5M7h6qK24mFEoEWLlztkWZnkRiJH641g/4Fh3CKabx9d5qeOlKNXJ7xEPRn7nCAJDuws5I45vroky7vU5Bb6OM8gn03LyKKXqy+DU0c6BVKC96mbZOn8AGiOhDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052080; c=relaxed/simple;
	bh=mKng4DFiAV81P1O3TbpODG94LKmbzuzt8xTRrzCHEs4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j/B5XIWba4GzlUnBMZOjPKurHkx46YCqPQgSgjhXMH5N9zHt8B8LZlzELoTcpa2v6YpXMy7dYNUNfBWP1r+6G/FiBhQIjhEyENeALTFo+MXAhv8VboKjlmyzww+tKQG8pE+y9j5HR1MuWy1+QDu+tMQeFfqR/L2PI9ENP/denIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net; spf=pass smtp.mailfrom=rendec.net; dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b=a0u1jI8z; arc=none smtp.client-ip=80.86.107.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rendec.net header.i=@rendec.net header.b="a0u1jI8z"
Received: from bat.kanata.rendec.net (unknown [24.114.108.65])
	by mail.mindbit.ro (Postfix) with ESMTPSA id D087FC235E;
	Fri,  7 Aug 2026 00:29:04 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro D087FC235E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1786051747;
	bh=INbY6iWbHIRFsQU3VYeaoqVJ06lls0p8BLdIgn/GCu4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=a0u1jI8zuqey9eyNDAMyhlRbg6nageZNHDkyIuJXxvEEXBIbKHoZVb4VlIgRK2Dn7
	 3wzwIJ+hi+VSo9kG8QHsVLF0etqY5R9R2tg9XHgXghO+n6YDW/LU4y2SD0xJb7HMbF
	 Yc4gJigEDOO2He6afrgJxOuURnwfJJK3UQIP+4O/L5MfhNLlX8fYbLIONO1bxrRFP+
	 i6yyTIxS787kKQQ4LVV4ZdkAVC6ADeCzlDKq1HL9XfrmOwt7Ur5eoskdliO9yAniV6
	 Qp4I4mWvimyAuJ7o+PVYrimM04L9SW/yze8dDan7O8kXr4C3iFnxwLaniugn8fddoa
	 86bC6FtAGX5+g==
Message-ID: <f5e720e174fb74615f5c3c0702e63f6b8aa3ec87.camel@rendec.net>
Subject: Re: [PATCH v3 1/2] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_enable()
From: Radu Rendec <radu@rendec.net>
To: Fabio Estevam <festevam@gmail.com>, tglx@kernel.org
Cc: Frank.Li@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>
Date: Thu, 06 Aug 2026 17:28:59 -0400
In-Reply-To: <20260805192743.244441-1-festevam@gmail.com>
References: <20260805192743.244441-1-festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-08-05 at 16:27 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
>=20
> imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove() does
> not disable it. Consequently, runtime PM remains enabled after unbinding
> the device, and rebinding it triggers:
>=20
> Unbalanced pm_runtime_enable!
>=20
> Use devm_pm_runtime_enable() to automatically disable runtime PM when
> the device is removed. Set up runtime PM before creating the IRQ domain
> and registering chained handlers so that a failure cannot leave either
> resource pointing at freed driver data.
>=20
> Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
> - Move devm_pm_runtime_enable() prior to irq_domain_create_linear(). (Fra=
nk)
>=20
> =C2=A0drivers/irqchip/irq-imx-irqsteer.c | 8 +++++---
> =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 87b07f517be3..653e25115083 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -236,6 +236,11 @@ static int imx_irqsteer_probe(struct platform_device=
 *pdev)
> =C2=A0	if (irqsteer_has_chanctrl(data->devtype_data))
> =C2=A0		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> =C2=A0
> +	pm_runtime_set_active(&pdev->dev);
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		goto out;
> +
> =C2=A0	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), =
data->reg_num * 32,
> =C2=A0						&imx_irqsteer_domain_ops, data);
> =C2=A0	if (!data->domain) {
> @@ -262,9 +267,6 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, data);
> =C2=A0
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> -
> =C2=A0	return 0;
> =C2=A0out:
> =C2=A0	clk_disable_unprepare(data->ipg_clk);

I still believe there is something off with the way pm_runtime is
handled, and that the double clock disable is possible.

Since (like I said) I have very limited understanding of the runtime_pm
framework, I decided to make a little experiment.

With the dummy module below, I see this:
[  548.253591] pm_dummy pm_dummy: pm_dummy_probe() executed
[  548.254209] pm_dummy pm_dummy: clock enabled; refcount: 1
[  548.255028] pm_dummy pm_dummy: pm_dummy_runtime_suspend() triggered
[  548.255845] pm_dummy pm_dummy: clock disabled; refcount: 0
[  554.261820] pm_dummy pm_dummy: pm_dummy_runtime_resume() triggered
[  554.263100] pm_dummy pm_dummy: clock enabled; refcount: 1
[  554.264006] pm_dummy pm_dummy: pm_dummy_runtime_suspend() triggered
[  554.264997] pm_dummy pm_dummy: clock disabled; refcount: 0
[  554.265819] pm_dummy pm_dummy: pm_dummy_remove() executed
[  554.266609] pm_dummy pm_dummy: clock disabled; refcount: -1
[  554.267468] pm_dummy pm_dummy: *****************************************=
*********
[  554.268554] pm_dummy pm_dummy: [BUG DETECTED] Clock disable count underf=
low! (-1)
[  554.269479] pm_dummy pm_dummy: *****************************************=
*********

What I find interesting is that the device is suspended immediately
during probe(), then it's automatically resumed and immediately
suspended again right before remove(). The latter is probably a side
effect of devm_pm_runtime_enable(). But in any case, the clock *is*
disabled twice, and that's even without any explicit suspend or resume,
it's just by loading and unloading the module.

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/platform_device.h>
#include <linux/pm_runtime.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Radu Rendec <radu@rendec.net>");
MODULE_DESCRIPTION("runtime_pm playground");

static int mock_clk_count =3D 0;

static int mock_clk_prepare_enable(struct device *dev)
{
	mock_clk_count++;
	dev_info(dev, "clock enabled; refcount: %d\n", mock_clk_count);
	return 0;
}

static void mock_clk_disable_unprepare(struct device *dev)
{
	mock_clk_count--;
	dev_info(dev, "clock disabled; refcount: %d\n", mock_clk_count);

	if (mock_clk_count < 0) {
		dev_err(dev, "**************************************************\n");
		dev_err(dev, "[BUG DETECTED] Clock disable count underflow! (%d)\n", mock=
_clk_count);
		dev_err(dev, "**************************************************\n");
	}
}

static int pm_dummy_runtime_suspend(struct device *dev)
{
	dev_info(dev, "%s() triggered\n", __func__);
	mock_clk_disable_unprepare(dev);
	return 0;
}

static int pm_dummy_runtime_resume(struct device *dev)
{
	dev_info(dev, "%s() triggered\n", __func__);
	return mock_clk_prepare_enable(dev);
}

static const struct dev_pm_ops pm_dummy_pm_ops =3D {
	SET_RUNTIME_PM_OPS(pm_dummy_runtime_suspend, pm_dummy_runtime_resume, NULL=
)
};

static int pm_dummy_probe(struct platform_device *pdev)
{
	dev_info(&pdev->dev, "%s() executed\n", __func__);

	mock_clk_prepare_enable(&pdev->dev);
	pm_runtime_set_active(&pdev->dev);
	devm_pm_runtime_enable(&pdev->dev);

	return 0;
}

static void pm_dummy_remove(struct platform_device *pdev)
{
	dev_info(&pdev->dev, "%s() executed\n", __func__);

	mock_clk_disable_unprepare(&pdev->dev);
}

static struct platform_driver pm_dummy =3D {
	.probe =3D pm_dummy_probe,
	.remove =3D pm_dummy_remove,
	.driver =3D {
		.name =3D "pm_dummy",
		.pm =3D &pm_dummy_pm_ops,
	},
};

static struct platform_device *pdev;

static int __init pm_demo_init(void)
{
	int ret;

	ret =3D platform_driver_register(&pm_dummy);
	if (ret)
		return ret;

	pdev =3D platform_device_register_simple("pm_dummy", -1, NULL, 0);
	if (IS_ERR(pdev)) {
		platform_driver_unregister(&pm_dummy);
		return PTR_ERR(pdev);
	}

	return 0;
}

static void __exit pm_demo_exit(void)
{
	platform_device_unregister(pdev);
	platform_driver_unregister(&pm_dummy);
}

module_init(pm_demo_init);
module_exit(pm_demo_exit);
