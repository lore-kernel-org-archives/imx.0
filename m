Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2076.outbound.protection.outlook.com [40.107.241.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720891891A8
	for <imx@lists.linux.dev>; Mon, 30 Dec 2024 02:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735524840; cv=fail; b=Rf5XNuqv/wIxR8ikWiL3FpBFf5VxfY/vxi6z+v//MLI0pVOMcegwD39E+PulbJMYY55WoP1PboHqMTMz4XSllxXdAX+APtDK8QsYCP7IdVM7zn6IV5QlrbyL52vvCaZ6SukUTVzWqI/jFY5NNUZRkKEX8lecN4ykZk6Tx5p3glM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735524840; c=relaxed/simple;
	bh=HyOaRi/dnM4Soa5SpnKZp6R5JSeoTOFA3q/Sl+MQGL4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ou+LUDvnlvbJiIyMHlgLTXL/Ipy0J8Az5jnAK6AJ3GPmYpTBMykNI4uT/FGj2flQ87VPjZeNIH3J1tqBH5Id3SwH0+cZroAJGTpv4Zzlm5pn6hEm/zyl47tUPDcOL6r0aPoFsFSZmYsV7XJFj1iJszO6kc9eObDC+7QFa0+etL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QMHQU3VG; arc=fail smtp.client-ip=40.107.241.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QMHQU3VG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2jvb4b3aw5Tm4D1EzN6Bz0U3kuQtLKkZUIQSwcjcRMKrLuvfaQcMjcc1HSHVOeW0pD1zhgc2pmZ6NdzOPOL0gAlqNfKvn9vH+r30iZjTiCjYKbvyDRlwfBI55mpwlcjTEQgj6Qi3Mz/9FEi67ESOsa6/f99kKsC4rJTtdm1FmxKR03EftXqubGjvQniBINL7BVc80oH+j49fsH61V+8CXa9y5Aq9tzM5TNNQ3rl3FqyMT7xHKH31AAvjACNYNsqZnMXAVj8HlDRyfqc9a6EJfeynF8zCc0vlPhwbpsMY1gQmrtqVDM00iZg16wqwXHkeZPLS2TKE+cq/dur2qdkWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0B4G8MN545KY5DuLErpQHfauyMfoQEOJiWu5zMtND14=;
 b=uLXuMA9AuLXbj8yBLE+QPRHnVol/3vEJcJjPznHyuvvwvpgATvg/E/zwnfrQ6chLqbaqm/IgocB+scU6EifTkkDclsv/Q6ztWqsDz/ryqbSKwg2kux1qfGMbdpSATqpPublWvbHGIotUUgQAsIBq4BHqewekCuauwMEr2pabeTcIYWkT3exVvAvmTtt+nRhm9LRRB1xMfVMt+iI3EEpKXWFil4CTQ1W8BbDH1C+hjOfhXkLLJ0lW+5gvBGw5vHecnoKdpdvSsPWtsAUBotsRhtIPMVD3HMf4M/5z1ZVdMOeS00RJIQUbPczhuCw3KnApHI3j/RG9+0AIisW/w4bdLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0B4G8MN545KY5DuLErpQHfauyMfoQEOJiWu5zMtND14=;
 b=QMHQU3VGT0TI17v7DCihQg5vafxjkW5iMIxeCscJZKl0zZRYtrGqBSzbc8cN5HaTbExudpkVqTvmHLRS6M1yia1xb/jD8OHTrApxsYvSFr4bENbN8MRmzTdQY4ywPG2TcC7G5MDAgUID5yLB/l1CM/PZWcYQU5p3iVLKiiCGTEUYkUii1+YUMEnbD2utPuybfikUuEuGejOy8UFQ4YXN7cBjHmcDJCnSIrJvaC1noGqMDr6veDaFdKsFMVOmiyzh66kSSEIAlBg9ToJ1KZ0wobzY2y9U0yKjxbS1oMsEEhnSiaBQ8dX93YruzXgJlJXM2DP6vL2dZSlDl+T0gU0bMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9821.eurprd04.prod.outlook.com (2603:10a6:10:4b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 02:13:52 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 02:13:52 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	tglx@linutronix.de,
	vkoul@kernel.org,
	kishon@kernel.org,
	aisheng.dong@nxp.com,
	agx@sigxcpu.org,
	u.kleine-koenig@baylibre.com,
	francesco@dolcini.it,
	frank.li@nxp.com,
	dmitry.baryshkov@linaro.org
Subject: [DO NOT MERGE PATCH v8 14/19] dt-bindings: phy: mixel, mipi-dsi-phy: Allow assigned-clock* properties
Date: Mon, 30 Dec 2024 10:12:02 +0800
Message-Id: <20241230021207.220144-15-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230021207.220144-1-victor.liu@nxp.com>
References: <20241230021207.220144-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:990:57::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: c76f7b1d-43ae-4db2-78a9-08dd28779aab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UYt3cgBkmlAp2jmgzN+GvSpF8auJPd01Dg5tXpvd8GPiGCvBWtBlEUXU/d3r?=
 =?us-ascii?Q?+Yc7Im+XBlNbYzkEBQ4KDQE1gAxiNoLGIe00ctldpvxNwHANxQq4XZyjnATw?=
 =?us-ascii?Q?LyCEE/cHVZkzsfddmh24/JQc7Cu57CFuXeLKFYfxcg9/u0aJ7LwSqblf2j2h?=
 =?us-ascii?Q?DIrlCNRm16VKdVpWpZ2h6Uey6++40yqw2kuVQERskZqzHK/Th+ln1k2/D+r/?=
 =?us-ascii?Q?eWBtn26eieHQdvyimyQcOP7YtXGPQtuwEJFXgFDsPBsQgqSYg2zRvk7q4FVI?=
 =?us-ascii?Q?Cmn7+puVletDj82FaG9WvJTQJaCOOwsT4akeFq4pnjH/U3ilKIWeMod7puSP?=
 =?us-ascii?Q?NSGF/slULi5ATVdd9TicznY1+H8jebzOK+wHuSMd3v5Y3uWMZLVuQDjvtRgu?=
 =?us-ascii?Q?ofMDHbTiS0X3MZJezJjfm9oxIhfNThsyXBlE5GXZE2bd15vw0sl77jN4gs9P?=
 =?us-ascii?Q?EUNOpYRPEdDdnAya/GlsvW6P6av0kgUavDc19h4vYnzyXIoCwYowNnkhW5fY?=
 =?us-ascii?Q?z6mR60XyAADf9/JSCxErfgybUxuKauVtGov/uls0kvTBSnhtKmc4KSqOD0MB?=
 =?us-ascii?Q?23IVLxk0pXk1nNgSOcQpNwjzO7Z3qkqbTrjWLVws9SWWUg62XnQwtWl3gjM+?=
 =?us-ascii?Q?/7V8kqVNQTECLBX99sut1SNIq38op/WdUykbZupGG1SvRvsuaVKJ8vUXoDZM?=
 =?us-ascii?Q?Ru8uYfaAZkEt8t5rl+YbXayHnG+rm1sfEzkRoz3GojLD9o3AUBGAExhAKacv?=
 =?us-ascii?Q?8IcnzMQvXm9Sj9FofY54Q2BhVOu1WwO3XXncsCxNZrMy3ZEG7OOYITJR+x1n?=
 =?us-ascii?Q?0GeZQIRq6Jl6jAI1QK7oHGDoZGQLlflmxMFpz58EXEntjyjXeynq/Vpks+9l?=
 =?us-ascii?Q?FsdNeQ5l1jiBHeUk5NjhQsxXv5inOPzQ1gBwKtEKltJrDaw8DvG6bKPNAPhU?=
 =?us-ascii?Q?jPb1GhpTpKDjjmnO/W8VoTQMuwcOs5cNMsY1i5q8PnCz3FN48zdUcxF50Z9a?=
 =?us-ascii?Q?bws4Z0DoYh8FOABcfBqj5mxWnvzFNMhJosUo8R4i81m6hFpLdhfvivj5TsP6?=
 =?us-ascii?Q?9eMgMQf6g9vIWQ49CUYi6zSLktYx3BLaszGoYbXZCnOuElTNKF4Z0DM9cL1x?=
 =?us-ascii?Q?HMgZMrD9SO6XxoTZCfRdrRdlV/hOHSVTnyXjrk4kNv4L/+Ffnl3WSUCdU7sJ?=
 =?us-ascii?Q?Fe9e/3ayFbiV7uHoJ5rqeMmQyMkt8qXmowZMSHabREET03N8pw80koYdpRug?=
 =?us-ascii?Q?LXszulcOtnC5uBcQ5w7yqm2qOvl/tU1C/LGxHXND0CRytbvrdQ7cn2lLg1UQ?=
 =?us-ascii?Q?/zAyNSpUYaOfo16sD8bpJlqMnK5YF618Z/I6pFC5xhlkOYQumObwlBtTV+i+?=
 =?us-ascii?Q?9aaV4q3jgTAhVkNrm6EnzviSHTI5DbD/4AvaszBQfleCYW93idLmw6YH0WeJ?=
 =?us-ascii?Q?bCoMz/z7+fg165vKLjlP4f6gE+lkFUkb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MPnMPwK7W8AqKdYYyQlmmADxDrZl8+6Nq7DWYqIT7JicZrW7rj/XKdJ7nfLY?=
 =?us-ascii?Q?/ulQ/SHW99oDbQganA72iWMUubNTCPoml1PagBhV8BC08YSiHXdDS0UHw3QA?=
 =?us-ascii?Q?hWYpYZu/hiTcDMfa8BVdYqwwEuIU8za1Ss4gbANk4Pp5GEot/zx7hybki9dG?=
 =?us-ascii?Q?wc+0EoxbprwrHWGnljMqcUwD6oCdpLsFFWc9prP3a4Bgul7wGoexnIg3/2M8?=
 =?us-ascii?Q?X4rEarz+GjaUww3aLhPo0DF7hSLVKGQhI8Z5TgdRhIRWF65+ey0I2txgUApg?=
 =?us-ascii?Q?0zdbNoH+0m7hk5gKU7/xQWtaSdrGUeqzgCxGXIBLLYKlKQ+hCF/LqSRNP0iL?=
 =?us-ascii?Q?tQiIkLh4LwkXg6Cn7dsoqMewKiecKADtyOZAqb2fm+YXbnbPzC6BSyBpDCPA?=
 =?us-ascii?Q?rvZg+eKFLZI06B3Fx2juitFS4bRqzUNKwV++DsBjVBlAqJaFAWq1NB5dCoXX?=
 =?us-ascii?Q?3Xg5L9uwkusQtDCVN2CrtKIi4qZcbCUdym8UhGpTnFnbwPNQHdXRa98Tke07?=
 =?us-ascii?Q?vALgb361VOK1u89XlUJewmeuOUd5sYR4DBwGL/QOfAWzkk4yJ+g1e+OicHgI?=
 =?us-ascii?Q?Nk5ILnQrwdhOK5eecsO+VWtZOOA5HHWLB0xPp+lwCr922sQ0VRWGH+H4VZ8S?=
 =?us-ascii?Q?N3diNzyBIXaLIWzRLV3u2tpInd8ahgm9u7epYWe66LLekgZ8rbjUstTYQA8q?=
 =?us-ascii?Q?5i3m87PrDvZKR90yrcCnwop3bflsO+p+6iSVB4rrG7bFpUgMINDvbqzBhark?=
 =?us-ascii?Q?JEBcIjF2IfM0ZGTrlF8H/Y0yRbmWYJvlF5dvqg3DzWN8UwzYLEMgagWUBCs0?=
 =?us-ascii?Q?HA+YCsyTrxIXiOc327yuJ8bj7DbIDJApu/OgpJoOfwocoedc3qzdbjVX+iwy?=
 =?us-ascii?Q?FpBz9/fet27nOesHrPUZDeQ9q6zxqIGuWEuCABuvPTpEQDLf/AUy1qrCZY8/?=
 =?us-ascii?Q?Z+RilCLhtEDRoirIVNgC+TsmB//AwBdmNRMecyiGB+KMj0p/+Jq19Pb4aMdS?=
 =?us-ascii?Q?Bov5tNOe99TmSNxYLyMETkIV9ju0oMqm7Qgr65qW/xjeuNDf6F50DjRRbQq/?=
 =?us-ascii?Q?BGC7c500td+VVH0H1YQGO6oklquQh8Mg6ne38kxDZgUuIurtLQYrRMiIQKpv?=
 =?us-ascii?Q?mJ6vgY6xsiC2CywHz7EynjOdUrqxZnmcQCc+Vg9LSKMUUwcPGV8E3gqUTxYA?=
 =?us-ascii?Q?vxPiWnSVam5cbQ5XvFpZdYvllmIS9vyMRPrHoHBrutOF1GjIIrUFyfWG15UJ?=
 =?us-ascii?Q?kdc9aaIHAR70RURgaNx34LzbqxzcZ8eErJ/TGzizCiE9etHUdo9fd9EMt/uy?=
 =?us-ascii?Q?rWEEXnIxtJ48MUjE76GJitnvHClcEnMzcJqHwn1UbRKioS8u16VZSVP8qm33?=
 =?us-ascii?Q?vMBbn3F0KV6qrZdqfmEWL8F0ppuVROtPQSRElPuZJrLWQNsFZilt0TlYtMsT?=
 =?us-ascii?Q?8X3ubgZzoXq7ZpeoAWa1SQXwIY5jfOyQ9NZnNZO10Bh76i1kyLXoTh6ET044?=
 =?us-ascii?Q?zHb+KcWFqy4+cE/dcNyo5DT8JajR2ek3YtiH1YDz4MUuxRJt3LhfWU1Loytz?=
 =?us-ascii?Q?4yL2sV212rlI2jnHSaWx5xJ5QBD9fjTi40wXpTLg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76f7b1d-43ae-4db2-78a9-08dd28779aab
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 02:13:52.0712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 96YQm37qUIOfrYAexz1OnoG5aY4sWFHemo+bvhroycy3wmLM4DdaUZ3gow4KKvf/XP7B3sDHo8Z6gzFhSiEXPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9821

assigned-clock* properties can be used by default now, so allow them.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v8:
* No change.

v7:
* No change.

v6:
* No change.

v5:
* No change.

v4:
* No change.

v3:
* No change.

v2:
* New patch as needed by MIPI/LVDS subsystems device tree.

 .../devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml          | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
index 3c28ec50f097..286a4fcc977d 100644
--- a/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mixel,mipi-dsi-phy.yaml
@@ -72,11 +72,6 @@ allOf:
           contains:
             const: fsl,imx8qxp-mipi-dphy
     then:
-      properties:
-        assigned-clocks: false
-        assigned-clock-parents: false
-        assigned-clock-rates: false
-
       required:
         - fsl,syscon
 
-- 
2.34.1

