Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E486478847;
	Wed, 16 Sep 2026 08:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548401; cv=none; b=Co+Y9MfNkvFHObP0i6BvSDXYB7OfURc8ZH9dF3Zxrlf1sTchX5TbxcCB7cyIcnREd97Xoi+uNuWgoi7zEE4CLykTfn80UZsBImmxzZOvvUtxeD2QLIotev+/xNcEP78iNKCxPFCgwvNAvrFnI3b1RM/maPHUjCQ9Jq7Bzchwhsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548401; c=relaxed/simple;
	bh=hiT4Z4U5wc9lMUDgyDFcbK9cMnOXVCnssOREf+uaALE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rvAx0yEc5L902Caib9QNEataBXvgGlqOkRP7TqBpSQMjdH+qBnHvmX5TtfFMNg+fx9lj/KOY6dapdIR/X3NlAMU0YOkWtXEV/gC4IGXYV7GdPyjOHWxSzagmD74oRpM55kugOJg0kS76wcSGTfluGlAsIVbPDcHiMtPKd90Y1Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKgt/sOA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKgt/sOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7164E1F000FF;
	Wed, 16 Sep 2026 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789548399;
	bh=MqBhuarjAqb9QqIG9sMHe87n2JU863qW/QxC1vvnwjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HKgt/sOAE123KfMWWWfp1hVo/njdgPy61cR9psE/xi88kXq4vFiGYsBpAaEQ899q7
	 n+r+c0r+TdtPEnp7VYprS45Q9AxP6J/dm3lO2gcI9Muh5vraJ4uh5g7ApHBzaOgOSa
	 hYVk9SRywflxctYijR9STbRVlHAxE4yRNwMw3K1F8rMykQby+jkMZvjMp8R4HFF+SS
	 /fAY7rk4lYhxCHaxiU6euopxJUlTMOC5qd1pc8j8QEQd0ik7/hMeiJXVXzHJAK9YN0
	 mjazCzkkkG6AnTe05xXTJORRmVdFoaeArjPEjtpEp8Kiuq2XMAEhsXY54NVUmFSGR6
	 Mt6ot+AiCyG5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: freescale: imx8mp-verdin-ivy: fix
 DIGI_1/DIGI_2 gpio-line-names
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260916084025.274229-3-francesco@dolcini.it>
References: <20260916084025.274229-1-francesco@dolcini.it>
 <20260916084025.274229-3-francesco@dolcini.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 08:46:38 +0000
Message-Id: <20260916084639.7164E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] dts: ABI breakage by renaming gpio-line-names on stable
--

commit 48f46109522a45af5619ecce5d2d589d31eef0e0
Author: Francesco Dolcini <francesco.dolcini@toradex.com>

arm64: dts: freescale: imx8mp-verdin-ivy: fix DIGI_1/DIGI_2 gpio-line-names

This commit renames the gpio3 line names from "DIG_1" and "DIG_2" to
"DIGI_1" and "DIGI_2" to match the official carrier board datasheet. It
also CCs stable for backporting.

Link: https://docs.toradex.com/116799-ivy_carrier_board_datasheet.pdf

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi
> index db1b4ee7728c0..bf021e85cfc94 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi
> @@ -333,8 +333,8 @@ &gpio3 {
>  		"",
>  		"",
>  		"",
> -		"DIG_1", /* SODIMM 56 */
> -		"DIG_2", /* SODIMM 58 */
> +		"DIGI_1", /* SODIMM 56 */
> +		"DIGI_2", /* SODIMM 58 */

[Severity: Critical]
Does this change break the userspace ABI?

The GPIO line names are exposed to userspace and relied upon by tooling
(like libgpiod). Because the old names ("DIG_1" and "DIG_2") have been
present in the kernel for some time, userspace applications may already be
using them.

Fixing the datasheet discrepancy by renaming established userspace-visible
names breaks these lookups. Furthermore, backporting this change to stable
branches will actively break existing production systems.

Is there a way to support the correct names without breaking existing users
relying on the older strings?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916084025.2742=
29-1-francesco@dolcini.it?part=3D2
