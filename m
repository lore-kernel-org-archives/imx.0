Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035A348CD79
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330323; cv=fail; b=p2sA6HaQMPg4NPAh1YjgsRHaTaSJn//39SLGLsijDaw+kssTP+IIHAbwvh5GA2p4Y9zUyvy9FgbpL+N50HrOwFucjyX7UkZ3fADiedNhzcHIH0H3EMJiT6f7QEUJPp/VAgbnNcDGfnH5l6/QLpn2JsjNDFTsmfJ/BNXy6vEd2y0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330323; c=relaxed/simple;
	bh=WgAytdauipLwDap+CZCT4eufLF+5MvEKRSjO4dxJx+M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dk5C+puBIjstJ4eIUPlDawYWVvkWJ3p1Rv2u0SZtIKFw1WEP2z4fyN0kKTbnXunix7qiwCeyZQ3dsXeQ6qj652F/TscpYR1OOWVuo7ueFeWZrAt8etgGrx/A+sMbTV7vmmEk8tB8u9DDADaEEf9Q11RdcqkHeYgAMpVkpN8p4Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vmADVBtd; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vmADVBtd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0brUdzyeHNznf/KeQmUZW43iR9aW/Ypn9ZCGfENg6LWmq+a6TR+BC4Q8mJSZK3ULw9JM5BSNPmn7+YKDIAQafYc02kSIws+bivA/uNoOvv2WR5Sd7cZ4ENDzhiH8oc+mtwY9BycfbUP6LXz43j5juaXC7Ud8/WEiiWgG6dVhz0ftlu46UtiCC3nFVcSO3K2VdQWfekPUHJWC41rRJ0bIlswY/y11KjvzIfMg7i1ri2DXSwAVz0Jzhw/9VBbo+eluNIo2ReGy+6YD29LIjrHBP94akZDEgsnBugkfJEF8W5l9kIdcE/TF58K7/Km9UMvmoeBs0YVV9Q8Rtj309bmqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8YCoSe7optp2tkUTT/s72pW45T86ZGwKCgRV1GJUjw=;
 b=cYNF1CCvgA2noVvy1naQ+eyPCznElLecDU91pE5NZpHw95DQTasYqXrNzlJn0o2UdJqLS3mTzyhkgRwOEU//MJGUh1Is8zvbhjsZcgi0ook1wiJXKsVFRQjkhTnV33Eub6zUhMZxSf7bY7mEkX8l+SPqtiVK5wSoNU7gLAD6efWHQPYiX83NtnAQUaMQ6x6NtTtaqBMfyGXb/EUaAyy1LulbxTDTdNZApfjRQtENVro39o0pQ6Cd76tV9bNGO8a/87SLH8rxpIaBpspQXrnnRxQ/swMG79r0NK9Hzq83s4rp4mExV92nizjsiIK3azNq8qbOI/UipMqyLAi3zy9o3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8YCoSe7optp2tkUTT/s72pW45T86ZGwKCgRV1GJUjw=;
 b=vmADVBtdHH0lVNrK7LhxbYTk9nep5KbtANsekDzyp70q72DQyW6QLyXltrXuIcEGaCVFdllicHiCkIdjnj1Pfjj2HcQlc6UU9vU0TjKbcSg8e8EE4HoOs3ENcE28W+y3KKPPWO1KEjei1H/hMmT9dLqR2xVnx1Aac/b1y7bHjbvAWOdM71cxuKQ1aXHteDY29kptYqzWOu/I43O55RPsJRICg58ht5brs+R16kfW/b9kofQsyN9SggLWa/ILm0jB0cqsWin6gHKdKaqGo43LJm9d++NBn/URxg8zOwx5OSX7KBJmKqlPg/Mse+oKedNf9TThlfSRd8kRYgdEy/ftRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:05:18 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:05:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:08:07 +0800
Subject: [PATCH v2 11/12] arm64: dts: imx93-11x11-evk: fix reserved memory
 node names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-11-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
