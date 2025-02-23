Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12907E792
	for <imx@lists.linux.dev>; Sun, 23 Feb 2025 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740336411; cv=none; b=k0plflYovDbo4ai1Y7rgIIp2227ZlUWBsfg9zd36KW4h/XH3fRj4qzLLBGo+QWEuMEVkaJN5Q/5R9THsPyKAS60aOAfEFHWQM6phUUOtsTQRPW0vSZJsm3KlmyrDrg36yu//J7RQe96J9Oogj9vU/F328cSFTVHWURaSPxeznlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740336411; c=relaxed/simple;
	bh=2cSQNGsUfMbz2CkOc9WDLF15tzVkbeDZlgyHbXhN+e8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tYc930xr6a7CcIyC24lzSbsVQtgnNvCNzhaOhp7+Dubb8Ck6KlAVaPauMLeq2l+7k7fRDvRGh0U+HAtaUJzQxOYJpV/WwvmL7AwKN4HNtCWgzwd+T53uATWA8PqFWB4sBT7kbflek1acT/5eZ/C1eCjfnMFkHdoFfb3RqHbdtAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tmGzp-0000h2-Hx; Sun, 23 Feb 2025 19:46:33 +0100
Message-ID: <7ccf5c8261a1d899e9fc9f1afc3b85952c021de9.camel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks to
 overdrive rate
From: Lucas Stach <l.stach@pengutronix.de>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patchwork-lst@pengutronix.de
Date: Sun, 23 Feb 2025 19:46:31 +0100
In-Reply-To: <Z7rLWJ52aUqGkFiY@dragon>
References: <20250204182737.3361431-1-l.stach@pengutronix.de>
	 <Z7rLWJ52aUqGkFiY@dragon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Shawn,

Am Sonntag, dem 23.02.2025 um 15:16 +0800 schrieb Shawn Guo:
> On Tue, Feb 04, 2025 at 07:27:37PM +0100, Lucas Stach wrote:
> > A lot of other clocks on the i.MX8MP, including the DRAM set up by the
> > bootloader are already running at overdrive clock rates. While this is =
a
> > deviation from the configuration of other i.MX8M* family SoCs, overdriv=
e
> > is the default for most i.MX8MP boards and only some special purpose
> > boards will choose to run the SoC at nominal drive rates.
>=20
> Are any of these special purpose boards in upstream?  If so, does this
> change have any impact on them?
>=20
I'm pretty sure that none of the boards upstream are designed to run at
the nominal drive voltages right now. imx8mp-skov is one example of a
board that's designed to run at nominal voltages, but that is only on
the way to upstream now and Ahmad is aware of this patch and will
adjust the nominal drive DT as needed.

Regards,
Lucas

> Shawn
>=20
> > Up the GPU and
> > NPU clock rates to their overdrive level to be consistent with other
> > clocks set up in the dtsi.
> >=20
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mp.dtsi
> > index e0d3b8cba221..aeaa6a5c2f56 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -816,12 +816,12 @@ pgc_mlmix: power-domain@4 {
> >  						assigned-clocks =3D <&clk IMX8MP_CLK_ML_CORE>,
> >  								  <&clk IMX8MP_CLK_ML_AXI>,
> >  								  <&clk IMX8MP_CLK_ML_AHB>;
> > -						assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>,
> > +						assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
> >  									 <&clk IMX8MP_SYS_PLL1_800M>,
> >  									 <&clk IMX8MP_SYS_PLL1_800M>;
> > -						assigned-clock-rates =3D <800000000>,
> > +						assigned-clock-rates =3D <1000000000>,
> >  								       <800000000>,
> > -								       <300000000>;
> > +								       <400000000>;
> >  					};
> > =20
> >  					pgc_audio: power-domain@5 {
> > @@ -2232,9 +2232,9 @@ gpu3d: gpu@38000000 {
> >  			clock-names =3D "core", "shader", "bus", "reg";
> >  			assigned-clocks =3D <&clk IMX8MP_CLK_GPU3D_CORE>,
> >  					  <&clk IMX8MP_CLK_GPU3D_SHADER_CORE>;
> > -			assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>,
> > -						 <&clk IMX8MP_SYS_PLL1_800M>;
> > -			assigned-clock-rates =3D <800000000>, <800000000>;
> > +			assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>,
> > +						 <&clk IMX8MP_SYS_PLL2_1000M>;
> > +			assigned-clock-rates =3D <1000000000>, <1000000000>;
> >  			power-domains =3D <&pgc_gpu3d>;
> >  		};
> > =20
> > @@ -2247,8 +2247,8 @@ gpu2d: gpu@38008000 {
> >  				 <&clk IMX8MP_CLK_GPU_AHB>;
> >  			clock-names =3D "core", "bus", "reg";
> >  			assigned-clocks =3D <&clk IMX8MP_CLK_GPU2D_CORE>;
> > -			assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>;
> > -			assigned-clock-rates =3D <800000000>;
> > +			assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL2_1000M>;
> > +			assigned-clock-rates =3D <1000000000>;
> >  			power-domains =3D <&pgc_gpu2d>;
> >  		};
> > =20
> >=20
> > base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> > --=20
> > 2.39.5
> >=20
>=20

