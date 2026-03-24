Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F503659F7
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 05:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330963; cv=fail; b=DxC3EYpLGofQUeVevtwQxVoizSOIobvk/pzBL5l4Pp8WPAfGjfaValbCKZVG1dMXYEoFq3YokgAMkWb1gT44SiO5MGJFy7mRoWKHm19guqzuPbVAdUNDJVQ9YJBaa7s9mwmK3Ddr5aNQLc123yyk2g7mXYpc1FXnKI/r9w4sNR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330963; c=relaxed/simple;
	bh=h5IYIkJTiw80yB7znawqVzcqpoJxvgrojEBuHX2X/fE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=PJ/h6/AYCTyVLQFAwdPxKcnzx7jcRmtKsdoHn7Uw7iepzqNcueJPmb53uXogpOfWyzJ4cbyJo2QVw0Is2EGxnDYLMP83hbsytjAbv6G8F+bVRPh/b3pqreV1UReI3mvW1F+IpP4bmJGOYYukp/3jhzLITY4pu4HwBc2Ug4o5mRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HXq9fTWH; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HXq9fTWH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLMrzJtf9MYw2l0dLUf1rMRFe0Q+w97HqFhVgRIDlk8XI9LJKds1heikFh64pZrY3I3+Gs3/3A2ysuYle3keyiK/XD8Zp/6relR1zyCfwfvOp1gw3wfEF98xyEQJv1ddSFk5ADaHOWWLEh0sKW6WZ7OjV8nUOS62KBgNYyZdjloRbKjpDIzXPuNO6cghY5bNFABavKm2Pi25K5/ZtVrSfWLWObU71iiw3TAI5gfM9RS0KLNYO5CV4BCCpEvDxRvZtb3qA3EJAX8fd4YigfjHRnZl3zog/Yt/vOA9RtUaEi/hs5jR7TNVJpUMnX3ks32LYwC688s28NV0JuP/cfojhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBPqnWWG1t9OxpXaQ4jeYbg/GH5noUi/i5h3IoYvRzI=;
 b=bjOkLOBgxsp97+muTg39dLaS8EygzQTbY6iCqIXG5VWqU0q1d+WIa+n32KOoyQfjp9YMRtLZY6rUcdcqPtj61WSQY/JtE9HQGwNfzp8PvdhmdngkZelOnn/QbQKL1KKEDd8JcAWiDADm4Ut0L+Ohk+EuDlQdR8MbRGiOCJd/9RBqvweKpwOi253yAK7tc2CT0IY+FqagnkLTwSErc7aKq4pRiCWeokPaQPeeZJ6iiJry4l8GPIcw96f4//RMWyWGBR+roB4r2CS6uQEsFyXhBR/AxM7Uf/WW0+imJvENhwpII1TLmONO9pEyezfQ62zmJ5ja8bFDwl7fYPLkugvCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBPqnWWG1t9OxpXaQ4jeYbg/GH5noUi/i5h3IoYvRzI=;
 b=HXq9fTWH38GbFpXHKxeOtLSQJFPnL/7YLzdKjBq5qOVIL8yEa+8MqyLYWtK+Ls1gEAUc8Z78Pj9/vUDYEHcSbiO/kDfzqo9uZGkaTQy7bYUxMLT/gfA28QSXXlgtkrSavIpkQ+YjymEkLYTj/5Npk8gBrY2PxRMz3Am5YY2ntHNZbhPXJAvFsujozR50qV209Qf1OvnPbe4mZAN7kAnJcG8mn2xvLyZt5pUeR+bTa5oJt5SMQWkKpF6X6RywchVXUcP2zYEL8vV/nF3udRpY59cVtMhXHHot70aozA5eLr+ZM+yxBWEM05qJ1yBOlloaVMIbyDNCSMIhj9ijKqHlmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 05:42:40 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:42:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/7] arm64: dts: imx943: various update
Date: Tue, 24 Mar 2026 13:44:06 +0800
Message-Id: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKYkwmkC/12MywqDMBBFf0Wybkoyk0btqv9Rukh0WrPwQSIhR
 fz3RqG0CHdzLpyzsEDeUWDXYmGeogtuHDLgqWBNZ4YXcddmZiBAC5TIXZ9qhbydA4+Sl3SxulI
 KZGNZdiZPT5f23v2RuXNhHv17z0e5vd+SOpTyBEdraqtAVxrtbUjTuRl7tnUi/Lkgji5klzRZo
 y2aCsufu67rB9ZaZ4HkAAAA
