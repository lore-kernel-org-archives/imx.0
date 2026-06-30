Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DBB36F8F0
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 02:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782786599; cv=fail; b=YyK5/s0PQrW+aepj1SNLUlh7TV7YCpPl8tSdlbpkVbKw1NL9RJlEvH1pOQi8ae2skpXrqQtUTcDbPr4OPWd/tWkLgfMWYevYwRYCCEDbGOIVCdSQacjOxlSdZkU7oFViKfaQsOkzF6LTfdh+TGYcx0UX/fzXClnVWTvIWDjetLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782786599; c=relaxed/simple;
	bh=bB6pLQ5DbFQvOXZUMIqASALiv8o/N8wtPRAxQUvijoY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l9CEM8i9LLce6oWgg99IYLfKtRhfvrAFOM65jTGoyh9wOINEBRepHSATFFibWTTPRDOY9WPoNexQ215wN7O00/1NlUcjLEzNh6szTnQqewc2QYeB7YK7ZpGFKM8+cg2wJFHXdX3izORt79j+xORGjf5KBRFePZ0eNFUTlxWRAjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZTUdHisH; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZTUdHisH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDEj21zvHWPLb+BS5CFplc4gOU+UoHJ/nuZh5DSWA9yGrg0vxytRs02olT8NPFSXDOQiP1FNF1701VaXeGJul3ppvlVvqPxDDifpE0i1S54xAhO2hhEmVFrzbzpZRNjbdMYNRC4JZSp0ZKVwipJrMWFLlWcXOvq8ZUjE1ydECzfuidxKK2ZWndPJNlwjtIyfl6mr5JhZy34xSWhP3R/S13IwwuiahEHwhKFRrqX/wpAn7C2DpM3lfmtFo8KFaG9QrpoWf6T93izxI91v+q51noFhzc5ihbBMCpe3gAmG0sESo8go/i4Sa5t2tHnUu6RC6l3Cff7Kg6Aw6sMoqw2/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLhjcB2WqeT5iJksRei1J1Ctm6hA3No6Kvf5FjGA7B8=;
 b=Nd7UNDvKuxEa2du5x/h2JKpaa9pyXcwf9N5PkygkhuoVP/Wu8HIUTf64y/1oXK/g06TRyDNXZx4z8QJpGfMsB8DWcrz41sEb+d3mywhZQ+B/gqR2MIOS3XlADWrTYPz8H/vyMEKCq9Whn0RzTNMcxjDuIIDcMJGDgKWYeGQcdexwoQT3bOCJUgFjCNeBE+PJyY3h7paFDCPXMagT/KxnmtODjUPNJzlyJbsCthw5/M+kHsOHa3uTYFLMZuhTas2+JYKJRKSbo2XvCgqH9WCI86ud6FIWFgdfXlbNNlSwIHz7ETVfqt/Lr3Z8TEgdukxwIOcr69ylkS0Pg+QFUBOBYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLhjcB2WqeT5iJksRei1J1Ctm6hA3No6Kvf5FjGA7B8=;
 b=ZTUdHisHmQWFMexIg6fWipT72q9YcgGSN7xj8JtBEwKVAiiNO9GTHWmIxC9E1iVeDWT1BeDty7EUtnCB6Iu6kY5syOYz0oIHibx1oV2x389rlBNHMJsxPMUOCIfqbAhprvvKIMa/bJFMu46KwSnYsGxWICI2zPs+rlXMBfOUmfathLhI7llIyYbKmTrDh1nA2NPqzWapWD1a0ToFeEFWsAN4ljmJzo1u/N/45/VLZqYPyHi1LhvxlHDwArgvsV9MnDCM5JSjApnglTqvGKy/na0oRpq1XzeZ8Y/RXfcAIylFIX4lkOGrWmmQwc7IlPs5QkCc/2EOEUe45LKNQWWXwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
 by DB9PR04MB11661.eurprd04.prod.outlook.com (2603:10a6:10:60f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 30 Jun
 2026 02:29:52 +0000
Received: from PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d]) by PAXPR04MB8096.eurprd04.prod.outlook.com
 ([fe80::68be:f721:5000:3f2d%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 02:29:52 +0000
From: hongxing.zhu@oss.nxp.com
To: sherry.sun@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v5 2/2] arm64: dts: imx943-evk: Add Root Port node and according properties
Date: Tue, 30 Jun 2026 10:30:06 +0800
Message-Id: <20260630023006.3247578-2-hongxing.zhu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630023006.3247578-1-hongxing.zhu@oss.nxp.com>
References: <20260630023006.3247578-1-hongxing.zhu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8096:EE_|DB9PR04MB11661:EE_
X-MS-Office365-Filtering-Correlation-Id: b5cc84f7-31b0-46cb-682b-08ded64f7746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|19092799006|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	G0tvfrp88R4pwNLCwcn2S8qwBaK1vLRbdtdsOe2dPO72IxaKfC4i2588sFcvLqLbtRsTzs80chBMXK1fD0aWrKZlWZ6HIr56rYDJqohnZ3jk40GGvkUsmxPzbfzGj9CvwG/a3EXp6Cos9aN9gLjk0udh5HQUQzpuJ3qiIq+Yk/SQ1UwrI8AhNLFsnjyEqSAxIvlh2alEbZIlt5+hxMsjSax/0PpPV5cwAAlf1rPByRUu/kPtH+lXh9M+0dOItke/bMoEu7uAQgf28mNFV48YmhzqWz8JEAl8Jp5uzxnTnSpc5lBe3BKRabUbeVLwUA/yJkaDAVjEAWD70KD+HpTHY6g03u45v+nznvRbVJcLPtIjU2aMJn/+3JI+eExgDqYk5fEovPHlBPE6Awm7jd9iW3DJoyLz109ZxhVlz0wC+f7X3jQdhW/k9ds23y2/V3Vp1QVTPcB7objsijtnElczxvu0GM3evfIgoMgttuBmXIZZ1+kR/SQAwdNfHmMHqk/Wnrxg0toNvsVd555KCL0AL0Mw3pbSdo82N8MOd7IUsQQtsl/vECbOUxPShu2aXwjpzwuwcScZa0vhFaJs9RsfzL66KaOlBr6dF1z4ut6S6A6BkRN4BWhzWvYqqDpOUoRTSuMO5QLVMmFp8vOQFxydoQ8x+l1SlV+Bh614YBTa3eU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8096.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(19092799006)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fjEs8Lk4HsMrXvRdt4BP5SU5xPKz6x5DodGsan9VPIlrPAuQoOamfTsEhjF7?=
 =?us-ascii?Q?MK3uOand8KGkW4r663W0AepIiewD2Zz3+KjFK7zLA0fMAe5w4b1LqQU6UZzH?=
 =?us-ascii?Q?ZZIm5jApDD15WdxH9wJmt6xQkrv9MWbrTDslqlRqWSQMZHvH2rtnCTMqmsJf?=
 =?us-ascii?Q?ejOIezU3hx5PNROBiFO/jOTLEUlL5oPJvQgOeB84j9EcQV5i6ATGLYjAd6V4?=
 =?us-ascii?Q?rwmLb5QsPb7pxM0Ge4tpKEoNuNO/gmmx5iTBpFiSBSigzCpzhXpYYQ6uYLey?=
 =?us-ascii?Q?2da2odEthOyl+LLOBPe/9IRCvTZmDe23JHp4H6s5E+PxAfML41P3GQDWsXa7?=
 =?us-ascii?Q?AIa4hT9ZBKqzvAJs5wLrMtXpd0UMVc8Ht8gc6LiYgt1OAJIhuJ2bu1MjAKBb?=
 =?us-ascii?Q?STw2egiDHjn3zujHu09/Kz9KEHeuT922DHu6Z6JlT1fKxOD7OYWdn+kSRj60?=
 =?us-ascii?Q?riti2k9hlsPlw7KgAmadISjyoUznCdDVLyQfaplqQQUgPBSY7Oe9AjK/Xht4?=
 =?us-ascii?Q?j7Cr9PjR+wVHssXlWDCy1wQb2IJs9QsTG0d/QaCgcCcBQN0vMNybnLV7/zOg?=
 =?us-ascii?Q?MnXe1SNNSOfVQCDEsISLJHMUGDXG08jUTPN+Aq4vUv4xEBGzHCYFIBE2Oqw7?=
 =?us-ascii?Q?sTuqHptWkXde3AvxDaJN0Q6TrnCu6xnmkaWCkeH9/u3JzntmWzvD5HbHZTjU?=
 =?us-ascii?Q?Q9mMDjeqzgoNfGtEw90gTyzuDlHtCqymCOcqLRRDIK32Lbk/Ro3QkgVfajl1?=
 =?us-ascii?Q?C401WbZmT42PuziBAosrjByuAOzDAuhsxY5ArLLysUne3i2yHoEy/5nJi5wf?=
 =?us-ascii?Q?m+UUJ17XLgbfRQWAtJLE8FdiIdt+qv+oQACT3tY0wpB11/VKl3JRncFsBQmO?=
 =?us-ascii?Q?+x2BWCxLYI90mbJssLgOy50AJaT4VPhgcnPSm3R4lT889eyDygLf+Q3Ep6IK?=
 =?us-ascii?Q?2bo8WQhPHKREuXV4biDSjsTmLD5hUZUaz1QPvvkUFTMu+xWM8Y4adxmNj3T8?=
 =?us-ascii?Q?yQfWxAGvID/abKa3SoLXbbFNOQqLOxB+Eb81SnHqb/GNj35jv0YCs6zAC5Mh?=
 =?us-ascii?Q?yxJ8wjAvxdCX7j8UGDjH97a84Q37xM2y9l2TnRMtDbf25CpAN2i8fMOzOEEG?=
 =?us-ascii?Q?fYgSHcC1LiQOP2dLqT+O9t37zawJ2KTG/JvSRORX3p4XZYZ0QoHnXjfR+jXP?=
 =?us-ascii?Q?yNEGB3U1QB5Dc2GrQSGNp+8VPKjliEY+FMxGRlHV72EGpXs297zDyGPNI9jC?=
 =?us-ascii?Q?kyg4vgF1H/byBYRyzfhRFmW+HF/dvco55KWkkcBN/EP/Gqx3JveU1CYkuLPZ?=
 =?us-ascii?Q?vYV++3XZchyiLHuaIlea9Nv7t+h5VWJG9Ugpl4JHwGsbqLuwOmjCwthLeX2m?=
 =?us-ascii?Q?7IWvMOscRbEi3fCM+yNVjmo7yFPw0unGohszg/7CZBHjzQJUOh69pEwxGVsT?=
 =?us-ascii?Q?3m6xjBVxK7QhGbBKHef3ymv0QRBmicsSCM8R1vYJ5IVFPxNKthfp3Yo4i3yT?=
 =?us-ascii?Q?/xXaqzVZrPWGmNfCdO2EmYR8QTodQU2fd2Dtyo1byAbrNARuUA9Yv5trojnx?=
 =?us-ascii?Q?Ffa3Zy7rw3KaZ7ivkwY82I5MYBII2V4Hw6UpHl5flW9qejqIPS+5pSdYWvSL?=
 =?us-ascii?Q?8ThhsPzlXPznLlpTwGu47XK4msoGJ4tQrYAddEwKw4ay7dSaRFUDTOzWrXUm?=
 =?us-ascii?Q?9zxRJgXjzQiQ5DubNji5BjoclXZwL97DN5f+K/vCTuZHvMrjkpwqxDwGgMAv?=
 =?us-ascii?Q?VJh/+NtJnZHLmSomjdIA3T235zhWm/Osi4WX4O6rvvmcSOFwtvNN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5cc84f7-31b0-46cb-682b-08ded64f7746
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8096.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 02:29:52.6647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXeHUtEq1EeYszz5KAFwYdG7dTrpwW3bae0ZMBez0KcAznnCnEEmTdGz5QE+Qz5qdAqE76YJO/5BbC+TFpcm3PXMRTdztlcV8NOKP1E+XuDoAKc46LxLxZSdeDPxovEi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11661

From: Richard Zhu <hongxing.zhu@nxp.com>

Since describing the PCIe PERST# property under Host Bridge node is now
deprecated, it is recommended to add it to the Root Port node, so
creating the Root Port node and add the reset-gpios property in Root
Port.
Move the regulator to Root Port nodes as well, because that the PCI
pwrctrl framework had been integrated into pci-imx6 driver.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 7cfd424689507..674410e541cba 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -1034,12 +1034,15 @@ &pcie0 {
 		 <&pcie_ref_clk>;
 	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
 		      "ref", "extref";
-	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
-	vpcie3v3aux-supply = <&reg_m2_wlan>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_m2_wlan>;
+};
+
 &pcie0_ep {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
@@ -1058,12 +1061,15 @@ &pcie1 {
 		 <&pcie_ref_clk>;
 	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
 		      "ref", "extref";
-	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
-	vpcie3v3aux-supply = <&reg_slot_pwr>;
 	supports-clkreq;
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_slot_pwr>;
+};
+
 &pcie1_ep {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
-- 
2.34.1

