Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9649541DDE3
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 10:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889066; cv=fail; b=NiPS2BG/YQr2xK18v5McnWhGSn5XALgb8CUDoIH9lfeXfBaXWXGuOJpz+zbyRGRDoZkFSG2KZgUuDG+GWH8OP4HqMOaULKXJ2UvPzJMWJ6KuUca34cIJfb/mkcaotaJU14l6qq0IxfbvgAhXwEDgDbF5ZH5opQsJCZx0KYtOLAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889066; c=relaxed/simple;
	bh=+8DKFktxMWuH6cTn+Mkt0YlV5LpPdsYATqLLcQh7ezI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Jx2flipaFICCljCE68FktXhWi7Kwxi8fu57PmSWTR2HEkVzbDm3VGx4sX5JRbOOHacZVh55GcxR+h1j5D/JHBfTf2lpOZIhnyi5HsuaAaBOATtGLV3FsA2/Saddjp85wqkO4k3GvHFK4veTPf8L9gco86Zzu3h04JdyHu/rmz8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MqavS+Wf; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MqavS+Wf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkMTlhcsXCo0Ji4wmAIHXoGrUWFpm+J0znWx2YhiZQzt8XojBMyiV9Fnxc+L4L/kNFsnKDNNns7wPsRyidNj1DYaSpZriM6r6NdwFII2y9UOjlPVmTStIFi+6ZDJm6YRYkBYjRrtTMR48Oedk5CctLuSkYstyWgKhgOqfOgRwr1vAV1GoqXsb+5r5ZX8xSVH2GRpr4Qpv1xdiQF3OvXBU6H1qyK0btqgTAh3y3H0Ohk59mPtppRdm/WbyAIDnt3IrqWynaQ8pRJmbBuVsXNQMjHYJdF23Zlltd+zEOWFKZEUKTnTfkBLk6Fu1ML0V2uj2p5LJP3PbSW95o35RPhLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3NRMzKc9Jx0LnEO5wl92Ch0Y7UDrE7B29OPvNHrifY=;
 b=qKj8PX6doIqMcCbHaQhluW9l9UnN6SHcoZQ/xHpfpbpWTX0NVTqikk7aMqYpUFFuYC7oFNVIuTv1zPuGesnaHY47QVtBUqFjFIuWL1mOUTuXR2/78x4lV81go4gSmU0yfpNjKr2nC1WjXfXLJaRgaZxWKdwHAjSEkXDaFKGKXmYbm6qiYE0lnjJwfSveg2gXbOaMbab5LYdmUXEoke0fJG9aFRUkl+XZUaYv0KUJHeMqvf/x+g2HuytzkPggOQkjKUEtuEoOD5SKsZ53VdhZNRnUs1+nPaBlG4+sn4dbJ4F77ABXvc6hcK5pOPbmE2h8zSiDlXsQmlZ/0w28O2BHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3NRMzKc9Jx0LnEO5wl92Ch0Y7UDrE7B29OPvNHrifY=;
 b=MqavS+Wf4DmK1NeVfiZWxALxFRbbZg8jF+NAQCvHfEFySU8gXhtadRIraB8nwLXH6sBEqCPo1bI2+9VHEe7HI5WlJx3blJRZpGAJV6SXRD2Rkj+pdsELfLFvA3PWRalFb8MEUldFY9tdLrBxKkUnEbsdgL5VcHe0PC1H/zK+lFlL9vwHEY5oxmBd96WllY7zwy/BnGBJLoFqsbrscX8eAcOq5Yx8BhGENTbtJf8fxdso6G/oQUgt8ZDZsecYt4LPvmBbQZqVLcH4Ul8H+DrotQlPYtkJwmYqWuhJtT8Sxbgz++XG4X9KUVUbaGRcQJFyvJXAVg4kc1IusuzGJLEltQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:31:01 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 10:31:01 +0000
