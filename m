Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79381373BEC
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 01:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781572607; cv=none; b=Hq0DykxbqQ4X3k5+SFeMLn/6Fn9vqZMmShKPHizyaVb+aoHjySodS+czsH0xvmh0N/OVtz9v2euduARGvZ97u/IULwPdMgQLoxc+mcKG86EFADctV/7LMwBCuD/sG6nGHZPxRctWgxCbwOJXaeAX8xlJnjEnkcSEsOxLBOAxi0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781572607; c=relaxed/simple;
	bh=3J6PjSZ8cUhj4tUYt3y+X6CxtlrB++EA37cljLVGAXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k1PsQfadoSFCqdOKFMc8YY3pU4EEiw39JthK1CQgzErHszWly11vE9b6aAbdh6OrEdR4pEkphyCwM1uqMYWugFn6FwceK/YpfZxtcGp1OE69xhZ0QFN+BS9FNUwYy7277pwR2mnhlFLQK+6SkIWusknaG8bH1AyfIRbI3RRmQWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy1XsWZt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy1XsWZt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E23431F000E9;
	Tue, 16 Jun 2026 01:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781572606;
	bh=dYKHYuDMVofCths/DFkgxs3fhKjoO7SLomM2+Ie+x28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hy1XsWZtLfPaPkB4xggiJmPKRQBOJMvOjFuZupd5BmKS2wROfK6GqP4n+SFn0OnZV
	 TvyHjM0Lt4ya8SOSH8+fjyzN0B80EfieeRg4OzYMQgCkvnky8hu2krhGF9CD+5zPn6
	 hoMBqCy5lmIGIQydY2VJqHS4K+TtdrgM6QdFbOW01+IKNaMXD8uRviyNHaD8azqh8L
	 jNIq+eblYUP8ZS8CNsDoMbJ9NcPox4VjRHDbiMXvXfOQ3+xX7lf6p7Bx0dXb+sOaLg
	 bNqDiXetJmwDt4ByyTNb5ZyQB1X5fiUcvdwK99nDElnTYeFXFbgQUUIM60Acvk9kOw
	 lC4lVoqazsyzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] firmware: imx: scu: manage mailbox channels and global
 handle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260616005902.11634-1-pengpeng@iscas.ac.cn>
References: <20260616005902.11634-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 01:16:44 +0000
Message-Id: <20260616011645.E23431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Stack memory corruption (Use-After-Free) in IPC message handli=
ng due to missing cleanup on timeout. This problem wasn't introduced by thi=
s patch.
- [High] Use-After-Free of `gip3` mailbox client due to missing channel cle=
anup on probe failure. This problem wasn't introduced by this patch, but th=
e patch fails to address it while fixing similar channels.
- [High] Use-After-Free of `soc_dev_attr` due to missing `soc_device_unregi=
ster()` on probe failure. This problem wasn't introduced by this patch.
- [High] Dangling secondary global IPC pointers (`imx_sc_irq_ipc_handle`, `=
imx_sc_soc_ipc_handle`) on probe failure. This problem wasn't introduced by=
 this patch.
- [High] Memory and Sysfs Leak of `wakeup_obj` on probe failure. This probl=
em wasn't introduced by this patch.
--

commit 3f448f232286443e24cf5f0724f9dcaccfa3cf22
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

firmware: imx: scu: manage mailbox channels and global handle

This commit registers devres actions to free mailbox channels and clear the
global handle upon probe failure. It also depopulates partially created chi=
ld
devices when devm_of_platform_populate() fails.

> diff --git a/drivers/firmware/imx/imx-scu.c b/drivers/firmware/imx/imx-sc=
u.c
> index 67b267a7408a1..203aac4212529 100644
> --- a/drivers/firmware/imx/imx-scu.c
> +++ b/drivers/firmware/imx/imx-scu.c
> @@ -330,6 +346,9 @@ static int imx_scu_probe(struct platform_device *pdev)
>  	init_completion(&sc_ipc->done);
> =20
>  	imx_sc_ipc_handle =3D sc_ipc;
> +	ret =3D devm_add_action_or_reset(dev, imx_scu_clear_handle, sc_ipc);
> +	if (ret)
> +		return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does clearing the primary
handle leave dangling pointers in the secondary ones?

