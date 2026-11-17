Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900528;
	b=enjlgs3O6rIiLN6tb7VA2wWdrRzF0RZy5qKaZyc7r2vtPxk99dAoJDMltz2FrY3Y4S8N
	 zwBRL9K2VJH6Tkfs/kB4hCx3SUH6v1RmFw8p8YXajeHRPDBkujInvolhU+TV/XJhVNU66
	 egPyFBG/NZ42Y1Pl+SjzbXzArHtbDZaKmMNt8026lEiyULuLPb2dgvDIR2gGpYIcN2a/D
	 8z6VRkIUkcsmuQhVfcjBg8PMmCg4dkdiDgDAT79th8Bt0Rt1Byu0r113mnyMxTj+4qhrJ
	 MC+DcR6jhY6uqDNlBpYx3ALoI6NAlTGqA8rHhExyVvp+FKoJlj1stKCSncWaLTwsb6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900528;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PDirAEMiyce6Xby/owWrJFqKuo+G84rGMHiqJqLmaTQ=;
	b=3Fk5Zt8Lz/CmOh6INDRYMeVKiC9kKpPmJQWnizhhVp6ncZDkfymEMzNYEzKVgHTqy13y
	 8NlDiM4X+JjRM4Mrx355l2/CQQ+556z7ulqYEP4axhxgQPladwA4lSLP0fXhNtiULKSyS
	 vu8eQWF//V7OkqtYOgE2A2fXfCZIuSZD6Xrk4SAPUcOBGTsNf8R4z2NdWc+WCnauUvRl6
	 ROO+rS1GlobKnJnS7ZitELQIgDkhE7fwag2/lHJjB0cbtDirBCnA53lm/oGQXsR2oqmE9
	 9oVhehRkbmeGCvsw2yrnXKXk+fwURgtU/FA984mdNWd8LhqAaqW8si/ZhXryzzsGe0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORJ6+1Qu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F8D606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ORJ6+1Qu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1CA1F000C4;
	Tue, 17 Nov 2026 07:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794900528;
	bh=PDirAEMiyce6Xby/owWrJFqKuo+G84rGMHiqJqLmaTQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ORJ6+1QuVRmLXQi5adrucUK9+ph/ISO5qTQIXMObH1/TuWlHtUrCD49u+YAM7rvuW
	 xfn0/6K8h6mx0rLhvAH3rUv/MnS377WjqYuYxB9HK4OW029xgKVGQrMcWxtyTTVaFc
	 eM/aUN+9LO8AI4G/LiZRUDCuFKdtdKrlzYHUTHEivxUb7uqkftqkwAeJrRNjxDPia8
	 2EeyekWnxoZpSDzRCHQ/rzJuPfxL3iMD23+fl1iONmzzQk1qc9at6qQIdp/Z6RwS5A
	 kjhQpcoUCbnzienRN825sHL1naq4AqdRMESMC0T4VsMnckDW9BM3LceFiJ8s26NPnT
	 aLFGKk7OKW1LA==
Message-ID: <sashiko-outbox-218347@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/8] irqchip/imx-intmux: Use devm_clk_get_enabled()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Peng Fan" <peng.fan@linux.dev>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261117-imx-intmux-v1-6-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
 <20261117-imx-intmux-v1-6-189e7e0ad98d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 07:28:47 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] irqchip/imx-intmux: unbalanced clock disable in
  imx_intmux_remove() on error
--

commit d7b67b8e6922337551fee107f931cdac342397ec
Author: Peng Fan <peng.fan@nxp.com>

irqchip/imx-intmux: Use devm_clk_get_enabled()

This commit replaces devm_clk_get() and manual clk_prepare_enable() and
clk_disable_unprepare() calls for ipg_clk with devm_clk_get_enabled().

> diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-i=
ntmux.c
> index ebfff621e5a90..755c070073902 100644
> --- a/drivers/irqchip/irq-imx-intmux.c
> +++ b/drivers/irqchip/irq-imx-intmux.c
> @@ -226,7 +226,7 @@ static int imx_intmux_probe(struct platform_device *p=
dev)
>  		return PTR_ERR(data->regs);
>  	}
> =20
> -	data->ipg_clk =3D devm_clk_get(&pdev->dev, "ipg");
> +	data->ipg_clk =3D devm_clk_get_enabled(&pdev->dev, "ipg");
>  	if (IS_ERR(data->ipg_clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
>  				     "failed to get ipg clk\n");

[ ... ]

> @@ -323,7 +316,6 @@ static void imx_intmux_remove(struct platform_device =
*pdev)
>  	pm_runtime_disable(&pdev->dev);
>  	if (ret >=3D 0) {
>  		pm_runtime_put_noidle(&pdev->dev);
> -		clk_disable_unprepare(data->ipg_clk);
>  		pm_runtime_set_suspended(&pdev->dev);
>  	}
>  }

[Severity: Medium]
Can this underflow the enable and prepare counts on data->ipg_clk if
pm_runtime_resume_and_get() fails in imx_intmux_remove()?

At the end of imx_intmux_probe(), pm_runtime_put() allows runtime PM to
suspend the device via imx_intmux_runtime_suspend(), which calls
clk_disable_unprepare(data->ipg_clk).  Previously, imx_intmux_remove()
only disabled data->ipg_clk when pm_runtime_resume_and_get() succeeded
(ret >=3D 0).  With devm_clk_get_enabled(), devres unconditionally calls
clk_disable_unprepare(data->ipg_clk) after imx_intmux_remove() returns,
disabling the clock a second time when runtime resume fails.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-imx-intmux=
-v1-0-189e7e0ad98d@nxp.com?part=3D6
