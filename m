Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6498B1FE47B;
	Fri, 24 Jul 2026 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784881833; cv=none; b=LA4REcv458C/u3o9+OI95EtlQfvlxtgnJM8wTiTb8aH8lxLQM8vLQSKtHgF/KysBy/aaPiX8PD7xUwjfDa2P/7/1ZnIcND3lNXvbrTa7IfVWUpeZtdxZcBTxMRlOvstuJ76lmCOhigmL+tB0UatqW9hER0YotiOc/+dxCgINyds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784881833; c=relaxed/simple;
	bh=Cgg3i4K1GJ3+avHhiquNja+snU+P7TXaeDn5yc9hSKY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FIbUEEaMCS1RDhdwxpfwuhdnJKtMn9TQhujOuTmnUgXcvJBoWqjEE7yN1r97kcNfihXPIMaxDCjOjYJMrBAt05YWqqspkwFnFatADfKkTZcdVzBD1jRbd64YZ3UbVB/ztv97Qlgfs+0dnQlG6bs2GOuSJ6pSErDb1Fz/7v54syI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzzDbBnC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzzDbBnC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 017E91F000E9;
	Fri, 24 Jul 2026 08:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784881829;
	bh=bkTsWMfD2dwRdIfCSHL5coMuyl2wKJZlQasiaAZskW0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HzzDbBnCdJ7XWYW3s4Vm6Xf33vxG78nis233/873cwIf+3m5pDJYc/h3r3c7DFhrk
	 D6DpLXNjTDAwngV+FMoUJT77un2OLGgZmYOyCRwldg/jisYPJfPBV/osuyVFcg2aYQ
	 nvVcPwzp++MnYpm/xkB9Z5enXoUrAvoKh63eHaR60kKbQODg990dro8qP8wxnNOZib
	 ELN7kwNpQXMgNB42PTVJOS2aWVY2hEgKvzNiOJwqOZWB8HACshqxK55cz4JoFIl+S9
	 HabzJvaLwZhC1sTAJ8GRfo87u9EmCxWiRV6Ktin1vVrp+3uiyFehiePf5y4GGFhBp/
	 G6r3G09nPb/XQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v30 4/7] firmware: imx: device context dedicated to priv
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260724-imx-se-if-v30-4-ce8ba256692c@nxp.com>
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
 <20260724-imx-se-if-v30-4-ce8ba256692c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:30:28 +0000
Message-Id: <20260724083029.017E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The newly introduced `priv_dev_ctx` and its `devname` string are=
 dynamically allocated but never freed on probe failure or device unbind, l=
eading to a permanent memory leak.

Pre-existing issues:
- [Critical] DMA buffer is freed unconditionally on timeout while the hardw=
are may still be processing the command, leading to use-after-free and DMA =
memory corruption.
--

--- Patch [4]: [PATCH v30 4/7] firmware: imx: device context dedicated to p=
riv ---
commit 12d4f3d474262e1d23dd156bdd3a71ae735f6977
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: device context dedicated to priv

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index a2ede9c01691d..524ebc0f697e6 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -66,8 +66,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_de=
v_info *s_info)
>  	tx_msg->data[0] =3D upper_32_bits(get_info_addr);
>  	tx_msg->data[1] =3D lower_32_bits(get_info_addr);
>  	tx_msg->data[2] =3D sizeof(*s_info);
> -	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
> -			       ELE_GET_INFO_RSP_MSG_SZ);
> +
> +	ret =3D ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_M=
SG_SZ,
> +			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
>  	if (ret < 0) {
>  		ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_=
BUFF_SZ);
>  		return ret;
>  	}

[Severity: Critical]
This is a pre-existing issue, but does this error path free the DMA buffer
while the hardware might still be active?

If ele_msg_send_rcv() times out, it returns -ETIMEDOUT and trips the fw_busy
circuit breaker. However, this error path unconditionally calls
ele_get_info_cleanup(), which releases the DMA buffer back to the system:

static void ele_get_info_cleanup(...)
{
	if (priv->mem_pool)
		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
	else
		dma_free_coherent(priv->dev, size, buf, d_addr);
}

If the firmware is merely slow and eventually processes the command, won't =
it
execute a delayed DMA write to the freed physical address, potentially
corrupting whatever kernel memory is subsequently mapped there?

[ ... ]

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index e9e2f48f4f71f..b053dd00286c8 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -411,6 +441,12 @@ static int se_if_probe(struct platform_device *pdev)
>  		load_fw->is_fw_tobe_loaded =3D true;
>  	}
> =20
> +	ret =3D init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed[0x%x] to create device contexts.",
> +				     ret);
> +

[Severity: Medium]
Will this leak the newly allocated priv->priv_dev_ctx and its devname string
on probe failure or device unbind?

The init_misc_device_context() function dynamically allocates these resourc=
es
using non-devm kzalloc_obj() and kasprintf(). However, if probe fails at a
later step or the device is unbound, the devres-managed cleanup function
se_if_probe_cleanup() only frees priv and misses the context:

static void se_if_probe_cleanup(void *context)
{
	...
	if (priv->tx_chan)
		mbox_free_channel(priv->tx_chan);

	dev_set_drvdata(dev, NULL);

	kfree(priv);
}

Should the cleanup function be updated to also free priv->priv_dev_ctx and
its devname to avoid a permanent memory leak?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-imx-se-if-=
v30-0-ce8ba256692c@nxp.com?part=3D4
