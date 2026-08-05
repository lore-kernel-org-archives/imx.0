Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024EE3EBF16;
	Wed,  5 Aug 2026 08:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917362; cv=none; b=Qr/AVM4LsZd9aHrvH5OLMjreMOcgkDKiqRuKdGVSxZiAW0kt4UC/OiNI6f6EeeEIsLXf5NbaWRwXrSTdgUNckMGqhoifQkzalDXVYhhALOzMomeW2Gi8TSnzeSLi6uueugy4QEbfBayKFZB1luGILCw4TqdgmAr/8sTU8tnZS4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917362; c=relaxed/simple;
	bh=BaP5MQ2b8F1T71B/ahRWRTdp7D2yKiT7wHC4hMSKylQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kxGckG9K2PMCg9Dnpe54uexvLwd6vhxF0RF2kHQAzLn6jv/4mz686CX4ZxWivmwg7KTXvZo03e2DzaHwiuxuSmENWOwnSW4OhaL17RMLqxJJRSM1dJyrXa/6w7MHXYNmXIFmapfsbW/LYHvsbdRu7Oulo7W+pEGWOS/fXwfs57A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrgUjgFz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YrgUjgFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564DD1F000E9;
	Wed,  5 Aug 2026 08:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917353;
	bh=FfJYjS3Tgfd5knjKSrToEha/hbj3QAY/09GoUzGBNEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YrgUjgFz6IKH0TH8sihHHhES9NjadCrklLRbf0hzQQ7zGYXFV8QOHMaOIrkZUMh5v
	 rqVZhXPsoDjnzfoOEKG06De2lXxKveCdZ3WHuBP43NlflDexHoj5Q9EM4IM9DNNSlM
	 9NdnIxgT581t572Q2UPUXoRfxEoQKcP11tGNJKsrp4MQeqTeEFCepgg7d2LoYQ8/dD
	 BJd2XpzqDzDaFXLO6u8x8H/JvhC/FqTHF5iRuq7+sXE6DcZAL05KvRvs85Wpv5WtKW
	 41WGmn95glnBYsQt4Ipnc0jrX9SODJRZ8neWDWr22f8k3awDo54L2XsMW4gNhW//AN
	 m8ebOZV1RbOQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v33 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260805-imx-se-if-v33-3-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
 <20260805-imx-se-if-v33-3-212e32ff0295@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 08:09:12 +0000
Message-Id: <20260805080913.564DD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Freeing the DMA buffer in ele_get_info_cleanup() after a timeout c=
auses a DMA-after-free vulnerability, as the firmware may still be executin=
g and could write to the freed memory.
- [High] Using an interruptible wait in internal kernel transactions causes=
 false probe and suspend failures when signals are pending.
--

--- Patch [3]: [PATCH v33 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit 8655b5144179916d5552e9b237b931d4b3001788
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave.
The secure enclave FW communicates with Linux over single or multiple
dedicated messaging unit(MU) based interface(s). Existing on i.MX SoC(s)
like i.MX8ULP, i.MX93, i.MX95 etc.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> new file mode 100644
> index 0000000000000..724f6e913ce79
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -0,0 +1,282 @@

[ ... ]

> +static void ele_get_info_cleanup(struct se_if_priv *priv, u32 *buf, dma_=
addr_t d_addr,
> +				 size_t size)
> +{
> +	if (priv->mem_pool)
> +		gen_pool_free(priv->mem_pool, (unsigned long)buf, size);
> +	else
> +		dma_free_coherent(priv->dev, size, buf, d_addr);
> +}
> +
> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> +{

[ ... ]

> +	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
> +			       ELE_GET_INFO_RSP_MSG_SZ);
> +	if (ret < 0) {
> +		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);

[Severity: High]
If ele_msg_send_rcv() times out and returns -ETIMEDOUT, is it safe to
immediately free the DMA buffer by calling ele_get_info_cleanup()?=20

Since the external EdgeLock Enclave firmware is not halted on a timeout,
couldn't it eventually complete the transaction and write the response payl=
oad
into this freed memory, causing a DMA-after-free memory corruption?=20

> +		return ret;
> +	}
> +
> +	ret =3D se_val_rsp_hdr_n_status(priv, rx_msg, ELE_GET_INFO_REQ,
> +				      ELE_GET_INFO_RSP_MSG_SZ, true);
> +	if (ret < 0) {
> +		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
> +		return ret;
> +	}

