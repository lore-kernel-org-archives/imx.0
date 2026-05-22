Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D46A348875;
	Fri, 22 May 2026 20:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482926; cv=none; b=VxahT7tl2QRcX00IPRXWf9kfn46AGmu4mjWCYPz43dBWWIwnw8QSJZzl4MbQUXhC2P0ZFDgGacYfka4Z2wCr5EPCOnq7vVio6sqy75sNH7bwR/x/EVvzjwD2LQQyL05kcMGX1VdvBMiczZUEmhhykQvFATEOzmYm7kKmadbnb0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482926; c=relaxed/simple;
	bh=iwvXEVwyhoRp94WouqA+ZPTh/8Ik7QHAGEzmxlBLdWc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tDiEqzzldiPE+BysQdO0iz2AffIJ/xqUYkLjlkbaE1hIgzEEecjTEtjrZPbSzwsxnce7ijXSX2a8ZsN0aajO6J7avBCEVSSMbDcHnwQ0EIVxQ642l5mKUdngfH4VyHHwRu73eAhledQILlrbRb9prtp+qGCZ4tkho2dK4HvokFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XorGyPSq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XorGyPSq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C181F000E9;
	Fri, 22 May 2026 20:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779482925;
	bh=2Pcr5aU2zl+JNFMQjP357INntpb0mAi3czWPKijQlpw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XorGyPSqsuj1/RFZ5Fw7gbsKgVhIDHH1T+UgCFo7na5GIFg4lJa1xbYhK6YxPToDB
	 TvQlPms1LG1bEKdPVCfCKXDDRWdRkIBFcFGFrWj4lLTOEpaFl5iaFVc7L9UKnaDR9X
	 sTeewVelX+vn2/pBUs/PfkwIqWWtXYmVo0DDxzSceLlJUm8H058BhzjdLdTd/YLIpo
	 GWppCISbq+rM8wQWpoZr0S6vgd3tIqYq1Tl0x1QQiJ3V7A8J4h8rgdBVxeZ+rr0ICQ
	 Yu6nVuYQ6n11ayEpubNXCcBotF9k045fH/nnfK6EZmMhIImXMjkDNF8oIEASwylMHX
	 yxY4JHO1OLoKg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] dt-bindings: trivial-devices: add fsl,mc1323
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522203810.832631-1-Frank.Li@oss.nxp.com>
References: <20260522203810.832631-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 20:48:44 +0000
Message-Id: <20260522204845.16C181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The complex 802.15.4/ZigBee transceiver (Freescale MC1323) is being=
 incorrectly added to trivial-devices.yaml.
--

commit b0a89da340a37ac000b2095bf76877af3c762c6f
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: trivial-devices: add fsl,mc1323

This commit adds the Freescale MC1323 2.4 GHz IEEE 802.15.4/ZigBee
transceiver to the trivial-devices binding. This change is intended to
resolve dtbs_check warnings on the legacy i.MX53 SMD platform where the
device was used.

> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Doc=
umentation/devicetree/bindings/trivial-devices.yaml
> index 23fd4513933a4..28b059c858dd1 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -127,6 +127,8 @@ properties:
>            - domintech,dmard09
>              # DMARD10: 3-axis Accelerometer
>            - domintech,dmard10
> +            # Freescale 2.4 GHz IEEE=C2=AE 802.15.4/ZigBee
> +          - fsl,mc1323

[Severity: Low]
Is it appropriate to add the Freescale MC1323 to trivial-devices.yaml?

The trivial-devices schema is strictly intended for simple I2C/SPI componen=
ts
that genuinely require no hardware properties other than a compatible strin=
g,
reg, and optionally a single interrupt.=20

Since the MC1323 is a complex IEEE 802.15.4 MAC/PHY SoC, does using
trivial-devices.yaml as a workaround for sparse legacy device tree nodes
create a regression in binding purity?=20

Would it be better to create a dedicated minimal schema in
Documentation/devicetree/bindings/net/ieee802154/ instead, even if it
initially only lists the minimal properties needed to validate the legacy
i.MX53 SMD device tree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522203810.8326=
31-1-Frank.Li@oss.nxp.com?part=3D1
