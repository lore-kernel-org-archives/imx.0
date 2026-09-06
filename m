Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B063B6C0E
	for <imx@lists.linux.dev>; Sun,  6 Sep 2026 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788676157; cv=none; b=XvvaWH5ETmKlPwCgZ+9/SweChr9SGAKzZ4h6cjV0XpNNyTAVTEhSWjZsWyaWez2WnCINrgOvF6WQbqROKuyfPHJpkkjx9iGSXa1h6QtTttmcbhrK5JYy7oS0Uu0qctXqmgKLLp6/RTfCA01YMFzCMOtEoaF6ULjPTK72Ohyq2l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788676157; c=relaxed/simple;
	bh=UmfC3hVGKjNSJqUyz70xg+m+KBGoYeMdezoi71Ap9OU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Loya1ny31S1MXXe9MC8/qqqTglXD4WB7GpQiHuzvueBNjjG+Cqp4MqQMauXNRJWnfai/5AB4B6+qzu4NC+u5g20OKlanlrRq4MUjctsIYYHoSFdURaOu43ZF/cATwu6v5zUetgczjVjLrRy1FBA5j0jh1Sff2gembL1jBSHwwVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUuXOaMY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUuXOaMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542061F00A3F;
	Sun,  6 Sep 2026 06:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788676155;
	bh=TciiF/4994JCn4e85s2xJj0yoyAJn3xc6dwPj+wpH24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZUuXOaMYIfoXfpVV6k03hK35wdxl3U4SVnFf63ZHuIqK7GZnvjGN5NWszCTzeFkp0
	 XDYg2TYs95b1zHUlhyRXrEw7bm7GXroBlGo4ylGjQYNtJHTv/6Tk880cV3WrpSJF2P
	 X3Ob+5/v0iw4Tac1ciB4R0mZ6RDF1KcVwYYZxk+PMFegcxHIzLvmRfe03L5Yk2Chp8
	 RzhSv02fFE0I1nhJ1OCYIC8Qsb9ET5Z73sZXCBcpj763RLQPy93EUwDok9vlrn5jec
	 DNC4PG8YEQD/M0VWgAReaD4RF5KUuNi7jzfMn+TQ1dGs7BGOddns4+Dm9O7AGShhg/
	 oMuskoPemJoHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] devfreq: Use %pe to print error pointers
 symbolically
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumeet Pawnikar" <sumeet4linux@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260906061755.5103-5-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
 <20260906061755.5103-5-sumeet4linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 06:29:14 +0000
Message-Id: <20260906062915.542061F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Mixing devm-managed devfreq devices with manual resource cleanup c=
reates a Use-After-Free window where the devfreq governor remains active.
--

commit 1c53c8340b588403af3236e1cac077099e3f1d6f
Author: Sumeet Pawnikar <sumeet4linux@gmail.com>

devfreq: Use %pe to print error pointers symbolically

This commit replaces PTR_ERR() and %ld with the %pe format specifier for
printing error pointers in several devfreq drivers. It allows dev_err() to
print symbolic error names when enabled, falling back to the raw integer va=
lue
otherwise.

> diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-=
devfreq.c
> index 4c22be728f6a0..bda788909887e 100644
> --- a/drivers/devfreq/mtk-cci-devfreq.c
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -364,8 +364,8 @@ static int mtk_ccifreq_probe(struct platform_device *=
pdev)
>  					       passive_data);
>  	if (IS_ERR(drv->devfreq)) {
>  		ret =3D -EPROBE_DEFER;
> -		dev_err(dev, "failed to add devfreq device: %ld\n",
> -			PTR_ERR(drv->devfreq));
> +		dev_err(dev, "failed to add devfreq device: %pe\n",
> +			drv->devfreq);
>  		goto out_remove_opp_table;
>  	}
> =20

[Severity: High]
This is a pre-existing issue, but mixing devm-managed devfreq devices with
manual resource cleanup appears to create a use-after-free window where the
devfreq governor remains active.

In mtk_ccifreq_probe(), if dev_pm_opp_register_notifier() fails later in the
function, it jumps to the cleanup code:

mtk_ccifreq_probe() {
    ...
    drv->devfreq =3D devm_devfreq_add_device(...);
    ...
    ret =3D dev_pm_opp_register_notifier(dev, &drv->opp_nb);
    if (ret) {
        ...
        goto out_remove_opp_table;
    }
    return 0;

out_remove_opp_table:
	dev_pm_opp_of_remove_table(dev);

out_disable_cci_clk:
	clk_disable_unprepare(drv->cci_clk);
    ...
}

This manual cleanup is performed before devres cleans up the devm-managed
devfreq device. Since the passive governor registers a CPU frequency notifi=
er,
could a background CPU frequency transition during this window trigger the
target callback on freed OPP tables and disabled hardware, potentially lead=
ing
to a kernel panic?

A similar issue appears to exist in mtk_ccifreq_remove(), where manual clea=
nup
occurs before devres stops the devfreq passive governor.

Additionally, in imx_bus_probe() in drivers/devfreq/imx-bus.c, the error pa=
th
manual cleanup creates a use-after-free window for the still-active devfreq
device. Since it uses the userspace governor, does this make it susceptible
to sysfs writes during module removal or probe failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906061755.5103=
-1-sumeet4linux@gmail.com?part=3D4
