Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272243451AB
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142460; cv=fail; b=lB8VkP0xkBTmRArB6U2aUXXaLEPcCXPe0dWfbvXdaByyPCf3pnOK0k3mbAvwe67Cwa84/81mEbPAyrfUx1jinmz5fWqIrqPtwqUpLvWWro6tvlOH5lYirezKdFiu0SCpOel8rsqjfXKi9ONzWeQ51R/+Txsuob8FGubS3NKQ+Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142460; c=relaxed/simple;
	bh=iv7f+8NZz2EFNpu9IPj1uWZNieIdVqSf6siyXC7+WO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SkCvoWSbQETQHbug0XmZadc6du4mGO8VzkdTQjeJsoZPVT7jtQoYQF5Q700MwvtKt0XB16b8qUdYL6nHQyFWslwOAYMR5dVzhM0k/MPYUPxr0yP9fGSVzCei6QK5gYvyilE5UIYON0hd/kiJiDXR2RyVv/ekdPUZbktlFz1GM+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eM4OeKY1; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eM4OeKY1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ON+jF5Z4ejP3UXd6fOr/UskpN7Noz2qAteUh4yxE4QCBFxSG0yGxAyYb2WElcwq+IpWUR51xur8pWmdzYlY/F+zXZ2BZ07wSYSsPubOIl5+uflLBQokmdhlSlv6eVxgmXJt87BU5sB9TYH+Qc5dTHO+QS36hqMyf4FWUnNIK8CWqUIk9ErUY03V8Joc0t6n0raFYIo/ExiGZGutT854qQnJQxk/88/SEXRjq2xWNNqz88FkuT+aDq9ztYQ0HtzbZfrCqzjJcW7vmel5yBEyysQhg0VZvsH9kMHl1sTikelcvK3W7z2Eo0OVaUW9hzI5fCAFKhDEBb0ZiUZ/9ZgOhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8s6z/fy+Z4IdAZdxkHEajEVotv7AjlW0lKpBPr8XPc=;
 b=l/RXLronXIulxdbv2paoV1+1kOWlPsOaazCesn9RfpE1N4rA4ZMM+yV7iOhDLT8vetEjr9kC8vNUIeumAaRl+FJ5ofTAR0MKhlmJcaKnQiG08VK9E8h5kaTMj4QSkICxfwMYtTYBDD4ayTurpKPMuqB/WR7vS9uF2Xj5+vN7I3tVXzERy9u3iOICY6psnLHXlZRKVLpTkX1Iv/Ed9QJbbTpOK74Lv28F046y/FgkNZEThFaiw9YfYSAGZWe4HFdc7xPsJGOLavQh1IOTyWBiHI5+KKEaZoxe8zQ7HLaigumWxGcwRYxzgtiRVZdL38UI3ZuRD101I3nQ1eLCLhzchw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8s6z/fy+Z4IdAZdxkHEajEVotv7AjlW0lKpBPr8XPc=;
 b=eM4OeKY1BuFv1EYtXs4owmVvIDDQFKLpNAFTeZY4QgfA8Ku8am0Pxdi9Eyeh2vBfywKAuR/9vp9TaR/7WDRQ1LhCXrNdtK+YrPRG8wgAPRJPXwWk0w8pIsqncMhzekhvgvVAc/Cdmw2F7gyCglXD290Hd0RXoGOyasqAIJtPukIquM/7A35l319l86Vh0NgV/zXN9VLM+uhXqAcxcpz7e+qqCsNYw2YGNLA8bnkX1dqqnAalk3ZqLMS78P8k70Q55VwcG42s+vBxyjoHjpwqrVzepWnnoPPX3JZ4Q4PpSqW6mcM4376ftnGCdKkIBQSXQk6/2LN7wEBsZS39XSqq9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 17:47:34 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 17:47:34 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 3/5] ARM: dts: lpc3250-phy3250: add at25 required properties
