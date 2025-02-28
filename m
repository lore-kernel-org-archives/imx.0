Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9425DAF4
	for <imx@lists.linux.dev>; Fri, 28 Feb 2025 10:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739170; cv=none; b=c1eURZP0PfJI9aYyzlL6L3rScxl0oO2tWIpPElUxDSDdIi1zrItppR//hvoGn2NfCCQfBZWKfQTGOmNL8g0k9LOje3lxk08uccBfQETjEa05pjPBVkyFPRLyWl9FwEsnVx7cLNeCOAisvBThNGvTzkF/2e9bwrgDZWQelYZOSHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739170; c=relaxed/simple;
	bh=4ROT1EXfcHs35YSpr650DF3aBraQJ8u6WMKggL/iC3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TEWxcBkgDtVZKM6WsZrSpttvnzacIxnOEeHeMI6xhAhWPHBAgRqATeZxFSMnMyk+A7B6+bTke7IFjmxG7lBpT67pdTUPbT8UTm8Smxv+82S2RTzy7T4ou02JmMdTMgHudTtTF4tuhfM3uCtRhvsmQVpD9tWq1fHO9B5oidXtPY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=XyLzaRZh; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=NEcQE8XI reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="XyLzaRZh";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="NEcQE8XI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740739168; x=1772275168;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RpVjJ+eS+7F71ctZfki5aRuBHw0X6KQZyB8mtCBfchA=;
  b=XyLzaRZhzMgnZmuXf2IHP2meAaR/C1jckfy83argIIusLDXKqpk1ARnX
   lVo4z+inQE52ZXJWsgEcbXQ5YnCmJhwd2NBeiXGz/9yV5fwvk6a0dxYti
   9HMXY4AOtMZ15vUTJRqOS47WhhhsdEAJf/6/KC5Dwz6RUsXDY1Cu0+i9u
   jz9RZg7dZnWIZRuVIGgeRoU6gVKzsWeRaU8jqfob+JjqdMC15SqehFMmz
   4e5cZ9KmtBoGde6Scc+P1Nqd34ZKhdenwMVllqPsGGCxBnvOqZvcg3IIy
   K2DYcJyuGmxZhnhwNjr8fBG5BosiDRew1UM6o4lBSF0NxhI8fRLScF4Kj
   Q==;
X-CSE-ConnectionGUID: rI06XAEPSm6r6OtHMCwJYw==
X-CSE-MsgGUID: j8b/yOltQb+YmuY1HtO7Xw==
X-IronPort-AV: E=Sophos;i="6.13,322,1732575600"; 
   d="scan'208";a="42171994"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Feb 2025 11:39:25 +0100
X-CheckPoint: {67C1925D-57-3D6C4912-C3EB4537}
X-MAIL-CPID: 26D5FDDFA77A91E5CA992F49FAF7A837_5
X-Control-Analysis: str=0001.0A002119.67C1925D.0153,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6891D1688B1;
	Fri, 28 Feb 2025 11:39:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740739161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RpVjJ+eS+7F71ctZfki5aRuBHw0X6KQZyB8mtCBfchA=;
	b=NEcQE8XIjhcqF2KKA+UEYWMrbZpRe6X3H7k3RIPwgT4AIbWTXk6EFHXfHcPv61kztMpTZJ
	FCxYzYzljgaxSxM/FLH+p2RVugvTr7OwkWFSaqjCozwlai1tVUJwxQtqzsgzj0bwnqVWXW
	ouq1uzgIqe7F7jl8KfI05HqjsyFABkUxDW81pBzPVrxoWkOobktCPBPzRd32PZOB+ERUCj
	Jbai33oca3kGvwNOhzVgF5AmMVUutfqWHK1fE5x/VD2PiGy1i9AlmcvgPsmj1m/Tkmd/uT
	AGX09o9p8esk0xA53juuLUh+SH8NORt1X2cBt5pJYCm01Hj/jBNyCdxjmNlHIA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 9/9] arm64: dts: imx95: Describe Mali G310 GPU
Date: Fri, 28 Feb 2025 11:39:18 +0100
Message-ID: <3332618.oiGErgHkdL@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <Z8DlYjq+87sjS9cU@lizhi-Precision-Tower-5810>
References:
 <20250227170012.124768-1-marex@denx.de>
 <db903f36-e897-42ed-be46-f0b035303233@denx.de>
 <Z8DlYjq+87sjS9cU@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Donnerstag, 27. Februar 2025, 23:21:22 CET schrieb Frank Li:
> On Thu, Feb 27, 2025 at 10:34:20PM +0100, Marek Vasut wrote:
> > On 2/27/25 10:27 PM, Frank Li wrote:
> >
> > [...]
> >
> > > > > > +		gpu: gpu@4d900000 {
> > > > > > +			compatible =3D "fsl,imx95-mali", "arm,mali-valhall-csf";
> > > > > > +			reg =3D <0 0x4d900000 0 0x480000>;
> > > > > > +			clocks =3D <&scmi_clk IMX95_CLK_GPU>;
> > > > > > +			clock-names =3D "core";
> > > > > > +			interrupts =3D <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> > > > > > +				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> > > > > > +				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > +			interrupt-names =3D "gpu", "job", "mmu";
> > > > > > +			mali-supply =3D <&gpu_fixed_reg>;
> > > > > > +			operating-points-v2 =3D <&gpu_opp_table>;
> > > > > > +			power-domains =3D <&scmi_devpd IMX95_PD_GPU>, <&scmi_perf I=
MX95_PERF_GPU>;
> > > > > > +			power-domain-names =3D "mix", "perf";
> > > > > > +			resets =3D <&gpu_blk_ctrl 0>;
> > > > > > +			#cooling-cells =3D <2>;
> > > > > > +			dynamic-power-coefficient =3D <1013>;
> > > > > > +			status =3D "disabled";
> > > > >
> > > > > GPU is internal module, which have not much dependence with other=
 module
> > > > > such as pinmux. why not default status is "disabled". Supposed gp=
u driver
> > > > > will turn off clock and power if not used.
> > > > My thinking was that there are MX95 SoC with GPU fused off, hence i=
t is
> > > > better to keep the GPU disabled in DT by default. But I can also ke=
ep it
> > > > enabled and the few boards which do not have MX95 SoC with GPU can
> > > > explicitly disable it in board DT.
> > > >
> > > > What do you think ?
> > >
> > > GPU Fuse off should use access-control, see thread
> > > https://lore.kernel.org/imx/20250207120213.GD14860@localhost.localdom=
ain/
> > Did that thread ever go anywhere ? It seems there is no real conclusion=
, is
> > there ? +Cc Alex .
>=20
> The direction is use access-control to indicate fuse disable. Only
> implement detail is under discussion.

Well, the discussion ended up to be more complicated for i.MX8M. For i.MX95
things are a bit easier, as fuses and clocks are controlled by System
Manager (SM), accessed using SCMI. [1] is more important for imx95.

Best regards
Alexander

[1] https://lore.kernel.org/all/20250204-imx-ocotp-v8-0-01be4a4bb045@nxp.co=
m/
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


