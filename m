Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7311A6805
	for <imx@lists.linux.dev>; Sat,  4 Apr 2026 00:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261993; cv=fail; b=aG+/vFwKw3mkgHJ9KftE9Xq4whz169KwHtLS41TSP0t54GMYIvRE/pRoVLT9ookC9DdQYxnTtYQlA3rsgL3/Wf0s+ZLPc7xhukQxpEO33udmPwaGhHLMiGYlo9mZuzicoDWt5NF1GvEr/ZtJnJlpGisY5744RcGwWWPV7pbw1oQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261993; c=relaxed/simple;
	bh=2rCSIJpmm4WDNUC5t1dCOBgyi42i8DUdrtrjcJC7hGU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RDSuOJLERCpoUdPr3cMk5Klm+SHByoQgHz5/+enZPLEwNLyLqByDNuv9a/U9Gj1kkAHWx1RsozFJY6997CRV2RCyepuvFRkM7VOfOTXGhaIFbNEuAIzOIMlruluEBO36oTH1vjGVkWcHcbbWBbgSNKwCydNkTj5TAvvvVup26hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kwArTCg7; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kwArTCg7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qn7wd/FRLtYmRsSRtTZ0VV/Kjee3aek4OJvANZO3+n83ZPkAaw83orJxgEYbSC1XpJO8VbwrQGfQz4/J4OjNOBFxYriF2xZtNFLmDW7kHYor5WaYGk0dhglirLUQCh7WdRr+h1g7JzuDcywYsiimRhcUE4sB7wtByMG0bfKfstZpsdPeQwiygStRpQWkxg0/qCVJCeFtIATxLCeh8LQY+SzIYTjQufBSYPn6QdDyomo5C8k4FSAmG0q8aUYFZW9r6UCmeC8Hxeho6sl7eccM2VRKH+rDyjcIWUwboSGkddiJy2flEUaZJAJ1ZWE8ogmJsMqRaFsF+wZJP27F9MHPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6V3t/OUWiJRjB9NrqMbJJ/G7Io4Z88p22giKYGp/X8=;
 b=olmaVQpwPmQsswKgNuuMvyGzMwKQiyHa1/7WkzezLckjZuAlvJK/MryAlID1WBtSHkhT4q7ijKM/3yyVNFCeNJTfTF2J29ig3FVRNuCBs5x0F7E1dEzwJ3AJ5xIlAwA8ItxOuBppNiQjnRoTnYI85xwoP4/QxwETwCOMoHZl24IffZ5h62LChbbOQxx1T61e64aeJKkuOnJ99pS/P1Ynjdz+VBV1y+pyuBrPFCyAqtadzewQi9uW7Stjnay0QuMyrekTdU7P8wJ5FH18zcrGTZBC9ahzOUYoYAY7swHLyYC7JFB3cH4I3RzsPTu7pX3y08rZFv7tf25kvPiDzQlrpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6V3t/OUWiJRjB9NrqMbJJ/G7Io4Z88p22giKYGp/X8=;
 b=kwArTCg7B/ULkxntFG8h29QZo0ZpwFDSOMREvANddxWet5S2I7B6h3Uo7nlrtEr1i3AuwJajd7Si5JvIfHfCnNUFa0jcgynz/YSCg9yH+EaIATsfsdiPemhGd/2I/ohhLuKlVnuITNROzMYdCUKYl9MpGq3bf/FWAWN2HvfzkrHeMGECiJeHAXjKbjPkHCdsx0Yedgwa6KPj25N6zCuHYeNPbFySgVzgRDQT9bNarosby9KW7B7r1zoRKcqtZH7jPsooQnWotF+o/QfxmEk36Y32rYwxX9WdYyDrORpDHq/TvOzlf3UauFnJ/177ObyhajEongXuBA5FVz8kbWrKuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9321.eurprd04.prod.outlook.com (2603:10a6:10:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 4 Apr
 2026 00:19:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Sat, 4 Apr 2026
 00:19:48 +0000
From: Frank Li <Frank.Li@nxp.com>
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 7.0 round 2
Date: Fri,  3 Apr 2026 20:18:47 -0400
Message-ID: <20260404001857.3374669-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0148.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9321:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6378f9-05a8-4472-5640-08de91dfe172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Om72nKbFBmz2P5KzdiVqLhRNh/ULP+UFA9l+tKq0nbAoOeEn0K8KymEHgI1I0dMDmOnF5hMBDMnDbRxaUTSDvISHgjISXUqhsXgJo8By+co1eqMfnYEO/HxGCJw9XnHZKIxRbq8Sjc//KidabAZlDMFtWwd2PWbSlHXdqXOH+kBbYFwRLoPvw8PYIQXxffe5O/mWT11rsl9kBUWGZS4fWdOID7A2IQqU4oct0ovGR7kd8us7GLvgUoFcQOU6cfkWXrNhES6mh9ZkbZMmJNt1SpCIhJ1qVp0+u0VmKZtPFdUGEApBfiiAv/+js0jG1LhVQK2W6/2iY/ut8lhCYLgItUQpqrQFOckDhuIuXEttanEDBk+pIE7eXjb+czs++x0W3CDBr3KLhjDQ7+uiwCzYErjTlnSBiXmBPySTIXmP8+wLww5U8fBu0+VZ57/n0zsM6MmT2clbXIxD8NFWjcEOMikvit79USqt+rRyJ7GNxwGnwWUNo8+jfxbrEVBCbVM4kADY+lRjoTwdqvp6b7uqfal589lkRM9sU0vC5zCCeWbnjpMs88NhenQO9iHA98bxSvMS7f2sgGFdANHUA3u2UIqRXBNSpF7TWP3jcvPN1bsK9JdPL69HPFIgPsQIKk1AULlWfFASelK59v2TTnFCbYv5qNxDhPrir5jII9aMzzlOR1Ra41ekhXolk9PyvO7b2CbKkAsroIoaD6nusUrHG35PkkVVZZsXQbGZRopo8YIlBlN1pWnXtwf5J7Xwl3VdQQulAj1b4zeU7d8j2snzNtf/2ihLgAMTGrWX5l+WG6Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uQPdl0sF/pRs4SmBfFKQSbSvQfg7ONaoOj9ZkmOeOocMbfUrlTlDNJ5vGLag?=
 =?us-ascii?Q?Y6VWBjoALLwNvEtwUe4J+4yPq8foEdjr3fzudTx1CajRpddBeg4znkXH4BGB?=
 =?us-ascii?Q?PfWkDtLK1GZVD8hUE6xF7GzyFjmV71zncvkW0RHFKXwia5lI3Arpg3qhBnRr?=
 =?us-ascii?Q?NxQooXqVrHrnccNSvIYkLheoBOMd43Sv/Ev+gQ99rBFdkt9fjHOTZaXIw1VI?=
 =?us-ascii?Q?VhEWy2FWxHfhUxvhEezUUQPoXca3OC4ht1u5+4uuciK+2ipoQ9wk4wjQopYs?=
 =?us-ascii?Q?ZZqweH1kwsM1c/ZHbrf9wy4OeyH2vhEiyxsSfME79TqrErZfuIBZ6CGhmStB?=
 =?us-ascii?Q?xCVqindZUTDKBzaPEG+IzYtdmg46/Jghj4n+BHlWWojTM82RVAH6zdvYO1cJ?=
 =?us-ascii?Q?jtHDWWNp77t32wHF65rSv55+E/kh5GsLc3XIpOVZCJlcLiE5zYq1nKiWmb7H?=
 =?us-ascii?Q?LdfLTNH+fyhN+fc+O2nhJagNj7PeeyuyW/wilaK3Z2krcFFKX3eu73xZBMLW?=
 =?us-ascii?Q?eYyFGwe18ancgIyqa1XLwed+k4ZhTC6UCO4gte0e394o/1eUltlY/RaQfcXu?=
 =?us-ascii?Q?6UnT+8um5EmRJfS/7tbTah5GALa4sMU8bFve3krDYWjdk74BfhczWN/ZtVxk?=
 =?us-ascii?Q?qTuoWR1StNZV+zls66z4Ftx+etB/VSCL+4uZp+CKtCBw6VyJMBpAjcmgNpP6?=
 =?us-ascii?Q?Ev110biZv2Clw+jjwH6atctVnKzIF1S5TzOnuzvFv91w2tUnPeWpMwxL2gwI?=
 =?us-ascii?Q?FPLj4QEQuEidKAvTbjG4HIAF31zMfZ3pRhKq1o/mzeDj5VTZCwaQJwv1pqf0?=
 =?us-ascii?Q?kGvXME2ffGScheEraDyLQPjGySPUYQGfnkYNi3K4zQsOa7bE8H18+e0Pqj2t?=
 =?us-ascii?Q?gi3sXgDSuPfaEbARY7aqWvYCjRcBweuzs/RtI2R4wLlcN/sFT8XGY8ZS/CgV?=
 =?us-ascii?Q?KrGS9dIw0lLOe4xexNml/WhWliiZDsM2JC8F/OvMNhoQIDxTvpV/C3ccW2pL?=
 =?us-ascii?Q?Z2onmfQqGLlYRRoJI1i6N4R0bQQZgOFYswmVc1+kBSi6cxd302bd1NfaAVLg?=
 =?us-ascii?Q?auRFsGA5QCAw1Uj6jIPugBQLTdUD2P8tCns4+khZr3MrTlMDZLCPY9jk+D2s?=
 =?us-ascii?Q?bAvGsWfTU4cXFVdpSCU6omi9f7G6evNazzG7MWooX2mqHNv1rnWg7YnLAv9R?=
 =?us-ascii?Q?CuscgVpydYTmXpfMLMtp5RvPOYBWjLak+Oio+PWGNAWnr2WXGbb7YmPh1xMj?=
 =?us-ascii?Q?v8Jygbyy4ZpU14ThLq5MgdOeXIzBBK0lqcu35QhEthOTO1NXV+px0ksJPiFb?=
 =?us-ascii?Q?TBrayVGKFeTjrlpYuG3DXp8Oe/551JLda0oPLohBR3yUk01yuHWti5CJ06xo?=
 =?us-ascii?Q?iez39Jo3MZwDijONe8KLQ7L95YxaEpfQwaHJCn9qopbcatv3C7YT+WR79xDU?=
 =?us-ascii?Q?nclFu0Fc2ruZxUefG8FIFmD5hvlsuGrmexEaQnzqxtD8rdD40L+tExKA90tj?=
 =?us-ascii?Q?CwH9lVQCRqn8VJ9SKbcgFCiJZen3V4NQXII5WRrWt9LQdmhLOM49SUtvO+xP?=
 =?us-ascii?Q?r8cV6Gu9pR0noyiITLNSH2puoCyHZYzFouETu7znl5D7CFjBuG3OIeczeAU1?=
 =?us-ascii?Q?UgE52ThAoxRhg3W7R4KBjDEJ8fqqNUxjva/zoujtL7/xBgNecRw3aAUrj4t4?=
 =?us-ascii?Q?RLJZOGoqDFumWd77Ueg0iXkzW7FVZ4CBwG/7KYRxv8fCFHcC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6378f9-05a8-4472-5640-08de91dfe172
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 00:19:48.2431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BPS6SOJMDAjJvnSYw1wpfRzPXiC8sUl1o9HgCR1PDiQJnlijrPEfmwDXMZIkbOSbOWReZ0a9Rvxyw0YEJgePw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9321

From: Frank.Li@nxp.com

The following changes since commit 511f76bf1dce5acf8907b65a7d1bc8f7e7c0d637:

  arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-17 23:24:44 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0-2nd

for you to fetch changes up to 42a9f5a16328ed78a88e0498556965b6c6ec515c:

  arm64: dts: imx8mm-tqma8mqml: Correct PAD settings for PMIC_nINT (2026-04-02 22:07:41 -0400)

----------------------------------------------------------------
i.MX fixes for 7.0 2nd round:

- Fixes interrupt storm by adding pull up pinctrl config for pin PMIC_nINT.

----------------------------------------------------------------
Peng Fan (14):
      arm64: dts: imx8mp-debix-model-a: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-debix-som-a: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-navqp: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-icore-mx8mp: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-edm-g: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-aristainetos3a-som-v1: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-nitrogen-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-sr-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-ultra-mach-sbc: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-dhcom-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-data-modul-edm-sbc: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mm-emtop-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mn-tqma8mqnl: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mm-tqma8mqml: Correct PAD settings for PMIC_nINT

 arch/arm64/boot/dts/freescale/imx8mm-emtop-som.dtsi             | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts          | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts                  | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi          | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi                | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts         | 4 ++--
 15 files changed, 18 insertions(+), 18 deletions(-)
