Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616B3F54C2
	for <imx@lists.linux.dev>; Thu, 21 May 2026 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779390963; cv=fail; b=SG6X/9rx5sSCh4nAIjuFwqD2+plVnqCJ6kRBNvugyBZQbKR43AmmsIblgo+s+np35wriZbHORx4WMmNxgUsw0zJxmiG0uF73ZUG85b94V0PjfrgtO4SEtlSk7u3FZvTY8NTFrru4s7GRqx4jmQsjlRYvGxrD+/0Uu07PGNzOvJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779390963; c=relaxed/simple;
	bh=CBEnntAPdIMLploixS2+lpc0bmCLU0s8Pfkm//x+N78=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=g8Fyw7gXX/bVlp04z5tN+PO4KuVhqIwSs/3LbjNlAeZwimUsAXS43GwVdRbLKZgBhC3yb6tbHD1vjy7cGD91l3Njlwj0gwV2rKomj2B6nZ58bNkE1yyj6TlBwdYIH445JHUfnj7iVc9IOmDveeIlz6EjiVtqlC+qJO/C9w8c7DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qROX2v0L; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qROX2v0L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSOEwcw2/o9VKekOxs4QqLOW4E9g9D7oN/dwrAUw78ynGibTkVowpsk37riCDJcW0flO+/QG9YNqTB9QE/dlqzk9dvfXmsqHiW4pj+EIPqP/0W5yllWAJq4vOPOcinv3ctlKrzxe+FpDbga/lsuq0UkkHfEuc6+fPMoIctoadFmsx64ai7VZiH1nnYcDe3Sd65PTWcX0NWXoQ3sMjg32ux25hWkSvrzf94KQdAavaVwTb2dBWU9hSE6FD4kuU3exSI6tXkGEihyWIGPAdPwfNy7fDhk1RjA2RqCEQ+FzAgxEu4MWB2qP2Hgno5WFlW9VbehoLR5v3Zaa/SlTiM6Tmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+cH5oBYGATjnZaa04J2VhWAiNIlrh58OzU3zV70StI=;
 b=OFFDwYSgmDD1BAZWlbsT6pHg/DvkbEZ6Ed9zVn8vwwrpzmbEJFUoC4qKJa5CG4X1dYVHFOMErEN0tq/Ck4dWLp7QHUSXt7MtyIgvFiRAxWDicEyJhpVU20fLG5aBECmUIIICczCcKVHlkjRU4MDSNS6fKT3nWCFG/iCxAPFsnkPBSsQCN7iyREjCwvsK6qVJTGyj447vq3adhtXDwwdjiENOK6gtNGqpsK8S8/883crDPQ18krEMoWZjkwbgtEYJBii4SGv/AO54bwOdzGdnm58TZ5Zk/typpDVGtGH3jfZSbLEfRRhFdXPrd2QJ8PzLBniGDSYkVYczyIRytzRVEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+cH5oBYGATjnZaa04J2VhWAiNIlrh58OzU3zV70StI=;
 b=qROX2v0LK5/My2lHynAD/myr57V3/k0aaG6S4KB7ak/j+huWR6TYWPq+s4dPunfdp00L0uRKtp6tv0rJn8c8mGX7o2yIrnvMS1PiyGpPdvSv3453beavq8TasJUVpg3P+q2TQhlY7K6aC2HaZj1ZgQ9WvgJbKtEoiyGbNm7j2KFO8Iu2x76kAtAqiZblNcgeESL9rqXEMmFIdPxxEb2sqsiT/bay5KoLco1wf/X/mwMm03TcQbsiyyuob1/NEUp81nI/IEFm20ki37lzP7iDyxXWj4zKIlKdJ0eo4riz3zZrLBUTTKtf6LV7wrCX30c2GjPM8g3Nr/lsI6TnrFsf5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 19:15:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 19:15:55 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 21 May 2026 15:15:39 -0400
Subject: [PATCH v2 1/6] ARM: dts: imx: add (power|vdd)-supply for related
 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-imx25_dts_simple_warning_2-v2-1-c6557df516a9@nxp.com>
