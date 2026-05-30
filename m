Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456E12D0605;
	Sat, 30 May 2026 00:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101947; cv=none; b=rdZOo45TrfdyrSg1CyPgL0nt70hwx2zaRYKU4jt4mxh8/YzI7zVrsbBymirAky+oj5d9JkpBWyDC/8K3A6gi87G+fAxNCfsrpzJYYrBNjIy9Z4S+0vSEwvB0w9pCiKAWPpvMAw5361kgWlurLM5hS6ZjWkFTty4kfKlOY3ym30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101947; c=relaxed/simple;
	bh=Y4gIfSU3qqEwfz1WelRV2XZHXBfCkQ2qm5sCtd4tIwM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mrrj9L8f7DO4ryepNilBtZKT6+H6KgkkiM9IF1osleCQLenPY5g/NxjkmjqvBrjS98UE6C46A93QmHh+JjX+NafZPnK07NbkyskL5yk7aXWMGFJpBnJKo9cvKSK2iUGIuq6SHfq2Tf04ZG8jl1CL4G1k5UKBouSidNHjn47NAfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POHGir1b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POHGir1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2526B1F00893;
	Sat, 30 May 2026 00:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101946;
	bh=Q3f5IgXxjbMxN28Xguw6PqPpoiavSSLpHPnSPhZt9gc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=POHGir1b/lv/Ly/kDC+F1d8yoXUtOvKNTzlUD68pLRjGYFdnW7ihi8HNG2mAkUNJ7
	 Bmd4lwQp7QWCVaDKAueBQLBSpvTEklJ3WSk+l6LFUQf95Tz4FzEMlgN/EAvBoZH2ff
	 PK2ogl8DQS9dKH5mKbdYZrXpX7xycxoZfxTHBsbqDA6np01GxyH4M0A8JFpY0Gpx/u
	 OM1UFZF1XLZTE3G8LX+BcIM51s1dS2T/GxiT3whY57qiz3JSv9uAiAETh3VrWYx/Db
	 g2W7Pn9qIKtQRZeGoqV+sD4NPrMiz+w1e+YK0rtyDbcJGgALhBhwWRZZCCfjx3mOLE
	 SAxRnHV+giaWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/23] slimbus: qcom-ngd-ctrl: use
 platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-pdev-fwnode-ref-v1-16-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-16-88c324a1b8d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:44 +0000
Message-Id: <20260530004545.2526B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:

Pre-existing issues:
- [Critical] Probe error path bypasses cleanup labels, leaking resources an=
d leaving dangling notifiers.
- [Critical] Early IRQ request allows a race condition leading to a NULL po=
inter dereference or access to uninitialized locks in the interrupt handler.
- [Critical] PDR/SSR notifiers are registered before their corresponding wo=
rk structs are initialized, leading to potential panics on early events.
- [High] Unchecked return value from of_match_node() causes NULL pointer de=
reference.
- [High] Child device remove callback frees parent device resources, leadin=
g to Use-After-Free and resource leaks.
- [High] Registering a platform driver from within a platform device probe =
callback.
- [High] Error handling labels are in reversed order, causing invalid point=
er accesses and incomplete cleanup.
- [High] Dangling `ctrl->ngd` pointer is left behind on `platform_device_ad=
d()` failure.
- [High] The driver fails to cancel `ctrl->ngd_up_work` during removal, lea=
ding to a Use-After-Free if the work is pending.
- [Medium] Invalid pointer arithmetic causing out-of-bounds MMIO mapping if=
 child reg property is 0.
--

commit 764709448d03c52a2585b5617fd60c1746e5cc5a
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

slimbus: qcom-ngd-ctrl: use platform_device_set_of_node()

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-c=
trl.c
> index 428266949fdd0..70f0698153323 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1542,7 +1542,7 @@ static int of_qcom_slim_ngd_register(struct device =
*parent,
>  			kfree(ngd);
>  			return ret;
>  		}
> -		ngd->pdev->dev.of_node =3D of_node_get(node);
> +		platform_device_set_of_node(ngd->pdev, node);
>  		ctrl->ngd =3D ngd;
> =20
>  		ret =3D platform_device_add(ngd->pdev);

[Severity: High]
This is a pre-existing issue, but is a dangling ctrl->ngd pointer left behi=
nd
on platform_device_add() failure?

During of_qcom_slim_ngd_register(), ctrl->ngd is assigned before
platform_device_add() is called. If adding the device fails, kfree(ngd) is
called, but ctrl->ngd is never reset to null.

Since the irq and ssr notifier are already active, if either fires before t=
he
ctrl structure is eventually destroyed, they will dereference the freed ngd
pointer, resulting in a use-after-free.

[Severity: High]
This is a pre-existing issue, but does this lack a null check?

