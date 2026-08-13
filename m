Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A77E38AC78
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786615727; cv=none; b=iXsnsbTJy6vZjNM5atMHwSf24SIcV6H6GNk+7eX378U/dKXqwSti8o0G7QSc7pumUgsxlvYMXsSBIHVBLkb9+uxdY2SyboPc8MnAfMKiabSzgMwd2k6Oy/MCsL0AbN+Z/MWX6Aw0Zn035VSxbV2GJ0tO25CJFD1fvO37uogitAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786615727; c=relaxed/simple;
	bh=xr+K1hMBEe0zNP4/Pm/bav3pBk5rAvZcaDrTjqXJvFE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R0g7fuWNYbQ+ilvnH531AxZVaMk1kWDTsilPMQ/bZdYb26XFxQo+FohCcUsJuACWksXeAF+uMwvLtz76bsWa/1oTp6kyteSItppw91El92HujH3PwaO1/23lehDL667jH6xdqITzEweZZfGyyYHRZBn6CuxJC77AS48O7AJtvjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FP6G3f5c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP6G3f5c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064971F000E9;
	Thu, 13 Aug 2026 10:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786615726;
	bh=fLz6hMSIeCX80zNyBCaivTyJxKuX7Fm2nTTsVF6FBMQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FP6G3f5cxs/y/Mx/0bT6tPWjPXzWIHGBN91NeUPVvLYSdOudw5itHbCKKURXnp8rk
	 LzpcYBuWPLpX5ZeJ4nJiqQDrB7vOcZ7UlPHIl7WY4P1o2N7n6RMnfncGbkQUlFH7tb
	 OE5Z9PPLxMjDXkPtrXyVj5xZ4HnggBd7ycNhT08vi2IbxHXtOzkLgzl9u+yoFa7Ap3
	 6P1ZpLKi8sdjcviC9hGgaz5v3vMlniahuGQW8cS1KKzDsxxcnBbrG7JKvamVgI4eQq
	 224PDBkXc9knaHhVsOPRpWmFtujtA4yHje4mssbkeAMQ35CU02TWohx8SQM3ooK/RE
	 dfBD7REOjTVEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] firmware: imx: dsp: fix mailbox channel leak on
 kasprintf failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linkai Gong" <gonglinkai@kylinos.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260813095818.2275666-1-gonglinkai@kylinos.cn>
References: <20260813095818.2275666-1-gonglinkai@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:08:45 +0000
Message-Id: <20260813100846.064971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked return value of `imx_dsp_request_channel()` in `imx_comm=
on_resume()` leads to invalid pointer dereferences when an `ERR_PTR` is pas=
sed to the mailbox framework.
- [High] Mailbox channels can be double-freed when the SOF driver is unboun=
d while in a PM runtime suspended state, potentially freeing another client=
's active mailbox channel.
- [High] Mailbox channels are requested and activated before `dsp_ipc->ops`=
 is initialized, creating a race condition where an incoming IPC message tr=
iggers a NULL pointer dereference.
--

--- Patch [1]: [PATCH] firmware: imx: dsp: fix mailbox channel leak on kasp=
rintf failure ---
commit 227ebd73d256ff38d002fc31b92731a44c2287e6
Author: Linkai Gong <gonglinkai@kylinos.cn>

firmware: imx: dsp: fix mailbox channel leak on kasprintf failure

This commit fixes a memory leak in imx_dsp_setup_channels(). If kasprintf()
fails to allocate memory for a channel name, the function now properly rout=
es
the failure through the existing cleanup path to free previously requested
channels.

> diff --git a/drivers/firmware/imx/imx-dsp.c b/drivers/firmware/imx/imx-ds=
p.c
> index ed79e823157af..7e3f45ddf0c18 100644
> --- a/drivers/firmware/imx/imx-dsp.c
> +++ b/drivers/firmware/imx/imx-dsp.c
> @@ -99,8 +99,10 @@ static int imx_dsp_setup_channels(struct imx_dsp_ipc *=
dsp_ipc)
>  		else
>  			chan_name =3D kasprintf(GFP_KERNEL, "rxdb%d", i - 2);
> =20
> -		if (!chan_name)
> -			return -ENOMEM;
> +		if (!chan_name) {
> +			ret =3D -ENOMEM;
> +			goto out;
> +		}
> =20
>  		dsp_chan =3D &dsp_ipc->chans[i];
>  		dsp_chan->name =3D chan_name;

[Severity: High]
This isn't a bug introduced by this patch, but I have a question about the
return value of imx_dsp_request_channel() in imx_common_resume().

If imx_dsp_request_channel() returns an error pointer during resume, it
appears we ignore the return value:

sound/soc/sof/imx/imx-common.c:imx_common_resume() {
    [ ... ]
	for (i =3D 0; i < DSP_MU_CHAN_NUM; i++)
		imx_dsp_request_channel(common->ipc_handle, i);
    [ ... ]
	return 0;
}

This can leave an unchecked error pointer in dsp_chan->ch. If the sof core =
then
attempts to send an ipc message, imx_dsp_ring_doorbell() passes this pointer
to mbox_send_message(). Could this cause a panic in the mailbox framework w=
hen
it tries to evaluate the invalid pointer?

[Severity: High]
This is a pre-existing issue, but does this cleanup pattern risk a double-f=
ree
of mailbox channels?

When the device goes into pm runtime suspend, we free the channels but don't
clear the pointer:

drivers/firmware/imx/imx-dsp.c:imx_dsp_free_channel() {
    [ ... ]
	dsp_chan =3D &dsp_ipc->chans[idx];
	mbox_free_channel(dsp_chan->ch);
}

If the driver is then unbound while suspended, imx_dsp_remove() uncondition=
ally
iterates over all channels and frees them again:

drivers/firmware/imx/imx-dsp.c:imx_dsp_remove() {
    [ ... ]
	for (i =3D 0; i < DSP_MU_CHAN_NUM; i++) {
		dsp_chan =3D &dsp_ipc->chans[i];
		mbox_free_channel(dsp_chan->ch);
		kfree(dsp_chan->name);
	}
    [ ... ]
}

Could this second mbox_free_channel() call force-free a channel that was
meanwhile requested by another client, or panic if it was left as an error
pointer?

[Severity: High]
This is a pre-existing issue, but is there a race condition during probe wi=
th
incoming ipc messages?

During imx_probe(), we register the platform device (which requests the mai=
lbox
channels and activates the rx callback) before assigning the ops:

sound/soc/sof/imx/imx-common.c:imx_probe() {
    [ ... ]
	common->ipc_dev =3D platform_device_register_data(sdev->dev, "imx-dsp",
							PLATFORM_DEVID_NONE,
							pdev, sizeof(*pdev));
    [ ... ]
	common->ipc_handle->ops =3D &imx_ipc_ops;
}

If the dsp is already running and sends an ipc message before ops is assign=
ed,
could imx_dsp_handle_rx() trigger a null pointer dereference here?

drivers/firmware/imx/imx-dsp.c:imx_dsp_handle_rx() {
    [ ... ]
	if (chan->idx =3D=3D 0) {
		chan->ipc->ops->handle_reply(chan->ipc);
	} else {
    [ ... ]
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813095818.2275=
666-1-gonglinkai@kylinos.cn?part=3D1
