Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011042.outbound.protection.outlook.com [40.107.130.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B382BF3DB
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 20:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770065902; cv=fail; b=B97sxHGFDB0slYVBTXksoV7G54Ibu9Ke/z6DNvjKiTzEEm8YDCLTzVT2jaIYxgf8G0ggHzItspusgsZnYVySGL+5LO8REjPdosYbuCWEbCBoz23MXuzNSd7Jjwo5p8JFK6OhvvWMRHxnkiYg+UXkijF1HmtdATYvHgqLLlgm9ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770065902; c=relaxed/simple;
	bh=/V0wLd3xz6CwIKC6waCuHvYtq+ilN7rc4w123O5nHzw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gyOA/3I+KRkPbESD6ElHgiU6XzIGfEPw4bF8M3Xt+d2zgESuU5eHP4yPmLVHu7x4a2WFHs9O6+fFtJK97FWdYWLP7MWqXaL9vPfbjBfTCVjp26Ipd9uj+zXIF8f6Y05berejXRHuFK12lTQv8PYH39JU5dn3zBagzHUXM5aYA8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ku8si33k; arc=fail smtp.client-ip=40.107.130.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ku8si33k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLLHsgF6l34duNXRr+jVtJbbxgJGZwY9bE6/h4kjQnPNz/VoPyy54RnazPL/ljur6DSFGk59EWbKmpliJzmR41AI7Am5VeAfix+TApqdYD8c3t4ZniFHsyd/FPeVo1Mk2h6GoWxE7+0exj/kjt705JetOwTBAJLWfV43pEVzWHNPckdsdHT6HGLjbJzfN3DBsYEEvSv1AdhpSwz4/H3ml4tu0vz80T6vRnONNEyXHmVeMHOaWf3JVWbUpLvAisPQjl8hNlOsSeTwlMZD+f+xojLew8ykFeebgx5DRJ0V1tV6Y7JhSzXSqVNvNZfpFeSqIB9tJPcxN9/vW/9THnhf7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzTtylWhTKI7S/s7a7tXBFKUKRoiGWRMKlhFuDzvao8=;
 b=P5bRtvI1bYBtvlQaJkPBP+ouvWKuq1Txj5FGBLyFAYurQNn5Wjqi4CH3JDkmwLqe7SxBjGz0O8H7/Etlx0hRp1zaMZCGTW5ZbhxyW4a7oXIyUeB+UHu/2uGuE0zmVVibNvfaaLqHgH6tfpK5sHf3l7A3ObaKBHIfXOrlBAcdkbu0l1btVGU7jab5TZMf7dyzo7dhtwCTQ8D+pXYaR/fZXP6H6qxGYQVLDQEArKd6N5IP15u3WjxPPTRpj+qViuFvC43Vh4Df2aS/dFvd8DKSUyXeKKpzUGElD+vlkDcoQN22NA4Cii4JjS8727jpuPwMN6sZtnyircSEYUpTJPM08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzTtylWhTKI7S/s7a7tXBFKUKRoiGWRMKlhFuDzvao8=;
 b=Ku8si33kUiuYJaiSEDEoB0hckKmDlf44wYE9TcTZXXL1ec0n3/l2Ol6mj8wYQXNac3zNeD6K9Ngb+/d9wp90BupoAfdq2D53bLXdh15wsNomJOk4XFkqX4COdl+iGMtEvaBL3EM7HrUB+HAcII5G13uFURO0PfBpDN7GaDSILtKe1VbH1FK/iIqxCtypt6u7f8W1Lx8M4Xfhab6FpS4dRgBNBD3F0H0io3lVnrNUY5hvwzX+lxJVlw9k9NWliBaEkUx3bn+VcZA5C8+05XX75GgeH7RG7ftilpIt/L8YdwasLU3rhTzhzLQaem1vQJd3WuZG7Smaw8+No89UcY2bEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB9737.eurprd04.prod.outlook.com (2603:10a6:800:1dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 20:58:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 20:58:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jai Luthra <jai.luthra@linux.dev>,
	linux-sound@vger.kernel.org (open list:TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] ASoC: dt-bindings: ti,tlv320aic3x: Add compatible string ti,tlv320aic23
Date: Mon,  2 Feb 2026 15:57:57 -0500
Message-Id: <20260202205758.3044617-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:a03:114::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: ba72c29f-e892-401f-d4e8-08de629dc9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t/xzRUxKqJdpjVYDhI7rI8PHtZ84GAMdu5j1L/f1bR/UGjbh1iA6k4FHQPUU?=
 =?us-ascii?Q?sTOWVlBaIw/2wS6mnQRxYbsblOgrb+BvZQZCuyJlaGqzrau1Y35D5S27/DYw?=
 =?us-ascii?Q?VB2+HCwG7wgD+HJ+290z6gxCKtZXe/OLImyakJ8wER70/vWGfzZVfCwON+Ut?=
 =?us-ascii?Q?uV7pPvYljMU/up0zVhRP8mfrYgXrKASfVOVwr6AWg3tuqesx5wSx2k2Hr8C3?=
 =?us-ascii?Q?f/oc2SmJFpZa1t7OmVze/aodAlvMSO3ZLir1toAk3p3EJAKu+l0k2GVPKPx3?=
 =?us-ascii?Q?3HGZSNqMA0HHmfsiRtEfnaxOnDNLvOXR50gSrOt7w/Ot0dsomF2PROvDggg/?=
 =?us-ascii?Q?NAhYUQGb6EeqQMPQWgddc3EK6aZAPRDXiS+PUWaJHtxEdnueEjDnff2siR6w?=
 =?us-ascii?Q?xw0+sGFHWC6GCJH/MMt4LoJfFClsTWGupsYrSnVYa2ZrZJgJmgEmJm4R9eIV?=
 =?us-ascii?Q?+TnMDarRe4Oh7xywXPxaoBvm5GDBshR/zCfj6elgMSjDCrbByTmfYWkYqaqB?=
 =?us-ascii?Q?f7PUQLzOBzQT+AL53z8dOQqrwabbVZUrnxPdIzxZzbtTwgf2ivSzZhgxYymq?=
 =?us-ascii?Q?lfG61M0AZ5a6HKFeX1rcTXdLzGm1UxYm7+c/h3Tf5+WBaOkaQFhW8u7vMDD9?=
 =?us-ascii?Q?0BfN+xpDdbhI7NTtt3vV4/016I44nCU/krmWc0pMo8EWZjGJ9dPL0m1U3PPS?=
 =?us-ascii?Q?b+ohR68Le785yfWmZakpPVOXV+GxOndTlvnmBpfB8/qGffp9aDsMq2kxsAv8?=
 =?us-ascii?Q?QErTLLmO1OaLkdLWbJ80krukOG6d0m2ulBB831d5/x2QkD9dYOd64U97MBzE?=
 =?us-ascii?Q?D/UPtvy1ShUbR78U3HO6HsqLSopey1iNisXtlo5y59Ff7D9Z2HK8WQr2sHf7?=
 =?us-ascii?Q?MKup2XVk4UvPI65ZfUj2ajDeIxhVT7UZHqfFnf5obn6HYdp437PdAqdcGaJA?=
 =?us-ascii?Q?mQGHev2oM8WHDKMn1Yv+N808FtHrfy8VXN0oY+vt8eIVx+9Gx1rIaZfzpvn8?=
 =?us-ascii?Q?FUCkKoG8hE0kYcoBZqGfi8mjcEXjcXFVSkbNQzsSnFTv+bTnjKgkhHA5F21l?=
 =?us-ascii?Q?QxX2jhv//dm4q4tagsp8Z+1PqHT5q8BqDJHvh3LZyLMtRObAINB0hzmWa6mu?=
 =?us-ascii?Q?+m3aERWtmBizozcq71m0Yi+QCQPPVU5BVu8a552SUw0g1cCFbU6CdS2gS9ZM?=
 =?us-ascii?Q?hsVZdi5oCucU6RX5VBlM6jFl4jfTJ2y5OcJV25Z0OpRG9pcZ6WXGrgcgpqhR?=
 =?us-ascii?Q?UNHX+bSF/mm8edPHBUc4NPYT78Cafs3SN7FAezYZh9UAh5D2aM1n0qy7Vui5?=
 =?us-ascii?Q?+nHvcGA5dZuBl6AVLBqkwUqrWgoGG5J4MvG3RwRDgClW7nNCHMtMaP1cIEED?=
 =?us-ascii?Q?uh2s8CBJy/S/fXEzpbVzMR9hsShSRqNEO5fN8PWAGEzqS0q5E+JIRZb2vLYl?=
 =?us-ascii?Q?uQx1vbZTuSwMOFxqo61bdWZtMVQN1zOsm7tS2Xsc1h6fEKtRja05fruuvo2k?=
 =?us-ascii?Q?lIU7bw2b2nCTMOeBn7WblKuIvxR0BK7JFe/1I2TkC0ChwrjMlBckb6lAyMHA?=
 =?us-ascii?Q?VLwu6rb/KkdKsOXJdAsPNCRMtffz5XO9G48TlF3499lYOam3RIlw/pqq00Fz?=
 =?us-ascii?Q?1PsCpN7M8GCDM/4ozy5F7VLh4MAvgSHA12lCQQl3F2Zk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+p5fayuTK/q9AOxz+4vUAzqf7IHPxe7ExrALbuuu5Gt4FIZ8MKvUM5q7tVaA?=
 =?us-ascii?Q?Qdk6phZr/LIx47OxBfga7osxSzZ10flVuKebKb8phV5NCrdzi0lBL73FNTzy?=
 =?us-ascii?Q?x0a5rtr2cjbf/+NhyZvt/bZtLC3MHdgMY3JpnAa3AYwwnt23NNptps6kmVz6?=
 =?us-ascii?Q?PxnPv6toHrBA/XeEMoIyp5laxtGnGZ7yQSzHrlF3vZ/NlVCWUmRZGbzoWm2X?=
 =?us-ascii?Q?dKa4/2T4hJIg6mG5xEXtNSlHzIDkCnUNaXWl043KV4Er/tz9e4HT4zaPkLWw?=
 =?us-ascii?Q?qQMIIe1lWXshQW/Z13admhUT//sScaybXrnsHCexoqLmtAKd2/3pL7rgNU2v?=
 =?us-ascii?Q?E1AwZ0r+0Ef8r8UUqT7NentSu6IO8ru6W0zkcXOO2CX9g0VugFlzD1k2nu4J?=
 =?us-ascii?Q?PHm0e+PvcCxOh6dM0GtvggV/Jvb6uMRL031EHeID8e6iX+Fu9m+RjvFN7fxE?=
 =?us-ascii?Q?1Noyic1W+a225vas5JG2JqqQdqRljSvuWJD9YAbk8m/Dw8HTnH+v7yH6gkKw?=
 =?us-ascii?Q?Sf3da3k4xqP6CX2G/1v+U5BlIf77M9K2chRS5zZVC5RgM7mUnI7bMcKrdeNh?=
 =?us-ascii?Q?//ygTm9F2UAyfsidc/54PI9auVK6Zd+R0pyK8X6dIYVejZVNafFvzJuSAgA/?=
 =?us-ascii?Q?gLm7vc6ZZNuw+gJVSCT26uw5hwmd2CUU+i4bFGXZgmjcutAQBiUkVmUlO6EE?=
 =?us-ascii?Q?BWPVGoOgmNODlwajstx18kiJblqswwV3tFnQB+DvmaIl/s8aX6hGBcdj3glf?=
 =?us-ascii?Q?wF0RvC8vDEV/RFGSU3Pf57DFyXMYpwG7PWj/VY6pJWWIXrrNtZ6D5liCD6pM?=
 =?us-ascii?Q?L2HdtzChA3TPSPCKzco0PfJVBlf0BDdhKAHk/texzBQHO1PHEucfl5J69D+h?=
 =?us-ascii?Q?5HUSMQes4K7XJsY75jMKuKIsA6HC0LyEKWLZvcPfWld6mWL0lO2wtLoalKw2?=
 =?us-ascii?Q?w3UxkBkB42wZlfUJr0QmwxLf66h+L9y/DGUPMhKwuT+jv1n/M9/FJ+QnSdDO?=
 =?us-ascii?Q?BBVlV4HprAhXCfZtb1VAaZtObndUkxIqNWKknNbkIhosg/6BBSbePvJVAiR1?=
 =?us-ascii?Q?YJl2JJGP/mA9fUJg5htrj4Oc0/LhrGfcm96TsAluRIzuSqg++RCeDya2GpY0?=
 =?us-ascii?Q?GEb7rCp8FvmKLPf85Z+18UDXY2uxJZNRZpWPReuebibBkagLRaPP5gqTzbY3?=
 =?us-ascii?Q?+QigcRplcJlu6uOVH6P9+oLSC+8bmPn/Z1Zs1Eur9lZLj4FnTqkuZowSbUU1?=
 =?us-ascii?Q?N+RyB3/zSCrv9tSvN8L4eBQQKxpr+Hx41rqFywBTrDOA/3bC3kpSCXERtfQU?=
 =?us-ascii?Q?SO+9b7eRwKb2wGxawH9+zLPKf6NCW5h9hLY9Vz7ZkY779Z/0iHfAe9ik5QsM?=
 =?us-ascii?Q?lpY1STqZjQeMTqCQVRZdiRtiaD8MUmWSwpd539qAg4iiLih2tKGTkxhfTTWT?=
 =?us-ascii?Q?QclF0g8nD4jBzNPWSpYzzGv+/Ze4ldxshGQwpZAGc/0JFL0i7x47ERYpKEKZ?=
 =?us-ascii?Q?3CJ7/C/ES2ETb5jdNYYiGmOj20CLJrdHnymfVMkbUd2qWZrY8ifOlEDUhlXO?=
 =?us-ascii?Q?8dA+cosYb0KD12X7/geCemUv0jkEiwrlItTU62MRUZ0/H+Ia8mAT7ZYvbFMt?=
 =?us-ascii?Q?Im8QHYKA93haSx1qxLp8aqWeDG6tTUlk/vACFgxROb2WfPRRMKG8YjpTv4DE?=
 =?us-ascii?Q?VxHHl7T4Fn9pJZC65fQY7Xi1Ohx575ejKIpjdfImsJcPuF15XHCnCowO0+zc?=
 =?us-ascii?Q?f8XTYM/hoQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba72c29f-e892-401f-d4e8-08de629dc9c5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 20:58:17.1928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1RcR8ajI/RzEBNv/AM6FdKVqoVUEbUoAn4UD8uCwtmVluxQ533SoXUPsSCgt0WnpYIbIOpA+OISv4g6dORE7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9737

Add compatible string ti,tlv320aic23 to fix below CHECK_DTB warning:
arch/arm/boot/dts/nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dtb:
    /soc/bus@43f00000/i2c@43f80000/codec@1a: failed to match any schema with compatible: ['ti,tlv320aic23']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
index 206f6d61e362e..50088698adac9 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
@@ -46,6 +46,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - ti,tlv320aic23
       - ti,tlv320aic3x
       - ti,tlv320aic33
       - ti,tlv320aic3007
-- 
2.34.1

