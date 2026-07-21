Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07063436353;
	Tue, 21 Jul 2026 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625970; cv=none; b=qigcirkrNoOoGkeBetGQQkuqL0Z31DHUF1viPLQGl5NDOa3DEGHfS+KuW6+8t5jj1BUh/3jgAdpf1Hp4ci43fOhUmhPtjQMRbEyeWmMV1KeYjJJ8jKhKE/bGUKCIb7WEVtoHfKvPhc3tL4+sI9J7MXbcHKhv2+vh3iEnb44MP84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625970; c=relaxed/simple;
	bh=qr54HXfOM2v8j2/CAYxKn3YzHWAfV1ZDThyhfq1UEJ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QiMw34hss1KPwWKIMeFQcn6dR8qaChaBVC6B+O1RH5yRvRWxzOdwNkhdFilrXaLT5uyhm9I4FH0CxWocBvZ/24QAPC3KJyxh5U2LpPdbR7XFjd7joSsGFcf4YcugJXyNIyPDprb/gdYlFD58CcBRkxebEppz/deXYZgYPSWGzcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+alGZTk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+alGZTk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA2E1F00A3D;
	Tue, 21 Jul 2026 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625967;
	bh=8nTc0fJgI/qsrYIlAnKVDy8VemUw2367ubVfeTOzowk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R+alGZTk3KbtvBitMpj+Gn0y6cRE8OOOtg5Q1ingeVNxk2FYGJz5SvBbA5cFDR5zw
	 ZCnxHCFW99pdiiV6TlEx6tpBFzYYjIXjtQUoLaI6q9S3hBWPhJ3T11oeZSMrXkVMiw
	 5Sa0kk1vW4EUqFonj5Gmt0KJAvUlKu7eqM7DeXp2jVtIlg7VNnB14U0kzYfpX0FxfK
	 MDHm/iCnmzOXH5qmLKGy4zxoG4e5uMKnnM8nj5pESjfNx6g7+UZlQ/SFqqmC+EE1Om
	 bMC8ZsFSqjm3o4yR/gQP8OkT5cWQHfZfWs73vxNWx8EUT+AUEL651GRNqWFnYZmZhA
	 NevSpNXFBJfvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/8] slimbus: qcom-ngd-ctrl: use
 platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: imx@lists.linux.dev, lee@kernel.org, Frank.Li@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-8-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-8-2dee93f42c54@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:26:07 +0000
Message-Id: <20260721092607.8AA2E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing NULL check on `of_match_node()` result leads to NULL point=
er dereference.
- [High] Premature freeing of parent controller's data in child driver's re=
move callback causes NULL pointer dereference.
- [High] Use-After-Free due to uncancelled work on the system workqueue.
--

--- Patch [8]: [PATCH 8/8] slimbus: qcom-ngd-ctrl: use platform_device_set_=
fwnode() ---
commit 1bfb7c41dded376cdac1bca23cdc026328648166
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

slimbus: qcom-ngd-ctrl: use platform_device_set_fwnode()
   =20
Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-c=
trl.c
> index 934c44c5bc1a9..bf077f47c9ddd 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1538,7 +1538,7 @@ static int of_qcom_slim_ngd_register(struct device =
*parent,
>  			kfree(ngd);
>  			return ret;
>  		}
> -		platform_device_set_of_node(ngd->pdev, node);
> +		platform_device_set_fwnode(ngd->pdev, of_fwnode_handle(node));
>  		ctrl->ngd =3D ngd;
> =20
>  		ret =3D platform_device_add(ngd->pdev);

[Severity: High]
This isn't a bug introduced by this patch, but while looking at
of_qcom_slim_ngd_register(), I noticed that of_match_node() doesn't
have a NULL check:

drivers/slimbus/qcom-ngd-ctrl.c:of_qcom_slim_ngd_register() {
	...
	match =3D of_match_node(qcom_slim_ngd_dt_match, parent->of_node);
	data =3D match->data;
	...
}

Can this lead to a NULL pointer dereference if a user with root privileges
binds the driver via sysfs to a platform device that lacks an appropriate
of_node?

[Severity: High]
This is a pre-existing issue, but I noticed the parent controller's data
could be prematurely freed in the child driver's remove callback:

drivers/slimbus/qcom-ngd-ctrl.c:qcom_slim_ngd_remove() {
	...
	kfree(ctrl->ngd);
	ctrl->ngd =3D NULL;
	...
}

If the child driver is unbound via sysfs, this frees ctrl->ngd. If the
parent driver is subsequently unbound, won't qcom_slim_ngd_unregister()
dereference the NULL ctrl->ngd pointer to delete the platform device?

drivers/slimbus/qcom-ngd-ctrl.c:qcom_slim_ngd_unregister() {
	struct qcom_slim_ngd *ngd =3D ctrl->ngd;

	platform_device_del(ngd->pdev);
}

[Severity: High]
This is also a pre-existing issue, but could there be a use-after-free
if work is scheduled on the system workqueue during driver removal?

In qcom_slim_ngd_ctrl_remove(), the private workqueue is destroyed, but
cancel_work_sync(&ctrl->ngd_up_work) is omitted for the system workqueue:

drivers/slimbus/qcom-ngd-ctrl.c:qcom_slim_ngd_ctrl_remove() {
	...
	destroy_workqueue(ctrl->mwq);
	...
}

If the scheduled work executes after devres frees the ctrl structure, won't
the worker dereference the freed memory?

drivers/slimbus/qcom-ngd-ctrl.c:qcom_slim_ngd_up_worker() {
	...
	ctrl =3D container_of(work, struct qcom_slim_ngd_ctrl, ngd_up_work);
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-pdev-set-f=
wnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com?part=3D8
