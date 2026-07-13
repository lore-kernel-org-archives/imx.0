Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5060E3BC69C;
	Mon, 13 Jul 2026 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935561; cv=none; b=OXRyMdJDLKt01loVYWsMQOAy//We90C3GPN3/7bFF5+NEbPkCOSSd6s7seiUEvvyQGxOou9qUe/F3PLrKJpBDukFWNguzmevZF/SJB4EuEf0Ysh6dSnHuF2krDBxObPul3/gYuXcg7cyEOqHR6JsUkwwSR5Xa2KJIQM+rc7aVXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935561; c=relaxed/simple;
	bh=NvDWYEUBma992w94iywI9ML4b1HSPn45nyPpaknJtMI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mHuqTw8sHxvq8AFqUenURo/vNYVODpjvarBGcr4631Yxviy8s34KID9gTzMyQaCESVbTj41t4Z1QO1V04N/41dKaZLnotz+Ei6x8JlLorZVk2N6D9DI6nrs8/srr3ghF0SQ6lHJkTWlq+1Hwmp/HtyPJjkqQzvIugWVKbEKNGA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibQXPQlJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibQXPQlJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B71F41F000E9;
	Mon, 13 Jul 2026 09:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783935560;
	bh=RXLH4XgvzcJUTnQ0Ir6+TwStOgLs32YTKlWqg58T3yE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ibQXPQlJFE005lDUslFBgWX1LE7bKjBFGxhO6hTLXnxN9GoiyPTUzyaohuoABlrwS
	 hAuFDWqquzrdegtaFK94pNRe2lfbtLnbkt2H0uSSmlCxduypwCGLmXLQE3xkjyvRtv
	 FHeHRiXgNkpLS56kQijuUKvnGfDYCVhwCWxUpsyDkI8SVALrT8DGFVj1ZMrGRn9kLc
	 MvrAQdNl9Bu4wHQS5yBf32z3IgOfh0/y6XfW4CrJEq3LLXVUfr2aHTRO9PjfRWOAHm
	 l/IwKjV0v+LPogNaj1v7OenfGhjMG7NNRa7Dc2+ALyaL1cGPY5+mS+gyMwrmtSCg/C
	 wrz7ElRSB12/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/6] arm64: dts: qcom: shikra: Add CAMSS node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nihal Kumar Gupta" <nihal.gupta@oss.qualcomm.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713-shikra-camss-review-v5-2-db53be15dc4f@oss.qualcomm.com>
References: <20260713-shikra-camss-review-v5-0-db53be15dc4f@oss.qualcomm.com>
 <20260713-shikra-camss-review-v5-2-db53be15dc4f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 09:39:19 +0000
Message-Id: <20260713093919.B71F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `camss@5c11000` node is placed out of order in `shikra.dtsi`, v=
iolating device tree sorting rules.
--

--- Patch [2]: [PATCH v5 2/6] arm64: dts: qcom: shikra: Add CAMSS node ---
commit 3b1defa09283750cdb86a9b19398c488f2a5fdb0
Author: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

arm64: dts: qcom: shikra: Add CAMSS node
   =20
This patch adds the Camera Subsystem (CAMSS) node for Shikra. It specifies
that Shikra shares the same IP as QCM2290 but drops CDM and OPE blocks,
requiring only a single IOMMU context bank.

> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/q=
com/shikra.dtsi
> index 4e5bc9e17c8ed..6335caca32980 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -604,6 +604,106 @@ opp-384000000 {
>  			};
>  		};
> =20
> +		camss: camss@5c11000 {
> +			compatible =3D "qcom,shikra-camss", "qcom,qcm2290-camss";

[Severity: Low]
Could this node be placed out of order?=20

Device tree node unit-addresses are generally sorted numerically, but here=
=20
camss@5c11000 is placed before the geniqup@4ac0000 node, which breaks the=20
numerical sorting under the soc node.

[ ... ]

> +		};
> +
>  		qupv3_0: geniqup@4ac0000 {
>  			compatible =3D "qcom,geni-se-qup";
>  			reg =3D <0x0 0x04ac0000 0x0 0x2000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-shikra-cam=
ss-review-v5-0-db53be15dc4f@oss.qualcomm.com?part=3D2
