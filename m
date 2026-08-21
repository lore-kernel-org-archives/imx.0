Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639B8471D05
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308010; cv=none; b=oPey8MvJ2nCqDsx+sKLJwcCDg/8rqBCA06uX0g8IaQEobCWvsdD35POQqVjnPDY36ww/yB0orRmHpGcLKow1gzTT1MSATgxTqAqutdQ06IkDP4LbdUZXVehOVIzWiss7JaOWfaQu5OnTn4LEQYfUMYc5/RUAfPo20eYtZj/nH0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308010; c=relaxed/simple;
	bh=o2iDxnIfsBlJDufy/+JBARh06z2UYA0iNNzGuCOAatY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aKXN/S0womZMMtdjJJ5DC2hwDV305B3p37ipyRhtbrr04u7fsn41XTcCmc0sO6KH+aIj5pIL+zpXwKdmOy5wmL9RZ4BuTG3bpft/w8NdG8UgYzE4YERjbDHJOKzqG2dr9wKLsn4qg/den94wQAuOqtJ6TuQfxGvmtHgJ5KFB/CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2jyWrLZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2jyWrLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102DF1F0155B;
	Fri, 21 Aug 2026 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787308001;
	bh=OSkaL5nZsG8W85DLNodyv6ZvEwbTTffOzB/uXnmZoqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m2jyWrLZ1udKQfP5gXMWijLYKgok/qpctKJtLrH9nH1/1LP3pwj7DOQa9XGS7tq47
	 N5ua2pMgcW3jL76ZztWJHnWczzS9nwv10PNHMqDHJNqGOhI5psG/umlJEYmCDgk92F
	 tnMHOYq0q0K4J2k3NnBdyI9k1VpscnXsT+O975dn1kdKYpvAeOKFjtnLkei6eboh57
	 Nrk25SbUC31jtKkxJVWA6UEX4G/2FBXsg0PLEOiVouSgOwWBgCuAA4zeQ2anYlOuIr
	 LO26C0J/wgOOqAoNF/8YkIMSLjYn1tn9kf1+aiq5+1XcIUF7+2mSEuu2UEsHuRGlHN
	 xJ3MwDXZ8rvnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/9] irqchip/imx-irqsteer: Allow building as module
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260821101039.4037925-8-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
 <20260821101039.4037925-8-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:26:40 +0000
Message-Id: <20260821102641.102DF1F0155B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Unbalanced `pm_runtime_resume_and_get()` in `imx_irqsteer_remove=
()` leaks the PM runtime usage counter, breaking autosuspend upon module re=
load.
--

--- Patch [7]: [PATCH v5 7/9] irqchip/imx-irqsteer: Allow building as modul=
e ---
commit 392fba6a4866bd8979dac996d023521bdcba0251
Author: Jindong Yue <jindong.yue@nxp.com>

irqchip/imx-irqsteer: Allow building as module

This patch makes the imx-irqsteer driver buildable as a module by changing
the Kconfig symbol to tristate. It also replaces builtin_platform_driver()
with module_platform_driver() and adds the necessary module metadata.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index c2f58787f9a86..dad09e095ed1a 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c

[ ... ]

> @@ -380,4 +382,7 @@ static struct platform_driver imx_irqsteer_driver =3D=
 {
>  	.probe		=3D imx_irqsteer_probe,
>  	.remove		=3D imx_irqsteer_remove,
>  };
> -builtin_platform_driver(imx_irqsteer_driver);
> +module_platform_driver(imx_irqsteer_driver);

[Severity: Medium]
Will this leak the PM runtime usage counter on module unload?

When module unloading is enabled by this change, unloading the driver calls
imx_irqsteer_remove().=20

In that function, pm_runtime_resume_and_get() is called without a balancing
put:

drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_remove() {
        ...
	pm_runtime_resume_and_get(&pdev->dev);
        ...
}

Because the driver core does not reset this usage count on device unbind,
and there is no balancing pm_runtime_put_noidle() before the function
exits, the PM runtime usage count is incremented permanently.

If the module is subsequently reloaded, will it start with an elevated
usage count, preventing the device from entering runtime suspend and leaving
its clock enabled indefinitely?

> +
> +MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver"=
);
> +MODULE_LICENSE("GPL");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821101039.4037=
925-1-Zhipeng.wang_1@oss.nxp.com?part=3D7
