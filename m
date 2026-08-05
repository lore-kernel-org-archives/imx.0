Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1429D3E51CB;
	Wed,  5 Aug 2026 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917775; cv=none; b=J7sqh/XYctcecj1Y9GGtepDKibItfQPiUeKhVgMP4KEY06wKOAUSaJUb/rUXJunjRyqnyPxj3Q88fHT00EoNrL/S4gsKqdPIryNoR/ed+EpHA2u1sl8bGayA+FHRzujBkuUTZ8tYsoVKTrS44LQejEWzc6k0w8tOGpE4MPa4+DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917775; c=relaxed/simple;
	bh=g8mfj+opxBUcGYL5VblKPnIQXg+nXQei9hiW3eu+rzA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G91Tlz7Qc1KkFYNsLCYSIMo8KdYBc1xPoPT6WoQQTZhd4U6afQi1j1302jU43uHChOTDZVgXxazNf2PqdsAGOFacw6hwPRS9b7bEizL8zZbuImI8RBai5VJDYHMQpLMtCucjUABt2NAcyt0aIDyoaSeLK0yh+GGZ9jRCcmbGbkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eng9k+qb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eng9k+qb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38D71F000E9;
	Wed,  5 Aug 2026 08:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917769;
	bh=+g6SGaSlzbqk/JVsyJgf4X5jgfMYsrVProw/FkkcDNs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eng9k+qbq+tiicu/A7ID63xn5c3UMK+gZTk/yw8gYGLeF4VCubDnmExJm9zMvfIor
	 ZbGH7/jD1NojBOp1s6jpVNk9LOPs5/sYT3H9dmorYlO9aJkp2ADK226P2sI2Rfx8DF
	 Nlf02b4z+1LcEXu0+hHGS3TUgn51b2t3HbZlzfA3McIBhtbWT863TG38S6nMJPdODd
	 JyTflDOa1l8MIUpMynbyVlVYNnrEsViademmAcBZaioZlA+9zxhvYKTUZ/y870S/yg
	 rVlBpcllf20IEg8uuJJGmXoo0cU2d6SW4ZzPNVJWSnrQfv4fhus6Xy4X0feBPLOZNs
	 UskKU6SVXY7VA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v33 4/7] firmware: imx: device context dedicated to priv
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260805-imx-se-if-v33-4-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
 <20260805-imx-se-if-v33-4-212e32ff0295@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 08:16:07 +0000
Message-Id: <20260805081608.F38D71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] DMA buffer UAF when `ele_msg_send_rcv()` times out in `ele_get=
_info()`.
--

--- Patch [4]: [PATCH v33 4/7] firmware: imx: device context dedicated to p=
riv ---
commit 27c9de28d615ebae1d88d019d8d364c4ca4999e1
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: device context dedicated to priv

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 724f6e913ce79..b70e3ef88a168 100644
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

[Severity: Critical]
Does this code risk a DMA use-after-free if the firmware command times out?

If ele_msg_send_rcv() times out and returns -ETIMEDOUT, the error path
calls ele_get_info_cleanup(), which frees the DMA buffer back to the system.

Since the firmware command was not aborted, if the firmware is delayed and
responds later, it may complete the operation and perform a DMA write of the
device info directly into the now-freed memory. This could cause silent mem=
ory
corruption of whichever subsystem reallocated the physical page.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx-se-if-=
v33-0-212e32ff0295@nxp.com?part=3D4
