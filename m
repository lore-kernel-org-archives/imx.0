Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05F715AAD3
	for <imx@lists.linux.dev>; Thu, 11 Jul 2024 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720704163; cv=fail; b=SEc0f6kWOiyMOhWqp35ATkYU6e8oa0M6gx330G4iEUm9Dkazy7z87r2RJL2Zh9+HRjHEJsy1AbfA4xPzuBw9Ql3oy5Nl3R6uiNPI8Lz97ehkPaoKAPDsAGVRJkQG+//BuPZPYqV3j5k+x560acg5qQh7q+DGrtMr80Y5d4qCJ2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720704163; c=relaxed/simple;
	bh=WQu9dKHrUDe/xpKYX53tGgQ0TkcsdHwyv8yKOPC/rK0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lTpqVEYTGuskTXkjcqNzU7D+IQZV08Mwlt/72ncgwRMYDia9epEXmbH/qxOwIlIf5NT5IK9Kw13KWsKHTppCkV5qt7EhdR2LUuIpd7HnJPjXt0M3VFLLnHemcDGge3tPiJv9EaGdi9n+DAlClJK5ojbHah4xpNG7Gs3yG1/w78Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=pO+ILXqp; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="pO+ILXqp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmsfeZqG8pOobu9gwi0FbBLYb0YR/z9M6rOddhtv6Et2/9AGkLmbRDxU4echcjR1z0svvj9tPNnI0lLbEk3ykPgGQJO5qrVwdIyrYyd73nVMooFRHZEuLN86KHqXKp/hAAhhiBXKIFeaaKN75Jf0VPlSuJuQZGQOEYdqCQgsdVuxenpTj4KOXQ2kmCl3ZIk/qi0mEIFeMQVjzgo3C7W/zMODA0HMxD/1Jmwb1tBSWIohsm/AHAF7Gha6G9WDmW7uQWhNhw/I0BFi0tIZX0cXEdPkv3G7WXnwHdxyYLjbmzi0cjYWdyRLkBeT5bCvbq4Ki6zi4h9yonnwCATlWgrfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jyTtiHluk4fzSqguD/RpPRXJpgVaFY1Ueca9gMk4D18=;
 b=EJN8E7ODO2W/D5bGaTDpZZUsg3JRhdijSjRZrRQbffQsX+UJfa+/gKD9tCAuTZ7/N25Y+z48BnVPRfZs0ueXbdZloEmpvQkz+3McsykE4Q9EzSx0BO4/9lMtXfyKWhAgm7BE4KOZaUgYAK86W8JCO8nD12ADqBIfWm8ISYd02+kdO3x3QTpHBmk5ngqUdX1mib4/ZNqP0bsIkfAAfZWG1rcPQr5j6BEn/YB09UwEGyV9SBNnjf3EHFIWcfT8uqUU+p1H9zo4VKfZzf5WhIYIbJeDaNfkfLOKYk3Od+8DNdRV0pcMyAybaPOeOAyrTrYJvy9siS1/LpJInNcDdLp8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jyTtiHluk4fzSqguD/RpPRXJpgVaFY1Ueca9gMk4D18=;
 b=pO+ILXqpiembjBW1JNxPBxwV+ZHWtiClXAqRIgU0KyJuX+CeqeIEHd2zrOfltvW0v9EqEuJfYx+SgWW/l0KTp52O+jH+RO2dd2BMgvalVvOoO5d72bEXUzb0ufwG1ky3/KHdoNIv7cRtBDh4bNIiYYHKgYPm3bYojcCGkvLeEyc=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 13:22:38 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%2]) with mapi id 15.20.7698.025; Thu, 11 Jul 2024
 13:22:38 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx93: update default value for snps,clk-csr
Thread-Topic: [PATCH] arm64: dts: imx93: update default value for snps,clk-csr
Thread-Index: AQHa05VmWML4d/nG/UWJSLo42BAFTw==
Date: Thu, 11 Jul 2024 13:22:38 +0000
Message-ID:
 <PAXPR04MB9185DF78FBB81BE5A780DBF289A52@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20240710200833.153521-1-shenwei.wang@nxp.com>
 <2280257.iZASKD2KPV@steina-w>
