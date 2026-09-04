Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840EA29B781;
	Fri,  4 Sep 2026 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503880; cv=none; b=OYNSSxZbwT6s4cBUJua1UrdGl0t7xkFHfTWfZQhGz9F4C1H1w6C5temq3ABzGSex2eLrocxdtNekgGwPzn5HtfVGeJcPoWcfsE+hAywXjK2rI5/to2C5dirGVdlF73s35sehf7i4Q7LVJdouwbfUDUU9ewgfXyoFVgvDvq6DVBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503880; c=relaxed/simple;
	bh=z3+9d+AUBtrFoValYlTD4dKof/b96G02bzZhZliVN0A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HQd0duypGp3jGRw93uZH7RKUoeGvzUG4neNJdH5boGzvEADv6IS38QwdRTzTblsHfR/uD4HX4soIXHVOw922YKTaWlVrVt5UFzczd870cXulIO/pdDiKcaMm0QhetFRr2rTLa7qx79WPuBYs44m0OytklQZIf75stbM2zfnSD28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHkCb1ML; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHkCb1ML"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE5A1F00A3D;
	Fri,  4 Sep 2026 06:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788503879;
	bh=/wYUMQmYUTQJY3ck4gMD90bjNagJICWoNSgE3o/v86U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BHkCb1MLXvzEM0TKIh64bFy+lISYCU35wyEFvM2m0sqG92/iyAvbxrbfq3OGO1WdA
	 w8TsBYuZfwuagrxDtTSN8jdlxhLGt6elq3Qva3kdseqSlUEGorVI6LO9gqIpYLRvIX
	 h9Fc+98c6FC1sK2nSV+73U5FPhIgGNIQh1G76Wt8siPE3tC4B5ROQHuLPfRv+qCwNK
	 ZPXDvsxCibhaAMhk2lrUohkUmj7ciPWhKBFRZBq4rS6oaazCGwyy/RymBPmJ24NIKg
	 FzHP7PHOV2S8q8CeVgdy1vE06jPtlgKeiUJyID3NjgXZwi3acbFvTwdz5ah6bh7Su6
	 tqgakzMDiqppg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v47 2/7] dt-bindings: arm: fsl: add imx-se-fw binding
 doc
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260904-imx-se-if-v47-2-b474ec6fc52a@nxp.com>
References: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
 <20260904-imx-se-if-v47-2-b474ec6fc52a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 06:37:58 +0000
Message-Id: <20260904063758.CAE5A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Schema validation is incomplete because the new compatible strin=
g `fsl,imx95-se-ele-hsm` was omitted from the `if-then` conditional block f=
or `memory-region`.
--

commit b55beebc71d9ffb0889e72c5f18c40a5edaa3652
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

dt-bindings: arm: fsl: add imx-se-fw binding doc

This commit introduces a new device tree binding document for NXP's Secure
Enclave hardware IP. It defines the required properties and conditional
constraints for communicating with the secure enclave firmware over message
units on various i.MX processors.

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
Should fsl,imx95-se-ele-hsm be included in this enum?

Since the else clause explicitly sets memory-region to false, any imx95
device tree defining a memory-region property will fail schema validation.
If the imx95 hardware requires a memory region like the previous generations
do, does it need to be added to this conditional block to prevent valid
configurations from failing and incomplete configurations from silently
passing validation?

> +    then:
> +      required:
> +        - memory-region
> +    else:
> +      properties:
> +        memory-region: false

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-imx-se-if-=
v47-0-b474ec6fc52a@nxp.com?part=3D2
