Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194FF149C6F
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770276829; cv=fail; b=j+T3XXuBGswGFpRckrfk3EXgMMNv3TmonNZqaZ7mgZ4Uy3ne3dzUhdWNDr9y5FFmh2PW9qpC/DUD1ngeT9/5fMrVVG3OPNWumWNiGEjvJQJCEiCr3KimGGXelsb3wP0o3mmzJ8bNKH0eXFGKM4na0hEGmg4JxJF8RFMmMCMsi/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770276829; c=relaxed/simple;
	bh=ElPqddPDeeR5w0lKDE5hY0g0mErwbHlbeLTIlFDLYQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oUTdi4aYeNLQOsm+qqbpSxxQc0R3yeTOvQsVqBOUwNKDSBduifZH+zuHQC1C2ftvHcb3BOayrdagy4OexPpx2U1n14MH2ipmOV9zeC2YOx2Su3iWGCCG4eExrDAN8L0AsdOtM2wAP09k4zL56HXbkwK7uog8oDebxTzyEE0U79s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FyO9kia9; arc=fail smtp.client-ip=52.101.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FyO9kia9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3UzuwpaBNKoNkcXRjhew+7c3bDEvgbNqtqJNM0bkDe9oLHiyOtYxXQkBOMQYptFcH195fPWYRaQQMxninAAmA8xT9ld8PeuoDQOHPB1Q21mZCFe8idvreV7h1pL6N5M8kV3iDAWGejCYm81uhDMjNCbFbiw0G20WQeNv+83XCskOWqXGO4m9c6ag0RMsVULgc0v0UKD8ZNKr+fOZ4n14JWvt+O5eXKWbOPYkO3LkNw8rojp4CdavKqaZG4iN7hKJl3UJmAPU5ZgLKbZTlj9sel6R1rQCh2logA4xsbFMboAOY9Z95G5YYsGxB9kiPav2X3Q03mVbN1Fm8KSXeJNEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MySD3I5JNpvRQxJMWJXXPohC/qS9ncquzIFa3p3mSWQ=;
 b=wNnhLTlFoNOzZUqT1m5SbIyMCXkVwh5CFztPdLdxrecTIA/oy/PPfBXtgCEiGBMGjK0DGJUNtLZmNY24ZWA+3iRGXMPQu9m9esMZ23qVUKoiuhT5vnYfsdb/5LQmREBJNwaGUq4/wYsx+fKbGQ+6JST7fJtdla5XEcDFdAliJNi2Gp66Ekev7ni97aw3zXJoleXftjhf5TE2fc8k/EsmiulU73ileq/yuQ94yc/qD4iEFykOkBVXHtH6+4W41SQx77vwAcJHkA/hLDcESM5S3w52C6SY4hhfdWi9If26ZPg1r2SYOQJOTfCmATCKEf2NCMNg869Y30j1riqjoK5wpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MySD3I5JNpvRQxJMWJXXPohC/qS9ncquzIFa3p3mSWQ=;
 b=FyO9kia9z21HGhKnAUhguYVoFcQHXBT4Pm8Xg41ZqcwqZG0m3nbp2l/VMXn3hj1bLx37k0HHf82mNDunGtKHoyJJXu31XVfOa3Ck3k0nQ8gRhSzw/cxeBzMTgiJf/tCneiDz8VowYzpTDZduKyd8B2FzZlHQM4sGwg26E3Gbs/k63q9JcwwNbFc7ozREnGiv76O5dfyroGHax5AgIpTvpc4UAzDbpoNA2DpY1P5kz1GlqOCy6yeunAvVjW/SOltVwNNQV67nhZPbeMdg5lvyTu5Cb2nUChQ2UiE62+RfkNXYUa+iVib5O2jkG7qKZNih9ZjO43GEi+9KLqXuOeBJfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM7PR04MB6806.eurprd04.prod.outlook.com
 (2603:10a6:20b:103::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 07:33:46 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 07:33:46 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2 1/2] arm64: dts: imx8mp-evk: Enable pull select bit for PCIe regulator GPIO (M.2 W_DISABLE1)