In-Reply-To: <2280257.iZASKD2KPV@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS8PR04MB7557:EE_
x-ms-office365-filtering-correlation-id: 35aeedca-588f-41e1-8cd3-08dca1ac88d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bfBkP5Vz2vBegLHpm6FAEKjTfgCIxYre4RJetQVN+HYdVck7LoVNNU5D+W?=
 =?iso-8859-1?Q?RgiG8dgp4ckQCrJSmfuekeURR5IsJAMQb5WvMkmoO1jhFE5b3AHolWKr/0?=
 =?iso-8859-1?Q?KYAiAVvQ+xgB+aFdB5zfdoBI+jGavcVW43lGjPanM42ZYMP4qlciydAIyO?=
 =?iso-8859-1?Q?iQWL+RGij7dlftewueRUAVuAEjwfscqDK99Et9qrgxO9yuBWfZZKXqmI4f?=
 =?iso-8859-1?Q?pl73t5ANtD4ObGMi53mRWHj3+6bEcsR45lfuJaPyC2kwSIGeqP1/3mighY?=
 =?iso-8859-1?Q?YVmtE9hC+TCO9BzqqNu1yRObjZRUHIP+gCI8qSbU+KIK20nWzbhhaGuR5m?=
 =?iso-8859-1?Q?gm/6j2oVchsZxLSVq4LWRqF5XKnh0/qk5UAk8+b7cgd3amuPEn/R56Z751?=
 =?iso-8859-1?Q?QeocoKasoXyuw5R1UEe/NtLtpCsUFNv1KT+UDpgRvvPqVPbRSCNpmAcRf3?=
 =?iso-8859-1?Q?nzlXNGl60sTezpT9RkMdNXXo1+ZYHDyriVYOT3WCkLHxVyHt0wQ/lNQlWH?=
 =?iso-8859-1?Q?BnXrD+2SUZrcv4MY9QZZiT5hh3aVMqnR4tnX0UiJ+hLHi3qJrZ1C94k69i?=
 =?iso-8859-1?Q?YfwzIXe44OD+Ias03ycBZNxJUmYxLjn9y771/ISVKSDeYtLPXB5k3gNdZO?=
 =?iso-8859-1?Q?zn+i4vYQow9TRd/IIqcMj1UIacnM50jb2xNaMOOQZ7gTv9iT79qyZ68mH9?=
 =?iso-8859-1?Q?19TQzhyX2dnVHhm2N0NcUNd165fAcyUej4+ZiwzXwfFZ6wS3Ei55WDz4J5?=
 =?iso-8859-1?Q?XYcK2iUik6/wmTxwvTsEQ9cfKttDDUSJ76Q6ug3UpKd3c6WSDdTwU1El1U?=
 =?iso-8859-1?Q?a5QZUMMCLcNgMDv/dHQ3uHhF3Q4bKlE93e80l+Cs2I5UZ+vb3Xz9QIURMn?=
 =?iso-8859-1?Q?wIAPaQ2jH+IGmx2jy4gtjL7uVyJ9RKY9wzD743NY8CAa80dyqboN+0PN2s?=
 =?iso-8859-1?Q?Qv7/wIKnJHeeTDONbcHGXEf7iVV9spGo9gy29AUrXh28Gmw2ImhFDwd661?=
 =?iso-8859-1?Q?kqB94dhqdXjQEg06koIsVw5MSs8py6+tBqMhiOS6Q1zOciX5Rqh2z0S4ig?=
 =?iso-8859-1?Q?AOyyqAjNSl1Pb7aX31g8aqhtiQvg517e95M9riFz0eK/0qMl6CKR3uNUV+?=
 =?iso-8859-1?Q?r/CtHNPt2n2KDYLHQja+8c/54SuVp/WHhCt9onloDPs3Mb949ZAUkaSZnD?=
 =?iso-8859-1?Q?HVmMLXpnYgChW9Hpa6DDPLmapJLSYv1hroiYssSNXoczTd8Lnhb2mJWjxy?=
 =?iso-8859-1?Q?PPpxofFReGWgn3ywbSPHEoLuU3q32vz26HtLlYX6/NdPPOe6psmsFlA+PB?=
 =?iso-8859-1?Q?0LolkiBzj60p0jZ5ewk4KOrFz23RsBBQTgM/FYPyicxHgrtqoh8rR0lzpr?=
 =?iso-8859-1?Q?poDP1g+st6XkildNY/cnsttoSpD9pLrsVM32C5roSlnPhWoom/EMA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?eol5YHfMs5V7Rqvcmi8O+cNfcbw30uRNtX5nOuiCZVWu5jWh3jWpcnwvmv?=
 =?iso-8859-1?Q?0oFl+mwiS2zkAIdWMIPiMdzqmQ09uRiBw2vONPjZvph7N3+0D63YpVzNMl?=
 =?iso-8859-1?Q?3L7PpHwVpKmrHwhCmpk+z6Aq+e4yK7kK+kzjqPxKTx3oKcLxDOY5ks5VdF?=
 =?iso-8859-1?Q?4QJ0G9BfQLyv9pTvSjyDKC8U3ii6et/R99rFyrEd+DBK9TV5UbP9+E1dU6?=
 =?iso-8859-1?Q?9rFb2zz8wukZdEv8KcZ7lppALzDBYPvos8LfAsin35bNDD34PDuuKXAl4c?=
 =?iso-8859-1?Q?1R7CObwzPe5wPsAmF/oY45EPm5KPI3StWBxJxBRXy46tZ7E8CX2jiYb1SN?=
 =?iso-8859-1?Q?UzwAYRKkg6bltd/GdFE97oR1DqjX4f/euQo6C6yX0qVvCXgiVmj9vMNnBF?=
 =?iso-8859-1?Q?FbeyTo6viq1k/j2Iiq3GWW9rbyFu8GJ8m72LCtRdipmiC73FPvWmcYirJ+?=
 =?iso-8859-1?Q?kGY0FMMHxNjM+OFUkgvPzkaycUMzdvjZYW/J7UAD+Vjg6Me124Y4rbbTiS?=
 =?iso-8859-1?Q?Po/l1TeeLof7GGkIIshrZ9/+vc++/LGwvmdl0Nx0BvkguPfq09oM9A78rM?=
 =?iso-8859-1?Q?BwTo1WxVIhZbPyzy/N2c+2VCcf2l4J28jfJ4aFo0ZDvM7ruMs3QxMGpg5X?=
 =?iso-8859-1?Q?KE3xZr9tIvogdK9/swgdJOSxIrHDgw5HMfTufUM5+u62vH30l+igDZgeOM?=
 =?iso-8859-1?Q?d/N/FtMgK1bwi7m9ep3GX8BcXrhVwLk65mCdjELZDjePCItZRVKvIuTvsP?=
 =?iso-8859-1?Q?ZOzONYx/V8wLH2F7NjwlJiGUNGA5v8jh0a5lSplbfYlF8/X3IE5yOYTTtF?=
 =?iso-8859-1?Q?sObMfOb74EFVcGIsEdegYsNQkjtl95iNqdaO/Bv1sPNNqn4Iw70QrZIWew?=
 =?iso-8859-1?Q?lKVq5Ty7Br2A4PiifiiG+HBw1APg4zZyxgmcewaI3dgMKcj7bE1EcpAJMg?=
 =?iso-8859-1?Q?Z+y2sgPhV8eV12tsvLqOZrKB8renXqkdExpqVGv3YpYI1XI5Hw9JVHCbah?=
 =?iso-8859-1?Q?f0BBlRT3qFkgfs36QvrxcLgGHLxl6PcgwWZE0C/KTbjxMUVw3eXaGBj4bf?=
 =?iso-8859-1?Q?Fa2YW/AzjaNxJM4K2FMHi5GZF+851VykNTdzx/6IbOAij7N12KfdieLHms?=
 =?iso-8859-1?Q?RMXL/K+BrQbqhF/uWzneJoQ9+Stp80cSCIUo4UvsNHST5314ETefm3uc7K?=
 =?iso-8859-1?Q?Zr3avX85dbwq4SzLONOiSWUhUaxVtAPYnMMc+tCGf5REvAP6JX44QtpUjX?=
 =?iso-8859-1?Q?T7ZhBkCP5BPMuLk+Ug2K9BM1hVTdkuUp3XLbPtwDHMcjL/r+HDac+R0uj3?=
 =?iso-8859-1?Q?EG3RiwHKTGKMj8x7hEMyL/nIFN/pJtOukbvATVNEaW7MJRoaLmDgZSX448?=
 =?iso-8859-1?Q?wSpWFhtzPd7TQ18K4/WHtccO0D/PeCcCT4GozR+8XRPT1qRj+tRp4dglzX?=
 =?iso-8859-1?Q?NUu2NqiaFM88ZT2ehSddkbng+sdsNnYP4UuduqrcexuqVHSaZ5g4W20qmm?=
 =?iso-8859-1?Q?4CbECxvWVILNPjxfcdfHWxCYHjtW3Rw6GpLwfb4k1hbtRL6ONzcjSylSXu?=
 =?iso-8859-1?Q?Q+kb6i7tdQ8loTDFlQNN9bKBpgJIqCBZLGIlWYAJQiXfwrz8BDXGNPyZSi?=
 =?iso-8859-1?Q?oopQooohZ+D95XlnY9HHY2M2UbRK/mi5r1?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35aeedca-588f-41e1-8cd3-08dca1ac88d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 13:22:38.1476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9JTfeqvWfgQh+15Pte1U8qem2qNSq4PSuIQrcLebR1RYjyTZ37HIJvcKvuStfaguvsgly+hsjSdIDGg4z0XIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557



