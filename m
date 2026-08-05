Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04004570D4;
	Wed,  5 Aug 2026 16:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785947426; cv=none; b=G2V1XOfffYUArk6wl/3VT48EPjIB6KXEKpS0uRtFtkGN0fu7zRNn2ZxQSF+NX4pzd9agBwCWwoi1BdHjqxwQE+tDLODqzaWpzKjz0Zd85BVT4MDs2Ne3xZbbnLCjf9cBz1hFB+KZ27F4GTi5wCPfYuzkENWtRPlYYpq0ElZdFk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785947426; c=relaxed/simple;
	bh=C9GPB3atG0b37htJC4X7nrwH7sQ8Pf0cTRs8Qt6qUH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X8TLE85Fd/Dqf5I2aNF0pDsCSOzFGVAXhslA7/QahkH8pnmrmEQrbWm9SdjgFGgjqdyHaRJiqZzCT4gMZJnjSOnkiYU2yu1yKJXnoFhXIF2qEsqCswUY3vKDaM6IGBD5AJLExUKWk7CV5ccFa+LZgX7wn2OE0EQKmOePNvWX+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVhf4eVW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVhf4eVW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC991F000E9;
	Wed,  5 Aug 2026 16:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785947424;
	bh=9fGy9nOmY4cgISDUWs3GkPOuoBtvSbNpaxtW5ySemmk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XVhf4eVWU3tWBgwsVEW/UekmEupMSiJCs5b9yI8Okx4izY1+BXHlYlMKvoFN2832t
	 wkqXFzc0D+apTU7jfZd1Oy+y7hwP4hwlsAbPW+yVh6tVuiGTgwTVJ7c1lWqrIpgDw1
	 VErDkErYbvJ4+fKy8cBlFs5VylCPOeYagrVmc9zDCtK3lJCuAK5g0zPBwwdm2zfunV
	 z9ghLxkB1CEiF249Dxnl8W5p9Jk2uJqawluM3ojbZUkHaacDgkpULHbiNUpu/OyB7g
	 NROhb8qcCIFzSTA1SOSNCC99NuHB5sOXVjn7Inh9/sE0us5nmn9rwLJNuf/jQ2qws6
	 LeKUK9n4occbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v34 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260805-imx-se-if-v34-5-7e4713d14e0a@nxp.com>
References: <20260805-imx-se-if-v34-0-7e4713d14e0a@nxp.com>
 <20260805-imx-se-if-v34-5-7e4713d14e0a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 16:30:23 +0000
Message-Id: <20260805163023.ECC991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Mismatch in API version parameters when sending and validating ses=
sion/storage close requests, causing the teardown cleanup to unconditionall=
y fail.
- [High] Firmware storage handle is permanently leaked if command receiver =
registration fails after a successful ELE_STORAGE_OPEN_REQ.
- [High] Missing payload validation allows cross-process session/storage di=
sruption and handle leaks via spoofed close requests.
- [High] Concurrent close() can race with device unbind, leading to a use-a=
fter-free of mailbox channels in mbox_send_message because se_close_session=
 bypasses the going_away safeguard.
- [Medium] Discarding successful firmware responses on interrupted wait cau=
ses firmware resource leaks.
--

--- Patch [5]: [PATCH v34 5/7] firmware: imx: adds miscdev ---
commit 4fe94a5b9918db6ab33badde78a9ca4fc596c70c
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: adds miscdev

Adds the driver for communication interface to secure-enclave, that enables
exchanging messages with NXP secure enclave HW IP(s). Includes command
validation, session tracking, and teardown management.

