Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D9633F8C1;
	Tue, 21 Jul 2026 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630962; cv=none; b=H4AopKJipfKrZQycoHNW5HniwvirEiNUTit4U0cJggDvhfcFiIcF5u1M5otXAXBvNquYWHr49n6srAs7+sOT6/5YDkEhbMx38iCTEdauqfiIU/HVuhTuaAoP46tDI+sIqQjJc8QrURIv8AG+YLb4wOsNwdricICQQJY7XTwuitg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630962; c=relaxed/simple;
	bh=VH5YXEQLC5FPQdDp95/wPqwyEMeNk2r3WmPG/n2jxV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MtCG0LL2LfLj82tszOdg0p0qZbpYRsnA5TI59LJG6kYzdZ9A/5dfTc9hsuHBUa14K/O82z6gqU60zrLl+KBTAi2p7/lw0qWWnFgyrYh5ew5suwKA1ZtjdTYJZnhiK8oall/qnCYIhwEDUATszUCpw5a8gWyd423KPwRFIgSxw9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbg+Sybb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbg+Sybb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6D21F000E9;
	Tue, 21 Jul 2026 10:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784630959;
	bh=COvootmFU6xE09RNKSVWlOyw5o8vk0Ck6v6nSt7YGA8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kbg+SybbIKuQ9Z9n1nRQoUIv7gi5CMmGOccgFtZPagU+DCZR3cJBwOSH0R5Ux6gKa
	 fGeSgVx5IFZaHw8d9vMWOtt1VaC47/SKtYSTWfQzQ4dpmMIdUTxjJnEIdLahz3PN5n
	 QJ2REc9sBdaGFaH8THQVhKaMVZmhYrSf4Tg0FXTErgIRWNyl6y9HUozTtfghZfuOYm
	 dY+oFxASxBuMm8GGcQGgpTJi0+fVSbPJxDlMwmEfwHz9XS67uOXzdaRVoDivVqt3Ml
	 rQwcy56U3gceBR75QZpddyp0HCjmFSGSq94iHV+8Rm8R5f7gnAyOyaPHabgDsUi3lc
	 ad5EKgK504fNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v29 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260721-imx-se-if-v29-3-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
 <20260721-imx-se-if-v29-3-04a362f4fcca@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:49:17 +0000
Message-Id: <20260721104918.CB6D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect devres registration order causes Use-After-Free / NULL p=
ointer dereference in the mailbox RX callback.
- [High] Data race on `rx_msg_sz` in receive callback can cause truncated m=
essage copies.
- [Medium] Memory leak of the `priv` structure on early probe failure paths.
- [Medium] Unsafe syscall restart on successfully completed non-idempotent =
hardware operations.
- [Medium] The global `soc_device` singleton's lifecycle is incorrectly tie=
d to the first probed MU interface, causing a data race and premature sysfs=
 deletion.
- [Medium] `ele_msg_rcv` resets the timeout duration when interrupted by a =
signal, failing to account for elapsed time.
--

--- Patch [3]: [PATCH v29 3/7] firmware: imx: add driver for NXP EdgeLock E=
nclave ---
commit d4849e12d3bfbc8888e192439092fc2c309b9016
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

This commit introduces a driver for the NXP EdgeLock Enclave (ELE). It expo=
ses
APIs supported by the iMX Secure Enclave HW IP using the SAB protocol via
dedicated Messaging Unit interfaces.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> @@ -49,15 +49,27 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_cl=
bk_handle *se_clbk_hdl)
>  	bool wait_uninterruptible =3D false;
>  	unsigned long remaining_jiffies;
>  	unsigned long flags;
>  	int ret;
> =20
>  	remaining_jiffies =3D msecs_to_jiffies(SE_RCV_MSG_DEFAULT_TIMEOUT_MS);
>  	do {
>  		if (wait_uninterruptible)
>  			ret =3D wait_for_completion_timeout(&se_clbk_hdl->done,
>  							  remaining_jiffies);
>  		else
>  			ret =3D wait_for_completion_interruptible_timeout(&se_clbk_hdl->done,
>  									remaining_jiffies);
>  		if (ret =3D=3D -ERESTARTSYS) {
>  			/*
>  			 * Record that a signal was observed, then continue waiting non-
>  			 * interruptibly until the response arrives or the timeout
>  			 * expires. The caller can surface the interruption to userspace
>  			 * after the protocol transaction is brought back to a
>  			 * synchronized state.
>  			 */
>  			if (se_clbk_hdl =3D=3D &priv->waiting_rsp_clbk_hdl &&
>  			    READ_ONCE(se_clbk_hdl->rx_msg)) {
>  				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
>  				wait_uninterruptible =3D true;
>  				continue;
>  			}
>  			break;
>  		}

[Severity: Medium]
When wait_for_completion_interruptible_timeout() is interrupted by a signal,
the loop falls back to an uninterruptible wait.

Since remaining_jiffies is never updated to subtract the time already spent
waiting, does this unintentionally reset the timeout duration, effectively
extending the wait time?

[ ... ]

> @@ -155,27 +167,23 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void =
*tx_msg, int tx_msg_sz,
>  	err =3D ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
> =20
>  	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
>  		/*
>  		 * A signal was received after the command was sent. ele_msg_rcv()
>  		 * kept waiting until the FW/kernel protocol was synchronized again.
>  		 * If the transaction itself completed successfully, report the
>  		 * deferred signal to userspace using normal syscall-restart semantics.
>  		 * Do not hide real firmware/protocol errors such as -ETIMEDOUT.
>  		 */
>  		if (err > 0)
>  			err =3D -ERESTARTSYS;
>  		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
>  		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
>  	}

