Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC71D5174
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 09:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816543; cv=fail; b=hfPQKSpJcLDjSAMzjy5EkNKqLnuxOnElWQ9QEbtfQ38s66Aci2DwxF9KP/eu7lJEMemejkBR+BH0n6nCio26lCNoIrVnf7ebFtxlz60Ts9OKdgxmEW8Or+62WvF2Oq0umveoxD5UxSmB1ZQyKeZE1SVIFyKNDXEUyV1qrqnQIfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816543; c=relaxed/simple;
	bh=6FZHoxtVS3uTsU67Mc2UB55O4kFG1MTB0puuRmqlLDc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F/6VUpX6BvPay86Ts4DF5kzN2muD1VP/ehBVBPDyAw9PyrdZ1B/+X2ND/EyNeQVKuUTVLRzmczDLFfxg7P2ZxfQJVWAk05xkiFD+l0oSUvMqJs1ulKX0bKUBH9j5vE47V7bRRg8JGTVT2OHhKgBM/wSsjoS4YendYkrJLEbEY+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ll3lMbzN; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ll3lMbzN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kIlkqvi42s2/6q3aPmiX4KEwTMKpc1j6qqZSvgR31Rx81EsAg7QCJed/U5hlp04ftNjF0xJN1CzxGwaOLveiIFTCcHKTvDMYLOxrPGMfmGBTly2fen7QrOCNAnt4rp4zR7lnmaO4FW31YdM5KtP053lzGZekmcpeBfA8TFGEmNVdG49fxyd5j5kRwoK3Zt9b4McNMXJpDxyUzv2YLhVmyKE8mRM21OzvKK5ZCBaeO1uCX5kbZFJB0Y5nUDMhTT7WFujJRh8tP/trHZfK5NNdfafARgsI25IELyRRL8KCYCwTFeP9+/nPB7CarNc94PvdF1ssihw21HVNZ+cGC5UzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZUTYcHN6/Plwqa1FQpp2tYC7jATZotcmauaxCtvTwQ=;
 b=nUHAKZMtKUoOE8rGOS3omat7hsXd+mLNbcbuaeNc2/Paw2Dn5pJ/nwWTPYCPs2kQho76+z672tYQblMqGg2XSWR7gJlWmQ1MZJRfLhZb2d/6iMfEu3SR1zmpWorvuRoG/6YIkGKPXKcoWbNEt3/Q9jG+1XBy50bhIwg9ecuRt971+0BJBGJmA7cr0P7GKmia16Rhi3OlW4LPl8ZPXPDRxbvTkv8tF+0VQ1AFqdtURiSPuJGLnxgKot8ADlsBnZFbt0DaSqlZUAjPcQeEI/r1sHWaxhNc9Jl7wsH0UDLDB1YsVVeGEnagQ9KUVgbCCAEBG09inBj/xfjr6+gCgyEdjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZUTYcHN6/Plwqa1FQpp2tYC7jATZotcmauaxCtvTwQ=;
 b=ll3lMbzNdTOkvb5CmDKzSj7kzN3WBARgB0LfZM131BLBPLNxlZktk0F8GUMRpwQt12XAprj6DW2xPgrlXdpJ3Kx+qroLQ2aHgJdcqC9CI29TxVipAvep+4t+fQ4V/3pnM8YVsISFKjSv9atTbWaFHOOCGEM9SsShCoA9Fx8lKkoOKNCh+LXryCsCqPSb3zmA/8EKb2iayoJQXfwekSDiG1+z4OSimX0eGB/ehWJiUaFI2PyILChff3jswTPfsXHBIKBZXaoXmMxg9ledb3F+es287MpYPlclXxZigzUXuz3g9vzKXLMHNl/4KAthP35tqEy3XRNKbLdwvmr02A5oqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DU4PR04MB11905.eurprd04.prod.outlook.com (2603:10a6:10:628::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Mon, 19 Jan
 2026 09:55:38 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 09:55:38 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v2 0/4] clocksource: Add module support for timer drivers
