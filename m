Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011036.outbound.protection.outlook.com [40.107.130.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D784301460
	for <imx@lists.linux.dev>; Wed,  6 May 2026 05:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778046680; cv=fail; b=ltiV0g03m9rcjUAKuZoNUTFUdKwlf675ju+xBcSqBZ5Lwt+fgkxC+MFFWTYZvr6uoky4Mf2wF1thlhYiTFvLxmfIb0kxxDXFu+5g8lCMCOuM6/Gzrm13OlMxIQYfGbXsBqwYhagb0yzkUlIerV4sMP9q1l3AZbr8n3K2JF/GVBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778046680; c=relaxed/simple;
	bh=FKBYGPI0Cu0r3lgRAeCprfhLu/mZVxXS62NbN8q8zV4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UpzJ2fGUvfSH8UvLGZBv4mwKeIJhnu/6CW+2IrwjYMkiTNGyNMOfrKTRyGZhLouUWzx859Z4QKQJa21hrY0w3KQD3k1mQkUjpZT3/L8ZhOwXtOKWZyQ+Nng9naHY3SQiwbxYZ+Q66bsHlqMAHoTdEXFaZ4AM87ypWXdM0QX6ga0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Me5gkPgg; arc=fail smtp.client-ip=40.107.130.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Me5gkPgg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNTW9hKeFaNXMdsVHX2IKLCq770ayAKkUu4hcWQKEjikAtF7VQCXg8hjjGeBn0PbR6AJddlSxm45mbaXkQeyt5U+w/W2qdxE3wEup6D8JasLzOAWu+MznGpF75yPuHVXbN1iKtg2xqmw7UXKtZI3INetpewC2WsAG0yLSgX8Zej5PV62e7BEJy3WZmFjyQTTCROkS4dyeevDqC6HIew2ZkCbr0WbUGXpCbd5VBQHSePN2NGRhXvCUqpXLCeJI56uS52lcXThscnQ+RzaF0ZSGlNLjKizHyeygViLdw26UJ/xZhekGJPBNYBwFc6DZliXTQTn8suqmLmi30Yxo/d3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9oVbqtLHNTbEwR3upiBV3QQvhNN7IW4nhUROz8+MUg=;
 b=swGJw7nYYurGcW+P2AcyC/W2g9ekOxH7k8TcOXu0pG24Ttwbxh5Z+fjwNEHAFHSbYN7ureGC3KTbSj14gKLIx1xxFymRaXL4q5Zxf9/+Ldc+GzD+olFT8qzXWtPIob+BkEtJyzuuDApKWbrasJG6dJOdngy5b7Mw5MJvdoeBKq/vw1FSl92cf+90a53isLCY41XgpLMjz4ccOhtueSLcUGk5TA3OChs+N/T/NgIM6ZFp7Xq1NvH1GowFDua2MMInQhfk5lEW+m3zFDKt1tBvKceuPJIHkvdEwc9W3HMEk8M4WiiaszXeXXIiHwEHlYNmyUQXLAcxkOGhg35bxoCBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9oVbqtLHNTbEwR3upiBV3QQvhNN7IW4nhUROz8+MUg=;
 b=Me5gkPggrQqlo0pkdRg+Q8UhkjGgsHrElqwfhJA+KW/MSK3NXiwhom/wMBJVMP3OOkQws9TRyFCaY+V4++NGKIKX5mVWjhcUG0gRNBKnpgN5iAXphLZKQ6oGMfSP4e4o/L4zQUdXVDPadRLg36VL0RmVky5XjXKENrl/95S63sudw34zhdzJ6YIVyGhuVdpTzOZsVuj5puyrTtvPqEXDc+4uLvhpSWvXVbqaJDVo0G4zV2xd7VgSVauafJGmyWDPExue0FbHpmIoMdjwbRT1Flk7AVPKKGg7fBt1+xzBHipR4H6tb/OcCbNHYy7RsovNRikevZj3IXD5elKPHuPsqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by DBBPR04MB7834.eurprd04.prod.outlook.com
 (2603:10a6:10:1ee::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 6 May
 2026 05:51:14 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 05:51:13 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/3] Add i.MX943 PCIe supports
Date: Wed,  6 May 2026 13:53:13 +0800
Message-Id: <20260506055316.2798693-1-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0085.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::19) To GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|DBBPR04MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 987980ea-d953-4bc7-761b-08deab337b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|7416014|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	FqFPPPERB+VRsAa7lPbCg4gLzAhndhUI44FcUNzDbKS/ddBtp19IL6j0D/hVrpdYwLZ7scRcbboEgjiGAyjaFk9KxYU8yq/BssNiKkK1v26+st7wiFVeSjahOy9bqPUpfJzgMFx11t3tLVPBWnF/61jgM8c6r+3lWiJlI6GRoGFA2QDBuUrxoAqnk8heY8NHTSosQgXtxnMpvZk6oFalvPgHejKd+OlY+OAHM2KQQsfHtUEgFeYv2yTWdYkBrdx1TfGfjTiMvFC0sCdoc7jtstHiNIXTXzQ9DKJuSVNFmw22pgH5NJvx1fgDNE7x+5Bmh6Q9fpHrqJY3n9SJG2G7OQ4O9saIjNZkIj90bDCYWhFagu+8DJOT7w6Ys1hcWOaD/Q/5XwWgXOyL2+SbkggHnwGT3DDbBH++9kZcrVn3bidFdbVvANU7CADJ/5wEYgA91yqSRODUbcZduAI6fram+H3hqs5xRuyYpni5WQNZJMBe5SpnNySZIOz7+7RT9iS0ehZKTem0GNDFEsRaCsUXqzUuQaknEMXkNHUWj+P11j5ze9TXfUbgauaCUXs4Qzd8F53kabjPkL+as5mwfYhm+FtULjhsBjqL8T9mxB2YfuOcw4JAawtfZ7R9Q5yfPGlx7WEBkej5QoUvA1/+yoD6VKwxmC+8PFmeWaMYx2YXRpuP8YuVI64rP0KtvAl5ka89jVN/64OEzckDSus26t6wPgL28lCxEtOgkBPZacQLzbGRg+cu+M9ak0BfQ5Gx1JgZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(7416014)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B0nsWQZc7MyNdDt23pIPwLn5PeV3y9WRDd1hap/LRUXQ4QMQeBq7WApP57Yv?=
 =?us-ascii?Q?alERgshV9f91hwPWracAEuiDMvqZf4DtRUTmwgbi3gvyiiuPPIyIaZlc87W7?=
 =?us-ascii?Q?45BndE8sRDnghAEi1qj9h29AjAHcrCSeutZKL6dY3o/26eG2BF96YyyJcsgk?=
 =?us-ascii?Q?EBUu640AXtufmVKSjozhubZhiyDhNUyDX7V9nCai+u5s3nf2b8sx9l07zrDf?=
 =?us-ascii?Q?f06Sj3ecuJoIt87lpwmlSMIwRADHx2jQBKGD9vh71vCnlXeELHW/shX8beSr?=
 =?us-ascii?Q?fi44FDI8e0NhH3EnBOmVwFSAgfddlx1p67j860qXlhkbNHFTLQzo6ZqfXuXy?=
 =?us-ascii?Q?zejXNUlJO9x36TbNTX+iBmEs+LBhyTHLuJEvD4zzHB/cFZckDSChKXSDERSD?=
 =?us-ascii?Q?DfS/0wil1eSoIy+HofLXN4SxyqFLsqtDf+9hw//2n+ReWZZzbZk3ndM5OTdV?=
 =?us-ascii?Q?mRtEjEioAshrOyLxgHyzIFNEbeGi4a2qOBWX1+jatQsxEQwBN0nQn8kOlr/v?=
 =?us-ascii?Q?ydzjn8Sb6Nuf3AQUyiIYkOo4psYplt1JNYAfBW4BIsHCiv/C6bv39FCmNokK?=
 =?us-ascii?Q?ojtmcy2wN1jwtP0PfQ0XQ52BuQHhEmuiUcUB3Yw3CUQDDA6pfVXfFWeFFwqB?=
 =?us-ascii?Q?yBZxinWxPjENykwnjLfllhqdcJsZWrQov+djaq5S3foMReqDKQGhEgKs++eE?=
 =?us-ascii?Q?leHUrxv4VINNAHa+M9o7s4iR741dMxk+lKr1xYtKSmh1GFbIbmPrNemYaDcJ?=
 =?us-ascii?Q?uNz4t+nOVhXKkPQQ2hhObeGvxMvEwvEpyOykvOSdxrYwtiN+KeQezZVNoMTn?=
 =?us-ascii?Q?iHRPeGsgxLUvr9zJR1x5qMa0qjOJRbXp/3RgkBtJw/C+4BRwGd8LsmH4IqP8?=
 =?us-ascii?Q?kBnvx1ZhT9bsWLJGM4wJhlgvS3OqctC6kXL6L4Nk0hJga16NeUIHZx+ccyhr?=
 =?us-ascii?Q?zkZxjB8cMch+i1R2bAU8FZkcAhbtdd+NOY0Mn/2l/9lNL9ZLasTGTiOnR4x6?=
 =?us-ascii?Q?RCfQGqNWwCY8m/Ft2B4Ye9aTij82ErwJ6rV3mFzIl+GvjjTZGW35oixGdc0/?=
 =?us-ascii?Q?/OXaBvHyVS+BcuTtDAoe0d4CLkQAmUGsLIRRIaX9iejpUBhRDCjWuHRQw3W6?=
 =?us-ascii?Q?HiV6tE6wb6gmjvX4eZWUiNA4bEESy+ZHE/mMwNcL25+xgxOt7tUOMitPZfu1?=
 =?us-ascii?Q?hV9WC6Mg8p0SqeUze6m00M3DarcnEuZd+fVMn5dd6Y1J0fA/tz/roNXdWTP1?=
 =?us-ascii?Q?e9wGWxQ7Z+jGvIGJ91ymjBYEnGTYGgqGV0nKV2Q3w9w7F4p+OKjUyTh01r+x?=
 =?us-ascii?Q?t9cITigMJWrKB36jN1SaSo5K39uqyXTSsUvckOaY4Lq1fXv99yMiYGmRWhdD?=
 =?us-ascii?Q?JMOiiqW773TPLDaBmLpxtYwOURffyG5M8ndwnAz+QUyybHHpeyJ4UChdfpPb?=
 =?us-ascii?Q?RWU763JQ9q1xr9zlXYJpYD5qGMhIl7D3JVoaTkHzP6FmunFmj35FFyY5J18t?=
 =?us-ascii?Q?gyGEONGQ9zje9FssJL9nOY/d2ajgw8X3YLTuTKTNVswYMv2pw0QvQGgTK+5k?=
 =?us-ascii?Q?UlcirvkOeuc4sr0u0WRk9GhJK8gBAsInMGr7nwhuK8oHiztHChBBPmaJ4ztk?=
 =?us-ascii?Q?tJhkK0/C9x650Nxs1c59nvyjrOnjiRrEdSPU9BpGlj35hwT9PTNAad1tQVLT?=
 =?us-ascii?Q?01qA7aSAFiqXdPo3XNjCy3Cu+eSAJvFFapn6fIh+Y0Xv98LJJ7evFf9laUu0?=
 =?us-ascii?Q?6oqwbQPrbw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987980ea-d953-4bc7-761b-08deab337b66
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:51:13.7345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7R/Cs7cWzkdlTitUprIOQbU9UVlgdj7toNhGzyInpgr45mfbmx6eDjUz4YgVetUlnRYOGdOttHUzbUiemCEGbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834

