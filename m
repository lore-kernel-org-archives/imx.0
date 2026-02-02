Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011016.outbound.protection.outlook.com [40.107.130.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286A2C028C
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770019264; cv=fail; b=FbiFzFI4wiJKLc9hmzRv9ENg8o9GK33s5cOzDI4aUzFryTe1QO4zD3ViLb4RWySXFESLYLWkCyUTYgDW3LcCluwzO8O9F0v0UWy4dsPlEdFZoS1SLXawubNYl2/nOeq/l+NEj/p2W+xD8CsiDDE8/BhqEPxU2swNxJLuYhXARWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770019264; c=relaxed/simple;
	bh=xPCg6HcoNuzVN0CrHlf0X1Nbj4pLe5QOu8h0s2aMiEY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RAH/5mh509lVxppzMJTx2UkGbcCaNpYkOthrSCTNs8JZ+FYV41xAVuoT8iQKDLLxJa6loZFZUNRrdO1rmdSrhsg8IpKRZGrmtgGrWDUuk3FGSIp9wjyS+/gsXrphTU6ARf9SWgU09nCT5zQb9mtUZMbOBL5GzHk1epgKuFtw1E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BBuCX995; arc=fail smtp.client-ip=40.107.130.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BBuCX995"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8Fz9xvUit7hs8dTTOyFOJXuvtX7cWiqap0JuHxR2ToD5xCwLUILt8/oW+fsNZWVV9qB7vKW8BO3DfB+JGH+Krnw+b0ZRzIagCXHkvecKiOKLZzJhvKRPxx+iWl+dC0MgC8NUTBoNYvJw/1lqrgIAPueOLNnHtq56CphB0ch30csikKQoLa0VvUVhajQeaArGZDkGGWkoAAXivwYZHdZAkmRFFE2BQ38yP/KA9kfdNcn4LDf6NhsLXSGon96QhzEiuLAA2JaO91TmdK1vqJRNhJ4B0JJbxQjIfdmXticItV3ZTBQuvpoirDFw+9wYIiekEN1wyzMNSK2a9yLtPA96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PYPkvDmi/dBGjPGmoYiiOxR6Xvr113Di1bGxDKwQp4w=;
 b=RrJKczukblxS3Q5g/ICeZaQCRznDEoI6oBZMUsb0pu3FhwYUxGl2Pl2duDTcVHkuq8ASAB6UPII/U4VYA3uBBoVCEqjsJo/KN+PsZKJWI8CUSJpwA33FKJczZN3Zt7eCO2qSJ4c3W5b2vpJvOqF2Ae8+5j6tL1qk5t8frYjJMCjkGLM/uBDQu+K6//3qLX8pGzlTfo0q7NgBWEMYSQdwFYTCWWZrp5Q0OcYDHz+vQqKtginXdFbNEm64DSAAqPgOikE4W4GHT4KNhVsOumJemAdEPPOufX6zXZhy/SgznS2sEsoYlnFRJx+mgKG9FAQpJx4neStPdUieomgxhbstrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PYPkvDmi/dBGjPGmoYiiOxR6Xvr113Di1bGxDKwQp4w=;
 b=BBuCX995usUZ2HYUndOoAVzZDQzQaKYv7yXGmUzdOOb9H5DuiwHEUrTu9OwNdn5i2mZAQlyrcYB41+GM7WFwdRQgOTEoArM0eJyltaOdasq2x7yzDysjmsJ2fZBEU2H1/Z4BrZmVyb2mwvcvilJ8fvrMfE/6Iw1BMnW7NFAT2YhXqJAVxL63vsCGBRBi/oMKxoPERQiJa09t0Ny03g/hSadsMPn7Ac6dc/9V0J789LEP+eLz454T8LdScDDVDqC803wdvigN+VhAZqA65uUJx9kVpdMPfnWxEAAvyneejaRVOBzJuai4UgzMYrb4DBU2E8zvI3WihHoqBGpW6PRLDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by PA4PR04MB7792.eurprd04.prod.outlook.com (2603:10a6:102:c0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 08:00:59 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 08:00:59 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	a.fatoum@pengutronix.de,
	franz.schnyder@toradex.com,
	stefano.radaelli21@gmail.com,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: fsl-imx8mq-usb: set usb phy to be wakeup capable
Date: Mon,  2 Feb 2026 16:02:28 +0800
Message-Id: <20260202080228.779040-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|PA4PR04MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 98345ea6-69b1-43ba-05c6-08de62313316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Co7JCWQ5YAN3fBcdlVnVTbmuPIZ2nQAfs+9TerQ2Yib151BU6bFBISKauZH?=
 =?us-ascii?Q?3+4H6PraZc18Ry8b2NkPszvoy/2T3j8atoMgEapsuGk8bUzYCgI2btTKjG4Y?=
 =?us-ascii?Q?k314R70btm/lU/YD4kmA4UDHMQJUR1pobt8VL9nIqO668TX2/GNl5fbnw0TP?=
 =?us-ascii?Q?EE3f9TeK2+++5zsBB468KYVX+GDyXgNz8j9+oKE/YLQIPOUHJK0FgbL2usP3?=
 =?us-ascii?Q?cWW8oqET4x7O7shnO2ypfndePPAWk8CHWXtGvLXdmLA8aFpFZ6vVKgDoMJ3G?=
 =?us-ascii?Q?EPj19AJVXLvIRDthjFJngZd6XZOSiu4aFFo151elicpFxlk7sZXDICUSOBZD?=
 =?us-ascii?Q?MnxxeWAHgkLX6mEuUqIRmE9C9tqQph6rHyo3WPoNcXrvkPjOsMkFo9Suw5Ln?=
 =?us-ascii?Q?mHa2XWKtmIvty8Vse5uAb4E4/BY9R+n2LkpKkTew5V+GdukkiazkTzSl4DBT?=
 =?us-ascii?Q?2wgNo9rv4GSeYNf6Js/oql6U1Sc1IXofvsQq55Qd88DFkxOi1P7rsSjlVwel?=
 =?us-ascii?Q?fCMDMDNLJcehrgq6pZB5Khvj7Fq094SSsuDeMBAYpSWbySyq/WwkwPLXUK7E?=
 =?us-ascii?Q?hXklpE7gE0wfWc7e9s/28kY/3Q7DZMQTLNNqyNkga8xzlgTMOhRj/aWoFGka?=
 =?us-ascii?Q?Z5SfqxfJeBef8Bu1j+dQoCT+drzszJF3P2EQwTGwQKQoF/7WHju+63jo439J?=
 =?us-ascii?Q?gFH0UP7PHPDFbQlE7j0vw6W9BqZwX27ZjUBSpfJFl61+2fWBx1mQ8sG/NPOS?=
 =?us-ascii?Q?hqR5wNk65ERBEkCQPJyJVpzD7RVTXRz9Q1f4JploiPLoKfApPJAkbq/psIfl?=
 =?us-ascii?Q?cHlTOMfDbw2SUjz3exTaFxc8ujVVKSAs0guIKevGcCpU8U0Blob682DbHTR2?=
 =?us-ascii?Q?AcIY9i97ePCxDtzl9GBdJ6OWw9f0CTG8UfT9ICa+1e7J3N76LJ2RYpZBFx/q?=
 =?us-ascii?Q?RsY3AYEh8oTFla72YxUTZ2+ohfJxi9nzwQClEsmm+JNnC9mO/yr8dGLqCkij?=
 =?us-ascii?Q?9cKQJjMw/DRvM4slwfFJ8jVlbI/6X84pToDEewoXEG7jssLk29S6XI6adup5?=
 =?us-ascii?Q?so/aQhhDPYG/noSh0Jc5BWXO0OF4VPjbhnuImdK/1QoA0gXb6cDbaahTpkNy?=
 =?us-ascii?Q?EyhD3zuXc1k4+p97krdcIK3ARy1numItjlzXJxLTBPp0mjBCdXbk7w599UMp?=
 =?us-ascii?Q?7E04aIhqgPyBAeJJGQ6t8aoY6JCvbAQVf85yuB4BOEipMGLF9p7S3HbVVVWf?=
 =?us-ascii?Q?Gwf5PZgZyfgVhsHAIyCLxXUJQ0YSp+7JkpUbiCHs0ck9cJp503RgfIggXsxs?=
 =?us-ascii?Q?1MXR0IEhDSYAxF4tFAKGsGWfWKBmEgmg3Nih5iLscvOJUqtkqjtzNyuHtmm/?=
 =?us-ascii?Q?hFbye5iu0HbjYLZbH5zqkrxFOpCEZFd4WZZCNnH3EAPtXb84IQkhUs1dvuD2?=
 =?us-ascii?Q?Hmp+chqfDgBcwSnKDy+/X/h3+UqaDtumUJPj4qN/vIxodsuNeSfYaFrMHWNa?=
 =?us-ascii?Q?G3vDDgKH6PVO96soJ06JwSLZhMSfHAjsZyu/lXDILXYj7mcY5pAxklwFQYaU?=
 =?us-ascii?Q?NEChAu/kH/8ODb6oJW7nYY7ihlW3fnLv9WgjLjSHUnx/K/y/sndcGxgRJFWR?=
 =?us-ascii?Q?SlzYKIalfsyiu8kgBqcD1fuWlszPxjM5bLn1u9oHxe3Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uX+UYG2WU5iDO84oFfydRexgt9RWJh3pEeoOOoiLh0ZB1y08BVEhkF2M7Q7B?=
 =?us-ascii?Q?/QABQRUCuNk+hj9ZdrgIdPuSBSr2hJ169/7jclDXxY84KVkd4vSJ10QPB96w?=
 =?us-ascii?Q?Mc2EWiRASSrQoGW2HDUH6AZWatuYaqEsWDAKReMTtQC5zz1JDcsddMLE6HUv?=
 =?us-ascii?Q?BOctyONQ9z5BZQySNUFQGM3Wqhw3IAcKZJ0qYkE2J5HSpgS+lHv4GnX32qB/?=
 =?us-ascii?Q?Rv+Jfqwzd/QeDEoUo/qgtuNICF4iz4/AXjmkCvESofZL+a6k4zKbIMVcBlOO?=
 =?us-ascii?Q?HnnNBWbx4/EUyTfL8WIKxmDCysPaLsBv0J15oL08WgLFzZ3Lue9f/ufwbJXL?=
 =?us-ascii?Q?+z6xEo9eX7Sauj5dwbhmLpa1WbK1gi8x1SA2erjStNqM2eDC4gXVtOwLwxiG?=
 =?us-ascii?Q?5cNoLg2I0HfwqXZVMwaU63pP4y7sVKLwRoMpY7A9iCE0fEfl80SquOOyjH8b?=
 =?us-ascii?Q?Od6z5B1fmHpl8RI3b3T4nDeq6gSeaOzxDtXoJ451tiF5RNqemRdmnx0pTlEM?=
 =?us-ascii?Q?exHD4mjEIUS76jVk/TEOgp6b4/e7safAL/pR2IIU8L9xb7EsjUIFm8CVC5Ss?=
 =?us-ascii?Q?GBeNQ9sODccHGzd2V9R2Wfw/NjqxsFxblHje4KOEVR1bny+ge+S00Q7mfWYT?=
 =?us-ascii?Q?BkClzf69DObs+H3aOSU1VMT8tKvzbnp+UChF+4pcHS5pstu/ZDzMj2KrB8cr?=
 =?us-ascii?Q?MkpMdi7CrOgr6R/XyPo210eSyr9eTMfR+vzbJf86k5jLfsTmIetWBDvDny4B?=
 =?us-ascii?Q?uPpuLQFu4YYZU14G2/QRnAp1faDkGE2HKbxA9vw4fo8pa7NHARKpsiaPo0lC?=
 =?us-ascii?Q?/8hDXjQQpLKWA7GGZmVKZ8t32c1tWwzUhEbLpjoXaolGHnsYILsOU0fSKTgZ?=
 =?us-ascii?Q?CJ89GyhyobDB5XY6O2CudTSeY6JHVM9EhCUsA4WRZchQwynhINIShr/cZhSq?=
 =?us-ascii?Q?xPhkR64SOK8fwSY3G06NEidi6wFwvu4wSmR7UyE9VPvNqLF6GGjktH6T5r7Z?=
 =?us-ascii?Q?ubkwV3eFPbBfh/yAChLCBzxTR2h6B3gqH0Omgpl6H/s0/5AwAKJWH4dSQPZv?=
 =?us-ascii?Q?k3zREOT1hriJjbyFGoLXDKG3kked9eDFArkOI744BAIBmmRFNpjos/VA87In?=
 =?us-ascii?Q?Q4hzA2CFueBxXA1qCB4iBvo5cTRek43ViGtEeJ8lbrSKEkBH6Myfz8MDq7Iw?=
 =?us-ascii?Q?smDFun1F9uMwDh4JVb38NQ8hTlfdjgcKaUwBPhLuOF/sLDEvSpcEfYv5pw19?=
 =?us-ascii?Q?cZn8z6Y/V/NJ6OKafvnKQT247N51t7QbjDWPCyqh41h6Uim9/sCsTpXnc3yl?=
 =?us-ascii?Q?8BY5sJRRTDx7bq+kW8RMdDr0QJJ2r52ziAX/WHlFsca1hYo6bYE8I6Yai/6B?=
 =?us-ascii?Q?jYmN8cJOKGfmQUpOcRnWqciMEtnZxlbDLmPAQYnbB7BgoX3nPw9qtHDSBqHR?=
 =?us-ascii?Q?mWZfDwei21J/QHxwBHXsUcUi53nMc+8vJYPt8bGSa8m6HqLa79VHcJLowNHq?=
 =?us-ascii?Q?Hmo106yNiV8ri9uCiWu1V7i0FbT4xT5QXzGmOmULYrng7WW2fTAc9assyq0X?=
 =?us-ascii?Q?4eAaYglHXW/FtCPNGPppA/jGYM5Bgj0QozfuYjyrWthu68YM0GRwVLSixz7b?=
 =?us-ascii?Q?CTvVBywkHfsipHbFV4O0zAe4+rhx2JSJelYnwF2tSf65jCUDuV+5vDuOodky?=
 =?us-ascii?Q?aRML7GK8BbIq9It3e/EcE88Y9f/O0CbeeRNji5m0kfomVz+S/hSWByAc2+NL?=
 =?us-ascii?Q?nk9BObhY7w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98345ea6-69b1-43ba-05c6-08de62313316
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 08:00:59.1712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TEIRRJSPp5SYwr0n0fHGnFm3Ciy8v1/GzDuOqjtJU2shby+4F5CgGnKogyDnxFYlYgbwnPbaWOtGJTx0LNOdAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7792

USB remote wakeup need its PHY power domain to be active,
so set PHY to be wakeup capable.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 958d114b0c83..50b67f1e6a90 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -750,6 +750,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	device_set_wakeup_capable(dev, true);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
-- 
2.34.1

