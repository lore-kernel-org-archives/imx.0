Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826969;
	b=fIlS8tzLFW7oH9is4uXmmKk3aAXWUimmhnXhHX59UHiwcuaNoV0ubPmT1FGqIETNEgFF
	 d4ZV1WsofxAWIx0uyne1RQWHCc7TdJ+s9fM/Nou6+LAhHNzTIj1+YyP606SorRDs4EgRa
	 1dKxtDGk/IBq0Rej9HxL4YYoE//Hiq0GOI9F2wtxv76OESvVvFPpbz6NwSoc1yGwfQ0T5
	 mfX/iKc8qwmsBBU/lmBhvcQVg7SIzvp32QyhYTN0yG+1yRXCwhnZbvLkAypqQHTfKfB0s
	 RbacRhLVxRwiL3eIfOAmT/K8QBn/c4rdf0WkxAHSR8eeyrhsi90WN5JIhz3QxRISa+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826969;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kNBFYxxA4MP5rcU4FzrA1vLOBu3KG5LmoVkON98E0wg=;
	b=ZP5fvkTBZ5w2PYbVuBy3yL2UB5cL5xRFvSUDjSchIFNvQACuLI566GATpfQVg/PeDLVf
	 8Z5e2k5ZRZWowT+vpGJ2Cr0gnPNyg5Duqpfd4cGKrP9BTpvu2AecNPQT5D8Oq4R/bejDs
	 9e7I/a5yJTt5yjJS+fTAyGkL7pDMPVZ7aXrqX5YMzq+b3qN1M8+MmuJT6yThBM/8xHLr0
	 qixDD259rwBKtlia7g9AVCF3xvQMWmdB5+iuhYl7v1QLDpDO5PpaaKCpTlIhdEsAFNB/j
	 /Z8SbrDMyyZ0NqLR5Ak/5frB3KXJ4QWNhB8Hpt+nQU7uc6Zc4Mkd79+0oJYqhzrtp3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLeYPRUw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A91606A31C;
	Mon, 16 Nov 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLeYPRUw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8F31F000C4;
	Mon, 16 Nov 2026 11:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826969;
	bh=kNBFYxxA4MP5rcU4FzrA1vLOBu3KG5LmoVkON98E0wg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jLeYPRUwe5AFT6NIK8If5a9UBadYmhndukMCcmqQKbUMdVmc0h6W1J3H2HCXHuTsV
	 U3+gHwI1dShY9FCO+gFSTh84kkSbeA+HiSea3cy1B9Kk0CqhkOPxdjxF9qdZSHex1w
	 h6DmMTOHtwAIN3z+1mGu/weY/7QGqfm/VOywAFIeiZYXWsmQ82Y8Z0S3YCwHPq4Z/r
	 a7tqWfdT7MAtQbKW+WYxtB+caZtCye7CLjmi1/ZAp0ch9H9AaM8VpK8sq5ALoaTonI
	 nUp+7bOO4Tmyx+E6fnQic8ADG2i3NQlZXG+pn49rNvL4DvMCYNcmdS62BG7A/fTMjW
	 Ow9vyTUXy9kbQ==
Message-ID: <sashiko-outbox-216827@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus
 FPSC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yannic Moog" <y.moog@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
References: <20261116-imx8mp-phyflex-v1-0-4adcf8b4d373@phytec.de>
 <20261116-imx8mp-phyflex-v1-1-4adcf8b4d373@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 11:02:48 +0000
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
- [Low] dt-bindings: arm: fsl: wrong YAML sequence indentation under
  oneOf items
--

commit c45415521ffaa99c1a93405ffd739350149edce7
Author: Yannic Moog <y.moog@phytec.de>

dt-bindings: fsl: add phyFLEX-Libra i.MX 8M Plus FPSC

This commit adds devicetree compatible bindings for the PHYTEC
phyFLEX-i.MX 8M Plus FPSC SoM and the phyFLEX-Libra RDK carrier board.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d53..2d21a1949d949 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1225,12 +1225,18 @@ properties:
>            - const: kontron,imx8mp-osm-s               # Kontron i.MX8MP =
OSM-S SoM
>            - const: fsl,imx8mp
> =20
> -      - description: PHYTEC phyCORE-i.MX8MP FPSC based boards
> -        items:
> -          - enum:
> -              - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
> -          - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus FPSC
> -          - const: fsl,imx8mp
> +      - description: PHYTEC i.MX8MP FPSC based boards
> +        oneOf:
> +          - items:
> +            - enum:
> +                - phytec,imx8mp-libra-rdk-fpsc  # i.MX 8M Plus Libra RDK
> +            - const: phytec,imx8mp-phycore-fpsc # phyCORE-i.MX 8M Plus F=
PSC
> +            - const: fsl,imx8mp
> +          - items:
> +            - enum:
> +                - phytec,imx8mp-phyflex-libra-rdk # phyFLEX-Libra i.MX 8=
M Plus RDK
> +            - const: phytec,imx8mp-phyflex-fpsc-g # phyFLEX-i.MX 8M Plus=
 FPSC
> +            - const: fsl,imx8mp

[Severity: Low]
Should the sequence entries under both - items: blocks be indented by two
additional spaces (14 spaces for - enum: and - const:, and 18 spaces for
the enum values)?  Documentation/devicetree/bindings/.yamllint configures
spaces: 2 with indent-sequences: true, so aligning - enum: and - const:
with items: at 12 spaces causes make dt_binding_check to fail with
yamllint indentation errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-imx8mp-phy=
flex-v1-0-4adcf8b4d373@phytec.de?part=3D1