This patch-set adds i.MX943 PCIe supports on EVK board. Please pay
attention to that it relies on the patch-set[1], and the PCIe1 port on
the EVK board relies on the [2].

Both of them are included in the v7.0 kernel.
[1] https://lore.kernel.org/imx/176649331066.523506.9443864112044699350.b4-ty@kernel.org/
[2] https://lore.kernel.org/imx/inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq/

Changes in v9:
- Since the dt-binding changes have been merged, only the DTS changes are
being resent after rebasing to v7.1-rc1.

Note: The corresponding changes will be updated later after the following
two patch sets are merged, as suggested by Mani:
  - [PATCH V14 00/12] pci-imx6: Add support for parsing the reset property in new Root Port binding
  - [PATCH V2 0/8] PCI: imx6: Integrate pwrctrl API and update device trees

Changes in v8:
- Drop the redundant strings since they are compatible with i.MX95.

Changes in v7:
- Fix the checkpatch.pl warning in the first patch. Sorry for not
understanding the comments provided by Krzysztof in the v4 patch-set.
- Adjust the compatible strings in alphabetical order.

Changes in v6:
- Let i.MX94 and i.MX943 EP mode compatible strings fallback to i.MX95 EP
mode complatible string too.
- Add missing space after "=" in pcie0_ep node.

