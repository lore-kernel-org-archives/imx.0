Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A165E215187
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 10:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418876; cv=none; b=RGDiEYkX8/DwdJ7BUDEUjF4zlrKMV9kZeINJIOfVWy0lYFBW1cpD5F/CU0r+kuc4LwA8wUXX0SSgRW2ypMEx9TAw4VSISc9IELIEn2PM5bBJ1W0R4Slcu6vUqt4L2dqdf7U3ML6MtV9piyy9A+pkrJYSem/hMMtH50WN9mHll5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418876; c=relaxed/simple;
	bh=b2mFnURgBYhW3tPe2jkEMh6houBMg8MkQqm87ns/fXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PPdB9TQRmhGcWoCoXQvTVhGp4rm047uX0uIRit0e0DI/MlYyDC5tmlB3pRMGQbW+MnyA8uTdixVG+xgTManb3QdKYfcYeC0TmE4eMr0UsjFL7gskbSv7Un8nJRa4io6HNcb/YLBvrxx9V3+slZK/PNTjW23nTpat2P9rNM6nrw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=e7saJ7fr; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=P0G9oAvd reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="e7saJ7fr";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="P0G9oAvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736418872; x=1767954872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0MTN/uQ1fj1sjFZFU29nzAA7q3WAULF2DQMtFspMm54=;
  b=e7saJ7frX9+GYgS9bxaVIVJs+k3LTpPVT8t+Uyue2IbYhClVXuoTadmB
   w1KfL/jS5EQU8Qz5n0LABA3BKj8qruBL8ISjumutGLwtoCeIXer5CHQrf
   HBPKjQ4cLrBhcp41I41OeTSFafd5BR12y1XO1VEVlSwgH8ecs2ig75MzE
   usJyx3acUtrL8oMkJ8sdGqfy4fBNgHgMk4HCz0WcwddElqvSeTvCKHcqO
   3wkSRoJq5/KbI8tSrIQio+7zLLg0+wz7OHuIj6hk5/DBxM2KvLNwyE69S
   vd4gK+MEYN8xpGMvtVp3llY7Mm1e1WbfNoOUNPL7T1DqhVlwn8ew5LCoN
   Q==;
X-CSE-ConnectionGUID: +JTc6dEsTZ60x0BbnUIENQ==
X-CSE-MsgGUID: fLjUKfk6TjaaKBsrd1u3mg==
X-IronPort-AV: E=Sophos;i="6.12,301,1728943200"; 
   d="scan'208";a="40947499"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 09 Jan 2025 11:34:25 +0100
X-CheckPoint: {677FA631-4-C6D8D88D-F91F9E6B}
X-MAIL-CPID: DAEE3929AC4BF68E40EE46756A13F4E5_2
X-Control-Analysis: str=0001.0A682F1D.677FA631.0057,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 085C1166C27;
	Thu,  9 Jan 2025 11:34:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736418860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MTN/uQ1fj1sjFZFU29nzAA7q3WAULF2DQMtFspMm54=;
	b=P0G9oAvddIJbYBTchLqPNFA/W8Ahm04hcZ4n4w9aN9X3yAs4hsjvxeX2/9AFsF60X8nyGd
	xXk2jEKOXvXXA3tpxUfXxdwAEndVs5uOnnK/BUrAp3mAGVjTNF0A6Zi6bqjTBZQhz0Qseh
	J03hbNgSysrkUSJBRZEV9DUPMUIb9TwYPm+UNzoxnhZTvxXMcU4yH1zxGFHL0RgvFjFYJ/
	65kipP5yJuQGlN7YQy7CpQ8SzP8pCrAK72e3lKcdZC2CmwnvkpYZkLuW93w+gVWhlj7Y5a
	jC4OplR+oh3C64I2iWSoWK9MLz48DxcWwwbzootiP27bRJja1m5Whp8AGeWvWg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v5 2/2] nvmem: imx-ocotp-ele: Support accessing controller for i.MX9
Date: Thu, 09 Jan 2025 11:34:18 +0100
Message-ID: <868241455.0ifERbkFSE@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250109033418.GB31833@localhost.localdomain>
References: <20250108-imx-ocotp-v5-0-a6d90e18ebe9@nxp.com> <3823142.MHq7AAxBmi@steina-w> <20250109033418.GB31833@localhost.localdomain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Am Donnerstag, 9. Januar 2025, 04:34:18 CET schrieb Peng Fan:
> On Wed, Jan 08, 2025 at 11:15:40AM +0100, Alexander Stein wrote:
> >Hi Peng,
> >
> >Am Mittwoch, 8. Januar 2025, 08:00:18 CET schrieb Peng Fan (OSS):
> >> From: Peng Fan <peng.fan@nxp.com>
> >>=20
> >> i.MX9 OCOTP supports a specific peripheral or function being fused
> >> which means disabled, so
> >>  - Introduce ocotp_access_gates to be container of efuse gate info
> >>  - Iterate all nodes to check accessing permission. If not
> >>    allowed to be accessed, detach the node
> >>=20
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/nvmem/imx-ocotp-ele.c | 172 +++++++++++++++++++++++++++++++++=
++++++++-
> >>  1 file changed, 171 insertions(+), 1 deletion(-)
> >>=20
> [....]
> >> +
> >> +	return imx_ele_ocotp_access_control(priv);
> >
> >In [1] you mentioned devlink should solve the probe order. How does this
> >play when the driver is compiled in (e.g. ethernet for NFS boot) but
> >this OCOTP driver is just a module?
>=20
> OCOTP needs to built in for using devlink. Or the users needs to be
> built as module.

