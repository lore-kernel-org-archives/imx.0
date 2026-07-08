Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9573E5EE9
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541361; cv=fail; b=JzNhqO6xcYojw349Za5nJrs+sBdHSx6guXZa61nK9/Mrl7lZZWUnTzE75gEnLXHc86O1XPGMXVYB1oegSuBS9SFEHv3hIKFK+DC6V6T7ulrcnGmJSCcL+MnVpi15Un+Vzftg/lwVpNwG6+TX58DC1kJQEe3qCJWMtHZIuQm+HMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541361; c=relaxed/simple;
	bh=IoeFi2BNngmPPa4Dq8Z/zMv24i0icN07Bx+y6hYYZkk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JQrRsKk9D2nNVWMZ8WS+6CnaaZk0HJDSsqNBmbNvyMjzvDC/d/2RDpHvf3Q29ytrw7LM/pgDVzadiATlu9WtcvXr1XDPl4MPWj0Sw/0ghGHuxFx2ewVKlsk9dM1zlVHncax8ts83BmvwewgdGvDjz0svn5l/j+qzsCdZqqzfA+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F0JlNBxK; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F0JlNBxK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPcpurG6m3xSmkV0yPU2ebeLqQNtoR7rWn8eJITeI9TsHFBMgJqFi0AFLO829UIVBcPL8eIHfIRggk1LLt9ZFDQXQbJCvEj5IKCZMGHOwSysPO1CNZPbAN8u9rOMK3gv2H5aObChJlH4JdmNsIqZ+SMOBdNZRbOLbiws5q04OEwBkvbGRiPBH1uLDJnXHtQff5y/WTjjb6KbP/Dbw0yK+n1409HtpGbB9aExDGIv3lOLBu0AFP5o+28IkRX2X+3Y4ixJcN8jQfgTjE+1KrhshoubGCXeOI4IvjeU8eUjczBDeR6o6RVZyET67b9DNnSjs3+6FcoxHamQX8HPwTJn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7csdtlA5Uv45weWEepLMIOkewxmg+hS1GS4N2YPpQfg=;
 b=u8BL7pqVkxMmH/4RbFQC0bVqSsFiQ4FgvmEBsEIxaJYp4uDtxSRMpWPjibkR5R6eP8pJvOLJ0TTAM9sqStGyPbRDSVigs0JIpxYHIZkA5GgBUZTPNkDfFvzWp+wAAtFeWWLQolB+toreIkOD4hDrZLNYnzAkH7scirKZR0RMBmDmNsD8F0MvbCymTkOuRQaXFW3C0wp5HGuSEKQ+emqPa1vFJLtuD3kUbuuP4/tmQO5H7GSBxR4aS11oT2vCuatf4nJ6Txd3ojqZ6wfyv1HGRAQT3tHRgV/U5Ar+KmXo3V/cvzKmXriIOYXC5MDSSl7y+dQ50RwZzWgiU/are3lyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7csdtlA5Uv45weWEepLMIOkewxmg+hS1GS4N2YPpQfg=;
 b=F0JlNBxKumMFnz0a4KwMT3LDKcvJHqKmLyyszmiINaXTwVS9MSW0NFJMnvdEbJecE3TnupqjkGE1uS2JibzIEM89baPP6H70ct5u9IedDr4Sqb3ah5k69L//FLQN+zBBp83WatWadmD/H/1HSyrAxXCvRrkQFVeVZLQaUGRZk+VzA1tfuH40S95/RQHeYtBxtMDj7ymG/GitHTje21CAWfepf46farx7yhsncWFNMWst7NsIhuPBmFgnEctNYRyuRtWcXiJI5bNZGOLyrk6P4nXS+cY1nbIR4MhUytmT68/sZ3hlWoFUWhvEJAxHSBqF6O6so5utd82vAQjhWzoiAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7571.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:09:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:09:14 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 16:08:32 -0400
Subject: [PATCH 3/4] ARM: dts: imx6ul-isiot: remove undocument property
 clock-names of fsl,sgtl5000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-arm_dts_mini-v1-3-11b88825fd1c@nxp.com>