> -----Original Message-----
> From: Alexander Stein <alexander.stein@ew.tq-group.com>
> Sent: Thursday, July 11, 2024 1:10 AM
> To: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn Guo
> <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; linux-
> arm-kernel@lists.infradead.org
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam


> Am Mittwoch, 10. Juli 2024, 22:08:33 CEST schrieb Shenwei Wang:
> > For the i.MX93 SoC, the clock rate for the IP of STMMAC EQOS is 315 MHz=
.
>
> Are you talking about enet_qos (IMX93_CLK_ENET_QOS_GATE)?
> Downstream 6.1 kernel shows:
>  sys_pll_pfd2                         1        1        0   625000000    =
      0     0  50000         Y
>     wakeup_axi_root                   4        4        0   312500000    =
      0     0  50000         Y
>        enet_qos                       5        5        0   312500000    =
      0     0  50000         Y
>
> Also RM gives a maximum of 312.5 MHz.
>

Sorry. That's a typo and should be 312.5M.


> > According to the following mapping table from the i.MX93 reference
> > manual, this clock rate corresponds to a CSR value of 6.
> >
> >  0100: CSR clock =3D 150-250 MHz; MDC clock =3D CSR clock/102
> >  0101: CSR clock =3D 250-300 MHz; MDC clock =3D CSR clock/124
> >  0110: CSR clock =3D 300-500 MHz; MDC clock =3D CSR clock/204
> >  0111: CSR clock =3D 500-800 MHz; MDC clock =3D CSR clock/324
>
> As the old value is 0 you should at least add that entry as well.
>