In of_qcom_slim_ngd_register(), of_match_node() is called with
parent->of_node, and its return value is immediately dereferenced via
match->data. If the device is instantiated without a device tree (e.g., via
sysfs manual bind) or if the match fails, of_match_node() returns null.
Dereferencing it without a null check causes a kernel panic.

[Severity: Critical]
This is a pre-existing issue, but does the probe error path bypass cleanup
labels?

In qcom_slim_ngd_ctrl_probe(), if of_qcom_slim_ngd_register() fails (e.g.
returning -ENODEV when no child nodes exist), the function directly executes
return of_qcom_slim_ngd_register(...).

This bypasses the error cleanup labels err_pdr_alloc and err_pdr_lookup,
failing to unregister the ssr notifier and free the pdr handle. Since the c=
trl
structure is devres-managed, it is freed upon probe failure. A subsequent s=
sr
notification will then dereference the freed ctrl object, leading to a
use-after-free.

[Severity: High]
This is a pre-existing issue, but does the child device remove callback free
parent device resources?

The parent device's probe (qcom_slim_ngd_ctrl_probe) allocates ctrl->pdr and
registers ctrl->notifier. However, the child device's remove callback
(qcom_slim_ngd_remove) frees them.

If a user unbinds the child device via sysfs, these resources are freed whi=
le
the parent is still active. If the child is bound again, or if an ssr event
triggers, it will access the freed resources. Furthermore, if no child is e=
ver
added or probed, these resources are never freed when the parent is removed.

[Severity: High]
This is a pre-existing issue, but is it correct to register a platform driv=
er
from within a platform device probe callback?

qcom_slim_ngd_ctrl_probe() calls platform_driver_register() during its own
probe. This violates the Linux device driver model. If there are multiple
instances of the qcom,slim-ngd-ctrl controller, the second probe will fail
to register the driver but ignore the error.

Additionally, the parent's remove callback unregisters the driver globally,
forcefully unbinding all ngd child devices across all controller instances.

[Severity: Medium]
This is a pre-existing issue, but can invalid pointer arithmetic cause an
out-of-bounds mmio mapping if the child reg property is 0?

If a child node specifies reg =3D <0>, ngd->id becomes 0. The expression
(ngd->id - 1) * data->size multiplies -1 by a u32. Due to type promotion,
this wraps to a huge unsigned value (0xffffffff * data->size), resulting in
an out-of-bounds mmio address calculation when added to the ctrl->base
pointer.

[Severity: High]
This is a pre-existing issue, but are the error handling labels in reversed
order?

In qcom_slim_ngd_ctrl_probe(), the cleanup labels are in the wrong order. If
pdr_add_lookup() fails, the code jumps to err_pdr_lookup, completely skippi=
ng
qcom_unregister_ssr_notifier(), leaking the notifier and opening a
use-after-free window.

If pdr_handle_alloc() fails, it jumps to err_pdr_alloc, unregisters the
notifier, and falls through to err_pdr_lookup, calling pdr_handle_release()
on an IS_ERR pointer.

[Severity: Critical]
This is a pre-existing issue, but does the early irq request allow a race
condition?

In qcom_slim_ngd_ctrl_probe(), devm_request_irq() is called before
of_qcom_slim_ngd_register() initializes the ctrl->ngd pointer, and before
ctrl->ctrl.dev and locks are initialized.

If an early or pending hardware interrupt fires during this window,
qcom_slim_ngd_interrupt() will execute and immediately dereference
ctrl->ngd->base (which is null) or call pm_runtime_suspended(ctrl->ctrl.dev)
(also null), leading to a null pointer dereference.

[Severity: Critical]
This is a pre-existing issue, but are pdr and ssr notifiers registered befo=
re
their corresponding work structs are initialized?

The ssr notifier and pdr handle are registered in the parent controller pro=
be,
immediately exposing the driver to notifications. The handler
qcom_slim_ngd_ssr_pdr_notify() calls schedule_work(&ctrl->ngd_up_work).

However, ctrl->ngd_up_work is initialized much later in qcom_slim_ngd_probe=
()
(the child driver's probe). If an event arrives before the child driver
probes, the kernel will enqueue an uninitialized work_struct, causing
workqueue list corruption and a kernel panic.

[Severity: High]
This is a pre-existing issue, but does the driver fail to cancel
ctrl->ngd_up_work during removal?

The driver schedules ctrl->ngd_up_work on the global system workqueue via
schedule_work(). However, neither qcom_slim_ngd_remove() nor
qcom_slim_ngd_ctrl_remove() calls cancel_work_sync(&ctrl->ngd_up_work) befo=
re
returning.

The memory for ctrl will then be freed by devres. If the scheduled work
executes after the memory is freed, it results in a use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pdev-fwnod=
e-ref-v1-0-88c324a1b8d2@oss.qualcomm.com?part=3D16
