Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D89847988C;
	Sat, 12 Sep 2026 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213517; cv=none; b=HuatIasj7xQ7s9JHpsL1wMBa0wteRJfPe3oFK2H46vRRmxgRd7VBGJEdplh+dLoDzJnfflzKO5MfqHXkfoHEy8oygxMhKvYBC9vcU52vRyaENv6GOpOLkma4g8dFxJXJllOsAvSusgz9Le4toLTSikLe+ymE003GthJtYQrY3Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213517; c=relaxed/simple;
	bh=wmHrla6ZNzqShHsuxaANpSKVpZL1nPknQ3I9n0oD/xw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EFm48Ukwm8Qa9VJFQk2sMd57FCEDI8RVvrXZLgQ0V4pZbx1KxjjTDO93VKxvyNvZYZMRvHCsVvt/iW/r8IaVtGRRXywZ56XeVmY7KhLcfKk3JJ/vGpqcectD77kFYj1ILRSXD7Faf+jobxNPhCR0FDvHOPvCnb3aQWj84I1URhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUmaGqQI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUmaGqQI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD7B1F000FF;
	Sat, 12 Sep 2026 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789213514;
	bh=Q9tIxNlqbfxcpnZlo9UDu7oFefd5LlWGCBTz/4F7pDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jUmaGqQIZj39btBFU7v5Xim3tTxDSgsl0DkSFa2ai8rErQiMf+MGxitJ7SLee1l/5
	 0eXUtaOns8EyRTPsyPBTRlZi7W4JHYKU4zV1Qejy2MbXcFyMYmDoiKJWzhiI2vbd3B
	 IZqrh2tilufyfPXSBX2Iqz0mny0pL/pZkq/np3CfEAttVPYRK5ZhXzqkOZ+p3YtNEc
	 IPPvjRneLfbnhxtfmNad4FYdBZ9rQ2iGHFOj2xmQfF1Ez8huasvbzumLWKpwlVeTBM
	 jVXuvEDwolylucOpr+Jv4bn7cqYuUwPzygI2aEEc/aH8eSMo34r0MmVT1z7eBGU9ww
	 Ndk3L9LVQ2E1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v50 2/7] dt-bindings: arm: fsl: add imx-se-fw binding
 doc
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260912-imx-se-if-v50-2-80834ef510d3@nxp.com>
References: <20260912-imx-se-if-v50-0-80834ef510d3@nxp.com>
 <20260912-imx-se-if-v50-2-80834ef510d3@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 11:45:13 +0000
Message-Id: <20260912114513.9CD7B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Discrepancy in the documented compatible string for i.MX95.
--

commit fadaa2081933a0613e667a53214f0c48c9bcd198
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

dt-bindings: arm: fsl: add imx-se-fw binding doc

This commit adds the device tree binding documentation for the NXP
i.MX Hardware Secure Enclave(s) EdgeLock Enclave. It defines the
communication interface using messaging units and specifies compatible
strings for i.MX8ULP, i.MX93, and i.MX95.

> diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b=
/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
> new file mode 100644
> index 0000000000000..fa81adbf9b80d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml

[ ... ]

> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8ulp-se-ele-hsm
> +      - fsl,imx93-se-ele-hsm
> +      - fsl,imx95-se-ele-hsm

[Severity: Medium]
Is there a discrepancy with the compatible string intended for i.MX95?

The binding here specifies fsl,imx95-se-ele-hsm, but in patch 1/7
of this series, the firmware documentation in=20
Documentation/driver-api/firmware/other_interfaces.rst states that it
is using the single compatible node fsl,imx95-se.

Could this mismatch cause confusion for device tree authors and driver
maintainers regarding which compatible string is actually expected?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912-imx-se-if-=
v50-0-80834ef510d3@nxp.com?part=3D2
