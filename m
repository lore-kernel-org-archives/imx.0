Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25087355F3A;
	Sun, 10 May 2026 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778410113; cv=none; b=k8WfFHJHe5m82JzHdr4f0pESaJCC+zyYcsWGj5flt74CE8565/iwENzJmyLrJZfelg3qfqnhBl3auBpjPFYU51nXJcHZAPk4JFgEAO7qOKtGWfZ//NQHuqqDznwqu8wall+R5GfvVFBzYlCi+xYC+LPF0heUbaciyr/QIZvWfdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778410113; c=relaxed/simple;
	bh=ISZPQCiXOBLXwT8Frqwp4Tf89hSuFn1odgQVAVq3NyQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gkc3mYr38CPwQBOgwze1wtQP05w7ItIQbmmqEolLxnTMGKEgWdVSjiVH4BN/nrVSnj0AArtutvAbKGz+XUOw81yvEcFFidj9uH+phrsVaioN+BaWZ8P+5RzTXk/fiKgqBdsZoTgMC6zQjurvBq2j5gcHOWMRbmOOIi5JfZzoj4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTQ+/RL5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTQ+/RL5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7061EC2BCB8;
	Sun, 10 May 2026 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778410112;
	bh=ISZPQCiXOBLXwT8Frqwp4Tf89hSuFn1odgQVAVq3NyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bTQ+/RL5a9s1QiLPNus6UoWYx/I7bXMHQMYMi7RmdmEJmm9+GJzdDexXSOAkmoHQ/
	 DmrknTCRLD01lW40anTyv2lp3psdMC6runiCkvUfC9PtnG7AEEkNlMJtNVVkh9Ccty
	 8+T/Tw2gDnyFisq7hiI8HCJwzNjbOv9YychbOIJ+mI93ULmiMKYwJLgL3nFSR7KCcq
	 GuB4d6N/ZO4fIEXg7LFHDNM+4G+7B2kRbzxcFc/o54D0wfFCR3mDIFRJOJb+AP53bw
	 DmO516CDrFt9hi/uMHSbW5uHWTKneUuXjz6kHuc87T8WEnRkbG2IkkXmKET8wMCLLL
	 1PEcziQ250gsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 net-next 02/15] dt-bindings: net: dsa: add NETC
 switch
Reply-To: sashiko@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260509102954.4116624-3-wei.fang@nxp.com>
References: <20260509102954.4116624-3-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 10:48:31 +0000
Message-Id: <20260510104832.7061EC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The `dsa,member` property lacks validation constraints for the swit=
ch index.
- [Low] The `patternProperties` regex for ethernet ports is overly restrict=
ive and diverges from standard DSA bindings.
--

commit 8c698895982ff77d4bd027af7fa3d21f57f09eba
Author: Wei Fang <wei.fang@nxp.com>

dt-bindings: net: dsa: add NETC switch

This commit adds the device tree bindings for the NETC switch. It is a PCIe
function of the NETC IP that supports advanced QoS and TSN capabilities. The
switch connects to an internal ENETC port via a light-weight pseudo MAC.

> diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.ya=
ml b/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml
> new file mode 100644
> index 0000000000000..988688bf4467d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml

[ ... ]

> +  reg:
> +    maxItems: 1
> +
> +  dsa,member:
> +    description: >
> +      The property indicates DSA cluster and switch index. For NETC swit=
ch,
> +      the valid range of the switch index is 1 ~ 7, the index is reflect=
ed
> +      in the switch tag as an indication of the switch ID where the frame
> +      originated. The value 0 is reserved for ENETC VEPA switch, whose ID
> +      is hardwired to zero.

The description mentions that the valid range of the switch index is 1 to 7
and that 0 is reserved, but there do not appear to be any constraints
enforcing this restriction in the schema definition.

Should an items array constraint be added here with a minimum of 1 and
maximum of 7 for the second element to ensure invalid configurations like
<0 0> are caught during schema validation?

> +
> +  ethernet-ports:
> +    type: object
> +    patternProperties:
> +      "^ethernet-port@[0-9a-f]$":

Is this regex intentionally more restrictive than the standard DSA bindings?

The standard DSA schema in dsa.yaml allows ^(ethernet-)?port@[0-9a-f]+$.
Because this binding sets unevaluatedProperties to false for the
ethernet-ports node, if a device tree author uses the standard port@1
naming convention, the binding will reject it.

Additionally, the single hex digit restriction would prevent port numbers
from exceeding 15. Could this be aligned with the standard pattern?

> +        type: object
> +        $ref: dsa-port.yaml#

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509102954.4116=
624-1-wei.fang@nxp.com?part=3D2
