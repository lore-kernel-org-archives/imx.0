Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A953A9DA6
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952001; cv=fail; b=dP3ljqqIfppDyPgcMjV4ErFENHz3bL9kSwhNOW/6UeMHtycqPAxcRXnJ06z2e+rzKM9PtnVshZSw5kyvWE9jIdKdu7hmxSbswpQmBfo5DQhwY/NqpSa6IiJHS/rtqRAo4ACN11W7yVMqR8Et7h8JFILbrGQf1ThRbQFR4wx++zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952001; c=relaxed/simple;
	bh=3iXqzqAAWNm+d2Z4joO+Wq/4z0jzt6wllVtOsy5JoEg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MsgRkiFgQ6vxwN5rvAS2vS7Li4gq/vjVHEKWY2LwAHhdzpUlkk7aVh+coEOJVIR9b3pjRGiZFt063NxDdsv/PiXVm+15NQsxcarhekf0C6KTXm57LTF+6e7XPwrTxXsOjf+284O9BwIZCKG0KlNmHr1FHud+v0iWWhdS0raeE6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HRstRfEp; arc=fail smtp.client-ip=52.101.65.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HRstRfEp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHKcwasSbjj8MmezdtEKnjYivVXHDU/mZb6kBlZ3wMyupqaUCLq5494AKoC8NOEqGkckJ4f8mGO81G+QkfFaUSFBXzC8ROgT8t1Y14pbvKfIGOKZ10VpdxjtODJnBLaOYy0yQ9XtlCyvrDIEl97reXmS4M38UyYYu3zIUGQWvFQFh7qPE4I0oxzqrS4DrSnOu+25Acbdd7IHY03j52+QFP3b7l/UCmj8+gVO8XEM2m8gVgkB3YdYhkSeATqaNNWfslhosaevs0Q1ow/7iH03UkyVJ3BS+qVSwVvUDYjVQvSk7dXVcM4cSnFIIDMVhVfc78vySzBIv3qlUBdf00rcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tCI94e/hrv5EZhlMZWiSlM8XB0VQ6pQ/471GNxoxYg=;
 b=JHW+wF37EWnSdGvGLkBkuQS8C/jQeEla99MnfrSiqorNbCWgfZiKsfI1fUVZ4DxQg/g+dn1COHns+tzP9VVWiDq3SGdp1LyjxLmuZX7mpdn4iRApN278WvAuTdPAtYpiyeAwhMNEVNucOASCs5gH50o9Uqm0KwMTFN+Y6YWzhuJtpa4LbdWwDnFMGSWLwSQpa08mXrntRMH2lou35subE+MtxNRtimqHPjiQhXn9IGShcjj3i00oZV3W/v+yCIUrbHo537+QDWSByoeKGEQjU7tzuJyHO9+50bJISMC6rfFZERP+lNbbJWhQudVUNHPp6ILy2LfPEWmcEfzit215Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tCI94e/hrv5EZhlMZWiSlM8XB0VQ6pQ/471GNxoxYg=;
 b=HRstRfEpcdG/xUA6WegbMMtl92rWpnowMsp6sRB09JrRICatF7JICoX22CSsIJnxGrKE+FTJz772jSWLFzVOKIZFlO8oZRHr427xrINpBUvQHWjBbmUmZag/seoDy7MC8aAQyDuvwIfAd3363RUaT4iehV7B3vxbZIm/UvNL9nt7en0pfwD4FPINTManmKFR9x3Z9Qvo/pu0TrL+V8wCz+z1W1oE8Y3Dwdb25zuuHfKx2nHP0yzKUFi+S3iAYEWa2cvmyWcfen6kBavwYe1w5IZAsCl1w2iE6eXuxQP2cTgQeOauRhfXfW1h6gHjhbqA0U6WJ5uMgmLpYrQ6JzE1Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by MRWPR04MB12354.eurprd04.prod.outlook.com (2603:10a6:501:81::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 10:13:17 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 10:13:17 +0000
From: Robby Cai <robby.cai@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com
Subject: [PATCH 0/2] Fix active-low handling of MIPI CSI resets on i.MX8MQ
Date: Tue, 31 Mar 2026 18:13:29 +0800
Message-Id: <20260331101331.1405588-1-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0094.apcprd03.prod.outlook.com
 (2603:1096:4:7c::22) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|MRWPR04MB12354:EE_
X-MS-Office365-Filtering-Correlation-Id: 44316c6f-e435-4cb4-29df-08de8f0e2077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	js8TTHnr6vZn8boiOTMy7cVnh5GQHXj48Zx5jNhGQALAcVM3pCLkMsNOlDDlAYGdG4kUc3qANDsyJMlFdhM/gh3AUGpzYIOU/xanFugFz+THCCkTOijsGwclbIgozegpu0HNteckCm/zBgUfRnrCZfJEABQrZbmYYB9uspD2/8bHHkGl/dpsT+WexQYOfYmlH0N7Epn8jQ3xkKBo3jGehcdHlc3+m2upA5AttZ0YxHtN0CVbo0CLs0DscH1VeZ2InzVPpheLX9mhg3q12r8g+uEAhfl3UPwZ529zZWbUMvzlXsVPQcKbRLF/NrstzshsNgBJZWmKthStEyzUv5OH+27yZ0jmjCnZQPURj00YcMVcfJuTW7vowkbd9GEu9XtfQrOEBpX7vtRiSAdINHpsDqQfNCd3rvsJ7e86OHjjM7YBBu68Yao08zbcsMojuzAkOvUMpIVQZPS8kezamNHBO4q7J4aNzUfMhuFBHWL2BaCCTsM/30szKg5GzpJJquwSdhiqn/na9w0LowreYdhwM3kkgKX6AmGd0DKncVI0gA9uvA0Zc/xeeaTL49FyrCwcugPHnOh9Gxco6h2MiKyO5fBEhXTriEdY1s+poMPFnXrwhM9JBfu91anUX6J7UfZrHDdBeN0cjclIbkh2+xYlmFll24gwb8QAI1VWw1Xk9OyELM13pnOHknR5x6czNBNhJovoRQL1uU2M+rsg/Du+CP7+NcyoLQ7sdRAmdbOGGAWIr9wubE1bCAr9ywZC2XVk5PDZ9m+hLH5GZsIbwjgFrhs7bkgZ7+6PBsJVTJqdhhI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?idAnuLPLq9mf0O9moLo4CBLoSVR6LbNvBBdITa4kq0XgY5YKDao15U2PxsPi?=
 =?us-ascii?Q?tjtEJGAjltcI2FUofC2k0aW61lnwZ7ggNX6MeEm21+3oRISlWW5EkdcU3FBs?=
 =?us-ascii?Q?LauGSM5nJgGHL6Z92U0IgZT8Xsl5oefZE95kqfld37HqNi763eRtpEOUjumH?=
 =?us-ascii?Q?MaHruHliKjFM7q2JRpeQr7QOg/JgrkVI9t/nZ+EBk96i+5Bk/KBRpOdjKUHC?=
 =?us-ascii?Q?Aq7d1662Njt9YfOpexkJyFN9+8bCDIoeJQRaI3DB59P1Hqm8CzEjV1Ohn3Pm?=
 =?us-ascii?Q?BuEqbVUXW6iAaV8UP85VbPPO+mQM6Fs0yUOjcrPTlOtAJfLbyjO2hTfZQInr?=
 =?us-ascii?Q?rZmrm+HuaMwXMDJgpy8oA45fyhITI5JKL5z+6B0ik1Tl8b5DzCRtOeBShM1N?=
 =?us-ascii?Q?yKexvpPGrgbHZyP44K+kOL2/P9vDgBPQIZ74rAxS+gYDUFYcFREKl1fNFi+l?=
 =?us-ascii?Q?J3QYYV3DWjpghY4+aPQDZRADvb/G+yK73kLGTqW65erqf9aeb1qht3UaRGaj?=
 =?us-ascii?Q?VsIja2q9wJGVswGctJ/O65XpJ/cVnRjrK1Ks8O1rWAlpObJ1co7ri6IXhf+3?=
 =?us-ascii?Q?6NDUi48deNAw6vVWsfU6PT1MIpsbK/YUTO0iAB/fjcUm2r24Opv6h65CN7xP?=
 =?us-ascii?Q?BttkQP2Vc+t9hzpVi9sQHCOPYVNFNPW58OmPmXUFRpoBZd7zgD5gQK5kUuet?=
 =?us-ascii?Q?O5OWk+zXqEr8nHF/fE89jDS0RJkIk7FnncOqMbmxnU76ia4kfoxYqGS/NNP7?=
 =?us-ascii?Q?/8ngcCIiI8XvHNdMlrLncjsytW06P447LJBhHxLJQgWAPyRB09n9c7sp2O7N?=
 =?us-ascii?Q?N4B4lYHrd0YuNu8uPt7z5P+sNUBuWAfwEVJJbmPn9O1pOi9hnRFB5ywYcBvt?=
 =?us-ascii?Q?sQ0dPPbohRKj6T7SAPKbiHTm0CYAhCvtl8cLagrb6z3Z521f8JXcv9+FXhMI?=
 =?us-ascii?Q?yeDWM7dQTIpZttQX2RgJnq7HTGcg+kkmR5pmqzAXvyLDSDJB8nmQi7EayFMc?=
 =?us-ascii?Q?hacZbhfx7lEZICsTc7vDQOmRJ+Q3X0dlCxFwSVGD7E0RiVsU2i8PvJ5xv2MD?=
 =?us-ascii?Q?S5gHwQ/u5pHCVLl8QYf8NO0TDuasFbEOOyvMQ67oYcPjwixTgf18pJ0JoYXj?=
 =?us-ascii?Q?R0A7EpFK8maUivqwfcmpy90ZjO0iSeJzsrSz4tRfyg/d6a6sSVd/ENJSP44L?=
 =?us-ascii?Q?YXQTPGSWIel3b4d5ujLlSnFHo01OUgrDpSL4S7AtvBgfCPX0I0F8zQHIgCeW?=
 =?us-ascii?Q?/Ihjz80Cvp6vaHhDjnTPRcCOuHJ8EuMpSbUS/mabtwbbwcYmPG7RMsSY/W3o?=
 =?us-ascii?Q?tHnS11zAACNMt+AYSfKmepk++McCB2WEbJsdR7HN4l5+dQ9TX63vro7YWOZ5?=
 =?us-ascii?Q?RPe1iTaKPWEenRSuEfuDOTbNAii3XXlX0OpAbph+0rc6LS9M08uVxCUzQ2AT?=
 =?us-ascii?Q?Le5Iz1v4QfFff7hmlvB0oQXZ7WamZ7EmRh36/ekDW4dDfO0I+yPTarKkV2Oh?=
 =?us-ascii?Q?u35WeUq25Q/WxrBxeZs8mO+brbx7veA7f5HStH/TofW619ezHHzIoyo0jMV8?=
 =?us-ascii?Q?JTFnmEsdmJzhubX3AsUjFnmGxm3CyVzeYY7JxawQzsBVgZQBbpsFDOOwhNEE?=
 =?us-ascii?Q?rnWWssOG/wN3JVRpIgn+5P+NRsPd8/jpx/gNIW2bLfyc6J2QnLQWaiOusHiS?=
 =?us-ascii?Q?+5WgZA48ndwMpCrzET0gdnmJdkhrBwMw5ZjzFyj7iVYh0d0Mia/z0vvM8762?=
 =?us-ascii?Q?fo0j/rfkKg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44316c6f-e435-4cb4-29df-08de8f0e2077
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 10:13:17.3169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xGHv32BNQnin3olW5kLavuHWETvqNid7u1ed1ozTZ1PbHOfEMvDtVb38au4KRhCvS5vFK36XvzhkrZC5Lm9eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12354

Hi all,

This series updates the Device Tree bindings and reset controller driver
to correctly reflect the active-low polarity of the MIPI CSI reset lines
on i.MX8MQ.

The MIPI CSI reset signals are active-low, but the original reset
identifiers and driver implementation did not clearly indicate or handle
this polarity. Patch 1 updates the DT binding header to add *_RESET_N
variants for the MIPI CSI reset definitions, while keeping the old names
temporarily for DT ABI compatibility. Patch 2 updates the imx7 reset
controller driver to correctly treat these resets as active-low.



Thanks,
Robby

Robby Cai (2):
  dt-bindings: reset: imx8mq: Add _N suffix to
    IMX8MQ_RESET_MIPI_CSI*_RESET
  reset: imx7: Fix handling of MIPI CSI resets on i.MX8MQ

 drivers/reset/reset-imx7.c               | 18 ++++++++++++------
 include/dt-bindings/reset/imx8mq-reset.h | 18 ++++++++++++------
 2 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.37.1

