Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C63D5259
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385972; cv=fail; b=ZOd3g1L+Y2VpJzc69Z8le8V/ZzlHnmodPeO2t6nmHbEj4BMCLSl9iKl/JrUabcOlcWEDwseObb/M9hWpPLfriJUhN5KW7go2H/OIMX1zGjHk1l9VJHF8AItlipvTGLuIYZb9mypoHF9DciCo7tqs7kepRNShguJGNAIa8GDJeXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385972; c=relaxed/simple;
	bh=RL4iKZ+XIDNZRWGC++UJo8LIE2xI5HLxqljx3ceoWEE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fxfXUF2I6jxqx8l5dn8jnOoszFaONiICGqeuLABHG9VDBpryuMEaIVcvA5Sg60bLXlsLgMhNZuwRn5wH/u4INUtRg4qsMcsMcAJEVnMd0qTqIUeQSCUVw4YQFMufsatf1v5L3e8pbni71x1At8ZJkFVyk9cK4kjJlhSMcXUw4BA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=saBDj7Zt; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="saBDj7Zt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IKSKzuixpGFm3eEvNH7YmWmz/Xhzq58gIZLOHdTaT8DWZMO/28a9h+wfUBTK8xBCEePJGWwKylqz2ITwbaCU71U5C9wF05F6V79ZBRCxRnDZW298p12T9mxNU95F+ZOwQjB6ih3v9kIEaXUiZBCNKLqqpaA8BhnmuM5/o0S/vovv00p2b5NnTZdCnTKELoF6oEtnePQgTZnpnnqjbbEGm9HGWVZwUmhix5f4MD3tVSi/kb8WxpZpaPONuLVfrZxVqCNFW4cuZxx6YiPJVghsuZO3jGFzx6PG/t0B09O00JyfklaxCl2GwUxCpbjhm6ikQAkJ7PaSNxxu1Iz1D2KzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4tehzPf7uu/ei0Ds6mLsD/PtUbJuEqJ+QFyCb16DaM=;
 b=Q5/Lm7wHv/49sghQN1HrbEOG6zZJ66ndEp9TSTBShbtWlzrukIlbKmiXlX5Sj9r/rz8Mmani9+eq0ukBVXcYkjxEDCbhZuntwmoxJ5UTw497v9VBz4SqJ2UlM5eXdURrYE7PQSEzsZEEj9OaQRoWybyb2TgvX7xCel7nN9ymQCbyJ8ytmiv8JOSSss3vdtm1GQWDTQmOI+m9Ul4sRXH1VwqJAA5bVAGnKjXcTfof/9dX7bld0rDpr20ka5f/2gBHA8tHQyyDcmYvU70EIOA4qo8YOkZAX9aEpWDE+wRYmFD6gz1QsBfwNWOg+yrkMRVGeC2xBL27hCJpeGKziN+qPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4tehzPf7uu/ei0Ds6mLsD/PtUbJuEqJ+QFyCb16DaM=;
 b=saBDj7ZtEGpNDaiJ9H5qeneBqBVF64ps+cYZ2WZwe68TQrMAB4SoK5QFou35ZRmITMXXJMk44eIRgRa79xBaGkzgPgizxPZAGxh28rynlqCaLo8rS7BpDdd/VpfSEE6ZEPjv7z6oZar2fD9pyCvP7epfmA6N6CLvf46P2u+BRiF5w7mOVk8zF0PWur1jAGVT/LrWXDAj3ZoECOz+2rXDfmyWbXn+RWL265fksg3BBDSWmuExjo2/b+KU6eFqOXnCLgVP0/W0tmRNaLHVTLFUqOLwtxJLTC6V2pltwsyYTXNPpWfHIC4BYqSQrPvwAClyj/m9UXdOlG28Vo9srWaDhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9728.eurprd04.prod.outlook.com (2603:10a6:10:4e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Sat, 18 Jul
 2026 14:46:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Sat, 18 Jul 2026
 14:46:07 +0000
From: Frank.Li@oss.nxp.com
Date: Sat, 18 Jul 2026 10:45:35 -0400
Subject: [PATCH v2 4/4] ARM: dts: imx6ul-tx6ul: rename disp0 to display0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-arm_dts_ldb-v2-4-f5669571aa2b@nxp.com>
References: <20260718-arm_dts_ldb-v2-0-f5669571aa2b@nxp.com>
In-Reply-To: <20260718-arm_dts_ldb-v2-0-f5669571aa2b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784385940; l=859;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0hpK498VUO8dxtBKG2KA9GUlzyB29UEOvgq/J4+0ua0=;
 b=N/f/T0CV3Z5cea4/5S3jbHUu0txP1xiWBlSb4938NJvAvzi2TL89YE1mk1pzDg4kHPj44rcKw
 g7XQ+nIoi7EBTDM5HJhIKkvn4lBFZGdl/dSV9kti7c0HZxgy33eR+9y
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH2PEPF0000384F.namprd17.prod.outlook.com
 (2603:10b6:518:1::71) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9728:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fa6aec-dbda-4b90-753c-08dee4db4cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|19092799006|56012099006|11063799006|10067099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	8oTlQlfMQvqeFHTzrdac/s4FcCgzJS6UVBZl8jAUH1ZQbV1S+rt8q5hwkpmg2XOKT9T8NQ2+FNhMzAGbUfegNQl9bZMqkbMuWOIVA96PtEtwUHFL7oN6G/QFeCzmRLg0/6mQVDm4/xTGNYgq4IHYRE31YVC1OoP9ZwaSrn8m7P3dtfKIjkIpfdv4nrIQt3Bj7Gp3e9z/DXVW0KcYvmmLKOL97NMHv3xN1GoVRHNQGaHE9HViYcSz5z3o6oHv+dQ/AvdC+GkjxADWT6slayTC4LNHqpfYlrsnUm4i44GHsY6iNAGxflVTKk5KNBpP9vOl+xxOVC0u7MwZxTgV3Xm1dNFT3qP0AmDdo0n5/WhOOUZzYfZ+TrUIjGUug5bWFHhuHWnZViSDlpWE1QNkA8y9b4rxyF1/AHTdbFYG8p5KXAKoJ5A6aKgZN4a7rodoufxkcNe+xwaQ/NKH/xULrKWC36mxOU3mVAxqksX7fCO/ygapTlDzbU+E4N6MOSNf9lCqDGZnJ2dJyHm7n+6kMwSGvOQHj1NO56xA9GTvK9aXGWWpqy2eyIAiuhv6m5G9AeIgbzlXbl9jIpZaOJzMONUL31Y6j1WqLXQIiB4+gfy6fZBVXpAK5G1HKEyQ8P+KxgDuxTDC3rUf3VoqmJxa/r9gU13ZtP728BjeI+UpZWZc3DaLQOzW7UJchl4BM6whoLIdKtf7KQFI7k4KP2wWdebdTA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(19092799006)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFVpT2h3WEo4TzgyNGhmVE0rK1lMemtUcmUyMjg4SkJidmpmVHJvMEswbU43?=
 =?utf-8?B?dlZMK2p6T2ZqS2h2WXdqOGFyOS9YdTQ5UUQ2UW5zNThiRHBmNzJCUmdlTEtB?=
 =?utf-8?B?Q0dJYWhLOEgvRVFzeDVZbCtTWUhOVWtTdlAwUlI3VkxEeEZoWStLSXdyRmRj?=
 =?utf-8?B?cjIrTWRjb2RIa3UvTXdYRDduK0R0M1V0aWg2QXhrdjhLNnNlVW1WbzRNZW85?=
 =?utf-8?B?NWV1OUtsa3gxLzd2cWJuVnpINlYyb043d2FRemN0OUh4U1d6bFJSTmNiRkhx?=
 =?utf-8?B?OXZmY0p5K2E5aTN4bE42ZjZhMHBkMndwYjgyWUg0aGQ2dGVXT2dmcUNwZk1t?=
 =?utf-8?B?WUF3MUVjcjNzT2Q0T2RFMTZDYzRZTE5acVI2TExONVJQc2RtOTZKNkF6OFRL?=
 =?utf-8?B?U3BiZW9tU1dFSTczWGJmTjJ5RGpxRmcyQU9jOXJGU1pwZ1RUSVo1dVFHSnF6?=
 =?utf-8?B?Ym9sQndTRVU0T05TVlV1Mk92V2x2YTdyNUt6OHNjWnpxRW1Uam9udTBjekhM?=
 =?utf-8?B?WE9HRFJBTkg4TEUwMm5xdHNhU0xoTnVBdFU0ditzZVZsb0FlUW03OVh1OFRJ?=
 =?utf-8?B?RUpCcVAxcCtpYWRlOWhJZ2VUL3hmNHRhbExTbzNjZG1adVhBMUNidndqRW90?=
 =?utf-8?B?U0pVUXZScjVORFFOcEZ5ZWU4WkRGVmJEOEZNM2tWVmFGK0d6SjFOczJDd0ZN?=
 =?utf-8?B?bEU4Si9LOC9BNDN3VlJvQjd3S2Z3c3k4ZFFrVHdSUG1BeWYxNlRJVHFySjVX?=
 =?utf-8?B?TGFMdkRQTU4xZ2RzanhtVG84bXZYakZMSElsem5IRmMxS2hNcjcvb2Z6Y005?=
 =?utf-8?B?Z1RBWHk5YVIzVmFjc25NbkRrZnRKYkVDQXFJSkxVR0hiM0kvcDlucjY3bVMr?=
 =?utf-8?B?bUd5WlAyTTBTcW1UQVJlSTJBbVhtYTN5aVA4RzBHcXJTMWdXQVlGMnNYZVND?=
 =?utf-8?B?WVY2OHdCT2YwZm9pOFZQcC9Za1ozaTJ6UFZiMVhCUUZIWnk2L0NRWmlvcjhk?=
 =?utf-8?B?b3dvYkxySnJYdHlmQ2FRNUlQM1EwOUlrUWdxYTBWb3RpMDJVUHNEVUJrUG5r?=
 =?utf-8?B?aEVWTWU2YUwzbG50R3ZTMEhDUFovako1b0dtejI5bE5GM0FxTE5rQUt2RVhw?=
 =?utf-8?B?VTFGVFUrQVRabGtieHR6ZWI2ZlBaSy9LTzBiTkViVy9iTjkyL0NObFhBSGUz?=
 =?utf-8?B?djcyb0R0UU5WT0tXUHVVUHJFa00yVEZ2dFZURFJEWkRERkxNVDROK3RVZGs3?=
 =?utf-8?B?MEwzU2JsN25YbG1laGxNWGtERExTMUVyYzNXVzZ3L3RFNDFGN00reU1qTFNB?=
 =?utf-8?B?QVpkNWNBdVNHUzEwY0VjeDVGbURLR3B6WFd5bm9YTkd5ekh5SmhtcVVCRzJF?=
 =?utf-8?B?VUZMNmF1UmYxRWpzdFhXaHBUWHlrRTFMU1pkVStpQ08xMmw0QUFjVmNJUXJa?=
 =?utf-8?B?NzFxa2VhcFo2eWRRSDU4cjdneDlKVmJQbjUwUWpsR3RQdklCTkpMdXNxR3Y0?=
 =?utf-8?B?dHRsdTVSVHdpZHBYRkdnTlEvbU9PRWdpVU9lU1d5VGpCMGZHQ1ZrWDJzNDIy?=
 =?utf-8?B?MGdNNnE2K2tLTThLcU8veEFrQzc1VVZNUGpRQmpOMzFaOGlsS1ZEZ1grc1Ey?=
 =?utf-8?B?SzNsSGk2aU9UYVpmbWM0M0dCc3R4V2grU3RRMXNIcGlhcEREaTVTaHBicFBB?=
 =?utf-8?B?bDhNTUtqQ1dpaGFFbkhPc1pGc0JiVlZIMTU4aVc5U3lqaWtPL1F3SmQ3eGVy?=
 =?utf-8?B?UVdxR09KYVFEOS9HS1NVUHRzVUJwMGg0QmloWXR4L0xVNmF3Skh5cFBsTElw?=
 =?utf-8?B?eU1mMjRvY2JCWUhrbkZwanY4S25ZUFloS2ZEZ3lMeGRHWi9SQ1lwU0VzTkdI?=
 =?utf-8?B?R3hiSWNLYm5uQk54UmxpWThiRHpQK0JFcFpXdG1raTZlSGtEV3hRcTZSRTFE?=
 =?utf-8?B?NTFoZHJWQ1pNa05aMWJSUitFRnZyZi81Uno1Z0dNdjJKbUZNMFpQc0REeTU5?=
 =?utf-8?B?VldENDVEbGE4Sjh5ODlJWkdrbDZwdktiNjhFcjZyQkdVM2Q3RElQU1pvU0Iy?=
 =?utf-8?B?UHJ3V0R0YWhXejdPRy9xT2tzOEd4bjdOQXduWXVHcm5MZ0dKTHRIZEw4ZG8w?=
 =?utf-8?B?a3MyZlRHR3FYZjNTVXJ6cjlTeWxSTEZ6bjV5TC96d2lOZ3ZmbnFwRUlucTJM?=
 =?utf-8?B?dHprUHRIdFNvYm1ieHV6VFFYeVFxUnA2YlJOMkhONVR0SEN0dVZIQk5xTU1E?=
 =?utf-8?B?QVV4WThaam10akY1M0ZQd0l3elFWVHZaRk5NRGg3THZMN2V2eWFCaUJDYUVN?=
 =?utf-8?B?UExUL3ZoeFN2K3NQT3IrLzBZRHdGTjVuRTluTmNkcVk2V0haNEEwZi9vMHB2?=
 =?utf-8?Q?PNCE2AYM8rm4vfVX8rgnLuPAY5fXPQEYcgpQI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fa6aec-dbda-4b90-753c-08dee4db4cb1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2026 14:46:06.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DSRLwaw1ixLIBpelNkV8feqFwhdhh2XcBCd1OWH6ufxOoXTfA0OZBtwElJaNbdZgx3RTLyqd7ozw7GYxRX7kAgsV6icBYek3yw3pIwsIn/UFtD04zFAuQ/2J4hphDA1H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9728

From: Frank Li <Frank.Li@nxp.com>

Change node name disp0 to display0 to match binding define.

Fix the following CHECK_DTBS warning:
  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'disp0' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
index 192c6a95ae589..2f6916c0359c5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
@@ -369,7 +369,7 @@ &lcdif {
 	display = <&display>;
 	status = "okay";
 
-	display: disp0 {
+	display: display0 {
 		bits-per-pixel = <32>;
 		bus-width = <24>;
 		status = "okay";

-- 
2.43.0

