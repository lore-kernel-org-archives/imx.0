Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368064;
	b=5LBQCebrZI26+H5n0AUcRULkIpf/fu2Wqt29wua0/JQYwG/n5wy/QgLbwoQjk0lEtO1f
	 DrnlVMlI0nrIsk1KxEPfY7Wx9xQP5K2lJsqNAJLDdMngCSZKeMXdKHYW7p2edwkwH66YM
	 iUpENgzMTZFH1a9bixe/aFA461nJETXW6WsGNEN3hyxdzpylsf74Ih9OdYEAaNfZ8DNRd
	 wvjz3q3uuDwwRZdybAL/WPH8hQWoUwDOgjZsBbBUSvjH0orJkL++2j/adpMH+6bzb14lP
	 /QOZENc29T9719plVL19fPr/n8vxfZz4tBWKkYhz6VOMQ9c1aDt0aO7d/FHKdOLlpdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368064;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hkfDn4r9VpyFKiATseXX47qM5yKCr06tyZZWWf2URzk=;
	b=1mQ4NcNfKvIpjbmWUszqqsk6fW+x6TmkUTSb8EFdy3mhvMR6XkH3+WHEO6FxlMUFIX15
	 YDuY+yM4qxHFMkGfLsAcYqEwGMDgTwMufEtPjbjeCNkapLrAER4hNWVYGbk12GnpJqlt3
	 bGge68jxcaDPfbmN4rsB7zZfXbNPvow/QVQNtiA49OG5ILOA0Sdd2CFA9PeoIqPv4JpLP
	 YTXepr+ti7nGUtWoAIL5sfVmJ66jQVR7HQvr/5koMuqApEaJuMiFBZh7LdxQti7/CqLSt
	 Pf9KRTVkt9zPLxYQ3xgrB12uvkIaByItkUldTesAApFZFrA0jalraCvgc8E4P8IxF4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCUtZ2pM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F1E606A31A;
	Fri, 30 Oct 2026 13:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CCUtZ2pM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735511F000C1;
	Fri, 30 Oct 2026 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368063;
	bh=hkfDn4r9VpyFKiATseXX47qM5yKCr06tyZZWWf2URzk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CCUtZ2pMEXQePOn7bQ7l4ksFZe2KvZmaUd9GL/+KM6WumNDsbttJHCn/lJ2VPlmCX
	 ptnP2d6Jnqer2AtAzB8GkER9bPsx+b7NEYiVrEttrLVgM/zN60pDnZf/NmR6TH11To
	 bwc2bTMX6OovY4V+C1O9rhb0h5DR0HuD/VveN4Y+HlLhtjvtkCLSseIfUuLBckNbGL
	 2B8x67LGQUt5/c1BYnqZytf/dnRU7+rIt9ONoio7fm0aYzn2ByKCbGK59sKuSqY4/B
	 BqLIuUDehhlYFcdWDYfP+Bnit7mugcNmI1/EsLFoGimc8CjotXQ7sjmCp+yct0lM7L
	 pceqzmKj2oQGg==
Message-ID: <sashiko-outbox-191081@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] bindings: remove unused binding from old Libra
 version
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Hahn" <B.Hahn@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261030-wip-bhahn-imx95_upstreaming-v1-5-1c1cebb5be99@phytec.de>
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
 <20261030-wip-bhahn-imx95_upstreaming-v1-5-1c1cebb5be99@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 13:47:43 +0000
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
- [Medium] dt-bindings: arm: fsl: missing ABI removal rationale in commit m=
essage
--

commit 59deabe3729dc9f9716dfd3c6cfdb69f11310abd
Author: Benjamin Hahn <B.Hahn@phytec.de>

bindings: remove unused binding from old Libra version

This commit removes the PHYTEC i.MX 95 FPSC board and SoM compatible entries
from the Freescale/NXP arm devicetree binding schema.

>     bindings: remove unused binding from old Libra version
>    =20
>     Remove unused devicetree binding from old Libra board version.
>    =20
>     Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
>=20
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index f917ae7202e96..dec6e22719b5d 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1544,13 +1544,6 @@ properties:
>                - fsl,imx952-evk            # i.MX952 EVK Board
>            - const: fsl,imx952
> =20
> -      - description: PHYTEC i.MX 95 FPSC based Boards
> -        items:
> -          - enum:
> -              - phytec,imx95-libra-rdk-fpsc   # Libra-i.MX 95 FPSC
> -          - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
> -          - const: fsl,imx95
> -
>        - description: PHYTEC phyFLEX-i.MX95 FPSC-Gamma SoM based boards
>          items:
>            - enum:

[Severity: Medium]
This isn't a bug in the schema syntax, but since devicetree bindings form an
external ABI (Documentation/devicetree/bindings/ABI.rst and
Documentation/devicetree/bindings/submitting-patches.rst section I.9), is
being unused in the kernel tree sufficient justification on its own for
removing phytec,imx95-libra-rdk-fpsc and phytec,imx95-phycore-fpsc from
properties.compatible in Documentation/devicetree/bindings/arm/fsl.yaml?

The current commit message only restates the subject line without explaining
why breaking or removing this binding ABI is acceptable. In the companion D=
TS
commits 4a096b093cf5 ("dts: imx95-libra-rdk-fpsc: remove devicetree for old
Libra") and 01cb871eca78, it is explained that the old baseboard (1618.0) a=
nd
SoM (1620.1) were alpha-only hardware based on i.MX95 silicon revision A1 t=
hat
are no longer available, built, or supported, and have been superseded by
hardware revisions 1618.2 and 1620.3 using phytec,imx95-phyflex-libra-rdk a=
nd
phytec,imx95-phyflex-fpsc-g.

Because devicetree binding patches and DTS patches are often reviewed and
applied through separate trees, could the commit message be expanded to
include this hardware rationale, mention both the i.MX95 SoC family context
(as fsl.yaml also documents phytec,imx8mp-libra-rdk-fpsc) and the removed
phytec,imx95-phycore-fpsc SoM compatible, and use the standard
"dt-bindings: arm: fsl:" subject prefix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-wip-bhahn-=
imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de?part=3D5
