Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C24346FA0;
	Mon, 31 Aug 2026 07:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788159627; cv=none; b=HWRJk2ITJm06TXnGtZpnmWCXkLIYrVL1rZY31cwlgD0bWGibEsdSkTwikc5gW3UluzS3WyH1d4ocgsradw2iP8R++H7k5AxyOBH4f8y5AJxY3KvdDdby9HjBbEuUj9XaAdb4wam2f9vcoS6ho4AlsG/e7/fB/qMQvVS2CRlXZoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788159627; c=relaxed/simple;
	bh=Ii3QJ5kWeiw9RCJaBdW3UYv49rfYq0I108zc8P+2VhI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K8+mcb0cv8cRmhYfah2Y2ET8ego6YJ4zgqyUyKAFvLfC06/ssUnoJHAjRHePuOcGEC1HkDYbI4QOx/KQVp9o1h0RrFZgg0Liim86fXD90vH2cr/r+b+1C5Lh/j35ukntm0poQkpr57wxkGUoyIZYTiil6zMF5OdZSx3A+sNMfHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHJg2lMV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHJg2lMV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC121F000E9;
	Mon, 31 Aug 2026 07:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788159626;
	bh=NcMwM/cNjEskbdoEJ70kyORuxqywMOQo/GJc64b+Kh8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AHJg2lMVcqHllb/deAzaBvO2cggSPiVZGQ+DYhWdHNuf1Px18hWPfvL1wV6rPuV0c
	 unQxuwghbQP/x8Dfl5ua7Yj0gF6SHsy7cbE8etYuQh0qg3fmgj5aiMfN0vMvhWBxoG
	 quxvvHIAybg2K12yxKjynk8OigAj/SYU1Knml3UnrPDcGJjZ3iUIJDmnU8PW4GR/lW
	 9HPCyoRly0ib4kgtUK2K7zwBYNVijukkYOQCsgcDydG6RqPZyp93t+hZgesFJ49kpD
	 P15fFxbckbQmAR0QOI+lTVMTmYgDYJm5QILt9vbQGP25y9rFAjcsGR11Ual2NDX1xt
	 LSrglZnnwG8mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v43 2/7] dt-bindings: arm: fsl: add imx-se-fw binding
 doc
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260831-imx-se-if-v43-2-a3deadbda4ef@nxp.com>
References: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
 <20260831-imx-se-if-v43-2-a3deadbda4ef@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 07:00:25 +0000
Message-Id: <20260831070025.CBC121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema Validation Incompleteness: New compatible string `fsl,imx=
95-se-ele-hsm` is missing from the `memory-region` conditional block.
--

commit 5a206151babf3f7ce0f11bd9494abfd29942086c
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

dt-bindings: arm: fsl: add imx-se-fw binding doc

This commit adds the device tree binding documentation for the NXP HW Secure
Enclave EdgeLock Enclave. It defines compatible strings and required proper=
ties
such as mboxes, memory-region, and sram.

> diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b=
/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
> new file mode 100644
> index 0000000000000..fa81adbf9b80d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml

[ ... ]

> +allOf:
> +  # memory-region
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx8ulp-se-ele-hsm
> +              - fsl,imx93-se-ele-hsm

[Severity: Medium]
Does the newly added fsl,imx95-se-ele-hsm compatible string also require a
memory region?

If imx95 shares this constraint with imx8ulp and imx93, omitting it from th=
is
conditional block means device trees for imx95 that incorrectly omit the
memory-region property may silently pass validation. Valid configurations m=
ight
also fail because the fallback else clause sets memory-region: false.

> +    then:
> +      required:
> +        - memory-region
> +    else:
> +      properties:
> +        memory-region: false
> +
> +  # sram

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-imx-se-if-=
v43-0-a3deadbda4ef@nxp.com?part=3D2
