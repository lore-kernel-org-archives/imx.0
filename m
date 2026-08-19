Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CDC3ACA4E;
	Wed, 19 Aug 2026 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787146261; cv=none; b=bo6u8Bz1WRPrHEb0jJnUzPzbnvVkHx+05jf7iXBWPuDruoVkhpq/pl6Q90LZpQpGPhIY8aNMtcXq57X+TwHXryhxmHqITdJOYO3+ls8WA63DYCCjdpJwVAN85/O4T+whUGEkUso7z9jF/nt/4Y5L+3aNXDY/gjGVOjGN8qqnPx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787146261; c=relaxed/simple;
	bh=IZPvY2KeWcGemoOqb6KTfDOzplM/+FRwjTpREUnAxSQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s3FhH/VGTLkWBoZl/1wQKp/pozeBmG895G/8s0kuuV2qMxYIS/yV6QexKmzZzdGXqoyWMPO6CGRmgyRpuWrPml0o6PI0eY4IpGqmYEptu6mV3FSu2+G3+xC2vqTgNH2QrUu3TIq9Cr0vaSXPlFzW2xkRAWG2OFBi7/xWmBERnV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f36uaNlT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f36uaNlT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F131D1F000E9;
	Wed, 19 Aug 2026 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787146255;
	bh=WDHP399LQDhBW9+ScrSo5OPaXZGqZ76F5va0VF26FLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f36uaNlTFJFpCGAV0cMeRqiZZotUUE9/NKE/Kl2s03D4hr5JJUY8FmLEms0Vtci3J
	 4zH9G7YXi+g/Gl6eSZIF8EZT1pzIDVs9JbT9W+YqSipShRz/U1/Ow66VnOkRKPjQNC
	 A/PPKPfN4tKmX9Kcqt8PIn4ULLuV+Grq5mpTBgqN7EKBZKgTIbxS74w9eQVzFXGVFx
	 AwPJN3evC8me9Kbbl3uzf58t0x54NrGCAmWizGa15k2+fC+2CsQUpFGuPFBcNDYek9
	 yIwEPHMZKSWu++0E8elhbM4iSHg/9y7T3nMEdTsUE5QXFPL3t1zlz/hd9WWOoTnq+s
	 T6aZmdJgBbOBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v38 5/7] firmware: imx: adds miscdev
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260820-imx-se-if-v38-5-5df4a4cff736@nxp.com>
References: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
 <20260820-imx-se-if-v38-5-5df4a4cff736@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 13:30:54 +0000
