Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6570437CD20;
	Fri, 12 Jun 2026 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271273; cv=none; b=lNWpc+eMo8UfofflOeRi+ki0oF0JNGVVW1Bx0xAexy45VgysBnACGR2xHMX66HzJiCfFq42n9aUz/sh4Wq3/0avZDPqACfIpSaIaAE/+s9JptxVZg1Mkghc97TUuk+MXgVAHOrfi9Uz4cYhAhbfkE8HJExl3tchHwK4EnwOlUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271273; c=relaxed/simple;
	bh=A1Dr8X/dhrO6C7OVNSFy4SZCT2oMgAtkg0VI/i+cJFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z9Wch5NNETn7Ja1efPOzE48Ro8AYnXoVbutKTKbbNiNUMQErgKlBGZ6z2vc2cLwiIgJVIvZJcKBYrbfEgl8k+iHeA2CIpGR4+yGtGCcI1/5T4DjSOY5RH7vxzHGbaQ43giFtqVeLNv0rKlU7xhJueD9aPCJtvKEBOieK8Ib0qy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzxFbsMc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzxFbsMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FCB1F000E9;
	Fri, 12 Jun 2026 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271272;
	bh=E2/f7D9XPiEGcYLh38hzdNHHL87+97Az3LIgJqJ5Stw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RzxFbsMcPhojsTXglUozAeWqU9zx5/F5wR4mn1A+ZQewInawsrkFB+wE00F5BkNw1
	 0XxnJoTxWuThOQEDOfvEEM4cF0bB6pIUzjZtCZ8S6rgQ+c3uLKLtIQRwbAUxYiJqFp
	 FVkT7PqvGsDnb5AxT9iUIBQKNhm25jvJthJ/kD+onHsunMn4zLvqf7+/LyqWaLoVE1
	 3M3iNTUau2pv2LFa9r+cOUkqneW09VdouwicAaOUBEAh/gZzBGfP+T57Cn2zr+UTX+
	 O3qCKxo3bTzBxYkR3ebNTMT1GdifrmXVRWOmU398woBrPjJB60IGx/Y9bFP1qr8+6d
	 ui30EYanN+/Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] media: platform: neoisp: Add debugfs support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoine Bouyer" <antoine.bouyer@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260612132039.2089051-8-antoine.bouyer@nxp.com>
References: <20260612132039.2089051-8-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:34:31 +0000
Message-Id: <20260612133431.F3FCB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Critical] Missing cleanup of media devices and debugfs files in the `neo=
isp_probe` error path leads to Resource Leaks and Use-After-Free vulnerabil=
ities.
- [High] The device's PM usage counter is leaked if `CONFIG_DEBUG_FS` is di=
sabled or if debugfs allocation fails.
- [High] Invalid direct pointer dereference of I/O memory (`__iomem`) in `n=
eoisp_dump_memory()`.
- [Low] The `enable_debugfs` module parameter is defined with `0644` (read-=
write) permissions, but it is only evaluated once during module probe.

Pre-existing issues:
- [High] Race condition in Runtime PM state due to asynchronous `pm_runtime=
_put()` before `pm_runtime_disable()`.
- [High] Double unregister of the v4l2_device if neoisp_init_group() fails =
when called from neoisp_core_media_register().
--

commit 15c2086c65406ec4a2f05196f174786dbe315997
Author: Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: media: platform: neoisp: Add debugfs support

Add debugfs entries to dump ISP registers, and some internal memory
regions used to store Vignetting, DRC global and DRC local coefficients.

Debug mode is activated with the enable_debugfs module parameter.

> diff --git a/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c b/drivers=
/media/platform/nxp/neoisp/neoisp_debugfs.c
> new file mode 100644
> index 0000000000000..e730569184b3d
> --- /dev/null
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_debugfs.c

[ ... ]