[ ... ]

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> new file mode 100644
> index 0000000000000..bc08ea2dcd87d
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -0,0 +1,492 @@

[ ... ]

> +int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_=
hdl)
> +{
> +	bool is_rsp_wait_with_timeout =3D false;
> +	bool wait_uninterruptible =3D false;
> +	unsigned long remaining_jiffies;
> +	unsigned long deadline_jiffies;
> +	unsigned long flags;
> +	int ret;
> +
> +	remaining_jiffies =3D msecs_to_jiffies(SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
> +	if (se_clbk_hdl =3D=3D &priv->waiting_rsp_clbk_hdl) {
> +		is_rsp_wait_with_timeout =3D true;
> +		deadline_jiffies =3D jiffies + remaining_jiffies;
> +	}
> +
> +	do {
> +		if (is_rsp_wait_with_timeout) {
> +			unsigned long now =3D jiffies;
> +
> +			if (time_after_eq(now, deadline_jiffies)) {
> +				/* Deadline hit: fence hung FW, like the ret=3D=3D0 path. */
> +				spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> +				se_clbk_hdl->rx_msg =3D NULL;
> +				if (!completion_done(&se_clbk_hdl->done))
> +					atomic_set(&priv->fw_busy, 1);
> +				spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +				ret =3D -ETIMEDOUT;
> +				break;
> +			}
> +			remaining_jiffies =3D deadline_jiffies - now;
> +		}
> +
> +		if (wait_uninterruptible)
> +			ret =3D wait_for_completion_timeout(&se_clbk_hdl->done,
> +							  remaining_jiffies);
> +		else
> +			ret =3D wait_for_completion_interruptible_timeout(&se_clbk_hdl->done,
> +									remaining_jiffies);

[Severity: High]
Since ele_msg_rcv() uses an interruptible wait by default for all=20
transactions, what happens to internal kernel transactions if a signal is=20
pending?

If a fake signal is sent by the PM freezer during suspend, or a user sends=
=20
SIGINT during modprobe, won't this abort the wait with -ERESTARTSYS?

> +		if (ret =3D=3D -ERESTARTSYS) {
> +			/*
> +			 * Record that a signal was observed, then continue waiting non-
> +			 * interruptibly until the response arrives or the timeout
> +			 * expires. The caller can surface the interruption to userspace
> +			 * after the protocol transaction is brought back to a
> +			 * synchronized state.
> +			 */
> +			if (is_rsp_wait_with_timeout &&
> +			    READ_ONCE(se_clbk_hdl->rx_msg)) {
> +				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
> +				wait_uninterruptible =3D true;
> +				continue;
> +			}
> +			break;
> +		}

[ ... ]

> +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> +		     void *rx_msg, int exp_rx_msg_sz)
> +{

[ ... ]

> +	err =3D ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
> +
> +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> +		/*
> +		 * Signal was deferred until the FW/kernel protocol resynchronized.
> +		 * On success report -ERESTARTSYS for the interrupted wait; the
> +		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
> +		 */
> +		if (err > 0)
> +			err =3D -ERESTARTSYS;
> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
> +	}

Since ele_msg_send_rcv() explicitly converts the successful return back to=
=20
-ERESTARTSYS when a signal was received, could this cause spurious device=20
initialization or power management failures for callers that are not tied t=
o=20
a restartable syscall?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx-se-if-=
v33-0-212e32ff0295@nxp.com?part=3D3
