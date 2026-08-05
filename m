Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8749A19539F;
	Wed,  5 Aug 2026 08:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917428; cv=none; b=cJcAVUkHwl+XESB7dh9SBPC4AVk6b9u9AyAa1GD/vPK4tS/Sy96qUnl9XhL/nZGPOLrL7OL6VLxX1537wAraa4WGb2AH7iBqGToNEQQYbBBjIis/m3iMlflIGG2ngE0FrRaGSZxZBg4nIjPaq9DYNhpzUIT6cfaRj9LUcHLeD+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917428; c=relaxed/simple;
	bh=bJeiINkMDzbXnJLTg0FruGkKvKW0bMIZQaRY7tAeGu0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JqY2HmpGQWPDPh/x9wtg5momK0HBnwQJSrhi8jM+l/+qi3Rlz5ugai14V41B/NYotAEn7afpmAuwAka7gC/yVOrzSPqhXtUqUtvjvkFAeQOo9GTXDVRHdGVHjEDiCAzc090HlrEoU2DJAd8PMV8RKHfYTEJU6RgKO5cP8utcITc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5ABGZbQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5ABGZbQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7E01F00A3A;
	Wed,  5 Aug 2026 08:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917415;
	bh=smds82rksUvig50t99S+WzAcpm+t1gkVHUo0m6JkEtw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m5ABGZbQNBDSuiOeLGQ1hXJO68EyWOY49OUM0blud2pzYI9UPjB8Or6anyesgvfRH
	 Jq7DRryAALiqej0qV10bH4kS328Fa7SHTUv9atcxX3UlNp4pznw7dJAFkftA1pZnMU
	 d0i4UFgU2XT7+pGwlNU9xDn736W/Opu8gDtDyhqwOHc0gd1Dz+hm+spNTLuAx7tD6l
	 y+5gJ8kwZTDw4aV9lveHnL2qUvpurZgjub6ScCzI+o+1J8l1AupXnHNoi4mrD+nIO2
	 tLET8aOjMKfB7ziMKJCY4Ny9KQz+bgURwAWR87XwFeatBZmQL2YPY0kg6m7v81AToz
	 n2ixt/2FUgIUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v33 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org
In-Reply-To: <20260805-imx-se-if-v33-5-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
 <20260805-imx-se-if-v33-5-212e32ff0295@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 08:10:14 +0000
Message-Id: <20260805081014.BB7E01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Deadlock during unbind caused by `se_if_probe_cleanup()` block=
ing on `se_if_cmd_lock` before waking the active transaction.
- [High] Overwriting `dev_ctx->sess_hdl` and `dev_ctx->strg_hdl` on repeate=
d open requests leaks previously opened firmware handles.
- [High] Mixing `goto`-based error handling with `__free()` annotations vio=
lates the cleanup subsystem guidelines.
- [High] Valid firmware responses during teardown are misidentified as forc=
ed wakeups, failing the teardown protocol and leaking DMA memory.
- [High] Missing bounds check on firmware response payload allows out-of-bo=
unds read of the allocated buffer in `fw_api_specific_ops`.
--

--- Patch [5]: [PATCH v33 5/7] firmware: imx: adds miscdev ---
commit 505332d25775977b34724dbd94f2b51249b86386
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: adds miscdev

This commit adds the character driver for the NXP secure-enclave
communication interface. It enables userspace applications to exchange
messages with the hardware IP, managing shared memory, command validation,
and firmware status.

Closes: https://sashiko.dev/#/patchset/20260121-imx-se-if-v32-0-c5222df51cc=
2@nxp.com?part=3D5

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> @@ -128,6 +178,26 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, st=
ruct se_clbk_handle *se_clbk
>  		}
> +
> +		/*
> +		 * A positive wait return normally means firmware delivered a
> +		 * response. During teardown, se_if_probe_cleanup() forces this
> +		 * wait to return via complete_all() without any real response.
> +		 * If that happens the firmware may still be executing and could
> +		 * DMA into the shared buffer later. Treat it as a failed
> +		 * transaction and arm the circuit breaker so the shared memory
> +		 * is quarantined (not freed) instead of being reclaimed while
> +		 * the enclave might still write to it.
> +		 */
> +		if (is_rsp_wait_with_timeout && atomic_read(&priv->going_away)) {
> +			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> +			se_clbk_hdl->rx_msg =3D NULL;
> +			se_mark_fw_busy(dev_ctx);
> +			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> +			ret =3D -ENODEV;
> +			break;
> +		}

