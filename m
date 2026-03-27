Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703B63644A5
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 03:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774581335; cv=fail; b=SD0+Y08Y+XZV6N6lcHmPWjiLvuBjg1GSfyDo+JHJI+hrFrHLHllX8lslhWlK6BtBXB84OSjGMOKPLAqLEWqoYtIUHWOXAxneJ6aXhM7zOwYes1+iGLFCvZh8sWCwHJi7Q1WTYZSlH5TspEI9bNDBcztzXupFwoIJMe2cbPxKG0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774581335; c=relaxed/simple;
	bh=+EKtQjF/9bL68vPI8/bwsYEPhYdrirkY7DuOS7UOh8o=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dao3zxm49XGWP2hhRXa6c0AEO3u1eLNXZoHvoAJrWgrssCwLWcJHINEvHxaJM9MU1V40XLXuFX2gnzlFWxG9eKvFBgf5d8ubgEqkHo4qPSEz9eljOUXTO0cMtyPt7JQUHx1V52wlMIYx9x8TBrnGlyoRJIyUdAWmYsJHJbD8+E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TrXGU9eP; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TrXGU9eP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLpR4kgT7q28rcYBwTJxGT8TzLS6bM64d0QB2aNrd1cMyKJp8K41LMp9/tmV2V3IdFYiZ5cfPhqN2UTkwROa1jsGE4u5L7v+yNpwoCXojpxP9hrQByMzHRLSqeCjIzr46DHXuYb9+OrKqhIWmIhmG08rGwNR3SR69bL5AlU3PcDxKFulNZBOfpf3HJthUv69exC/K2TGtxT8fCpaO2i3d91vG7yoC1VVFGtSdVPnCw2ucFZyhGarXFLfBnDQ4l7D3/ewGyMZFjUwhkOxqQHSbMDP3mKDbLtm+7/gkYu9YvGoZJ14qnMlYuVlRpt/GP0yT+wYbIRZaI11yyldhfhvlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kU1BXCpyTAtmvupsa85VPyM3TsjQ5MqLVzCBVzazVk=;
 b=LxBIpylun79PYL7YRsCM4og/iPOmLCE7Vbbf/rCjWSCKreDqRSGXXjbx9KRPlLKvWxsG3rhqGucVavteTzkykD/HUTWdFfEsWcSbyvvc6BNXmpslcf9qeuzre84tn2+taMzSbTKbR3EiODU0Elc4H1rb2cqLyCzk/GKdAT32Zb6dHuz6M8NxXzZCOaFZ+NExQfvyDkFFC5E+NTNAD+csU8zQdbQhEe1FBwRjzjZfpwXuQSCoXDZuzcVGsBSRwRZnacxHDsc6D0qQLdUk+KvOY9u7bZNMsV/KkCWVAIHx9mKE83ISR3RcywHvVo78hOGhNu6IaiqbiHkM10FCOmSfSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kU1BXCpyTAtmvupsa85VPyM3TsjQ5MqLVzCBVzazVk=;
 b=TrXGU9eP/NscCEAVHGyEj/N0aC3V3Ai0lj+DP2qRzxSCD93lxj/hW0B3YDPAVXSOk3MPk1rHpMjUkDrDoBDY5F/6S4DhrbWlTDU0y2nRXIp1cjurnr+0kb8xMX78EIVeRNYZfjH0iQqnS9OZIL0Xy/6BJoWGkLbQFf2qq4+WX2wzw3O+o0SW8PA4Jg8zxi/mWUctUfrEzQHISZT/5U2ohmfDmsZTaLXdsbUQwE3Pyin42Jiqusa1RASLX41o8jVI+VfdwiU9Dyt2ABxERkqXugorZpKAUSQnhpi2S4wj4q7LXFRpaow36avlRE7zaxjugsbc3fu4Ah25JXbArcKXqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PA1PR04MB10652.eurprd04.prod.outlook.com (2603:10a6:102:491::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Fri, 27 Mar
 2026 03:15:29 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 03:15:29 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	shengjiu.wang@gmail.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Date: Fri, 27 Mar 2026 12:15:04 +0900
Message-ID: <20260327031504.497650-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0092.KORP216.PROD.OUTLOOK.COM (2603:1096:101:3::7)
 To AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PA1PR04MB10652:EE_
X-MS-Office365-Filtering-Correlation-Id: e686697e-e426-43e9-84f3-08de8baf1987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|1800799024|7416014|366016|921020|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lfkSbJgOKfADA/rfsJkuLiQeYLskvMJVJq69+HV/XMXMSzi2C9ez0JWrIg7fXfSzDbvK7owCeInbJUujLc8SmyjMMPU1YPVZEInCT90ebe6YLFBbgf66bgF/ELAhysVY/O+NfRePK74bDISZFKElX3YRYg5I91INPzT+yR8VMIpj7Gau+lkqc6tAV+cTpgQ+2f4MLCjpnPV3nkco270VJBhL2TzJK1X8fdDLLocPPn+DOka1qZuPhiyBAuikzOkmIFz4IbVkhqs4v07oZEVPmv2kwQ48Yx/Jkquq+ZE0Pc3dbIYU0RctFvEg9AVIjnPs944q2Dm399YHwv5TyzXGtY5sqgFDs0QqW+BftJN5s78vU2gmFXMuQDgQbjCCBayiQZkkbe3N5F97VqM6/eelz976WnuluFpyVsXip1nNpzOoGWfKQcFLlVkzl55qc4MIM6ci/jvA9GdqxZ2HQNp+m4E/er3DPffj4zSp450VPg/GIXfHQVrpZ5z+c0NWFepbM9vmnBHxmQkWwcWadBUzHNtN0If2uqswIvFShOdWN4u12O5jFD3q8JQ7TPRc/PrPrQrt6AmD+9/+dfG0dqYzdGC1NNyYrKOXWClTgOs8vGyZtd3yJOW/Hv2FyGfFbYi0OxemixcEG+EbS4q5nIS4Tt3tO7GGCmwKQ+tKVATBi9/fRmkpqlrwoEA3OR/awL/gYu2Yz/xpoLI3aMIuMuoVE2qLDvCTNi+Hmf+hpmS3neIATlF6g634VIlodpq+pvklhuGI3zaPD9yCuJD4NcW/eM1s/AQrbWfJybs/NbWIVZKF5ym7OfYoLaAeIjeqFWld
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(1800799024)(7416014)(366016)(921020)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nrOHYWj19y2MaVWSDyGqd7wwrsRb5dZGEdFDembJALArWQTLhGhMenfzImfd?=
 =?us-ascii?Q?a1KpOuVnQ/oz1KiEsLNYcMYTrkud7qLDRdJAiNvGx9vmBGSdTJXpqaG93Sos?=
 =?us-ascii?Q?ub7dI3hVUgwiCLIsMsrRxXeo0PVWI4MJCDXGwIOMEb3fLqAPVcsSXzCFN8Mg?=
 =?us-ascii?Q?Zii4pgHcvznDX+29X2p1+vqIPdY3ySpV+5KSJswfiKFlrHsUNVBhy4hop7I0?=
 =?us-ascii?Q?rp8hsaz5+cDRzuDDmAdlGghIz1YukoDu8TETexmsypAxf1dTGvMQlK+XDE33?=
 =?us-ascii?Q?2nlh+gD0vHsSq9k7QE/q7fjCLytS2+Ex6XV/HxfZBUgds1ksnpo62xZQxE7t?=
 =?us-ascii?Q?Eo06g4CoEjLC8OZx4zKHCUZXMsSYzA6k0YCP0ODPaWKg8rIDiZxDSw+7pJQu?=
 =?us-ascii?Q?k4PcCLckvU0Xtrn2I9xb3ET5PI4GXVvAkB78lgoINIFsZbYqAmaCa9iE0IEw?=
 =?us-ascii?Q?kyTC7rnU3zzEQFJuJskEbgTkmVcgt5KeQaG/qcXCvzLcUHHG+dMKXkrTsPzs?=
 =?us-ascii?Q?eJFeahnoOdJHSCRm0P4T6Qaw559ilT2/bWOwxVtNH5zGBlyNsNDKn4wJCbWS?=
 =?us-ascii?Q?32E4dISxjoqZnCvpJDdUDhESOUSG3Ejb5InIvoKNl+5dnnxKgS6NXru3hYVG?=
 =?us-ascii?Q?8e2DdVY+zlmyhaXwenD7pKToXKGvZKXHAmC5cwAOmB2xcVNppeyv3hieul3D?=
 =?us-ascii?Q?UdDV/MvIWJOTVv1d8iEiWuBQk+oPBbsA+9wiYRe2ny/I9SihrEI5t1UYDxf6?=
 =?us-ascii?Q?8Sm9VNymJN/ZUTYVD9eoKULqEqcCvpGdM3qWX8Y6MoM3z4WnuEgaP+QIYZ27?=
 =?us-ascii?Q?AVQIaBHdebEOFn1NvfOKQ/4eY94mBOl63i6+qj+tdrIB1X1UAaMLWE2oeFVG?=
 =?us-ascii?Q?DYpb/IMADepUbjFW0/DnDL8O8xUAebzWuHfyjwYY3SCDIoNLZasW6n3bwll+?=
 =?us-ascii?Q?yln9SOYlWZp8HnCgTU6VZ9UCiKf9WwXCL3oDmAiJK5AzCBVwe18vkihfOmQX?=
 =?us-ascii?Q?D0SXyKc7CBvlvYp6TwHJrzck2oTLXtHoNcubT6oNhd6S3ZfSfntQr42w815/?=
 =?us-ascii?Q?IUCVrJEZshPe85sLQk+Wvgs4a3DuaJN1ziWP3w4Epjz35zOVnznvEa4HbsYT?=
 =?us-ascii?Q?n0g85i4x2cmypMA6SHokKt/U2bnzFi/9onrL7tzQLtQkxkCmiMl92KDdDhP7?=
 =?us-ascii?Q?dBdJecYUOap1vEcUQnK169QjRcHZY9+n6X4qEh5LsZj2C/hQtrM3LI2tLEX4?=
 =?us-ascii?Q?rxEaj13rr8kT1SGEvJHPRw4UhJA/PXpQOf2aaBVFtr5LB6JpUhCaeQkQ436a?=
 =?us-ascii?Q?/rTa2zDbRhsHcJz8a75wcgJeo4/YRO18W8Kf7qlHy3RsMjaTbgpHaj41IFoT?=
 =?us-ascii?Q?7CIKiFG2dbZ2NFaxFe2Ilq3tBz4/3bNnXvzkfmI5QZxjE6JcPP3+7/uYVo/H?=
 =?us-ascii?Q?RFx2Z1F4eUBsOUpTJ6dbRcG8+iXOm3eoztFhcBSdiTGCNY6osl73zl2VwFJv?=
 =?us-ascii?Q?si8XGHIHttY5inZfGtdrrd4ugOSKqD+cQkCvc4AdwTzDx4Y2UfCCdv5R7JBW?=
 =?us-ascii?Q?DcJbs93Qa0vxeOsRD4q6HwI0Ucf8xqM7PtRj9GNe2OLoOWucxGSFr2nVwMdy?=
 =?us-ascii?Q?6sp8Y3gkXPCzVNlWL0unMgf7OYCDQayl74XCoS8xrbGX51gs04ektWi7bSYU?=
 =?us-ascii?Q?y+i0Z14pbV7XpXcQgEDLqwtB3EBd79dIq3K8haRSGLZ/e6SkZbzJ0Q1FUqBk?=
 =?us-ascii?Q?CV0Opu1MvA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e686697e-e426-43e9-84f3-08de8baf1987
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 03:15:29.8384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPinZoPduH8dlcXhc3uJ6Gft/aYh30/QMsdTUfTcGAeKcSlfG45cFir0fW+PKbHFZvx8TSBnu0rLmQ2wk1rk1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10652

Existing i.MX audio sound card described by this binding use codecs
that operate in i2s or dsp_b formats. The newly added CS42448 codec
requires dsp_a for its TDM interface. To properly describe such
hardware in DT, the binding needs to allow dsp_a DAI format.

Only i2s, dsp_b and dsp_a are included because these are the formats
actually used by the hardware supported by this binding. Other formats
such as left_j, right_j, ac97 are not used or required by the hardware
currently covered by this binding, so they are intentionally not added.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
Changes in v3:
- Rewrote commit message completely to describe hardware requirements.
Explicitly documented why only dsp_a is added and why other formats
are not included.
- Rebased on latest code base. No functional changes.

Changes in v2:
- Updated commit message to explain current support for i2s and dsp_b
formats and new support for dsp_a. No code changes.

 Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 5424d4f16f52..75757fbccd89 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -37,6 +37,7 @@ patternProperties:
         items:
           enum:
             - i2s
+            - dsp_a
             - dsp_b

       dai-tdm-slot-num: true
--
2.50.1

