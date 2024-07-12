Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEE116F83D
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 14:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720795178; cv=fail; b=jB2n/rRi79dPZdF3bUXuF1UxpHqLAHAh+B4MSh64ztYcVcN2EsV7Xciaa44kYBW9lIjkdU6yFg6dvuPPevGLx1Ioq4knWsMFmHYsaJB7TS3sv/Kb1tENYA2jPwcSOH9o1EdXazCP0oKZVa0COpdn9k0QPwi3Y4gxpN+ewqAbn4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720795178; c=relaxed/simple;
	bh=qRp1uTjEmM8iFG6GYIDJsswm43R9SS24ppLBxqE4c9U=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LDefm/43lrJLc6tFJR+G68uwhGA6rJHkfAsjPPnfo/CA31X5JljLkHENYXn5wWNAZYGPBQpbtWm1JdCUH1Lw2VMDYJhBS0/rvMmiB0JGq5PIAfT09NaXl8qgFrbYTqfWsqZM73S66Yj7PlGUIPquVDS3+hh6BN6uFF3iLN21pig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=igfakRhd; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="igfakRhd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flcSKxqjNZw064NesOTuBIk9cwgAHpZ8uhS//RNbJkzhLuYpZ3uGZC0Ke9Y35olv1U6uPN6L1yBFcjcJ6UUoCAh1KChlPjHPHNbcutEpYMxTgahVvjVJLvM4Eza3ugPk2JMs4ruClz7QXcYJURCPFggWKjITycjddMieYuOdoz/W/Vj2vYw9IebLt/rzAv8iKA4zgy1kQmMKNUMAK7fKaYUree0OzkpbRjWaymlgt2egZ9VSW3dEygethLRES21b5krQgQANVk277FZWPOX1uGUIgmg1Z6zanjvCgNmqpFNfDTAv+xHS8urrUEzbY3TRZHdePRW7VAn6DE/r0+Uitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzirjbBX3dLoIACF1ACa8UX2oehpQmaG6SIC/7y3wh8=;
 b=w89sRAxee8IzCpUCEGNSAmJD3vLaMgIuYkvsd4EIZ/oak0aypoxzVrqEmjpEwQdfCJw5FCIPXPkc50VQRddplvLZ+3HryUf+nA0Oful6LV9UndioGXllyyFSZSlyqxwx3o3vZ3CKUmqGky4SP6hjGX1TTTciNbWEtcR1RbDKyZTyQD+TcJ7Jw9n6dRPGusoWV6Lb66T0NELSUKM5RJXCoV1lED7TRXUY1gyly1lceTEKZlycheDS8LLbylpzyAMUt5WUoM9KXxVOZI6v8hdQRZQ1uRwPQweRe+vpuDJS7JyFQUxPY8utluXrZnFeKdW0RZa2kusO9Ip8RUBrr6DkHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzirjbBX3dLoIACF1ACa8UX2oehpQmaG6SIC/7y3wh8=;
 b=igfakRhdjaCulZ/7PVOGI0uxG/nS+Ivc4IPTuKAZ7qF4wfqfW28Phm88T6VEkFo28cgh1vlN83IJzInO/aBh8kMFxc9UTNiVvh84jtbjV21uF9s/CHv5sFMujUZK6m6T9IxwCQbjbP/F2XPg17y/j1li3eWDgExsqzCrwrAHZV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM7PR04MB7045.eurprd04.prod.outlook.com (2603:10a6:20b:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 14:39:32 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%2]) with mapi id 15.20.7698.025; Fri, 12 Jul 2024
 14:39:32 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v2] arm64: dts: imx93: update default value for snps,clk-csr
Date: Fri, 12 Jul 2024 09:39:08 -0500
Message-Id: <20240712143908.158752-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0009.namprd10.prod.outlook.com
 (2603:10b6:a03:255::14) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|AM7PR04MB7045:EE_
