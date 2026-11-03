Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746507;
	b=FEOYuQO8juSa0pE23iB/qhNGCWtYKduEp9g0a1xHtegr0kcpNWeulkMtKlj2ibEiu16s
	 6HWplkVD5aX4UZJ84qJVD+ZY6PGxgOTc57EOtZKhnFp5tB2hYwxmbaQE1IO08nWVI08bN
	 qclcSZgnGJzRh4WPhJPa8Hhn5jyigi/GPDJr4Dnwb4c1Xv6q4iPXoT8Iyreoy78W83khH
	 2uE9mwylNTTIqdSWngZsnjrQbQOizZ75po0HARNLD/PzVXim9wwMg2m8+io6jaOL5b1Nz
	 +IiaYUvL5Td+RadXXA2sXz8RMLsW2WENGzGCfMmMRLvuLb86rQedVWNH8BvuDKpmeVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746507;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oheIWokBfQkQ0F/QvYholTPqB5SpXrXrzxHjvxf/aZw=;
	b=2IN6iGYJ1MyzGZ8xcbVQYyYf0p2DhTkUjA/PPSvk3v0YrGZAhnvYh4Iah8JizHtfMFEX
	 ovUsnX8ZiwCx4g068dY534mIJujRwKrtBA1kplFcq2aoq7hVgjI0F6p6mDqs2n490gG6W
	 3N3oox+9hJlbrp/1lDJGcD7cA02kNo3uW/tMpwVrmShpKUZ/42GYMxBJfGu9mIn51yE7c
	 L6tOYM0jQGQv6x/ydVX85B/NGGfA6IQoBWK3g/MqIUSDDDG/qUIecV2lloyEFc4poUUIw
	 RbQRC39t0BrdDkQzqrYexa+jtaSCTzhk/P1ExcjasOneE4fuWKV/O5AS/8S+aT+wJiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Le3uX6k9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D35606A328;
	Tue,  3 Nov 2026 22:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Le3uX6k9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75C131F000C1;
	Tue,  3 Nov 2026 22:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793746506;
	bh=oheIWokBfQkQ0F/QvYholTPqB5SpXrXrzxHjvxf/aZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Le3uX6k9FG/WH5rnnVXS5DU1STzyVxHdXb9ZXs53fCLYfMv1nlZ1fOU/BfThnvjGh
	 SwwpSxg6BEtT9TLM3q3dMJIV0wPCUZWlSqmFmp4HJOGu9ABMKU7OBfDc27IVbL51RG
	 0qolsq/Civag5bu8aP5ToL+3gKZKlCimUrFjbo+3fNNSEqPVaiUxZYv236zxFpihUn
	 uN+rgWUKhn6ksZkpCyVzXYe6tRB/0DOonMj7oymJEN4or7m+Jv/vRDzthwFpneimoj
	 kAwolz3lUPAAwqdDiLQuQQeh9vH//R8MU5VNc9wZg2EdilPqKDf9UUWIEtUKTjr4jl
	 t4EdEdJs/YyIw==
Message-ID: <sashiko-outbox-196161@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: display: imx: Document fsl,pcr
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103224830.377009-1-festevam@gmail.com>
References: <20261103224830.377009-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 22:55:06 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: display: imx: fsl,pcr documented on controller node
--

commit 135b52931f21eeadf62c2f0174408c4c3faaf98d
Author: Fabio Estevam <festevam@gmail.com>

dt-bindings: display: imx: Document fsl,pcr

This commit documents the fsl,pcr property in fsl,imx-lcdc.yaml to address
dt-core.yaml validation warnings on i.MX25 and i.MX27 device trees.

> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.y=
aml b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> index 84610b5690c49..f1931436a4d81 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-lcdc.yaml
> @@ -65,6 +65,12 @@ properties:
>      description:
>        LCDC Sharp Configuration Register value.
> =20
> +  fsl,pcr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      LCDC Panel Configuration Register value used in the display node
> +      referenced by the display property.

[Severity: Low]
Should fsl,pcr be defined here under the top-level properties of
fsl,imx-lcdc.yaml?

In drivers/video/fbdev/imxfb.c, controller properties such as fsl,lpccr,
fsl,lscr1, and fsl,dmacr are read from the LCD controller node in
imxfb_init_fbinfo(), whereas imxfb_probe() resolves the display phandle
and passes that separate node to imxfb_of_read_mode():

drivers/video/fbdev/imxfb.c:imxfb_of_read_mode() {
	...
	ret =3D of_property_read_u32(np, "bits-per-pixel", &bpp);
	ret |=3D of_property_read_u32(np, "fsl,pcr", &pcr);
	...
}

As the description notes and as shown in the second example of
fsl,imx-lcdc.yaml (display0), fsl,pcr is placed in the separate display node
referenced by the display phandle rather than in the LCD controller node
itself.

Defining fsl,pcr in the top-level properties of fsl,imx-lcdc.yaml silences
the dt-core.yaml type warning globally, but it also permits fsl,pcr on the
LCD controller node where the driver never reads it. In addition, the allOf
conditional for fsl,imx1-lcdc and fsl,imx21-lcdc disables display, fsl,dmac=
r,
fsl,lpccr, and fsl,lscr1, but does not set fsl,pcr: false.

Would it be more accurate to document the display node schema separately (or
disallow fsl,pcr on the controller node itself)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103224830.3770=
09-1-festevam@gmail.com?part=3D1