Will add it in next version.

> But AFAICS enet_qos is passed as clock 'mem' to this device.
> So instead of hard-coding this into DT, this divider should be calculated=
 from
> actual enet_qos clock.
>

Agree. The SoC's DTS just gives the default value. The eqos driver should i=
mplement
the logic to calculate the divider from the actual clock rate.

Thanks,
Shenwei

> Best regards,
> Alexander
>
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > index 4a3f42355cb8..a0993022c102 100644
> > --- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> > @@ -1105,7 +1105,7 @@ eqos: ethernet@428a0000 {
> >                                                        <&clk IMX93_CLK_=
SYS_PLL_PFD0_DIV2>;
> >                               assigned-clock-rates =3D <100000000>, <25=
0000000>;
> >                               intf_mode =3D <&wakeupmix_gpr 0x28>;
> > -                             snps,clk-csr =3D <0>;
> > +                             snps,clk-csr =3D <6>;
> >                               nvmem-cells =3D <&eth_mac2>;
> >                               nvmem-cell-names =3D "mac-address";
> >                               status =3D "disabled";
> >
>
>
> --
> TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht M=FCnchen, HRB 105018
> Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> http://www.tq/
> -
> group.com%2F&data=3D05%7C02%7Cshenwei.wang%40nxp.com%7Ccce6f04dfff
> 44f5e209808dca1700b30%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C
> 0%7C638562749812501600%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL
> jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%
> 7C&sdata=3D9gYoYSCGFHIpM5CtWHLFAfZvAIFaW4kLNEM5TPEQUj4%3D&reserv
> ed=3D0
>