References: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
In-Reply-To: <20260521-imx25_dts_simple_warning_2-v2-0-c6557df516a9@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779390945; l=3158;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Fok0Smbontcbd61beBA1IUhskkUUFX5if8Q61QTAuOw=;
 b=6nK5D+s1rSYHs+30AgYddpLzIVSRWLCybI/HQGHelmOznIGj8JmcdmEQx5hagl54qXN9beXnJ
 1WdzO5BAjbjDCvqXtef1ogSW7ziZMTNEWZneuBdlaHOBGN9tqwSc4Ty
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:806:121::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: 2229b858-cea6-4ca5-b0c2-08deb76d61a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Xyi//KZYFyLVRF9hp7Ab08wNDoeGiOKZfluxccZA8J+DwCvNMM2y44tAo848L6xZO96NNwAnvrzs1bm7OOJYaS4PuPkinNleZiqGJvQWF61lJXteYH8tTs/OGr2PbcMeGHXmOnrkYwDU1gRCjMclwrx34JrxSKRF6YdeYPpEH+F8KSDXJux1rIlEaBCUQuRW4Cq5gigKeHUp97nfGMyCmQY6iGBVaveN7o3CnrsL7WMqtYW1Cwdk7ph3c+FTdLvym0vqckYf6WikhX0fBT4vtsuODkT0ZCwPEdjAMAmiH5th+G6Ir7T0TYI9VzbPIdx4fgacyrAyQPBO0O3GWGQOorhh0TLBedKT3dkeBupnMxW0Fc4p/esDFIkOa4djZ/t+MMMGj0wAmeiyqCrD8cPiImGh576H12adUR9RuB+SG/WRNeEQlyFqBhAeuujUzkFPv1yXqX4ooPO9lVeYXlPz7nz8vEs0YUEi5zRyrbdvHyyfAH0NGKqD/jlhOPj4lrhZ4n1l9/Z2NJfVShgvQl5G+6YdS6GFa7idJbFRet2TySMU4jpWdByC7orly3Q1SV04NFTCBSABa3xdEfwJ/2nhYYMPgwO7p3oS+FmlZXZyCw19Qdb9nqbsI/TEkbNacsbW+omJvxz+s1VQYFZhZHp35j2qHuMIGPlxA3/xV7toGlGUvh3EmsWCAnbmzo8DmFq0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0RXRWRaUEFQU2tuYTM3RDFrYXU4RjUzT2MwWTdyR3VUamhYcHpUNFZhRkkz?=
 =?utf-8?B?bGYrRlRBWmx5eHN1UktOTzB2UzJXb3ZtdUlVUWlTU1NHTkZrTFVJSkFVMFFB?=
 =?utf-8?B?YUxZQW9VZ3o3MmprN2N5SExGcmIrU3pOV09COXFGRy9HS2RpcXFjYm1GMzl3?=
 =?utf-8?B?MDlBVTJiVWdxQjZsU3NrQkFWaEd5RnFMWVliSWxLQlVLTU1HbGovQ2pHa1dC?=
 =?utf-8?B?TjVYSy9SalFOZjZ0ZEtxMnNoRHRNRWZJY0FVd1UrZ0pad0ZoaktibHprTTNN?=
 =?utf-8?B?N2Vra2dWUUgzVWJ4QWMrTXZUb3EyM3BxQmc5TVVrN3lWeE1maUpWNW01M3Mx?=
 =?utf-8?B?aDcyRTdubmlSSU9zaTNFenp5MzVnSVNrVTd6N3VnSkdGS0ZMMkR0WjRXWWh5?=
 =?utf-8?B?ek9aa0E1OWhYMTJxSWpYZmZJUGQrbit4Z2p2aEY2M0xHeWdiUzMvUXErZUYy?=
 =?utf-8?B?UE03Uitpc2JxSnRLSmJDcE9vL1lCWDdKRzNuVlRFTm8rTzgybm5MdiswU09U?=
 =?utf-8?B?Q25MWGcyK3oyNDB2VTlSWU9qanoxMzg0K0tuQ09FWU1Ub2Zzcjl4NitBRHE5?=
 =?utf-8?B?VW9XbWMrbzljYUo5N2F3MWFBZlJFaHV0dWYwTUZIVVh3N0Q0U25MWTMvVFda?=
 =?utf-8?B?MzZEZHl3QlNudlpMbkR4b29vYWFoOENPQlpHd1JEdW4wckwvbmFzMlc2ellu?=
 =?utf-8?B?d0dHTmZERDlKdWs5SkorR3VwS0g4QkVFTUVvVEpVazBKejZEdi95cnFiTFhh?=
 =?utf-8?B?RTBkU3pzaVhXZWYxeGg2R1kwMFVhTTF2KzMrdmx1U0FiWGkrRHZuQmZ5bDJY?=
 =?utf-8?B?cVhKL2JaTHJCN3Y4N3dLTHJ4S3htcVF0V0Nlbm1CNnF1dXNMSjVmMllkdTgy?=
 =?utf-8?B?S2dXaGVDUkIvTGp1RWFDeXhlN0x0cXB0cWhZUDQxZXhMTjhmUmJ3YnZLMDhC?=
 =?utf-8?B?WUlOYVJyWDdvcCsza1BUZGxuYTJLdEl4NmhldkI2Q0liTTZZYjJxVmt4VG40?=
 =?utf-8?B?SUhoeWFQcjV1SktVU2lEdHIzdXdYbDV4WW1QS2xMOTVycm0vMEdGMjZNcmw1?=
 =?utf-8?B?QnBIdE03WER2aDVQbis0bXRuaXFRY2crK1RPZlhoYlpvQ00rSnFmZnoyOFJT?=
 =?utf-8?B?Y0cxcVpQZ0Rya0pZSzEvOWFJOXQ4cEErSmRDN096ZExFcVVEVzZLaHByNjJy?=
 =?utf-8?B?ek1tSFZVODdCRitvRE1xKzgrODFCdHJvS0IvdEdZN3V4UVFvb2tPa1Q3VGdR?=
 =?utf-8?B?Ti9RUXR4RVlwamlGY2MzQmZzRDdVcnk5Ri8xMjlQUDBSajdMWFd6QkRVY1Vu?=
 =?utf-8?B?U1ZydU56R1FjaEgrYjVOWXFNSGUwSVBSUjlyOXBBZ2t5U0dXT0VNK1ZVQ0F1?=
 =?utf-8?B?SWhaOW0zZ0puMWZmYTlZYlk2bURvYlBXZmQ5aDdxeUd1S1FjZHljdVpnNUZX?=
 =?utf-8?B?NHQvRElCeC93UU5obm40TXphR2hoZ3d4N1NQUFY2T25uM0p6Y3BadGJ1S0o5?=
 =?utf-8?B?MXAyNXpYUytYeURNOEhJblJOOUxjb2xETXFpS1ltVTh1djhVWUh6RWlJZnpj?=
 =?utf-8?B?N3lYNkhSaDZaWWFJcFF3UUxKb2VJR090czUzdWJZZGRsQ0lqVFgzVzgydFQy?=
 =?utf-8?B?b2FESDFnOW9aamhtcDZCZWRaeUwrdjZZaVVaUHBUU2xneVNsTTAveEczWmQv?=
 =?utf-8?B?anNLajMyTDJPcE9SdXV2QTBJaVVUbzMxbEtWSDBIdWg5MUYwZTNXRXdlbFVu?=
 =?utf-8?B?Z1RXMEhLb0xIemtkVW4vd1pOUWlOYk1HVm16SlY4WXZPUklLeEpPVzVEK3BM?=
 =?utf-8?B?V1VteFR6OW5KRTlkYTZPWTdPWmp0MFdnQkJwTWVnQzFEZVFwSWpOTDB6NHpP?=
 =?utf-8?B?L3hkSmZHdUUvaDdlbEdrSzFsNnQwbm1vWVdMc0hxNHNidUVnbDkxQW5Vd3VT?=
 =?utf-8?B?N3ZQYytOcjM0em4rRGNmZVNYWHRBV1BtK1NNaGtEaWZJR010OVcvdmJjNERo?=
 =?utf-8?B?S2VEN0xRK290R1pnV2w0TE5EZG5sKzhSSmM2ZGlkTlN4Vnk4VG1Ebm1JeGFx?=
 =?utf-8?B?TmNwSmFETFN5TUU2NVRteXM2cGJuRExnMUFDMTkrWVAvUklCYmQycHdEa3lQ?=
 =?utf-8?B?SmJuOTRQUHFkMk93WWVRbEhQTnVxRmJROGx5WVkvbTNmdk1FVjJHaTM4TlhC?=
 =?utf-8?B?OVVTZXhKaVVSYVdLWUZTM0gwMDVHemtZdlcxcXRjbGVvbmRRdkhyTzV6WTda?=
 =?utf-8?B?Nk9ZZzNzTDIyS3U0OUtrMFFERWhxM0k0TzNwZjZsNUp2YTZoQnJRb2xUTlFH?=
 =?utf-8?B?azlwVkp5K2JJN3I2Y3dzaFhjb1ZvUTJIbTcwNWY3Z0tUZHNKVURrSFRpL2R6?=
 =?utf-8?Q?4+mdxmTtrrvLSmkA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2229b858-cea6-4ca5-b0c2-08deb76d61a2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 19:15:55.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+gDHzbYV3N86yLi02NNfKqiO0KsV66SFcDCcx0kw9+q0DwxX6PmaBKisa9NyaWb4tIJbTkVKyeLGdZA7PYJUGW7FcXvM82YImC4EO7NYHBAkrOwhP+qwdDzWgF3RIEb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261

