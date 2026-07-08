Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6C73890F8
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505122; cv=none; b=Kz0wm+YmWXOIXoP30GedaORwe4Kptgo3Z3DmH2RvWPWJOqOQLGo3BbUFgZbt68S2LuNt34eZ+OUTD7CfuH3N+UkHloOGM88YdQVjMkFVwCMwEJSZyKUMS+a9abxZ/e8KHjA22ASNSl8ZFv8l1VUrFYelEFaKfar4g2UpGI+/jfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505122; c=relaxed/simple;
	bh=EK/5h5axJJjz6SxxUQat4o2MBjD5ZdIfUNUd4xNxNJQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c3DaV8uC3sibhsqqtENJSIqJQxaoImxjJE4wbXEIB3ctqss2wz6puKWKqowbgWjgXcqNTqzAha7QZF/Mu8mUGhwHDNoXZaB679Pdgt4kQfu6UPF4fSa93vpNfs7OfuxahaO4HD2oAb0CbGlnH2yNKA7xRxtADWAW+U34IyJ8iwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWgMDt+X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWgMDt+X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B991F000E9;
	Wed,  8 Jul 2026 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783505120;
	bh=DrCLEoqs4lxKdeGd94Ebzz7tops+Ir9FkUZooyLG98E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RWgMDt+X+IriXKJCfzSFmd71C/LEVkPZrzDkaXTtPtaNcQS2YqD133q/iOs9nkI1/
	 By7/NgV+zgaaI1Q7aE2cOnrJo+7wxocYhoILzGVyEbhkyh7+pFZd27t0MQeQ91hu3O
	 VmQwXSnMdnbwwAQ7427+bv7EEH683RSJg1oilUlGL1I+K8GieHgmU8IOuaBgA6PSH4
	 tt3skucH1fm40I5yhJpcfkfyjDui1z59p3aR3dMv99l6IQgFBRLVEglb2PWapqPAdV
	 NWemMBBfBa4e7NyyJFqnZMJUEpKG5luck4gubLEcl7zbk8tn2geU66YLWn3b2Qw468
	 Yyba4oVAIxm9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/imx: include dc-drv.h to avoid sparse warning
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmlyaSBTbGFieSAoU1VTRSk=?= <jirislaby@kernel.org>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20260708095645.385291-2-jirislaby@kernel.org>
References: <20260708095645.385291-1-jirislaby@kernel.org>
 <20260708095645.385291-2-jirislaby@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 10:05:19 +0000
Message-Id: <20260708100520.08B991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The use of pm_sleep_ptr() discards runtime PM callbacks when CONFI=
G_PM is enabled but CONFIG_PM_SLEEP is disabled, leading to a kernel oops o=
n probe.
--

--- Patch [2]: [PATCH 2/2] drm/imx: include dc-drv.h to avoid sparse warnin=
g ---
commit 92fb37945f1af608d237fde0454ddaa90bee5644
Author: Jiri Slaby (SUSE) <jirislaby@kernel.org>

drm/imx: include dc-drv.h to avoid sparse warning

This commit adds an include of dc-drv.h in dc-ic.c to fix a sparse warning.
The warning indicated that dc_ic_driver was not declared.

> diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-i=
c.c
> index d8aa46ee6a7a0..0f2fc7aecf31f 100644
> --- a/drivers/gpu/drm/imx/dc/dc-ic.c
> +++ b/drivers/gpu/drm/imx/dc/dc-ic.c
> @@ -14,6 +14,8 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> =20
> +#include "dc-drv.h"
> +
>  #define USERINTERRUPTMASK(n)	(0x8 + 4 * (n))
>  #define INTERRUPTENABLE(n)	(0x10 + 4 * (n))

[ ... ]

drivers/gpu/drm/imx/dc/dc-ic.c:dc_ic_driver {
	.probe =3D dc_ic_probe,
	.remove =3D dc_ic_remove,
	.driver =3D {
		.name =3D "imx8-dc-intc",
		.suppress_bind_attrs =3D true,
		.of_match_table	=3D dc_ic_dt_ids,
		.pm =3D pm_sleep_ptr(&dc_ic_pm_ops),
	},
};

[Severity: High]
This isn't a bug introduced by this patch, but can using pm_sleep_ptr() here
cause a kernel oops on probe?

If the kernel is configured with CONFIG_PM=3Dy but CONFIG_PM_SLEEP=3Dn,
pm_sleep_ptr() evaluates to NULL, dropping the entire PM operations
structure including the runtime PM callbacks set by RUNTIME_PM_OPS().

During device probe, pm_runtime_resume_and_get() would execute successfully
since the device lacks PM callbacks. As a result, dc_ic_runtime_resume()
is skipped and the AXI clock (clk_axi) is never enabled.

The probe function then calls regmap_write() to mask and clear interrupts.
Does accessing memory-mapped registers over an unclocked AXI bus trigger a
synchronous external bus abort? Should this use pm_ptr() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708095645.3852=
91-1-jirislaby@kernel.org?part=3D2
