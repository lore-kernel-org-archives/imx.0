Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CDC37F33F;
	Thu, 24 Sep 2026 11:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248695; cv=none; b=RF6PLUYnGrZTVXcNwMoQh/RLjKwvYwKVSFJOQuTe/Fe8HrtO2Mb9XPJFrJ/CyF7i9DoJ7eianOQIyACrOjZ+2lstnfMAcyj1Y5QOOIuZjrXTjRmnWio9qPS45aMVK4cV7FqEGFEx0PZP2vh2R2wQ3fdEtrDRbr72Rp/n1gA1gAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248695; c=relaxed/simple;
	bh=u5lKH5nXGlnx35rQbsQq5GJQmFXBhRKS+DBAiA/cUy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hU/tGZ+vJKnnvloGwrzip6EUyE0CyebmzS/29a+qSz/4mohG8tKZDVu4wlB3/4gZGI/sv2cdJu0KfKVUXqguOGku3QPTV+tUyTQlm3Iro1UThCKver2rdf25d7rUS02vWC+I/p+fiN6fGeRS91pIFVlF262Yuh8MH+wmIGxwtZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvnSPne1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvnSPne1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692FE1F000FF;
	Thu, 24 Sep 2026 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790248693;
	bh=0+e0XLFc8dwqGCXGWFE5Q/VS7LYzMFo3TXZwc8p3z5U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MvnSPne17EMIkp8vs6qK1j0XwGueRqCBuKmkN/kakqvj6+e+TYm3uXjJZLXtm94Gz
	 iGbt6BE7Js1TdhFknsxGN9UJ0U+k91vrB7/nS5UicfUrrAvmhYyBqqajb8jeFw1j9E
	 nok+4UcCNrfHKV8CsqXpzTy9Zr9yAwybNvaE8MnjZQZbckuxKDJZN838SMj+kQF5Vt
	 mnzHPgyWf62tMVMa94vKpFm5pxZNBWf4jg2xAJ0vQlTD2aYyaDD/PNZ+vPzjGvmPXD
	 lRbABtYZ217LWNCM8Yadbu6q5okhlWNobY9gwy/xHIzDjneDfW967almAKO86ylHoU
	 X4ULHbTZhfdXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] media: dt-bindings: media: nxp, imx8mq-vpu:
 Remove nxp,imx8mq-vpu
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260924110825.166238-3-benjamin.gaignard@collabora.com>
References: <20260924110825.166238-1-benjamin.gaignard@collabora.com>
 <20260924110825.166238-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 11:18:12 +0000
Message-Id: <20260924111813.692FE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt-bindings: removing deprecated nxp,imx8mq-vpu breaks DT ABI back=
ward compatibility
- [Medium] media: leftover warning for deprecated nxp,imx8mq-vpu prints wro=
ng string
--

commit 3bc65c4891afcd4ded470db943d49d0c8d78f2db
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu

nxp,imx8mq-vpu has been tagged has deprecated since a while.
After driver clean up it is time to remove it.

> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml =
b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 19528262810a5..69619d2c86fa0 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -14,12 +14,10 @@ description:
> =20
>  properties:
>    compatible:
> -    oneOf:
> -      - const: nxp,imx8mq-vpu
> -        deprecated: true

[Severity: High]
Does removing this deprecated string break backward compatibility for older
DTBs? Devices booting with older Device Tree Binaries that only specify
compatible =3D "nxp,imx8mq-vpu" will no longer bind to the driver or pass s=
chema
validation.

> -      - const: nxp,imx8mq-vpu-g1
> -      - const: nxp,imx8mq-vpu-g2
> -      - const: nxp,imx8mm-vpu-g1
> +    enum:
> +      - nxp,imx8mq-vpu-g1
> +      - nxp,imx8mq-vpu-g2
> +      - nxp,imx8mm-vpu-g1

[Severity: Medium]
Since the old string is being removed from the driver match table in this
series, could the fallback warning in the hantro driver print the wrong str=
ing
or become dead code?

In drivers/media/platform/verisilicon/hantro_drv.c:hantro_probe():

	if (of_device_is_compatible(pdev->dev.of_node, "nxp,imx8mq-vpu"))
		dev_warn(&pdev->dev, "%s compatible is deprecated\n",
			 match->compatible);

If a device tree uses a fallback string (e.g., "nxp,imx8mq-vpu-g1",
"nxp,imx8mq-vpu"), it will match "nxp,imx8mq-vpu-g1". The
of_device_is_compatible() check for the old string succeeds, but
match->compatible points to "nxp,imx8mq-vpu-g1". The driver then incorrectly
warns that the new "nxp,imx8mq-vpu-g1" compatible is deprecated.

If only the old string is present, the driver fails to probe, making the
warning dead code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924110825.1662=
38-1-benjamin.gaignard@collabora.com?part=3D2
