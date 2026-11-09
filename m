Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227540;
	b=KbJlEX6NDpPZekSVZCz0TKM2LFeV9GeU57G+mr/YlH8BAVii1YZOLIod4rj8nqYW9xSY
	 g1o1g2/t00GXwzZ6+CPRg95dupqS7W1uguKoEZYCyPYIRM7TcH2E526KG5hi6OrmYYr+p
	 aaf0X87Gu9YPUzWdYLChWbBQ7hFUAoFYbAVijmBZYENnECSv3UXVPIOrV2APnG6DjgC7f
	 d5WJ1s6iEgsyAidwHRZmeWnzpAYm7YvaNr+3/VXIeABBgzYvhH2tJlqDBvxCz6+lXi3Mm
	 PJj86rth0pCGuAi+slh24UsCzUgsciyrMLzY/hbd8vEpJHixsvwgv5dP2jXP61PIfaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227540;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DrFt5XUY5K+Z4YSTzjPJFdoi+/yuZntIqQXWFqO8qN4=;
	b=hEe3oI7DzgjcPLI94+DL0yE+REX4wOCcbXLPeuB/PO6RHjZyBi/w/Zqh++DdWwa4GXJL
	 NZLtPRpfVQz9LuPNhlPmzCvg66kS/1VwMMCTnlhyrr1lt+DvXXDxlidnUp5ONgQIeXaCG
	 1jt99ps+7oZ+gBE12Z5NuAxtuW8lWh4f/VPSqA0FaSV4k+uMtJdvzK3XD3GFWWiCzfqiG
	 TExJwciOelkYYMb0JWJ4TU05VLOpFYfOo8ct6ZNJoXRF0INV/jVTGqjQVf6qxSygElNHM
	 rpi7h/SRerNrpAq03UAjSiNbftvvThmUTeWY/K6Cgm3WBJ34DoQF5YHFAqsR2WPV4Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nsOvPEh/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F22F606A334;
	Mon,  9 Nov 2026 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nsOvPEh/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E371F008A3;
	Mon,  9 Nov 2026 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794227540;
	bh=DrFt5XUY5K+Z4YSTzjPJFdoi+/yuZntIqQXWFqO8qN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nsOvPEh/a1Obx+RK4Q+xM1+BAeS34f4H7SqK1/nUp/OPUuPFIU3Fzw0bCiyVxehos
	 m0i9ow/XPqrxyXqNx1nAM4P3g/MXaytVLrie4lX20B1Bc9rmIcq8QytWWl/e5HaFS9
	 kQyqhhtMbepzUZ4jlCBMq4BzAXA4g30QUVJDIuNr/ACto54g4eLlh6n5Ey3oumRxGP
	 GHCUJQFIv7eBLWjQpihC/C022EhgXg9Nww/i5RJOjw7RX5tLdzFeQ0cDHL7/tsTMob
	 zoEbe55AaM+C+P5EvWBw97eTtXrj0cRdHr4dijUGAih4byxtZoZXg055nJNz5b7HUm
	 vxzZqiud62WYQ==
Message-ID: <sashiko-outbox-204955@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add
 Youritech ILI9806E
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Obergfell" <frank.obergfell@bytesatwork.ch>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261109122250.720757-2-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
 <20261109122250.720757-2-frank.obergfell@bytesatwork.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 12:32:19 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] dt-bindings: ilitek,ili9806e: non-specific youritech,ili9806e
  compatible
- [Low] dt-bindings: ilitek,ili9806e: incomplete commit message for
  panel and vendor
--

commit f808e27a7a6d1d461157c23c896bc2773caf8de9
Author: Frank Obergfell <frank.obergfell@bytesatwork.ch>

> dt-bindings: display: panel: ilitek,ili9806e: Add Youritech ILI9806E
>
> Add youritech panel as a compatible
>
> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>

[Severity: Low]
This isn't a bug, but the commit message omits any description of the
panel hardware (such as the panel model, resolution, physical dimensions,
and whether it uses MIPI-DSI or SPI) and does not mention the new
youritech vendor prefix added to vendor-prefixes.yaml.

> diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili98=
06e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.=
yaml
> index 2080d9e0ffac4..6f29ddc1fd090 100644
> --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
> @@ -19,6 +19,7 @@ properties:
>            - densitron,dmt028vghmcmi-1d
>            - ortustech,com35h3p70ulc
>            - rocktech,rk050hr345-ct106a
> +          - youritech,ili9806e
>        - const: ilitek,ili9806e

[Severity: Medium]
Should the compatible string use the specific Youritech panel part number
rather than repeating the ili9806e controller IC name?

In this binding, ilitek,ili9806e already identifies the display controller
IC as the fallback compatible, while the first entry identifies the panel
model. Using youritech,ili9806e makes it impossible to distinguish between
different Youritech panels built around the ILI9806E that have different
resolutions, physical dimensions, bus interfaces, or panel-specific
initialization sequences.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109122250.7207=
57-1-frank.obergfell@bytesatwork.ch?part=3D1
