Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010055.outbound.protection.outlook.com [52.101.84.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B326396581
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571770; cv=fail; b=KWwPI2JzDQBudaJvpb4HiRRjQwJpjnAh1830syvg/CDjFYGNZm9SYrPKtXJy/+S50im+4PDRL1XCDTmAFNWtL91oplkTCjTRl1S+gNUtBoiMisVJw0bxciyg46wcXMtDGDe7VxUIHrM2ANXr+4XYCkKT4bVpBHiU9P+NQljzGlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571770; c=relaxed/simple;
	bh=12QVan7ZmG8TQPX2bO4bb/7XOyX2HGErbGIZIb9CEAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IOpE5hhgTsV7uRo7GDyJ83ix/Bpbr4AaSvYl9yHjSlf6LFMBJ1dhDpz8Xb8qx7W5vaKCxldkE72wt7xi4ARHYAohzth6WacQSHsYRy3s/+BK18qFTvuGgdIlzUPrVzG8HPB7bcouEs/Ug6WkmpVhVLdbgBXz6FKdnF2zrN4avNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cZxHf0/k; arc=fail smtp.client-ip=52.101.84.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cZxHf0/k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0Ix6uAkpbHmmM2Pp3Hq/hzpA1wlLYrlwGs2ytz/G2zsSF5LnMNgOhvdkrZbJFwudMYP3LbamQMo0PyE5EPCPGIYmJW8N/2GvUWmUl69+EqpA4cbkY6yPo0lSyb/Ro5W1RK73ZipSt55pTRkjxi00C+As5boKtS/2t84hyHJCcUMrsTPcXFZ/rZomDw94R2chq6zWXhK2pCs5DdQ2nZOK0WnHfmBvSOJ89UyksL9O/YyYoUqCpDBQ3Tq+TL/DYRnhuqjNtsf5HD6zqlaHFDVoIQWkQvu7Q0mYWLt7HqJfyWGAhsKT0Gv9H4pYpTYlZKLU/XZSoG7QBhMWb/ZlcBpBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4D1pZrO4apX/1YcT4ka90xZ4bVrSBjqoNH4I5Nea2g=;
 b=GWuC99ljBYF/hWG3Aoz+8WQGk7thRiocckV99zpv/kFwIQ0jLjo/rd2tHjJelmJ1tycH8541mxc5h0ZoRJIXCsoWL/6hBM5C8H6vxcbJnKfXFlyVSoc2ieWtIvCD0Brlb/s4xIR3H2NHwMmdO0Lis5mlNDnt4sgJt700N38fPbTcpghzKCu2UAFfwQTW4BDcvc853xJllXUJmdmnZHBjLXa1Ehmu9KtLKBGW8MmUQZIKuwNQDXALjlnGa33dx26Pqmrd+QOEema5ogesiyVXgaMWUsHoRDDM516NC3nNZ3tsnML+pD8BxRxFUNo5jsHok4wGBZ5ARCV4tqv+Mw5gkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4D1pZrO4apX/1YcT4ka90xZ4bVrSBjqoNH4I5Nea2g=;
 b=cZxHf0/kvXEvML2VyqZGnHpdH0TpgaUioiYTYdWFsjMonj7E+e3h/UghTN12+jwKF/lFRyWGcKSdfPc2PuKkqUCjxat5d7638l3yaoIXSVY19OAUZTN3+srSV1PJTN8t+OspMd8BmYC3ScupYdk41MPlvi5MHOCJR7DMMT4iWKpTx7/Uufew4G9gPuC615tE6ztqP0oGzh5uYCmWi0IpBwMO9afdxezrPPIs6AMDWKMNQFZ+VdlVTejd3B9tdGaaFNuDloXy4490GE7thRYShg4mBo/LJgPem4ekrAMq9uHCgNZWVaiET08Gzk+QwZfkOHSV1MaAGHxMPkZp1i/DSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 21:02:45 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <frank.li@nxp.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: Support Cortex M7
Date: Tue,  3 Mar 2026 16:01:09 -0500
Message-ID: <20260303210131.2966214-14-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303121324.1576841-1-ghidoliemanuele@gmail.com>
References: <20260303121324.1576841-1-ghidoliemanuele@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 0091ade0-d145-4a6f-1608-08de7968377f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	x3BtWige7cFcURvZTXPlQHgYVelDEvszUDAVgkzASGPSahzU0Ycx6p2eMRpCKcU+V/oJb1JJRNb8P0gsLKgczMb1Fxhd7+LU5J1iCpYPllyqCE52A9XSZFqz+tReZkQ0jwDYl5MZwbAR4p6iPNW4DKhmDuLN+7Q77GvAsv+QmkyMNoeL5g9FCpYjiSxwjQwGainVNuYa53ofO2c7lNxsIz0SSR5tfRFoGQfgdTIJ1ZwDgetW8HGy0KOU2eW6KY1Wny+FpBAk5m585T8XuTLyahMcTAF0Oh2w0ij3rn0OLIBLj0xt6tQImpRtmsRk7NCmI0w/tiVQ3zU0775ue/BLcD8HoCoa/NQiHr6lpizVPtYav43amfke8jXomNZAwWKX5GuweXY7cVS1zaH9qDGcgRH57Yg+2AALTIcVHy+IRGxt1zdOrAd8y3DfAZ4Rl8VXmkNpfPPSO97oH6Pp6MsMJNF/pny24igDAt/HdbqPd9QElFtrfyW3An/N9tneYzC/pIfzi1wqHU+AdZaHr23ti0M2/c84CZUNT2z2+w1JSHvXQHkaiVMq/M0n10zc0rYHHWAACI+4GiMwMhbjJVGbcXbr/sOodz8kKMsi9rq5oY/A8MAr6HRYcdi+xtrOvZgvQqPXEcY15PPpEQgko7KvjYBhBSjSIVFFBc/MQBX6woYd5joHfQmhM5yGzjYqxrCcUmrtpe1UQpFZJAvrpPrW5yWHCk0FTgpKBMeG0LjfOJhM0O8T00NSTyLn2dPqIsj17dqG8c2zo3H0BKDLRtBzPkW+6G2c11g46l1hDt0hO18=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YzxmYd1KKJuy0fr0YcY6AozN4cqAKX/4GLz19AciIiv8ACotomJCscH/PDoR?=
 =?us-ascii?Q?hnTwPpPTy90k+ao5ire5qL22wY+YIdQn3haS+VTgx5t9VOExTteDCPzHGL9E?=
 =?us-ascii?Q?tBhYch+5fFZYxwVtnhHIMJ3TR8o4NQsE55R2wp/+1Kc5q2dv7DvFv5qDw3Mc?=
 =?us-ascii?Q?rilhv4vTGB+zasT7wg4EPChBVNJx1WX3TzP+1k0ffzLD3NFdllzTt87ox4C5?=
 =?us-ascii?Q?opV/QFMPV0yjNJL0Jh1u3xGBLkVljBgH88IKYt6WIpGEdFBXoXwAMhiyyNz3?=
 =?us-ascii?Q?HRSdRS/EhhpbtvKLKH2eqpop+6RgA9RC/0MZGd5o9FJU41JLF6449eop1c3i?=
 =?us-ascii?Q?NoNKSr9WWxQvn76s8oB4/cxQ9gRjqpiM2I2fIQ5Gk07Uav/ExtA+kCrRYbec?=
 =?us-ascii?Q?3reY3q+4elW2vanmbfn8C03h2alx98y9m53U6U0yV1VRWNooY5jDvrGQuQlc?=
 =?us-ascii?Q?LPvah3aLu5R45uDnkvfp0MLZPot291NTnDwR5XoIb3RLitqSiURW6yUpyP6F?=
 =?us-ascii?Q?Uh1roZkmBY+EmeHLiNIdor4h4fvd4+wPSSc0j9f7kg+MtCOudM3KhnlJxxie?=
 =?us-ascii?Q?4aJwnZbhlIAfa1fmXtY5xxVKLgavqCqA9N89KrlWK/1sATVmtfMZhPi1BiQ2?=
 =?us-ascii?Q?j+ULSx/VreV1yyhsxCpGH3x5RbitI88fSt281boA8oNRYPpRicObyGFDMh/f?=
 =?us-ascii?Q?aZlXShiTEPSUEdyFhez9e++fxpgRWol0ycYuVawE2VsF1owHSkqXaEV6GMoF?=
 =?us-ascii?Q?8NUq/mEmSI9pIZCznHTDLGzxeknTVAIRTQVGQzwSqqqIM8z/UPrsd8PgeiFa?=
 =?us-ascii?Q?um+flqtai5eOa3JRHNQ78LQC7qtXwhtzXEKwYb69a71LpiY7ZMX+9Kc0naYh?=
 =?us-ascii?Q?RjbuE1KNFO3pB+HeCubeiyA3Am//X8mFe2AWCWq95OkD/1wxKONwfXqjKPcQ?=
 =?us-ascii?Q?oUKkH3x3LJUkZzrIR3Z6DTaGM28eBknxdJq47zmeKVp+qlF789x8O0MYk/PE?=
 =?us-ascii?Q?d3wxylJKIG+4NCRaoRhOvNGBTwMRLBgvMzGuXWRWoKMXUQpe+W16p2cffS+5?=
 =?us-ascii?Q?DQaP4uPMQfrxa3Deq+rs6iYcIkirqnF79PeAl0DfZ7D1F/wotof8aL3m52lF?=
 =?us-ascii?Q?+6KaxZnFhp44HRcQCy8FDyLDAiRLfAfQMWw8uJuGnzBdnoAqOZDuhXIZcBbI?=
 =?us-ascii?Q?pQgJtIU6sZpfARgWhc8IsBJwQ12EmP7x/v9XZTnTqY1WKWBX+JUr7kqAugEv?=
 =?us-ascii?Q?/1d98lGDiPJbr5Q2QCrCJTvmk5S+8RyYsvposSe4wbvWI2luH6U3LrXh+pbZ?=
 =?us-ascii?Q?dZqBo0l4HGE6PMKeZKVVzGfJnDR8Hy/DOI71DnJhfr2Ca7SW5P8yfauXc0nD?=
 =?us-ascii?Q?m6W4QLlXapXvgXqGbNECq+UeTTSZTxY4sIDCWcH6buB9fTR1RO+OqfBXTYN6?=
 =?us-ascii?Q?aY6YkMmGbMaRCSN733RVoPsmxcz0SgMjYWin4xfiSgE0D33HuM3HUePaXJY+?=
 =?us-ascii?Q?Jhj5Ts7jRCmqr8VctlZ26V+l+IkXpFohONmOiiVywiBiLyKV96DzWHdaGBv0?=
 =?us-ascii?Q?ZE09ZBl2bBxqdxR6SC5a4CDyVSQk09oKfEIR7xHpMIycl+Xflhg/5BNVrG2d?=
 =?us-ascii?Q?avUr7w2ytemEzQXaT9YiDYJC1iMpM0N0/7NdObUqDpZkeKfk8suapWkNMt2f?=
 =?us-ascii?Q?YdeavwuFVdR14/1A5GhxE6iA34frUEut2qgSRdaQz9JTi7bjZHxEh+r+3wXA?=
 =?us-ascii?Q?7rbXQcHqYg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0091ade0-d145-4a6f-1608-08de7968377f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:45.1078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dn08bjiKOabFKO6oMqhzOLvLwZilQIfh4ft+iwWGJPyNcDvoU0ibhea6BgBXCAYN5YUVI7jYNxh5m3ojnZkMeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858

From: Frank Li (AI-BOT) <frank.li@nxp.com>

AI bot review and may be useless.

---

> +	cm7: remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mbox-names = "tx", "rx", "rxdb";
> +		mboxes = <&mu7 0 1
> +			  &mu7 1 1
> +			  &mu7 3 1>;
> +		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
> +	};

Line 51 exceeds 80 columns; consider breaking memory-region into
multiple lines for readability.

---

> +	m7_reserved: memory@80000000 {
> +		reg = <0 0x80000000 0 0x1000000>;
> +		no-map;
> +	};

Consider adding a comment explaining the 16 MB reservation size and
purpose (firmware load address, etc.).

---

> +	rsc_table: memory@88220000 {
> +		reg = <0 0x88220000 0 0x1000>;
> +		no-map;
> +	};

Consider documenting why rsc_table is placed at this specific offset
relative to m7_reserved.

---

> +	vdevbuffer: memory@88020000 {
> +		compatible = "shared-dma-pool";
> +		reg = <0 0x88020000 0 0x100000>;
> +		no-map;
> +	};

Verify that the 1 MB vdevbuffer size is sufficient for the expected
virtio traffic between A55 and M7.

---

> +&mu7 {
> +	status = "okay";
> +};

Ensure mu7 node is defined elsewhere in the base device tree; this
patch only enables it without defining its properties.
