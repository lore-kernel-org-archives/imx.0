Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D75C39901A;
	Mon, 20 Jul 2026 10:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541791; cv=none; b=otCWggRazjSnBx/JCxbhGU5coL6M3ahMViKjJYrCP8HXWqE1tfFBPVR9om0wRHtyx8eAcqAZ3mt37/DIHerPNcbmAkelCK2wV2APaTMYYtwpv5lG41oHl2sBGh4mLw5QkW31+GQj7vlJJfuNN+dKULWx6wmFEwmdYRK8rDmb20I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541791; c=relaxed/simple;
	bh=LkdU1Mw/5rdchHYGG7IywEREJQb7y4hcnOztcgx4eYg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ime8Vn5o0jsZqWUqicUge8zRkZtSqH9f6ciNBlvIX41WD4QInHXw88HmhpgNhsJGBRW6G41rlqnEtSlcBCghRL7w2w/YIQTRDTWqyGR5f3zbaTU9QZEP0Ar8IS5moAYxeXM3R2kf9TZ7WejAlOXBAcGgt0oyo1aRb00l/oqbyx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWJ1KAV7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWJ1KAV7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE111F000E9;
	Mon, 20 Jul 2026 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784541789;
	bh=UjP4CVdj662nikU25TY7QceLNwWw+ty5RjShlgFy2Xc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RWJ1KAV7/Y9fF8ghxQTYtvtymGBWoktxHko1kyW9Tn5K6GZ0teyhTNyXYQnD/kVte
	 FeuEJqhgykELbE4HjHT0+BruZVGxpkV9zFUuIgcn8EbgpMFSvWP3rTEgg57taG2BiN
	 yKehKLZiXyn7ei14w0kBLqi+S6CCMHSyNTyscrRQdQFS670kzI3INE+pH/FkTvCTkg
	 xZapFBEbfx/tl6L6nSf4bssb2oS572Bg7QjCZCjvKmZq/HY9G2r62mZWFYlnbK8AWp
	 yvVAVMTHLJ703lpkQPG4pYXZuqC1dhYf4I/eFtRhG3BWafbIUkjj8Gyn/1EvQ1o86p
	 Bv6iX9tDzwZ6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port
 binding to support multiple pairs
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:03:09 +0000
Message-Id: <20260720100309.6CE111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The newly added example causes `make dt_binding_check` to fail due =
to a device tree node merge conflict.
--

--- Patch [1]: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port bi=
nding to support multiple pairs ---
commit 45674653b1eb8f9efa969b217b62dc494801eaf3
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

dt-bindings: sound: fsl,imx-asrc: update port binding to support multiple p=
airs

The i.MX ASRC hardware supports up to three conversion pairs. This commit
updates the binding to add a ports container that enumerates three named
sub-ports, while deprecating the old single port property and ensuring
both cannot be used simultaneously.

> diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/=
Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> index 608defc93c1e9..18d252722aa8e 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml

[ ... ]

> @@ -188,3 +212,57 @@ examples:
>              };
>         };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +    asrc1: asrc@2034000 {

[Severity: Low]
Does this identical node name and unit address cause a node merge conflict
during make dt_binding_check?

The dt-extract-example tool processes the examples array by concatenating a=
ll
items into a single device tree root node. Because this new example uses the
exact same node name and unit address (asrc@2034000) as the preceding examp=
le,
the Device Tree Compiler merges them together.

The resulting merged asrc@2034000 node ends up containing both the port
property from the first example and the ports property from this second
example.=20

This violates the newly added schema constraint preventing port and ports
from both being required at the same time, which causes validation to fail.

Could a different unit address be used for this second example to prevent
the nodes from being merged?

> +        compatible =3D "fsl,imx53-asrc";
> +        reg =3D <0x02034000 0x4000>;
> +        interrupts =3D <0 50 IRQ_TYPE_LEVEL_HIGH>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720095450.1618=
747-1-shengjiu.wang@oss.nxp.com?part=3D1