X-MS-Office365-Filtering-Correlation-Id: eadc0425-8cb6-4780-ca0b-08dca2807141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GstVi8FWUwAYko5ROQAomlxj8jfZe8YVIkoHjqBkpl3CpRVUqqBeAgK6XdWb?=
 =?us-ascii?Q?0YRblSyX0DSdbUXxRPL68K/4ipCI/ze5X9AzIrRopSPpthMsEus6LKEzUnMl?=
 =?us-ascii?Q?hlGtK5jtmsoTZv6KA5vagW92uN3CdTeZxVkhVw/rcjMQAKsc5P3k3gE7VnFK?=
 =?us-ascii?Q?OD+UFP4dRN6P+9PuWrJs/E85xEgop4iWVpUoYX5tp8vnpMXkQj4usVPlBy5w?=
 =?us-ascii?Q?VCEnkvTkEhq7F2IZ+IyQuhkGYvSAqhI2VINTPbQVeD/UkOs5vCChpS4ZEZAR?=
 =?us-ascii?Q?v2Ulq5KL/aMG5FcwjzLBFl9GrH7uLxO9AX0LmAKjBYTJ6Vh70/zJ/9tbgEVP?=
 =?us-ascii?Q?QZp21AmYBTePOQnOim2a0R1wku4IG8d/DxPP3xjpWAhCj29b9sYm/YLzeKaC?=
 =?us-ascii?Q?3C+G888Iv+4VmGl9kJW3+S4cVCkoY23rnz77fpVCW+St5F+OrryU/eZG9dFc?=
 =?us-ascii?Q?PTKEIJl0+AsNdFwC84JhxMUYFi+MX7ut02sAMI34tnYhdWKIn0sw26SIF3Xr?=
 =?us-ascii?Q?OTbr3p2TwDj9s9CkT97RmWdTA2iFBhQW6PsrdZzS42fwBe2rgm5ozgzf+wbF?=
 =?us-ascii?Q?m/KzQOVd/SOeVERSnDOebFsqgcmxV8C2txGUj4q40YG2gp3WAm4aOaOhPQ4S?=
 =?us-ascii?Q?SJwo/UTzN+8+yJVkembbScFABDO+ANshEVytPZiftqTOhdt1MKo+C470T3ME?=
 =?us-ascii?Q?ZLrQ/hJg8I3UoiOPRLh31GlXYRIelbNlQyaSpPkFjniP0J88UlfhRxCA6OV9?=
 =?us-ascii?Q?/0Ktml1O0bXJ/PzP2o6C7/YsGabJGZRMtxd1R+fLBpjdIM7/8QS2T6OEaObz?=
 =?us-ascii?Q?6jXpaQiXdz+rf6Z7y/n4vLyYbHd2yfs3+BHVaU+kEsqld2whSihPzM0UPtXB?=
 =?us-ascii?Q?pPMrlTEC8mriQP18Mk/O93PQCIA0eQYDd9/aMnyh/MVwxvDzG7UUFkm0JMtE?=
 =?us-ascii?Q?PdJ/1fu05FPk4vx9L0BNUIBlDKblBc67EdzdAuHTTnH6AS7qDmn/xmmTY27T?=
 =?us-ascii?Q?Px2XB4oQtsw2N+K6VRwktyPDyO1nOUEfVxxx6DOGNnwk/M3luZ7OSSobPgO0?=
 =?us-ascii?Q?exhnJvpJSdXIQY7pT/c/1RXVIPnbp7OgKCw5pATrNO/DwAlbVRZ1fNgsqxlq?=
 =?us-ascii?Q?85coszXr+YFBI7NxWkiesbF1TuJE+EW7gsmvWnXr0OD4uURAr+aJvGdaexQ2?=
 =?us-ascii?Q?mr7z1oLpYMZJHdNTkuO10uTRF49/gRuF7KEC2O0PB2rV/qo3aiPZz3PR1pII?=
 =?us-ascii?Q?Nd0t9+g90xMJEzV0fNaPeSB4UK30n9YdQJ2ucvSLNJUmUpZShlg7YlOi0ezr?=
 =?us-ascii?Q?B4g7zYdUY54vuI9hCJMjWfED9AZ3tzsdK2GqtjdA9qBvdbGMFGvgDdhbAs2j?=
 =?us-ascii?Q?VOUMaCrdpl65PtgAGWZpqewddAghXmK9LZ8xIunECO0bL752Bw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ZOkyMgTYqWkvYNDiX0a0WSR031Sxh6S5EgXKch8FvlHoiIeOCPwTTT9Y8Gx?=
 =?us-ascii?Q?8cE4JFZ01ClBg3L1/czdQvebeA2imYx8bxfPBlVAA8/14L3jy6VHl444M6zx?=
 =?us-ascii?Q?39FXyLh5SiuuiVcyRi0DVk073cDiQqzTSPgpJUaFXLLOwVzg90PONjWuVSQt?=
 =?us-ascii?Q?JnYNbSgv0mi7izpGX/C2bm4tatE6k9cyPF9K7Jg9mX+dtXuc9o+3i6f//DyN?=
 =?us-ascii?Q?Pe7ryKn6P3vmIJr0Gw2KSfLT8AP9ML2LbOPrX16ij9IgJvrl/m3bcgemtGfH?=
 =?us-ascii?Q?qootUmFPyd0YK8FlPq5OcEF+2DKwrecGT/MdIxoT0gMgfNkd8mGoFz5MFq/h?=
 =?us-ascii?Q?8lTiS6e6qDkBiWYrchHIfvZGxdhek9lKG9VCg3AslvfCpRKA+ITjSvOia6a8?=
 =?us-ascii?Q?XxZNlyqhcC7r8AJb/khmHJKxcD7xerberZtXqb/CVOCU4sh0DOxx1vFREVlN?=
 =?us-ascii?Q?cBBjQcnAbj+7oXFy1L7HP3pSHn5PPCvy9Qn9cz7jRZg+nomzlFxWj/HdP4h+?=
 =?us-ascii?Q?YLRwISpcDuspd7QrWfCuxZk4Bm02K70C1jAaapJpHMh2NWGY5dbldF6Hmxqe?=
 =?us-ascii?Q?v3uKVza099EtjIbSGp4zlJBeq9/ltPvyGqn7d9oDSfoEJz8LoEA9YegrolOn?=
 =?us-ascii?Q?9y/cfjTJXuEivl/JcwndTggFFwy5B2UBDPoVzP4kyN6xhXnlygA783aC4j31?=
 =?us-ascii?Q?eKQ1Uzx0j2SsEbV/FJFRcan73KAXZXYTDzQ6P3vGORr889NRMizGwWa9xvGa?=
 =?us-ascii?Q?ltuRPKdIqBw++GD2t+KREGS5GTJOqHpg+SqYnK+dfjCLh9td83tDmqjzWe62?=
 =?us-ascii?Q?N4Vq4oKZ9hKWys4Y+GbIJUM2+S39qtAIUfIUvFfddOjd3HIpZsEjCKYyxTI9?=
 =?us-ascii?Q?6dzGlsRP4YO3OAXx6NTsGajdapDDIQ0w8JsUpXPIZLPEwUYTM+ZybM2wru8T?=
 =?us-ascii?Q?2CXKUxvcJzuaYkOhP+8Z6Lux85MOK93EBXOyNByekiiuqN/2AWil0oGYoThn?=
 =?us-ascii?Q?KAATDGEqGGGeOdeKUIXvs3sXkRNR9D8eNn52qkKeUQsClUF4Pn0wJ8MAz5jn?=
 =?us-ascii?Q?uLTU2kpHqZWVcFyNvSTXvA5IlOOw8uCXl5iZQmLcuXDHXJas7zLhbjp4shpr?=
 =?us-ascii?Q?ccQduaBbHYlwq2X13CEhvoI8eX/nOtQO9TsS3IFQfDiz9MrF/DvsKXoZCRkP?=
 =?us-ascii?Q?ooop6InxadDH/6Bks9OSt2cEPLZjGnYNCBHdT4v4Nn7CMEWe1tQ9RHYf2Gdj?=
 =?us-ascii?Q?Zd6IH7rRYRQvNODcRxOzqcaMZULZ4QVI2HqiAmcN3BCMzsAGWI1CAEceYK1p?=
 =?us-ascii?Q?X0gZ18DRetzgw02Zrj+7/2gfA9gur9rzWemdv1XlULhFy7d0VWYzEg1mL4ki?=
 =?us-ascii?Q?n2+fa9hWkm0AnwGvgo7qbMN8MxNnF0SFPWNzKhoXkToReCxeOQmF3/LA9H+T?=
 =?us-ascii?Q?+VJY72PL6hf8w+AK/scq/3Q0ZTAboEu3WQ7IQXZtOHX/bopARm1RUXcukwF3?=
 =?us-ascii?Q?f31mUCKGXp0ruDGzSYc6QwLedSJ7xNhRLWH6XCZjWkQMscaeSG1Rt0+ryqXk?=
 =?us-ascii?Q?QJjAk7IuGx/NJP3fg/6F9y+YJDXf7Slc+n20JOnt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eadc0425-8cb6-4780-ca0b-08dca2807141
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 14:39:32.2213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C945qeB4jtVqMzLpqm83xr6ZuoQ1hX+rOKcGaNo9F0FdxPeasNnl11JxRoV+TqlVHOXdctdYDgULJQi7QhR7uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7045

