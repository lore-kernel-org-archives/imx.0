Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6BA296BBC
	for <imx@lists.linux.dev>; Sat,  9 May 2026 02:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778292264; cv=fail; b=l7iQCFfuNeiJQ1Kdra+O9OK1e8es3AM4ZkRi6azpcb/0k4ZmMYesskrojn8AgFDQLliSKtX0QoS773hJurf/x8hujfv7SVvPUkspY5tmwgMaPaR9+6tQBYzptJyfoAxwEEnt1vE8sxeNcFu/Eti+oc43mH5NS8x+6bVruvyEko4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778292264; c=relaxed/simple;
	bh=qA1BjyQdooX+Fm1vIpGP+nAoCMVQC00TQqqvxDJ+/W8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rcCpnPjTbglfGLMpUQ2dDrv6cMZwCNW9OoS1xY7qewtm+BNYRqcexFvB/aI+pkrjCRI8Y9eMR1LrDTHFS18mlFHnH6QjgVivXTm7hQ1TjHWb41lc45MDGSA8nEjiJfTR7zJLd7gjviAbHAP64F8Qk6Bc+DuwP4aExKLcFcoR4C0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MluJBkvT; arc=fail smtp.client-ip=52.101.70.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MluJBkvT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSvzV35C/zljS+BObCtJmfsBCT9h6e6gPsQgIGy1qNucamrja1jolWSUBv6+wVEW5TgckJz7avZ1TQsfuYwBiCPN+XT657Uz9nyufWviZHV9/KeIwKMQWMHMRFo8+Xn2E7RooZLsMkiPISk4G0fWcLkVV4E8pxgNSwknItfQr85pGu2KEZbaUf0KiDr+wKZQGcVDKMgm4Y7A3WmPtTSPn/OZPVDVjmF+DtpWR5TGjLsODx5JWKn8Cuiam6vjyowPEJlxs/YGT2hUBUz7RtMsuq4rzHclZyiHDMBtLDVD3cfwEzNeXJG9rbWtd+A2wEcUDjC7gCBrSAUOMJtnebEjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg3Juttgv6Vmksd9wBTl6o0hxDyl2kPjG+2Rh6L3h80=;
 b=bPG99jcVgBxv0Hi7bckBKVo5AkTAzwIiE7UZm4IBcjtzH3T2SB2xEv3hTr90nl1VtUpUr0udQK8wC5U3IfeJvmxmzzCeDooRgr9ZHvu5Xie8EwdIWSJCQnJ5zH8gAZhgjyYRXVtFbHgxJaVa6RKMn4wM9kwtfii+ad4vvOv7J4cZmbZZfzRVZDhzWPnwqJDZxAJl8G1Df9/iFh68aT51naYe+URg0GvTFRnWaj351YV5iU3S8oLCK5YXl+q5d26J5t4OLRbrKcxTz+9qxinIq5EWBjLWhtNwjhf/oHQnui8VjUS40diHB5KHZMM89OXakPtIfPlwcuQGPyGeOnNTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg3Juttgv6Vmksd9wBTl6o0hxDyl2kPjG+2Rh6L3h80=;
 b=MluJBkvTrazo7Ypn+/J3qITfTJGwjZTcfWq49mzp+9auUa8LBDVI96XiPfdl7bca5ncjBijleZAYBM4xBfvEx+ONLir/yjt+IEG5DWjmilUH+vuy4W6el55GlF4rhP8s8/GJsEjORZBhSZIWJPEoDvHHDfqlfca9P3EPkBzlVtwqZyR5W2rbd0XBPKD5OsllqVmpyYDTEbbTSPcQphUpZADWr5igsuXceAljadEH6sRds3V/7WqGvqoqCVoucVheHNn2EOQ0TQdv7aWmi7DbhP83xvSkx9K0CwOaSiP+G1iChZ5byRbNAO0glJl/cU3o8sGc/JBrmb6gZyE5ZNqhfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by VI0PR04MB11071.eurprd04.prod.outlook.com
 (2603:10a6:800:262::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 02:04:17 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.20.9891.008; Sat, 9 May 2026
 02:04:16 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
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
Subject: [PATCH v2] arm64: dts: imx95: Increase PCIe outbound address space to 2GB
Date: Sat,  9 May 2026 10:04:40 +0800
Message-Id: <20260509020440.3219767-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To GV2PR04MB12019.eurprd04.prod.outlook.com (2603:10a6:150:30c::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|VI0PR04MB11071:EE_
X-MS-Office365-Filtering-Correlation-Id: e35df66f-f09a-47b6-98ed-08dead6f463e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	C63WsgBVqulVmjAF3KCbxuLc9MrY74kes/FCgj+/wB8DaqbYPi8f23Ym2RtIlYfKNQQhHzhZx3u4XNjmu2QoEPvECrIG8yI47ek18fWc+4iMLS71GTwhqv9P67AdqnuS/wY0NM6BRw3R2wq3S1VO1EvTb7qvzBSyTd/HXNINCjMyiJmmNVqXHi7YfenXf7LpavUQX8CxHKDPyBqmMtU7FLaNUddD9thsULHP54HyUi1N/rHN5fRhn/q8FX0vo1N2RrSWFC+9206l3cMhAz6W//pfpKB1QOUh8BmNaMrjDFKXmXcq5ar2kfFWDewwY2p63w3NLLa3IMVPsvl2Crp7fO41a8x5apC9omyp2U8k1M7+oK2gVR3G52Pwsy18lPtp6lnOuWVQxoxRH5c/Tla2q+x7eekQ2ODGEy8DMzoUIcJGFnQr1Z0CYOmaXmndnF6KcRvLm4Kmc0dIhTznaFjIgOqZAmHnb5TgoCJgehw+TZlLIfflr0vtJPdMUaNlxwrlHelIHhv6mzcBd1dK+PG1XGmt/vLx0ztkGF/Ju9RJpYxkQlpaHVOgMoqTio8TjJ9CoRerY9nYpsYibv5Bu43V/e/YdZVT49NGmAkc1BBd3q8Wp8oBaUfqpx7qM4+T6JzS+AXxG3KVom0oGNsrqIkztmuy1wDhgqYkzlNQwJskgwRzNhH8sSNUMjcsCGliFa9pNya/Ua6IKD+F53VkODU0MC3ohkIHSk3inYwa8tvkdpWuH3IAI9BOB0ecknq/QA0e
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5rfRy+hr24D0P3RYClm54QLAemFSE/a6hUS2TwDIJ/oZu1qrIBFa5vEe5gaI?=
 =?us-ascii?Q?ID/2VrTc+YNKWd3OiI+Du7qxNn4yLja6RZF/0VscW6FnRAQsNbR4O9SbsXEe?=
 =?us-ascii?Q?oh6k8HgwqEXTYkgqLXd1Yf9BA7nDAZ236fIltRM0XeplAoG91KEpEKIJKSe9?=
 =?us-ascii?Q?cBi8qvikmAs0HVZC8k8HF3ftILfHASaiM4fN2hbVZdbNM3Py5PseD+DG6FmK?=
 =?us-ascii?Q?9xrnxKI7Ag2pgqEhycKTunzda9Cqe5OHx067dQbhmVsWqCIJQ2CFqkD/48ad?=
 =?us-ascii?Q?03UknTFGJjf4tTGytAptpMkE0UjkHA+hGEsJfxDlGXLz9WxQkUibY4Iamhe7?=
 =?us-ascii?Q?1kcs7JfHw4JiDyu7qYU1e++lriv8sfwqweJeZjjIzfkyv2AZ8GntQJvmvtAL?=
 =?us-ascii?Q?9HZpZLlaT4N8K3D30FkkqObvpBo3b9ZxrOXNCLLo8ilAMTWvklFPctrTI+/J?=
 =?us-ascii?Q?/sa7RCy2LtUZN/xr5rG/mxhZU5Rfoa6ju+Z+v1Z2z2Z1RcHmOSElCUGkRaOZ?=
 =?us-ascii?Q?02DBks9EEHZBQx4njNRcay40QbJHacTjwNCz4DZl7IEdZ/hglie+RD1sQxe3?=
 =?us-ascii?Q?pXnYSQ7fjFmWKeyRq5G/np1Bb4CGdgWLbsqOyzGmw13O+sqZGLiTzYHZzZkp?=
 =?us-ascii?Q?06rXQRPk1e4vABvDjWHVDgAl0UUV/gwo1wQhMVLtDg0a9o7XUIfrMIhKgcaB?=
 =?us-ascii?Q?H0N+CC9iaYeG8vL5fySHhqsCHKQOO2QPezpjF1T313sjdAVMUoeyEHD+UZn+?=
 =?us-ascii?Q?1BrtFnchuHLH6HthS/yJNCq2pSoAjYhIf2VhmH37TXiaV0LKXUxPgrVckhyz?=
 =?us-ascii?Q?WjxYlqoEyap1CvKaK++avnjyxsRVWAZbNy7hVZNsmp3JEV4E3eN/leu+duX/?=
 =?us-ascii?Q?0+qOIcsSTWzu6QoPHaFG8RgAOHSjjJemkNPjwE4emDunygm4ilAwah0ZrqT2?=
 =?us-ascii?Q?lY0edydkKiuyxvlI/IWv72f9UFtMVlwPcR49rjP3tIMDzOreSj4izu18arQn?=
 =?us-ascii?Q?h/JJ7VwRXzQWi9Mvf1iy89D+b2ksdr3v+be9HRHweOCkdFAFZy9lgwSNu2xO?=
 =?us-ascii?Q?YA0ES3Q0oukSCoskl5VK//g32entN75RUjV1pKKoS5P/xAceWpDW0Gkf3QFF?=
 =?us-ascii?Q?97RUJYHCuLtEFvrfAbN4bzVw4h9btp0SNBACD4oLZLKYPPO2F3aMnQ5x8/uL?=
 =?us-ascii?Q?PdIJV4Cr5fqo1tf18GxMTaKXqhYPjqHgT9hmzs9imbcAHpDS5Z00T44B/hYx?=
 =?us-ascii?Q?y0Nsc9PY2MZ4IQuWWkTUTR8rCrLojzsxeTerpbKA9iCv+pJx3O85NuSWEPv3?=
 =?us-ascii?Q?8FUKjMBeFqqOrDV+uIUXz18XUpFz+Ko2kQVDNBTViccgN85Kb6adcmkrT14S?=
 =?us-ascii?Q?f8nApYCSizD3ka4BeA0VKU8p+XxPY9OHNxhG2ccS59sdJXYz4sgxpkdVwkCD?=
 =?us-ascii?Q?m8gaFpfW4WeD1sJ4fyBDm0GsaMgtKM6Uffgh2yMES9ymBIEMC9MVkG9IyW9a?=
 =?us-ascii?Q?geVjMa9gKpc+WXmPMpSasApRDbR0scAiM9+V4CzGxw4UVcVGt7mVU3pu8wJj?=
 =?us-ascii?Q?t4/uYbEeUPQCxfIG7DoUdeL6DQ2d9rPOoqDL7SA7kdxCiMBPnMOE5wUlRs5U?=
 =?us-ascii?Q?G/xXPqjhMjHV5x4CPoLwCet/YKaJ/9p/d00W8iEFMx5FslLxvheBYuk01F95?=
 =?us-ascii?Q?uXlUtHO1igSTN7xvRw4H1aY7F8pGV5nhs5p8S6XrsBp7KNszdrEbdyN+mx0k?=
 =?us-ascii?Q?a8COax1ZzA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e35df66f-f09a-47b6-98ed-08dead6f463e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 02:04:16.6131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdN8A8QJGF/GKok2d8lb0+1+Of2stiPWU9G/YR3H3UrzvuwiUbnzwgqQVA/avALhZGZYvEQPzKCDwdBpqF/Bog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11071

Expand the PCIe outbound memory region from the current size to 2GB
to support devices requiring larger address spaces.

Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
Changes in v2:
Add the Fixes tag, and rebase to latest imx/dt64 branch.

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index adcc0e1d3696b..201c0eae13948 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1940,7 +1940,7 @@ pcie0: pcie@4c300000 {
 			      <0 0x4c340000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x81000000 0x0 0x00000000 0x0 0x6ff00000 0 0x00100000>,
-				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x10000000>;
+				 <0x82000000 0x0 0x10000000 0x9 0x10000000 0 0x80000000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";
@@ -2015,7 +2015,7 @@ pcie1: pcie@4c380000 {
 			      <0 0x4c3c0000 0 0x4000>;
 			reg-names = "dbi", "config", "atu", "app";
 			ranges = <0x81000000 0 0x00000000 0x8 0x8ff00000 0 0x00100000>,
-				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x10000000>;
+				 <0x82000000 0 0x10000000 0xa 0x10000000 0 0x80000000>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			device_type = "pci";

base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
-- 
2.37.1