In-Reply-To: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b513322-3b30-400b-de34-08deed720a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+kJPtHTodPCsDqiN7TF+ihj69QU0eGYlaYNgBlljnXitGitNwxeySbgtrh55FtatTYbFc4uYCqmalx52oXmSx9SDo+uvSuf2PoeOUp449/5++WSvEiq146ES0r+HxlV+c83KEp4yoQvh2cqtpfToIZck3sp/k2Taz2olb8OQ/XKQya0zWKR0og1Y+tR+JtNtdfZAoC90UY7OrfaKxgduMsCzhTB81/QbQNa2u14dTwDI6H4YuZF5QhfXSex5k2Wh8d6P14DQ004I7obNYLYvJ0ZxgkW7b/7V+dmusk9zEXpz+3m8GFHpuLeEZgyDgpCeSmckwzMG4LOSFJ6vhlcGkKieZE2elvKfWJceuJYn72sTDe66q7VBZmD/IDQguPL+TT2opA+Mmm6OL5ez4eZDNrhEsVxn/LYiZEQKhqOladquRFihyPJ4ymNzuATODrWwDD75Uetjioo0hjQjtUuK2dzvlQdj/gXjVzdDtD5x3+gNRpFRwaDtOPW9G2eodNI3Y5flP1ON4itrR94xvBbrkibZFXAJhFiOYyaYQ/CWPds64RVE1WBnTx6fSZXeCJl11rmyVoX/hjW1mCmPklAGR1KQrivXCPhZYlXCSlky+nB+YK20r16B35+GK710Fi4FTRNdTnL+l06FE9COGhwdL8p0uGXArC0TrbbweMDZZ5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0FzZU1rZFQyTkJQN1I1eUtSUXhNbXlKWkUrMTFrV3BXMmd4WkkxK0FWOGJl?=
 =?utf-8?B?Z2sya0VrRkVLR3FVQ0JiOGY5bWVyZll1ZHhJYS9QZ3hUb21aSHQzRTRzZHo4?=
 =?utf-8?B?NFNDWUdvMnEwMGxaYlcyMVBqNlhsYmlNSkswNGNRdjcwS09CVGpZSVpWd21D?=
 =?utf-8?B?Yyt5UkVmY0lHRCszWTNmRk9Kemo4Wm5OcW9ldVZsaWFrQ0grQ2J1WG5kOVV5?=
 =?utf-8?B?TWJzT1pXVTlmSWJPK1ZTQXcxazZYRWZLS1dib3VCaWRXMkxlc2FPTWlFQ0xs?=
 =?utf-8?B?WGpDc0NDaklFUkRsdjNJZjJoYkozYjN5L0xybGZXZDRpK3Y3clR4T280ZVJ0?=
 =?utf-8?B?NVc0dVdpMSt3SU9TTUZuRjlsRDY4N1A1T0k0K2U4b1NwV1lmS29RcmVPOHdl?=
 =?utf-8?B?bzBoR01tajlDM2duQy90SXFWelVEclFiOGZyMEIzelAxYVFvSFM3S0tKQXpM?=
 =?utf-8?B?SnFRVTF2Y0ZOb2xiR2ZLVXR2NnUrWS9qd3dCNEFBOFRMUDNKTmFrclc1SVVR?=
 =?utf-8?B?YUkvWDI1MXVOWkx1RGo5enlSbFJsU2dic2VXVDhBaURxUm5LN3I3bVdhTkxF?=
 =?utf-8?B?bkdLWUNkT0dxYWYxL2lJNkM1VEpjdmhpeEpOZG9Kc1FBd2pSSlR1bnMya1dT?=
 =?utf-8?B?YmtYV3RRanNJVi9veE5MMVZZc3czWHJYWDZOc05vZlRjSFN5eXNEWW5memQw?=
 =?utf-8?B?OVJLajY3cDc0OWF1QThWUlhJUGNoUWdpY0ljdTdDVlJVSmhHbWkwZ04zcHNh?=
 =?utf-8?B?dGRzdkI4T29QdzZWRitxSUhEM1VHRWgwUVYxbnZUb0g1Vzhnbm1iZndqOUlT?=
 =?utf-8?B?Mm1vbkdLa1dFMjlrdVhtZVhqbkJLRTIwRkp2NnZITW9nZ01DNkFMaTg4MUJp?=
 =?utf-8?B?aVZwL1J5SDdBNnh6eDBpa3hWWXVwVnRHY3h5SDhhS09vK0E2T0RRS24zR2ZE?=
 =?utf-8?B?MmpCK28zbVBuVzMzZWQwbWRsQ2F5cmtqK01iaDB5dmlOSGY3WjVVNENVZ1dz?=
 =?utf-8?B?S2h3QUpKdGlyM2JpQ0NNNExMN0Z2ZXM3VTJMS2tUMTM1YUNMRXZYSnZ0UmU3?=
 =?utf-8?B?UjZUdkxDdjZRVEdVR1IyTjAzcjRUMmladjFodGNCOXNzNFJZNHhXc0ZZaXE4?=
 =?utf-8?B?Z3M5ejRKM3lHS2FYMTEyT1RybHA4czcyUi92bWliWEhPL1lzaEF0azhIQTdl?=
 =?utf-8?B?RnZZY2diaG1iWGlhQzRrTTNCN0ZrMThwUGZrUzNNTGJ0eDdhWDl5SlZldUty?=
 =?utf-8?B?UUFVemwvUll1NXF1c0NMeStzMHNaa09tT0FmaHNJUWVrMktXcXFndDlrQi9o?=
 =?utf-8?B?ZmlFNmM2WUV3a0s0OHNBY09mMDR6RGN5TkxOWjd1ekR6b0Q4VG80YVdIczM3?=
 =?utf-8?B?eUp3ZkFrNGhpY3RzRjU4RDhjcnkrWmJMVzdsV3hBcVVRY0dsQzgvOEdVVjhn?=
 =?utf-8?B?RHhtaitkUjBiM0MxaGVXUllONUVuTFFpZW94MU8zKzBKRFdSeUJwUkdhdkph?=
 =?utf-8?B?S1RQMG5BVGFESVlRWTdsVXUxOFJRMUF6dTljZCtoNS9UWXY5eFpGaXVDQnFB?=
 =?utf-8?B?NzJMQUNlZ2Jxdm83UmQyUDZ5cWVDc24wbFlxb28vV0sxQlR5OFdKcW5Jc2to?=
 =?utf-8?B?MlpIYW1aVnRQV01GUWV3dmV4NHJwMlpZLzBBdWYzbExtV2paWTcyRHo5bDl0?=
 =?utf-8?B?T2VLMjFGem9BSEhoS2ZvU0l4WjNUb3g4ZG5mb0VYbERDUFNEcUNFL042K3Zx?=
 =?utf-8?B?aEhPVjNOT29QaGJlcWlhMkFwZ2JWR3Rlc0Y1TzhZcU1FTG5DZ1U0THI5UFQv?=
 =?utf-8?B?dERMOWluYnBRWU8vaExTK2ROQkUwekVsTVlzTURqVHRaNnh4NzZ6K0JiMWEz?=
 =?utf-8?B?VFZSVVBFbEhNNEYxdjlUOFd0K1V5NUxpeXIxeE5ZdVh6UmNWaStzTGhHNzdu?=
 =?utf-8?B?M25CWkRqSVF0V2xHcFVWcGZZWWhRckFhcE96eDVXRUZVWTlkYkFxbFA1TGR5?=
 =?utf-8?B?b1p3TWMxcnZTdlJGaE9kZXNsakVEdk13OC9WNGxpNVRTQ3VCeTlZTlZsdE52?=
 =?utf-8?B?b1d4VGNmeVJ5YzNCUThtNUJBWU1nN1I3OVFla1d3TTdVdFY0Vkg1cmNReHRr?=
 =?utf-8?B?c2Jzc3JGV1FTZnZ4eUl6R1VMcisra2UvNEI1cE43bXBLKzJBQzRWWFZicWhs?=
 =?utf-8?B?K29pamVFQ3dMNTRLNllxK0JVc0YrUzBpOVBJeVJuT0NUTGV2OUFTVXJnbms1?=
 =?utf-8?B?UGFGZG9Ib2RtZWY5NzNtblkzZjJzQ1VzVWJBeU9hOFZDb3lBMUwyT0U0Q1Rl?=
 =?utf-8?B?WEJlTmlHeDFFRzBLV1JkMGJXaXVvOUtNNXBUWTgzV01HL3YxYzVBWkY5REEz?=
 =?utf-8?Q?j/MAdzo/7xgB49VT8YGLUecDcZUYo5ufCZuqZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b513322-3b30-400b-de34-08deed720a3f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:05:18.8297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6t0hrQmnrXQTgaYHD+v7eVVCTC3Vhew0ExitHC6+vd7QXUeSq0jWU0nyMNrUjBmYZU7+q72PXYj4h7/ErdCUmOEcAAA+lb6PmpeGntptNdUhnrcfsU7uCYi9mZnHpbul
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: 3eb100e56195 ("arm64: dts: imx93: Extract common EVK description into shared dtsi")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
index f48e7947cf647..c57a2040b9c2f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
@@ -67,7 +67,7 @@ rsc_table: rsc-table@2021e000 {
 			no-map;
 		};
 
-		vdevbuffer: vdevbuffer@a4020000 {
+		vdev0buffer: vdev0buffer@a4020000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa4020000 0 0x100000>;
 			no-map;
@@ -170,7 +170,7 @@ &cm33 {
 	mboxes = <&mu1 0 1>,
 		 <&mu1 1 1>,
 		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 	status = "okay";
 };

-- 
2.34.1