X-Change-ID: 20260313-imx943-dts-v1-7e5b684421cb
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>, 
 Joy Zou <joy.zou@nxp.com>, Florin Leotescu <florin.leotescu@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 057eaf2f-1abd-4e5c-cabb-08de89681c6a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	DPBlWIENxcXdrles1Xtqyfx/rmyCaetSKp2RnERFosdYM+RLJm2r+/VUnPqG1W1PGkfbALzBx1IMZXWxjOK8uNLbsMyGwRQ+Mj7FgfO1iflHBC+Shq0hIEdKE6lbjhY4CrlYff3u/sRgu5aD6pWnct484ayn1HX9vlJAolO2lNar5rpsdHjQjCcJSqBzWD4J7mOV6FgtMn2ePReMhfHC2ecO6qKkZU57QS3hsmgvuS4TO/U7izd7Vdaw5QNra+MGUE8R173GWawotA4nTz50f2+6rXbc4z6Q4xaWntQPMvNW4FBnTQrgYFp6VeHzGqP5b/TvMHZF/ZIxN5qvdKSSLqtm7W65LiD+DhuIkvJG+Mz26KZ7aQkYfucN6hoMYiqMnqCmkCSB6u3btrggu+9zbAGo6TdKN2MDxhOJtRdwJCqHjp9rLgBNhFPSP4SaU5p98J3UnUOi3lGkzyev4d01t666c2YsxmUOWZmt2TsOpqFtggJ27SKSkR/RwaQIKfda/LzdlmLwWdGbdy6Og/JEMl1lgkZKWMCsVfropx6nOl6h8Y3gZVITZKlwKAwNqQbBZrNPKfUgNTjfqiTgkYN3PP2p3gj2Sg3uxX1I40EvWatVSYdFjaYZOmtLPl1qGfCi/MqkVdZ+xX7LfPddky5cggsKKQTNHV9AqxVzAe6M9LlMvU2cHFwIJhSXKzo70+YhmLUyVEo0gSPPHUwhaOhHxDJMXeH+2lchGqh7qnREDEKUl380K+1wv8NfKw+pmbG+NPuiFvZvqxik8hAr/1hw0xboH+zc6rd5r34auBu4kQ2QjJOPQOCbZTEvNTseISuQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2lnMjIrS0QyRDNLVEtUK2NUYXBDVlQ2UUNLQStoNlJxMFVYaVU2ankzaHZ2?=
 =?utf-8?B?Qms4WGNEck1JbkpxcXI5YkdzQnlxUlQ2WXBMRlVDbGhKWFVUSDZhbXNLZm9o?=
 =?utf-8?B?ZENCVndmcDdpRmNaUnNrbEgzOXhicEdTM2g4bHgwY3dwb2dpV0VwVHNUTnpm?=
 =?utf-8?B?cmdaVE9VMmVTUkxXbExURXIyNGsxSVR0SnFScWFmRXd6T0ZONUpMU2JXc1Q2?=
 =?utf-8?B?c2F0T2tnUHpadG1JdGkrLzdlMHBjQ3lFOE81MUE3cjVheGRNRi9YQWpxWFR4?=
 =?utf-8?B?RXJObTBnSW5Lend0UVRNaXM0TjNBbzBGYW9EczU2VHR3SGhUUmxSdXNKT2JS?=
 =?utf-8?B?K1dIVG5yNExadGd5Z2tSTkpWMjN2blBvaHg5TmpNZ3c3TWUycE1hVGErbGFH?=
 =?utf-8?B?WG0vZmVjTHU2MDdBRjdJdlNseDlqVDFZZ0tycUNkQWVReWdmWFZNVXppRHFQ?=
 =?utf-8?B?bHV1cnAwUjJQNmZjaEpkcnBNdWZKcmpWbGhOMjFmSndyWVpKOGZOME9IVmhJ?=
 =?utf-8?B?cUFPaHRnOTdobitsZVg4ZGw2VzJxVi9SZERISDhMeWhJbHVFWnV2bk9Kd2dl?=
 =?utf-8?B?aEowQXFlTGhoM3JBRWlWQ1NnM1FNZEk4blZrSWJRNlhRRzZ3L3ZiUXBLdnJD?=
 =?utf-8?B?RDlMcFpnZVJ1Y2t4cDNrZThCeVg4S1RwVzRFRWVLbUN2Zy9CRnU2L3NaZWZZ?=
 =?utf-8?B?L1IyTzdIWlNZeGNQUHVqMHhLTFRjUU5NMlI5R01FOTI4ZnYxWVdMTkVVN1Jh?=
 =?utf-8?B?ZHhXL3pyUjdtY0tIbFlrTEJOUTU3TDN1dVRydWtWTm1RbldoY2RiNzlIdmRx?=
 =?utf-8?B?cUM0MWtGM29xNGwzZWdPSDYzVXd2dnlNTU9uVWIyM1pYVHdPc09sUkJ3dkNW?=
 =?utf-8?B?azl5Q1BkbFlQK0w3ZlNZay93ekdJRzlxNnlncGkyTVR6OHgydXNrS2RSQ1A1?=
 =?utf-8?B?OEwyYndTdHIzNFZpaWdITGlITWM1TFl3aU14K0RRRmdUWE1UdzgwMHRVc3oz?=
 =?utf-8?B?YkJ0ZXVVVDBrYjFYblJmY2sxeSs0bVRSQXV3RVhrenNtM2Rqdm5XL0FmQkpp?=
 =?utf-8?B?ZVJRVG81aWJNQmxXQzlKQ1NxcVdsYWhNNEtXUWRMZ08yQWdKTVZweWZ4MlBG?=
 =?utf-8?B?NHhERit2cEVjSDRnYnN4dmxMT3hWN0dQYlZKRmp4VG8wQVVZdkhpMFUxbnNu?=
 =?utf-8?B?citidGNHSWZDSjMwUDluVzFvT0F0U3Fqall4cUtES0pDRWR3REs1V0JMdFFO?=
 =?utf-8?B?VkZzcFlSazhWRDRCTGpQNXJYOHBQSjkvTE01T284SFFWUzVDT0lIckt6YTQw?=
 =?utf-8?B?UUo1SngzYUllaStPdy9WVVdySUcyVEhUZDNUSUJ2Z0grV05JQkdHTUF0NHpl?=
 =?utf-8?B?NG4xM3hJQzlVOUdUZzlCSnJqT2QwVTJGUTd4aDhwczhlaDV2MW43WFY3YnpL?=
 =?utf-8?B?elZQTjlDcHRwSGY1VGNXS2YyWXdxUjc1QTZmaUJHZ0prYzJZRDNLSDFieUs3?=
 =?utf-8?B?VHlPVWEyenpHZGh3dlFmNXphaWloOEsxTk9XaHplRkUvTVJobGhrdFNuUGc3?=
 =?utf-8?B?bm9aOTQyVkEwcEhhWFlnWU13Qkg3U2RzVmxQanFXRVgzYmp3NkdISlQvQlB3?=
 =?utf-8?B?K3RQQmQzdU0yYis1OWNiOTJxcU44U3ptU3pBSjBwNXkyRGpKeG44WW9tanVS?=
 =?utf-8?B?eU4xTHFxRkFwZ0NIMWZKYlhDcUhYVDhQZW41cmtQbEJHNU1OYk5GbXFxaFRY?=
 =?utf-8?B?Tk1mTlM0d3BXVHliM2tXRnN1NUpUZDUyZVM1VTJBSDhjbEVMUW1iSUdzN2xz?=
 =?utf-8?B?NTVFU2dvbG54SUhXd2xqL1lkRjNCMm9nZGJPNXpJY2w3aWNmdVFzOS9GdnN1?=
 =?utf-8?B?ZCtQbEwxeldpWEkrSHBLNEhXVE04OTRjQlljdEsvMHJxWURMREZLbmt2NE5r?=
 =?utf-8?B?TEFmVzFCdUk5SGhadGdRamFrOXBYNmUwRGdoSkNzbUlmZy91clZKT2M1aHky?=
 =?utf-8?B?MG10SUNCek5BYTFubmVpU2lvNEZUOWR5ZXMzSitHOHcxM3ltWkhtZ0NCQmdJ?=
 =?utf-8?B?SHZvYlpTYjRmVVVxc0FyN0VTUGZYbkJUT1RIaE1vVTBEUlVPeEJUUUVLTUxG?=
 =?utf-8?B?MEVSTnBWV1hBMGZnK0VwR0toTVFYcVg0OHFoZmptUlFIWUJEKzVXekIybVdT?=
 =?utf-8?B?aEUwVHdlcFlrOVZnNWJORmlLQXNSZWhmK1kvY0ptNnA0V0kvK2Y2K25PTkly?=
 =?utf-8?B?SDBBa1cwQzJGRk54SXdsODdJaWlRZlc4T2VBNGJ6UTJBYXhYdVVWcU1pNHU4?=
 =?utf-8?B?RlAxem5MT09Lb0wxVmljVm5YMjFDRDh6cGRjVnNuZDNSa3h6Y3B1UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057eaf2f-1abd-4e5c-cabb-08de89681c6a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:42:18.1446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDmVecpnJPACvXtKMLq4w4XgZ+y+46+01Ml/6eakTF0wRaCRfPi3r0MKgHhgWZqn5KuSg83HZkWMvUTVVJ09RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

