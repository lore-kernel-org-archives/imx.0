Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1B7488212;
	Mon, 14 Sep 2026 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399056; cv=none; b=foSAmQ9IeqGj/4iPCnA8ptRSdL5kftAtucW0xxMOB77Xgd3QHERK0LbYs8W2bUaSvJLh8/4AI5dJ6NOykJyxbPg/QE9NTJgjfbXPcAuFnhvTwSONmR05GYOzThPr4f27sBSK4oMaCqf5xgo95RDjncrYG+QbjfvCZn5TIIDqsfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399056; c=relaxed/simple;
	bh=WJVZANtvb57o/eiyecBKFn7aqdmuNvWQsg+Qp0tD8C0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ipS1LIu6tPCfV5pr8EqKnF/F9DqQ6SvagF46vwf6WExI9VsKa9wS+2K3xlduLw+ABqTRpcIvwxxQdgVtnwbJYdxbwoGon+d5WlaXvL7CsRrtRFa/gYm9fPZp1OwKajd6lHXPfTkvIUsJ4X/21h658Hx69rfc7U4i+OOXvKppcs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIKkSwx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIKkSwx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD741F000FF;
	Mon, 14 Sep 2026 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399054;
	bh=6YMpYsqszjIHimH8+85byjVbhmmzDk2fY3lzbXyaeJo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oIKkSwx4KziSzlb/XggMjj6Efy8upibzHZ5cNiyqWUtEOTcteG22O35SPWsH/9qQh
	 p76t5vq8z4fX76LxVllT4/537adD1/eHiNLoaPiuUCGOxlffs1Lqy10SYzeVVat2nB
	 1rK2Jboc30guBrP4DUAV7+HjfFc/cOvDO0WBn2hyscVsQYQ3aDHRaoApLGRy7Vo+Ov
	 msFNvdq296s9rUc5PB88hFPvRW/fhO8YxKAvOhChnA5E3cXYORHEqtoJ5CF4Ky2SxT
	 yXQf4SzE1k2iOkSaTH0eHn5xpwtDTQK80PfE+c9mcSXknlad0pfybXLMjeTyS99i/e
	 3fnPjMRl6rXQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v51 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260915-imx-se-if-v51-6-4a7dac612cb5@nxp.com>
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-6-4a7dac612cb5@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:17:33 +0000
Message-Id: <20260914151734.4FD741F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message inaccurately states that a label was added fo=
r `sram@2201f000`, when in fact the label was added to the parent `sram@220=
10000` node.
--

commit 54e1057c5cc05f686747858b82632103c75a6b80
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave secure-enclave node to the i.MX8ULP
SoC dtsi. It also provides a label to the SRAM node so it can be referenced
by the secure enclave.

>     Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
>     dtsi, together with a label for sram@2201f000 that the node reference=
s.

[Severity: Medium]
Could this commit message be updated to reflect the actual node modified?

The message states a label was added for sram@2201f000, but the diff shows
the sram0 label is actually added to the parent node at sram@22010000.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index 777b89ed68490..ac8293f81c6b2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi

[ ... ]

> @@ -154,7 +154,7 @@ sosc: clock-sosc {
>  		#clock-cells =3D <0>;
>  	};
> =20
> -	sram@22010000 {
> +	sram0: sram@22010000 {
>  		compatible =3D "mmio-sram";
>  		reg =3D <0x0 0x22010000 0x0 0x10000>;
> =20

The address 0x2201f000 corresponds to the scmi-sram-section@f000 child node
instead. The code itself appears to be functionally correct since the driver
expects the parent mmio-sram node for its gen_pool, but the commit message
description of the address is misleading.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-imx-se-if-=
v51-0-4a7dac612cb5@nxp.com?part=3D6
