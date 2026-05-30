Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFC82DC79A;
	Sat, 30 May 2026 00:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101944; cv=none; b=BUfDci5zLtXRlckLWY2xe0Iwr4NElTZGTkRXYkYEZvJ8v0KLBcOk/7f88O6n/TNEJ3nO8A+cwQ1lQzqXKRagP3sirZ/vob0tFib5XTpKYNxr/TWOCfcKL2LlXUJZYWE8xxpwsNVecPUft9jQWfPlBpairGSS571dnA4S/8Xm10o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101944; c=relaxed/simple;
	bh=vG7nYwo/Jov1xpH9AAWTX3uXkm2o78vHyuSOAFkCHfA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h0yFfG0brMShto8+rNIlUZrkWBR5JHYI+2mKWi+iP4i8c5YZSJXUimHVemvhWLmg26Em6egIwg0LZhpWuzPbDB5B6IrdjSsXxm56RTFoQL3WSAUyDkuSx3zUMGKqYR4PAujWRkB41sTId+Bd/AE6TEy3aAupEjVw3el1XHMdIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3d7dOqV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3d7dOqV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B461F00899;
	Sat, 30 May 2026 00:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101942;
	bh=++gd2wvHpQk8s5dkeE+8T+PQ64/PvNNTaoSwgp+acDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S3d7dOqVG/TsulujPQ4Aq80k+nvmKUh6x9ljHe5prbHZEjNmRhKT0klaiAj6O34gC
	 pnSxfycx8/FhXkQtBK4QoG5EUmdn9e/8YXUE4Z84/QPkmDZdnx3LIJhs+VG9i/J9y/
	 wpEbFpQgA/WGfseSSP15gXcQCiS9IypoRR7nXrh5Ks+jls45zr1aTueWBONFBDFz9s
	 Ea9LBA1q+ssrjt4gRWdmGATWLTWjFi2GQKPd2RJutQzP4DD53R3oYoYqVwivMfp0Gt
	 D0yTZbYfuL1ObbexMIyNlfrraXXA8tYltTvA43HNvLFH/MsvhZ+khxjgru8pgTFjMb
	 5YyhiRAKROHYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/23] slimbus: qcom-ngd-ctrl: fix OF node refcount
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-pdev-fwnode-ref-v1-3-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-3-88c324a1b8d2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:45:42 +0000
Message-Id: <20260530004542.92B461F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Probe error path bypasses cleanup, leaking PDR handle, SSR notifie=
r, and leading to Use-After-Free.
- [High] The dynamically allocated child platform device is never unregiste=
red upon module removal or driver unbind.
- [High] Hardware interrupt handler is registered before underlying structu=
res are fully initialized.
- [High] Unsafe registration of the global platform driver within the contr=
oller's probe function.
- [High] Unchecked dereference of `of_match_node()` return value leads to a=
 potential NULL pointer dereference.
- [High] SSR notifier can execute before work_struct initialization, causin=
g a kernel crash.
- [High] Missing cancellation of `ngd_up_work` during device removal causes=
 a Use-After-Free.
- [High] DMA coherent memory is leaked on every suspend/resume cycle.
--

commit a849bb0b2b8baaf7273c84580d82b6ab6bc55f3a
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

slimbus: qcom-ngd-ctrl: fix OF node refcount

This commit fixes an OF node reference counting issue when using the split
approach for platform device creation. It adds a missing call to of_node_ge=
t()
before platform_device_add(), preventing an unbalanced of_node_put() when t=
he
platform device is released.

> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-c=
trl.c
> index 1ed6be6e85d2c..428266949fdd0 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1542,7 +1542,7 @@ static int of_qcom_slim_ngd_register(struct device =
*parent,

[Severity: High]
This isn't a bug introduced by this patch, but in of_qcom_slim_ngd_register=
(),
the result of of_match_node() is immediately dereferenced.

If the parent device lacks a valid of_node (for example, if it is instantia=
ted
manually or bound via sysfs), the match variable will be NULL. Could this
cause a kernel panic?

>  			kfree(ngd);
>  			return ret;
>  		}
> -		ngd->pdev->dev.of_node =3D node;
> +		ngd->pdev->dev.of_node =3D of_node_get(node);
>  		ctrl->ngd =3D ngd;
> =20
>  		ret =3D platform_device_add(ngd->pdev);

[Severity: High]
This is a pre-existing issue, but of_qcom_slim_ngd_register() dynamically
allocates and adds a child platform device (ngd->pdev).

Do the controller removal function or the child device's unbind path ever
call platform_device_unregister() for this device?

If not, doesn't this cause memory and device leaks, permanently leak the
of_node reference, and prevent module reloading due to sysfs name collisions
in platform_device_add()?

[Severity: High]
This is a pre-existing issue, but if of_qcom_slim_ngd_register() fails, does
the probe function return the error directly and bypass the err_pdr_alloc a=
nd
err_pdr_lookup cleanup labels?

This would leave the SSR notifier registered. Because ctrl is managed by
devm_kzalloc(), it is freed upon probe failure. If the SSR notifier later
fires, won't it access the freed ctrl structure and lead to a Use-After-Fre=
e?
Additionally, are the cleanup labels incorrectly ordered?

[Severity: High]
This isn't a bug introduced by this patch, but in qcom_slim_ngd_ctrl_probe(=
),
devm_request_irq() registers qcom_slim_ngd_interrupt() before ctrl->ngd and
ctrl->ctrl.dev are assigned in the subsequent registration steps.

Could an early or spurious interrupt dereference these NULL pointers and le=
ad
to a kernel panic?

[Severity: High]
This is a pre-existing issue, but platform_driver_register() is called for
qcom_slim_ngd_driver directly inside the controller's probe function.

Doesn't this break driver model semantics? If multiple controller instances
exist, subsequent registrations would fail. When any single controller
instance is removed, qcom_slim_ngd_ctrl_remove() unregisters this global
driver. Wouldn't that forcibly unbind all child devices across all active
controller instances?

[Severity: High]
This is a pre-existing issue, but the SSR notifier is registered in
qcom_slim_ngd_ctrl_probe() before the child device's probe function
initializes the ngd_up_work structure via INIT_WORK().

If the service is already UP, won't the notifier callback fire immediately
and call schedule_work(&ctrl->ngd_up_work) on a zero-initialized
work_struct, leading to a kernel crash?

[Severity: High]
This isn't a bug introduced by this patch, but the driver appears to fail to
call cancel_work_sync(&ctrl->ngd_up_work) in its remove path.

If an SSR event schedules this work on the system workqueue right before the
device is removed, wouldn't the work remain pending and execute after devm
has freed the ctrl structure, causing a Use-After-Free?

[Severity: High]
This is a pre-existing issue, but qcom_slim_ngd_init_dma() allocates DMA
memory for ctrl->rx_base and ctrl->tx_base using dma_alloc_coherent(), which
runs during setup and runtime resume.

However, the teardown function qcom_slim_ngd_exit_dma() only terminates the
DMA channels and never calls dma_free_coherent(). Doesn't this lead to a
repeated DMA memory leak on every suspend/resume cycle?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-pdev-fwnod=
e-ref-v1-0-88c324a1b8d2@oss.qualcomm.com?part=3D3
