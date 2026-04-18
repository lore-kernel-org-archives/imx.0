Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808B523EAB8
	for <imx@lists.linux.dev>; Sat, 18 Apr 2026 01:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.181.196.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776475095; cv=none; b=pF9Lt8Lfu1HNG61kSbMFLdQP7akzne0e1zR3yucu6GUDWYrXySwEogEwyPpBW8/6+FCuRto7UBRN35GuKqQ4vwEPd0hbcDSmwP9V1Lw+Gql1/LuYepBIhOrco68wcYBGOdqdjSBq4C95kCjoKz5F4eDdHeE/lorRjghrrXVcgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776475095; c=relaxed/simple;
	bh=mmChPfcRDpqiw0FLemsBzoTj3ox+7KRwoQk45RTuLAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KXovn7kASWTgvnBDp/eW8Iif3MP/KyWFRinxFTlt+sJHLZ5vayYVq7vpxdxkrPW5IYCb7inWw/TQb4DzA7R+Twlch2gYUfQhhZ18t6bcOjH9IDFkP7JHXcZgrqwC1CL/hdpF5AKMhlbPU/tNhxXgKdAFG5EDyeZ2WFVogFw1MzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm; spf=pass smtp.mailfrom=puri.sm; dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b=cPt86atW; arc=none smtp.client-ip=135.181.196.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=puri.sm header.i=@puri.sm header.b="cPt86atW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1776474758; bh=mmChPfcRDpqiw0FLemsBzoTj3ox+7KRwoQk45RTuLAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cPt86atWNRPzuNj+y5LfZz8WmilWhGgWUR2EJYuvlZAR2elMPkEqYMjzPbyDPjzlk
	 aBflYeZ4W9nrSVjQub4atcShp2gSlSfn0VtKK27QgRZKDjpFrJnpM8lNix+j5AigAo
	 01W8dNMhhFuKJaD2+pFJkHYKJliNPPYeR1QUjP4YEjTVjKbrXcHHcaW7RdloGe78xR
	 NN6OH5SELxuFpp8q0DeiVswsUmB/cAra0YRGXsVaz7tHwPt7FSmmMFQDm83+UnrgWa
	 sHHhdf2BT8jwSRPtpjAOO9ydOXBTIrhODXY7p8GDobwPH+0pHUFFReiO5ly/I+t/y+
	 deY2opENBN3uQ==
Received: from pliszka.localnet (79.184.67.253.ipv4.supernova.orange.pl [79.184.67.253])
	by ms.puri.sm (Postfix) with ESMTPSA id E0C341F6CB;
	Fri, 17 Apr 2026 18:12:37 -0700 (PDT)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, martin.kepplinger@puri.sm, Robby Cai <robby.cai@nxp.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx8mq: Correct MIPI CSI clocks
Date: Sat, 18 Apr 2026 03:12:24 +0200
Message-ID: <5956186.LvFx2qVVIh@pliszka>
In-Reply-To: <20260417110200.753678-2-robby.cai@nxp.com>
References:
 <20260417110200.753678-1-robby.cai@nxp.com>
 <20260417110200.753678-2-robby.cai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On pi=C4=85tek, 17 kwietnia 2026 13:01:59 czas =C5=9Brodkowoeuropejski letn=
i Robby Cai=20
wrote:
> CSI capture may intermittently fail due to mismatched clock rates. The
> previous configuration violated the timing requirement stated in the
> i.MX8MQ Reference Manual:
>=20
>   "The frequency of clk must be exactly equal to or greater than the RX
>    byte clock coming from the RX DPHY."
>=20
> Update the clock configuration to ensure that the CSI core clock rate is
> equal to or greater than the incoming DPHY byte clock. The updated clock
> ratios are consistent with those used in NXP's downstream BSP.

I believe this is a misreading of the docs.

IMX8MQ_CLK_CSIX_PHY_REF refers to the UI pixel clock (clk_ui), not the RX D=
PHY=20
byte clock. All this change would do is to break streaming with more than 1=
00=20
Mpixels per second / 1064 Mbps per MIPI lane.

As mentioned in the reference manual:

"The frequency of clk_ui must be such that the data received on the data_ou=
t=20
output is greater than or equal to the total bandwidth of the physical MIPI=
=20
interface. Clk_ui has no relationship requirement with regards to =E2=80=98=
clk=E2=80=99 other=20
than the bandwidth requirement mentioned previously."

> Fixes: bcadd5f66c2a ("arm64: dts: imx8mq: add mipi csi phy and csi bridge
> descriptions") Cc: stable@vger.kernel.org
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi index
> 6a25e219832c..165716d08e64 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -1377,7 +1377,7 @@ mipi_csi1: csi@30a70000 {
>  				assigned-clocks =3D <&clk=20
IMX8MQ_CLK_CSI1_CORE>,
>  				    <&clk=20
IMX8MQ_CLK_CSI1_PHY_REF>,
>  				    <&clk IMX8MQ_CLK_CSI1_ESC>;
> -				assigned-clock-rates =3D=20
<266000000>, <333000000>, <66000000>;
> +				assigned-clock-rates =3D=20
<133000000>, <100000000>, <66000000>;
>  				assigned-clock-parents =3D <&clk=20
IMX8MQ_SYS1_PLL_266M>,
>  					<&clk=20
IMX8MQ_SYS2_PLL_1000M>,
>  					<&clk=20
IMX8MQ_SYS1_PLL_800M>;
> @@ -1429,7 +1429,7 @@ mipi_csi2: csi@30b60000 {
>  				assigned-clocks =3D <&clk=20
IMX8MQ_CLK_CSI2_CORE>,
>  				    <&clk=20
IMX8MQ_CLK_CSI2_PHY_REF>,
>  				    <&clk IMX8MQ_CLK_CSI2_ESC>;
> -				assigned-clock-rates =3D=20
<266000000>, <333000000>, <66000000>;
> +				assigned-clock-rates =3D=20
<133000000>, <100000000>, <66000000>;
>  				assigned-clock-parents =3D <&clk=20
IMX8MQ_SYS1_PLL_266M>,
>  					<&clk=20
IMX8MQ_SYS2_PLL_1000M>,
>  					<&clk=20
IMX8MQ_SYS1_PLL_800M>;




