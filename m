Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A70141A91E;
	Wed, 14 Oct 2026 07:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962652; cv=none; b=OFaEcJu4B7lyfEKRpSJ1aenLC/r/6rMeRObm9IitYSZ0Ph8m4Grbta3gkTIad5pedxYllTikLC+PH8XaQdSacO4Ivy7vTqTdvAmlTvdq0Xz89IaqcEeiSVYYXr4QEO+M0c5bSUQIPuRx8r0h287FVvbV/yBbJ/EQu7I8gy82Mm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962652; c=relaxed/simple;
	bh=bIL0uKal+q3AQqTPKjTVK9IvisullMlSiTRnbC3QEfk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gsqmBdo7MRAivrl5mBk6gVcJG4iJ+1HXIxMynwWWsTiYmaG6zkX1Xo2gtBJEg1XE5umTDEIyg7Z8RaN0+se1SDg4KshjpKgdb3/TGjTIPiQOYM9mq5EuOwee20502A2LYYhSDN/pY8OCoRseFHvGlYz9G9lJAfz4wX6rObRd4jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBrKsgYN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBrKsgYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE5B1F000FF;
	Wed, 14 Oct 2026 07:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791962650;
	bh=t7Dxh+UblEi6e9U0pFVcIRtG8ChtvhFhLcT9I1ydl70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dBrKsgYNhX0vvKmOrA9uLffNdK4T93PxP1Y5KIknlfIXunB0xYMssV1fOYxSbNcNy
	 xd0mHVKnlA4+0dO2dS/a/oQ8vOhUhXa3ytRvcc8x473qchKmPcIBDXWtDxC4In194U
	 sB+8xKcgoAym3necdLg93/A3T5TTlgl32rid8WVYVAoOQYiJOhiynVkQ7kxGxkW8oH
	 cI6JZu9AoisVqR1l472HlQKsZnf/lnKxI9/F02Jtp31L1ZBneHbCGWIGSiRRthKogN
	 BkpcbgXRjlGUiT0TH1YuioITplABov28fuMzl8WrNhzXeUCwoHu7podJAhyYLbOGps
	 ZHhk4GWJ/xqiw==
Message-ID: <sashiko-outbox-170937@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: firmware: imx: Add SCU controlled
 display pixel link nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261014071657.118378-2-alexander.stein@ew.tq-group.com>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 07:24:09 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: firmware: fsl,scu: enforces non-generic child node nam=
es
--

commit bc38a98038b8a49cd066c13a1783d4225b66e234
Author: Liu Ying <victor.liu@nxp.com>

dt-bindings: firmware: imx: Add SCU controlled display pixel link nodes

This commit documents the SCU controlled display pixel link child nodes=20
in the fsl,scu firmware binding.

> diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Do=
cumentation/devicetree/bindings/firmware/fsl,scu.yaml
> index 307f1c6278532..cd6cda1192a89 100644
> --- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> +++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
> @@ -30,6 +30,26 @@ properties:
>        Clock controller node that provides the clocks controlled by the S=
CU
>      $ref: /schemas/clock/fsl,scu-clk.yaml
> =20
> +  dc0-pixel-link0:
> +    description:
> +      Display pixel link0 in display controller subsystem0 controlled by=
 the SCU
> +    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml

[Severity: Low]
Does this naming scheme violate the Devicetree Specification Section 2.2
(Generic Names Recommendation)?

The specification recommends that node names reflect the general function
of the device and avoid hardware-specific programming models or block indic=
es.
Enforcing exact node names like dc0-pixel-link0 prevents device tree sources
from using generic names.

Looking at the SCU firmware driver in drivers/firmware/imx/imx-scu.c, child
nodes are populated using devm_of_platform_populate(), and the downstream
bridge driver in drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c binds using
the compatible string (fsl,imx8qxp-dc-pixel-link), not the node name.=20

Since there is no driver or firmware ABI requirement dictating these fixed
node names, would it be better to use patternProperties, for example
^pixel-link(-[0-9]+)?$, to allow and validate generic naming?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014071657.1183=
78-1-alexander.stein@ew.tq-group.com?part=3D1
