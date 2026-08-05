Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C99470456;
	Wed,  5 Aug 2026 16:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946978; cv=none; b=sWRio2TVEk0Vf9PPAfG0LhlVvUCV+WQI8shX+NDZFsu+3U7OE+N1qyuDJo/UFS5+8mCsmUcdocOMieDTE5wMv4rL+TFL/LAYGDkCBzQKZUhmye7AvSM3MDi1VqoBBjX+zv5k0OvYYtA9DrxDDWoi3xZhuGF7upfwdyVqDBYhNsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946978; c=relaxed/simple;
	bh=sSxRkCI/vpwkf7qc3sAiCOSsSzvxIBGJANbm8X92naU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=psYA4oiKj6nqB7dYH6C48C9W0yWn1Db7qSEgSoZ0A1p0um03DLwV3ecXHao6OlkHVu/UBUvrfWDOYV2tqM/gP2dmhAp6zsSw49/dK57y8TCkl6gCSdcdkOTfhZS03eKj0sRDML6yRnq6O7uuEPLWqRVY5lrSJEZaX6xNA6X1QmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQoJ3HEb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQoJ3HEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BFC1F000E9;
	Wed,  5 Aug 2026 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785946976;
	bh=fo+tlBHh1gyxjoeF7FLSbq/47DdX7/pYd56Hve3pYdo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aQoJ3HEbxQ8M+Skp6vDRMimutSBBkzshdMg6uejLRocLPjuDScN/Y+iMMP3IQ2PxM
	 hJOEYd/NbggPhT1aFaOzOu0L28jcQBVDJt1LwoX3TeJYTK5zrB/Z8OzczQf3LRM1nC
	 S6FlWSq/G1JfHHc/yWVK706oDyyHu43yxqHeL5H5jTUHTjiWPP7cXTpX7gSEwmAeh/
	 2JPF37q1eopgmlt1buIu3bhTasSgCB5rLez7mb/xFfPHvxX0QvQYCeBw3yCGXprE10
	 UgIKzDfAju56WlQtscTcSDOLih6FvkcFJFDmQGzQZ8VXPpVJOZAaa0S3zFgz7gx6AB
	 TPrzgnNSyaDRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v34 4/7] firmware: imx: device context dedicated to priv
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260805-imx-se-if-v34-4-7e4713d14e0a@nxp.com>
References: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
 <20260805-imx-se-if-v34-4-7e4713d14e0a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 16:22:55 +0000
Message-Id: <20260805162256.59BFC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] In `ele_get_info()`, a physical DMA buffer (`get_info_data`) is al=
located and mapped for the firmware to write its response. If the firmware =
takes too long to respond, `ele_msg_send_rcv()` times out and returns `-ETI=
MEDOUT`, setting the firmware state to busy. However, on this error path, `=
ele_get_info()` calls `ele_get_info_cleanup()`, which unconditionally frees=
 the DMA buffer (via `dma_free_coherent()` or `gen_pool_free()`). Because t=
he firmware may still be processing the command, it could eventually finish=
 and write its response to the now-freed physical address, leading to a DMA=
 Use-After-Free that corrupts memory. The buffer must be quarantined (leake=
d) if the firmware is unresponsive.
--

--- Patch [4]: [PATCH v34 4/7] firmware: imx: device context dedicated to p=
riv ---
commit c0e62ad2fda653db9c2508807fbec3d62a1f2511
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: device context dedicated to priv

This patch adds a private device context to se_if_priv to prepare for
misc-device context-based send-receive paths. It updates several firmware
message passing functions to take the new priv_dev_ctx instead of the
top-level priv structure.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -71,8 +71,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_de=
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
>  		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
>  		return ret;

[Severity: High]
If ele_msg_send_rcv() times out and returns -ETIMEDOUT, the firmware state =
is
marked as busy, but this error path calls ele_get_info_cleanup() which
unconditionally frees the DMA buffer get_info_data:

ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_addr_t d_addr,
				 size_t size)
{
	if (priv->mem_pool)
		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
	else
		dma_free_coherent(priv->dev, size, buf, d_addr);
}

If the firmware is just slow and later completes the command, will it write
its response into this now-freed physical address, causing a DMA
use-after-free and memory corruption?

Should this buffer be quarantined instead of freed when the firmware is
unresponsive?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx-se-if-=
v34-0-7e4713d14e0a@nxp.com?part=3D4
