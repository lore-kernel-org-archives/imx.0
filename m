Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74F9364E85;
	Thu, 24 Sep 2026 15:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262941; cv=none; b=bllTQPu0roC7zLXs04wvaZYClDbzNWYeMQI9E8ch25kYjw0/xXtm7Fk1BZLXB79vDxi9WOi7smOatUlhWkKV+r0nAwIHP0MUNClw1sj5ACRPBXSUsS8V6nsrkr3YY/WC3+ZQQWIzbcMZ6VYswdvb6rbEamT6g2Lgc//vfZMHMCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262941; c=relaxed/simple;
	bh=ZRiY04mbtV0EATlvbacqAlR5Z5qE+0U5wX0LFJied/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PJ3pDnjAcME0eDMYJeApNKHka0KViUGkEkpXuSG0RhJsurhtySeCSEPhqTJbUFXeZDg3ljOlqScj9cQAA0Oi1mFk1uz5PGVU20sclGqF5l9DzjoxFjZ9tV59mo3am8UGu5Xxih0BRDYqwwrNi4Gg138Sg74WAJWy+7NFhPZ2TBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zs7FvQ15; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zs7FvQ15"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6971F000FF;
	Thu, 24 Sep 2026 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790262940;
	bh=JwwZRz8sSOWRBKYYcGRM4YkpiNNFFtx8DJIpCtAC0yg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zs7FvQ15l/ZK2znr4hR6MWOpLAm3Vmwa+wFo/UQ+qkXWonmFGNFUiTubXEMA3qwNG
	 FE1UcJFowrUx2t0cR1WZRS4foRCdU2qRyJccRgChM1aq64Tl6S382vBkyg5gm3vSpb
	 mMrf6i/O0ti0bTiekt5TW5nTbOcNJ5TyGEamqQtsgMSYoT3qeju+7vq2T412gXhPS8
	 xJ4KnZhLddL9wMwi2w/JPkMHulRG+fNdUYz1pOY5wbCaRs6Ik5vk58XrGvirY+2XhS
	 hvFLGqbSDnD0TEWASnH0dDbSZgW32RB0s+UzbDjqf88gJIU95lgl1OqOaKOe3gFOlH
	 DoFQ5g9w8C84g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 4/9] dt-bindings: net: qcom: document the
 ethqos device for SCMI-based systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: robh@kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, linux-sunxi@lists.linux.dev, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-4-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-0-e82f33720737@oss.qualcomm.com>
 <20260923-qcom-sa8255p-emac-v15-4-e82f33720737@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 15:15:39 +0000
Message-Id: <20260924151539.CE6971F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: ultrarisc,dp1000-gmac: missing power-domains maxItems =
constraint
--

commit e30cc0626178117fbbeeed38ffe455db15d4973b
Author: Bartosz Golaszewski <brgl@kernel.org>

dt-bindings: net: qcom: document the ethqos device for SCMI-based systems

Describe the firmware-managed variant of the QCom DesignWare MAC. As the
properties here differ a lot from the HLOS-managed variant, lets put it
in a separate file. Since we need to update the maximum number of power
domains, let's update existing bindings referencing the top-level
snps,dwmac.yaml and limit their maxItems for power-domains to 1.

> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 0ff9e3284a061..1f2ee684dc391 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml

[ ... ]

> @@ -186,7 +187,8 @@ properties:
>            - enum: [ahb, stmmaceth-ocp]
> =20
>    power-domains:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> =20
>    mac-mode:
>      $ref: ethernet-controller.yaml#/properties/phy-connection-type

[Severity: Low]
Does this unintentionally relax validation for the ultrarisc,dp1000-gmac
compatible string?

The commit message mentions updating existing bindings that reference
snps,dwmac.yaml to limit power-domains maxItems to 1. However, it appears
Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml is missing
a local override and will now inherit this new maxItems: 2 constraint.

Should ultrarisc,dp1000-gmac.yaml also be updated to limit maxItems to 1?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-qcom-sa825=
5p-emac-v15-0-e82f33720737@oss.qualcomm.com?part=3D4
