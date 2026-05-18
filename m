Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF3A31714F
	for <imx@lists.linux.dev>; Mon, 18 May 2026 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779098896; cv=none; b=P0G3YBXsH1/KMqEEO3xOkP/Zp/9Ifc36uidgF6I64i0GSLvDujg2FcNsNIAEW7k4paTMZGbWj0kHiQvodgw1PvRH9zqLNpUBExGLgJifJPc1D1lcpFOWhQ7oOLidfgZUerYW5dX782dk2WmHYsnhAoXHtvANtj7zeVMTMu5i9YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779098896; c=relaxed/simple;
	bh=a4y3DzSQvhuM9ARYNTiRhSU4C6WETGBs7L9eYn6uXQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UbvlQhzQdcA6WXlkDwhWq/WYMji3Q8HDvzuIL2qK+Bx4TdUwJ63CbMbtH5YgnzWzeYbmoN+CnwxYHaQ+b7LJ07WaCZhryflA3VZtytyPE4R6KobSlzPRt5B3Kq3HeghuaKm1lqg6WsVhgeHz3m0WGfayeJmg4e/dsriPAneRGfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rf93CqOI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rf93CqOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FBCC2BCB7;
	Mon, 18 May 2026 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779098896;
	bh=a4y3DzSQvhuM9ARYNTiRhSU4C6WETGBs7L9eYn6uXQ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Rf93CqOIezGXj78A2dLDNbhHMpgBoiPKflBBjW2HlW9rcZPikiygboVmbp6pcjW4Z
	 Jdao99ZypUXNp5aCM+DLueta6NK4HX0mAuIIkQHsUUsNMmD561pd+ESWRQ7Qn4DAYv
	 SwSvGOOAWdd7ldIwhM1UBunzKlmWBDNEcXUdffkLIHwAF/rWEM0vlDowUEYqENM9Qh
	 MKjNf567McsbO1EhWLr5frrak9bI1ZVWHErK0ib1XMZdHNm6k3vAHr5ppnx2JYCIxk
	 v+DQ4TQ76DiPGQkgQ/hhGn4TbPxAeqAm5bjokTNb3Gf7k7OkWe/BH8WRre3j1iTBvS
	 FSC9Uv/0xZ9Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] firmware: imx: scu-irq: drop wakeup_src sysfs file,
 log via dev_dbg()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stepan Ionichev" <sozdayvek@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260518093934.1910-1-sozdayvek@gmail.com>
References: <20260518093934.1910-1-sozdayvek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 10:08:15 +0000
Message-Id: <20260518100816.38FBCC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The global device pointer `imx_sc_irq_dev` is cached without acqui=
ring a reference, risking a Use-After-Free.
- [Medium] Race condition in `imx_sc_irq_dev` initialization exposes an uni=
nitialized pointer to the work handler.
--

commit 3ac9bd2a1c44ca3562cddf96e23e9b5c60b0feea
Author: Stepan Ionichev <sozdayvek@gmail.com>

firmware: imx: scu-irq: drop wakeup_src sysfs file, log via dev_dbg()

This commit removes the undocumented sysfs attribute for waking up sources,
along with its supporting variables and kobject. It replaces the sysfs
interface with dynamic debug logging of the wakeup information via
dev_dbg() in the work handler.

Link: https://lore.kernel.org/all/2026051656-corral-edgy-290c@gregkh/

> diff --git a/drivers/firmware/imx/imx-scu-irq.c b/drivers/firmware/imx/im=
x-scu-irq.c
> --- a/drivers/firmware/imx/imx-scu-irq.c
> +++ b/drivers/firmware/imx/imx-scu-irq.c

[ ... ]

> @@ -233,29 +199,11 @@ int imx_scu_enable_general_irq_channel(struct devic=
e *dev)
>  	if (IS_ERR(ch)) {
>  		ret =3D PTR_ERR(ch);
>  		dev_err(dev, "failed to request mbox chan gip3, ret %d\n", ret);
> -		goto free_cl;
> -	}
> -
> -	/* Create directory under /sysfs/firmware */
> -	wakeup_obj =3D kobject_create_and_add("scu_wakeup_source", firmware_kob=
j);
> -	if (!wakeup_obj) {
> -		ret =3D -ENOMEM;
> -		goto free_ch;
> +		devm_kfree(dev, cl);
> +		return ret;
>  	}
> =20
> -	ret =3D sysfs_create_file(wakeup_obj, &wakeup_source_attr.attr);
> -	if (ret) {
> -		dev_err(dev, "Cannot create wakeup source src file......\n");
> -		kobject_put(wakeup_obj);
> -		goto free_ch;
> -	}
> +	imx_sc_irq_dev =3D dev;

Can the work handler execute before imx_sc_irq_dev is initialized?

If mbox_request_channel_byname() successfully enables the channel right
before this block, an interrupt could fire immediately, invoke
imx_scu_irq_callback() and schedule the work.

If the work handler imx_scu_irq_work_handler() executes before the
assignment to imx_sc_irq_dev completes, dev_dbg() will receive a NULL
pointer. While __dev_printk() handles NULL gracefully by printing
"(NULL device *)", it would mask the intended debug output.

Should imx_sc_irq_dev be assigned before requesting the mailbox channel?

Does caching the global device pointer here also risk a use-after-free?

The dev pointer is stored in imx_sc_irq_dev without acquiring a reference.
Since the workqueue and mailbox channel aren't explicitly torn down on
failure or unbind, the pending asynchronous work might still run after the
device is removed.

If the device is freed, accessing it in imx_scu_irq_work_handler() via
dev_dbg() could lead to a use-after-free.

Would it be safer to take a reference with get_device() to guarantee the
device's lifetime during asynchronous execution?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518093934.1910=
-1-sozdayvek@gmail.com?part=3D1
