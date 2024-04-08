Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C79E52F7D
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712571275; cv=none; b=AwgodAJYjT6tHXp2DuV1Hxnk45rOAxMOk9dAZxGH95r97X+2M53POyH6oRaxO646QNNetfx+DXQODifG810sbBYRKrtNx6BtSYU6S93YPyvQnQN7cBq2WTR2EjTms5nq+eBLRjZ3GVlCwfHpa4SHd+JVQyp4BHn4bLsv0u7bfxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712571275; c=relaxed/simple;
	bh=S2e+x9biH4AfHss0WzT07+D8Pd+Nkq+00oYDUxU4lkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PT4QiOus2RVlCyegfOhoZFPJB0azJ9lYjAenmvrMSeo6lVUisA8NvA03KHS0WbW+PZAl+bzRFmEikry9GYV+Sq1ZsDauFgCKMlmL2NqlkbapLuVhlt8rqjy7Fa0+6WK0CXNvl8kQjy9r4/mZmU8yCGoekPTmmoheyWUDD8FqyDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=aWzP7p7B; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XJCrKROH reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="aWzP7p7B";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XJCrKROH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1712571272; x=1744107272;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rs0Fk9cEZOdXF0db2/Mxr5B0/nzyKRMXHR0l9+QBUz8=;
  b=aWzP7p7BVrV6xCq7J9JB1Im43Fsgf2wzd8sP85MFFn9O8NuginbxD+gw
   QIvdWfQuev+/yV51rfA5gni0kjmnhQIxVwfeYPfovYHB+tz59CE2vxuLg
   abm1Hz3vZVBtbM7d9T53jGyGasNdTrq8JfTd0qy+8k4e4C9FGq/oq79k4
   8AZp4TRCJEJ1RG5JSMjdgxMpNxAotQHMnvnmGQnBV3eSWQSAdN6nsmOBz
   Tntjgny1VQmAD9Wh/XoK2AVociJ+jMjpN6hwI0iYcDrhsar/Nlp0AY7Xu
   LRQejufiBPNZnuzJtX6OR0IWyFbxZ/Pn4Eh1m+1aqYovru+ajkKugiWmu
   Q==;
X-IronPort-AV: E=Sophos;i="6.07,186,1708383600"; 
   d="scan'208";a="36293913"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2024 12:14:24 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E929160CBC;
	Mon,  8 Apr 2024 12:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1712571260;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rs0Fk9cEZOdXF0db2/Mxr5B0/nzyKRMXHR0l9+QBUz8=;
	b=XJCrKROH2TfNQokiLhiogbx9Kt1LLyBnFjYKV0udAwBIeuD5xMEyL84fDOTM28NLzx2WB1
	Av+JRXF/mTMHiI1oVmPU5YH0im1/CRMsHUs5iiI5zURCJAVlSk4EfnCpVlXW02fuqlZk/s
	97T94wCUxzJcux32wuhz/ELeGysGZxSKpMoIkA7yE/U6IBtR9A91eHRf9pta3yitvX8+w9
	GtqN37pCBg86DlFs6gMaas6zazfi+ZcZNp+GmnxtrnB0rizoQlNvCXQ+R5PpzeS/ZWcTkK
	hxaD5IsEudmIaVWrRu0n6Nrd0DpUyNQWBZCz4qg4SsLyznp92+WitOxg9gzySA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Adam Ford <aford173@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Elder <paul.elder@ideasonboard.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] arm64: dts: imx8mp: Align both CSI2 pixel clock
Date: Mon, 08 Apr 2024 12:14:18 +0200
Message-ID: <5771435.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <8c1935d1-7f59-4742-9659-bf87ac4b736c@denx.de>
References: <20240405202243.46278-1-marex@denx.de> <CAHCN7xKX7v4tmhjvoPLirEoUG91jpu-8R2DV9eE=mnWt=3FffA@mail.gmail.com> <8c1935d1-7f59-4742-9659-bf87ac4b736c@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Last-TLS-Session-Version: TLSv1.3

Hi everyone,

Am Samstag, 6. April 2024, 04:58:39 CEST schrieb Marek Vasut:
> On 4/5/24 11:04 PM, Adam Ford wrote:
> > On Fri, Apr 5, 2024 at 3:43=E2=80=AFPM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> Hi Marek,
> >>
> >> (CC'ing Adam)
> >>
> >> Thank you for the patch.
> >>
> >> On Fri, Apr 05, 2024 at 10:22:26PM +0200, Marek Vasut wrote:
> >>> Configure both CSI2 assigned-clock-rates the same way.
> >>> There does not seem to be any reason for keeping the
> >>> two CSI2 pixel clock set to different frequencies.
> >>
> >> There's an issue when using two cameras concurrently. This has been
> >> discussed some time ago on the linux-media mailing list, see [1]. Adam
> >> knows more than I do on this topic.
> >>
> >> [1] https://lore.kernel.org/linux-media/CAHCN7x+kymRGO2kxvN2=3DzLiqRjf=
Tc3hdf3VdNVkWjsW3La0bnA@mail.gmail.com/
> >>
> >>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>> ---
> >>> Cc: Conor Dooley <conor+dt@kernel.org>
> >>> Cc: Fabio Estevam <festevam@gmail.com>
> >>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> >>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>> Cc: Paul Elder <paul.elder@ideasonboard.com>
> >>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> >>> Cc: Rob Herring <robh@kernel.org>
> >>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> >>> Cc: Shawn Guo <shawnguo@kernel.org>
> >>> Cc: devicetree@vger.kernel.org
> >>> Cc: imx@lists.linux.dev
> >>> Cc: linux-arm-kernel@lists.infradead.org
> >>> ---
> >>>   arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> >>> index 1bb96e96639f2..2e9ce0c3a9815 100644
> >>> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> >>> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> >>> @@ -1703,7 +1703,7 @@ mipi_csi_1: csi@32e50000 {
> >>>                                                  <&clk IMX8MP_CLK_MED=
IA_MIPI_PHY1_REF>;
> >>>                                assigned-clock-parents =3D <&clk IMX8M=
P_SYS_PLL2_1000M>,
> >>>                                                         <&clk IMX8MP_=
CLK_24M>;
> >>> -                             assigned-clock-rates =3D <266000000>;
> >>> +                             assigned-clock-rates =3D <500000000>;
> >=20
> > I am traveling, so I don't have the technical documents in front of
> > me, but I beleive this is an over-drive speed, and 400MHz would be the
> > single clock, standard rate.  I created an imx8mm-overdrive and
> > imx8mn-overdrive dtsi file to let users who operate in overdrive mode
> > to update their clocks in one place.
> >=20
> > I also think this goes down if the user is running two cameras instead
> > of one.  I re-read the old thread, and it's coming back to me, but
> > until I can get settled into my hotel in Germany, I won't have time to
> > review.  I think the original idea was to use the lowest, conservative
> > value with the idea that people can tweak their clock settings if
> > they're only running one and if they are running in over-drive mode.
>=20
> MX8MPCEC does indeed read 400 MHz regular, 500 MHz overdrive.
>=20
> Shall we align both CSI2 ports to 400 MHz ? Currently they are one 500=20
> MHz and the other 266 MHz .

No, that won't do. The (industrial products) datasheet says (Table 1):
* Single camera on CSI1: 400/500 MHz in normal/overdrive mode
* Single camera on CSI2: 277 MHz
* Dual camera on CSI1 & CSI2: 266 MHz

Assuming you need CSI2 more likely in a dual camera setup only, defaulting =
to
266MHz seems sensible to me.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


