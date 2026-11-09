Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228628;
	b=qCaGiR3FRwiDGDf9/F4/dV5Mq9UgOyZew3xjDKLxPzwg7ubsJYRfKKV0Ka9+iJoLxkIw
	 4TPDTHHxFDql+MBqEIxt/f+3qScy8eQPhlGGBAp6vOE8MjII//0C8WTHWU9DhhVtwBnuA
	 pqYZ39RBNT+ZHohdCuNADe7XZV37hfalnlb1q/6fKtcHXBDl5NPXESl0BM+dCfIJQj1R1
	 h+wFZUnWNkDX0ZfD6bgCs0Z+RBEUxGZ7WldOtkJfDjTSzQO4UWC6aatiLk7JKy2WIaapG
	 LmkOE/LXrsfnFNu3yIdtgH8heYeOrl8DyBtNBCVmSGfUFd39395anJAicnC0CMbxPqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228628;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S6IAQ+Wr+Ko6lWqp8OF42/3E3uNYZA+m3Lorr+E3XXU=;
	b=QHeupvXPrkxnTrP7EWmzl3e/Phpyanx/RamGkuHxSeHa45apxbUKJfyTsFdoxikGnBZB
	 2lFwbsRYuyNCxr+raz7C95vFVdxBeBcGuNrktxBk9JwFyDIN0Z+C1EoPIV35oUtt4gF62
	 OuPE1DyOpGS1kG9EiAULPAPYqZcGJ8tl/S7+1wRYOHuhc9BsDQg2meyAEm8QzOepALPIt
	 UeW7TmQDgwqD0l8LR04gLdvHjifZJzJlzkr86uaCuqxRlkmcXl0h8Rs1O8rcz7+5GfMpb
	 QzuUDDQT/m+hJovcMneYROi2/ERbrkUOl0e77OJUEOmzVLDVxk7NmdSzBP3CpMyklgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sgkl30Vv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2DF606A33B;
	Mon,  9 Nov 2026 12:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sgkl30Vv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27F51F0089F;
	Mon,  9 Nov 2026 12:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228628;
	bh=S6IAQ+Wr+Ko6lWqp8OF42/3E3uNYZA+m3Lorr+E3XXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Sgkl30VvZplfeiYugV/gx2zJsyIWHPeF2WKBDyc8tQY0ELsq13Gi0PqkJK1IpUFoB
	 EOP0K20tnqfm21ytOp58Fr6qT71Tc8YQkpADwjObCmbuauCu/08u0QoBhjFEBXqDRf
	 YfO/BYaF0lo56gjLGWd8JVJ+ho3IXCsjA7ADlE2uqJKECmR4EHqS+zcT4iMBhKXZTp
	 jgR7wIpO/atPHTEwCek8+eOH2k3TrUZtF/C0D5h0ph8YdX+Tgw6Ru+Jtqy+5k0pFto
	 6wwA30BdPtJs1L87gDKxrOdKFK3rKd2d1wfOcbDv/ylfe7LzBcs78smSqEuX5RV8y0
	 djQrdmHfS8r8g==
Message-ID: <sashiko-outbox-204982@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93
 platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Obergfell" <frank.obergfell@bytesatwork.ch>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261109122250.720757-5-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
 <20261109122250.720757-5-frank.obergfell@bytesatwork.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 12:50:27 +0000
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
- [Low] dt-bindings: arm: fsl: standalone SoM compatible entry for
  byteengine-imx93
--

commit 16c85ae9ce2da615e1c5f80c4ecb02932e8f9200
Author: Frank Obergfell <frank.obergfell@bytesatwork.ch>

dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms

This commit adds the bytesatwork vendor prefix and documents the
compatible strings for the byteENGINE i.MX93 System on Module and
byteDEVKIT carrier board.

> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentati=
on/devicetree/bindings/arm/fsl.yaml
> index c8290a83205b6..d342930981d2a 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1555,6 +1555,18 @@ properties:
>                - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-=
Fi + BLE + 802.15.4) SiP FRDM Board
>            - const: fsl,imx93
> =20
> +      - description: i.MX93 boards with bytesatwork byteENGINE and byted=
evkit
> +        items:
> +          - enum:
> +              - bytesatwork,bytedevkit-imx93
> +          - const: bytesatwork,byteengine-imx93
> +          - const: fsl,imx93
> +
> +      - description: i.MX93 boards with bytesatwork byteENGINE OSM Modul=
es
> +        items:
> +          - const: bytesatwork,byteengine-imx93
> +          - const: fsl,imx93

[Severity: Low]
Should this standalone entry for bytesatwork,byteengine-imx93 be dropped?

The byteENGINE i.MX93 is an OSM System-on-Module (represented by
imx93-byteengine.dtsi) that cannot boot without a carrier board, and its
compatible is already covered by the bytesatwork,bytedevkit-imx93 board
entry above.  Having a separate SoM-only entry allows root nodes without
a board compatible to pass schema validation.

Also, the commit message refers to "the byteENGINE carrier board" instead
of the byteDEVKIT carrier board.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109122250.7207=
57-1-frank.obergfell@bytesatwork.ch?part=3D4