Date: Fri, 14 Nov 2025 12:47:10 -0500
Message-Id: <20251114174712.1206027-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114174712.1206027-1-Frank.Li@nxp.com>
References: <20251114174712.1206027-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV2PR04MB12102:EE_
X-MS-Office365-Filtering-Correlation-Id: b788eca7-9a81-4367-990a-08de23a5e41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aEP5E+5k8ya9nYeHbSNmJOx+tu+83mc/2B61b9ZbvdGmdlCEC5GJTUCgs4AX?=
 =?us-ascii?Q?29dsHouZxyQeFqsBbeoC+Gzne3DKBToTSCmvnEqLXDiw+sMJvyDRpvEi0P8+?=
 =?us-ascii?Q?7eTr5udOF7mO4yZuzR3BB3q236pFAAA+Tp8Qjrms3AcFugErGC+5nc+IcTB3?=
 =?us-ascii?Q?+HUcda2OLsNybigTGm+bkW2WWDL3MXy0uh/WTddPj0HUITqbfFLXZiD502Rg?=
 =?us-ascii?Q?/FleWUk4oMdjZeDwo6j6deETo0GA37MJsJ/NcmbC6uqoaX7JwS1d3EthfPJt?=
 =?us-ascii?Q?2RMgeDurZ1gTPmG0lQvkUElENusLJpvtmFQ9+4rPZUKO0Ju8f1vzqR8QeIZp?=
 =?us-ascii?Q?UgZxqYpkpPuyoXeo45iZC+VTv/x6Q8jY7DeV/K8OspjK9hDZ+7v1tcv9wzri?=
 =?us-ascii?Q?71S374jrrfnOdJhfsm1S/PyPI2nDhWawH99IoPJx56gM9JAxnB3vT9lxmhK8?=
 =?us-ascii?Q?M1POq+BCHjruOIVwcNBxOEY5h9enL35zNNUw5E5JADGbxWXfzzo4mVu7bOsE?=
 =?us-ascii?Q?+FAxNtpWr3vcWc5EHGwTDIzew703paWqH2CQ4h76V52/nYT26cvwqai+cRgS?=
 =?us-ascii?Q?54vXQpzOm6VrG9tjPUWe3KXa718dG4bghau87GZgFQHeBkE5LALN6M253x9B?=
 =?us-ascii?Q?XaQztphsfRW2WrEllzcojJEEbIRJHZtQFbtF/eVEvDKEIzPz8MfOjXeyTpoI?=
 =?us-ascii?Q?i16huMsT4SHWYgIhJc55lM3jH6Iq6ekVAIyt/SGDDgQIqgcrwe2A+JcLfNuD?=
 =?us-ascii?Q?VjSxrycY0HHmF/ex9vx1cu6ibDIVpRu1voUhdPrSLMuE5PSSJ36hJ3JwgGnb?=
 =?us-ascii?Q?5zQLrdKM0Lgl1FxkqgWtPcrxscw9WzWRBpS8QmxhNmPzIU5k+zO5o2knokP/?=
 =?us-ascii?Q?tnncdIddM62+lFOO4h2J5jVvLvKZ9VCbOKMvbyZIhG9LXVf9Ibvw27p1bLMR?=
 =?us-ascii?Q?IH3o457B+G0BtzBfVR97sWS1y8FRaaw0G24as16aVE4YLryqdqDFv5fKjInf?=
 =?us-ascii?Q?TC4bkssqW4kcbdsj5orwWCe2YGV3iFJsjdxVs6pJzYt1w4L+1EOX6ROAbUUy?=
 =?us-ascii?Q?ISp0R3wx+ed2pNULO5axYqEj8HYmrUcCCMTdwJ/+m0FdOkqN1X/NxU7fWvfT?=
 =?us-ascii?Q?Hwn/FvwY0FZrNnHyzQ5lHxcFibKM4vXhWV8JSUuA10Sh+H1KStVzyxb4FRul?=
 =?us-ascii?Q?nADcgPTyrXok2ZPQCj2a9HFPgIzWhxt9LXkE2aYBtqK3PPZCBL/Dg/MfjzNq?=
 =?us-ascii?Q?LHDWBnV2jNxn7V40rTBzJ5b4Aw8E3nFCDAg/tG7iBoIMHLl6f/xR54QVhQsZ?=
 =?us-ascii?Q?5eRirTQL2MiqyB1C0Kn9k2gW/AMvbAinBfvXoYrRa1/wCjSRDW9ep7vnYM37?=
 =?us-ascii?Q?ELaXzUKKGPeC5Gl60lledCPwIe2eWjhqTGxNmrReU7b6M88lLLb0NOMZLeHj?=
 =?us-ascii?Q?kVkW4zs3QZIAS91hQ0ySi8lG3KcOnh1fnyHETIqbg8HQiics70I8DgNXRzL9?=
 =?us-ascii?Q?g87awaef9mlHdLakRPbDajVVu3Wp8C+pYuSL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pm7HIzoa9Sdm4jxgk9Lp4quJRcxesryX8e1X1QrHZPrKtaYbKp8sHTCL6TVS?=
 =?us-ascii?Q?6KeKvaO4v2JdwNyeQi4fjlhhT0MzSOBLe4FWVHQ/wfH69oWrkb6ZlKqJTISc?=
 =?us-ascii?Q?qaxxIXTtmcCOomBl2RuZG+81VEFjnklUjPKawdcMuQru++dQagCidt0PXEbr?=
 =?us-ascii?Q?Z7kUfGfzPZC1X6DYRhgR98zfX068o2s04MTvNl4Xs9w3xgiGeTydg+/IGuAs?=
 =?us-ascii?Q?EJ1NPYn1yTBzwFsmgViegJfN/RVnRM5fHPYgt0/zo8VProm5yLNfYsZr8d44?=
 =?us-ascii?Q?Gy0U6ai+aV0oO98EbXaB+RD1SH6aFmTn+v4IpDvYbLCeZdintmVTgffTeTDz?=
 =?us-ascii?Q?BypHdc5ki5UFgtGS5oUi8XGFoacyzHBy/WCv9nAK1TvLWS3+8AmOV6su0t2c?=
 =?us-ascii?Q?yiJ/tBeIuqY4oViJsXfNcoSafvUvT5xS5LYCTho5aqHQ2uApnpSMOixquVFU?=
 =?us-ascii?Q?CX6i4qO0CV5nJ4FSW0RfZ4j/Ei9nvjxC+C8dIxcrrB6LUd/KbCubXS8B/EwA?=
 =?us-ascii?Q?l55y4Gzeh6KcIHog4+bfOy+38V7cUPmpe1rjsnL+4U8/je6PkZBQEe5TcHY4?=
 =?us-ascii?Q?msZ9jSVtqnwZs9bKKktIXru/eaavhSJJHZ7eCTQL/9r2kw3+BDOO3mVvURho?=
 =?us-ascii?Q?c84KLLRX3GZGt3fPxRoW4i6I4GOU4ns5e2rzpJJpn3D3M0ie7EAZkPqeE2s7?=
 =?us-ascii?Q?IEBU8OGzg27LrLk52dlGHF07Tn9CCtgtbfLUDnJ92NicwFojLFRmXLmOypPm?=
 =?us-ascii?Q?R51AVwQNcHcUqAWMjInJcV/SK8R5v4SfSJomVq8u1WelT0aTvGUCqwEnE2uc?=
 =?us-ascii?Q?lHr1N/2Z2nSWS7jah4KQBNUN01Shns1aOhKAdE2++jibjRwqVNsOMwVmG3zG?=
 =?us-ascii?Q?l7DCixtp98BTwpXyJ6B6XDb20yYGHxN78RtbP3EnD2V9H+Kjv5v3yqetyDAI?=
 =?us-ascii?Q?IeSn8ETX0Zwb+TBvepeCAVQFesFpaXRRvozQZtpk8OYflpnhrRsQnowb3z1r?=
 =?us-ascii?Q?AFNfxL9OGPdWwfZPEtFIcyngNv9w7vutxovg3uNTcnN8qZE/Oo+7uddioHWq?=
 =?us-ascii?Q?Br1AxWJRfwKEzS+5+g3I6KHtx1MsDD1Xzq81hCgUn2AT7cKN5kbCbrkUvc9D?=
 =?us-ascii?Q?PHozAZVW2u0TA5IMQhb3IE0OmneC/r3VYnOfZz1gQ/FYxRLDu9pk3YIDy0Ly?=
 =?us-ascii?Q?LlnRvMhJfwQiggtqRqaqGWWcR4NJuxtYGaLnopQc3C+49NwRkxyQDVnq94yR?=
 =?us-ascii?Q?leBYsH/+3SLoJNjOqVJxxH5bHUBh58E8XbhjOYbydmJlVyDpF5xMj5OE1Z3p?=
 =?us-ascii?Q?okkwJiBFWL2UIfGjiLF4z9LevF4uBqWHutgaaGqgEKmqF2J5rUSsp728ABg6?=
 =?us-ascii?Q?gabGWqFg90uALuGP35MzNiEZksnxZJZTdAo1HHIQezpO78OJQXzDD8GcbKsY?=
 =?us-ascii?Q?m/nPmWGGmYxRVtz9mryAyRlYFvvNtxsXmQx6oHFduKypcblFmp9vL/jfahGM?=
 =?us-ascii?Q?TpUMtGn2Ll7wtruo1gIWYKsYQjQPUGwbFUaecs6TySQeAr9eNtg9mQBHarIW?=
 =?us-ascii?Q?DFHAwSz5dnclK0YUnsPe46z7F+34TVtoP3qwpoP3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b788eca7-9a81-4367-990a-08de23a5e41f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:47:33.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCHAIl340AVyDgjgofwcb/RL7rfsuH+TCNZEcbmv3eSPjJq5voyfVzUSCl354C8xhGP6zHo1VPxUE8rxzvbd1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12102

Add at25 required properties (size, address-width and pagesize), which
duplicate deprecated properties.

Fix below CHECK_DTB warning:
  arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): 'pagesize' is a required property
  arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: at25@0 (atmel,at25): $nodename: 'anyOf' conditional failed, one must be fixed:

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- move node name change to new patch
---
 arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
index 21a6d0bca1e8a..732d590f6cfdf 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dts
@@ -216,6 +216,10 @@ eeprom: at25@0 {
 		at25,byte-len = <0x8000>;
 		at25,addr-mode = <2>;
 		at25,page-size = <64>;
+
+		size = <0x8000>;
+		address-width = <16>;
+		pagesize = <64>;
 	};
 };
 
-- 
2.34.1

