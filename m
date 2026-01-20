Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6109E393403
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907854; cv=fail; b=r5JIRAkktBIljUOORrIC0SitcUd8Yrw7g2qENWmShActu5KUpg7obemuNpnTjV0scE66j5EdtrfsadnFRUOL53mtd9rbApIJKdI2Q3JOnmk1Okqd5a9tMoPVjefaceGlOJzXVgn+7zXVwRyqo+YFnmaQAHxFtetDBpOtM7BFPkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907854; c=relaxed/simple;
	bh=sthd70UnNmJLxUzWvSHGJvap+pbdrR9cAT7DRZcsj8w=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gca0c3u5CD9EnFQgvaUjfBkgg9DlrrM8oH/8mW/8jHHbcVy48fmi8zMeSA30nl4+sv7EL4DJcK4aUyG/VZPngrfutubk5TfYY94VwlCecIJyJT3mK7B8DRCNJo3Xj/29OwFg+BWMwLfDwssgSIZWklJ4z6zY85Y373mYGJnJyvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cz7Gfzfe; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cz7Gfzfe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIOhxmS5Lb/ALepbFzu0kVwFhQQ/tGb7+MXMQoDYaFoFXs01VZbW2BA7j5DPE0jy/e7yfySQiTuJIbKocZwccEreFkwK0LrDTQVmahOa+xiKsCxMzN3VacDnTnsSmbluRx3w852owK87pKRvryYaTDMuBnPqMXsu+BOIkpPIUv/93nlsN9HILUOCdltEPIteGCWhOJMGXIZ70zWR8IZDcJpvy6WOcrh3fQnKEa+FnYzA0nQRBmf91YPPE/506LwcPVw1zklStqa5/eCEyssUTWt3MWK8fMsyvDgmShDzGwRRB3QOM8RGPN4c4Qx2bQURYc9+ERGgrxnh2WIo1ktYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1TkiExK66mtQehVF8hLJJ37Uf/4BwVRxZboNDyjlr8=;
 b=yRlJiMt8hwuRYcg1OTTfU11Q68+Qi3ze1d8+R68d0xxWyA14mIVOwMtyS2aAjDgaLuEol5qzm8nIpzTLxtjd7fOcIQFzebNF88CFfC6jOVPBfmdlhMLxinchto0JmWXT+aJ0I3yu470s1FqWNJUFv5K5w62ai1VsjxbwMcLT9SxutglEt5ekR2nWqKZ+wS+Q8N/TEm+0bI/FJpQz3JbaO+u4rahfr8fxJXmqBOsG7578g0EnR3FmR+++0tmeLjzr+9H9X0mBhgZmTqHitzcsCo3ux6yW25E0z4VhLzIN0oDcP2BI10AD6m3LMHSx5boiVqUCXBoyG34R9Ms88UlnHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1TkiExK66mtQehVF8hLJJ37Uf/4BwVRxZboNDyjlr8=;
 b=cz7GfzfeWYrNUOYk3Xlre5xsptqJZ9rHcvYWnQXo6mufIG8EFTjenaakLwnOZC6dvJQIprinjw4tMH65EC7uUGGkrUhVaBCPpFGlJb8PElGTKUzfNTig4/EUgmacEolOxRaVTxxF8+lQhheffW6PUCvKZvwNNqv+WhKlP6qKkP+ES99g0/uHaWna35aJ4qkHJrRodfz5xWp/+r9+O7uv2fCHI23dOcyQhCnJjzrzgpd3McceWMsvoolQQNpM4kB2hjuLO6jJfL6jP4HVr0nJi5PekUANxPyxqwCapGaq7pbhYrBnsmetmnnIuuNrOm4G4F4LaiXu1W7vFsvXaUSJeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB10378.eurprd04.prod.outlook.com (2603:10a6:150:1d4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:17:28 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Tue, 20 Jan 2026
 11:17:28 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: fsl-imx8mq-usb: disable bind/unbind platform driver feature
Date: Tue, 20 Jan 2026 19:17:12 +0800
Message-Id: <20260120111712.3159782-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0159.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 1059cb2b-5996-4558-a89a-08de58157ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cr7MrBb5zH9iwlJjeGaQT4VpNZ1FOMZ3BcopOAzQNoR+aalz5M8tQzRYKqFy?=
 =?us-ascii?Q?CNIbmccpwhQG3ZItH3uycAlAWRi638Bk93tdYXJlWWHd+eGbbdYY9O2QFgFz?=
 =?us-ascii?Q?CWawNyaS0bZMOORqrMAQFGlJpM7Er9VI/m1NHaROuQN5nuAr+zUorhZZuDY1?=
 =?us-ascii?Q?Ec59J9S1OkoNE8VhNzpySveMy4jMS9X4p7gSXtM4bVDwWzAukUFjgagIJbFr?=
 =?us-ascii?Q?dHavkfEl0YFmlOfBX1exDK/P91GcNJo6EV/hoEUmNPAFEGVuUMMId6O+rjB+?=
 =?us-ascii?Q?6/2H6/PTVQHOuN+L1b8SDko4yG250HRumiJEuE8Gsr9YZXQtlzg1Xn3JaplP?=
 =?us-ascii?Q?Xl8VAHS4q7RjnIpWbJh/I/skPLiP8Rjgc3ioivnmfUe65GvmiVQornfg7C4x?=
 =?us-ascii?Q?jBwtO3QOX3cPGObqXaU5L0INqUIu4E/gIGJ/2HCJXMWDMYBlTrF/YbFefUAr?=
 =?us-ascii?Q?zlAkCVYi9RUfgEM5X0R8W8ZoydbOnLcRxb8KHpNC69OGs+hbLrXAWyaCvbCc?=
 =?us-ascii?Q?MOvonGBU6S2B6DBpXMJrACUWf43eljpHj175jjn2+kgAYivOW/lUyTKsN5sV?=
 =?us-ascii?Q?ub2dINQ5tg3jPSifHloOfr++14vJA4t38T0wOAIdP8fR4yj9rDx7njpAP5im?=
 =?us-ascii?Q?5DXMxmWsP9PMdXExi8tPa7sKY95lrgTRg9CB7AcT4lX51WafnttAsYY2R8p2?=
 =?us-ascii?Q?652d+1CtRiGIUzeO7b36wEfDMsIKIIM8E4cG2rEUppWtF0pvJWo71RrIlmmW?=
 =?us-ascii?Q?adoWdygg0LTCKgPR1h0cmVaNQqjXwTFJ6sSiBkTKx9fHa15tUzgwDuAwHzy9?=
 =?us-ascii?Q?yxoZt0WRe8hmFmvxwVHj4AVK8QjNknQETRaH4hzHATZ6az9dtiOzOFqe2xmK?=
 =?us-ascii?Q?kfrSWdw+VzlNvy+/s8nLLLbT7VIguTEb5Zc8BhYGiw+ZfMU9f0KD9lQtL2Kp?=
 =?us-ascii?Q?wTDJGCGksjrtbe1eugegzHj6BcAH1S1/3x2ajQhCl5ow237hwPUuuKvvk7gx?=
 =?us-ascii?Q?LpUKh0t2IqLD23rJ0LfCj4c/+1O7dTnt8SUidrp4lP3Ebv6l40tBwJkp5avq?=
 =?us-ascii?Q?wOpS93J0kEEE5sn91Kv48mHUQLUjYDGKuwEW9GZa4Y6yCY6iaTKe4Yoy5fJC?=
 =?us-ascii?Q?9m7rY3SzZKHeSCc++aeXv7SbaxKfkbcBCuq/on66YONNGJCjSJcmOGRBKWPT?=
 =?us-ascii?Q?+Kk806pCrrHG/7b8Arg2HYDFJXXyX83lGI0ml4nBiC0kM4xBtrACtiLHU7eJ?=
 =?us-ascii?Q?rZITAhZ52u5RIzboHzE9EUznwBBdm+OwinqYmQCXVIfQH5f4g1/HjuDizTG2?=
 =?us-ascii?Q?OiW3wdlugzWRUwoNgchn3cth3El/dCNI6oRow4ye/xKic2Wn+GKk/0mp830g?=
 =?us-ascii?Q?YnBSt0gALZf9/o0SAfPrzudzBPKd9M+/zu1NwRjon19U8oIySd4z0ozmKh5q?=
 =?us-ascii?Q?OlrIDBtUSLtn2teTtENuaJb9jw7ShZzzNrBgqwlBlbDSBAGJa2rrAt9BiQts?=
 =?us-ascii?Q?1eGcH2J5A31RpXacYG2R/oRKWDV+VkgBCGUA+qkcAJnKqaei9DzojrFDe7RA?=
 =?us-ascii?Q?3cTY9Yeju7AdAZxq/8njQ4b/oEF7TTeDxHh6Od/MJMUdITOoadrSLXDluZK5?=
 =?us-ascii?Q?koBjxl1CCrSOjjhHGQA/1Lk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R6WqNqkzunePi5ZRWeyjfYvzBDKb0LKJAxNc1BrTNypErb+AdmrQmHZwAkeZ?=
 =?us-ascii?Q?d2nl3kGcze+7b7NeHoTbFwx+Lt+BquhST6IsjIGVUh1xWgqLA9Sc751LcIkD?=
 =?us-ascii?Q?ADVVQGrsz5lvUEJn+YHQVcr/ww9Q8UbTaJOPc+vH2SmwzHl14qJ+T/YVmD1s?=
 =?us-ascii?Q?mULcl8CxSSZoxPtY+ELANo6SjHiRHj7lE3vMDZCsCR7VVrkLsluwMyJ2LhbA?=
 =?us-ascii?Q?/Qdysta/vK6NXWTEa1fNgxDN3TjcaeFeHY7VYcINUXVmOc0tQD2ymckb+GFl?=
 =?us-ascii?Q?4JHk2MsZbo28LRs46hDXz0WtfVWu+Dywr5UrLCDwpxc9wKMzXA5xvIhIxk/h?=
 =?us-ascii?Q?9EzVnTTJ4eXQJtWr60PDcf9UgnfOBZEoNQqBNs5Ts+gKIhxulRxV1NQaqm1i?=
 =?us-ascii?Q?qYrGCfb9i9nNm5sV1RrmkVBLqaIyO6d6heAqsSKKf8RV6Ba9aVNGIBDVpEya?=
 =?us-ascii?Q?ZIjlm335XlaRBquS6m2gzLGOQ6hv7Jep7xIFWxBTEmjz6iG21V7T+EeryRg7?=
 =?us-ascii?Q?a5V4H1jFMUFBKHzqNXpxYdWMvJeOy3fW3I3hqA1/J+SVfuugQjt7QTBOzJ01?=
 =?us-ascii?Q?ksSX2DpnO6MyC7BC7hrPNWz04JkyY8ZDAI+F1PCDAbCfbqXwrCEbksXLntxm?=
 =?us-ascii?Q?62VoDTb8y7vPR45mbMqdQKVQBHaKhLIriJhoqC6l+xdYvlc34Uj5JMu70qMT?=
 =?us-ascii?Q?n1JfhYPdLd8jxj/8AnUHdf08YH0qqmBfigMKtthvTfdOBx1qMAWvOKDgt8Wn?=
 =?us-ascii?Q?c9xYztmoOfP2CoXe/7SoTHlEqeufRVGYEBAumLRj9gnrjMKYeXA+k9ELghHv?=
 =?us-ascii?Q?aWJcs/HZ1jR7JikpiEGHbCrcIK7Y1IwgadX6mYzypxe9Ld9vj6i1tM/SaMDt?=
 =?us-ascii?Q?pP1d3QeI/QNsPDmHwxZhNVWtF6LhBSURCU/ZAsr7Gfth90XgLYstjgu42/hx?=
 =?us-ascii?Q?naFJwB1DKMyfzL3c/ZfrGnky06RSvVqrr247S3zYcozNWAEMEA0mGT4XxIIo?=
 =?us-ascii?Q?bb13vXpDekunLa1uu4ng2dBHjzkrjgW4sjZplrT9OuczYCVd6e3QwFAJmx4X?=
 =?us-ascii?Q?7O9Ac+PaQlxDWuOnGpnRSXsLGtmlU7RbGS0wdBIlZ6TtUL67BEjF/IUp/U5w?=
 =?us-ascii?Q?Uxtg89gRQlHvoqEVbAdOk2YAaUoy9QgG6RkWCen/9WWdCcvUYuJZnBFcn+4k?=
 =?us-ascii?Q?kmx4z6bCeZ5/X5mV0d5AGZw0Rg8PsB3DA1ER7FFURXO1PxUYx1GnCk8h2sNU?=
 =?us-ascii?Q?T42HZJZAKarJq2K3OawHW5mQjfgvSpo6aU67Qq7qsWAQvlZhPvkrN34SDb/o?=
 =?us-ascii?Q?qfkUee8+4djWqKHH8EE2YXVfAJnBj6Cln7v/GyxmzsZcK2NAHzXcKmVv2mmn?=
 =?us-ascii?Q?UWgz6tb4orRpHY83LGWgsjqDrj6Dhq5z2p4/FVQTbITM94p2ufKhwyLWrrEn?=
 =?us-ascii?Q?uW5DhTir7OSkaHlTLcDEohA6fkE2wlmh3fQ5b7HtSGfiDX7CPPcYsPhFivPh?=
 =?us-ascii?Q?MizLF+32Byw5byjil+bc5ezrh1a5+/bi9Ee4S54oozD0ySSgyNNTFv0lqYkR?=
 =?us-ascii?Q?hdWf5ul6SHj+9avy8PDwg8rzblsrh+m9tfdRql7OqEillS5T2mZaYCyhCxb8?=
 =?us-ascii?Q?UdciCFv41yRN7rKOTg12xCvE+itEBH2w2OIEQi9QsUNpzjZElNKW9ztnOes0?=
 =?us-ascii?Q?3VOikeN9F/JpCpax0xVt2poY+tA9kT/QNrlCARGUvgmB1C7yZQ/rwgF5em75?=
 =?us-ascii?Q?vYofJ61afw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1059cb2b-5996-4558-a89a-08de58157ef3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:17:28.4523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZHPs+Gl37vDys2TVB9XbAkFP4aE9hibJORybygQTsyWYQldT0boi1GfFlafSyxmB67xSC+qkaIdxGFSS+pR5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10378

Disabling PHYs in runtime usually causes the client with external abort
exception or similar issue due to lack of API to notify clients about PHY
removal. This patch removes the possibility to unbind i.MX PHY drivers in
runtime.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 028c4c9dea40..abfa6ac3ae3f 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -837,6 +837,7 @@ static struct platform_driver imx8mq_usb_phy_driver = {
 	.driver = {
 		.name	= "imx8mq-usb-phy",
 		.of_match_table	= imx8mq_usb_phy_of_match,
+		.suppress_bind_attrs = true,
 	}
 };
 module_platform_driver(imx8mq_usb_phy_driver);
-- 
2.34.1

