Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C6824113D;
	Tue, 14 Jul 2026 14:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038380; cv=none; b=pAIOK7Xc1fQynp3AQ1WRi2mI5/TyMSXgWWyfBXVCiLo7M9iGq0TEKWD7OXgZ0T1UmZRX0IPJO8qbwCZOYk8AKThQjZy1KnpZFqzeV+c+ga8cU8l8Fmgy3Rla96DaFlHw5DSwAZRod6BuqLwfd+9NuA2t4XPTk71bt37xuux7Vh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038380; c=relaxed/simple;
	bh=Uvtc5Kt/ZLzgfNqbiSp2Gl+7P1kruH63ep/bKLAkKCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SRF2ZWaFmFWqKluNcdf6PRlfGlb9IVeDlJlMFgUBTmF1xtfurZvmNOZ7f53Am+VYaZMkQwFb4zwtZRh5XDUUsoZUqiUAbYuQu9xbGS9cRpQnUNwU74hgzvf3UvE/hdMjLrezGZnTcGw3VTMbMj/4HzpAE3pd2S+vNZFIrNuKJvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IC0u/FP4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IC0u/FP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB5AC1F000E9;
	Tue, 14 Jul 2026 14:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784038379;
	bh=tTelE+LX0LyalTMqiSGcV6UnczGM3go5jLYPkEyCmWw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IC0u/FP4rip6VZdQuJKoYH7NSIq73DpEh1kyWVDlFW7qacdeaJVbef55qFHrSUShX
	 +lXN77pvkioZEZxzhmZ7DdRISY+BxAjHfOIwI5jJUqsQkCywc32KMKRPgLCNcJpT65
	 LawETDx48d9yvyz4iNAp0X2W592QXlnspHxDwZYT0zDnFGBtrf6aMO8TP2jl6+29Fh
	 hC1gdIK7XwE1ONTDfFQigHUV0VbSKD0YaAaOMKCIwqc3RKCTHffbT9GVFlLagKdl3I
	 ZYkCjQdOPgxdRzuf4ApjMaX8hi4jOHFlpSsTnxQ/dASiQy5JHstJCrbDqrCP6/QQmQ
	 efZ1Qng51pmGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: lcdif: add compatible string for
 i.MX8QXP and i.MX8DXL
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260714-dxl_lcdif-v1-1-6761a8a6592b@nxp.com>
References: <20260714-dxl_lcdif-v1-0-6761a8a6592b@nxp.com>
 <20260714-dxl_lcdif-v1-1-6761a8a6592b@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 14:12:58 +0000
Message-Id: <20260714141258.CB5AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `power-domains` requirement for the newly added `fsl,imx=
8dxl-lcdif` and `fsl,imx8qxp-lcdif` compatible strings.
--

--- Patch [1]: [PATCH 1/6] dt-bindings: lcdif: add compatible string for i.=
MX8QXP and i.MX8DXL ---
commit 684d2e523ad2d6b2b8e88a7b19f827e3689efd97
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: lcdif: add compatible string for i.MX8QXP and i.MX8DXL

i.MX8QXP and i.MX8DXL have lcdif, which back compatible with i.MX6SX. Add
front compatible string "fsl,imx8dxl-lcdif" and "fsl,imx8qxp-lcdif", which
fallback to "fsl,imx6sx-lcdif".

> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/D=
ocumentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 2dd0411ec6516..121c1b220e698 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -28,9 +28,11 @@ properties:
>                - fsl,imx6sll-lcdif
>                - fsl,imx6ul-lcdif
>                - fsl,imx7d-lcdif
> +              - fsl,imx8dxl-lcdif
>                - fsl,imx8mm-lcdif
>                - fsl,imx8mn-lcdif
>                - fsl,imx8mq-lcdif
> +              - fsl,imx8qxp-lcdif
>            - const: fsl,imx6sx-lcdif

[Severity: Medium]
Will these newly added compatible strings also need to be included in the
conditional block enforcing the power-domains property?

Since these are SCU-based platforms that strictly require power domains (li=
ke
IMX_SC_R_LCD_0), a device tree missing the power-domains property would
silently pass validation but fail to power up at runtime.

The existing schema enforces power domains via this allOf block, which does
not match the new compatible strings:

allOf:
  ...
  - if:
      properties:
        compatible:
          contains:
            enum:
              - fsl,imx6sl-lcdif
              - fsl,imx8mm-lcdif
              - fsl,imx8mn-lcdif
              - fsl,imx8mp-lcdif
              - fsl,imx93-lcdif
    then:
      required:
        - power-domains

Because the new compatible strings are paired with the fsl,imx6sx-lcdif
fallback as an array, they will also bypass the const: fsl,imx6sx-lcdif che=
ck
found earlier in the file.=20

Should fsl,imx8dxl-lcdif and fsl,imx8qxp-lcdif be added to the enum above so
the requirement is properly enforced?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-dxl_lcdif-=
v1-0-6761a8a6592b@nxp.com?part=3D1
