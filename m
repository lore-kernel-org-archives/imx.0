Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94660479861;
	Wed, 29 Jul 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785319423; cv=none; b=k4l6yDJoZ64ruUbYRj4E33NrM+LCf+rWPJM5qwGRXGKS6uU4sNfFmSXLcrE1txJhqffFq/Zjy1i6lgerb4e2yhcXkJoUSokAp0B5h9mdlCORu12wmjIQ8jtdtZ3bTMLsNno77YZJ6dFfHQ/g7tGRTFCWVKmEkwOCEjr9/g+XBcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785319423; c=relaxed/simple;
	bh=8ljoaTpz5t6t77Caaz/zig+MpVBJQnZxOU1I+EbEjvk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hP1tlcbNcx4q/G9iSFtXe6i4s5kxYFsMtCKdXVJef/zMOMJxaNrBLfnSJf/yAtDtSfYyeHHvqfnRkwRq1/h/emWZupBdhRVOCNIOJkagII8E88vsf7aaw42/gWQ7lXt7EzbxSy5x7FF19RTin46B3hCMgAWon1qPcb1uju2YejE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6IZ7YJ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6IZ7YJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A401F000E9;
	Wed, 29 Jul 2026 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785319421;
	bh=/UafdEDqXih3rHvhZ19Ua3rvxLUVOZmkB5i7H47oM8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W6IZ7YJ4NnRAAM78luyDktpccKBKK7HtKYM2gN1dRMZf9OKtG38ZxjwYjOA4dDL+C
	 jNY+8qg2ojchjtTVQgc5HVr78ApMXGIUd0Eoudle5XQdJ0Hoc3N+6P7Opdnr7VDcnu
	 +UT7+jJePu/gR9REY9oLykZxxcmDm8BZqeZjS+Y7J/H5JpKzIDzokaEd1BMsx+P44e
	 9vrw0XdFnpz660hZgVpfkngJPCzuvlV7U7qSit58Nt966QTlmWjFhItS4u3yVD8Fkd
	 K44bYcVI/Yumck5wgi5Hp7QYUmWcdBxyy5cv/YZ0vrv0cg+MjLNGMIGKXcJc+F6Xdv
	 AtsE6Yi2Ykc7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v31 4/7] firmware: imx: device context dedicated to priv
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729-imx-se-if-v31-4-e59af7adb784@nxp.com>
References: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
 <20260729-imx-se-if-v31-4-e59af7adb784@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 10:03:40 +0000
Message-Id: <20260729100340.C6A401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] se_if_probe_cleanup() frees priv->priv_dev_ctx before freeing the =
mailbox channels, creating a race condition where the mailbox RX callback c=
an access a freed devname string on the error logging path.
--

--- Patch [4]: [PATCH v31 4/7] firmware: imx: device context dedicated to p=
riv ---
commit 29854db2c90371c5e52ff11225c81835904c4be3
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: device context dedicated to priv

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

Closes: https://sashiko.dev/#/patchset/20260721-imx-se-if-v29-0-04a362f4fcc=
a@nxp.com?part=3D4

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> @@ -294,13 +301,14 @@ void se_if_rx_callback(struct mbox_client *mbox_cl,=
 void *msg)
>  		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM=
_MSG_LEN).
>  		 */
>  		se_clbk_hdl->rx_msg_sz =3D min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);
> +		devname =3D se_clbk_hdl->dev_ctx->devname;
>  		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>  		complete(&se_clbk_hdl->done);
>  		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>  		if (sz_mismatch)
>  			dev_err(dev,
> -				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d !=3D %d).\n",
> -				*(u32 *)header,
> +				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d !=3D %d).\n",
> +				devname, *(u32 *)header,
>  				(header->size << 2), rx_msg_sz);

[ ... ]

> @@ -335,14 +343,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl,=
 void *msg)
>  			sz_mismatch =3D true;
> =20
>  		se_clbk_hdl->rx_msg_sz =3D min(rx_msg_sz, exp_rx_msg_sz);
> +		devname =3D se_clbk_hdl->dev_ctx->devname;
>  		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
>  		complete(&se_clbk_hdl->done);
>  		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> =20
>  		if (sz_mismatch)
>  			dev_err(dev,
> -				"Rsp to CMD: hdr(0x%x) with different sz(%d !=3D %d).\n",
> -				*(u32 *)header,
> +				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d !=3D %d).\n",
> +				devname, *(u32 *)header,
>  				(header->size << 2), exp_rx_msg_sz);

[ ... ]

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c

[ ... ]

> @@ -309,6 +339,11 @@ static void se_if_probe_cleanup(void *plat_dev)
>  	if (!priv)
>  		return;
> =20
> +	if (priv->priv_dev_ctx) {
> +		kfree(priv->priv_dev_ctx->devname);
> +		kfree(priv->priv_dev_ctx);
> +	}
> +
>  	if (priv->rx_chan)
>  		mbox_free_channel(priv->rx_chan);
>  	if (priv->tx_chan)

[Severity: High]
Can this sequence result in a use-after-free of devname?

If the firmware sends a response with an unexpected size during a probe
transaction, sz_mismatch becomes true. In se_if_rx_callback(), the code
caches devname, calls complete(), drops the lock, and then calls dev_err()
passing the cached devname:

drivers/firmware/imx/ele_common.c:se_if_rx_callback()
        devname =3D se_clbk_hdl->dev_ctx->devname;
        ...
        complete(&se_clbk_hdl->done);
        spin_unlock_irqrestore(...);
       =20
        if (sz_mismatch)
                dev_err(dev, "%s ...", devname, ...);
               =20
Calling complete() wakes up the waiting probe thread. If the probe aborts
due to this mismatch and triggers devres cleanup, se_if_probe_cleanup()
runs.

Because se_if_probe_cleanup() frees priv_dev_ctx and its devname before
calling mbox_free_channel() (which would otherwise synchronize and stop
pending callbacks), devname could be freed while the callback thread is
preempted before or during the dev_err() call.

Would it be safer to free priv_dev_ctx after the mailbox channels are freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-imx-se-if-=
v31-0-e59af7adb784@nxp.com?part=3D4
