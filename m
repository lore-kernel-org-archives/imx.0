Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178793E5EF8;
	Tue, 19 May 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779179133; cv=none; b=WrC3a2bZreSk3uC90vgULLoOypOry2FC7KLzLo+Tw3iEZ2cLkuWSDBCJIms0CHnTtXByaRlw/QNd07kf8vfsVcDqH86bMlFptMXkUxu7Kh9EvS3lPauFykyktokXI4334CoVopKN1xWYadx7VSU4uzOaOxDihIuJ3KaSGVdJqQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779179133; c=relaxed/simple;
	bh=60hPGlm20l6VamemtZIDJLBFL0XEc0SYd82z02VrL0M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EkSvg0daVxpEVIG4V8ex0MKbadf4x39PutOmmW1gs7A7Gf3/sGIRUQgLOxwv2Kfevl/oX1bkOwPp4CQoc43LpLnxpBZYPneDfHw3vC5eoPIwk20PvEHBUeYywJqYGe2q+4somFmhVVjKmMkBZMphp+pvM+joZWSCu6kHaZwlbUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IiipVfGU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IiipVfGU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFD68C2BCFA;
	Tue, 19 May 2026 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779179133;
	bh=60hPGlm20l6VamemtZIDJLBFL0XEc0SYd82z02VrL0M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IiipVfGU3rvOoGDzQWT8pe/+OuMCIrSy2j8sa4YoHlAHk/PHQdx6yU+fzd6KPF7qZ
	 ZT/C9td1z9Y0zK8m9VXt+YVbBeyzv+SFLSfkHLHgFWqms+cWwh+aPmgJdi1zmCYsOh
	 RPyD/h6/sCftSl8jaDLmo+In2ynMiLwQLQkQ3AlTy20UChEgAxglOCTSr27FoIcCJb
	 o78hCJSneYuYSmzuIL65Bp9uCFgm2XsT7A4clvwbbV9c9MUPxR2i4IMGuwBDLweiTq
	 SSpqhwQ5NEANq1qP8HH0kpuYkvF9qmMfc8dvPF+tCXd/HEdsk8HaDEdjr5K/MqiyIx
	 cC8Iamnlv9h3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 net-next 02/15] dt-bindings: net: dsa: add NETC
 switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260518082506.1318236-3-wei.fang@nxp.com>
References: <20260518082506.1318236-3-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 08:25:32 +0000
Message-Id: <20260519082532.AFD68C2BCFA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The port node regex `^ethernet-port@[0-9a-f]$` is overly restrictiv=
e and may cause validation failures for standard DSA port names.
--

commit d14813f6031f2ea85ae295290215b9d354fa21d2
Author: Wei Fang <wei.fang@nxp.com>

dt-bindings: net: dsa: add NETC switch

This commit adds device tree bindings for the NETC switch, which is a PCIe
function of the NETC IP. It supports advanced QoS and TSN capabilities, and
connects to an internal ENETC port via a pseudo MAC to reduce power and del=
ay.

> diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.ya=
ml b/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml
> new file mode 100644
> index 0000000000000..1b35e4cbd0490
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml

[ ... ]

> +  ethernet-ports:
> +    type: object
> +    patternProperties:
> +      "^ethernet-port@[0-9a-f]$":

Does this regex need to be less restrictive to support standard DSA port na=
mes?

The core DSA schema (dsa.yaml) allows port containers to be named ports or
ethernet-ports, and child ports to be named port@[0-9a-f]+ or
ethernet-port@[0-9a-f]+.

If a device tree uses the standard port@0 naming, the locally added clocks
and mdio properties will fail validation because they won't match this
schema override, falling back to the core DSA port schema which does not
allow them.

> +        type: object
> +        $ref: dsa-port.yaml#
> +
> +        properties:
> +          clocks:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518082506.1318=
236-1-wei.fang@nxp.com?part=3D2
