Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266743C13F8;
	Mon, 29 Jun 2026 07:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719618; cv=none; b=pTP4RjsRa6IM4L6G+lYaVXYsBbBHW+y97FptXOYIDOWyQXRpuaTawI/I9zgWI0Y7HSJVH5jLUsh8AstraK0Qq8heCOgL8MKATAFz9rBamDfGwK1gV8HVIn0c7ER0uTSENK9Hqg1a5LyuTs+Svc6b9ujrbTE+5RRlN/h1Rh2IHXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719618; c=relaxed/simple;
	bh=LMa8gfrWVhhvrW92fmaqJLBa5y7TxQYaHEZQFuL2eIE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nNLS0iR91HnbrFXxv0HCWP0ylPJ5Tz2CgWVJAPbCwiUU8A6QrGBSK8GHGnd4ewAoloYUmgsE0UOn2prQvuvsn8SlLPj025G2C8aB3Hte6fuSjF2HLgxbUbKrwnNcOd9ll8HVnKDhabkEFJ4wta9zJvXWMmqFRWQnW+6wZ9A7X3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHrnEyu7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHrnEyu7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33ED1F000E9;
	Mon, 29 Jun 2026 07:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782719616;
	bh=OCH2ADBFrSK5pycGbrWsAbElIVWubUj64/QZx07LGc4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BHrnEyu7tMRLQeojFGaS4J2HeRR3cqoDcqnEjgc+44kGE499uMj0H+8kHGvp8Ppni
	 Gew3mib22mAXPy4HYBJzHRWRjkcC8L9vOYw/mofcaBe9FKJShB1qfq5lMOgIRj0hgc
	 5kdpo8PctslQKlVIaNBeQxNMv/eRBOd0G3z8Jxi+BD6GRuRe+zfYzxeIIRLpOpdKZz
	 JWJQ2wdZeR48M0dOgjeGJOxrGccmyqRS3JGOJei1u1U7890D/TnKVrmKUe+5s3hPSw
	 VNKIvDUKulHp43XnxmcUcx8DeS2oWPXuwceuW3uN1p0GfPiZx0AdYZ8JVvIH6Jze3X
	 GBCkZ+5HjgSCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: chancel.liu@oss.nxp.com
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
References: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
 <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 07:53:35 +0000
Message-Id: <20260629075335.E33ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The device tree binding defines clock and interrupt provider capabi=
lities but omits the corresponding standard properties (`#clock-cells`, `in=
terrupt-controller`, `#interrupt-cells`) from the `required` list.
--

commit 600c9389f32346f471a54074928953574a215cfc
Author: Chancel Liu <chancel.liu@nxp.com>

dt-bindings: connector: Add fsl,aud-io-slot binding

This commit introduces the NXP AUD-IO slot device tree binding. It acts as
a nexus exposing GPIOs, clocks, and interrupts from the base board for
attached expansion cards.

> diff --git a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.=
yaml b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml

[ ... ]

> +allOf:
> +  - $ref: /schemas/gpio/gpio-nexus-node.yaml#
> +  - $ref: /schemas/clock/clock-nexus-node.yaml#
> +
> +required:
> +  - compatible
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-map
> +  - gpio-map-mask
> +  - gpio-map-pass-thru

[Severity: Low]
Does this required block miss the standard properties for the clock and
interrupt providers defined earlier in the schema? Should `#clock-cells`,
`interrupt-controller`, and `#interrupt-cells` be included here?

> +
> +additionalProperties: false

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629074734.3643=
227-1-chancel.liu@oss.nxp.com?part=3D1