Date: Thu,  5 Feb 2026 15:34:53 +0800
Message-Id: <20260205073454.3709673-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260205073454.3709673-1-sherry.sun@nxp.com>
References: <20260205073454.3709673-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0108.apcprd02.prod.outlook.com
 (2603:1096:4:92::24) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM7PR04MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: e52d1fa1-5459-4a10-79e0-08de6488e59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PsWyQzLzCGAasyBGk4g6iVdk1Ot5VD99bAaLG7rFJ48GfgFIdHpGUu11C4L4?=
 =?us-ascii?Q?50k/PC4g2X7eK01/L9OEzXyT/SdFAlyZPURQFe7vGzCcPe4Sho4DdhrFOcUi?=
 =?us-ascii?Q?S8mUCJ4b84sA6VzV/HJ9HevhPUfcmU/XjLHKUjPZKhWd5XF/EEoZ2avaid5Q?=
 =?us-ascii?Q?0esiWjK+a+7QJv2HbpvkWtSq624aqQrLPRcv5JRs5QwqlL4CITR2S+MEQh2O?=
 =?us-ascii?Q?nsgIyuI48tc6x37Est7TsL3l8l3+QuYfk41/TK1SsOe4pZNEuo9yfYZn41Aa?=
 =?us-ascii?Q?KM2YZst6ycZwmX/QWrLeVzZAlKQ0/01Un1KP+bkjLAX+Syq/PSONFRCyJMvL?=
 =?us-ascii?Q?XXE3Av1WaNtwzn8ENL4rCHg5enOY50abClRAj6pBtT3N3H/kqvfiCrZCmDDG?=
 =?us-ascii?Q?3DhPeieu1g+3dVUMJyK9JTx2ryCZCNZ9zc2BH5e+o4XtxuIspqF2I9kHRQo2?=
 =?us-ascii?Q?INNOCjMAFtbc4bBKXKvQwxBO0KbtoyZy8mEQ+c+u2zhjGZMX+abPW9asmgAo?=
 =?us-ascii?Q?FcV+6tMvsWRxa8e6O7x4Piusq1sdaTNglpzYxX73d5pe/Dgq58VYrATfQPni?=
 =?us-ascii?Q?/4JjNodTtj7Qza1aydRXtXRlL677jvOmKrGV0ndw7DZkQ2OWh1+oOFWGGw01?=
 =?us-ascii?Q?G1lsB5FTdiWK9vMWGuKqge9le8N2g3zxYkjT2uD09bitdfVr+jKDuLA4SRM4?=
 =?us-ascii?Q?6ppMQA++aVZEdA+OIU0Y6MkH/9xZZKheHyols0gvxunX5SbYQ5QyyoUXFumi?=
 =?us-ascii?Q?PLsBi59/ZDgcw2mZTnNKCZwFI1j8J7cq0eshjcfRxuOkgUIbJKY2x1RCSaZB?=
 =?us-ascii?Q?abg/I/C0/IVNfK0/D5YcnNsFhu1xDYYbY8WseVVJ4qN3UP8AKM03V1hkbwAr?=
 =?us-ascii?Q?rzPnKgN5FTDzmu+W2I0aHHSt7SqK96QKb8ucicJUG9Hmm3cpY/Bxkxz6mOSc?=
 =?us-ascii?Q?eSG1XUpZLHAl4/rY9Ud1nct6qMRQQIG1IoLPefCy+iePRFT33drIYN8rlwRN?=
 =?us-ascii?Q?/lYcJzmYqg33VdpJMx4zRdJ3jZKpweohrGKP6VPgw/ve180YYfLBRj46Arap?=
 =?us-ascii?Q?yeNIbgXslr+r9lhIN4LbIGWLr9OmJUWyd4+ELpSmcc8MyjesgcEaaoysaNiA?=
 =?us-ascii?Q?4A7DqgoRgYJmx+D6+C1YMYdbq4CNDXAU6riiNB3/r1SEfj2VgWobzp41hKw3?=
 =?us-ascii?Q?oJf5z2tQ0j5lLHpRXbi4QcMBEdrg8UjYtXzW7w6UIKEdPRY0GmfhJz64YMOk?=
 =?us-ascii?Q?jIZNkOhMEZdWlwuoVX99F3MrYDVb004SsicyeL6n+N1qSmMqXxikiu9MjFqO?=
 =?us-ascii?Q?AH7EOnMA6GtCsy+mo5B2vOQvy4yeY9pRHjKW1NBvsFew+rr++Se+1weLX9oh?=
 =?us-ascii?Q?4GErq7sW+Ujh/p01CzSYPu7OIgfTAUOW1gM16YRAb1q3vxE20SF2FU21uJai?=
 =?us-ascii?Q?75B1Dg+LQV80oUH89TEkBQnXOZLv7kWH+r4BscECzTJxCZq1PjQP9wu/0R83?=
 =?us-ascii?Q?rm3tlQuPTcSy8/QtRF0jDDTO00NRtKyelKNDKUeBdOWyvtI2A5YYPgy2bnRh?=
 =?us-ascii?Q?kCZAcuslzbfXQbDq6qRUfKB1dyWHXNI+nOnW6068ANmxZfGRbrp7Wzv9ESgi?=
 =?us-ascii?Q?h0WNFRFfVT0pd/Hg/aHWMKw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5MDbqIdGJPDy/ELEWhIMCnTieA2WaZn/QQuo5tM+pe6oagSksK5L8aVqrOLe?=
 =?us-ascii?Q?un0MgWrgVhxpKj602J9KA9rYIoJZwZkIgo6aNIqJ3kviYbaEjURaI4lhI7cS?=
 =?us-ascii?Q?pqU7PpV0WthfCBnzy9Y5Hw5kUzeKX1S/Qi7ThMOu3KMiNEL3azL5oyjJ12uQ?=
 =?us-ascii?Q?WqgvF0+lCU4PicGvqFyH7iVn4JSO92yPvnMcb2uHxu35JOSuBtJkwi420LMF?=
 =?us-ascii?Q?OmppHZQHi1Ma9lwDjuyJHrWvdQOQ00i+8BFwGUlGnl5qxp5EmAZmj+YRZlls?=
 =?us-ascii?Q?VwNvZvsgIuZNWuM+3mQiseOxZLAT377JOTTfouzOIYYLqOxPRJm+hnfuebdW?=
 =?us-ascii?Q?NpDkgfwLX/tNbG0R9ahApTQuWkQsqHKAy1wpeFKH3aWNEA8cJ9hI11UjEhd5?=
 =?us-ascii?Q?shjEd/UoIWtr2GsYBsb6LBcxIrsEiHHuFMJTivrCD+sXJgRoMl3mhwCFTyku?=
 =?us-ascii?Q?arZnr5oPQWhEoA//+iObAqAgTM3f7ptlMPJ/I+B/fopS12vmGEKgHjS85Ed8?=
 =?us-ascii?Q?te9gBNGrY64yKsQN9+nSJXeoQi/bJohYMIyXjAmrfxQ4PA+ghL5DP2WC7Uds?=
 =?us-ascii?Q?Kj66LrbRsJ0JFHY3jV3dvc69157AyEhsY1u3M5oiHZjlulqj5wZ5dX1QIXwe?=
 =?us-ascii?Q?AUUq9/3Dtpqm08xEtgoKlTTW6uNPkBIfjK262AjWJWSVQFMdJIl+OEkIdza5?=
 =?us-ascii?Q?PDIjhZUG8wBmpuWWKwP5mWwY6VgNFUA0r60qpXM8HvXNOLGGt2Pjf6at/wnL?=
 =?us-ascii?Q?R118gNKI8Etbuzew/vS6bCpFJvajTsRn0M/ZyD9WDORdUTMzTsvrhWH4tKaS?=
 =?us-ascii?Q?ZDdl2Gu6YLsXocek16n7Op8jFOLZadL6qJjOS8YLB5eit8dhn5L0F83/Zw2I?=
 =?us-ascii?Q?II/x3IlZyYKlf7pY+T5lGxjgdWhRSKAeZk1CiuL83A6yKtd5BADK7xpENa+Y?=
 =?us-ascii?Q?uw3q9FnOm3iH5BCzcAu/oRMO00h1f3D51FRA7ZZ5t0clYF8mBf44WT8dKC0Y?=
 =?us-ascii?Q?ydz1vgDpNhykHgxpRFXrGqMzE388xrhie7Rn52Dtllj992KYpy8Tx0+a6FtS?=
 =?us-ascii?Q?82hJNV6I5oC2W9rizgoMJhHYKDHb22bwd0ob7lBJQLagg16+W8UWhOytVyHc?=
 =?us-ascii?Q?q040sckmvkwqE1F1EZZZDVmCd7HvRgJ6kWV7p5MwW0w9hI7C44Cdi2Sus3CK?=
 =?us-ascii?Q?T+rq5VCkmsHcA1y53bTjhU6uFW/Pctiq+TlbiVBfXZ7vqwsvRY7uCP1HMpsE?=
 =?us-ascii?Q?0Ohbsah1zFfpnQrNA6614x2zQA49b8nPtVgVl1ANjsFjWaoDwVqMWPxl7OF2?=
 =?us-ascii?Q?uluw42N4vz3YPFy8NXeX80cDloVnQSu9dy5wIsWzTCziQvFycfxWauq3K3z5?=
 =?us-ascii?Q?6RNnNOUmdStZNS+zyfijFNHQAlWMgZpxk+cq+kkdxXjAceNMfSL3IRzLUzi5?=
 =?us-ascii?Q?BXOCnjXMLua6YmK1tPAHSIBn4o7CqV7C6N+7JhOkSz8nq8qU8xzAqW4jwRcC?=
 =?us-ascii?Q?7potc/1bhplcp0CNmTNeZP33X4xObMxqy9+bgEZ95QfJHBT6EF6hadFUR/mv?=
 =?us-ascii?Q?8hvBj8RiTEFaiCAivRkLIstkn6LzzaEepdLMqrxwq3FtzHi0mJteo+uxIrOH?=
 =?us-ascii?Q?I2Y5DTLv6PLwHfN9Fg98OlVf0yFRljzrwPh6HLhUgGXlfXSkkswYiAr1GYIb?=
 =?us-ascii?Q?QcOV6wAZnRQVHYj3tn9scE/086u8nj782sV1hB1OYfJvvCsOMcBuEx17xPR0?=
 =?us-ascii?Q?fKT5Gx7ovQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52d1fa1-5459-4a10-79e0-08de6488e59d
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 07:33:46.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3nry/2QwGJacf2r/qJIP/crpTeiPenAWXFRItAGJxWaiWAb3yJK4Ta9rLJNZhL+dSs0uIO5t9UVTHH04rMqXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806

The current pin configuration for MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06
sets the weak pull-up but does not enable the pull select field.
Bit 8 in the IOMUX register must be set in order for the weak pull-up
to actually take effect.

Update the pinctrl setting from 0x40 to 0x140 to enable both the pull
select and the weak pull-up, ensuring the line behaves as expected.

Fixes: d50650500064 ("arm64: dts: imx8mp-evk: Add PCIe support")
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 3f9b3fab8ac3..a1269c7a6cc2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -1069,7 +1069,7 @@ MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07	0x40
 
 	pinctrl_pcie0_reg: pcie0reggrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x140
 		>;
 	};
 
-- 
2.37.1

