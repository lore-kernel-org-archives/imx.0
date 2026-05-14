Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F38CA5A;
	Thu, 14 May 2026 00:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717595; cv=none; b=G3VtzQFdiOVwU9R6fpA6bqa8LxIPVW+2Fy+47ptJKgL9wnS8Y/OlSlLi9uidaxlproRv7bazD7IqAi4lqrPUiiNFYTomb0GP19Cw+G8NRvbWHg72iewf6e97n4PO/w6+LdpAjxjWIkK6xsvSeb3SRix7q5jJm0kSqs8PD7U3K4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717595; c=relaxed/simple;
	bh=BCqfcNlIh76PwxmR4FmkOrE0wSlAD+JUt6orQn0vQZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=phqdFLRbYyruwlOjKNxG/upkM7u2j4a46i4WlPjxfbL2Qvs3BwQ7+Ed9qCrBojnUyZfw/wxdkQHsOj8WOO2esxw6A7ShBNWvMInuB2hAcoS8rbA5XZZ+J/7xQfzAceKx82gefoU0KROoMvEBuk55pW7/ChDPdQRRVIg5zzH9/fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7O00zJ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7O00zJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D66C19425;
	Thu, 14 May 2026 00:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778717594;
	bh=BCqfcNlIh76PwxmR4FmkOrE0wSlAD+JUt6orQn0vQZo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=T7O00zJ4SVosI/Oh9flU1uvJGnFKtOCiamdsLXLDwf+f12ubQAjTZRuNo+jkHaApr
	 OtQ5/9bN48f9QHvQgwkVn4k2/lMHuUGl6t3FTx99Wo39DS5tmDJ0TS/3/Pa7fR1Gpp
	 M2xGjmwBjFHJ+hBg4QVt6OcCA7Y7wIsP7dOC2MeydrBsKGU2ikdseq9AsfBPTT1yF/
	 O+KZGePdeLK8wZaA1DcxlaCHwjAa/gnpcuB78aebpLYk/IFA6qGReTYfrVHTCe0pBv
	 ncgPG5SeS49CFFGWaFo3dgTdc0tkazdVgPXL4V0HxGebxrZlLYcK3CBYTDS8zg0BJb
	 tQW6v16JbCJvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: Add television encoder
 (TVE) for imx53
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Li" <Frank.Li@nxp.com>
Cc: krzk+dt@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260512223137.1190096-1-Frank.Li@nxp.com>
References: <20260512223137.1190096-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:13:13 +0000
Message-Id: <20260514001314.68D66C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing conditional constraints for VGA mode sync pins.
- [Low] The `fsl,tve-mode` property lacks a defined default and is not requ=
ired.
--

commit 18cf39d8e659ce17f310f753763d63085e707e24
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: display: imx: Add television encoder (TVE) for imx53

This commit adds the device tree binding schema for the Freescale i.MX53
Television Encoder (TVE). It documents properties required to configure
the TVE module, which converts digital video to analog TV signals.

> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx53-tve.=
yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx53-tve.yaml
> new file mode 100644
> index 0000000000000..a7c971be1959b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx53-tve.yaml
> @@ -0,0 +1,102 @@

[ ... ]

> +  fsl,tve-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      TVE output mode selection.
> +    enum:
> +      - ntsc
> +      - pal
> +      - vga

Since fsl,tve-mode is not listed in the required properties, should it have
a default value defined to clarify what output mode the device assumes when
this property is absent?

> +
> +  fsl,hsync-pin:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Pin number for horizontal sync signal in VGA mode.
> +    minimum: 0
> +    maximum: 8
> +
> +  fsl,vsync-pin:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Pin number for vertical sync signal in VGA mode.
> +    minimum: 0
> +    maximum: 8

Is it necessary to add an allOf conditional block to enforce the dependency
between these sync pins and VGA mode?

Without it, device trees could pass validation while specifying these pins
for incompatible modes like NTSC or PAL, or they might omit them entirely
when VGA mode is selected.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512223137.1190=
096-1-Frank.Li@nxp.com?part=3D1
