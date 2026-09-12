Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C2937882E
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 04:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789185809; cv=none; b=Q1V4+/hwQipfxofJwfS6g3ENgPQEVYFoV9Hsx6+YuJAtiBFyf8fZ0/kTYmo4OI9xdztV33QHP9sRtkl0plPIi0FBfhQOIzcWv1Zudmuo2PBVmpyt8jgdCj5/XHbMs5x2pAwD9DxtWdLvehvHD85p/hTEZ6Zoeciib/6orl0wjI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789185809; c=relaxed/simple;
	bh=L0mn2198LnQ0nl53UXsUWyRmQbfpqMP2DMguxW0hgFw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VhRXn9EjGrkEaDrl69fhUMEX5cP/lDf907NAxfGzZor/jQX3U5utz5Q8xB4BcL8Nc9O/pr42dju2amE0t4jQwQ9qsinWJpM+sEo5rkY0ONG8TYZVtrsSgQiBvJEQHUGd68d3hOXYJ9iMeu4HDXzs0JXgv0l0OMRJQvBC0r8xuls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJm4EcaR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJm4EcaR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A295B1F00893;
	Sat, 12 Sep 2026 04:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789185804;
	bh=0keVGxahnHSgrHCCEH9lNMYjbmT06gY67u16adAdu2o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fJm4EcaRupX7fdeQEgwFhrM6dnWRBZ9XWoh9jZ7pjMzEtmH0l4AdawzJ2PZDvtbYg
	 EuG+jYY+RMOqaWeVwhEGFSynmgHbofuP4jaegMtwJX6zozUnNueImOmQLhCu5v7QeT
	 eR6jSuIZA+vqkul0aWuBM7KC3xW5xGF2Smx4NVBjmY1+NWxH2xRPoscUOKauNxjM5d
	 IN6dVS4v/q3fmyBvuig68kgOyt8dIl3WLAoyDSvh+eO+htDlg25MV4t+/44scgVUB4
	 quzNzk2/jeubBlgnwXJkaqjn8tn42+OJYV9zPsdBPjMql+QomKQzQW7qTB3HuV2ABb
	 JH1BOLUb2RIgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 2/2] net: fec: Handle optional IRQ lookup
 errors correctly
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260911040021.12289-2-phucduc.bui@gmail.com>
References: <20260911040021.12289-1-phucduc.bui@gmail.com>
 <20260911040021.12289-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 04:03:24 +0000
Message-Id: <20260912040324.A295B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential use-after-free of `ndev` in `fec_enet_interrupt` on prob=
e failure.
--

commit 19be3910bd7eb3aa9548563b8072044fa307b0bc
Author: bui duc phuc <phucduc.bui@gmail.com>

net: fec: Handle optional IRQ lookup errors correctly

Handle errors from platform_get_irq_byname_optional() explicitly while
preserving the existing fallback to platform_get_irq() when the named IRQ
is not available.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index c6e29b5c2abb4..f7636f23d1ebb 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -5397,12 +5397,17 @@ fec_probe(struct platform_device *pdev)
>  	for (i =3D 0; i < irq_cnt; i++) {
>  		snprintf(irq_name, sizeof(irq_name), "int%d", i);
>  		irq =3D platform_get_irq_byname_optional(pdev, irq_name);
> -		if (irq < 0)
> -			irq =3D platform_get_irq(pdev, i);
> -		if (irq < 0) {
> +		if (irq < 0 && irq !=3D -ENXIO) {
>  			ret =3D irq;
>  			goto failed_irq;
>  		}
> +		if (irq =3D=3D -ENXIO) {
> +			irq =3D platform_get_irq(pdev, i);
> +			if (irq < 0) {
> +				ret =3D irq;
> +				goto failed_irq;
> +			}
> +		}
>  		ret =3D devm_request_irq(&pdev->dev, irq, fec_enet_interrupt,
>  				       0, pdev->name, ndev);

[Severity: High]
This is a pre-existing issue, but does this create a potential use-after-fr=
ee
if a subsequent step in the probe path fails?

Because this interrupt is requested via devm_request_irq(), it won't be
unregistered until after the probe function returns and devres cleanup runs.

However, the probe error path explicitly frees the network device:

drivers/net/ethernet/freescale/fec_main.c:fec_probe() {
    ...
failed_ioremap:
    free_netdev(ndev);

    return ret;
}

Does this leave a window where an interrupt could fire (e.g., from a shared
IRQ line or pending hardware event) while we are returning from probe, caus=
ing
fec_enet_interrupt() to access the freed ndev pointer?

>  		if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911040021.1228=
9-1-phucduc.bui@gmail.com?part=3D2
