Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB12E2931DF;
	Mon, 28 Sep 2026 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599492; cv=none; b=R/KmWIWuoI2ER59ziBNyQZSNsM9BVcWpC9i6lnTGDzBBOEh4q4XJY9MBTHo/2fe15IoITBOM8mHteKno2q64dX4b3rZaYWPqIMY5gl0Pg07NHKusAhzPd+G+iSGlJRfEu8uDBDZ0bXY0Fp2unfmB1tiekDTqF36pz4dkFskEfXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599492; c=relaxed/simple;
	bh=EkeXO/BK3E3ygGJhQ9T8Hmlngry3GQyLFUfNNPXl4I4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q+P1yQFxuyop8yaLi/denC54ZWx60juWEJBqGbdoZ4SsYJOK1v9m9w5KPLOAK15cd6DBfbpXVWToLuITZAKjygIAG0B7o6tYiJub4zSPhJ7XWdI+vC0IcB3pIAxIG37Rpy7L4iX75D6921yLrsyUMlVDqhdaDdvAOkyZDKdlH6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iM5Z0HGH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iM5Z0HGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B22D1F000FF;
	Mon, 28 Sep 2026 12:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790599490;
	bh=EkeXO/BK3E3ygGJhQ9T8Hmlngry3GQyLFUfNNPXl4I4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iM5Z0HGHrPNDDcOJ7yJMDDu2tnUx0KRy4l85Mi9XqgtPD7fkgt4azoVo4lJE7l0yB
	 onnD54YL+j3+b8nUfkWpJH90P/PP0IgimZDoEyD21AVqKzb9wH5TBk8qi33aCfPE/2
	 FojF2NXfRTncCOWSmlfNiRex+VgCk5pkBjzbC8tDFPW9B9cAPM3KD6nsip/jyPTpDy
	 dwy4v8uDthrcT97qziKpIhAoIviblLTLUaDso6xKlADluWbJY3MJ/F+peklbytxduc
	 SdXnQgx7zihkv7Vw02PI+2ESWGKKzTNICj8Iorue47gL1CtwWuIK4R6j+SEyZ4Iy6H
	 IjiQvXSR0Wncg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL
 with eMMC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Primoz Fiser" <primoz.fiser@norik.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260928123612.2250601-1-primoz.fiser@norik.com>
References: <20260928123612.2250601-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 12:44:49 +0000
Message-Id: <20260928124450.3B22D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm: dts: build failure due to non-existent .dtsi inclusion
--

commit d27346cce6650da77827531e0a8db928754f5352
Author: Primoz Fiser <primoz.fiser@norik.com>

ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL with eMMC

Add device-tree for PHYTEC phyBOARD-Mira-i.MX6 DL board with eMMC. The
variant with NAND storage is already present in-tree. Now let's add the
eMMC variant for which the compatible string "imx6dl-pbac06-emmc"
already exists too but was not used until now.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts b/=
arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts
> new file mode 100644
> index 0000000000000..aa3239660bca7
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2018 PHYTEC Messtechnik GmbH
> + * Author: Christian Hemp <c.hemp@phytec.de>
> + */
> +
> +/dts-v1/;
> +#include "imx6dl.dtsi"
> +#include "imx6dl-phytec-phycore-som.dtsi"

[Severity: Low]
Could there be a typo in this include filename? The file
"imx6dl-phytec-phycore-som.dtsi" doesn't exist in the tree, which results in
a fatal error during device tree compilation when the C preprocessor fails
to find it.

Should this include "imx6qdl-phytec-phycore-som.dtsi" instead, which does
exist and is used by similar variants?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928123612.2250=
601-1-primoz.fiser@norik.com?part=3D1
