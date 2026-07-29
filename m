Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269C6379C38
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 06:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307654; cv=none; b=XUZUQhsfAVHKuQQo22qOFS/BhYf9e/87S9PYstC5fUQtOhlPcSAwQnJxpbMtsAbmd6vJtq+t45EDg32YI2Sk+gTMqw43lvWASg+qP2Z0lH2JenklXHTOBUDu4j2njY/Dk1pCwy/oJoVY/kp7MCJ7vNQCe1yIP+TNwuRtcW5LDd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307654; c=relaxed/simple;
	bh=MnDOo/mAdazPYcdITAUiubsP3IDC4UWjzsHU8/VXIaQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Edr88msmjRJKpWAwGqp/vXmx5Qmkl3GgB3MJXo6O2Tkq7jhMvBsQfo2f0D82QJe5wIk7wcpYMPRkCudtLIYTWBpEHq8tAFJElFvWZhyxPRHZLQgs29a/lRihB/8AlKU9yqkLMNnpXyCxRtswl53pBGFDDCZhifXgM8yj/aJJZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7PSJc0d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7PSJc0d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8F41F000E9;
	Wed, 29 Jul 2026 06:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785307652;
	bh=kzvLLWQWWWYvpjpHQI8WPcq5zaOYMxZaJrIgJ7DIBas=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U7PSJc0d/xznvHYkV6sIKoa/hl/GVCYQbGiwZTPklfYvaqbkjUt/gfA7euh8zT+L3
	 6mzAAIBD0F3nAuQBh02RJCO0d1mBVSN+a0wO5JFwzf/k3b6vaLncEY0btcQbc3G0wT
	 5RGfGq2atqel+iUpRE2wXcHno641LFCLlaeBG2ci5D3+OlnKEJl4YVGr1iBw4ZDnqL
	 q5/nO7J5lM50r1nkW5PAKwdNkxWKMp25fOzsMYA7cjz7y+qO9xkGXakk6y7CqlGasK
	 wU5plAVqC/YBGuZ3VKsK3dE71PxiCwgbrJS2N3CzOVSS4rXh/yI3x/N6Kyq5SCXg8x
	 cFZ3JQCCN/yrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/6] phy: fsl-imx8mq-usb: fix typec switch leak on
 probe error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: neil.armstrong@linaro.org, imx@lists.linux.dev, vkoul@kernel.org, Frank.Li@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260729-imx8mp-usb-phy-improvement-v7-1-c385ee40ade6@nxp.com>
References: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
 <20260729-imx8mp-usb-phy-improvement-v7-1-c385ee40ade6@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 06:47:31 +0000
Message-Id: <20260729064732.4B8F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A race condition during probe allows `imx_phy->tca` to be derefere=
nced by a Type-C consumer before it is actually assigned, leading to a NULL=
 pointer dereference.
- [High] If the PHY device is unbound via sysfs, devm-managed structures ar=
e freed while Type-C consumers might still hold references to the switch, l=
eading to a Use-After-Free.
--

--- Patch [1]: [PATCH v7 1/6] phy: fsl-imx8mq-usb: fix typec switch leak on=
 probe error path ---
commit bdfb57c97d01c6ce3c92e388f5a6cf33401f0d53
Author: Felix Gu <ustc.gu@gmail.com>

phy: fsl-imx8mq-usb: fix typec switch leak on probe error path

This commit fixes a typec switch leak that occurs on the probe error path.
It transitions the cleanup mechanism to use devm_add_action_or_reset(),
ensuring the switch is properly unregistered on both probe failure and
driver removal. The manual imx95_usb_phy_put_tca() cleanup is completely
removed.

Cc: stable@vger.kernel.org

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index b05d80e849a14..9a33c06d6fc39 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -266,17 +267,11 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct=
 platform_device *pdev,
>  	tca->orientation =3D TYPEC_ORIENTATION_NORMAL;
>  	tca->sw =3D tca_blk_get_typec_switch(pdev, imx_phy);

[Severity: High]
This is a pre-existing issue, but does this create a race condition where
imx_phy->tca is dereferenced before it is assigned?

When tca_blk_get_typec_switch() calls typec_switch_register(), the switch
device is immediately exposed to the system. A Type-C port controller could
discover it and call typec_switch_set(), which triggers
tca_blk_typec_switch_set().

That callback reads imx_phy->tca:

tca_blk_typec_switch_set() {
    ...
    struct tca_blk *tca =3D imx_phy->tca;

    if (tca->orientation =3D=3D orientation)
    ...
}

However, imx_phy->tca is not assigned until imx95_usb_phy_get_tca()
completes and returns to the probe function, leaving a window where the
callback might dereference a NULL pointer.

> -	return tca;
> -}
> -
> -static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> -{
> -	struct tca_blk *tca =3D imx_phy->tca;
> -
> -	if (!tca)
> -		return;
> +	ret =3D devm_add_action_or_reset(&pdev->dev, tca_blk_put_typec_switch, =
tca->sw);
> +	if (ret)
> +		return ERR_PTR(ret);

[Severity: High]
This isn't a bug introduced by this patch, but does relying on devm
allocation for imx_phy and tca lead to a use-after-free if the device is
unbound?

When the PHY device is unbound via sysfs, devres automatically frees the
imx_phy and tca structures. Although typec_switch_unregister() removes the
switch from the system, Type-C consumers that already acquired references
(holding a kref via typec_switch_get()) can still invoke the switch
callback.

If a consumer calls typec_switch_set() after unbind, it will trigger
tca_blk_typec_switch_set(), which accesses the freed memory:

tca_blk_typec_switch_set() {
    struct imx8mq_usb_phy *imx_phy =3D typec_switch_get_drvdata(sw);
    struct tca_blk *tca =3D imx_phy->tca;
    ...
}

> -	tca_blk_put_typec_switch(tca->sw);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-imx8mp-usb=
-phy-improvement-v7-0-c385ee40ade6@nxp.com?part=3D1