> +static inline int
> +neoisp_dump_memory(struct seq_file *m, enum isp_block_map_e map, int wsi=
ze)
> +{
> +	struct neoisp_dev_s *neoispd =3D m->private;
> +	union udata_t data;
> +	u32 addr;
> +	u32 *src =3D (u32 *)neoispd->local_mem;
> +	u32 offset =3D ISP_GET_OFF(map) / sizeof(u32);
> +	u32 size =3D ISP_GET_SZ(map) / sizeof(u32);
> +	int i, j;
> +
> +	for (i =3D 0; i < size; i++) {
> +		addr =3D offset * sizeof(u32);
> +		data.word =3D src[offset++];

[Severity: High]
Can this directly dereference I/O memory?

neoispd->local_mem is mapped using devm_ioremap_resource_wc(), which returns
an iomem pointer. Here it is cast to a regular u32 pointer and accessed
directly:

		data.word =3D src[offset++];

Accessing I/O memory via direct pointer dereferencing bypasses required
compiler memory barriers and architecture-specific I/O memory instructions.
It invites unsafe compiler optimizations and can cause CPU faults.

Should this code use readl() or ioread32() to safely access the MMIO region
and ensure correct CPU endianness conversion?

[ ... ]

> diff --git a/drivers/media/platform/nxp/neoisp/neoisp_main.c b/drivers/me=
dia/platform/nxp/neoisp/neoisp_main.c
> index b08995403c597..ca61af8cf66e4 100644
> --- a/drivers/media/platform/nxp/neoisp/neoisp_main.c
> +++ b/drivers/media/platform/nxp/neoisp/neoisp_main.c

[ ... ]

> @@ -41,6 +42,10 @@ static int standalone_mdev;
>  module_param_named(standalone_mdev, standalone_mdev, uint, 0644);
>  MODULE_PARM_DESC(standalone_mdev, " Create standalone neoisp media devic=
e, default is 0 (off)");
> =20
> +static int enable_debugfs;
> +module_param_named(enable_debugfs, enable_debugfs, uint, 0644);

[Severity: Low]
Since the driver cannot respond to runtime changes of this parameter, could
the permissions be set to 0444 (read-only) instead of 0644?

Users may attempt to toggle debugfs support dynamically via sysfs after the
module is loaded, but changing this value at runtime will not dynamically
create or remove the debugfs entries, nor will it alter the device PM state.

> +MODULE_PARM_DESC(enable_debugfs, " Turn on/off debugfs, default is 0 (of=
f)");
> +
>  static inline bool node_desc_is_output(const struct neoisp_node_desc_s *=
desc)

[ ... ]

> @@ -1766,9 +1771,18 @@ static int neoisp_probe(struct platform_device *pd=
ev)
>  	neoisp_init_hw(neoispd);
>  	neoisp_set_default_context(neoispd);
> =20
> +	if (enable_debugfs) {
> +		neoisp_debugfs_init(neoispd);
> +		/* Increase pm_runtime counter to prevent suspend */
> +		ret =3D pm_runtime_resume_and_get(dev);
> +		if (ret)
> +			goto err_pm_runtime_suspend;

[Severity: Critical]
Does this error path leave dangling media device and debugfs registrations?

If pm_runtime_resume_and_get() fails, the execution jumps to
err_pm_runtime_suspend. This error path only cleans up the initial runtime
PM state.

It bypasses calling neoisp_destroy_devices() to unregister the previously
initialized V4L2 and media devices, and it fails to call
neoisp_debugfs_exit().

Since returning an error from probe causes devres to free the neoispd
structure, the V4L2 device nodes and debugfs files will remain alive and
point to freed memory, leading to use-after-free vulnerabilities if accessed
from user-space.

> +	}
> +
>  	pm_runtime_mark_last_busy(dev);
>  	pm_runtime_put_autosuspend(dev);

[ ... ]

> @@ -1785,6 +1799,11 @@ static void neoisp_remove(struct platform_device *=
pdev)
>  {
>  	struct neoisp_dev_s *neoispd =3D platform_get_drvdata(pdev);
> =20
> +	if (neoispd->regset) {
> +		neoisp_debugfs_exit(neoispd);
> +		pm_runtime_put(neoispd->dev);
> +	}

[Severity: High]
Does this unconditionally leak the PM usage counter if debugfs allocation
fails or is disabled?

In neoisp_probe(), if the enable_debugfs parameter is true, the driver calls
neoisp_debugfs_init() and unconditionally increments the PM counter via
pm_runtime_resume_and_get() to keep the device awake.

However, in neoisp_debugfs_init(), if devm_kzalloc() fails or if
CONFIG_DEBUG_FS is disabled, neoispd->regset remains NULL.

Later, neoisp_remove() incorrectly checks if (neoispd->regset) before calli=
ng
pm_runtime_put(). Since regset is NULL, the put is entirely skipped. This
permanently leaks the PM usage counter and prevents the device from
suspending.

[Severity: High]
This is a pre-existing issue, but does the use of pm_runtime_put() here
create a race condition with device removal?

pm_runtime_put() queues an asynchronous idle notification. However, at the
end of neoisp_remove(), pm_runtime_disable() is called:

	pm_runtime_dont_use_autosuspend(neoispd->dev);
	pm_runtime_disable(neoispd->dev);

The pending async suspend work can be canceled before it executes by
pm_runtime_disable(), leaving the hardware powered on in an incorrect
RPM_ACTIVE state.

Should this use pm_runtime_put_sync() instead to ensure the device powers
down correctly? The same pre-existing pattern appears in the
err_pm_runtime_suspend error path in neoisp_probe().

> +
>  	neoisp_destroy_devices(neoispd);

[Severity: High]
This is a pre-existing issue, but does neoisp_destroy_devices() cause a
double unregister of the v4l2_device?

If another driver calls neoisp_core_media_register() and invokes
neoisp_init_group(), an error in neoisp_init_group() will trigger its
error path to call v4l2_device_unregister().

However, the core neoisp device remains actively probed. When the driver is
later unbound, neoisp_remove() calls neoisp_destroy_devices(), which
unconditionally calls v4l2_device_unregister() a second time on the same
v4l2_dev, causing a use-after-free.

> =20
>  	if (standalone_mdev)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132039.2089=
051-1-antoine.bouyer@nxp.com?part=3D7
