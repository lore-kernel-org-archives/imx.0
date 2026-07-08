Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868223A2576
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 19:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538800; cv=fail; b=XAhsW49rP671bKm5cf492cWl4LZkKS6JqSy3t3RUBVtmKQaMGY8AVhRqSUskrCsA2u/QiJE7IL6h4uKYDs2/yAIDaNdxHLz54o4GPj2kj7T9dvpI1/rpRY2HiQwb31mRMzbB98lCf65f4a8VK4MY0aRPZOhh6eIYY7ZcVjsTkPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538800; c=relaxed/simple;
	bh=oAwTfyuyTks8EjlMioh9EGBvJdYNOUd//xkEOWoI0LQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZgCcS3pvn/VWxLNxYa0rZ3cZ9d7jTbfb0kTmiCSqQlxBceOja1n6h/aE17wlm7yiscxFDNK9Mri54e/WEoeyAmI+R2gx7M+ivQEO1l+ocvUWON2P67/wZyluzSlezxLJyVvUmNy72EmLRzelmPqQKoyo9MeCQvf9VI/owN2wO1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Psw6JUkh; arc=fail smtp.client-ip=40.107.130.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Psw6JUkh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EONpEZIGX3Djx14s9DQoKm7l/UUXh5+v09YOefN3FVlI+2RPzp+6tdmz/0vHG065BWOAqEGrqYEmSTfZ/MvRoV9hL4cBeLRDmYRDH/JyYRt/KXNyRuB9y5GmkdmWEV1jEDJew93QmkS4aqk+RTralPjL7VHS3t7uJiPnl3AZfN9k2m73Hl/S1JCfA8vEeP+io8bs52cyDUBCsiy2eF0xL03qcmujCQuSUR+5FfeUAmcA1/cPMRmHXS68GQVTb/bgLvTQMECif/p3aicrV7IwbJsscR/kgUfQuJdKKb82RKf0abo50PgKOzSoNYjY2pFlVQyN51+IRmeE0FtbF7FstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKa9mAf4TvTLouNZwSfDyJYCIonrkRuyI4C0C18Cmjo=;
 b=qEVkbYYB9LxWxcE1FBCYT6bpzFjKRk06lcvrVO8FQ6FnwzM5ZHwkLrAevMYYAeLH9XVFl9nm+pV69vZPvvvnZQbOwFm/AMuu7nY+SwIzBXqkCTkwFJyYts9NhiKmz/xAe/r9iMR11ICGShxdbfOL8Wj9U9q/m2qfF56jbyJOnv62KCLnnKBYUcEJprIU9zQYU+tyD0V+66z1ul2ZF6Mosw49mWH8DR1A/P6ncs3CaV9gAe12tZ2wSxEy91t3Zr05MwCbBZJrbrUJe9eSIGvzQGHaPsh2MeN0QKCjTNN/yH/JylqFeuzwZAZLL+Xex77dR6efVBrm+XeNg4Mvu0DvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKa9mAf4TvTLouNZwSfDyJYCIonrkRuyI4C0C18Cmjo=;
 b=Psw6JUkhZbYv8n/v60NEpiucYzXVY+cce7fcy7MNke9YzJJ0GKOfd6uA1I/Gy1A4wldqoGZV9r+myCDVtvZcu0XEUSWSDkYsmWGmuapkY6/33+cpXlQKlOBaJaFCzhSGBcs0lTgkZ8Y/5vI3nlpbzH5cIoGSJOsz1xPmBmNdsA5WsV3xXGW/3cznQi7Q/GL9vUefNOJ7iINvy+xe8Oncd2wq0ZYUU+Xfj4v9i0d26upv7Dc5UvnCjEcx34wlRW3I41sRUY49naiJJIXheul1+dypkO8ss06cWol4iDpw06u6xJ4OkCGFc3CPmwnooLl6vMc8MS9FlhCvooUZOyW/pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12342.eurprd04.prod.outlook.com (2603:10a6:150:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 19:26:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 19:26:35 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 15:26:11 -0400
Subject: [PATCH 3/5] ARM: dts: ls1021a-moxa-uc-8410a: use compatible string
 ethernet-phy-ieee802.3-c22
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls-dts-warning-v1-3-5daa24061c31@nxp.com>
References: <20260708-ls-dts-warning-v1-0-5daa24061c31@nxp.com>
In-Reply-To: <20260708-ls-dts-warning-v1-0-5daa24061c31@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ioana.ciornei@nxp.com, vladimir.oltean@nxp.com, SZ Lin <sz.lin@moxa.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783538774; l=1927;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=mbI3CZQ5LqAg5+AHMpbztWTnjHmi8fmGlEv491ztG84=;
 b=MKMczJjAHXLKJnk4d2/R5F09D2MCINj/4X+bQjk+oRzECI2qJK9RTWzw2Z2buTGkE1XSzrunN
 uVulpB9d1nLBH112DlAzEH5sfk3KVRSCksqhhx+0mrYr5HaM3NLbMCG
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12342:EE_
X-MS-Office365-Filtering-Correlation-Id: e92f6536-c949-48f4-fbad-08dedd26d319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|366016|23010399003|1800799024|18002099003|11063799006|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	aio7lh48S81z/QiWDXsZc7kdpfke+vmM0c9uBuZDpWHdco9faHpJGGa6QiuDHQKvAIDikG9v5HKA1PMTf+mALfU6ewzcA2Ec+CZpAkx9TegPvqt8Ydf0worGAmc3p7zFdU7vgSaSOgBPCoE6UZrVlctPmF8+JJD0Sh4CAZQpZDLjN2yiGtCtKBu8c+G6Hvt/fnE+oKGoY3adJB4SFkeQaz5G6zO0Qscq/thSde4zcvNxrmG400rJHt0MfWoauKbKc6jCF5sPeYI+fsad/ZTYqgXD97UmHo9+sH9C6yr6ySbGlWCXQpUwQLDADSBQzfFR7Ww8ylvGup13X1t3FzrWXkbMfW9lK9mmASJ+lxrRE3qPT1lrOA8ULqaZUUOTjHiz27rld+ZMwvLB5Zz+VBe1Xx0xNS63ei7Oqv9P2aL7JDNgHPP3oB5H4/rKVv703iaLcQJ4v85NE6H60Kmmhz8VgkVOVVuB6o1UfvkcHH3RQbCuI9Roc1fK2zd8mhaiJG/A8t74jRy19OCqIPeiaK2WEnR4CH+ff9QUDUMXu3RT5bmUaCQ4oD+kGQvCFljCGlXq72erxapbZxmAK2/xYfxyo3fjU7H+ZTrzcVO/t/OXYn+SFIb2IWndksCbxHIyh7bTiTmK6EXe5ayXxdsN4QQ6CBX0mPHMtEc1GKIEGBOrAyE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(366016)(23010399003)(1800799024)(18002099003)(11063799006)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFhZV2dGOWxhVGhjYkcxMnBtc3huUjRFV0FFLzhyMTR6aW5DM2x4eWdnbnZI?=
 =?utf-8?B?UlhZK3NtNjJ2VGYrODMyTUdMYmpoQVZXcHpWRk4raitXVWhDVm8yT0NwL2ZI?=
 =?utf-8?B?V2R3eEF4YnA4SmZqQXJhWk13UXhPUkVRUHYvdVNNd2lTZlYrNXYvTElFbnZY?=
 =?utf-8?B?end0bmhSNTZnNHZXYTZheFRuZldkRW1iMkNxME8vUkh5cXN6c2FsNTg4U1h2?=
 =?utf-8?B?NFptOHo2QWw4RDNicjY0MjNmRWJyWUpEY1F6WERVcERDZUM4aVpDRHlZWkkr?=
 =?utf-8?B?WlBqMFU5UGtKeGVBeVdUYTVhdEpLekFiVE9wSFk5ZDJaZlBuL3JvTU0rOEFq?=
 =?utf-8?B?VVd2a0Vmbm1XSy95TEN3STRkNkhWSGZFeXF1Q3dzQ2o3ZHMzNW02RDNQcjdw?=
 =?utf-8?B?UDVFSnJOUGIyaC9MRFJvMkFJOUQveHlXSXErcWw3M0hKMkhQbmFublhxbnNw?=
 =?utf-8?B?bm00bVp0dStObTMrUTY5ZENoY2JNUDJseThIQnNyZTlTOGs4UkVqdVJTVVZ4?=
 =?utf-8?B?SHNaam1QaWFUZ3BTWXJkN295Zlh2WGF6dURuQ251ZzJ3S0poV3lTTDMwbi8x?=
 =?utf-8?B?K256aEIzNXFRL1Y5b1JhT1dmamhCb2Z4K1dKbys2Q1JRRFBLcXYydEpTdThT?=
 =?utf-8?B?Y3dmS0hiRzRjdFJ6RGxPSmRZTC9VRWxBL1JBbDdCa2lvZnlrcUxCdFVSS2RK?=
 =?utf-8?B?OVpyN1hFYTZsUzROS1hybUp2OGN0Q2lsTjgvN3pmL0FqZVZPVHJQWGI3c2xQ?=
 =?utf-8?B?UERXOGN0UXFqNkFoNWpXS3d3YzB5WTVnQlZqN2tJZE1JOEo0QkhJazlkcW5S?=
 =?utf-8?B?N0pyUDRwaDlKNnErVnVsRnN6aHpVZkJFMzVSSXAwMnNLNm81UTZGaGg2T3pL?=
 =?utf-8?B?blNSMFl4elFiV1J1ZmswdCtrUmNKc0N0N0R2U3lUNlc4ejNXRFRoemJTcUpy?=
 =?utf-8?B?SFpFQ0JpSWhMNWQ0S2h4dTNrOWphZkdhemQ1U1VSaU9lZWdaelFIMDBVSHJz?=
 =?utf-8?B?b2ZudmNZcGRlKzN6UTEyTTFHS0VKS0IwaFV3Q1FOZFF6L3VWY1l2bW1CR0E5?=
 =?utf-8?B?S3FQeXZIaWc4Z2JzOEdRTE5NVTdtOS9VZmZpb3RnZ05oK1VzYks3MTJldGUz?=
 =?utf-8?B?REprODNUOXV6K1E0V2UyamY2T1J5MUJOR1MvZlNaYkFWQTVCTzl3NzV6cVhn?=
 =?utf-8?B?MFRLdkQwVUZybitCUGpidS8xMnNDUkJkRjZFWkNmSExvclBzMmFBWUpXSGJj?=
 =?utf-8?B?dSsxOStaeEFQUUh3bXQ1RkhkenV0alV0Qm84dmRZUmZ6aEZrdk0zT21PWlhQ?=
 =?utf-8?B?MXY0TmYwZnpaK041VjJkS0wyR2dlSndncG5PT0NFZUxYRnp3bkJtQUViSlkv?=
 =?utf-8?B?QllhU3FibDZQanBuYXZYM2o5YTdmSEFuL1k2cVh1Qm1neVdyVUpNNG9VNDdX?=
 =?utf-8?B?Y1lyYy9ucmtFa1NuYXFYczhiK2RPVWxNWUhuVWlBeFY3NUFHOVppWWp3dlAy?=
 =?utf-8?B?cUJMcXAyc2NySEZFcVc4dVI4cTZhVDJNN2FGUVFyM2c1YzZOOVBFcnRDSDds?=
 =?utf-8?B?TUhlZWhoL0QxcktTbjBhajNVMUlWbmQzSzVQYjBnbFJGQ0JiajVGNEFOYzBr?=
 =?utf-8?B?VTZkU3ovUW1PUkthR21JSFZ2UWNTcHM4enR1VWNlTUdCcXFLUlVSKzg3Rk1I?=
 =?utf-8?B?MTFjdTd6c2puRjczcnpMUitFRUxWS0w4WHJrY0V4UWx5VWJncktxYW5lQndV?=
 =?utf-8?B?Z3hjeHlyYkczcmh2OC9sQjRiTzhEeFBsbTd6cWhlYXNZSjNzOHBxM1REVE5F?=
 =?utf-8?B?Ylp3VXZ5TTJXbktxb1ZSNC91cDJ1Z2ZGSFNENlJNZ0V6SWxEOUt2YU9SSGxa?=
 =?utf-8?B?MFh6Y3FkU3lGSWZPWlhGOWZXdzJsb2k2bzVMYjJtczBNWi9BV09KMUtpUDA0?=
 =?utf-8?B?bldxTDFaT05vNmpWZzZhUlVINExwQ1N0RnNjNGZiMktuUXFVNnZTNi9QK3NM?=
 =?utf-8?B?ZXpjZDhORjBwQkhTcmdpYjdGQWx5Q2hPem5EdUQxTDVpbTd6NEp5Vm11L3Er?=
 =?utf-8?B?Y1ZoMGlUbkZwdDYyNWYrRkMzcTMwanZvMkNTcFo3c1VnSmdmeEEzQmNKRFdh?=
 =?utf-8?B?TlFIVTZxaDJocmJtTjFGZEUwcy92eFJ2OU1PQ0VYeWw2c05KaTRSZTVUaE1J?=
 =?utf-8?B?MlVLR3F2emliL3p3dy9EaUNvOG1CbXdUV2ROcyt3dzJEbTJ0MHFLVDl3U2Ex?=
 =?utf-8?B?NW40TmdrNlh6V2R1cEltK2V3SGVuVm1uQUdadjY0MnFycklrRDRRVjJYeDBI?=
 =?utf-8?B?cy95aVRhSjU0UElOQjZnQmlGVW1DajUzeGNrRVBnVDI0VjlYZDR5NjZrazFT?=
 =?utf-8?Q?WHcqKELYpKEadndd/C/wPqCnsbWaz/FShXXWm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92f6536-c949-48f4-fbad-08dedd26d319
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:26:35.6377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaNSiPtVQ/i6ivFaFyNbLEgONJgMSk0ZB2IrC2o9Gr0l2YfwA7JRr/kTlHr2Vur/VBpRUcvFgvXiQp+3vxg1wrZG1AlCIzrkfpoUK4SdCntB7oUc26i+X4ddRrLeFYVz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12342

From: Frank Li <Frank.Li@nxp.com>

Replace marvell,88e1118 with ethernet-phy-ieee802.3-c22.

In drivers/net/mdio/of_mdio.c
/* The following is a list of PHY compatible strings which appear in
 * some DTBs. The compatible string is never matched against a PHY
 * driver, so is pointless. We only expect devices which are not PHYs
 * to have a compatible string, so they can be matched to an MDIO
 * driver.  Encourage users to upgrade their DT blobs to remove these.
 */
static const struct of_device_id whitelist_phys[]

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/mdio@2d24000/ethernet-phy@0: failed to match any schema with compatible: ['marvell,88e1118']

No other known DTB user this dts file.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
index 8efe6b615ca85..5b652a45bb9a4 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
@@ -176,7 +176,7 @@ &lpuart0 {
 
 &mdio0 {
 	rgmii_phy0: ethernet-phy@0 {
-		compatible = "marvell,88e1118";
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x0>;
 		marvell,reg-init =
 			<3 0x11 0 0x4415>, /* Reg 3,17 */
@@ -184,7 +184,7 @@ rgmii_phy0: ethernet-phy@0 {
 	};
 
 	rgmii_phy1: ethernet-phy@1 {
-		compatible = "marvell,88e1118";
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x1>;
 		marvell,reg-init =
 			<3 0x11 0 0x4415>, /* Reg 3,17 */
@@ -192,7 +192,7 @@ rgmii_phy1: ethernet-phy@1 {
 	};
 
 	rgmii_phy2: ethernet-phy@2 {
-		compatible = "marvell,88e1118";
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x2>;
 		marvell,reg-init =
 			<3 0x11 0 0x4415>, /* Reg 3,17 */

-- 
2.43.0