Update pin header
Add V2X/ELE mailbox nodes, more SCMI nodes, thermal nodes, fan node
Add nxp,ctrl-ids.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Typo fixes in patch 1 and 3
- Link to v2: https://lore.kernel.org/r/20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com

Changes in v2:
- Rename ana to ana-thermal
- Rebased to next-20260319 to resolve conflicts
- Link to v1: https://lore.kernel.org/r/20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com

---
Florin Leotescu (1):
      arm64: dts: imx943-evk: Add fan node and enable active cooling on A55

Joy Zou (1):
      arm64: dts: imx943: Add thermal support

Peng Fan (4):
      arm64: dts: imx94: Add V2X/ELE mailbox nodes
      arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
      arm64: dts: imx943-evk: Add nxp,ctrl-ids for scmi_misc
      arm64: dts: imx943-evk: Add pf09/53 thermal zone

Ranjani Vaidyanathan (1):
      arm64: dts: imx94: Update pin headers

 arch/arm64/boot/dts/freescale/imx94-pinfunc.h |  12 +++
 arch/arm64/boot/dts/freescale/imx94.dtsi      |  56 +++++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts  | 108 ++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  62 +++++++++++++++
 4 files changed, 238 insertions(+)
---
base-commit: 518185e147d184577d14d975642eb4b7add52aef
change-id: 20260313-imx943-dts-v1-7e5b684421cb

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