[Severity: High]
Does this logic unintentionally intercept legitimate teardown responses?

During se_if_probe_cleanup(), going_away is set to 1. The teardown path then
calls cleanup_dev_ctx(), which sends graceful close commands via
se_close_storage() and se_close_session(). These commands explicitly bypass
the going_away check in ele_msg_send_rcv() so they can be sent.

However, when the hardware replies, ele_msg_rcv() checks going_away and
misidentifies the genuine wakeup as the forced unbind abort, failing the
close operation and leaking the DMA memory.

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> @@ -339,31 +709,116 @@ static void se_if_probe_cleanup(void *plat_dev)
>  	if (!priv)
>  		return;
> =20
> +	scoped_guard(mutex, &priv->se_if_cmd_lock) {
> +		/*
> +		 * Announce teardown before doing anything else. ele_msg_send_rcv()
> +		 * checks going_away under se_if_cmd_lock and bails out instead of
> +		 * arming a new transaction, and ele_msg_rcv() uses it to tell a
> +		 * teardown-forced completion apart from a genuine firmware response.
> +		 * This must be set before the complete_all() below so those checks
> +		 * are not dead code.
> +		 */
> +		atomic_set(&priv->going_away, 1);
> +		/*
> +		 * Wake any ioctl thread blocked in ele_msg_rcv() before iterating the
> +		 * device-context list. That waiter sleeps on this completion while
> +		 * holding its dev_ctx->fops_lock, and cleanup_dev_ctx() below also
> +		 * takes dev_ctx->fops_lock. Completing first lets the waiter make
> +		 * progress and drop fops_lock, avoiding an unbind hang.
> +		 */
> +		complete_all(&priv->waiting_rsp_clbk_hdl.done);
> +	}

[Severity: Critical]
Could this lead to a deadlock during unbind?

When an IOCTL calls ele_msg_send_rcv(), it holds se_if_cmd_lock across the
blocking wait in ele_msg_rcv(). If the device unbinds concurrently,
se_if_probe_cleanup() attempts to acquire the exact same se_if_cmd_lock
before executing complete_all() to wake up the IOCTL thread.

The unbind thread would block waiting for the lock, while the IOCTL thread
won't release it until it is woken up.

> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele=
_fw_api.c
> --- a/drivers/firmware/imx/ele_fw_api.c
> +++ b/drivers/firmware/imx/ele_fw_api.c
[ ... ]
> +void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_api=
_msg *rx_msg)
> +{
> +	struct se_msg_hdr *header =3D &rx_msg->header;
> +	struct se_if_priv *priv =3D dev_ctx->priv;
> +
> +	switch (header->command) {
> +	case ELE_SESSION_OPEN_REQ:
> +		dev_ctx->sess_hdl =3D rx_msg->data[1];
> +		break;

[Severity: High]
What happens if userspace sends multiple ELE_SESSION_OPEN_REQ or
ELE_STORAGE_OPEN_REQ ioctls on the same file descriptor?

The new handle is directly assigned to dev_ctx->sess_hdl, overwriting any
previous handle without closing it. Does this allow unprivileged userspace
programs to exhaust firmware resources by leaking previous handles?

[Severity: High]
Is it safe to unconditionally read rx_msg->data[1] here?

The rx_msg buffer is allocated using kzalloc based on the user-provided
rx_buf_sz in se_ioctl_cmd_snd_rcv_rsp_handler(). If userspace provides an
8-byte buffer size and the firmware responds with a truncated payload,
would this read past the end of the allocation and leak adjacent kernel
memory?

[ ... ]
> +int se_close_session(struct se_if_priv *priv, u32 session_hdl)
> +{
> +	struct se_api_msg *tx_msg __free(kfree) =3D NULL;
> +	struct se_api_msg *rx_msg __free(kfree) =3D NULL;
> +	int ret;
> +
> +	if (!priv || !priv->priv_dev_ctx) {
> +		ret =3D -EINVAL;
> +		goto exit;
> +	}

[Severity: High]
Are there concerns with mixing goto-based error handling and scope-based
cleanup here?

The cleanup subsystem guidelines advise against using goto labels (like
goto exit) in the same function as __free annotations, as it can create
confusing ownership semantics and lead to double-free or resource leak bugs.
The same pattern is present in se_close_storage(). Would returning
directly be preferable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx-se-if-=
v33-0-212e32ff0295@nxp.com?part=3D5
