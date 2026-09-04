Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872EC40F754;
	Fri,  4 Sep 2026 06:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504077; cv=none; b=YKrFZ+oorTuLvxVk3Aa+jlpMnaLd8knbZeZuGm0K74aCXGih3w7H6ta/RNMClV2ngLxJWuuAqsJZ2pC75LUN9lZyYdBwR7Q8AT4WviWz4savVfcaenzLb3mGlSitmADZ1+uwe1x/gtCD7CYCeNue6UUJ0QdkosrwDb1+Qq2CkMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504077; c=relaxed/simple;
	bh=5kEHQOg+N2xSMeM0JhW7jAmvD/mPqet9frkbhBmF2Gs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=le7LEEOmTdY4ztuuJ37mO3DY3BeB/mct03PZOSh0BbZQVOUkDfoc5JWMgRBilSVyfxJboWFXfSUcbS3oBmcDQ+hGaloi8pV1d5Gg0oNUCfQGdAdfxHLOz862rg5qJH0nGx6tfvz3x7WQwY49oNaP0DUJJcv3saN7gc83+VgBI9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Prr7O9l/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Prr7O9l/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064291F00A3D;
	Fri,  4 Sep 2026 06:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788504076;
	bh=RVY+19Z2JPI/cL5hV85jJMpK0OHq6bslYqiq/FT5phU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Prr7O9l/RB4X9WEIVlrJgMftFLB0B0pjiZuYKJUdjLN79ZtC7IiSv9UV0DQuf1bzV
	 MUuby5u7I4v/gt93rR5OpdVLOYJWM+eFYvnBqpOYrXry5n2GSFsS9Jka5frTcngQYX
	 QTOIMUL+vzSlxtuXENlbFWdxoUXsM9YUzT5YiXLCRNiOn7VEep2zI5GaDyWUq2P/vw
	 spE5GxnjoavaOwclqYeYbAlF7SzBICrf8lSUi1pRVOC9adBuVk/uYp5s2ZtjqR0/To
	 wa+pnY0FZ8d1b2gK4LOAxfMUPMX5Xboq+r9vWvw//uOaAYgFwHlixF5xjtHw8ImWrZ
	 U+AWYCFsORgeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v47 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260904-imx-se-if-v47-5-b474ec6fc52a@nxp.com>
References: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
 <20260904-imx-se-if-v47-5-b474ec6fc52a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 06:41:15 +0000
Message-Id: <20260904064116.064291F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Calling `of_reserved_mem_device_release` in `se_if_priv_release` c=
auses DMA configuration corruption on driver rebind.
- [High] Use-after-free of `priv_dev_ctx` and its `fops_lock` because `se_i=
f_priv_release` frees the context before cancelling `fw_busy_work`.
- [High] Worker thread deadlocks in `cancel_work_sync()` when dropping the =
last reference to `priv` from `fw_busy_work`.
--

commit bc99ed23fb598115b62de87b975cb028e61b4bab
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: adds miscdev

This commit adds the driver for communication with the secure-enclave,
enabling message exchange from user-space applications via a character
driver. It includes various checks on incoming message headers to block
invalid commands.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> +static void se_if_priv_release(struct kref *kref)
> +{
> +	struct se_if_priv *priv =3D container_of(kref, struct se_if_priv, refco=
unt);
> +
> +	/* Free priv_dev_ctx if it exists */
> +	if (priv->priv_dev_ctx) {

[ ... ]

> +		kfree(priv->priv_dev_ctx->devname);
> +		kfree(priv->priv_dev_ctx);
> +		priv->priv_dev_ctx =3D NULL;
> +	}
> +	/*
> +	 * No need to check, if reserved memory is allocated
> +	 * before calling for its release. Or clearing the
> +	 * un-set bit.
> +	 */
> +	of_reserved_mem_device_release(priv->dev);

[Severity: High]
Is it safe to release the DMA configuration from the shared platform device
here?

If an unprivileged userspace process keeps the device file descriptor open,
it holds a reference to the priv object. If the device is unbound and then
rebound via sysfs, the new driver instance will initialize its DMA memory
region via of_reserved_mem_device_init().

When the userspace process eventually closes the old file descriptor, this
se_if_priv_release() function in drivers/firmware/imx/se_ctrl.c will execut=
e.
Since priv->dev still points to the shared underlying struct device singlet=
on,
calling of_reserved_mem_device_release() would drop the active DMA
configuration out from under the newly bound, active driver.

Could this lead to DMA allocation failures or memory corruption for the
active instance?

[ ... ]

> +	cancel_work_sync(&priv->fw_busy_work);

[Severity: High]
Does this cancellation sequence introduce a use-after-free and a deadlock?

If an internal command times out on priv_dev_ctx, it is marked busy and
fw_busy_work begins executing se_clear_fw_busy() on a worker thread. If the
device concurrently unbinds, se_if_probe_cleanup() drops the initial priv
refcount.

If no other file descriptors are open, se_if_priv_release() in=20
drivers/firmware/imx/se_ctrl.c runs and frees priv->priv_dev_ctx directly v=
ia
kfree() earlier in this function before calling cancel_work_sync() here. The
still-running worker thread will then try to acquire dev_ctx->fops_lock in
se_clear_fw_busy(), which was just freed, causing a use-after-free.

Additionally, if a userspace context times out and its file descriptor is
closed concurrently with device unbind, se_clear_fw_busy() drops the last
reference to dev_ctx. This invokes se_if_dev_ctx_release(), which drops the
last reference to priv, invoking se_if_priv_release() inline from the worker
thread. When it reaches cancel_work_sync() here, the worker thread will
synchronously wait for its own completion.

Could this structurally guaranteed deadlock be avoided by canceling the work
earlier, or by structuring the refcounts to prevent the worker thread from
triggering the final release?

> +
> +	/* Free any remaining resources that weren't devm-managed */
> +	kfree(priv);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-imx-se-if-=
v47-0-b474ec6fc52a@nxp.com?part=3D5