Date: Mon, 19 Jan 2026 18:55:07 +0900
Message-Id: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0241.apcprd06.prod.outlook.com
 (2603:1096:4:ac::25) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|DU4PR04MB11905:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dfc8999-8309-4da0-9fe7-08de5740e60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CgU0DA9QJk9w4Noz/CpCxjAsclqMYIbwnD0oWfOegJ5EbwsaCikW53KAHZMc?=
 =?us-ascii?Q?JMyoyHXA/jUtpngyYigqTobIF+I2glp65vjfC7KjWso1I3UBcZovYrANfQ2i?=
 =?us-ascii?Q?r1U11vNJACWWdkHmJuGU9rwIJSYt0wJ/ojQL3jxCYWixjnpkBJvniUtZWHfV?=
 =?us-ascii?Q?ySwlSU2ks4TAEETZq+5Tk78/CjIx5mYwcrQ724riNGhZ2OBB5fyB3cEHoKD5?=
 =?us-ascii?Q?s3fPYPElZvhq+GyemVED4vazYA1gcTIG0YH0jEd7aoU3rRxa2TD7MdtRj+wn?=
 =?us-ascii?Q?nGfSWwo9gDfLDsNdH0uj5UsPmqMZQivK/ex6dNWXgurwlKmwcUUBSh9/bjWG?=
 =?us-ascii?Q?j5vZVuRPw5YvV6ICX8CzRL1X9WtqlosnhtWw1tiLeC5UeJ0P6UhWdVfnv4SY?=
 =?us-ascii?Q?J6/2p8MnX0TUolV1h3JL8b7Ohzp15SzvJnzPuY5M3rWblAbZjYPPUqxQRx7X?=
 =?us-ascii?Q?HLSk8lG9OoaErZiPp3F9uxzWWxGxrj7QnNsY84imECrjP67v7yxk+U6BOSK+?=
 =?us-ascii?Q?2WSseYAn+Lztul84V62zQqHaQ7JlocGPy57sG3h19q1MNCykWPbLSfW+eUEG?=
 =?us-ascii?Q?nvIbf26Pkpw/eBhETjCETCMx5t7XMARe/QxXMH4+9Vg3OMQu1nb1f5c/IgfQ?=
 =?us-ascii?Q?vwgMlWzzeQapSTz1j7Q1OMtZlEyMt9YM4TkIov9k8Bs6MlcJAf5MQcb6d7pZ?=
 =?us-ascii?Q?XDLc8pek9b+yeWk+jLXexmQyH5oN7zWdO6+0InM1+N7yIu2/nrYJSE4U8xfD?=
 =?us-ascii?Q?SKMHndKBVYMMK/HLg285QM4wNuc1hAdWUecFa89wQnCrcnxMgJZFdnPE0VM8?=
 =?us-ascii?Q?F9WvUhClPJhqf8k/a4LVV2a4BJnFH4gA9byGFmC91mx7myZJ3VcQpDS7OUiP?=
 =?us-ascii?Q?uBW2VZGXHD7BrZJwVFb5qWVARm+SSrYFySZdHoyO2G4g1LFyaUG0YpoH2cch?=
 =?us-ascii?Q?5JZ0kh18dsfK9H1AzgQji0+9HJWUS6STNxccg83Z7QnHj2HcyGef2ATkoRHm?=
 =?us-ascii?Q?dKZQfW7EUg2xje+MY40kVj4cSy4tZSMTyNB3ShJnHBfqlkrbtZOFQZ0SCrsD?=
 =?us-ascii?Q?KXnFvjwcvpi/wcjgmqc70fRQ/DbLIivQ84WlUHJCddCLOTXppP7O3A69V+Ye?=
 =?us-ascii?Q?k4K5bz7QMZpPGgd1EAwgB9SC0xZQKg1srL9E8vicc9gzQWo8QG3Qiuh4n6q5?=
 =?us-ascii?Q?EHm9jcaomr7cBYCeP6QIcnTeo4Ko20e0tXdpLjaoh9Sy9tAyfztEUgyaQa7N?=
 =?us-ascii?Q?xh0cbePFSvBq+Vq72sa8fquunbfI1JQ7cHrSOX1ePjyrI2cqjyfro29yuwKH?=
 =?us-ascii?Q?1pWtG2mlS/mBaXHFlhlIIFFNbsjRLI/O2enBb6DoWLdxo6O9FSqSgQFJ6q38?=
 =?us-ascii?Q?ePbmkJV9r+YFWpLQYzOZhbytIG4d67CJjRA0khbVZ1JL4ykd0wf1q+gVoLgn?=
 =?us-ascii?Q?Wlzwjo4ZHRgT3b70cYoQ/nkQ0l85biHUhtSuiZYZ7S9Gk9+p+taeY8r3miwR?=
 =?us-ascii?Q?oIWB6ns/8+YW2jxjRyI9M4H72U7Yu5Codj66Fd/v8Cu60wtkk/PLsNatq54C?=
 =?us-ascii?Q?WLf5Sv4xUveTHTP0r4XPVDcfDhonSuhSMNIQ1Nm+cHQjeCAHETD4/SURybxi?=
 =?us-ascii?Q?QJEC4YEKNAknCK7A7Y2PKlI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MyVfKtTd+0sCQDMq2ksMJqjKy7pClMDckA/jTlZkyaXS/gt9pHiRvOi7bos8?=
 =?us-ascii?Q?I8cDb/es9yryjBZfPqzyZCnaMzkI8j24j8zXr8+ZZ62dzDVfTV1nPUMyZoUo?=
 =?us-ascii?Q?uDGPicWfreDoKibkCokCrngOGwa3FOXa4O6p+CNutXIE1SzXojKChIYFayqG?=
 =?us-ascii?Q?UpMuPJek7IIZ2Ltw9kd1e/lTTArOfzjwYeVUMlUSNHcOn3rx0jlw7+N7odUH?=
 =?us-ascii?Q?DOdqTW2c3heP29xw8lPHCcjg6GK/Du7451r9+BD3j82hH/nCEa/khUpZgTFk?=
 =?us-ascii?Q?apHzxvOF8ME1T7lcIhdzeichphul1VlC/Tb55+A9IbivdrvHeOqN5j5g5xXC?=
 =?us-ascii?Q?eHG/qF4Cq1vXREY4sUGJ6ifZ2l++/2u8cgghz9805U33zUqy7RzARafkOxur?=
 =?us-ascii?Q?sV2k4ms8/zv3wHVjEM/5VHj+d+uNWjBzdzATEYdj//0HhhGS1QRbmxS9gPUI?=
 =?us-ascii?Q?suOZw4yDfn+3hEqk4m8Gh40CrJ8Ms4Kg5vQK+jb/IUcoxndmL7GEtdubHI+N?=
 =?us-ascii?Q?sOK6CeaIuIc21s8SMp4B9T3NS9ubHPgWKdpNlhN02BsM6ujdFmnHF/C1fxQB?=
 =?us-ascii?Q?OjOJQ9Qe7USwXJmH+1AiM3DSSWoXH6CpfVGdf1BAusT+IuERi899u4KJ6bg9?=
 =?us-ascii?Q?fFTIoK9FpdSekZLJENjuKW9U3J8DcyMzHVvpMrIMdQxbB2cMDi9SbxVvKgRT?=
 =?us-ascii?Q?Z6ANruA7xOEnGT1n2XWE6YN8lIyFNYbHRy+Q4sySzbEsDVrRItNG0ifK49c0?=
 =?us-ascii?Q?Vy75JnS1+JHQtoEA6YmpjxZiqwW6n0qO/MKtZt+qNbgjQx8JNEvpLtgMCafF?=
 =?us-ascii?Q?c4LUMPAfgpV1VuWbUBJ0qnEwazz7/tmSFVfdAPPYLVfl+7/YF+kop31YG32H?=
 =?us-ascii?Q?Oq98FIClFmjPFUgbi8XVH2HchZtxjA4LS9MM2PHC8PilBQWxOQfyffGp30Wc?=
 =?us-ascii?Q?5D42NNnjrnICKdZ/WKqpu6pKmc4yY2MIzcX9/2AFasWjB7J8In8MSakK0auv?=
 =?us-ascii?Q?qn/PCpgSJL/qnb0TDW8Sw1xgQiKETGZ1iwTfv1UgGs4dt3uU2cDBH4tjsd+A?=
 =?us-ascii?Q?Qil7AfBqhDc4TdNa/U1UxkE9YJRuRh0dPcFgiPWM0mAkhzq4yN10ar8fytbv?=
 =?us-ascii?Q?Pvn+HaH006F07GQD+xBe3Q+9eV69wyNuewFBTpoGaEcGih4yqfOfeHzjSdt6?=
 =?us-ascii?Q?Uw5w3NNY+3hVn0VZ9EeAOhOIGrCcqbqTlKY0ePQcqPecQkSyPu4tnuCswsUP?=
 =?us-ascii?Q?VFrENRUEOpS/DX8btF31AgfP6khzNANkgxjA56zYeRsCmYNiaNq18NI8jEUe?=
 =?us-ascii?Q?xR+FRmwwnZPP+upu9wLdDgAr8adiV7JPc+273koVZAef5RnVbG/JGkOp9ckz?=
 =?us-ascii?Q?JFrbl4Z/HJp8cHI8Cua3uCUtgTQip5ADUTzpo7awLUwck7dZI977kUwHIg09?=
 =?us-ascii?Q?kIj2dNtGlmnKQzTrBmyNngBp/oI/MSbcMpoI1lTiHT1gGmLP8dX49NSefx+P?=
 =?us-ascii?Q?YCS+S88xfvrBjcYVEVcaRE/CHXEWIrIRhej+NqfOtaVt4dfapRdMDiahKg8K?=
 =?us-ascii?Q?KY5JMGyVYCdz+E4YfAaP3LtsOObKztP11yk7au8TptA3Cl8Kf3WzITTSeKRd?=
 =?us-ascii?Q?mmSDD3hXnxaHv/FHMsxgk4yQVg8KwgmPg8ARV5WMCUg2lxGf8RM4gydrq4yQ?=
 =?us-ascii?Q?VgAsKs91a4B0NuUJGWLLptsEAezTWyGK2tEBEXrdzef1wwC+7/jf3/4BU2gh?=
 =?us-ascii?Q?F0jTX+YowA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dfc8999-8309-4da0-9fe7-08de5740e60e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:55:38.4976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CfzAe4Ae/rp/XefkbUJiffhe30GUUrCAXTpBc4Y+lmDxh0MpLwsBnaBN6PM6xolFAMMux+UgW3IxIj3i2dI0Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11905