Changes in v5:
- Add Reviewed-by tag in first patch.
- Add i.MX94/i.MX943 compatible strings.
- Add "dma" irq for i.MX94/i.MX943 PCIe.
- Add 'fsl,max-link-speed = <3>;' back. Because that Link speed is decided
by pcie_link_speed[pci->max_link_speed]; Found it when one Gen3 NVME SSD is
used in the tests.

Changes in v4:
- Add missing space after comma or '='.
- Remove 'fsl,max-link-speed = <3>;' in dts, since it's not required anymore.

Changes in v3:
- Fix build warning in the dtbs_check.

Changes in v2:
- Refine the nodes sequence refer to Frank's comments.
- Rely on [3], and remove the duplacated codes mentioned by Sherry.
[3] https://patchwork.kernel.org/project/imx/patch/20260204022306.2372889-1-sherry.sun@nxp.com/

[PATCH v9 1/3] arm64: dts: imx94: Add pcie0 and pcie0-ep supports
[PATCH v9 2/3] arm64: dts: imx943: Add pcie1 and pcie1-ep supports
[PATCH v9 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1]

arch/arm64/boot/dts/freescale/Makefile       |  4 ++++
arch/arm64/boot/dts/freescale/imx94.dtsi     | 88 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
arch/arm64/boot/dts/freescale/imx943-evk.dts | 83 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
arch/arm64/boot/dts/freescale/imx943.dtsi    | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
4 files changed, 250 insertions(+)

