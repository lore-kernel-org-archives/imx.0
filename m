Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBE03E00A0;
	Fri, 17 Jul 2026 11:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286843; cv=none; b=WXUPproOfxuVdi7c9/XWNpdlQ87oBai2fxWyo2eJpGZzc79F/Jp9Ait+Piaj7fZbNzldYtYiWhG4Hvs8hwXYuXaIQFCCTjGa0hkvZGSF2qtktF84Ee1zaUkCgeSXdiCHPBnB50oo12l0+c/ujUzU5iIGeDcdQ8ux2+xPqWXiJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286843; c=relaxed/simple;
	bh=sk0eOjiWfLdBO4dFoSZ82lj1PSQGh/il6Iq4os//iqw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ku4k4s1nBi06EA/QvTTxsKCAPSXZsl1NgTHfknb7XXfupSHLoMI0L0aMcWJXnNlkopsKiAifhi+dQrwZPCANUy75Jv6UtlSDpPiL9U6wzKFRqBfu4CiGJIq4GzeZkxTZ4KLIhem3IqFnieEbatCUlLVaEgWoAGwUUHz8uEkxJtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwCYzx5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwCYzx5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5471F000E9;
	Fri, 17 Jul 2026 11:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286833;
	bh=N1P3tm+3viukU6o7pAXegXS21/+qzlmGV14II2fwkHw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LwCYzx5DcuDukHCBlVc9k3CbrhFVy+n0N4vYBCkLCiIjCPqqG3hJnZF/4kupEmVBv
	 xB+K72FqwXrgxPPoOb4C6tUVjAWJDtxl1W8I4ajkSjjENAXL4fOLhMYeZ+omJBuPwm
	 /xuZ9Ot46UF0DemPmWa63TTjRs75jFZhQ6PkUgHegqzYzlxx3YOLw855D6PgeXXaNo
	 VwA5JoR8ZH6dsR5YJ6u4pqS5dhSwxcfHErbRz3IWFACFMFHMdyEDQIygmLTMMDjCG5
	 wCAaJ8s+psDL/Q11jEbo/EK0l5ybx0o+JIJKaDjpTxUgQb+Y5V3ehiKYCrDsMoqyRM
	 qF55H46IzbAaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v28 4/7] firmware: imx: device context dedicated to priv
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260717-imx-se-if-v28-4-0a9659c7e69d@nxp.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
 <20260717-imx-se-if-v28-4-0a9659c7e69d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 11:13:53 +0000
Message-Id: <20260717111353.7D5471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Data race in `ele_msg_send_rcv()` when initializing `waiting_rsp_c=
lbk_hdl` state, leading to a potential NULL pointer dereference in the RX i=
nterrupt handler.
- [Low] Unused variable `flags` in `ele_msg_send_rcv()`.
--

--- Patch [4]: [PATCH v28 4/7] firmware: imx: device context dedicated to p=
riv ---
commit 64e554919e156aa88c2007ef9dd9fafde735e583
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: device context dedicated to priv

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW. No functionality change.

Closes: https://sashiko.dev/#/patchset/20260715-imx-se-if-v27-0-bb7c45952f0=
6@nxp.com?part=3D4

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index ca8a32a82689b..1ca22c53b55c4 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> @@ -149,34 +151,38 @@ static void ele_msg_send_rcv_cleanup(struct se_if_p=
riv *priv)
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
> +	priv->waiting_rsp_clbk_hdl.dev_ctx =3D NULL;
>  	priv->waiting_rsp_clbk_hdl.rx_msg =3D NULL;
>  	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D 0;
>  	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
>  }
> =20
>  /* API used for send/receive blocking call. */
> -int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> -		     void *rx_msg, int exp_rx_msg_sz)
> +int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
> +		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
>  {
> +	struct se_if_priv *priv =3D dev_ctx->priv;
> +	unsigned long flags;

[Severity: Low]
Is this flags variable used anywhere in this function?

It appears to be declared but never utilized in the function scope, which
will trigger a -Wunused-variable compiler warning.

>  	int err;
> =20
>  	guard(mutex)(&priv->se_if_cmd_lock);
> =20
>  	if (atomic_read(&priv->fw_busy)) {
> -		dev_dbg(priv->dev, "ELE became unresponsive.\n");
> +		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
>  		return -EBUSY;
>  	}
>  	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
> +	priv->waiting_rsp_clbk_hdl.dev_ctx =3D dev_ctx;
>  	priv->waiting_rsp_clbk_hdl.rx_msg_sz =3D exp_rx_msg_sz;
>  	priv->waiting_rsp_clbk_hdl.rx_msg =3D rx_msg;

[Severity: High]
Could these lockless updates result in a data race with the interrupt
handler?

They are updated here without acquiring clbk_rx_lock. If a delayed firmware
response from a previous command arrives concurrently, the interrupt handler
se_if_rx_callback() will execute.

Due to CPU reordering or compiler optimizations, can the interrupt handler
observe the new rx_msg pointer before the new dev_ctx pointer becomes
visible?

> -	err =3D ele_msg_send(priv, tx_msg, tx_msg_sz);
> +	err =3D ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);

[ ... ]

> @@ -302,8 +310,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, v=
oid *msg)
>  			dev_info(dev, "ELE responded (late), recovery FW available.");
>  			return;
>  		}
> -		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
> -			*(u32 *)header);
> +		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
> +			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);

If the interrupt handler sees a non-NULL rx_msg, it assumes the transaction
is active and attempts to access se_clbk_hdl->dev_ctx->devname here. If
dev_ctx is still NULL from the previous cleanup, won't this result in a NULL
pointer dereference?

> =20
>  		/*
>  		 * For rsp_tag traffic, the sender provides the expected response

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-imx-se-if-=
v28-0-0a9659c7e69d@nxp.com?part=3D4
