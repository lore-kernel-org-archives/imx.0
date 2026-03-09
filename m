Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013063.outbound.protection.outlook.com [40.107.159.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11097221FBD
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 02:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773022817; cv=fail; b=b4P5McXLnru8hssoP7X7RQvE5TVp2HQcXw1KDE0/fvQQymY3OqlFqmsQi+bzhfBGZ3yoMctn3cs71eRMeYvdD28cL0x3k/8/SZI7hv8+Q5HFImCohOOXGL5Vg8gVerENrG6iwQN2iw/Rx+e7O0gFNP3uagK8uXyvUqqSId5ppNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773022817; c=relaxed/simple;
	bh=Oj91N+WHRfitfRQCmduW8AaKAy3NHK3g2wtC7+DK7N8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JyrpVnBKlI1yxL8pLtTQe6Fs6tvyf2t8F/Tf82mFENqX2YAI+OhVDXtURGwrwOl9+mY6BOxr41A/i7s0mODzioX/HpO5wGvuaYEijzEl9goDhwsi4E/ucjZ9P+WyzweS3Iw1av5ePPsjyr261OEGbDRyH8Igbu0BlvIX36ZvIAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T3cQKr/r; arc=fail smtp.client-ip=40.107.159.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T3cQKr/r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1YCZjKRuZ44+R+XeMZbXriFh9JgxsNJqD1gvVfJ5sZztvcS1GeyHs1D8PcuQ8hucjExPgVLI1fhu3kj7TXaUtNOuI7TCJMH4jXB2YShryXvXoH5971boxQjmfBs7dOE7/GX4o59V2QL3rj8/Tdo5UKNNlTWQUY2K861ib+NGTx4KnPesDTz/dDo6k1H2Db6DmSQjL1uur+Nmb0ty1T60KmcOmaQnPeIZSMi9gYgTW1aoAivniEys+0dQj7/KadkCmJ42z6JYgwSyRxClNs+sfc0TrkClASak1M0Ce3x5zhOEAeFaxkmRT9KaOdPvOT1LAmwdH3gocxXA/95LCfFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfxyeuaZmVSulXvcgZW4ieJTCBScnVJSWwp4Mx+yqak=;
 b=iW/Vtc6iEnF+Fpz5e/c61VprYw8pm1fLNLr6NWu3EddMaedLWXxC9dpJgI2DQMUPbVoh5tfj25N3FlwtkVEyW1U6hzINwa3YFZTnSPimEGkHEMyE8yWvmRr2PBwOjlplcuQq8ZgJP4K1v1CONIurg3AlmQ8ri0hA69V9AeNBQHBEndk33klx1jy4RkAxILh1gCDUUNyXrO13cc4w9OLv6RAc3hCPsH/1IFMY9KNbs6R1uJ/Q8+4FzEgVrDlR9nqGNnk1oLzzLyGgMbsF693VBxYDdhmhI/1U6YqihiU7/bA9UpJ3IMFfnVCFKTovWeOrxN1eBIAyX5V62yHiqn+MeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfxyeuaZmVSulXvcgZW4ieJTCBScnVJSWwp4Mx+yqak=;
 b=T3cQKr/rcGX9jgcFZ3x2QHC8qvTA23XPm0AHjKJWgtApdQ+S9gKqmR8bmgEx5t+eirigh5PDl1DZL0exlikfDWN0btryo8/8pDbVXxZl7T7ymhi5dtui/X7kl5yHJw21+JUmQNKVUgUwYcZB3SQpWqe+fJp196q4vXyXoHTCeNCNTjEgBjtaaO6E5keLeiZbtOgX4f+nvRL77fPiHR0aE9ZVlO2k26mgYMZEnOwGkOGFLibYHWL5n/49WNUEBfAc7z99PGE6LbUskaV2sb2719Y0ICE35qOU5Hbm1urUYyR1Qkr+kkwXSufg/c7f9954QFdYvK5LI13W97N1ROURsg==
Received: from AM6PR04MB4903.eurprd04.prod.outlook.com (2603:10a6:20b:6::26)
 by VI2PR04MB10740.eurprd04.prod.outlook.com (2603:10a6:800:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Mon, 9 Mar
 2026 02:20:01 +0000
Received: from AM6PR04MB4903.eurprd04.prod.outlook.com
 ([fe80::9b36:3ebd:4263:3875]) by AM6PR04MB4903.eurprd04.prod.outlook.com
 ([fe80::9b36:3ebd:4263:3875%3]) with mapi id 15.20.9632.017; Mon, 9 Mar 2026
 02:20:10 +0000
From: Forrest Shi <xuelin.shi@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: Peter Robinson <pbrobinson@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] [PATCH v2] arm64: dts: freescale: imx93: Add Ethos-U65 NPU
 and SRAM nodes
Thread-Topic: [EXT] [PATCH v2] arm64: dts: freescale: imx93: Add Ethos-U65 NPU
 and SRAM nodes
Thread-Index: AQHcragustIHGrdsxEmZwy+wCleagLWleSPw
Date: Mon, 9 Mar 2026 02:20:10 +0000
Message-ID:
 <AM6PR04MB49036F39D57F4A0A6D3F94438C79A@AM6PR04MB4903.eurprd04.prod.outlook.com>
References: <20260306203103.3119790-1-robh@kernel.org>
In-Reply-To: <20260306203103.3119790-1-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB4903:EE_|VI2PR04MB10740:EE_
x-ms-office365-filtering-correlation-id: 9d5190fc-7a59-49ce-9a8b-08de7d8263c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 oXi5QUX3zW2OSbjZv/qS0XW1ofdH8AEoEU/OSySiE+pdwTc2O8S4hyJumTVtQUfpmlmRL3DLgmFiQgfZkPYHITvqlRb66bzsFkux4CLFSi+qFATqxRQYYmioWeC0f/7cNprDpfOAuIj7c9YhglpZzO7Lp6ujyxQx4qhz0ialhSR23t4u/iZP+pqv5e5cYijfSC9BhQ1FBtGahfWugvx82VB4Ar8qD4es3yhuDQ0/ZAE6Xg6r2Aq3iugDDY1cJSDFyGVBvIp768XMMlCgecPXADY/DAwgigvItCrUGOSdLAMG188LiBW8PaVnZVsPjbyi+Xh8Wimch6N4Z2Ix4PWqi3moBrO5/k9fxPyd4CI1lV1fipejNnJZSTBFabNK1HPWKj96Oz+a+2fx2ukbFEElDqIKbFQ04vT4jbZ88SnC1f0Rk30csbfplFQUucyitv43+kUFGh/6rDN7CyiloZCaYAVYbSvymsgiVAftYvf03LeV0ihZvwpmq7YjWjOYe/9JNKeWlxBsuomQyb4BHwbT2C3l35wkvIozCWHGEzHhqh7FlWc3zrARp5X2dxxzUHF4JS776o9olZb146CEUz/ZWkL/okLNTQhfqp3458gdjRWYe0nOETNO9uflH+g1ydlG8oYsQVhWRTkmPNemSgV0attD1c1mzQnDlZpoTAR2SXGm24WPZyGHPkdkkGhWGJKtkKpssyW8K0nikQOPE1StA5wRRoJK8gq5LESpnJ41bKc8WDKPsi2DxMrEJzTvKlj15Xc87u3SRhLlWhXGL16iGsnP4XOTIgTDjrsNq2NjE4Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4903.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Za1pu1R9B+Fo32OncbVjq6baODv9KnvowfKXDowW/+55KvdruzPF1kpGCEi3?=
 =?us-ascii?Q?9YSbCOJUgOrZg9wdciLGexsqxvfnGgUCS6laTfP/v4E1s5LxU3BA4i4Xg0GW?=
 =?us-ascii?Q?4MxxsmaxKIn1DxGkNoPzJ9sBEKsbdA2lwDuuOaus/XmmrP06W0xPqmq1AxXy?=
 =?us-ascii?Q?xQ60Ci4YrwsPhIvswDptyOSd8On6mQ5h96nV+JcAgxp/9oX1Mt/6sOePzVoc?=
 =?us-ascii?Q?d3VzI4Qz9k6XAVzofd/I5IoYMIGmCG8kmw/sKZ/H/Ur0//pSdzFF86lrA7me?=
 =?us-ascii?Q?bTSOtxjoKAZEl8YOOPsPk2TM985hddytQNTo1JxJYHwEZaDwERyml9QMzto8?=
 =?us-ascii?Q?kRiJxsrWcM1GkXEF4Omz4F3hYcj7ZQSNFS0rvUgCYy72NDLOwuNUDBeI7xyP?=
 =?us-ascii?Q?/U6eNXE9PPwCscshyA56nQSMiPqVxy7eP9eiR1KwEzJp2saX39RGJ3NCiHbQ?=
 =?us-ascii?Q?g23Eg06lMIzGjkn0oTxY8TTpbi6RpGHl+lz5hYM/zQPqwUHBzk2FbzPgwILU?=
 =?us-ascii?Q?STqe8ZqPJYwDzzBjXdWQR2Q9eU/M6gISsZYUkibxYXsaL3a+sJRu3BlUHYfJ?=
 =?us-ascii?Q?kvQusD/KOVDNq0ae7v2nj9dLOk3PeMwitSfB6xJuDz/ABe0hJOY17np4PQwK?=
 =?us-ascii?Q?767sF+bYZl714RGAHrjz2XGdc13UJuJhBgjNRPr3LrvMgOFDfOZV6jTRL6FX?=
 =?us-ascii?Q?q9QfVYfrGCvTIUalCKgcu+76rwLsbqU5HJfebjilPO499M7pwbl98A+mDuWE?=
 =?us-ascii?Q?vIescMkFWSAU4zBL3sthqHHKbGl6iF3gQilUkhR7AASAtMqJ7E0dj7LmSNfs?=
 =?us-ascii?Q?bnpMKBKAvQkX0Ho3/28FmiNYpFaA9rqsXdhLqHmVNuDLs4zzzcN5naukbFhs?=
 =?us-ascii?Q?gfH2K0+Vf10qeSSuKubk2UVnlASGo7a66wMlLEltdQfv3ppu6BoDlFIJNVVk?=
 =?us-ascii?Q?qLsBpaQLIuam98vqhokPNfn29Gh2cZYK5WtOuChpJPeNc/2pg5IuyIFnHVZF?=
 =?us-ascii?Q?30pBdtV8UyoELIv5xeevruCooFwsyMlI7ZPan16WTKRBFXRQ2ydgu6gigUnR?=
 =?us-ascii?Q?HXuvAmcOh86IFIgfaAzL1/o/DqnxCoYMt9O/yt8JxyVrra5tn/h4SH+RHVaZ?=
 =?us-ascii?Q?gidAnt0Xp5QrMtactBkIZ2yqtsmJznbLVtwPBIQCb4vNwDNROhqbiA0HZciU?=
 =?us-ascii?Q?7+X0KZhuC42Yzpg6TFJ2JiLALlxeINrGiAyqwyVW/qz6Dj2EIaSfm9R+7/sF?=
 =?us-ascii?Q?e8Hza2cUv5gv0jXWyOkIlQHsxCbOVTg3NGbLUu8fcloInPLtyUUXG5VNkbZv?=
 =?us-ascii?Q?UcV6y4dm1vIatLWSTdIOtwDXMdMbRoRiJH5jRfMwzXcvaZgdfEtC9O5M237+?=
 =?us-ascii?Q?/B90jHV6cp4ZsvXrSTVV8VrmUrflg0fE+A5edGRAlYCHDBKp/BHwEpVVBJMr?=
 =?us-ascii?Q?swi0iAvSfoDfMyNHhQtZAbOQ/wed7wfFn6q3Gv9Hc4HP93BcoMS3W0BbIIdw?=
 =?us-ascii?Q?TFjbIS+TyKkfz86PC9PkYIMoNYit2ioDWf3wsAvKUKfVTv+eFSygAtYkkyw4?=
 =?us-ascii?Q?vQ5xGl+tNjwL+DMSPr1ARXBP9oj0VijI2F1RFccM+AcIHWQd+euGFtMnI9tV?=
 =?us-ascii?Q?HrFzU0mVFzbuykk4mpk/8I+VPfoN+uUJPHNOAIAkVWB8jdaQCRaUyR4A/j7E?=
 =?us-ascii?Q?+NLduroveQx4OUFLo1zMdEHpjeucPcB34tYK6AbAwxmhNnwm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4903.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5190fc-7a59-49ce-9a8b-08de7d8263c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 02:20:10.6307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2OxJRE1k4I6hYffxAWNRX610nfyqaGxbCNvi4UvqnAmsYyG+VxFQWSc9x8pQa/cgYHaHXsEnVtfAji4Bz9umTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10740


-----Original Message-----
From: Rob Herring (Arm) <robh@kernel.org>=20
Sent: Saturday, March 7, 2026 4:31 AM
To: Forrest Shi <xuelin.shi@nxp.com>; Peng Fan (OSS) <peng.fan@oss.nxp.com>=
; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.o=
rg>; Frank Li <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Pe=
ngutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmai=
l.com>
Cc: Peter Robinson <pbrobinson@gmail.com>; devicetree@vger.kernel.org; imx@=
lists.linux.dev; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.ke=
rnel.org
Subject: [EXT] [PATCH v2] arm64: dts: freescale: imx93: Add Ethos-U65 NPU a=
nd SRAM nodes

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


i.MX93 contains an Arm Ethos-U65 NPU. The NPU uses the internal SRAM for te=
mporary buffers. The SRAM is larger than 96KB, but that is all that is avai=
lable to non-secure world.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
 - Increase the APB freq to 133MHz
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts=
/freescale/imx93.dtsi
index 7b27012dfcb5..95cc60158349 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -43,6 +43,29 @@ map0 {
                        };
                };
        };
