Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6758A3A7589;
	Thu, 14 May 2026 03:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778730717; cv=none; b=bMLl9FbsIKBuT/QcJYjSAIJv5nbU30ovrFJGWgsxXENFxKYXdga3wlAqeVJ1BtPf5ik3o5GHIdm3cNwCKG6fS0SpUq/a8y9MEheT+mNsPkKU3OoETX4aNnN8QRaFth73vUQlIsI8dQLcV203dJcxvHCHnOVrcVugtpwOowxiT9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778730717; c=relaxed/simple;
	bh=lcwT8HtwcqVv38pdLA+NNjCkhbsvVABgFjkGbByRBQo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rBhgHNlb35SosQtHQu0I5Rhz2VhtqAEMYBCGIzg8rJnStLJdAREGbTdmbNVaZJzJfdICGIXTHGEMTi6mF5o6QJ6T+FPSNDwbxp79TYwouIJeHSn6BbjSK1RLr5A/2R6zRSJvhL1uHY3vrpR7JXJ9z4Aj1DL8eZzR99CLJv69T9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=savYF94r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="savYF94r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6874C2BCC7;
	Thu, 14 May 2026 03:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778730717;
	bh=lcwT8HtwcqVv38pdLA+NNjCkhbsvVABgFjkGbByRBQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=savYF94rduCNePvNGvmVyRZUnc6reYIMkNBpS1mOb1Jb3Gqsu5ah8dNEkmFnz3sDp
	 sTCdEjqIm4yU903hSmg5UmiIzn5CfeS9Y6OEU1ih0jCBveKS8FbPnDOJ6WpCC6rQja
	 R7x2WtYxyASmK1Uz4c8nTtnt1dyrpJqTu9gY7OKu1fJxL+TRM031u9mMjNufKqkKCl
	 S9w+4vJCsRZ5t7Px+cgwG9IgOLwLovulm4QKTRkhmcNBStyAftB9zQQzEMTlZuqjL8
	 E1DYc9bIV2u0WhLX0E71ZmDFRuen+wEvNtX/nmc6hO4vy/alVZLN8EErH8hssxr9TM
	 fnsfNkvgTOQww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl:
 Allow LVDS Display Bridge child node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-imx93-ldb-v1-1-d11c5c3cc197@nxp.com>
References: <20260513-imx93-ldb-v1-1-d11c5c3cc197@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 03:51:55 +0000
Message-Id: <20260514035156.A6874C2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `bridge@20` child node is allowed unconditionally for all ha=
rdware variants in the binding, even though the i.MX91 hardware lacks an LV=
DS Display Bridge (LDB).
--

commit 1215972eab31b33c83565fc6226eed3ff41fba34
Author: Liu Ying <victor.liu@nxp.com>

dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl: Allow LVDS Display Bridge =
child node

This commit allows the LVDS Display Bridge child node in the i.MX93 media
blk-ctrl binding and adds it to the example. The LDB_CTRL and LVDS registers
control video output through the LVDS interface.

> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-bl=
k-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk=
-ctrl.yaml
> index d828c2e82965c..ab563b457e07a 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.=
yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.=
yaml

[ ... ]

> @@ -92,6 +98,11 @@ properties:
>        - compatible
>        - ports
> =20
> +  bridge@20:
> +    type: object
> +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> +    unevaluatedProperties: false
> +
>  allOf:
>    - if:
>        properties:

Since this binding is shared between fsl,imx91-media-blk-ctrl and
fsl,imx93-media-blk-ctrl, does adding bridge@20 to the top-level properties
unconditionally allow it for both variants?

If the i.MX91 hardware lacks the LVDS Display Bridge, should this child node
be explicitly disallowed by adding bridge@20: false to the allOf conditional
block for the i.MX91 compatible string?

Without this restriction, device trees incorrectly instantiating the LDB on
i.MX91 hardware might silently pass schema validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-imx93-ldb-=
v1-0-d11c5c3cc197@nxp.com?part=3D1
