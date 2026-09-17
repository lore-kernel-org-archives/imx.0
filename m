Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB1C4B8289;
	Thu, 17 Sep 2026 14:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654449; cv=none; b=PgBRYbMZWZUvsy3AcgczquLLsBULVcwfxfVT9Rh+nRrSe/zgs4VpjVvFi8rkanQDuC+rODx2N346rPw2nSXTEYC9EvDV0BLuFE/5bm5nIYMQcq7IvJf0aGCe16qCNKAiZ/d9OtoYa+Sg1wtjXJgmR36Y8ZPNmG3wcsr49HRH5co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654449; c=relaxed/simple;
	bh=FCDbgDvc516Qse1f2QiZwe1OgQOGRb1nnve2eiKd1ww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iukw7AJWBhhYQH3YJ807IDXPGWFMKJePhwDo627iRwAg2TnqlEDnDg5ehvMAaQ36NH/EfoaE/3c8AHUHhJQcGxS3udoZU6IR91a2sdLRjiMbkDkD7ELxY1PXSrvKtuwjLeUikytURLAyRwtBtQmlhRJ7wdx79Xo/wx1L6hBS8gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWimDGj3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWimDGj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97B01F000FF;
	Thu, 17 Sep 2026 14:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789654447;
	bh=cpwZ9carUYtl87VKALOi7gLN5i+7uaZp55JKc1ylHqI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FWimDGj3Mx5W9TD/hfp/qATVSfi72A/d+7Xkxxo/Cwu+q+JfXjXa2MPgGS3hflzEb
	 6iyIQ/YF36036EhgWODUTrqudd6whdOjnwlzDLuCcAau3332JNSbmZB8KefIvuON2L
	 ZeAKJdCv0JVeTHWLHoe4n2cty5U5IvBrn+mtfFeITSBBWzjKUl74CRtHcs8kyt0U1e
	 /0YmInYBoZe+T3sUVGM/ZNKo8U3WrSwxj0wDEgyOy2A90IOd1fIBToVPvXFqM6Y1sf
	 I40iNqF0s4IjAJwjamVXHxEHWyR5eNKIZtLKpUfp/koF90ItWFR3kk/X9e3zDSpbPE
	 snxWJKWCVz5hA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: lcdif: Add endpoint bus-width
 property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260917140042.118181-2-francesco@dolcini.it>
References: <20260917140042.118181-1-francesco@dolcini.it>
 <20260917140042.118181-2-francesco@dolcini.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 14:14:06 +0000
Message-Id: <20260917141406.E97B01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: fsl,lcdif: endpoint constraints bypassed for unit-addr=
essed endpoints
--

commit fb72496bb41dc4492a1048af127118bf41d36a4a
Author: Francesco Dolcini <francesco.dolcini@toradex.com>

dt-bindings: lcdif: Add endpoint bus-width property

The DPI output of the LCD interface can be configured with a bus width
of 16, 18, or 24 bits. Introduce a bus-width property to the output
endpoint, specifying the number of parallel RGB bits connected.

> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/D=
ocumentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 2dd0411ec6516..89cea0c14cf1d 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -68,9 +68,19 @@ properties:
>      maxItems: 1
> =20
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
>      description: The LCDIF output port
> =20
> +    properties:
> +      endpoint:

[Severity: Low]
Does restricting this to the literal 'endpoint' key bypass validation for
unit-addressed endpoints?

Existing in-tree device trees, such as arch/arm64/boot/dts/freescale/imx93.=
dtsi,
define unit-addressed endpoints under the lcdif port:

		lcdif_to_ldb: endpoint@1 {
			reg =3D <1>;

Because this uses the literal 'endpoint' key rather than a pattern property
like "^endpoint(@[0-9a-f]+)?$", multi-endpoint configurations will fail
to match this rule.

This causes device tree validation to silently bypass the bus-width enum
constraints and other video-interfaces.yaml rules for those configurations.

> +        $ref: /schemas/media/video-interfaces.yaml
> +        unevaluatedProperties: false
> +
> +        properties:
> +          bus-width:
> +            enum: [ 16, 18, 24 ]
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917140042.1181=
81-1-francesco@dolcini.it?part=3D1
