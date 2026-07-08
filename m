Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D444D3E5A22;
	Wed,  8 Jul 2026 20:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541426; cv=none; b=Hp4sOGJ4dyp0Vg+fBpsdzYGH3Sb98ItYBexXBBESypcm3rzpixp+egt9r0qITPu3euOAJ4od6txxvC81wDjj2BsKQCppDMZ4IQ16670BwSP5h5btIgJO+TFj8drGRtdsdnA1HjQMdWIMbRn5lgKpqzvDtZ+S3ZJItAiVw5UEoIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541426; c=relaxed/simple;
	bh=bm4Cg7N5H0NnDEjj73TujxMNebFIrhWLZS0A67bj3g4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gbHn2NGaZkDj8J+R4RDSKwAaFvdcZQUzSlk2WHMdzLN/a0FDl7I9FDoki3jMBMECfhtUPtod0ujuCW/EWSXNFoByO0lOTK8Y1Lf1dwyr/Wu/AtRIMWYYWt3allI2Hyic9BtxXX9HvAxc8R6hcEcj5M3y7xnOq+CdpETV3VjGF3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgKknX5m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgKknX5m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C2A1F000E9;
	Wed,  8 Jul 2026 20:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783541419;
	bh=5FRIKaHj1K6umMKvbkOQwI8kz2MS4CkhOKlDejjLwPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kgKknX5mtQ1QdMtQweKx8dsrW/meCeEeNFp7v5KB9dx9Xm9f541HsgEe0TzVtRG8Z
	 QzugXx5CjJrodEyHFz0xABNZEArbQq6ApJeK0c3TCLPmVtdV3Q5eSizy35zEtVY31Q
	 sKAQlmE/cHkDHave2E5TQnZUhtqtaQj37AgcEAm0uWlsG2doZeB1nhqTUV2SJaiwUX
	 h7AF6dFmUUwPzv6Bzw/sXuewUTJSAeqAJqYPHpCsZ5U9sWyJcwezUQfVAWY2x2hSdj
	 BDfJNXytyx71E/siYSXNbBchXLtY/ElqVJEBptXrQGaqSbY99R8ampEcCyvGY3Cegk
	 ZS07pRpqaMWHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: imx: Add fsl,eim-bus
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260708-imx53-eim-v1-1-913b4559e5b5@nxp.com>
References: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
 <20260708-imx53-eim-v1-1-913b4559e5b5@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 20:10:18 +0000
Message-Id: <20260708201018.C7C2A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The updated `$nodename` regex explicitly allows `eim-bus` but ma=
thematically fails to match the actual node name `eim-cs1` used in the devi=
ce tree, resulting in a new schema validation warning instead of fixing the=
 issue.
- [Low] The commit message incorrectly attributes the compatible string to =
i.MX51 variants instead of i.MX53.
--

--- Patch [1]: [PATCH 1/2] dt-bindings: soc: imx: Add fsl,eim-bus ---
commit c123bec5543c2323c455145cf374a9559692a3a5
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: soc: imx: Add fsl,eim-bus

This commit adds the fsl,eim-bus compatible string to the fsl,spba-bus
binding to resolve schema validation warnings for legacy i.MX devices. It
also updates the nodename pattern in the schema.

> dt-bindings: soc: imx: Add fsl,eim-bus
>   =20
> Add the fsl,eim-bus compatible strings for i.MX51 variants.

[Severity: Low]
This isn't a bug, but is the reference to i.MX51 variants accurate in the
commit message? The CHECK_DTBS warning listed below is specifically for
imx53-ard.dtb, which suggests this compatible is actually targeting i.MX53
variants rather than i.MX51.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml b/Do=
cumentation/devicetree/bindings/bus/fsl,spba-bus.yaml
> --- a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
> +++ b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
[ ... ]
> @@ -36,13 +37,14 @@ select:
> =20
>  properties:
>    $nodename:
> -    pattern: "^((spba|emi)-bus|bus)(@[0-9a-f]+)?$"
> +    pattern: "^((spba|emi|eim)-bus|bus)(@[0-9a-f]+)?$"

[Severity: Medium]
Will this regex change successfully clear the validation warning?

The commit message states we are fixing a warning for the node
eim-cs1@f4000000. However, the updated pattern permits eim-bus but
structurally fails to match eim-cs1. Does this mean make dtbs_check
will simply evaluate the regex against the eim-cs1@f4000000 node and emit
a new schema validation warning for the nodename?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-imx53-eim-=
v1-0-913b4559e5b5@nxp.com?part=3D1
