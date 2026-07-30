Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA1437475C;
	Thu, 30 Jul 2026 02:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378428; cv=none; b=ISaKIAPr6QxPcu6SLHYNacK9nVwRpRvhRy+ozL1UA6LwL5jv7XrRRuANnjhpXK2RDu1KcuioNnJmKuyK5rouWraG9wWNRaqqfK4/1hV2/POv0HhMaaH3IFLVaZDHES0hwXC30znuW64TTifD/gyVncSPWkaq9rMfgQxUZoVHzS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378428; c=relaxed/simple;
	bh=ucF37PuxDjtDarj4nGsqVd90e657DDTe0vDBbjFa8nM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l7m230UqPaNyOqtiuiM/G0YOcmw/acPRZdaFgWOXui1ByWYWXdmznywsNx3rcJPF1V04Jr6lFuYbXFaoQtQZfpkW4FHqiaDlXOdiNtvnfrP1+y3olsgiUqau4RmLEuQ1cRFAO+oT6NRU+BK0MLqOG86m/Zv6Kk7UYqYN6dRbmeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIEwwtE9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIEwwtE9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AE91F000E9;
	Thu, 30 Jul 2026 02:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785378426;
	bh=PzwI2dSz1vlPWv2Q3x3tTn0YOFhV0qODZFEeoVAXpU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aIEwwtE9kh5Yd/Hp1xSROlErOB1gE7I9tjuQk6AJbEAPHMh7NwNFI1LZjtdfedpLK
	 xroMGsqpKxhZz2kAUNUP5FXuGYyfIH99i3cSeUn0Gcw7yW8ACj+itsuipNuhrtMQVq
	 LeDPQPYq0rvbwAxj9h1PNrthSyKBgPJDdEr0vYrfkF32tSxUotZigm7w6IKtPfXkSg
	 TkNGokzwYyYoKdSgM5v/jt80mYvB8+BULDV9wFWDt5K7ntfAwVSjdw3fYJfjslixDa
	 Q3j+E7e7JUvo+VYGpj/FJdheczb8W+4xXbDSXWiXznG/nRmMNtyMhuyQ9b2rHvcdsh
	 yr7Y1gtKaRYCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v32 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-imx-se-if-v32-3-95f56dff4ba9@nxp.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
 <20260730-imx-se-if-v32-3-95f56dff4ba9@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 02:27:05 +0000
Message-Id: <20260730022706.41AE91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Freeing the DMA buffer on timeout in `ele_get_info` allows the fir=
mware to corrupt memory if it completes the transaction late.
- [High] A time-of-check to time-of-use (TOCTOU) race on the volatile `jiff=
ies` variable can cause an arithmetic underflow, leading to an infinite wai=
t.
--

--- Patch [3]: [PATCH v32 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit a0eb4a58fa2ae5b51f82478e8f3c91165237467e
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave. NXP hardware
IP(s) for secure-enclaves like Edgelock Enclave(ELE), are embedded in the
SoC to support features like HSM, SHE & V2X using message based
communication interface.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 0000000000000..724f6e913ce79 100644
> --- a/drivers/firmware/imx/ele_base_msg.c
> +++ b/drivers/firmware/imx/ele_base_msg.c

[ ... ]

> @@ -65,15 +65,15 @@ int ele_get_info(struct se_if_priv *priv, struct ele_=
dev_info *s_info)
>  	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
>  			    ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ, true);
> =20
>  	tx_msg->data[0] =3D upper_32_bits(get_info_addr);
>  	tx_msg->data[1] =3D lower_32_bits(get_info_addr);
>  	tx_msg->data[2] =3D sizeof(*s_info);
>  	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
>  			       ELE_GET_INFO_RSP_MSG_SZ);
>  	if (ret < 0) {
>  		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^

[Severity: High]
If the transaction times out and ele_msg_send_rcv() returns -ETIMEDOUT, does
freeing the DMA buffer here risk memory corruption?

The commit message mentions that "DMA free on timeout: -ETIMEDOUT means FW =
is
fenced by fw_busy, so the free is safe", but while fw_busy prevents the host
from sending new commands, it does not stop the firmware from finishing the
current command late and writing to the DMA address.

If the buffer is freed and reallocated elsewhere, a late DMA write could
silently corrupt memory.

>  		return ret;
>  	}
> =20
>  	ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
>  				      ELE_GET_INFO_RSP_MSG_SZ, true);

[ ... ]

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index 0000000000000..f40eb4a07982d 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> @@ -61,16 +61,16 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_cl=
bk_handle *se_clbk_hdl)
> =20
>  	do {
>  		if (is_rsp_wait_with_timeout) {
>  			if (time_after_eq(jiffies, deadline_jiffies)) {
>  				/* Deadline hit: fence hung FW, like the ret=3D=3D0 path. */
>  				spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
>  				se_clbk_hdl->rx_msg =3D NULL;
>  				if (!completion_done(&se_clbk_hdl->done))
>  					atomic_set(&priv->fw_busy, 1);
>  				spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>  				ret =3D -ETIMEDOUT;
>  				break;
>  			}
>  			remaining_jiffies =3D deadline_jiffies - jiffies;
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
Since jiffies is volatile, the compiler will read it again here after the
time_after_eq() check. If a timer tick increments jiffies exactly between t=
hese
two reads, could this subtraction underflow?

An underflow would result in a massive timeout value near ULONG_MAX being
passed to the completion wait functions below, hanging the thread indefinit=
ely.

>  		}
> =20
>  		if (wait_uninterruptible)
>  			ret =3D wait_for_completion_timeout(&se_clbk_hdl->done,
>  							  remaining_jiffies);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-imx-se-if-=
v32-0-95f56dff4ba9@nxp.com?part=3D3
