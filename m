Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332474C6F07
	for <imx@lists.linux.dev>; Tue, 12 May 2026 10:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580523; cv=fail; b=SUwH7FDG7mvpyLLkyrandy5lrCnFVVyt8tAhHYSqrjZe8YN4IIMExeT57kD7wCe2ir40VcWjdeoe0ODQsIxEvcTe67wDbI4mES2hxZY+EwrTT62sddC+VeyxunoOYnDgfww5i23cDGD0EBkNCvsmWcln1Ix+3VaMKWmVPipNmys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580523; c=relaxed/simple;
	bh=EUuq7E6NgQmIyaclZPmxpTv/uhWJz2f7XbVMedRimkQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=X5B0baP7CL/l01dPFpVRMKP5s0esvT2VicY7oHgs1IJMto2OMUt9J/p7dujGKaW8TW5n/fee+hmIkuMopM66HkrFaqVoKBzyNKYgi4o5N/djRV5gd6LJnAt7pYWTv8Wl0wvl6LSRsh+eIe39NXt1VAFz/MB/fDm1Tf9vAj0bNbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Ic3xwIfI; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Ic3xwIfI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awIYuj97RKT/i8fHr/OoiLTUQryCr8NoNhW3yl7rISdezgjoI3wILrSCMqqxSVFj+yoXbDVioCBGxGH0X4TRaUTI3PEhip+1d7CiMj4ayvnc1hap5mEmSnN5fg4359tQb3M3fkS5IumGTLUk0SwqTauIUmqjIV+MzFUbb1E7fJlnqKmVnGQTMf5QhuVmeKotvc+2oDVvuH+D34iP/t4Jcc6SHT9+gNaUhthlD98+d1xPf3Dfr1EkBD++qfVDK+0mZexYf5uDPwm8eh2DW+FrIs9YkiSXfEGjQnMtDpLa61yJIy77WI/ESzo6ArvT8rZJNAtJENaiyfvg3DH2Q4Zo+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iupx9jANWx/40Rjj+MHZNNBK3T6zBhyLPwmT/DmFnew=;
 b=NongKKHhncpo0TqxYQdB35FiZlNEFv9X5yd3zAhZt2s3xwbrG5qgZHNsz+zrPF2zhPyNE70Di9gjsN5ARgxZ4Lek9PAGBkZqjhX5KjfJu8+wsZVIsldbs81+omxlqiadcjhZMzoHPq1aa3DIxX2Q5rRcScboKc+JI7Ygc5P8kngiUG/Vct28Rl5vBhDmRrWTbaqxczheH46v6mx0Dsw+mFrGCcd4CpiHULhlnsnMrxPyF7itZ9A7/IURw4dqNfAOkA/vh/eONK5E0Ijc8PL4d6ACKHh/c3VWZffk8M8pIknAVC6Pok6nA7Hykp/qRKW8KTgr8HJt5lZ145mdw2ar1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iupx9jANWx/40Rjj+MHZNNBK3T6zBhyLPwmT/DmFnew=;
 b=Ic3xwIfIQZYMhGi2X2VNHwHMOZOmB3XNU0s+/HnpvPRygPwyT/OaBxqNw+idyTMAAeUH74rWCle2IeT7TWWxkgVgZRpoIo/ch1jwbJPKcSSWNJtXF0ys2uNPtH8vIElDDEbiOLwZfUyespZyf/maEu6pHNw6N3qrro2E7u6WqCz487jIpQs55rTClEEiT9X9KvWvSCAiJ1KrqdR075yu7Prv40XszrtXx4ugalntB5tJXg7lwuOCi64uPqTktfb65+qj3tRXdkK6sRJG50wU9zNUb5WqY5QfolO2ZLuO0lM55CXjrP+1PjGHf1KGXu/I6nHYXf3dVWxoDy6vbfS7qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AMBPR04MB11837.eurprd04.prod.outlook.com (2603:10a6:20b:6f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Tue, 12 May
 2026 10:08:35 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.019; Tue, 12 May 2026
 10:08:35 +0000
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
Subject: [PATCH v2] phy: fsl-imx8mq-usb: set usb phy to be wakeup capable
Date: Tue, 12 May 2026 18:10:46 +0800
Message-Id: <20260512101046.1498096-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::7) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AMBPR04MB11837:EE_
X-MS-Office365-Filtering-Correlation-Id: eeeb2cb1-849e-41a1-62c2-08deb00e6da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|7416014|52116014|921020|38350700014|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	H1tPgJOz1CtpLswuDlGSVI6o6sWyfMckJSKgAWhe6SAmIG+GuUg4g5EyXH+Zc99TXDwnnxPcHXKUYRjPBYeKE02bVk2yNEHncB9hW1NVfYhBbUXh/QGWdKMLpZ7PY77rClYCWnJY1BV2bYZ4OYjnAcWGL8aCsy/zbcCVYbx3FOmntkGM2sU7sLkUUp99W6rAg7dyhEk/cpmQ4+Bk7CmUAHCbOy8/DJFumYFmzclg4jCnDULhlCRrwLU5H+9fgHDdUyC5StiAqViU7Pr8uZSVTSaWvGevTbpbWGyKjMH7AlcZ8XslDsUb+4hOKdrrq5JTUEdPOwROMzvhCheqx3Wu4wvIEaRZcs3jInRIKV/bv4d8BV0mx5oI2VvYPv5wR3DV7tUwmIQpZXPCpktOI/CLVh3I7sWOZd3BBMHLykH+Wz6YKYSWhc7ZE3JImWxuiiw2k6epE8Vq7Ihe6DR68P+RqmJtMHxhFF8M9R8NiCUhhpU7IIsNZEXYzwjYyTp8cYijQ+3JK1au0XYGQm7Zcv7UlSXGYSe2kuycnfQRc7jWbr9ugqR5bc926foZ0Dmstriza30lyLB/GYtCWiHSnxhO5NYhQ+nUNa6EC869lOddoTyw/JytPt3ytG/RasBSLfObV+7AHgf3dBWi6udd1YMbWt01eYPDkAd3THN/BiEE5m/+c8RGg5xjv+My3N7wd3+1JqjzCREWwr3V9PSI1hV16WIA4cbpNnGNHNA5YDPs3c5ZEXMOMmPS+jlYIiEdTWyx+bipgIjiQcNttijUBc/BuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(7416014)(52116014)(921020)(38350700014)(11063799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eFYw0dnQF+ZMX/FQGgoMi5Pgt1WfctuZ8bDP+zF8m2sV27Pnd5ajlG/LX3aP?=
 =?us-ascii?Q?gAgCH5rG8V5l2BzbKzQC5t6RH2pzv6SKZJhihfzGDHhRO30snBrZLIl2g5FO?=
 =?us-ascii?Q?QIk6DqlTR7JA3tTeKuVZ6EQJ0CI1GaNGDECPtoI2p/pvOrjDUaPqFCxjnhbJ?=
 =?us-ascii?Q?hO2q5mGWUzOMCRW05OhN+3OJX6BE1AcxMvR39WYNKQKAH5ANfMRN4GXjSoJX?=
 =?us-ascii?Q?Z63JRwYsZrV05l3NQpcAlVOPPQkq623OyBQ1bIG1dL880rsAHkEMjruGu1A5?=
 =?us-ascii?Q?g1hBaIuu0N2mWWCrvnSv76ckGS0gpqvJN5n5vL4ymCiy4q8ccUoRjM9zrp8L?=
 =?us-ascii?Q?7ECbXpZxmoJw7xS2vT+9yuWQ6/q/FYwisNe51A3iCUm8IUO3I1WTFEXkBxOp?=
 =?us-ascii?Q?SsdJfabg1CzN7tnJYuU8e4G19PQRzCZIFZ6iVb0te78jigSCfcQDP1QZbDeX?=
 =?us-ascii?Q?cqB3T2MCBiWlaIRbJKs41EMUfI56HbZ0r9wJFlXw69SI1BdwpfRrUVVyN4Fs?=
 =?us-ascii?Q?toXJYgiR88uNQCQxU6PYJro1hQZi9q+rI/hd8sqm5Ixfj0H2+18dh1sPJpuv?=
 =?us-ascii?Q?dp9F+p4/DKapILFl2VgXK2UYfrts3QaELW7bnPCBw9mh3jyc0kSp+u13ZLqv?=
 =?us-ascii?Q?+/RTuSdTzjDsah1z1fOPET7l4Vnfh7n+tF2TQki2c/ruyVgOnoVuzv19BibZ?=
 =?us-ascii?Q?GETxAlcyrh28PR6HzmFrJ9x4JfT7POhiqGx+hrFAdzEwDXBWHQp2kcl0B5ps?=
 =?us-ascii?Q?FoHyMoc7ZRb1tL2jEuLwUiwaMUp6LH36BOpDp9K+LHmdzhQHi1X/8+9BczId?=
 =?us-ascii?Q?BDFKt1hcqR8d2vmdWnQN5Ap2P/c1/YZJaT3Seja8TjH3r7O1fdGRSSoVi3+B?=
 =?us-ascii?Q?B+RYOPoYrZuj4JQ/WbF8gmZWvwXwLufP7UuuB13tU5hkYaDdNvZ/5pf6byIU?=
 =?us-ascii?Q?sfr3YJcD81ud4KdApPpKXdgwAC5r8VtrIzvvmklsE0TESFJJXI9lGRCHx0pb?=
 =?us-ascii?Q?ARkL2DuIfGXs+dhnpZWOdywthmzYU+qdK74zmVXrxDQtbvUmrhvWmCR3aTnv?=
 =?us-ascii?Q?59WshcUGYHJzPf2asWtt5oybCQszEJCHJzQfjJ364vjxz0Kpa6LAZLQttsZU?=
 =?us-ascii?Q?Z1A05eJYP3Va1dvweU5SHbTx0AdVmPQD7S8eifISXEOQo179EtaM5q0HdDZg?=
 =?us-ascii?Q?3g0Ul6joXUJRdcR1F64JzPoMqWy3jCdVDN/kJYLQjVnlJb3xDypUuAtDp3rW?=
 =?us-ascii?Q?DbWcs5IaLVX7tmvIa7fjjdGWzP1rXwl2Q3BqrWhzn1Q6sRn9RBui7q2TbQNp?=
 =?us-ascii?Q?fKrHhDTvxl77QEiTgXjwRnTHHQOXqeUYuBiF1tgWw2ty5xBNEO8RTsmmNjWo?=
 =?us-ascii?Q?5/rPqMhpJ5S9a3ybh+cVy69oSQudneNDJL9WIBNWI1LgOGH/DVW646M/6MiC?=
 =?us-ascii?Q?9dbKLmg+Z4Y8Tm4P7Q29UFe2Es+KFv6JOZDCUYMsd9eazoSpiGcrM6BiC/WE?=
 =?us-ascii?Q?EdCVr79xLYVsHddgyGA2OOPN34Ye4atZ08+OBElnbBZRbvEjPKqe9v8CP+Lv?=
 =?us-ascii?Q?0r4j03G5pNIWAyLNP+uIxEfgcGwewX09TtnFPWcdNPrB64RhL2T0XpvdRZQa?=
 =?us-ascii?Q?7uBXD0n9nss9t9u54rp5de049DRX6Y40+kaWWVidbxYjn5t+zdb9wIsbZf2o?=
 =?us-ascii?Q?M44a1IO3SwcedCRIhlhnNhYwoFbzxEYg6KcW9J9EMiSxI/o/seaVrT821H+/?=
 =?us-ascii?Q?KXS07Gaw0Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeeb2cb1-849e-41a1-62c2-08deb00e6da1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:08:34.9670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZLuzidiLwmRNoWNrp15evyGqPhqyCr2tQGmLgeyznufCTUqGhTKU5p3+O6O7598f1AF9d91U9oM3+7bDq3B1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11837

USB remote wakeup need its PHY power domain to be active,
so set PHY to be wakeup capable.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
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

