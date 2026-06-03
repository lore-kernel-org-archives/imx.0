Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD60D2F7F00
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493277; cv=none; b=VmQUr9vZRmOfFyjgMTQDRvM2DBMcYdzskxtO9KzmTLp/fcrkJOk30mLyspic5MdmGVrPX9MiU2t7NUCTs8y70GJrV5qesMQiObTWNxwfjXJbnyErc6+d1AVlnR43UlqR5nEeev1K0tRk3+wJOopYXjukbtQewBTWBKbeX80fwAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493277; c=relaxed/simple;
	bh=g6PbEJa+9f5mbxBXQ+WEvgW4EHJaIJiO70dRmTkxr50=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hmbziYGKUkBKFeGu87O8i7fHdP8RxYqTNDHgEFSoXDva05nhV/x0HtB/kdkfqkvGZw31nPc2HocAFyr8G8/7lFsft1tUYUhNYEfhGjeYXLduWYZw8+WixHA6RqFE6ZDzFaOQ+t1/q25dGA+GXOyhrYWWWnHYuQeKWXA/vCKICzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoITiB8m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoITiB8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F4A1F00893;
	Wed,  3 Jun 2026 13:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780493276;
	bh=jy6A0bNCSPZwUB5DSvdTdgfnhY/TTGwdLBxTgukOLSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PoITiB8maK4aISDKrUBbBbehGiw+T0Yla8JQhCy5SV1aWJy3uKNa4muObhRz6WApj
	 aCRqh05kD8+RI7kGzAUpYuvI5U6P68ZclDzUUENnBrTbwIwPbPyg685btvQHBVYRdn
	 098hRxuors/PFoY/Li8SEbyI5hNhj193IjLtipu+6DQYA3Mx5KNKuO9CqjchIAtKup
	 ClffnG+g4QCznSgrOSEDiHkuML/ZVgR1Aiy9OFHlIpIsNJLmO/uFkGZ+pRCUtoIuaR
	 GPuENaKgkjntNmaYOuitQY62vyZ0/6K2I+zw/CyyZ9P3xJYJx+SC4Q1vjMMNlfz4Ke
	 ULKHwOjF9h7gg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/9] mailbox: imx: Use devm_pm_runtime_enable()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260603-imx_mbox_rproc-v2-2-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-2-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 13:27:55 +0000
Message-Id: <20260603132756.69F4A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double clk_disable_unprepare() on the devm_mbox_controller_registe=
r() error path.
--

commit 6af621bbda5cc8cf36298bb4f6590f6101b7c4a5
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mailbox: imx: Use devm_pm_runtime_enable()

This commit mitigates early usage of the device before probe completes
by delaying the pm_runtime_enable() into the removal path. It also moves
devm_mbox_controller_register() to occur after the pm-runtime handling.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
[ ... ]
> @@ -965,28 +965,28 @@ static int imx_mu_probe(struct platform_device *pde=
v)
[ ... ]
>  	ret =3D pm_runtime_put_sync(dev);
>  	if (ret < 0)
> -		goto disable_runtime_pm;
> +		goto disable_clk;
> =20
>  	clk_disable_unprepare(priv->clk);
> =20
> +	ret =3D devm_mbox_controller_register(dev, &priv->mbox);
> +	if (ret)
> +		goto disable_clk;

[Severity: High]
Does this error path cause a double clock disable?

If devm_mbox_controller_register() fails here, the code jumps to the
disable_clk label. However, clk_disable_unprepare(priv->clk) has already
been called just above this registration attempt. This means the error path
will disable the clock a second time, which could cause a reference count
underflow and potentially disable shared clocks.

> +
> +	of_platform_populate(dev->of_node, NULL, NULL, dev);
> +
>  	return 0;
> =20
> -disable_runtime_pm:
> -	pm_runtime_disable(dev);
>  disable_clk:
>  	clk_disable_unprepare(priv->clk);
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-imx_mbox_r=
proc-v2-0-a0059dc3b69a@linutronix.de?part=3D2
