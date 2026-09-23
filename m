Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAA842E8E7;
	Wed, 23 Sep 2026 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189531; cv=none; b=cJFyWwqqtwG4NKPKGqfnqbX8Rhebvot3a8SUKeNQB0lrh/9eDYhe89R+Y/ocbc3I4mcrv1eya61O+WBBXa6ZCSzhov5s9O4pYG5EVRun5xFAbQDv/S0ngBuP3n8CWm1Fj+x4erp2HNrGMTOGxiCTqPr6EUpwlfFxzFgkEm0pR3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189531; c=relaxed/simple;
	bh=6Qo8uTLadgrZHdY65RdBwFUAHv4bDSt4+zmTomFjHCw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NRH6R8zYqKShgI2mnkVNJJjATbTq5P34TPcuA0z3hosSPkw6ZYPTASODcrhx1vxTq6da/bmqvZEXMFPz2itvboP1pCFZkbdGCp5NscJMGlR6N8iLLqy25ITCLDE7uxB0r6TOev5b6usGdAEu8uACZvRXnA+yQ+ZsXhDXn9KtqR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cUUy5GFQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cUUy5GFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA591F000FF;
	Wed, 23 Sep 2026 18:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790189526;
	bh=chmdkwQd0+nnuPqpAVU9Y+H0Mqwv1oJEeuWMgfLWtYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cUUy5GFQGaQK9FX6iLMUAnKvOgyhCdujJXUtaD4/1NT7A3/tK5+2pkOWbtqUcNYEy
	 nI3FsA95OBYuy3TodJF5tnJo8v+rKIjhRgu/Xjw7Zi41JGFWP+fhJ5+/CHwfTXIneF
	 L5V7SfJ2Z/JuEsLgFZwmESPWGs7n4zXQdiyIAuilr23GgUIvroaxcSyRL9V3hCbDoF
	 yn1JoH3NQGj1w979Yk95nrXg85a2WUKIB5ny60GaFpTvXEG5m5PhkptPS2YOl+sQ6z
	 KXSkcep8orF/httvLhotttuqYmsBDUtlaaZNuWHhY47kL4PYeAwtecvRz/jtfw0wpW
	 pib1PoMZoVBjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923184255.299034-3-shenwei.wang@oss.nxp.com>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-3-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:52:06 +0000
Message-Id: <20260923185206.7CA591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dt-bindings: architecture and commit message mismatch
--

commit a7843220c66c7f04da43c050fb047567ab9e7e53
Author: Shenwei Wang <shenwei.wang@nxp.com>

dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support

Remote processors may announce multiple GPIO controllers over an RPMSG
channel. These GPIO controllers may require corresponding device tree
nodes, especially when acting as providers, to supply phandles for their
consumers.

>     Define an RPMSG node to work as a container for a group of RPMSG chan=
nels
>     under the imx_rproc node. Each subnode within "rpmsg" represents an
>     individual RPMSG channel. The name of each subnode corresponds to the
>     channel name as defined by the remote processor.
>    =20
>     All remote devices associated with a given channel are defined as chi=
ld
>     nodes under the corresponding channel node.

[Severity: Medium]
Does this description match the implemented schema?

The commit message explicitly claims a 3-level device tree hierarchy where =
the
channel node name strictly matches the remote processor's channel name, and
remote devices are defined as child nodes under the channel.

However, the schema implements a 2-level hierarchy where the remote device =
is a
direct child of the rpmsg node, uses standard DT unit addresses instead of
RPMSG channel names, and explicitly forbids child nodes.

> diff --git a/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml b/Doc=
umentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> new file mode 100644
> index 0000000000000..41eb2e1499429
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml

[ ... ]

> +allOf:
> +  - $ref: /schemas/gpio/gpio.yaml#
> +
> +unevaluatedProperties: false

[Severity: Medium]
Does this explicitly prevent the addition of remote devices as child nodes?

The lack of child node definitions combined with unevaluatedProperties: fal=
se
breaks the design described in the commit message where remote devices are
defined as child nodes.

> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.y=
aml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b648890..5c82255b92a50 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml

[ ... ]

> @@ -88,6 +88,29 @@ properties:
>        This property is to specify the resource id of the remote processo=
r in SoC
>        which supports SCFW
> =20
> +  rpmsg:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      Represents the RPMSG bus between Linux and the remote system. Cont=
ains
> +      a group of RPMSG devices running on the bus.
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    patternProperties:
> +      "^gpio@[0-9a-f]+$":
> +        type: object
> +        $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +        unevaluatedProperties: false

[Severity: Medium]
Does this enforce GPIO controllers as direct children of the rpmsg node?

By using standard DT unit addresses like gpio@0 directly under the rpmsg
node, this contradicts the claimed 3-level hierarchy and literal
channel-naming convention described in the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923184255.2990=
34-1-shenwei.wang@oss.nxp.com?part=3D2