Link: https://lore.kernel.org/r/20260805-imx-se-if-v33-0-212e32ff0295@nxp.c=
om

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> @@ -288,6 +288,14 @@ int ele_msg_send_rcv(struct se_if_device_ctx *dev_ct=
x, void *tx_msg,
>  	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
>  		/*
>  		 * Signal was deferred until the FW/kernel protocol resynchronized.
>  		 * On success report -ERESTARTSYS for the interrupted wait; the
>  		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
>  		 */
>  		if (err > 0)
>  			err =3D -ERESTARTSYS;

[Severity: Medium]
Is it possible this discards a successful firmware response?

In ele_msg_send_rcv(), if a signal interrupted the wait but the firmware
successfully processed a request (like ELE_SESSION_OPEN_REQ), err is
converted to -ERESTARTSYS. This causes se_ioctl_cmd_snd_rcv_rsp_handler()
to return -EINTR without calling fw_api_specific_ops(). As a result, the
successfully allocated session handle is never recorded by the kernel and
gets leaked permanently in the firmware.

> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele=
_fw_api.c
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_fw_api.c
[ ... ]
> @@ -46,6 +46,10 @@ int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *d=
ev_ctx, struct se_msg_hdr
>  	case ELE_SESSION_CLOSE_REQ:
>  		/* Might be cleared as part of tear down. */
>  		ret =3D dev_ctx->sess_hdl ? 0 : -ENXIO;
>  		break;

[Severity: High]
Does this validation allow one process to close another process's handle?

In ele_uapi_allowed_fw_cmd(), the code only verifies that the calling
context has some handle open (dev_ctx->sess_hdl is non-zero). It does not
check if the handle ID provided in the user's payload (tx_msg->data[0])
actually matches the context's dev_ctx->sess_hdl. A malicious user with one
valid handle could send a spoofed close request with another process's hand=
le
ID, disrupting the victim and leaking their own handle.

[ ... ]
> @@ -79,15 +83,16 @@ void fw_api_specific_ops(struct se_if_device_ctx *dev=
_ctx, struct se_api_msg *rx
>  	case ELE_STORAGE_OPEN_REQ: {
>  		int rc =3D 0;
> =20
>  		rc =3D set_dev_ctx_as_command_receiver(dev_ctx);
>  		if (rc) {
>  			dev_err(priv->dev,
>  				"Failed to register %s as CMD-Receiver: %d\n",
>  				dev_ctx->devname, rc);
>  			break;
>  		}
>  		dev_ctx->strg_hdl =3D rx_msg->data[1];
>  		break;
>  	}

[Severity: High]
Can this leak a newly opened storage handle on registration failure?

If set_dev_ctx_as_command_receiver() fails (e.g. returning -EBUSY because a
receiver is already registered), the code breaks early and skips assigning
rx_msg->data[1] to dev_ctx->strg_hdl. Because the ioctl still returns succe=
ss
to userspace and dev_ctx->strg_hdl remains 0, the kernel will not track the
handle for teardown, resulting in a permanent firmware resource leak.

[ ... ]
> @@ -113,19 +118,22 @@ int se_close_session(struct se_if_priv *priv, u32 s=
ession_hdl)
> =20
>  	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
>  			    ELE_SESSION_CLOSE_REQ, ELE_SESSION_CLOSE_REQ_SZ, true);
> =20
>  	tx_msg->data[0] =3D session_hdl;
> =20
>  	ret =3D ele_msg_send_rcv(priv->priv_dev_ctx,
>  			       tx_msg,
>  			       ELE_SESSION_CLOSE_REQ_SZ,
>  			       rx_msg,
>  			       ELE_SESSION_CLOSE_RSP_SZ);

[Severity: High]
Could this cause a use-after-free of mailbox channels during device unbind?

By hardcoding priv->priv_dev_ctx here instead of using the user's actual
device context, this unconditionally bypasses the teardown safeguard in
ele_msg_send_rcv() (which allows priv_dev_ctx teardown messages through).
If a user calls close() concurrently with driver unbind, and the unbind
thread frees priv->tx_chan, the concurrent close() thread will skip the
going_away check and attempt a transmission on the freed channel.

>  	if (ret < 0)
>  		return ret;
> =20
>  	ret =3D se_val_rsp_hdr_n_status(priv,
>  				      rx_msg,
>  				      ELE_SESSION_CLOSE_REQ,
>  				      ELE_SESSION_CLOSE_RSP_SZ,
>  				      false);
>  	return ret;
>  }

[Severity: High]
Is there a version mismatch causing cleanup to unconditionally fail?

When formatting the request earlier in se_close_session(),
se_fill_cmd_msg_hdr() is called with is_base_api =3D true. But here,
se_val_rsp_hdr_n_status() is called with is_base_api =3D false, which stric=
tly
expects the response version to match fw_api_ver. This mismatch causes
validation to fail with -EINVAL, leaking firmware resources since the kernel
considers the close operation to have failed. This identical mismatch also
exists in se_close_storage().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-imx-se-if-=
v34-0-7e4713d14e0a@nxp.com?part=3D5
