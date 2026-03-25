Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E470C22CBE6;
	Wed, 25 Mar 2026 01:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774400998; cv=none; b=tOGVur8420WvfozixshxtWhBh64KYOKygyfx6FjW/ZUX14qW2lkATOqlc5so9OucQDXKBoEYbBb0irCNVgbmMlwXgYeT9y3aCNBmM3iRu53j+Aj9wmW6Ykx2Ln4NiWOwuhIMIgJzIPBrbZ7lzfyMUkXdXutN89Z55tj5rK1q0Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774400998; c=relaxed/simple;
	bh=YfBBgt1syU0ry/vvqRH6IoZ65DUjX8qoIovBPDPsdXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8qGf9FKo3oLCHEI7EyJPmhqyqI4u1nQ7P5IQt/+odhEdn3qqMo5q0TOjtMPXDxWldidyl18gahP6wAqb/vH9rtZqJ0oC+uF2Dpk7olql6tTGTSBIG2C4f/HA959xSu9A3PY5huVaO/XM3VfOWKHpGDf842yoxReePVLtx++xFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ji+MW3K5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ji+MW3K5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43292C19424;
	Wed, 25 Mar 2026 01:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774400997;
	bh=YfBBgt1syU0ry/vvqRH6IoZ65DUjX8qoIovBPDPsdXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ji+MW3K55lmJ/YNUuQrJr97TBLTEsc2U0T04+aUZB1uLqa8Dv6DO04oUZy0v1SOVZ
	 p6/uPKBgh3Z3ibY09+mxnblC/vSpYadRvFQQ+gKed3LBTmtLdUf0WnY4E+2krHp9BV
	 6jiImP8ZVrdAMzv+/Wr2bnnrVrgxVF4NLER4UM5mwhnS8JxQe0w/beSVlIJgNDMaYh
	 nygmULv9Bq66XM2OoCVcCvkSU9pZzHqkjxoplI9/7c1mmJT5jfPiYD9WVOcwylzzfN
	 emwnYRAqUAZybDz2IwhZPhVrHliMLsmL76gZ+xLeIcOL1GAWGC/xfsMcOz81LAofcA
	 tuj8G6mSX46qA==
Date: Tue, 24 Mar 2026 20:09:56 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: refactor NAND bindings and add
 nand-controller-legacy.yaml
Message-ID: <177440099590.2332534.9132007696467343522.robh@kernel.org>
References: <20260324221624.2424092-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324221624.2424092-1-Frank.Li@nxp.com>


On Tue, 24 Mar 2026 18:16:18 -0400, Frank Li wrote:
> The modern NAND controller binding requires NAND chips to be described as
> child nodes of the controller, for example:
> 
>   nand-controller {
>           ...
>           nand@0 {
>                   /* raw NAND chip properties */
>           };
>   };
> 
> However, many existing device trees place NAND chip properties directly
> within the controller node because those controllers support only a single
> chip. This layout is still widely used by older platforms and by other DT
> consumers such as U-Boot. Migrating all existing users to the new layout
> will take time.
> 
> Several kernel drivers, such as ams-delta.c, davinci_nand.c and
> fsmc_nand.c, still expect the legacy layout where raw NAND properties are
> defined in the controller node.
> 
> To support both layouts during the transition:
> 
> - Extract NAND chip-related properties into separate schemas
>   (nand-property.yaml and raw-nand-property.yaml) from
>   nand-chip.yaml and raw-nand-chip.yaml.
> - Introduce nand-controller-legacy.yaml to allow both the
>   legacy and modern layouts.
> - Add a select condition in nand-controller.yaml to prevent
>   node name pattern matching for fsl,* NAND controllers.
> 
> Keep compatibility with existing device trees while allowing gradual
> migration to the modern binding structure.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - use select: false
> - s/under/within/
> - s/property/properties/
> 
> two problem left:
> 1. about "^nand@[a-f0-9]$" in nand-controller-legacy.yaml
> 
> allow dts to do mirgeration from legacy layout to modern layouts for different
> boards, which use the same compatible string.
> 
> 2. ref to mtd.yaml
> 
> mtd.yaml force node name as flash@, nand@  ..., but here is parent node
> name is nand-controller@.  Only two properties, duplicate these should be
> simple and clean enough now.
> 
> change in v2
> - none
> 
> change dts layout break boot
> https://lore.kernel.org/imx/177281063848.253518.12995342124719933118.b4-ty@nxp.com/T/#t
> ---
>  .../devicetree/bindings/mtd/nand-chip.yaml    | 46 +-----------
>  ...oller.yaml => nand-controller-legacy.yaml} | 46 +++++-------
>  .../bindings/mtd/nand-controller.yaml         |  2 +
>  .../{nand-chip.yaml => nand-property.yaml}    | 14 +---
>  .../bindings/mtd/raw-nand-chip.yaml           | 74 +------------------
>  ...-nand-chip.yaml => raw-nand-property.yaml} | 15 +---
>  6 files changed, 27 insertions(+), 170 deletions(-)
>  copy Documentation/devicetree/bindings/mtd/{nand-controller.yaml => nand-controller-legacy.yaml} (69%)
>  copy Documentation/devicetree/bindings/mtd/{nand-chip.yaml => nand-property.yaml} (89%)
>  copy Documentation/devicetree/bindings/mtd/{raw-nand-chip.yaml => raw-nand-property.yaml} (94%)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