Message-Id: <20260819133054.F131D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Global static `buf_size` variables in `ele_msg_addr_field.c` creat=
e a race condition between concurrent export commands across multiple Secur=
e Enclave interfaces, allowing a DMA bounds-check bypass and memory corrupt=
ion.
- [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition in `ELE_STO=
RAGE_OPEN_REQ` allows multiple processes to concurrently open storage handl=
es while bypassing command receiver isolation.
- [High] The `ret =3D=3D 0` timeout path in `ele_msg_rcv()` still uses `!co=
mpletion_done()` instead of `!se_clbk_hdl->rx_delivered`, leaving a DMA-aft=
er-free race condition open.
- [High] Use-after-free of `struct se_if_open_gate` in `se_if_fops_open()` =
due to a race with module unbind/device teardown.
- [High] A malicious command receiver can bypass the end-boundary check for=
 export responses by calling `write()` without calling `read()`, allowing o=
ut-of-bounds DMA writes.
--

--- Patch [5]: [PATCH v38 5/7] firmware: imx: adds miscdev ---
commit 55cc70beb0402e521ca21c2a4ece63037edf487d
Author: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: firmware: imx: adds miscdev
Summary: Adds the driver for communication interface to secure-enclave, tha=
t enables exchanging messages with NXP secure enclave HW IP(s). It includes=
 a character driver interface for user-space applications to send and recei=
ve commands, manage memory, and handle firmware responses.

> diff --git a/drivers/firmware/imx/ele_msg_addr_field.c b/drivers/firmware=
/imx/ele_msg_addr_field.c
> --- a/drivers/firmware/imx/ele_msg_addr_field.c
> +++ b/drivers/firmware/imx/ele_msg_addr_field.c
> @@ -575,6 +575,6 @@
>  static struct se_cmd_addr_field ele_storage_master_export_addr_fields[] =
=3D {
>  	{ .lsb_idx =3D 2, .flag_idx =3D SE_CMD_ADDR_ALWAYS,
>  	  .size_idx =3D SE_CMD_ADDR_NO_SIZE, .buf_size =3D 0 },	/* key_store_ex=
port_address */
>  };
>
> [ ... ]
>
> @@ -617,6 +617,6 @@
>  void ele_set_sz_in_field_addr(u8 cmd, u32 size)
>  {
>  	switch (cmd) {
>  	case ELE_STORAGE_MASTER_EXPORT_REQ:
>  		ele_storage_master_export_addr_fields[0].buf_size =3D size;
>  		break;

[Severity: High]
If there are multiple secure enclave interfaces, do they share this global
static array ele_storage_master_export_addr_fields? If two instances
execute an export concurrently, could they race to overwrite this buf_size?
If one instance's validation uses the other's size, might this allow a
smaller bounds check to pass while the firmware executes a larger DMA write,
resulting in out-of-bounds memory corruption?

> diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele=
_fw_api.c
> --- a/drivers/firmware/imx/ele_fw_api.c
> +++ b/drivers/firmware/imx/ele_fw_api.c
> @@ -152,7 +152,7 @@
>  	case ELE_STORAGE_OPEN_REQ:
>  		/* Might be cleared as part of tear down. */
>  		if (dev_ctx->strg_hdl) {
>  			ret =3D -EEXIST;
>  			break;
>  		}
>  		/*
>  		 * Reject the storage-open request when another context is
> ...
>  		 */
>  		scoped_guard(mutex, &priv->modify_lock)
>  			if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
>  			    priv->cmd_receiver_clbk_hdl.dev_ctx !=3D dev_ctx)
>  				ret =3D -EBUSY;
>  		if (rx_msg_sz < ELE_STORAGE_OPEN_RSP_SZ)
>  			ret =3D -EINVAL;
>  		break;
>
> [ ... ]
>
> @@ -252,7 +252,7 @@
>  	case ELE_STORAGE_OPEN_REQ: {
>  		int rc;
>
>  		/*
> ...
>  		 */
>  		dev_ctx->strg_hdl =3D rx_msg->data[1];
>
>  		rc =3D set_dev_ctx_as_command_receiver(dev_ctx, false);
>  		if (rc)
>  			dev_err(priv->dev,
>  				"Failed to register %s as CMD-Receiver: %d\n",
>  				dev_ctx->devname, rc);
>  		break;
>  	}

[Severity: High]
Since modify_lock is dropped before sending the command to firmware in the
pre-check, could two processes concurrently pass this check and both receive
storage handles from the firmware? If the second process fails registration
in set_dev_ctx_as_command_receiver() but the error is just logged and
discarded, wouldn't it successfully return the handle to userspace? Could
this result in the firmware incorrectly routing the second process's NVM
callbacks to the first registered process?

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -140,4 +140,4 @@
>  		if (f->size_idx !=3D SE_CMD_ADDR_NO_SIZE) {
> ...
>  		} else if (f->buf_size) {
>  			/* buf_size: literal byte count
>  			 *           (FW-defined constant or saved at runtime).
>  			 */
>  			if ((u64)f->buf_size > end - addr)
>  				return -EACCES;
>  		}

[Severity: High]
If a malicious command receiver skips calling read() and directly issues a
write() to send an export response, does buf_size remain at its default
value of zero? If buf_size is zero, the check else if (f->buf_size)
evaluates to false, completely bypassing the end-bounds check. Could an
attacker exploit this by specifying an address at the very end of the shared
memory window, causing the firmware to DMA the large export payload out of
bounds?

> [ ... ]
>
> @@ -367,4 +367,4 @@
>  		if (ret =3D=3D 0) {
> ...
>  			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
>  			se_clbk_hdl->rx_msg =3D NULL;
>  			if (!completion_done(&se_clbk_hdl->done))
>  				se_mark_fw_busy(dev_ctx);
> =20
>  			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);

[Severity: High]
Is completion_done() the correct check to use in this timeout path? If
device teardown runs concurrently and invokes complete_all(), won't
completion_done() return true? This would cause the code to skip calling
se_mark_fw_busy() and proceed to free the shared DMA buffer while the
firmware might still be processing the command, potentially leading to a
DMA-after-free memory corruption. Should this check use
!se_clbk_hdl->rx_delivered instead, similar to the other paths?

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -1885,5 +1885,5 @@
>  static int se_if_fops_open(struct inode *nd, struct file *fp)
>  {
>  	struct miscdevice *miscdev =3D fp->private_data;
>  	struct se_if_open_gate *gate;
> ...
>  	gate =3D container_of(miscdev, struct se_if_open_gate, miscdev);
> =20
>  	if (!se_if_open_gate_get(gate))
>  		return -ENODEV;

[Severity: High]
Could the gate pointer be freed concurrently before se_if_open_gate_get()
is called? When userspace calls open(), the VFS resolves the miscdev and
drops misc_mtx. If device unbind executes at this exact moment,
misc_deregister() can complete and the teardown path will free the gate
structure. When the open thread resumes, won't it dereference a freed
gate structure here, resulting in a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820-imx-se-if-=
v38-0-5df4a4cff736@nxp.com?part=3D5