References: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
In-Reply-To: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783541314; l=960;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=2S50fz1wNfOVidACw6brl1w0xz/8fAlphKCE1e06kuU=;
 b=Skhl+Pof4jQi0oMYg/oBQ0R0jrmYRW+prVQUnk8dUrxtP/zYOvSfSEtNDmeAujKcmD90+HwNC
 mrcbe7NaqQFCUH5vVPjgnL9w7I7RNzsw7e5a1i48yGTrBgNDiSbIZbb
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF0001330D.namprd07.prod.outlook.com
 (2603:10b6:518:1::1c) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acd0738-727c-4048-408f-08dedd2cc82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|23010399003|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	bxUfbJejCkPln6GrJKuwMWcWNuC24XQlsS4w8qxFbVhgfTtcu6dT0UxsCpw31hacr90cj/qUmYZh6W0/Ad12lkO2nA6XbDeDqx7F1AJ8ptgRyMeVvScEbeY8pHlCd76siOL8Lp51IxjKSVGK/sOaZNi+EKwPLRzFZQlM9w024KuVKoDdJOrrYuWXHMGRGiv3mMJUHjlW43hk5IhUog7mJhYIqgoDu8ai40tuMLKGgmVrjCJVJt7oJpD/mpwsuAoaeBSGQh5ndW5PKJ7+jrmjJ39lQya4R0hcE2tcdcrZX7FO1ASrSTiQaNPsHlsA/jikhK4WVU9YWHJ3Rvr6f6IG1BnRtNUgk1NTaIWEXsdagO/i/+LxEqpG8MS01V8NYmYgupq2f1hFiO3c6hCmIgb5XVxyMICFQN6Q5do6Mbhi+eMfc9IqjPUmUcXRum+cWyYwWA/jPYT1kPUsv5GtKbqXGD5a4aewSGmDdxP4uv7zQoHtyaZwoSsR2jPZe4YZaxhIBiBlj4xcKhvyhEsCN45kff2Xn+AYL2kbZXKkfY6Hn5KeV5xPW/gzxfIzevvw0yKQ2ES6Zk6XpyeVvecn9dcoNFsTfhAox00lTLWEpIWAvwxCtla4Qf7FdPXiiXl0c/hxl1gj+c0utulYAeA/7XqQlCAdxvUA/7Fbj4u0lBLDrzU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0pOcldqdFNGQk9SK0hIbzI3aHZURTF4czZYcS9kUUQ2ZDcyVXY3dFFSWGw5?=
 =?utf-8?B?ZW9qbHlsSHkvZ1hXbHZGZGhOY1JjQjhTdm1xY29nbjN4ZjNyZGxMc0FCM1RJ?=
 =?utf-8?B?eUNtU3BZR2Z4c2tlODhIVkVXaERwU2tDWENKU2pvcTNTQnhUMXBkWHhTZjNn?=
 =?utf-8?B?NGlsdmlmV0ZocHBYTVBYbjhya3BtREw5QVBIMEt2S0orQ1NKaVcwd2tZVThr?=
 =?utf-8?B?a3JZYlZkSmRDVStFRE1pdlc0eitkOWo3b2txMGNlUGpMTWFXMWxaK3ZSVVpm?=
 =?utf-8?B?OG9SeDQxZEhMRVArZEkxM01vYlV6cTVOV1lkVUsrOVBPOGlqRkVJUVlDdFJv?=
 =?utf-8?B?cUlhYzA5L2hjdXczOFZKei91dWNuY0NKMzFJMURZZ0tyR3h2ZXN6bWJlbHZv?=
 =?utf-8?B?bjRWVkNoVE5FZWx1WTU3ZVI1anExVk1Hb2JLNzZzNGFkektpdXlLVTBqMGpY?=
 =?utf-8?B?ODI3VUdpeVE1QVkwamRpWlZ5WDlMUnNVWU5WM1VaSzloaTJ6c1l3R210Z1dp?=
 =?utf-8?B?SkoxT0I1Qjc3VzR5RTBGNERQdHNEZEhGVlozOWJhRm84MWFTUWJKTE9ZdXZ4?=
 =?utf-8?B?cWhmN1EwZHQ0MFN5RGhoVWZkTjdFMndraWNGTHZseW5tVXdDYkxKMXBiQllB?=
 =?utf-8?B?SzN3a0lrb1AwdFNHc0xQcnA0amJSMUNzTFlnQWNZcWZEWWpuMVNjdVBpK0Uz?=
 =?utf-8?B?aHZjd1MwNXROTVk0RFlyWm1UbFhDQWtKNkZmU0dFeTNsMzA2anlEODNDaldh?=
 =?utf-8?B?RkhnMHN2L2dpNWIreXltaXAyK21HSjNrWWxFOHcwVldXQTRGa1o1TnZwMm9z?=
 =?utf-8?B?a0ZBajllRjI0Szh6eFM0aXVuSm90dmtwNmY2MlMrVlY5bGhza0VUQ1QreVg0?=
 =?utf-8?B?aEtuRHlIeDJXSzQ5aVRzSlM0cFdaN0ZaZHl6clh3aE9rMXVWRHk3Nm0wN0Jq?=
 =?utf-8?B?WUZCMCszaS9ESnYzNE1vcFJvWmQ1bkR6USsvK3ZBWHJPbzFCWHpOWC81VVFr?=
 =?utf-8?B?QldaZjJ1V1FOV1dabTd4c1VEUXpVR2dJYWJGaW5XTFZTNTJWVDZQanpvVGFv?=
 =?utf-8?B?cHA2bVZyUkNiVS9LMTVTaG5FQ2ZkRk4yYlcvZk1lZmhpWW1FTG93S2tLVFVm?=
 =?utf-8?B?TEJOWU91Y3pQTFgrT3JvTlVNWHc3WEdwSjRVQnJEeVh3dlErTTNyQ09DNHJK?=
 =?utf-8?B?UFkrc0tlaFpsNkRFT01tTEFGMlBWVW5TVUN5dkxJNmVsQjNWMVVKOGZhMzFw?=
 =?utf-8?B?bFlGcVd4c0Jzb0FINUtTbTIrRU5rcTRIcHl2RnZ3aTFQTGcyT05NT1MwUTBP?=
 =?utf-8?B?NTBRZ0JPdXlXMTFHdmNIUzdtK3R0d05HazY3Z20yL3NwMGNuVTFvR2NOT3p2?=
 =?utf-8?B?RHRCK3NrZ21qS1BIV3BNWjRkUWxrMnRoWm02MmlSUjZxcHV0Q3UwTFIxbVlF?=
 =?utf-8?B?UlB2UnNuUUwxYjgyeUgzRkRESGQrWllValJranJEWmVOTW5JTmRrMDRpcUd2?=
 =?utf-8?B?cXlZbmJkWUg1L2crQ1huRURWb0doWU1XQUcxdlFPZ0ZlUXVjajcwaUdpMnRh?=
 =?utf-8?B?OG5jVnVRcWVUSGdEREFVcDc5WkFvT2YzVi9KeHdWRTVLSi93L0FjRUxsRTFx?=
 =?utf-8?B?amgrTkVmc3czN1JUdXk5RVBOam1pa1AveWFqb3JmbU52a1ZtUkdWK0c4TVRB?=
 =?utf-8?B?dFhxUXloc2ZETEY1N0txYzZvSmNwWG1OUmpzbGpPeDlRaElYbkRKTmFLNkFV?=
 =?utf-8?B?b1Y3ZktKV1ExK2FUNVVTcldKNTVWRWpxVnRyZTI0cTNVQVI5WlliNnBwSlhI?=
 =?utf-8?B?OUdtNmw0V2R5N2ErNkxmMndtZDB0WDFMMk52SjkzNXdTUEQzQVQwbjY4Y1JC?=
 =?utf-8?B?clFYTDlNZUM0SFdZTDJMNTVXVXhzTk5kT3dpb2Y1M1RkTWdiOVdvU093cWhi?=
 =?utf-8?B?cUk5REQ5QlpRZElCVHdDeDd3b0RrWEF1aytnYjVVbmprSitTQUo3LzJEUklG?=
 =?utf-8?B?aGZFcWI4c1NJOWhFeVE3NDBubys0WWJBOURkenRXbG9WSkpMdWd1Skt6ejZn?=
 =?utf-8?B?OHFDMjlaWjBZbU5XVGk3VmxJYTMzQVYwYmlsOFVRT0Z4Z3lhcXdBUldIdm1Y?=
 =?utf-8?B?R0VWNUJzUTg2cENZNjlyTVR5MlRSbFhMYWZCaXJHbW5pTm1hdlg4c1ZDS2hr?=
 =?utf-8?B?Nkg1bzVkUnZQZEZwYjM4WVAweDJRUWZWdDNpM1dVM1RKa3JvOEIvME0xYThN?=
 =?utf-8?B?aGwwZ3hYMXVVZitBZXVuU2cyUERFQWVxc00yaTR2VlMrd2I4QnZqKzdiVnNt?=
 =?utf-8?B?ek56eGpobEdBQlZJbEhuMUg2SVdpM1BZQnJzUHV4TWhLdHFjZXlac1dBSjRz?=
 =?utf-8?Q?H0Hg+O7SbsFgqmnPjdFY7jh7OJnGueQxVBx7o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acd0738-727c-4048-408f-08dedd2cc82e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:09:14.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8zzJFngZCUrWdMRyxAuIkPvYZhyUbdByIt2MNF9UNgGFX/5MEiVyApCGN7r7sPi0e67bdG2RrHIIFL7x5WJ0nuwp87U6SHaiIWPnJZdFK56sG1R+D5kPbllBlhZoTtO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7571

From: Frank Li <Frank.Li@nxp.com>

Remove undocument property clock-names of fsl,sgtl5000 to fix below
CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: codec@a (fsl,sgtl5000): Unevaluated properties are not allowed ('clock-names' was unexpected)
        from schema $id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
index e34c8cbe36aec..2e3a71f94f312 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
@@ -116,7 +116,6 @@ sgtl5000: codec@a {
 		reg = <0x0a>;
 		#sound-dai-cells = <0>;
 		clocks = <&clks IMX6UL_CLK_OSC>;
-		clock-names = "mclk";
 		VDDA-supply = <&reg_3p3v>;
 		VDDIO-supply = <&reg_3p3v>;
 		VDDD-supply = <&reg_1p8v>;

-- 
2.43.0

