Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0529D3B9927;
	Tue, 21 Jul 2026 20:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667432; cv=none; b=nCpRm94qPhEuUZc9awQ0OUCZovC6GWeW3gUnm/tObNtLSMwNb2SjTQeHkNU18w6OOgF8Rn8pvQVUGBQw41wXKWnmr4CmISHNhb9XQbbKlYutRNfDR4pLP2aMNjyxXkiCxLk/sY+gbgB+thSDEzvG0ZqAGCVNRFrZ/Z6zxH2s2o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667432; c=relaxed/simple;
	bh=rEmvptwwycHrDAt5g/+obYqQ/GbT9+fFBg541n0cUos=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tAvp6xF7Br019wZWPVXL0xRDX21zzutzk+OkCYr9T2IBcd6C/5e0V6tKihZ119Dtka3uaXeUCSTDM+WzWdnlOqDeDqvKHdXjyHmQYd9m0v/UHMWPemeq82Y3oLf4r0WZnczItQgKUOBzz+CoO4U94uCDrt5BXN2Qq1fVZY6cVvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgzyZEc5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgzyZEc5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870621F00A3A;
	Tue, 21 Jul 2026 20:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784667430;
	bh=5iTRyeVhmKxkfcwXPXSEswzFXavdCXnKvbahr9kf13g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kgzyZEc5/vSuFAPsKnXszl9Tn1w2sIjW9LPMhl4c0IE1tunug704ejC6aPXdGHfjv
	 r6grPxRtjeQsowhn1QMMIF3D/5tfhfkLzYuGnaHTApG1LF810e7i3gnmDUU8NUKeZt
	 kGdfTArq7Vzh4VSSJd5hKVsMASF4NksZ4l+dFYc3r6oCqTJKdUaePbDGfsFGTLUmyV
	 bTRKBGhP+OkVkC1Ty92EBoFNk6LGwVjvpfppOKb0dFwN6Hbnm+BoLiXu8ngrIinDSG
	 4FcW9H8nmFhhX8+jJTPZ8jGuQDUWjrcj+dsd2Mq8T3eNlnaCpBPpl09KAGMn/KXW4G
	 NIbrx1t/ZLOXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 20:57:10 +0000
Message-Id: <20260721205710.870621F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The schema restrictively hardcodes the RPMSG channel subnode nam=
e to 'rpmsg-io', contradicting the documented design that allows dynamic ch=
annel names.
--

--- Patch [2]: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpm=
sg" subnode support ---
commit 51724f4669935a1840ef5386c2737af63f1a9066
Author: Shenwei Wang <shenwei.wang@nxp.com>

dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support

This commit adds an "rpmsg" container node under imx_rproc to manage a group
of RPMSG channel devices. Each subnode within "rpmsg" represents an individ=
ual
RPMSG channel and is intended to be named dynamically based on the channel =
name
defined by the remote processor.

> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.y=
aml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b648890..b9b559b186aff 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
[ ... ]
> @@ -88,6 +88,34 @@ properties:
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
> +      a group of RPMSG channel devices running on the bus.
> +
> +    properties:
> +      rpmsg-io:
> +        type: object
> +        additionalProperties: false

[Severity: Medium]
The commit message mentions that the name of each subnode corresponds to the
channel name as defined by the remote processor. Does this hardcoded proper=
ty
block the use of dynamic channel names?

Because the "rpmsg" node sets "additionalProperties: false", any device tree
node defining an RPMSG channel with a name other than exactly "rpmsg-io" wi=
ll
fail schema validation. Should this be defined using "patternProperties" or
by allowing additional properties for the container node so arbitrary remote
processor channel names are permitted?

> +        properties:
> +          '#address-cells':
> +            const: 1
> +
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "^gpio@[0-9a-f]+$":
> +            type: object
> +            $ref: /schemas/gpio/gpio-rpmsg.yaml#
> +            unevaluatedProperties: false
> +
> +        required:
> +          - '#address-cells'
> +          - '#size-cells'
> +
>  required:
>    - compatible
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721204704.4007=
81-1-shenwei.wang@oss.nxp.com?part=3D2
