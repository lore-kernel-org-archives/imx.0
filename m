Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563719;
	b=3spw/r8DC4GUP74Go9Knt+/gHTUJn9QbFlHH99XBBkD9vRc8DdXgPXDQF78UUdWALuyy
	 8B3BjDlH7p/yM8O7Z1f+E43yfpXkfgsPew6hwTN/Ug9W+MTdJv1vyi9hGOEUTUC+BBWAm
	 dGX9kLQP5OqHA2XtJqCpYCtTv8hyXDudWvjck75ceLyCVdt5shKP599DLCG4rbVlZ+dJz
	 jjS+aMzCc9vC26aEO8+GKNRi4Jf5rxop2siaNywkfRt2yIPiJM1CBJf52wceFz6mw84P+
	 r38oVThwlmZllb4rfb/1XULU4FlbgkLB5GJm6ucq9fbP/ylTV72ccLw12bunxf9FUKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563719;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NYVaKjDh3/Sf4yY346/762140hXFmaTiAFD9pdYslyc=;
	b=LL6zP+2/U/jEIaHi26LnSe07O6VQTspsutvlFAijStWqhsXLbtS5M9R4NxboaybVCBj0
	 sVOgNkMxvVBRaRNgUb3G9dB55/QbykguNnt2G3rOvjSuEcXpg6jFR0V5KTU12+NSBk5K1
	 gSv6vr15+uGXYZSFlrA07K1gLiLb7DP743FJap+KS/LjTJFVgkqN4RCJUydqobriMJEHc
	 d9RDKS62BkEpXkjH5I5nhPHNQQoK93qLH1+vxbFiuQU8FMoVKl9elQlrMb32BleKsPx/r
	 YZDuFgJl+L7DUbWQTSeGHQcmq/wpqTpx4CocHLo1/YroruMg2m5ZvdD+b0IG8xC39vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giWSnPR8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43436606A32D;
	Sun,  1 Nov 2026 20:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=giWSnPR8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF761F000C1;
	Sun,  1 Nov 2026 20:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793563718;
	bh=NYVaKjDh3/Sf4yY346/762140hXFmaTiAFD9pdYslyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=giWSnPR8JfflU2updOn+2dFO+9kRnEWfMGRwrJZvGzTzLV7q6rCafY6eV/OuTwNrX
	 igEeanp2i2240FOemHf/colqb8rZO59j8R7y1XBePtPqk9WNws2gL+cMLVnGPzljdK
	 +8Da/Rh8osWuh/UoLrFdcVGqx+nL4HqM3PU/7KJ1/tQkjVLa6nv7q5tsbJD4o2D6Vn
	 xuqhUIU+82J4EVbRXHb7OAawOILTNTfZoO1Rt4ZEob0Zj4ffNnShPrvN9fNi6zpdZn
	 C5CTPNzZ4PAIyws8YaTyCTKYDkE9z5H9UuOexGBbk65nAiwIZzF+kzTxYR+2yljijl
	 7o70qTkghmQjg==
Message-ID: <sashiko-outbox-192652@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mfd: nxp,bbnsm: Add NVMEM for GP
 registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Wahren" <wahrenst@gmx.net>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, lee@kernel.org
In-Reply-To: <20261101200140.141642-2-wahrenst@gmx.net>
References: <20261101200140.141642-1-wahrenst@gmx.net>
 <20261101200140.141642-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 20:08:37 +0000
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
- [Medium] dt-bindings: mfd: nxp,bbnsm: additionalProperties: false breaks =
nvmem schema
--

commit 9d4b26f677f71a4d6410c83a13726309dd8d81b5
Author: Stefan Wahren <wahrenst@gmx.net>

dt-bindings: mfd: nxp,bbnsm: Add NVMEM for GP registers

This commit documents the device tree bindings for the optional
Battery-Backed Non-Secure Module general purpose registers available on
i.MX9 SoCs.

> diff --git a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml b/Docum=
entation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> index b1ade64a15541..4c4b7c3fff2a2 100644
> --- a/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> +++ b/Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> @@ -31,6 +31,20 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  nvmem:
> +    type: object
> +    $ref: /schemas/nvmem/nvmem.yaml#
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - nxp,imx93-bbnsm-nvmem
> +
> +    required:
> +      - compatible
> +
> +    additionalProperties: false
> +
>    rtc:
>      type: object
>      $ref: /schemas/rtc/rtc.yaml#
> @@ -88,6 +102,12 @@ examples:
>          compatible =3D "nxp,imx93-bbnsm", "syscon", "simple-mfd";
>          reg =3D <0x44440000 0x10000>;
> =20
> +        nvmem {
> +            compatible =3D "nxp,imx93-bbnsm-nvmem";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +        };

[Severity: Medium]
Should the nvmem subnode schema use unevaluatedProperties: false instead
of additionalProperties: false?

Because nvmem references /schemas/nvmem/nvmem.yaml# via $ref and only
defines compatible in its local properties block, additionalProperties:
false rejects all properties inherited from nvmem.yaml#.

As a result, running dt_binding_check or dtbs_check fails on
#address-cells and #size-cells in the example above, as well as on any
device tree node using standard NVMEM provider properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101200140.1416=
42-1-wahrenst@gmx.net?part=3D1
