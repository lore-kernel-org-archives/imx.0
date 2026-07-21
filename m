Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231B30F819;
	Tue, 21 Jul 2026 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631076; cv=none; b=rb3cWbKYODSneVIhyv2Hu/QTtjCeUTFNnN8SeCgsdeRAfXgvKwbwa/AiArCy2LAo+0OwuMHmivfOsB8ZfRHSk0LoodoZ40h2LwyORQAxcKWQZoGSbQ+ZFneo4+YucW6xE2kjKjQPdKZ0QtNeVBMgnLd6ndI81JjJf7So7cHw8u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631076; c=relaxed/simple;
	bh=C6PTGcyDh3ksP8+wWN6FMfcCOLXsa3wYKPjHfA/e51k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qDelKzTFEF1SIAdxo8gfKHOtfNsK1Kxb82gMOFyawiMni1bMmlT/aCqHUtopIsRe2Ri+Aov8QBXbPruWX2ASt8F5x7/FImFxOyZlmxLrPpZ1c4Auez9/nKxtiiP6PqrfarTOnIQlE07YqqMaQK7a1boCkZC+cZj3SJmi6vJhK+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QY3RRx9K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QY3RRx9K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3782A1F00A3A;
	Tue, 21 Jul 2026 10:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784631075;
	bh=2J1pvuoVfRuBqaCQZpUhyvvIGViR8zFz1s6PDMDxxQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QY3RRx9KQnwch/oDEGLH7K/PeUGkURU6Qb0SeyjmIKItUCscOwQbgZSOQt2KCV+pj
	 mj/yq41MKNY3tcabCunP6yGBcn8pTrWkfYFD1SCJHkMwsb65lQzvBsRSsBw1B20Nde
	 d7WWNOAu+jRyMRMennVcfLYTwrx1FvWdNslqlxCpn4DfEsQU3wEq/5uwjzntQm2B3A
	 KTw/DxUZq//lNq28sz39JP7SgneJXZt9U5FcQoS2sylj/bw90qbnUX6HI0B5LB5OVg
	 Xi20n7I6EewegUDtF9USyc53JNz+7ENGCikj2qHn7yGUDR77H84/Pf+kMEaL+NL4/R
	 3Yg9rzXhD28Ng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v29 4/7] firmware: imx: device context dedicated to priv
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-imx-se-if-v29-4-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
 <20260721-imx-se-if-v29-4-04a362f4fcca@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:51:14 +0000
Message-Id: <20260721105115.3782A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Accessing `se_clbk_hdl->dev_ctx->devname` outside `clbk_rx_lock` i=
n the `cmd_tag` path leads to Use-After-Free or NULL pointer dereference.

Pre-existing issues:
- [High] Incorrect devm registration order causes `priv` to be freed while =
the RX mailbox channel is still active, leading to a NULL pointer dereferen=
ce.
- [High] Memory leak of `priv` when early probe steps fail.
- [High] Unprotected read of `rx_msg_sz` creates a TOCTOU race that leads t=
o response truncation on late interrupts.
--

--- Patch [4]: [PATCH v29 4/7] firmware: imx: device context dedicated to p=
riv ---
commit de35bce80e0d23de288afde843dd6a5a471535dd
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: device context dedicated to priv
   =20
Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW. No functionality change.

Closes: https://sashiko.dev/#/patchset/20260717-imx-se-if-v28-0-0a9659c7e69=
d@nxp.com?part=3D4

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> index e9405a82c54d9..a350e83a274a1 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
[ ... ]
> @@ -274,12 +283,13 @@ void se_if_rx_callback(struct mbox_client *mbox_cl,=
 void *msg)
>  		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
>  		if (sz_mismatch)
>  			dev_err(dev,
> -				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d !=3D %d).\n",
> -				*(u32 *)header,
> +				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d !=3D %d).\n",
> +				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,

[Severity: High]
Is it possible for dev_ctx to be modified concurrently?

The patch correctly introduced a local devname variable to safely read under
clbk_rx_lock for the rsp_tag path below, but in this cmd_tag path,
se_clbk_hdl->dev_ctx->devname is accessed outside the lock.

Could this lead to a use-after-free or NULL pointer dereference if the comm=
and
receiver context is destroyed concurrently?

>  				(header->size << 2), rx_msg_sz);
>  	} else if (header->tag =3D=3D priv->if_defs->rsp_tag) {
>  		bool exception_for_sz_mismatch =3D check_hdr_exception_for_sz(priv, he=
ader);
>  		u32 exp_rx_msg_sz =3D 0;
> +		const char *devname =3D NULL;
> =20

[Severity: High]
This is a pre-existing issue, but does reading rx_msg_sz outside the lock
create a TOCTOU race?

If a late or spurious mailbox interrupt occurs from a previously timed-out
command, the IRQ handler could read a stale rx_msg_sz (reset to 0 during
cleanup):

	se_clbk_hdl =3D &priv->waiting_rsp_clbk_hdl;
	exp_rx_msg_sz =3D se_clbk_hdl->rx_msg_sz;
	spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);

After acquiring the lock, it might see the newly populated rx_msg from a new
sender, but copy 0 bytes and spuriously complete the new command. Should the
size be read under the lock?

>  		/*
>  		 * waiting_rsp_clbk_hdl.rx_msg is owned by the synchronous sender in
[ ... ]
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index 06068c4db8c1d..cd4d27dd98ce1 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
[ ... ]
> @@ -382,6 +418,12 @@ static int se_if_probe(struct platform_device *pdev)
>  		load_fw->is_fw_tobe_loaded =3D true;
>  	}
> =20

[Severity: High]
This is a pre-existing issue, but could the devm registration order lead to=
 a
NULL pointer dereference?

In se_if_probe(), the mailbox channels are requested before the cleanup rou=
tine
is registered:

	ret =3D se_if_request_channel(dev, &priv->rx_chan, &priv->se_mb_cl, MBOX_R=
X_NAME);
	if (ret)
		return ret;

	ret =3D devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev);

Because devres cleans up in LIFO order, se_if_probe_cleanup() will free priv
and clear drvdata while the RX mailbox channel is still active. If an inter=
rupt
arrives in this window, se_if_rx_callback() will retrieve a NULL priv:

	priv =3D dev_get_drvdata(dev);
	...
	if (header->tag =3D=3D priv->if_defs->cmd_tag) {

Should the devm action be registered before the mailbox channels are reques=
ted?

[Severity: High]
This is a pre-existing issue, but does this function leak the priv structur=
e on
early error paths?

In se_if_probe(), priv is allocated manually using kzalloc_obj(). If the ea=
rly
calls to se_if_request_channel() fail, the function returns early:

	ret =3D se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_T=
X_NAME);
	if (ret)
		return ret;

Since devm_add_action_or_reset() hasn't been called yet, the devres stack w=
ill
not execute the cleanup function, leaking priv. Should priv be freed explic=
itly
on these early error paths?

> +	ret =3D init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed[0x%x] to create device contexts.",
> +				     ret);
> +
>  	/* By default, there is no pending FW to be loaded.*/

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-imx-se-if-=
v29-0-04a362f4fcca@nxp.com?part=3D4