This patch series enables clocksource timer drivers to be built as
loadable kernel modules, which is particularly useful for GKI
(Generic Kernel Image) configurations.

This series is based on the previous MediaTek timer modularization work:
Link: https://lore.kernel.org/all/20230517022557.24388-1-walter.chang@mediatek.com/

The series includes:
1. Export necessary functions from clocksource/mmio
2. Remove __init markings from timer-of to support modules
3. Convert MediaTek timer driver to support module build
4. Convert i.MX TPM timer driver to support module build

Testing performed:
- Built and tested on i.MX8ULP platform
- Built and tested on MediaTek platform
- Verified both built-in and module configurations
- Confirmed timer functionality in both configurations

Changes in v2:
- Added Signed-off-by from submitter (Zhipeng Wang) to all patches
  as requested by reviewers

Changes in v1:
- Fixed 'unsigned' to 'unsigned int' in clocksource_mmio_init()
- Changed MODULE_LICENSE from "GPL v2" to "GPL" for mediatek driver
- Added i.MX TPM timer driver module support

Chun-Hung Wu (3):
  clocksource/drivers/mmio: Export clocksource_mmio_init()
  clocksource/drivers/timer-of: Remove __init markings
  clocksource/drivers/timer-mediatek: Make timer-mediatek become loadable module

Jindong Yue (1):
  clocksource/drivers/imx-tpm: Support building imx-tpm driver as module

 drivers/clocksource/Kconfig          |  4 ++--
 drivers/clocksource/mmio.c           |  8 ++++---
 drivers/clocksource/timer-imx-tpm.c  | 36 +++++++++++++++++++++++++---
 drivers/clocksource/timer-mediatek.c | 33 +++++++++++++++++++++++++
 drivers/clocksource/timer-of.c       | 23 +++++++++---------
 drivers/clocksource/timer-of.h       |  6 ++---
 6 files changed, 88 insertions(+), 22 deletions(-)

-- 
2.34.1