For the i.MX93 SoC, the default clock rate for the IP of STMMAC EQOS is
312.5 MHz. According to the following mapping table from the i.MX93
reference manual, this clock rate corresponds to a CSR value of 6.

 0000: CSR clock = 60-100 MHz; MDC clock = CSR clock/42
 0001: CSR clock = 100-150 MHz; MDC clock = CSR clock/62
 0010: CSR clock = 20-35 MHz; MDC clock = CSR clock/16
 0011: CSR clock = 35-60 MHz; MDC clock = CSR clock/26
 0100: CSR clock = 150-250 MHz; MDC clock = CSR clock/102
 0101: CSR clock = 250-300 MHz; MDC clock = CSR clock/124
 0110: CSR clock = 300-500 MHz; MDC clock = CSR clock/204
 0111: CSR clock = 500-800 MHz; MDC clock = CSR clock/324

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
Changes in V2:
- improved the commit comments per Alexander's feedback

 arch/arm64/boot/dts/freescale/imx93.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index 4a3f42355cb8..a0993022c102 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -1105,7 +1105,7 @@ eqos: ethernet@428a0000 {
 							 <&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
 				assigned-clock-rates = <100000000>, <250000000>;
 				intf_mode = <&wakeupmix_gpr 0x28>;
-				snps,clk-csr = <0>;
+				snps,clk-csr = <6>;
 				nvmem-cells = <&eth_mac2>;
 				nvmem-cell-names = "mac-address";
 				status = "disabled";
--
2.34.1