While imx_scu_clear_handle() correctly clears the primary imx_sc_ipc_handle
on failure, imx_scu_enable_general_irq_channel() and imx_scu_soc_init()
have already copied it:

drivers/firmware/imx/imx-scu-soc.c:imx_scu_soc_init() {
    ...
	ret =3D imx_scu_get_handle(&imx_sc_soc_ipc_handle);
    ...
}

drivers/firmware/imx/imx-scu-irq.c:imx_scu_enable_general_irq_channel() {
    ...
	ret =3D imx_scu_get_handle(&imx_sc_irq_ipc_handle);
    ...
}

If devm_of_platform_populate() fails, devres frees the sc_ipc object, but
these secondary static pointers remain set. Could this lead to a
Use-After-Free if exported functions like imx_scu_irq_get_status() are
invoked later?

> =20
>  	ret =3D imx_scu_soc_init(dev);
>  	if (ret)

[ ... ]

> @@ -342,7 +361,11 @@ static int imx_scu_probe(struct platform_device *pde=
v)
> =20
>  	dev_info(dev, "NXP i.MX SCU Initialized\n");
> =20
> -	return devm_of_platform_populate(dev);
> +	ret =3D devm_of_platform_populate(dev);
> +	if (ret)
> +		of_platform_depopulate(dev);

[Severity: High]
This is a pre-existing issue, but are there other resources missing devres
cleanup when devm_of_platform_populate() fails?

In imx_scu_enable_general_irq_channel(), the gip3 mailbox channel is
requested, but the pointer is discarded on success without registering a
cleanup action:

drivers/firmware/imx/imx-scu-irq.c:imx_scu_enable_general_irq_channel() {
    ...
	cl =3D devm_kzalloc(dev, sizeof(*cl), GFP_KERNEL);
    ...
	ch =3D mbox_request_channel_byname(cl, "gip3");
    ...
}

If probe fails here, the memory for cl is freed by devres, but the mailbox
core still considers the channel active. Could an incoming interrupt trigger
the mailbox RX callback and cause a Use-After-Free?

Additionally, this same function creates a kobject without devres:

	wakeup_obj =3D kobject_create_and_add("scu_wakeup_source", firmware_kobj);

Does this permanently leak the kobject on failure and break deferred probing
by causing duplicate name errors later?

[Severity: High]
This is a pre-existing issue, but does the SoC device need to be unregister=
ed
if probe fails?

In imx_scu_soc_init(), the SoC device is registered:

drivers/firmware/imx/imx-scu-soc.c:imx_scu_soc_init() {
    ...
	soc_dev_attr =3D devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
    ...
	soc_dev =3D soc_device_register(soc_dev_attr);
    ...
}

If devm_of_platform_populate() fails, the soc_dev_attr memory is freed by
devres, but the SoC device remains registered. Could reading its sysfs
attributes (like revision or serial_number) dereference the freed memory?

> +
> +	return ret;
>  }

While reviewing the IPC handling, I noticed another pre-existing issue:

[Severity: Critical]
This isn't a bug introduced by this patch, but could a timeout here lead to
stack corruption?

In imx_scu_call_rpc(), if wait_for_completion_timeout() times out, the
function returns immediately:

drivers/firmware/imx/imx-scu.c:imx_scu_call_rpc() {
    ...
	if (!wait_for_completion_timeout(&sc_ipc->done, MAX_RX_TIMEOUT)) {
		dev_err(sc_ipc->dev, "RPC send msg timeout\n");
		mutex_unlock(&sc_ipc->lock);
		return -ETIMEDOUT;
	}
    ...
}

Because sc_ipc->msg isn't set to NULL before returning, it remains pointing
to the caller's stack frame. If a delayed hardware response arrives later,
could imx_scu_rx_callback() write the incoming payload into this reused
stack memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616005902.1163=
4-1-pengpeng@iscas.ac.cn?part=3D1