[Severity: Medium]
When a signal interrupts the wait, the loop catches -ERESTARTSYS.

If the hardware transaction successfully completes afterward (err > 0), the
status is explicitly overwritten with -ERESTARTSYS here.

Could this cause the kernel to re-execute the system call, leading to
non-idempotent hardware operations being sent to the enclave twice?

[ ... ]

> @@ -259,20 +267,17 @@ void se_if_rx_callback(struct mbox_client *mbox_cl,=
 void *msg)
>  	} else if (header->tag =3D=3D priv->if_defs->rsp_tag) {
>  		bool exception_for_sz_mismatch =3D check_hdr_exception_for_sz(priv, he=
ader);
>  		u32 exp_rx_msg_sz =3D 0;
> =20
>  		/*
>  		 * waiting_rsp_clbk_hdl.rx_msg is owned by the synchronous sender in
>  		 * ele_msg_send_rcv(). After timeout or error, that path clears rx_msg
>  		 * under clbk_rx_lock before returning to its caller, which may then f=
ree
>  		 * the buffer. Check rx_msg under the same lock here so a delayed resp=
onse
>  		 * can be detected and dropped instead of copying into freed memory.
>  		 *
>  		 * A late response also closes the firmware-busy circuit breaker, allo=
wing
>  		 * future command/response transactions to proceed again.
>  		 */
>  		se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
>  		exp_rx_msg_sz =3D se_clbk_hdl->rx_msg_sz;
>  		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
>  		if (!se_clbk_hdl->rx_msg) {

[Severity: High]
In se_if_rx_callback(), exp_rx_msg_sz is read directly from
se_clbk_hdl->rx_msg_sz before acquiring clbk_rx_lock.

If a delayed response triggers this callback concurrently with a new
transaction updating rx_msg_sz under the lock, could the callback read a
stale size value?

Might this result in copying truncated or corrupted response data once the
lock is acquired?

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> @@ -140,9 +140,11 @@ static void se_soc_device_unregister(void *data)
>  {
>  	struct soc_device *sdev =3D data;
> =20
>  	soc_device_unregister(sdev);
>  	var_se_info.soc_dev_registered =3D false;
>  }

[Severity: Medium]
In se_soc_device_unregister(), var_se_info.soc_dev_registered is cleared
without acquiring the se_var_info_lock.

Does this mutation of global state create a data race against concurrent
probe threads?

> @@ -155,25 +157,21 @@ static int se_soc_dev_register(struct se_if_priv *p=
riv, u16 soc_rev,
> =20
>  	attr->serial_number =3D devm_kasprintf(priv->dev, GFP_KERNEL, "%016llX",
>  					     GET_SERIAL_NUM_FROM_UID(uid, MAX_UID_SIZE >> 2));
>  	if (!attr->serial_number)
>  		return -ENOMEM;
> =20
>  	sdev =3D soc_device_register(attr);
>  	if (IS_ERR(sdev))
>  		return PTR_ERR(sdev);
> =20
>  	err =3D devm_add_action_or_reset(priv->dev, se_soc_device_unregister, s=
dev);

[Severity: Medium]
The global SoC device singleton is registered using devm_add_action_or_rese=
t()
tied to the first probed MU interface (priv->dev).

If this specific MU interface is unbound, does it prematurely destroy the
global singleton for any other active MU interfaces?

[ ... ]

> @@ -322,25 +320,18 @@ static int se_if_probe(struct platform_device *pdev)
> =20
>  	se_info =3D if_node->se_info;
> =20
>  	priv =3D kzalloc_obj(*priv, GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
> =20
>  	priv->dev =3D dev;
>  	priv->if_defs =3D &if_node->if_defs;
>  	dev_set_drvdata(dev, priv);
> =20
>  	mutex_init(&priv->se_if_cmd_lock);
>  	spin_lock_init(&priv->cmd_receiver_clbk_hdl.clbk_rx_lock);
>  	spin_lock_init(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock);
>  	atomic_set(&priv->fw_busy, 0);
>  	init_completion(&priv->waiting_rsp_clbk_hdl.done);
>  	init_completion(&priv->cmd_receiver_clbk_hdl.done);
> =20
>  	/* Mailbox client configuration */
>  	priv->se_mb_cl.dev		=3D dev;
>  	priv->se_mb_cl.tx_block		=3D false;
>  	priv->se_mb_cl.knows_txdone	=3D false;
>  	priv->se_mb_cl.rx_callback	=3D se_if_rx_callback;
> =20
>  	ret =3D se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBO=
X_TX_NAME);
>  	if (ret)
>  		return ret;

[Severity: Medium]
In se_if_probe(), the priv structure is allocated with kzalloc_obj() which
is not device-managed.

If the first se_if_request_channel() call fails, the function returns
immediately.

Since se_if_probe_cleanup() is not registered until later, does this leave
the priv structure leaked on these early error paths?

> =20
>  	ret =3D se_if_request_channel(dev, &priv->rx_chan, &priv->se_mb_cl, MBO=
X_RX_NAME);
>  	if (ret)
>  		return ret;
> =20
>  	ret =3D devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);
>  	if (ret)
>  		return ret;

[Severity: High]
Because devres actions execute in reverse order (LIFO) during teardown,
registering se_if_probe_cleanup() after requesting the mailbox channels mea=
ns
the cleanup function will run before the RX channel is freed.

The cleanup function frees the priv structure.

If a hardware interrupt fires during this window, wouldn't
se_if_rx_callback() retrieve a NULL pointer via dev_get_drvdata() and trigg=
er
a crash when dereferencing it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-imx-se-if-=
v29-0-04a362f4fcca@nxp.com?part=3D3
