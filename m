Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0E72FDC57;
	Wed, 15 Jul 2026 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136892; cv=none; b=bJHeafFt39nYu85/GSoj+ry1q0Cs5T6WM515ZRnykE4fbRR/F7Nhkhd90hLKrbg67IMLNtBQ0iHvvWr/m+dBHcb6MUAGG0JmySzuucC/Ud/FmzTkOU0tNbRja52tpBWvh+LzaH2rz7cbbUw17iqK8JZZeUYDAMlD48qaombR22Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136892; c=relaxed/simple;
	bh=1pTOA6Jym4wnVHT1ey217anKcmiTebjItCrHO6RscFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XpOQwRI3+2caYA9qOKO8BFfmnnufBEk0uWJJGvQXjMu9kEngwTJxXQgap1cB3ubUsyVeaZ4iMrM2IyZ2FVuxw3LLOThW4ZavliyAJ2dFj0HTThOjqZygK2yrzwe73dW7XZlrJhhn9eICxnv8dqtfRvFFsxkUPVNDEPXwyIdZ0g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NOi+0CNB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NOi+0CNB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A2E1F000E9;
	Wed, 15 Jul 2026 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784136891;
	bh=q2lFOBoVeyZXtfjN7AmxhJlx/71zTxhzZgR4CKtSpn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NOi+0CNBS0CnB8zmBTnMZQICkf0QlElRNr3EAOTPsjmd7y5nxyMMhNCZcUpXkrfzY
	 UMrDskeLDLl4Hh+BoK0ZHZYxzWedY0zxh4PIwg4PSvKJjqq2LkeZg8DP+4EoBS+d5q
	 3hwBFHCm8UKq6XX0m6+Ut+oDHRBM/o1hNpMGx26UMix2bi7IMOfGj2NTywkYIaiFb+
	 95YA0CRV6bJgHPKNTZJM5LEqjYs1eknRcmRtkdrNmDNYJrTSu/b9U2sotYwLbzX/mM
	 NZGqcFeEOZ94B61aF1CQxjgpzAEPWMhol0AB1n9ValEwsTitT/KC2QgKQZlOyvCw6A
	 A3K/0KqXhOBNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v27 4/7] firmware: imx: device context dedicated to priv
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260715-imx-se-if-v27-4-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
 <20260715-imx-se-if-v27-4-bb7c45952f06@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 17:34:49 +0000
Message-Id: <20260715173450.80A2E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] `init_misc_device_context()` unconditionally returns `-ENOMEM` on =
the success path, causing device probe to always fail.
- [High] Concurrent execution and lock dropping between `ele_msg_send_rcv` =
and `se_if_rx_callback` causes a NULL pointer dereference on `dev_ctx`.
--

--- Patch [4]: [PATCH v27 4/7] firmware: imx: device context dedicated to p=
riv ---
commit 161a8ae1e5c289f19271beb8c2724ea2a799027b
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: device context dedicated to priv

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW. No functionality change.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 3f5f78df49b52..955b7409ff9fc 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> @@ -167,11 +171,13 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void =
*tx_msg, int tx_msg_sz,
>  		if (err > 0)
>  			err =3D -ERESTARTSYS;
>  		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> -		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
> +			dev_ctx->devname, err);
>  	}
> =20
>  clear_waiter:
>  	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
> +	priv->waiting_rsp_clbk_hdl.dev_ctx =3D NULL;
>  	priv->waiting_rsp_clbk_hdl.rx_msg =3D NULL;
>  	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D 0;
>  	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);

[ ... ]

> @@ -305,8 +311,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, v=
oid *msg)
> =20
>  		if (sz_mismatch)
>  			dev_err(dev,
> -				"Rsp to CMD: hdr(0x%x) with different sz(%d !=3D %d).\n",
> -				*(u32 *)header,
> +				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d !=3D %d).\n",
> +				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,

[Severity: High]
Can this result in a NULL pointer dereference if the awakened thread clears
the context?

In se_if_rx_callback(), complete() is called and the lock is dropped right
before checking sz_mismatch:

    complete(&se_clbk_hdl->done);
    spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);

This wakes up ele_msg_send_rcv() which proceeds to the clear_waiter
cleanup path:

    priv->waiting_rsp_clbk_hdl.dev_ctx =3D NULL;

If the awakened thread clears dev_ctx before the dev_err() is executed,
will accessing se_clbk_hdl->dev_ctx->devname here crash the kernel?

>  				(header->size << 2), exp_rx_msg_sz);
>  	} else {
>  		dev_err(dev, "Failed to select a device for message: %.8x\n",

[ ... ]

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 7cb98a373334b..25f9cd5441f90 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> @@ -197,6 +197,36 @@ static int get_se_soc_info(struct se_if_priv *priv, =
const struct se_soc_info *se
>  	return 0;
>  }
> =20
> +static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
> +				    struct se_if_device_ctx **new_dev_ctx)
> +{
> +	const char *err_str =3D "Failed to allocate memory";
> +	struct se_if_device_ctx *dev_ctx;
> +	int ret =3D -ENOMEM;
> +
> +	dev_ctx =3D kzalloc_obj(*dev_ctx, GFP_KERNEL);
> +
> +	if (!dev_ctx)
> +		return ret;
> +
> +	dev_ctx->devname =3D kasprintf(GFP_KERNEL, "%s0_ch%d",
> +				     get_se_if_name(priv->if_defs->se_if_type),
> +				     ch_id);
> +	if (!dev_ctx->devname)
> +		goto exit;
> +
> +	dev_ctx->priv =3D priv;
> +	*new_dev_ctx =3D dev_ctx;
> +
> +	return ret;

[Severity: High]
Does this code always fail and cause the probe to abort?

The ret variable is initialized to -ENOMEM at the top of the function but is
never set to 0 on the success path. When se_if_probe() calls this function,
will it always receive an error and abort the driver initialization?

> +exit:
> +	*new_dev_ctx =3D NULL;
> +
> +	kfree(dev_ctx->devname);
> +	kfree(dev_ctx);
> +	return dev_err_probe(priv->dev, ret, "%s", err_str);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx-se-if-=
v27-0-bb7c45952f06@nxp.com?part=3D4
