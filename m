Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D62446831;
	Wed, 29 Jul 2026 10:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319439; cv=none; b=ArDFhs+Fvz9mDggxwLv3CefmWAxYgEYelw1FxirBXwyQY7ofQFRNRgwNKoPposgD9C3V0gJAOqT7eLSwD4PlbMJrDvnCDnHUEQs6hSLoe01TETtqKFGTa+aTL6nSlaE3RQKjWYfUOvfc9zMDVASh0jiYUrLKes+Qaqzo/E/HAJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319439; c=relaxed/simple;
	bh=L5O7TKLJYJbz5sJH2LCXaJ7ousZ6uetbMELyuaw9NUg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EfN6MXTTdFBiRgv1pBFuq0zHYQxjYIvjKiercqxwaWNSeqJq772xPAfMIncpqcRxPjZiVE2IUXJ0tWH368IQaP6OzSQNRXTQojQP3y77EQel/T0WJZmVJPSavljcuSe2dPjjqgqsK+iMPzqzJ5TABU8yJhyB/0Cwx67PAQRIZbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3yapnFk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3yapnFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F15D1F000E9;
	Wed, 29 Jul 2026 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319437;
	bh=4+j+9lZzTfZIYwGJ38XqtaOoEIAdLJ4GkOmOYPU6JJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c3yapnFkTmvD3BQ+EOmxo6Rt22pkUU4+Ulwykq28WRHN0PKO9mbu0R1JYRNEcmdDC
	 2F+kjpBFc3A8yyCeXFn7gHxoq5mHSoPImLCukWpn/oFMbHNdgjJ1ozxD+SwSQUojaQ
	 PVBog1+6Z44nSGrsQPipSsXCeF2JW2zgVKmrLEOrJ0PwqTybtfFApyKj66RT8zP6OC
	 kHrUn7d+fLvSoCyM+2VTU9o9PrVn7hJf0oPI8wSyey7RkkBnIN1/OZYG02koQzolxa
	 kZvLyF5ykn+0OeZ3vpQ+zGwz27iGVcUpEd2tHdw1+ujoVX1uXOjta/66JXjSrnPQgJ
	 uwP92Q7+uijEw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v31 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260729-imx-se-if-v31-3-e59af7adb784@nxp.com>
References: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
 <20260729-imx-se-if-v31-3-e59af7adb784@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:03:57 +0000
Message-Id: <20260729100357.8F15D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] DMA Use-After-Free / Memory Corruption on command timeout
--

--- Patch [3]: [PATCH v31 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit ae6974582706d865c1232af0bb0e80860d057d5e
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

Add MU-based communication interface for secure enclave.

NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
embedded in the SoC to support the features like HSM, SHE & V2X, using
message based communication interface.

> Two findings need no code change:
> - DMA free on timeout: -ETIMEDOUT means FW is fenced by fw_busy, so the
>   free is safe.

[Severity: High]
Is this description accurate? The fw_busy flag is a software-side atomic va=
riable
that only prevents the kernel from sending subsequent commands. It does not=
hing
to cancel the in-flight hardware DMA operation. Once the enclave has the ph=
ysical
address, the kernel cannot safely free the memory until it guarantees the e=
nclave
will no longer write to it.

> diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/e=
le_base_msg.c
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_base_msg.c

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

[Severity: High]
Does ele_get_info_cleanup() in drivers/firmware/imx/ele_base_msg.c uncondit=
ionally
free the DMA buffer back to the allocator even if the firmware is still exe=
cuting
the command and may write to it?

[ ... ]

> +	ret =3D ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
> +			       ELE_GET_INFO_RSP_MSG_SZ);
> +	if (ret < 0) {
> +		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
> +		return ret;
> +	}

[Severity: High]
If ele_msg_send_rcv() times out and returns -ETIMEDOUT, won't ele_get_info()
invoke the unsafe free operation while the firmware might still be processi=
ng
the request?

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> +	} else if (header->tag =3D=3D priv->if_defs->rsp_tag) {
> +		bool exception_for_sz_mismatch =3D check_hdr_exception_for_sz(priv, he=
ader);
> +		u32 exp_rx_msg_sz =3D 0;
> +
> +		/*
> +		 * rx_msg and rx_msg_sz are owned by the sender under clbk_rx_lock.
> +		 * Read both under the lock: drop a late response instead of copying
> +		 * into freed memory, and avoid a stale size. A late response also
> +		 * closes the firmware-busy circuit breaker.
> +		 */
> +		se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
> +		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> +		if (!se_clbk_hdl->rx_msg) {
> +			/* Close circuit breaker on spinlock race */
> +			atomic_set(&priv->fw_busy, 0);
> +			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +			dev_info(dev, "ELE responded (late), recovery FW available.");
> +			return;
> +		}

[Severity: High]
When a late response arrives after a timeout, does clearing the software ci=
rcuit
breaker in se_if_rx_callback() leave the system completely oblivious to the=
 fact
that the hardware just wrote to freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-imx-se-if-=
v31-0-e59af7adb784@nxp.com?part=3D3