From: robby.cai@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	andreas@kemnade.info
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 0/2] regulator: fp9931: fix voltage mapping and runtime PM issues
Date: Fri, 24 Jul 2026 18:34:39 +0800
Message-Id: <20260724103441.800522-1-robby.cai@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: d2440d2c-b63c-4037-86b3-08dee96ea85e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	kHeWy3U7JREtx70R6CsKd0FFlkSFDQZHGsZI171W4/rUMgN97NfhD86hl0sbA1d1q6pgx39ziok/8MUVSGhw6/7Exr9GeJnu5YvILDYl9szCFzuYQKBbTXpxbGgIuECD7FyWouIe/56QUVvDpocU9smr57x93gmEoaZYNtPygAxR5Kl35OxY/MFrqlaJ/6wxEi4fd6ccNu2YPRccSvKlZwt39htLqH7ahwh56Zd+aW0s0oDM9B0GVI4Lazm09r7ZlD2oX+iiVciiZ49Er87Tbp+JPA7m67I22Crge2gVHtooMP7tm2OZ9qQH2PZTm4xH2CdKVleRe1udUo80t8/+/VlQToS71uHacnQJAc/tUiHE/wlAiw7fv5yTRRFM6d9JXmcpMIZ1GClCUAufaoUQroyXfmQhzEHy26+my+FOnzSke9BFu/ChcHTe6k6IZWbteP+aVeAcPO7C6B9Nmyd50ai0O2LodoUexfVeRLXn65lWG0d1KFGae6nGWHzxyiwxvU1FVP8vzTvxGf+NnqwNEOEzjVNwZVBbF3qGuZMqJGbfErDFf3ogsXZmt6JYSSvNYyeaI69CDOKCIP+TlL/fhnMlV1Zt/NwuEkdpkKM4lFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TG0TeCoOOYo/f0S+UePnhgXuuW7SwkFgo2K6RriKWLR/ONkaQU2aw8p7LbE4?=
 =?us-ascii?Q?cvhMStaChMNvC49oW7dYV0CLU/Rlo2oFvhdvyXWH/1Kq4w/9AnfoQ9b3EuzH?=
 =?us-ascii?Q?8khAP1GAkwex5BzfZD4PhftlhxEn+lCkOL/Wdnntfb/KeOdp3OsRHP6Xb7o8?=
 =?us-ascii?Q?Ef8jYI7KiyUMb8KQ3//jibXANnvak+OLwEEFB6s9TF6SS2WBZpIPXtwbDfz6?=
 =?us-ascii?Q?5bvOXNtJ0Xnn0nCpqH8Aoy7k3js9c572G8n1smFlsW7IT1u2GTl4TbDmUnJ3?=
 =?us-ascii?Q?nN+RBzawC82MlXrhwfnvqZa+nagC4ZuyPiXVvPGpMaBN9wcZK4I8Klp+634Z?=
 =?us-ascii?Q?+xFlcWBkA4VjGhjVq34a+jkCK0SVdvG5BkMM9fcjNf5ouSOVPIsTI8pAA1YV?=
 =?us-ascii?Q?e05urmVBSeHvwUbxeIofn6iEtIz5T71aI93z6Znghex7gr0Dzn7QkQ+MGZSu?=
 =?us-ascii?Q?dngtPJTLhEccjb808jWZHJNlOywkZHQ0tD9CoPioS/hFaeh6bUZ0tX3b5dD1?=
 =?us-ascii?Q?lHCgJHbkGbSqzssSyUhGHJj8n4leypwFyg8jKhYTWKbWGNbiLqtE/zYG5K3C?=
 =?us-ascii?Q?7WMXkS0GrPPM8hlfQlubsjFwSUqhiXpo5EbqndpiBWIdXEsAYQPVwxd/j4us?=
 =?us-ascii?Q?36rpk3CAe0rnxrIbplTU/PGDAOdqnOZzfygqWDAa7IolrUcpThLXTJgtXZ4Y?=
 =?us-ascii?Q?o/EGzxmS3G+p14+b+C9OOmXCmT2xAoobDMn/G140IaNhPBu2ilREGXMpJGjR?=
 =?us-ascii?Q?k9jkAyId3vAZeq9v7jpPxII8WOpK+4jMBaN+fONhsJHRzoGuaX1RzqI7zV0w?=
 =?us-ascii?Q?LlTXv0Bj+n/TbE2GxE0nZnFBQlU0yaAv5WVu3Nv1f7A9jadE0PDdcL+zq7PT?=
 =?us-ascii?Q?edj+55q2LQPbT+72Vj7iGXBOg+jMV6s9osGLK/VWCIhCfuAXZ9x8bUy7nTpi?=
 =?us-ascii?Q?21kYnVXwJ4eC/qbiHkh6cs+B6OAgHARTZGrtqTlgX27xKC9YfLILjPaU9ziU?=
 =?us-ascii?Q?xhSX3g5t/1RboaDilEvs+SKTO9XXrjHzKB1L/AgvUcsgHMcgLVlr1huYMAjk?=
 =?us-ascii?Q?qt6XmlR32w4BsAUdMrCZQrIfeGI1+CTE04xafLfU3yAPYSU/7SpMDY1UkcBP?=
 =?us-ascii?Q?XZ4FC6MkxcSfDkDbpqhLn+v4jFIHMiuFGRQrcIrNExVsBsFIyrlh/3J25HID?=
 =?us-ascii?Q?bugJletSTgMDAmWlMihK8jxpfgh8fdJRN2krS9Rc1S/RYJOSa/MV2tjYu7Rs?=
 =?us-ascii?Q?yXdC2z97wU0BleyJIp2T/JkvpxyaHvOu6cMA7UdwtR7JpCbBYGirJVVJ/Kw3?=
 =?us-ascii?Q?2M0oSbk8VaSZ8EBgz1ORIPB48LBR7CE2lm28+plPF4ttW7EhQb9o7Fm8xEfp?=
 =?us-ascii?Q?KC2E3ISO50Ft78/z8GdW4uTRvpH8Lfk7SN11d+D2l/V1UTx0oIGDZCl2lSKH?=
 =?us-ascii?Q?pYCe213TLsVn//K82vjwRiIdTezR5dXBEPgeAWSIYDS8UG44Y/STBfMoxr5n?=
 =?us-ascii?Q?VoAhqN+5ZcYa3J8Ju3pGgjYllGSjJfIUAmvQvdKPaK+h0LvKluPZ2sGui6zH?=
 =?us-ascii?Q?c2fmNUMfO1OBYK771arT93cnJw7ljabooUOi/OIsoW1nOgVqGMWw0iKVDrhW?=
 =?us-ascii?Q?6AEfgNdqmf2NVSkqB1OyWIwvzL6fs6IIIZFXmvNmjxNx2PJp7tyvxWoucHrp?=
 =?us-ascii?Q?60vzJGL9Bshzo1T5eTd1h3Kc7VWmzOFcQUIbCgvUgBuPLIFT5sGoE7ZudQ+9?=
 =?us-ascii?Q?ltbGFgHOzMrwi4YMlf+d07AAYwYM+t8zFb0yOgnl/oDOzy+Tocl2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2440d2c-b63c-4037-86b3-08dee96ea85e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:31:01.4671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COcm2ZDrFEmMQycdS02VVdAt8iGsq7yfjogcJKfXp5UHhDEAxOVNKOpFxFFYCw9/1MqHupyH4ewsQFKJJFFC7SQDCFDVOTHi2+5t5W9b4wXQbee57CmEDn1SkHmJDW9G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668

From: Robby Cai <robby.cai@nxp.com>

This series fixes two issues in the FP9931/JD9930 regulator driver.

Patch 1 fixes errors in the VPOS/VNEG voltage selector table, correcting
an off-by-one entry and extending the table to cover the full selector
range defined by the datasheet [1].

Patch 2 fixes a Runtime PM reference counting bug in the V3P3 regulator
callbacks that can lead to "Runtime PM usage count underflow!" warnings.


[1] https://www.fitipower.com/dl/file/flXa6hIchVeu0W3K (Datasheet, p.13)

Thanks,
Robby


---

Changes in v2:
- [1/2] Extend VPOSNEG_table[] to cover selectors 0x29-0x3f as defined by the datasheet and reformat the table for readability.
- [2/2] Refine commit message; no code change.

Link to v1: https://lore.kernel.org/imx/20260721095959.1855436-1-robby.cai@oss.nxp.com/


---

Robby Cai (2):
  regulator: fp9931: Fix VPOS/VNEG voltage selector table
  regulator: fp9931: Fix Runtime PM usage count underflow in v3p3 ops

 drivers/regulator/fp9931.c | 61 +++++++++++---------------------------
 1 file changed, 17 insertions(+), 44 deletions(-)

-- 
2.50.1

