Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC519370ADC;
	Tue, 19 May 2026 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189795; cv=none; b=orcmbvhhFjF+B6eN+VuNH/n50JsGMu+KSbeVcUs62OrIB6rvqvX1+3Urel6ScpF77FBzh8HjUkqwy/ARSFBbqBbi1sP8OVsxfyFGcH8ijokp9TlhybdGbuyRmB0ECSf/WFZx3JxuqJ9dSYAdrsuOXcsy9n6efVgOzoYuim/voGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189795; c=relaxed/simple;
	bh=loj1+n2vySVdJanSsQ9F7HvwtQ+iMfKR3llSQmOLjyg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GjYdxuukgOZPgvU9bfRFFCgVby9oiWeAsDhi8t9af7G84SVsWHgaQVh0QKIcjjwNB9USs9Wj6lGoOa3FfGTZAmkDSR2QYCBKp3FEIPY6urx8yWUSMJM29wpl3EHBrwK2wyPdCwnXGIRfbAypDOkzGXZ4BQZvJ3+yphix3goFu+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNJRtqX9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNJRtqX9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D28C2BCB3;
	Tue, 19 May 2026 11:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189794;
	bh=loj1+n2vySVdJanSsQ9F7HvwtQ+iMfKR3llSQmOLjyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TNJRtqX97YAh8vyPRyD81vqx6RmsYzkLNDGw66l7fiQ6+0a7amM+GcKqHStDBl17E
	 2ABPNpGg8PnCpRHqov0wWcXRsJqEhuTFUzylewscDtAO+d6H+qiE0KWu7qDjCIxNIE
	 Fq1ub6Aktr3J+4E5VTnOeMEJpN3miMNdrV7SMYD6AP8BNV7Fkb7Y/GBsalumWRQ3iV
	 pJCizVBbeBaZcfKdJ5VZvRZCEDz5g9S4IOFYzG9GhopsQnwKtSyBUY76wql+9lblgY
	 H6Pg4D5ORaZ01p+2Bek7i1GwvGX2Wcn+YqfOzCecHRIbc48tGB5jBspU9yG0OX1DEp
	 gumGQHeueebzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: imx91-9x9-qsb: remove unused property
 clock-frequency from mdio node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@nxp.com>
Cc: Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-b4-imx91-qsb-opt-v1-1-9b416d2dc224@nxp.com>
References: <20260519-b4-imx91-qsb-opt-v1-1-9b416d2dc224@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:23:13 +0000
Message-Id: <20260519112314.60D28C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing a valid hardware description property because the curre=
nt Linux driver does not use it violates Device Tree design principles.
--

commit c26ce3df4b77107e385684e72957f14db0b4c96d
Author: Joy Zou <joy.zou@nxp.com>

arm64: dts: imx91-9x9-qsb: remove unused property clock-frequency from mdio=
 node

This commit removes the clock-frequency property from the mdio node, stating
that it is not implemented and removing it cleans up the device tree.

> diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64=
/boot/dts/freescale/imx91-9x9-qsb.dts
> --- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> @@ -79,7 +79,6 @@ mdio {
>  		compatible =3D "snps,dwmac-mdio";
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> -		clock-frequency =3D <5000000>;

Could removing this property introduce a regression in the hardware
description?

The device tree is meant to be an OS-agnostic hardware description. The
clock-frequency property is standard for this node and accurately describes
the hardware's intended MDIO bus speed of 5MHz.

Removing valid hardware properties due to temporary software limitations
strips away useful context that alternative operating systems, bootloaders
like U-Boot, or future Linux driver enhancements might rely on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-b4-imx91-q=
sb-opt-v1-0-9b416d2dc224@nxp.com?part=3D1