+
+       sram: sram@20480000 {
+               compatible =3D "mmio-sram";
+               reg =3D <0x0 0x20480000 0x0 0x18000>;
[Forrest Shi]  should it be 0x60000, 384KB? From NXP imx93 reference manual=
, there is one dedicated OCRAM for ethosu usage.
                       And this area is managed and accessed only by ethosu=
 via command stream.
+               #address-cells =3D <1>;
+               #size-cells =3D <1>;
+               ranges =3D <0x0 0x0 0x20480000 0x18000>;
[Forrest Shi]  same as above, 384KB?
+       };
+
+       soc@0 {
+               npu@4a900000 {
+                       compatible =3D "fsl,imx93-npu", "arm,ethos-u65";
+                       reg =3D <0x4a900000 0x1000>;
+                       interrupts =3D <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+                       power-domains =3D <&mlmix>;
+                       clocks =3D <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_ML_=
APB>;
+                       clock-names =3D "core", "apb";
+                       sram =3D <&sram>;
+                       assigned-clocks =3D <&clk IMX93_CLK_ML>, <&clk IMX9=
3_CLK_ML_APB>;
+                       assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_=
PFD1>, <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+                       assigned-clock-rates =3D <800000000>, <133000000>;
+               };
+       };
 };

 &aips1 {
--
2.51.0

