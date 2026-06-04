Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8263914E1;
	Thu,  4 Jun 2026 21:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780607390; cv=none; b=WCXqZ+aUH4hJTlF2QdCyDZSnhkxdEkrjluKpSKRjQl6ef8uOrPgYe9WFja8szcHW0Fw62eGPvQBs9vzGmdvTFAQbU1kZvaDd4lwKp6Uoue79sTNeFN8oTu5q69+YgaLSVotzn9g0/ylSgyeufHV7H0i7zEn83GoCCFO1NokjCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780607390; c=relaxed/simple;
	bh=d4F0Pwe88QRoJfDJzpxtFQkeMrdxyWeU0xeUP+c+LAo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GD8odGllBvXLAk42N/NXD+ZJuEGkPWbH4OlCBOR2OozpKF0PR3owhoazM5u4MpgvM0gnh8FLvPbRtztq+GdqH/Jcx5iroR9X2tyyUXiFK2h7EHUOUnZWHjSXQbErM4wMvYioyTlxCXtnCI9BQlQpcgn/lThXk5JfZP/nhL8gW0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=li2dqLUO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="li2dqLUO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B661E1F00893;
	Thu,  4 Jun 2026 21:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780607387;
	bh=UgZxIS6o9ZvgNCGaZmo5h2d0TAq0XlTlxTHASd9hfsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=li2dqLUOUPgYLkA6VNxCA5vQkDTxNRj1Ag7lujOmkq++Obablz3eg4+uLu7e26yU9
	 CI2XelJrToNAlPTZZo7BJO0ldBuFQn29HjErB9rPaiL0WAF/z9MiAbYgij82x955nk
	 Ev2ZUkspHvL+AeodneRmNGYDjtGl9hQNva3+23tjoGEHIe0eUafk9v/JwVMg745kl8
	 vUUn1dBHPUz9d9AtxCyxqFPmTtq1zoR9U72vR79LnhA8t6y4+HfWPlPNMVOz1nTrRu
	 BRtRmGmXy9RumLuQaCIJuLA4flvLvPDTgf8232XNRW2TPaPUnOQmgdGYRXBvIlW8t1
	 Ow46sA+w4gKeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: net: dsa: Convert lan9303.txt to
 yaml format
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260603210929.3099363-1-Frank.Li@oss.nxp.com>
References: <20260603210929.3099363-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 21:09:46 +0000
Message-Id: <20260604210946.B661E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The binding references `dsa.yaml#` instead of `dsa.yaml#/$defs/e=
thernet-ports`, which causes the switch port subnodes (`port@*`) to bypass =
strict property validation against `dsa-port.yaml`.
--

commit 3fcc0d5ffe5c8b467c01ef9cbc2ae076fcd0e966
Author: Frank Li <Frank.Li@nxp.com>

dt-bindings: net: dsa: Convert lan9303.txt to yaml format
   =20
This commit converts the SMSC/MicroChip LAN9303 three-port ethernet switch
binding from text to YAML format. It also renames the switch-phy node to
switch in the examples to resolve CHECK_DTBS warnings.

> diff --git a/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml =
b/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml
> new file mode 100644
> index 0000000000000..42f8473538a07
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/smsc,lan9303.yaml

[ ... ]

> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +allOf:
> +  - $ref: dsa.yaml#

[Severity: Medium]
Does this inheritance provide strict enough validation for the port nodes?

By referencing dsa.yaml# instead of dsa.yaml#/$defs/ethernet-ports, the sch=
ema
leaves the individual port@X subnodes loosely defined without property
constraints. This allows downstream schemas to extend them, but it also mea=
ns
standard DSA port properties (like label, ethernet, or phy-mode) bypass str=
ict
validation against dsa-port.yaml.=20

Should this reference dsa.yaml#/$defs/ethernet-ports to ensure strict
evaluation of the switch port subnodes and catch typos or invalid propertie=
s?

> +
> +examples:

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603210929.3099=
363-1-Frank.Li@oss.nxp.com?part=3D1