I don't like this kind of assumption. Would it make more sense to make
CONFIG_NVMEM_IMX_OCOTP_ELE as bool instead of tristate?

> >I'm not well versed with devlink, but is
> >> access-controllers =3D <&ocotp IMX93_OCOTP_ENET1_GATE>;
> >already enough to create that link?
>=20
> Yes, the drivers/of/property.c has this
> "DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-co=
ntroller-cells")"
>=20
> The fw_devlink driver will create consumer/supplier to make sure proper
> order.

Okay, thanks for confirming.

Best regards,
Alexander

> Regards,
> Peng
>=20
> >
> >Best regards,
> >Alexander
> >
> >>  }
> >> =20
> >> +struct access_gate imx93_access_gate[] =3D {
> >> +		[IMX93_OCOTP_NPU_GATE]		=3D { .word =3D 19, .mask =3D BIT(13) },
> >> +		[IMX93_OCOTP_A550_GATE]		=3D { .word =3D 19, .mask =3D BIT(14) },
> >> +		[IMX93_OCOTP_A551_GATE]		=3D { .word =3D 19, .mask =3D BIT(15) },
> >> +		[IMX93_OCOTP_M33_GATE]		=3D { .word =3D 19, .mask =3D BIT(24) },
> >> +		[IMX93_OCOTP_CAN1_FD_GATE]	=3D { .word =3D 19, .mask =3D BIT(28) },
> >> +		[IMX93_OCOTP_CAN2_FD_GATE]	=3D { .word =3D 19, .mask =3D BIT(29) },
> >> +		[IMX93_OCOTP_CAN1_GATE]		=3D { .word =3D 19, .mask =3D BIT(30) },
> >> +		[IMX93_OCOTP_CAN2_GATE]		=3D { .word =3D 19, .mask =3D BIT(31) },
> >> +		[IMX93_OCOTP_USB1_GATE]		=3D { .word =3D 20, .mask =3D BIT(3) },
> >> +		[IMX93_OCOTP_USB2_GATE]		=3D { .word =3D 20, .mask =3D BIT(4) },
> >> +		[IMX93_OCOTP_ENET1_GATE]	=3D { .word =3D 20, .mask =3D BIT(5) },
> >> +		[IMX93_OCOTP_ENET2_GATE]	=3D { .word =3D 20, .mask =3D BIT(6) },
> >> +		[IMX93_OCOTP_PXP_GATE]		=3D { .word =3D 20, .mask =3D BIT(10) },
> >> +		[IMX93_OCOTP_MIPI_CSI1_GATE]	=3D { .word =3D 20, .mask =3D BIT(17) =
},
> >> +		[IMX93_OCOTP_MIPI_DSI1_GATE]	=3D { .word =3D 20, .mask =3D BIT(19) =
},
> >> +		[IMX93_OCOTP_LVDS1_GATE]	=3D { .word =3D 20, .mask =3D BIT(24) },
> >> +		[IMX93_OCOTP_ADC1_GATE]		=3D { .word =3D 21, .mask =3D BIT(7) },
> >> +};
> >> +
> >> +static const struct ocotp_access_gates imx93_access_gates_info =3D {
> >> +	.num_words =3D 3,
> >> +	.words =3D {19, 20, 21},
> >> +	.num_gates =3D ARRAY_SIZE(imx93_access_gate),
> >> +	.gates =3D imx93_access_gate,
> >> +};
> >> +
> >>  static const struct ocotp_devtype_data imx93_ocotp_data =3D {
> >> +	.access_gates =3D &imx93_access_gates_info,
> >>  	.reg_off =3D 0x8000,
> >>  	.reg_read =3D imx_ocotp_reg_read,
> >>  	.size =3D 2048,
> >> @@ -183,7 +307,53 @@ static const struct ocotp_devtype_data imx93_ocot=
p_data =3D {
> >>  	},
> >>  };
> >> =20
> >> +struct access_gate imx95_access_gate[] =3D {
> >> +		[IMX95_OCOTP_CANFD1_GATE]	=3D { .word =3D 17, .mask =3D BIT(20) },
> >> +		[IMX95_OCOTP_CANFD2_GATE]	=3D { .word =3D 17, .mask =3D BIT(21) },
> >> +		[IMX95_OCOTP_CANFD3_GATE]	=3D { .word =3D 17, .mask =3D BIT(22) },
> >> +		[IMX95_OCOTP_CANFD4_GATE]	=3D { .word =3D 17, .mask =3D BIT(23) },
> >> +		[IMX95_OCOTP_CANFD5_GATE]	=3D { .word =3D 17, .mask =3D BIT(24) },
> >> +		[IMX95_OCOTP_CAN1_GATE]		=3D { .word =3D 17, .mask =3D BIT(25) },
> >> +		[IMX95_OCOTP_CAN2_GATE]		=3D { .word =3D 17, .mask =3D BIT(26) },
> >> +		[IMX95_OCOTP_CAN3_GATE]		=3D { .word =3D 17, .mask =3D BIT(27) },
> >> +		[IMX95_OCOTP_CAN4_GATE]		=3D { .word =3D 17, .mask =3D BIT(28) },
> >> +		[IMX95_OCOTP_CAN5_GATE]		=3D { .word =3D 17, .mask =3D BIT(29) },
> >> +		[IMX95_OCOTP_NPU_GATE]		=3D { .word =3D 18, .mask =3D BIT(0) },
> >> +		[IMX95_OCOTP_A550_GATE]		=3D { .word =3D 18, .mask =3D BIT(1) },
> >> +		[IMX95_OCOTP_A551_GATE]		=3D { .word =3D 18, .mask =3D BIT(2) },
> >> +		[IMX95_OCOTP_A552_GATE]		=3D { .word =3D 18, .mask =3D BIT(3) },
> >> +		[IMX95_OCOTP_A553_GATE]		=3D { .word =3D 18, .mask =3D BIT(4) },
> >> +		[IMX95_OCOTP_A554_GATE]		=3D { .word =3D 18, .mask =3D BIT(5) },
> >> +		[IMX95_OCOTP_A555_GATE]		=3D { .word =3D 18, .mask =3D BIT(6) },
> >> +		[IMX95_OCOTP_M7_GATE]		=3D { .word =3D 18, .mask =3D BIT(9) },
> >> +		[IMX95_OCOTP_DCSS_GATE]		=3D { .word =3D 18, .mask =3D BIT(22) },
> >> +		[IMX95_OCOTP_LVDS1_GATE]	=3D { .word =3D 18, .mask =3D BIT(27) },
> >> +		[IMX95_OCOTP_ISP_GATE]		=3D { .word =3D 18, .mask =3D BIT(29) },
> >> +		[IMX95_OCOTP_USB1_GATE]		=3D { .word =3D 19, .mask =3D BIT(2) },
> >> +		[IMX95_OCOTP_USB2_GATE]		=3D { .word =3D 19, .mask =3D BIT(3) },
> >> +		[IMX95_OCOTP_NETC_GATE]		=3D { .word =3D 19, .mask =3D BIT(4) },
> >> +		[IMX95_OCOTP_PCIE1_GATE]	=3D { .word =3D 19, .mask =3D BIT(6) },
> >> +		[IMX95_OCOTP_PCIE2_GATE]	=3D { .word =3D 19, .mask =3D BIT(7) },
> >> +		[IMX95_OCOTP_ADC1_GATE]		=3D { .word =3D 19, .mask =3D BIT(8) },
> >> +		[IMX95_OCOTP_EARC_RX_GATE]	=3D { .word =3D 19, .mask =3D BIT(11) },
> >> +		[IMX95_OCOTP_GPU3D_GATE]	=3D { .word =3D 19, .mask =3D BIT(16) },
> >> +		[IMX95_OCOTP_VPU_GATE]		=3D { .word =3D 19, .mask =3D BIT(17) },
> >> +		[IMX95_OCOTP_JPEG_ENC_GATE]	=3D { .word =3D 19, .mask =3D BIT(18) },
> >> +		[IMX95_OCOTP_JPEG_DEC_GATE]	=3D { .word =3D 19, .mask =3D BIT(19) },
> >> +		[IMX95_OCOTP_MIPI_CSI1_GATE]	=3D { .word =3D 19, .mask =3D BIT(21) =
},
> >> +		[IMX95_OCOTP_MIPI_CSI2_GATE]	=3D { .word =3D 19, .mask =3D BIT(22) =
},
> >> +		[IMX95_OCOTP_MIPI_DSI1_GATE]	=3D { .word =3D 19, .mask =3D BIT(23) =
},
> >> +};
> >> +
> >> +static const struct ocotp_access_gates imx95_access_gates_info =3D {
> >> +	.num_words =3D 3,
> >> +	.words =3D {17, 18, 19},
> >> +	.num_gates =3D ARRAY_SIZE(imx95_access_gate),
> >> +	.gates =3D imx95_access_gate,
> >> +};
> >> +
> >>  static const struct ocotp_devtype_data imx95_ocotp_data =3D {
> >> +	.access_gates =3D &imx95_access_gates_info,
> >>  	.reg_off =3D 0x8000,
> >>  	.reg_read =3D imx_ocotp_reg_read,
> >>  	.size =3D 2048,
> >>=20
> >>=20
> >
> >
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


