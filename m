Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A80B41D4CE;
	Tue,  7 Jul 2026 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430698; cv=none; b=GUQvYd4/+k8jQl+3R4BDCcNhricAUZCFJA49uxyCDvttkl7mZedGOrsiAbGgdZB5b8WlH4iMwo6WlQQi7/ExEvwJ7WF3rFyeU295H6R6rPusWv72CZv1/XmnI5dQRpHBWIVldPPcRURQmKaSo6+hEMrXKGUFub+Tt0Km8STRcj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430698; c=relaxed/simple;
	bh=Wej29S0VAtZ/8BvvMDLr41KKQMYEkwBh1kR6FYD2RRQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JOBK5cHQTFk8F8paI3ADuBXMgG8HIWnxOC8Qtu6VQ0N8ge22UCqNdi/FjtNmIg8ovIPGdnh231HAmj95PUcryiz+Ae/iQqu0MWUcjttjfaP67+qg9hjk45u1VNf1GEviBJMKwETiwz0D4Y9bpn2z+ysPgThhgjyjB45NduvKY3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMIXSZ7o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMIXSZ7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D7F1F000E9;
	Tue,  7 Jul 2026 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430697;
	bh=y17LUleYEX0q9MyTF0411GvfFuGvXizEjB0O8zVFy3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gMIXSZ7oijkXjBZ/39Tkvqx+3XLDPUSuL5CTxoCCFL2HJBmNWqY9s7PKdsdclKkRg
	 rapkueMGaBEgKKPjBXXLPeFZ15tkbtFy5CuyO8EWwGSrJBK5yrzPi88hM6NcetW1vx
	 /3TbIwDvtoxj9XNs3rmqHECG0nWPJzROqOHDs6ji0TzYbBqiTtCoueFu3vaeEKqySN
	 xoS5Hduos042HuQu6UarM2Qu2Lcx+VLBOP7RMWDShCGjzB1NKyoSja06FHD8NLGRmf
	 qzTjf03UZbs70bSSLWacYX20b82U06O4ha67YeUKEJm2SUwbVe+Bp+fOJXHx8+UjYq
	 oS2aJs6BqZgfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/20] iommu/fsl: use platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, mfd@lists.linux.dev, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-9-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-9-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:24:56 +0000
Message-Id: <20260707132456.C9D7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mixing `goto`-based error handling with `__free()` cleanup in th=
e same function.
--

commit 59e996ccb5b78974f4d3d6c2abcfbc8e49cb4d29
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

iommu/fsl: use platform_device_set_of_node()

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

> diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
> index 25aa477a95a95..c83bbc3faad56 100644
> --- a/drivers/iommu/fsl_pamu.c
> +++ b/drivers/iommu/fsl_pamu.c
[ ... ]
> @@ -955,7 +955,8 @@ static __init int fsl_pamu_init(void)
>  	 * PAMU node would require significant changes to a lot of code.
>  	 */
> =20
> -	np =3D of_find_compatible_node(NULL, NULL, "fsl,pamu");
> +	struct device_node *np __free(device_node) =3D
> +			of_find_compatible_node(NULL, NULL, "fsl,pamu");
>  	if (!np) {
>  		pr_err("could not find a PAMU node\n");
>  		return -ENODEV;
> @@ -964,7 +965,7 @@ static __init int fsl_pamu_init(void)
>  	ret =3D platform_driver_register(&fsl_of_pamu_driver);
>  	if (ret) {
>  		pr_err("could not register driver (err=3D%i)\n", ret);
> -		goto error_driver_register;
> +		return ret;
>  	}
> =20
>  	pdev =3D platform_device_alloc("fsl-of-pamu", 0);
> @@ -973,7 +974,8 @@ static __init int fsl_pamu_init(void)
>  		ret =3D -ENOMEM;
>  		goto error_device_alloc;

[Severity: Medium]
Is it intentional to mix goto-based error handling with scope-based
cleanup in fsl_pamu_init()?

The cleanup helper documentation in include/linux/cleanup.h specifies that
goto and cleanup helpers should never be mixed in the same function to
prevent confusing ownership semantics.

Since pdev allocation and other initialization steps in this function still
use goto labels (like error_device_alloc and error_device_add), should they
all be converted to scope-based cleanup, or should np remain manually
managed to keep the error handling consistent?

> -	pdev->dev.of_node =3D of_node_get(np);
> +
> +	platform_device_set_of_node(pdev, np);
> =20
>  	ret =3D pamu_domain_init();
>  	if (ret)
> @@ -988,17 +990,11 @@ static __init int fsl_pamu_init(void)
>  	return 0;
> =20
>  error_device_add:
> -	of_node_put(pdev->dev.of_node);
> -	pdev->dev.of_node =3D NULL;
> -
>  	platform_device_put(pdev);
> =20
>  error_device_alloc:
>  	platform_driver_unregister(&fsl_of_pamu_driver);
> =20
> -error_driver_register:
> -	of_node_put(np);
> -
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D9