From: Frank Li <Frank.Li@nxp.com>

Add required power-supply and vdd-supply properties to fix below CHECK_DTB
warnings:
    arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dtb: panel (edt,etm0700g0dh6): 'power-supply' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- change regulator name to 5v (sashika AI)
---
 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts            | 9 +++++++++
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi | 1 +
 arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts            | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts              | 1 +
 4 files changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
index 6210673f93bea..2acbc86cabb31 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts
@@ -84,6 +84,7 @@ panel {
 		pinctrl-0 = <&pinctrl_display_gpio>;
 		pinctrl-names = "default";
 		enable-gpios = <&gpio6 0 GPIO_ACTIVE_HIGH>;
+		power-supply = <&reg_3p2v>;
 
 		port {
 			panel_in: endpoint {
@@ -98,6 +99,13 @@ beeper {
 		gpios = <&gpio6 3 GPIO_ACTIVE_HIGH>;
 	};
 
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	reg_usbh1_vbus: regulator-usbh1-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "vbus";
@@ -259,6 +267,7 @@ eeprom@50 {
 	dac@60 {
 		compatible = "microchip,mcp4725";
 		reg = <0x60>;
+		vdd-supply = <&reg_3v3>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
index e395004e80e6d..34cb0c344ff6e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53-atm0700d4.dtsi
@@ -10,6 +10,7 @@
 / {
 	panel: panel-rgb {
 		compatible = "powertip,ph800480t013-idf02";
+		power-supply = <&reg_5v>;
 
 		port {
 			panel_rgb_in: endpoint {
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
index 1a00d290092ad..ebec884958776 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-sk-imx53.dts
@@ -29,6 +29,13 @@ memory@70000000 {
 		reg = <0x70000000 0x20000000>;
 	};
 
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
 	reg_usb1_vbus: regulator-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb_vbus";
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
index 24fc3ff1c70c2..cd9a050fa906e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-novena.dts
@@ -109,6 +109,7 @@ led-heartbeat {
 	panel: panel {
 		compatible = "innolux,n133hse-ea1";
 		backlight = <&backlight>;
+		power-supply = <&reg_lvds_lcd>;
 	};
 
 	reg_2p5v: regulator-2p5v {

-- 
2.43.0

