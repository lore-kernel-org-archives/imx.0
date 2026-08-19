Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9747B39FCCA;
	Wed, 19 Aug 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146259; cv=none; b=RABax3mzmeQLngPlqr8BSVKaDSNTAPJZzjCzI37HEW/lzrUMQ9zwg/9PeVNe4WREIQJED5JTCOK0zaGmQkN2ZzrvLXdKNAaA6LcdNxBQrZ+KqYRwdzjmYiS3+gjkRQ9s0FUh6BbmBcrl+VFEo1VY9I80gwxgKOBovAphrYeal68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146259; c=relaxed/simple;
	bh=y/jJ5U0R6J7cJczSLfMK3MdiUkuUebU7Efovw4M05P4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JfxJoJ7+vD9/sBWzPIrG9hFQa4+9WY2ydmU8s5BjLMajtwZsW51sdXb8CXL8u/XypN6Zb4foxiFiyFt37juxUAMrsmTgDzIUQKvkI7dqsA8vmDS/dZLRaVz2EGIu6Ww9i8IoA3YslUz+1wTHffWi8Rwvon/sEji++7I2sDv2yNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpxjezD9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpxjezD9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0481F00A3A;
	Wed, 19 Aug 2026 13:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787146255;
	bh=m4mKzPN+FWk1tWjJ74S3scto91jfZ2ZuFlDYXqOX/4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gpxjezD9AovAB1sA7Zvo8m+V+2CLDuYXJxln0j5QDvUCfgdwOYWaJyPIz4a+cTnig
	 9bUMpXer420RW5OGLiCbKYkNCRWAJGWEbokj3+gqLmpStPcLAZ58Rx6lzDj7h4KMQj
	 +pAcuRbLItXPhiCpfBhLAha+J1/RmENjpFgiSpxsa1ZYnToDxRs2I4Q4MhQtrOfOU3
	 03RBtOQMbia2WYEYbkYEitmOHquX7Qy0Mc7Rsodfrb8Tk46jkHk15xPP1fXbMZvM2w
	 nGYqASIGphfki5V4B7URVeLfb/VlJPWeTQdaH6sEsOFuJHPaUMoVQwBJ0oW29a5jkZ
	 7yWZxxAUUqkQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v38 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260820-imx-se-if-v38-3-5df4a4cff736@nxp.com>
References: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
 <20260820-imx-se-if-v38-3-5df4a4cff736@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:30:55 +0000
Message-Id: <20260819133055.9B0481F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] DMA use-after-free on firmware timeout in `ele_get_info()` and dri=
ver unbind.
- [Medium] `se_resume()` ignores the failure of `se_restore_imem_state()`, =
breaking expected power management error handling semantics.
- [Low] Incorrect iteration bound computation in `ele_debug_dump` leads to =
reading past the received payload.
--

--- Patch [3]: [PATCH v38 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit b60827d987987a5036c02b256c938fa4f0af210a
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave on i.MX SoC(s).
The secure enclave FW communicates with Linux over single or multiple
dedicated messaging unit(MU) based interface(s).

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> index 0000000000000..724f6e913ce79 100644
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.c

[ ... ]

> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> +{

[ ... ]

> +	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
> +			       ELE_GET_INFO_RSP_MSG_SZ);
> +	if (ret < 0) {
> +		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);

[Severity: High]
If an enclave command times out, ele_msg_send_rcv() returns -ETIMEDOUT and
the error path immediately calls ele_get_info_cleanup(), which frees the DMA
buffer. If the firmware is still executing and completes the transaction
later, could it perform a DMA write into physical memory that has been
reallocated to another subsystem?

> +		return ret;
> +	}

[ ... ]

> +int ele_debug_dump(struct se_if_priv *priv)
> +{

[ ... ]

> +		rx_msg->header.size -=3D 2;
> +
> +		if (rx_msg->header.size > 2)
> +			rx_msg->header.size--;
> +
> +		for (i =3D 0; i < rx_msg->header.size; i +=3D 2)
> +			dev_info(priv->dev, "%s%02x_%02x: 0x%08x 0x%08x",
> +				 FW_DBG_DUMP_FIXED_STR,	msg_ex_cnt, i,
> +				 rx_msg->data[i + 1], rx_msg->data[i + 2]);

[Severity: Low]
Does this loop read past the actual message payload length? If the firmware
returns an odd number of payload words, the remaining size is not even. The
loop body would execute when exactly 1 word remains but print both
rx_msg->data[i + 1] and rx_msg->data[i + 2].

> +
> +		msg_ex_cnt++;
> +	} while (keep_logging);
> +
> +	return ret;
> +}

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 0000000000000..53091cc37e7e0 100644
> --- /dev/null
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> +static void se_if_probe_cleanup(void *plat_dev)
> +{
> +	struct platform_device *pdev =3D plat_dev;
> +	struct device *dev =3D &pdev->dev;
> +	struct se_if_priv *priv;
> +
> +	priv =3D dev_get_drvdata(dev);
> +	if (!priv)
> +		return;
> +
> +	if (priv->rx_chan)
> +		mbox_free_channel(priv->rx_chan);
> +	if (priv->tx_chan)
> +		mbox_free_channel(priv->tx_chan);
> +
> +	/*
> +	 * Being device managed buffer, no need to free the buffer allocated
> +	 * in se probe to store encrypted IMEM.
> +	 */
> +
> +	/*
> +	 * No need to check, if reserved memory is allocated
> +	 * before calling for its release. Or clearing the
> +	 * un-set bit.
> +	 */
> +	of_reserved_mem_device_release(dev);
> +
> +	dev_set_drvdata(dev, NULL);
> +
> +	kfree(priv);

[Severity: High]
Similarly, does this teardown path free device-managed DMA memory without
waiting for or aborting a potentially busy firmware transaction?

> +}

[ ... ]

> +static int se_resume(struct device *dev)
> +{
> +	struct se_if_priv *priv =3D dev_get_drvdata(dev);
> +	struct se_fw_load_info *load_fw;
> +	int ret =3D 0;
> +
> +	load_fw =3D get_load_fw_instance(priv);
> +
> +	if (load_fw->imem_mgmt) {
> +		ret =3D se_restore_imem_state(priv, &load_fw->imem);
> +		if (ret)
> +			dev_warn(dev, "Failure restoring IMEM state[0x%x]", ret);
> +	}
> +
> +	return 0;

[Severity: Medium]
Should this return the actual error instead of 0? se_restore_imem_state()
documents that it returns -EIO so the PM subsystem knows the enclave is
non-functional after resume, but the failure is caught here and 0 is
unconditionally returned, breaking the expected power management error
handling semantics.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-imx-se-if-=
v38-0-5df4a4cff736@nxp.com?part=3D3
