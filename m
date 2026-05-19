Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948492E3709;
	Tue, 19 May 2026 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207076; cv=none; b=txrwEahvW6SvDak8ody5LgDCaPXNTUvjknzU40xFzDdyHCxQz9htmcM/gke2nubqLTFJvy8its3wMke1czs1WZadm+At2e0vvfZ9cA9RO370pNxcVUJ8rzK8T8E3+uRqL6IzHTpvpXfZ7GlFF6HkO3JWv0SYl000lga1EolIxSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207076; c=relaxed/simple;
	bh=trZIadoytzbfIBSQtzAvLSVb1hPuPoV+47zfFFPiINo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=laTHgzuz/fgAssTPRaekg0lFbL/jabZA1DRBa/WeQNENngQucM3xJF46U5gAL7TbLTcqUF5IxGCNi3dh636ljoM/W9eQ6tkzBZ5Gd+i56Yl75e+ficfvIjz3mV/Ysb39pBz2bQPGUQtHWgu/mHHKEG6k0OAFdHqKmvnC0s7PHq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VR96cqep; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VR96cqep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC43C2BCB3;
	Tue, 19 May 2026 16:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207076;
	bh=trZIadoytzbfIBSQtzAvLSVb1hPuPoV+47zfFFPiINo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VR96cqepf/3WeIsg5BahVa1aibmQHaw0hjEjepqvQBNSgp7W2S2xZlg6In47BZHF2
	 fBfIzpvClzDOfb9fGSDZc10m2nNe9mcg/vMLZfYI+mCHyI2U/Ak4bIT9OwIXaNjP1e
	 vfw4AhEo3Sy3bHbbNVqLX4Czu4pcOcu9si1T0zmAouM5FR2KbV45Nr5Cdt8sL13Ke7
	 icNy9/7q6yYLhlepmD4EJ4Le2O1iACs+AzKX2dW5Kr42LJElbc+8BNwxwdMrqloZx3
	 ExxErugSKcKNa056cooZ5zFY1+J/U6Ax5w/KySLPQNkhGhxVpGT7CCmzn5d5A3+lGx
	 ojeaqAwh0lsIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 2/8] drm: bridge: cadence: Update mhdp8546 mailbox
 access functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260519-dcss-hdmi-upstreaming-v23-2-5615524a9c63@oss.nxp.com>
References: <20260519-dcss-hdmi-upstreaming-v23-2-5615524a9c63@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 16:11:15 +0000
Message-Id: <20260519161115.CDC43C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [High] Calling disable_irq() on a devm-managed IRQ permanently disables i=
t across probe cycles.

Pre-existing issues:
- [Critical] Stack-based buffer overflow when parsing HDCP receiver IDs.
- [High] cdns_mhdp_get_edid_block() silently returns success when EDID bloc=
k validation fails.
- [High] IRQ handler is requested and enabled before the wait queues and wo=
rk items it depends on are initialized.
- [High] Work items are not cancelled on probe error paths, leading to use-=
after-free.
- [High] HDCP work items are intentionally not cancelled during driver remo=
val, leading to use-after-free.
- [High] Concurrent read-modify-write operations on mhdp->sw_events can res=
ult in lost software events.
- [High] Asynchronous firmware load callback can cause a use-after-free on =
remove timeout.
--

commit 68527048a69af8f87537e4a9dc19aa348ad8c6b4
Author: Sandor Yu <Sandor.yu@nxp.com>
Subject: drm: bridge: cadence: Update mhdp8546 mailbox access functions

The patch replaces the basic mailbox access functions with new mailbox help=
er
functions for MHDP commands. All MHDP commands passed through the mailbox a=
re
rewritten to utilize these new helper routines.

> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 064c6915c8960..cb151da0db13d 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
[ ... ]
> @@ -418,28 +118,17 @@ int cdns_mhdp_get_edid_block(void *data, u8 *edid,
>  	u8 msg[2], reg[2], i;
>  	int ret;
> =20
> -	mutex_lock(&mhdp->mbox_mutex);
> -
>  	for (i =3D 0; i < 4; i++) {
[ ... ]
> +		ret =3D cdns_mhdp_mailbox_send_recv_multi(&mhdp->base,
> +							MB_MODULE_ID_DP_TX,
> +							DPTX_GET_EDID,
> +							sizeof(msg), msg,
> +							DPTX_GET_EDID,
> +							sizeof(reg), reg,
> +							length, edid);
>  		if (ret)
>  			continue;
> =20
> +		if (reg[0] =3D=3D length && reg[1] =3D=3D block / 2)
>  			break;
>  	}
> =20
> -	mutex_unlock(&mhdp->mbox_mutex);
> -
>  	if (ret)
>  		dev_err(mhdp->dev, "get block[%d] edid failed: %d\n",
>  			block, ret);
> =20
>  	return ret;

[Severity: High]
This is a pre-existing issue, but does this function silently return success
when EDID block validation fails?=20

If the loop retries 4 times and the condition checking the register values
evaluates to false each time, the loop finishes with ret equal to 0.=20
Could this cause the DRM subsystem to subsequently use an uninitialized or
corrupt edid buffer?

[ ... ]
> @@ -2338,12 +2005,12 @@ static int cdns_mhdp_probe(struct platform_device=
 *pdev)
[ ... ]
> -	irq =3D platform_get_irq(pdev, 0);
> -	ret =3D devm_request_threaded_irq(mhdp->dev, irq, NULL,
> +	mhdp->irq =3D platform_get_irq(pdev, 0);
> +	ret =3D devm_request_threaded_irq(mhdp->dev, mhdp->irq, NULL,
>  					cdns_mhdp_irq_handler, IRQF_ONESHOT,
>  					"mhdp8546", mhdp);
>  	if (ret) {
> -		dev_err(dev, "cannot install IRQ %d\n", irq);
> +		dev_err(dev, "cannot install IRQ %d\n", mhdp->irq);
>  		ret =3D -EIO;
>  		goto plat_fini;
>  	}

[Severity: High]
This is a pre-existing issue, but is the IRQ handler requested and enabled
before the wait queues and work items it depends on are initialized?

Looking further down in this function, the initialization for the work items
and waitqueues occurs after this point. If an interrupt triggers in this
window, could the handler call wake_up or schedule_work on uninitialized
structures and cause a panic?

[Severity: High]
This isn't a bug introduced by this patch, but can concurrent read-modify-w=
rite
operations on the software events field result in lost events?=20

The IRQ handler sets bits while the wait routine clears them. Is there a ra=
ce
condition here if neither operation is atomic and no lock protects them?

[Severity: High]
This is also a pre-existing issue, but are the work items properly cancelled
on probe error paths?=20

If probe fails after the IRQ is requested, for example during the firmware
load phase, the devm cleanup will free the mhdp structure. Since the work
items are not explicitly cancelled, could a queued work item execute after
the memory is freed and cause a use-after-free?

[ ... ]
> @@ -2408,6 +2075,10 @@ static void cdns_mhdp_remove(struct platform_devic=
e *pdev)
> =20
>  	drm_bridge_remove(&mhdp->bridge);
> =20
> +	disable_irq(mhdp->irq);
> +	cancel_work_sync(&mhdp->modeset_retry_work);
> +	flush_work(&mhdp->hpd_work);
> +
>  	ret =3D wait_event_timeout(mhdp->fw_load_wq,
>  				 mhdp->hw_state =3D=3D MHDP_HW_READY,
>  				 timeout);

[Severity: High]
Does calling disable_irq on a devm-managed IRQ permanently disable it across
probe cycles?=20

Since the devm cleanup does not reset the IRQ disable depth when it frees
the irq, won't this leave the disable depth imbalanced if the driver is
re-probed later, preventing it from receiving any interrupts?

[Severity: High]
This is a pre-existing issue, but can the asynchronous firmware load callba=
ck
cause a use-after-free on a remove timeout?=20

If the wait condition times out, this function logs an error and proceeds,
eventually allowing devm to free the mhdp structure. Since the asynchronous
request does not cancel pending callbacks, could the delayed callback run a=
nd
dereference the freed pointer?

[ ... ]
> @@ -2433,8 +2104,7 @@ static void cdns_mhdp_remove(struct platform_device=
 *pdev)
>  	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> =20
> -	cancel_work_sync(&mhdp->modeset_retry_work);
> -	flush_work(&mhdp->hpd_work);
> +	mutex_destroy(&mhdp->base.mailbox_mutex);
>  	/* Ignoring mhdp->hdcp.check_work and mhdp->hdcp.prop_work here. */
>  }

[Severity: High]
This is a pre-existing issue, but are the HDCP work items intentionally left
uncancelled during driver removal?=20

Because they are ignored here, couldn't they remain queued or actively
executing after the mhdp structure is freed by devm cleanup, resulting in
a use-after-free?

> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/driver=
s/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> index 5cd0b873e16f9..1b5c90af63dee 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
[ ... ]
> @@ -170,98 +46,52 @@ static u8 cdns_mhdp_hdcp_handle_status(struct cdns_m=
hdp_device *mhdp,
[ ... ]
>  static int cdns_mhdp_hdcp_rx_id_valid(struct cdns_mhdp_device *mhdp,
>  				      u8 *recv_num, u8 *hdcp_rx_id)
>  {
>  	u8 rec_id_hdr[2];
> -	u8 status;
>  	int ret;
> =20
> -	mutex_lock(&mhdp->mbox_mutex);
> -	ret =3D cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
> -					    HDCP_TRAN_IS_REC_ID_VALID, 0, NULL);
[ ... ]
> +	ret =3D cdns_mhdp_secure_mailbox_send_recv_multi(&mhdp->base,
> +						       MB_MODULE_ID_HDCP_TX,
> +						       HDCP_TRAN_IS_REC_ID_VALID,
> +						       0, NULL,
> +						       HDCP_TRAN_IS_REC_ID_VALID,
> +						       sizeof(rec_id_hdr), rec_id_hdr,
> +						       0, hdcp_rx_id);
>  	if (ret)
> -		goto err_rx_id_valid;
> +		return ret;

[Severity: Critical]
This isn't a bug introduced by this patch, but does this pattern allow a
stack-based buffer overflow when parsing HDCP receiver IDs?=20

If the pointer passed to this function points to a fixed-size stack array,
and the mailbox helper relies on the receiver count from the external sink
to determine how many bytes to write, could a malicious or malfunctioning
sink returning a large receiver count write out of bounds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-dcss-hdmi-=
upstreaming-v23-0-5615524a9c63@oss.nxp.com?part=3D2
