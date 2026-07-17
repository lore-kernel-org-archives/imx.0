Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F63EDAC9;
	Fri, 17 Jul 2026 12:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291295; cv=none; b=M8NwT4mhOx9LYahfxlja6Hs/aRp85DitrmvsrDvfwSPvDO1aG7EjMDaWelqdVK88o48TWVGz5AxSLXbPPUXmVMKLSP+Yu5T88l+lMrq1XjH/J9GLgHdwHwp0PVp7dLYmsmQbS1xv6A+WPT30Q5X+W4Mvq2VvPuiRsnEWIHRkPwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291295; c=relaxed/simple;
	bh=jgyoMbC4/kBLBBf3ArnlKCLVia+4jd5r5fkGoCzrlkA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KlJ66xA96Xj+sXWF2E9HGyxKDJVJkRtST/4jgR4exZ0H7sr0FMHxXA5U+1QVn+PNNKMcwn4i7XD2H5RL+MN1bMWc2Yvx4AJwOgA6xTLPsvUZ2O1fmQDHdcnCNmyBcpVOPk9abTj6tu5MDErQhaAZwYrJc+JJeyPSNqdyOcHRwkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BAAstyqs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BAAstyqs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693211F000E9;
	Fri, 17 Jul 2026 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291288;
	bh=mLUhEODnpqoOCbWwLaXeT4x8ON01RupU/xxbO4MV1LE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BAAstyqs33CZc4v/2JHllCtggkNKz0uQSvIGuZJanBZn+0vmKqrDXWjKJF3yEARNe
	 AXMEWG3oh0lDGEL6gjnlvpXe0HSTlr4MrTYj5jdmuEK1k0sIAxVwVAnQGCNsfzcjq0
	 4I3FIjvosJmfP1+LCDlWqWwN9pOGR2k/KKA5grcBHPiTP64CgROYpBibVcB8T+zhOM
	 YIiyqdQwmMO3NpWwAHaade4fQIyq83ONCUOWYv16MkvTaHW5jh81BdQ7DxOIVpGJTk
	 ykhnklu5JuJ8wDeOr1viPrgv9LXHg9kTAqI5SNP+8V7SqTqd1JvRTK7WIs4QWXpT8R
	 1oI1fDDZ8eqBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: lcdif: Add interface pixel format
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: devicetree@vger.kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260717121847.488148-2-francesco@dolcini.it>
References: <20260717121847.488148-1-francesco@dolcini.it>
 <20260717121847.488148-2-francesco@dolcini.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 12:28:07 +0000
Message-Id: <20260717122808.693211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Introduction of the legacy, non-standard `interface-pix-fmt` proper=
ty for a standard hardware concept (parallel bus width), violating modern D=
T principles.
--

--- Patch [1]: [PATCH v1 1/4] dt-bindings: lcdif: Add interface pixel forma=
t ---
commit 7225ea545d2ff50540972dd75d375b8ecea4f315
Author: Francesco Dolcini <francesco.dolcini@toradex.com>

dt-bindings: lcdif: Add interface pixel format

This commit updates the fsl,lcdif device tree binding to support the
interface-pix-fmt property. The property is used to describe the hardware's
parallel data bus transfer width to match board wiring and prevent shifted
colors.

> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/D=
ocumentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 2dd0411ec6516..209ee5a96e393 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -58,6 +58,13 @@ properties:
>      items:
>        - const: rx
> =20
> +  interface-pix-fmt:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum:
> +      - rgb24
> +      - rgb565
> +      - rgb666

[Severity: Low]
Is this introducing a legacy, non-standard property into the new schema ABI=
?=20

Standard devicetree guidelines usually prefer endpoint properties like
bus-width (defined in video-interfaces.yaml) to describe physical parallel
data line configurations, such as setting bus-width =3D <18> for RGB666.

If a custom property is strictly necessary here rather than using the stand=
ard
endpoint properties, does this require a vendor prefix like
fsl,interface-pix-fmt to comply with modern devicetree naming conventions?

> +
>    interrupts:
>      items:
>        - description: LCDIF DMA interrupt

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717121847.4881=
48-1-francesco@dolcini.it?part=3D1
