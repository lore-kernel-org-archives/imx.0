Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D53A33F37F
	for <imx@lists.linux.dev>; Sat, 14 Mar 2026 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773492703; cv=fail; b=WngEJrAEyr+X9nVLygyYzcW6eaLq8UqNjtihfWFNHUskNCTnM8kZp8DpqSPzNH0au2al2k1O646tUplaNDxDo1YIonyM3dMN61joHhrsaLUFBVXDpovY3pGC19WuV2mjilwlxZ5Oa4uWdL3XyKmvBuftrFplvbc/2wMiQqDF3Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773492703; c=relaxed/simple;
	bh=m0VlT+MC24A7Ji/A23JARkHWoaKU204yyheUOc/1LqE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Hi8n9rKSNX6ev+PRv8eqixG73DUcvaD6xfWTRgmAshLXBYWNrdKMdezEUYgSDEbTCPCbxdPsdyt5txiul8hTZI3thEr8egoTy+1xGrzPFeXcHQfmR3IZSGSoIVb8GoAKeLlCORB4vCLgkJJNd219yuVZwhoWin5OMvctAHmWXjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JV+G1Pkc; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JV+G1Pkc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nwv/f76xvf8ueLPB+/qJJWMNrl3q6EWvdNycAXJVzShvo2agfuzoxbeDmzsaDtWrU6qTRFc0oHCCryOKjfxqic+Ysx973iy2qZqNt4OGa8r+TrOAuVLo9d6gY+kkdX1endeFAK1xi1Bc8Fu07kB4Gz52P9TziwQDCAsjsOZhvLFUuUq6QrwLxVyT1bdrhVPMqwIfXZy4RNJYBgzrA8XhjVfYZcAzEWjBWHZhTE4TViGjBVq0FPquy0h+1LdNWFITYWMFRkjPCyiF6Oun4AYa8OYD6mauKQbsJ4WFhamPE+E97qRylYrxdWGv+NpHk5gDC0eW7ASo0H9DbkxVd+wVoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lSMtuPtwLmQit03x45UDk60W6D6EKZkJWLFp3XMnoc=;
 b=j+XU3r7AMosI79c97spellt8xIqnVBgN9EXE6bFELkKB3kAYknnL7Ock3fyaMIlUKZRlBCES3p5bxy+/vKz0Dwqetb/IghJpCq+R4l/I2o1EAsFmYC4w7D8Aki5Ir6gAgSEbIbuGeZLBs65CH3h3BVzgpejqlLebCn1Rn4JKBOXdA90FstqzVptzEN7nrZkwbXahooQD80SMkCAWbtESaxTKVnBDLvKvVh/DlXCunqK4LdKXzUL+wr2JPFNUWefyfzD9wcmgSXh1jGiHIguopeNfXIx/L63D59OooK5+R31duxvhVz9+yfmUgoyN2/f4jxFWDISUYQb/Ckx9AGpAfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lSMtuPtwLmQit03x45UDk60W6D6EKZkJWLFp3XMnoc=;
 b=JV+G1Pkc9HnmQofsUzDtBEDOHurZBunr7nqPfHBgDIrzyvSb8SqZLw//3Icf6y+iFrzx4KzTfO61/pHk84qi9fs37wI2cGzQZ7sLq+cll0Fhp6LV7J5grhaIr3+Q1VxnbzsClyFzA1BfyBYsmRzNnUSviIGdvcTjGs9Ww9greC0+ntDRxUHDJCwbSbkNAs4wB/Y2LkyKdsoWmS7ZOdWUakr8zfQbUO9GYH8fYM2PxZ7bWUZcVA1bO46yj+Czjoa4nILRARVZsNmWW5QU1UYvjLTL58ShWrDKonOy6mQU/yBbcA3/wNHf7VZXnLUsBQYfoaYiQPWUb/UxLomrMJG3sA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:51:11 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Sat, 14 Mar 2026
 12:51:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 14 Mar 2026 20:52:44 +0800
