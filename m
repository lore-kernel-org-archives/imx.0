Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07C5388E71;
	Tue, 12 May 2026 20:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778616705; cv=none; b=C6tgNa+oZBkH7luTyTSrFlq8rAO64kv5YHI+A0Zy1YKVaLPpYTiFAkTEsu7VFifjt1okROpXdJUkb8/eyBQ6VHTQd4phQuYY4xiIZztCyGJY/GeTLWvSMDUhs+ug5FepQ7suTXF80R5T8/dgxYrsVZlL+3j2k49apnK9NUSyWYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778616705; c=relaxed/simple;
	bh=R/uyJUdxJBF+fEzEOewUs43ucu/kqmQOdbR/Ptc/D3I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NWhAPsDqO3yXYYLv27LxplE5QazPB/YBIoJSUSb2rt1+DivSW1gUpdDqv2OmXpIyg+4QN1J2qSOKZFkkjdEYe2kLGYqwq8Zin4O547UKmH/WJfLuNLxAdyBGRElv5cFRg9F6fveNUnhC9ub+vZP3hi9tE2pq7rN5lD3ldm9TwZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feqgB41a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feqgB41a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D596DC2BCB0;
	Tue, 12 May 2026 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778616705;
	bh=R/uyJUdxJBF+fEzEOewUs43ucu/kqmQOdbR/Ptc/D3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=feqgB41aR9Fd2eSKB4GV1UMELcH5dkT4pPjvvAT9RA9ueb2BmN5OF6RuJflJcnqe+
	 ScukiWrgP3IONUokQfpM9XKfF3poH95lWqn32UGJo1znVBp60FsJ7WRUMra9VclBcI
	 0fQFNyazGTMuXBVIbzORkZ5nnAwh86CBN4ygL+gypW2p53j+NU651QP90Jdqmww73w
	 eAewL5roV/UqdeMKsNPsVk1ebeT4ESYCTOdolOlb8qMbBs20oYnW1g8hRB4hMwzFSm
	 RkpV2PGOq77EdQgMaS5Q1jdt8iAMnBBjgapj275tGfW90bhMHA3qO7Yp7x9N7x4dw1
	 bJp1gqnrdD92Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: Convert eukrea-tlv320.txt to yaml
Reply-To: sashiko@lists.linux.dev
To: "Frank Li via B4 Relay" <devnull+Frank.Li.nxp.com@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260511-eukrea-v2-1-cac317290978@nxp.com>
References: <20260511-eukrea-v2-1-cac317290978@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 20:11:44 +0000
Message-Id: <20260512201144.D596DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The properties `fsl,mux-int-port` and `fsl,mux-ext-port` are omi=
tted from the `required` list in the new YAML binding schema.
--

commit 5251ce7d6c30896b16c3da8622760278420a910b
Author: Frank Li <Frank.Li@nxp.com>

ASoC: dt-bindings: Convert eukrea-tlv320.txt to yaml

This commit converts the eukrea-tlv320 device tree binding documentation
from plain text to the YAML schema format.

> diff --git a/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.y=
aml b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
> new file mode 100644
> index 0000000000000..a95cd0323f6e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml

[ ... ]

> +required:
> +  - compatible
> +  - eukrea,model
> +  - ssi-controller
> +
> +additionalProperties: false

Should fsl,mux-int-port and fsl,mux-ext-port be included in this required=20
list?=20

In the original eukrea-tlv320.txt file being removed, both of these propert=
ies=20
were explicitly listed under the Required properties section.=20

Additionally, the kernel driver sound/soc/fsl/eukrea-tlv320.c appears to=20
strictly check for these properties during probe, returning an error if the=
y=20
are missing.=20

Does this omission introduce a regression where incomplete device tree node=
s=20
will silently pass dt_binding_check validation but fail at runtime?

[ ... ]

> diff --git a/Documentation/devicetree/bindings/sound/eukrea-tlv320.txt b/=
Documentation/devicetree/bindings/sound/eukrea-tlv320.txt
> deleted file mode 100644
> index 6dfa88c4dc1e8..0000000000000
> --- a/Documentation/devicetree/bindings/sound/eukrea-tlv320.txt
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Audio complex for Eukrea boards with tlv320aic23 codec.
> -
> -Required properties:
> -
> -  - compatible		: "eukrea,asoc-tlv320"
> -
> -  - eukrea,model	: The user-visible name of this sound complex.
> -
> -  - ssi-controller	: The phandle of the SSI controller.
> -
> -  - fsl,mux-int-port	: The internal port of the i.MX audio muxer (AUDMUX=
).
> -
> -  - fsl,mux-ext-port	: The external port of the i.MX audio muxer.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-eukrea-v2-=
1-cac317290978@nxp.com?part=3D1
