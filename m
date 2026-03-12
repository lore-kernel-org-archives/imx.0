Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011018.outbound.protection.outlook.com [52.101.70.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACAA3AF66F
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 07:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773299664; cv=fail; b=E33dcHFRCMX4fJOsUzuUlXH++lwr2KTm0pbKGK301ydd1RYgVSR/LQebKzbxpx1pkwUAo1vwl3RUeAuvQ8oIHfVUhmfqzql7VxFc8LN+w5PWoi58IjlA/3stRZ2z8GBmoH45dkIV6iDAF4hxCpHM+Sc0CIXQQhysbri4VVlk/bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773299664; c=relaxed/simple;
	bh=WkwZGM0/cwDMBUCl1Cj76jpbxnQxGN5mzt4e55rMOJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N729lhoqmpo9bLmF7ZnWelrg1s87hySTL+ZnJJvva5d7nTmzshIGaj24CLLe8jKZsDGRNykegvQLAKMvHhdmTf30b1teb+ShSYXvfCHuKJfIMnzRBBLGKSukEzvrOvEuJC1vhViqAn4k6g1l5VaSvdpWtrQocJKTCzF/Oe5TZ8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TwIPXF50; arc=fail smtp.client-ip=52.101.70.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TwIPXF50"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SOMfrwKaI0H9fgzm+vEP3fqAZ9eaDv9+KeRjd3prPTF0uU/kfgoZNvEa5AG6kqrR30PMwhAGxYV7UZ1VJyzTs/hhHl3XR5V2ogi10FNYFotdz8EOzOfw5y3UbV6cBhlhsjVvy5KYXR7Rgt30HWeLXJQY7dxYWqVHzTJNr8OlPDbIGOqAyVj2QyiR44QrV0BKluHIW0v3BImpBjh/4eP2wdOdZ5V0eAs4aXYPf7m8WU6ogciva3tJ2FvqSukcZ1M+oXxIojNqIXK+TRwzlp52lPeT+Laj0mMi0jnektNMYYNaN/fCcDXXOB6n/AxjsSzxIB8i6WjzCqqEkYJaSG55+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8LwG78ps7lSDe+ELONgG/srzoo2Cf+3iPd/8yznkVU=;
 b=emupJDsAkdcqZT5X6qdAGIdUYQIroq8D7X3ZJmPsVclmMyPCZfoT3B3BbYNyoBjj57veSXUBtSWJLTOSRpmIBvACkmUrIrnXrgkXyUlC4xeerk69mBiAErFWsFJqNKsFu7Sqtan6NNBqXETa3Sr099OfkwvzSpz8kPaOzbhB6kM2n9jqOQqegB+nbAELKZDt4v08tuvRffWSqykyTq1fIQ9JVkBrg68qHvepl2+r5Jn4eNDGr+NLxHrR5p6gdXvDiVuheJa3drH6gUsYPyRfxQu7W3fLEhjjAo/ypBf3ZjIP8EHpp8Ywzj0Y2/tNtHSeui0TFRUjV+ok6ypkBwbeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8LwG78ps7lSDe+ELONgG/srzoo2Cf+3iPd/8yznkVU=;
 b=TwIPXF50Mzj8oZX9cRkoc8i7tVbx6Ka4xsYpgMMdGgJ5oM0ajQ8bD7SIkbXYrt+RMUM7vBjYJwgHgD92Ze+sSDDAgfeqPxdk7+3dGD2JFlAKWGZOUPv+rdHlCEKAbXELHEHW8/+y+oagfB6BeKhxhAHv+jyR+HaP1NphGttwxDlzQ0eT3JmlYWjsjkfzzRSZU+62B9FzR8UwnL+wy5DjTQ9at6d9JYytmaJ4BX0sXnYTrZN5GtGbMW7eYlNqGgeN0pxJpSGc1WzFQfuJi/HuBAPDOMK2jrRQZLGWpnkuL6FE6oaSVuQ4y3C22biAyLTJqnrEFPoRg3ax6yJiATXz7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB8706.eurprd04.prod.outlook.com (2603:10a6:20b:429::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Thu, 12 Mar
 2026 07:14:19 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 07:14:11 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	amitsd@google.com,
	gregkh@linuxfoundation.org,
	kyletso@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: freescale: imx8mp-moduline-display-106: add typec-power-opmode property
Date: Thu, 12 Mar 2026 15:16:09 +0800
Message-Id: <20260312071609.388047-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260312071609.388047-1-xu.yang_2@nxp.com>
References: <20260312071609.388047-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS8PR04MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d96c96-3b23-4987-50aa-08de8006f53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|19092799006|366016|38350700014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ch/FGsOXNavmQdwxR/lkE/Kiu3qckXQV7H4wcbnxd+dnAtF4ydexL7toc7u4nHTg/mWZyNTtDbJJIHFdVD9WVLjCqqw/AYG4pM8iGBD8b9zYG3an2/WtSMWQn4Ax9+GO1/WNMIgBv6nwqRFqA+VDchmiqO+8jYOzEhdY98G84SSczLJgf9Q55s1UztCADF8w4ejf9NW4/myEvtT5WU4Zmv1X41U2OOY6t3Gah7lUVKdVYdlHvvhts2hVEgscjIR77hSmCPAaS4X5bVhgLhmzxDpg9wW/XYKwy5eCzubE/ieE5iPpoz7rRDY4Vuo+Cnp06n9HW9zBNWjLgM/BsYj7gEdV3XJlh82BvGcUfvN4y/bO/CSbYN8nS6AMENTwW7heMVIqpxiivNc6Q2M6IjuWu+5Lu5qenLmKoYWZMXEUfa6JSp7Wgxb/sz3Ru9moBpGvqMFL6/unoVcutedV7iYln8da8e4UVg71kXf4qWdzSf/ix7hLXdeWN94HZqmWPYVmpfuRdqpwoIpgvHZkdsl39nsVVPP28G50e2S84yWE46Nd3qeeKb0XPz3bAO3NsAtKr9HfB2ARKWM7PrLWD9965I2eAADWNrZuSa7g6R0E1yH2ePdu5vwZWFrf0HIJY2M2YivDeBpHYaiqCH4Nu76aVUZyElW5f6M6oxFk67uY4ltogQ6nLT9MWIm7flp6UDpjgrCtMZRIsR/ozXNMiku8vSrlWlu5y2jQfoCwz4xno6qFBfDTQfEvgdugkWgqlEhIL7v3I1/scasOCKX1CBVgKgLdLCvcE/yElsa12Pg7r3CJh61a+nu3tNT4VqRMjkAc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gto5zVf+2B3yY1wmKaBLkGaITVntIgVGp9Q9YPsmAcKHActoSu3jMw+ldrkY?=
 =?us-ascii?Q?xSafbQ/qyJ5rUHg+H7DWTaeujLxP+I/DKnxsX/B+R+q5JGpWHPf7lqsheAO2?=
 =?us-ascii?Q?UrAYWdq3rIhwDlciCqemqDx/DyveXpkX0exhYeKvQAPshTAz3ljapYVl52Xo?=
 =?us-ascii?Q?l8vYO8jdDcg+67kL+PunTHDzpCCj2X3Zco1XOF6oYalIEfWYYbiUvKOlNkGI?=
 =?us-ascii?Q?+2z5kZYcBcXOsD1y2NDZ0kbtxPG7X+w0O+pR/J+6ceLNmmKYW0tlfjCJp4jE?=
 =?us-ascii?Q?cRam9rCFE8zzEOGRDCb1U+Jq6v7Q/5/G3t6CO74ZKGkchdjByM/Y2cKEWyJ1?=
 =?us-ascii?Q?h0VkCPvCzgfmqpwSO/58jWgWp+4ST8jOq0xFU+/u3SB1kGKRiA6AeMI16hGi?=
 =?us-ascii?Q?lhBTRe8hgR8MtVygVJdiqFscOY3apaS66z+MuCk0dwS32Rr1wHSEY0WiziDi?=
 =?us-ascii?Q?urIu5zt+C00yEt6YScPKEgv3x6+WWfdeTEdHMZuqa6pducYDTJ5Appj6SwIn?=
 =?us-ascii?Q?qAh0rVBzpLA8EJr46x8eW2WZlN88zb39I6ws2qNhl6ehbm439YkXbOrrDozM?=
 =?us-ascii?Q?JZe5nyUthzAUbQ+HzDGfXqAGEDSD7z30WpQdo1pLBePD8msL+nFG+I9miYjz?=
 =?us-ascii?Q?nviCfXYDRPXWAjtuz+OGfaLVECEEbQremvCHgDBDyuv9iNZi1TYymOMRFeeE?=
 =?us-ascii?Q?3qMF85+DrN0tkZrodzZm/wi1stjEm7nDALilpqN4VobwYI3z5H4lFbH+qy3U?=
 =?us-ascii?Q?W2fGAYhuXM2Ie9WFoLzMKFameFFs4Qio98eWVMnv97I+0Bwaq7z0IfVbZSsJ?=
 =?us-ascii?Q?TGO9cKf8yth/FVmI/dSJ4fWIfFZJ2sXbX1uxeF/G/TeR5C/0sxYYv3Ur1cLG?=
 =?us-ascii?Q?0d5QlvQaTbESDjTgnF9KJKBZhISF7Z+4BAKTJ8XA4okA2yIn4aTr6D6tF56X?=
 =?us-ascii?Q?PHA+nUX9yTdmUyGwOd9vKZ8tQ8HlyT9ktQo+fkxBWN8UVzseJ5YUfVstO7sf?=
 =?us-ascii?Q?dMRHQyLdRZ0A0OQyAWXtiky+BtSSRYiTQIeWk9uNtTyI0FdKaC5717qDenEt?=
 =?us-ascii?Q?X7RcczOe7IfKUcwlq0auw73jtloBOTJ8m49AIO4w7uHCqZYHQJVTrRI2sJyS?=
 =?us-ascii?Q?F5b3Cozv6u3ZOQLjMdfnLE6r6HqhUDExmoRbMn1VuE4QRT7V4vb0UgY8J+ad?=
 =?us-ascii?Q?Zsz104EvmSXl5LRtH31wkgKgJJMEhAoNYw3RHgsXKBbGE8LgvJ7vCK8oEgBt?=
 =?us-ascii?Q?OG00wT/LigC5MskgczXLB9pG1s0TMeAFmH6UHmddeT6LUs9Gp04L/zl3jFz1?=
 =?us-ascii?Q?X/zak+ELFQ/wSplbNHchUMMD70jcm1GaL8PU2ERV53f577XpsTc+HZfXHnq6?=
 =?us-ascii?Q?I8YdsVz0gL4XG+JBDj0CCYBgJJCxknzp2s8ib0KiGZCc/nRfLnEvAiqnzCaC?=
 =?us-ascii?Q?np/f33HDDsKZ49P0vNCcK/NdnQBYLX3wiCoGd+8S+GFJX0MWLNRkv2yxtoDy?=
 =?us-ascii?Q?r13dtVB8fK1JICkbzuIlFNPVPsR4VNVW+w+kUG6xdE/DJbEAk4GUwO4Hr8Qn?=
 =?us-ascii?Q?I75KCVCdwf52YvX/f6kMF8KRKDk7qJAQGKiQEZFxApnZtkqBxIfUjqBCGBwE?=
 =?us-ascii?Q?7rII70j4Z2etNtyrN6ZdGyUssB4gk3dCgF9dbabA60immgnmdoKPx8bemE8F?=
 =?us-ascii?Q?5kxFVb2Il9Rv1oP0f2araPbHzVewH93/xckRndFaKVKlrdcfJuJ7/UYyU/Z2?=
 =?us-ascii?Q?Os/Ww1iaQA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d96c96-3b23-4987-50aa-08de8006f53f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 07:14:11.2760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZiITF+hTLxBzy2zFMlBUoXcQFsdWS+DMae3RCHddvvf0rqRyy7Ok77qsHv1iMrzR5pREKgMx58q5uKhRtunWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8706

To avoid dtbs_check warning, add typec-power-opmode property.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 .../imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
index e3965caca6be..c6fc5d5b1e5f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
@@ -77,6 +77,7 @@ connector {
 		compatible = "usb-c-connector";
 		data-role = "host";
 		pd-disable;
+		typec-power-opmode = "default";
 		vbus-supply = <&reg_vbus>;
 
 		port {
-- 
2.34.1