Subject: [PATCH 7/7] arm64: dts: imx943-evk: Add pf09/53 thermal zone
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-imx943-dts-v1-v1-7-3ba9b426863b@nxp.com>
References: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
In-Reply-To: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de3f3a2-69ea-41c3-4dae-08de81c86bf4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	yNIXiyWiCNFI7S7S1VgnIoFx7+ieqODg6DMShmhoZicwplhZlEsLnaB4tZsBNPPY6gE2wGDpnCk4Lr6+j7xVFRJg+nF+GJ6JeDu1025+e7ADj0bWCOMcD5KyqpXMl+c3m5fbF7dzxYa+uSQd3bjtPOLrIMG/dPlSf8Kr1RA64LnboEE8cHv7m9T0gHnRSKkC+9MfL+9NVXzgLSH0N7zN2kz/K7sditqTiFbWeuCahjTxncIA9Lp6W0qcsSfoJxReuKueB8yGAz4OR3u4v5aLADL05HvK0XXEWgzMrxqsj9uSK2caExcfNZPguX46fBoyd46YUUFyZ4K7rNJYmRQokJYXEDni3AnRGB3ZRlAiwuNN6Y/w35lEAbXDfineOSBWKdroPXLrAU+pciNq4SIs/XzehfbtK3O+vtyypoXpw10fAvQ33D4ZspOuds4btMLrI7JNMEakzcjmlvta+AVUHNaQJhVIkTGf/g/+yeLJBNjdRtLowFzJtlaxWw8aTEOjpBtHgPSsGZJ8e8R1EGL1PjxiUp+B9cHLbaNcBbKDC58BLpJKaw7axQc3rza2+S9gdK6RjiOe1Rfa8N431TrUOJ59FLFda2NupQNisE/L92Au+k5rzmoPcn4VkY3d4znuk67ppKQWFkYOXDu651mA6mK4mFHvJNmP6LqaVOtoiEznE+yitLXmxYySZjw8peCrcEM2h1wp+OTAo2BSxZqCIijk045P5zdwoRKbHcrp7wkBeBEMi1LW/YdeeC/C0mjyUTm/Hdr+1lkC2D+rFgexjPvfOYGolJYO7RuV/jmVuuo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3J2Z1J4R3pLUHRueEdoQUhHVjNtTk5BbW0rL2tPZE5xY2hGVUNLQmNWNDVG?=
 =?utf-8?B?K0Z2WmZrc2xqNGtSUlZoMXM5N1NYZ25xdWNMd3BjM0pPSHZ2d0ZjR1pacERU?=
 =?utf-8?B?elN6b0UxMjRrUnBkdFAwYUFkNEhXQ294NG50LzFJRktyeFR6aGRud1AwSkJD?=
 =?utf-8?B?dUZNdEFmNWllNXNyR3dDWFRvc2tyUlZ2bEhJMlMwR25oVE9TTi9zQVZ2SFkv?=
 =?utf-8?B?OUpOSDVhMW01UlFaNXJHSDB1K2R3blp0MnBNcDVvdS9kVk9QbE1YYkh1VDdD?=
 =?utf-8?B?ZllQT2xsN3RwY1NyVUZWMjlHc2xxN3hOR0N6MGVjZVY4aHNmMmNiK2NGWXZK?=
 =?utf-8?B?TERwU2xBMFZOY2JhUVhVeC9QdiszYkozWVBRMGxOQmhITnA1Tk1pc3h3OEkv?=
 =?utf-8?B?VFlBWExuRG82Qi9CNC92MTRFTytVeWJPaGxHaFVETUVWczJ6aEtieUpiZkho?=
 =?utf-8?B?U24rekZnUjdiM3RsR2x6eHVZWS9ScDJ0dFZFU3hpVDBSbldUUlBFVTZzaU5v?=
 =?utf-8?B?OVJKNkF2ejh1SERwdGFTMkVJd1AzT2FzNllXNHd3cmE0WjZxUXYydlY3Sy9i?=
 =?utf-8?B?bmUybitpaWwyT20wM29mUUl5b1dVMGRaOTlPcytjSU5sZ3ZUcUY1VVFmTEMv?=
 =?utf-8?B?bWhhOTZMWGU1Ty9pNUduZGY1eVNNMC8xSHY4UWFVN1AyeHB5bm1sR2NGRkxj?=
 =?utf-8?B?RGdVbjVGUlg5cVQ5OTh2TitrWFZjSld1YjNNVXE3NTJGdm5iVG1GcUJ4WEwx?=
 =?utf-8?B?REpsdWhoOXNCVmV5eFZtRnovYWJ5U2QwMUVJSGhLVlpSNGlzT0JYQ0JodlhE?=
 =?utf-8?B?UzdVdy9Tam9UMEcvYWZtcy9JRnlaZDdDVWNwV3VuVWpFZnNwTVFYL0dmT2t1?=
 =?utf-8?B?bVVpU0o3dDM2VGtHd2NnVXNiWkE5cVlBSHlzbHhHMEdSWXJLMDJCUmRUWERS?=
 =?utf-8?B?ZmFBU3JyakNuUmExU3lwSXVsYTRYWGNaZXhJR3hCa0VjYStOSEZXbE8zR00z?=
 =?utf-8?B?Vk42UnVVM3VWUDVlV1hlYXY2NWUyRjVOeDdGejZBV0xvMWlJZ1gvMGUydkti?=
 =?utf-8?B?RGFHVHZKa1YySVprU2x1dWNuSUFqSVJRVHVlZjFxWnJsc05tM08vYWNQNDRY?=
 =?utf-8?B?TE91R21QUkJNbzZYMDFBUVZwdDdWd3VGdXU5U1VxcVhST1VIc3BCZGZiK2Vm?=
 =?utf-8?B?ZTZpSnh3S09FZEFMSmVrTWsrTHQ3MzFNN1I2SEZZbjFNVHlUdUxjbGUzbEht?=
 =?utf-8?B?Mi8yd3U2cWhlRTd1T0NLR04rMGprLzlzZXBYYm9lSUp2cEFwZnBWdWwyZkFz?=
 =?utf-8?B?S09IOGw4UThwUkxjdWpFMWpabUdubnlyWmRFWkE5TmZBYmZNK29EWlA3ZWRE?=
 =?utf-8?B?eEx3WmVKZnNkZlc4OEZRVHFjWk1SckN1Sm01QWRLdzV0ZW9zdjRieWVnM3Nn?=
 =?utf-8?B?MEI1eUVRNS9PM1RHeURYczVTWkJOT1dCYkk3MWVxekRCVUpIUEFUSDZqWEF5?=
 =?utf-8?B?SXVOU3NNa2ZpMjd4Szl6R0s2bEd3Z3phdVpHTDB6Qis3NDdDRTBOZjFPWkhq?=
 =?utf-8?B?YUFqTGRxU0tyYVZxWU9kMXpNekxEdURnWDUyelhlVmd4NGlqbzBDQUhMYnF1?=
 =?utf-8?B?V0xQWSs3WWtFRE5HcGFxcTZZWG5LcEE0Yk1zQkdNOXg3TVZ2MjYzS0dUTFJT?=
 =?utf-8?B?NThjNDBDTFJxN1EycFIrcDRjT3h0anNSWktHZVRUbm9zaDl0d3doMEY4RUI4?=
 =?utf-8?B?c1hrdUNOaWJJT3ZjQTFmSGF2cXVra2t1Nk9EWHczWTByU2tGMmlCbWt2SGE4?=
 =?utf-8?B?cW90SDJQNkRDMVRhbi9PM0gyYlcwbU9SSituOFhreDVLa1ZsdTFVblpLRk9t?=
 =?utf-8?B?U1lZVkl6UElXUXJwbnVFSmlkN2lRVHd2NFZoSkJsbHBHTXRPN2lBVWlwY2F4?=
 =?utf-8?B?NzI5WDNka1c3ck84TjNKSitJdExDSkJYZGZMR0RGclE5bEU1V0lXU3VXV3N5?=
 =?utf-8?B?TzVFcDlNbUdXSmFUS05Obk9oS2xadG1DaEx6K3JtdkgxM0dBMElSY1laaHhv?=
 =?utf-8?B?Z3FYU2gzVEFrZURqYzl4dHlkclppS29LakpFejVUcmE5RUlVSW9MbXRpSk5q?=
 =?utf-8?B?b2o2QXdsUE12SE5zQVkxdWJSNDg1MWdkUGlOWHB6a1FlSHNrWG9Xalc2UVhC?=
 =?utf-8?B?YjRBVGQwTHd0VkdXZ201ZGIxWDVlU2J5VWZ1THM1L3lkL05vS2ZsaSs4Vktt?=
 =?utf-8?B?OUZMdXg2dU1pSzlsN0JMTnh2UGMvMytEbGJVZ1pDdHdyR1FEWC9xeUpIeFFF?=
 =?utf-8?B?ZjJ3SE80UzBZVG13akxCVjYrQys4bUFxVnc2YmZNNk9pVDNlNm5ldz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de3f3a2-69ea-41c3-4dae-08de81c86bf4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:51:33.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwyxDBBTvT4R0GMSM0hKxG3JL6SiEhaQXM7gmEYZ7QNASQX3GcAxSTPEDih2iS0Da9/ddh0zkfc7EwDPa3hDRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802

From: Peng Fan <peng.fan@nxp.com>

Add PF09 and PF53 thermal nodes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 428a8dc1904cafa24d47a4f81dc70786f8516ef5..ecaf4ad07fd894664bdaccd6cc410dd282683fd2 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -889,6 +889,44 @@ map3 {
 			};
 		};
 	};
+
+	pf09-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&scmi_sensor 2>;
+		trips {
+			pf09_alert: trip0 {
+				temperature = <140000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			pf09_crit: trip1 {
+				temperature = <155000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53soc-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&scmi_sensor 3>;
+		trips {
+			pf5302_alert: trip0 {
+				temperature = <140000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			pf5302_crit: trip1 {
+				temperature = <155000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
 };
 
 &usdhc1 {

-- 
2.37.1

