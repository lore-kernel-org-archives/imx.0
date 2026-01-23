Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013053.outbound.protection.outlook.com [40.107.159.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE203161B7
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180091; cv=fail; b=p4w7dmNA3MNA8X/J+DOgOrhTcD0/y83AB8NjgQNzw/+nX3JXer09z+c7N0NFZ+zQiwEJBOrAxWtZionMcZrAsjnkKOGVI7WaLKXJQBK6ZB2wtom2LkU+ax3hVk1bZTE/0ORzz+f7BNDZOw/pmLaGURBVgUG6YMjnfKGR5ms9bc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180091; c=relaxed/simple;
	bh=UQU/IIYqNdAvnX9LYhu/t+Ph2CdGyyN4OsOR1HdCNzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZyVBd1T8ndMlI8NRFrRzYaSBQDe8F3lgb8UphF7EYadHZWEvEHkJME5yA4uhIxvd/r3zRhFFaXiSv5yP4FY5vmiYL1rIqZbYijfzvl7sBNHUCch2w3ifU7pO5ueWrdsmVZbMIsSHf3HkhepzN+GgWlxRnHJkO6dIhuyWQfm3JnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BeXGK5xa; arc=fail smtp.client-ip=40.107.159.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BeXGK5xa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zk9V7fmAC0ryF2wKniPAToZ4UbjUXT9v4Qvb0Uk0uLhLRU+rCY48RMl1MYH2I7PkxIag9ticMyZjAD0YfgZbpNQ6bcOFK9l5GdwYO9kSJRFejAaC7Wl6s+s2rzLfYajiiv0R+iRyXhVEE7efjOfBnOw+2T21pSchlMPxtcBgy7jV89kI5ZptXZe10PPWs5blmUVekBbcjrlCugBfFNC9Iwe4r8Duc8+wZHyAi6l2MbVQcA2K+O0788ilJWDIJuSwGVjUqgWLhU06NDmargj73xeFZbkFXBlBJnZjLk50fTm1AGbtddVWxkDTFHvLfiym/+HBjbLzr82VgUDyt/GHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRuXnAsYd2Ke+IlJBCqsdspsBk6PlHdPuKDqiqBt62M=;
 b=KgIa0tPAcUlpjG3bdPYngJXi57kImkbeTfbgJVgBZbrRHhDqwCJ9+wK1cFw3KCNY2XIpKc3C2hstSOc9i0EOUi1exYyjZ5TcjqOK/irfZPSlDxhdMjkoSNk8eYzolgobJp4H03egxQPzpqwlYElbaD94D5HsxrjToMegOCNh8XECoY0RMjMJVWBuOAMQjfophqTLV3mOx6upE/WA7tKpcG7JhUwtrhVgXpHjtrbi0/+Kz1mQyb0fiFZBMRdKfXQ15BC1zSK2bRqNU+NioPqj6oADd1lrgTnV5JnrpTpv9sHLf5idrHVBYO+95WbVJo9TIAUFSP8MlIChW7bXhUNEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRuXnAsYd2Ke+IlJBCqsdspsBk6PlHdPuKDqiqBt62M=;
 b=BeXGK5xaQK9nBHts6JC5Ibrt9UcUxZIRIqpztnCbXcMrWaswyyx00Sn76LnSxfRo6NNnCmrL9EAu5O7OKhRJpz4BBrIVFjKRuLO4iSX3g8oP063lJ8H0V4ibKbj5KiHotjQEyb45CVzpkwVcQ78cOqGI1dAPCupa/WZ1fjg6fiyLWsiKYe2GgX4zHxKar49uNayzfLg7VKexj1KKFhPMFYsB3D699I+YJhMhUHUB/QjPikTMAC/fPv6cuMn4XYVRgJ1gP3AQbfqNTG8OEG2InkaTurC4paXFilhMgYb08CaYaHQX80NO6Ck1GpGT+7zhyTnbi6hIcZ4DufHEHtg3kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by PA2PR04MB10159.eurprd04.prod.outlook.com (2603:10a6:102:406::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:54:46 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 14:54:46 +0000
Date: Fri, 23 Jan 2026 09:54:38 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Ye Li <ye.li@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH v2] arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
Message-ID: <aXOLrst3ZEJB6FZk@lizhi-Precision-Tower-5810>
References: <20260123-b4-imx95-v2x-v2-1-0497a9814668@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-b4-imx95-v2x-v2-1-0497a9814668@nxp.com>
X-ClientProxiedBy: PH0PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:510:5::10) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|PA2PR04MB10159:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e11c794-a2ee-46d2-4bad-08de5a8f59c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vdaK7UJ8P/87PxTP8wnnWy7qulbQPBeVbx/vRIJ5LTLPEjQ4b/SUO01XPmap?=
 =?us-ascii?Q?K4ldn6NMRSYrEb8i97pI4EtGma19uQMfw3mk1xoylhhp8x/5CCTWPI/t4wSl?=
 =?us-ascii?Q?4vpTiJa4tXpWH2IAn1dF8KhRWwFoLtBkyHWhJ+WLqpnCV20T8O2zj7LEns48?=
 =?us-ascii?Q?igGR0D1PL1iZlhHMgJ+YU7AhkaHcD81d8pf8qwkmqddnu+Ne+gWztJ4p4WZZ?=
 =?us-ascii?Q?9NTxb+eeEERg0Jnk/V9EIXUcA/3wxxfXov25Y8zoESs07bNqYaSxnRdLDM8v?=
 =?us-ascii?Q?+otVUwIHiNpVfZMkCc4596m/VNpzbVw99PhjjSk6V9TzVEIXdVPFC7c0bxe+?=
 =?us-ascii?Q?tz26KyiY6xdrQgMibw8wxmEe/t7obXbWAV9rKR48A1fqb2YUzs9msicOPfBG?=
 =?us-ascii?Q?MEQG2kWgtw8nfKAWVBgdkbZq+YlIPkoBwSj4kkCmqAHenMDyEqgJ46OsS4oj?=
 =?us-ascii?Q?OCBSfoABfRa8jkkOWuz0jaINaqj5s7vAsbCEMgWVukzKALCVdH5VKtR559oo?=
 =?us-ascii?Q?A2AiYEZMIiAzL4p1GlcoZlnz1tL0IZ5rK9tj6JeNKFEYCtOIyHnv2flo7KL8?=
 =?us-ascii?Q?bWvx2IsMrwFEnqh61jH/oQJxYl9fWqREwhhrT+MwS2NOFRweIWIRjEEFpU2p?=
 =?us-ascii?Q?wpCkwnbYq0NWCzJDcBp1xQGqcxpQMeZvLDQCJ3LHFblKLY2nKuqhRTKKYL2S?=
 =?us-ascii?Q?7Af71mz8wyLuS2XhUBgYyTNpbMze0puZtRsK6s2vS7aO+7bxtM50UrVdB/KA?=
 =?us-ascii?Q?Lv2KrikLA7deGHpRoKeSjZwni+GcW2T0ybKifacfBEf0e9wZSQdDDh7QXqCD?=
 =?us-ascii?Q?ObqJNuZAEFf0rJ+uS2H0kUuRKHj0h2E8nRMV4jd+egy9+O9nyvXFwa0pTVEi?=
 =?us-ascii?Q?sbDwZiIdYnqR/i9aU1Nk3kW8Dz2QinhV7v/d3j2YabITnRHCSCaO8gtQRCdK?=
 =?us-ascii?Q?UJhTe7JY3rdvUYNXVE3HogD4zg2XEoGgZHElUrQfjy+Hx+4cabISCqRZJZKF?=
 =?us-ascii?Q?rjei86fwJfiuddVg8928+GBYT3ZbHsO40CUYfLDfoG3HlWEvELyDH2sCjSd1?=
 =?us-ascii?Q?Zq6XGiI+o09gJdAvTGf1lv/8AIZ/KtQ/xFKG0ijz6Qi3kKTV+Sd8cmcD7SEO?=
 =?us-ascii?Q?Iz4G6iE6MAZvPd0j99J+n1pAfBSvWVcz99VP8FPSs9FPVYNiCwENRL1MrQTg?=
 =?us-ascii?Q?iZ/s5DciUyqGe27VZEolaXj6uPKl85m5/bQLdv2llGnT5W1P8rmpZZGAJ9YD?=
 =?us-ascii?Q?F9lviPTIPgmhkUEia3YZjwOI6Ro0v+vw6BI64MY3kfbF7ZPzvOY99y3Byala?=
 =?us-ascii?Q?v/vtTuUZ5Rz1QUCSlbvvbhEaUHSdPTuDVnJTXfu8EH4g1YiHFRWRmOloDT4r?=
 =?us-ascii?Q?I3Us9fRVtp2UWw+ZMnO3KwLfUPzQ3+1uRT26hS6Mqqefx+qRoAd4/AmFyq51?=
 =?us-ascii?Q?Qf+/2xLPY9nYp/3hnfmNW0QYvOrSHlRP4gjJTkia56genk9y+WOeM3BK955T?=
 =?us-ascii?Q?6TxPPJ0+/iETiNVTBLCTXpfY3zzmpUZ4Er3WP2cAfF21b7rRJLzJQN6woXnC?=
 =?us-ascii?Q?6R4Mx/qBF0ncuR3o1bpCAGg8P+u6zwahNf7OLBkpBZLpG6WAQwhZJcqovUm6?=
 =?us-ascii?Q?UAmCQez8cSJtM3YvEook3es=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hP65Q4pVqTt37Sol4LFzVZh2IikYukVnt2CpJ8Bho4TaaTh6VzmchJtkDoP4?=
 =?us-ascii?Q?YDGzTX19IVEh1IlglVaGeXsTpcoX52SFN4ftn1G6JDpDE+MS4cS8SP4QXQah?=
 =?us-ascii?Q?m/t5xTBRCwwUwuvsgfO4YyuX+X3XsQ4GxBxT0KIZm1ryqnPMN6pyHm3rMdG3?=
 =?us-ascii?Q?/2mewyVTcYJ2VwAyy+9hmTmoxBH0KCnICk2SrKmdrMOISK6qnuJpZKTGiNij?=
 =?us-ascii?Q?I0by8xHWXzKW8NOX6Dua+pWsbXF/RZXg22nUq8+pGUUAFIFbIoTHK13L8gZc?=
 =?us-ascii?Q?Z/JbIAor0hACA+7jkof0DYHYVIRqxNMdBuRXMmaf22FfFzIlJetJrn4G8qiI?=
 =?us-ascii?Q?hLa2mPLGNFr6m4cN7TnaHjJqkqPSeUCQvYd7ZYxUw9JyQOy9uyNHyBu1xW8F?=
 =?us-ascii?Q?Kp+aeC9rXkmtwpzYD86hZ7Rc/noBKerohxZ7o+HGfyG4rpI1H5ny1EQMOJxM?=
 =?us-ascii?Q?s1afIZ2iaDaAYS7gE3Ojnrm6/s74vwCwcrO5NyEqdjHzDDRmlA9IAh8R+oHH?=
 =?us-ascii?Q?vQyVomm2Vc6yWNpzh+CK+R0uH7gasCDy3kecPuIkMMSNw1KdSBribNlqAcwT?=
 =?us-ascii?Q?EMSckV9/8IOb06Uibx6hWFC+lTrIe//XF4IcpEyWEG+PMhR5rXLSZFN6/bMV?=
 =?us-ascii?Q?e61YKAVQYrS+mJ+5KQYVcsitEFewv6QrhcTYSB5VltrqcQY3/ksmfovd4Yc3?=
 =?us-ascii?Q?sgCyAOwwAsOUBdBVjn2Rc984dbidrTCrV9K2hjV+TgW8WzbZNGCnJL1sIcnb?=
 =?us-ascii?Q?wM+dTAmUIxW8kABkMFqO6c/zhMKU4WhF9XTr6zbuNJxqfMd2AbwjBgUgVaSq?=
 =?us-ascii?Q?BXl/jmMItc2v9nW8pg8INv1vOgkO10woXPt1ShmJJxcvhDp39kQdvtMR89E+?=
 =?us-ascii?Q?0FfYUSENeLv8/QvMZ70LxKwUjEjagSZYwPmdNIBgxAYlNJ6qZSVEd46bzt2U?=
 =?us-ascii?Q?DwvSilM+m24mtt7J6JP52f3pwpmurtwLw07DAmDT2YoO6sVGfIyWtDI+/qZE?=
 =?us-ascii?Q?YLniypvXjgQsVbe1OzE0Ru1XiIp6E2ok8SVgyd7YLs8J4AJQ8nnpozCt8Or5?=
 =?us-ascii?Q?9nwwsvkJJ4qoxZHjMb3AxDw407U2Rl2PtThG+l+DgZD51OLppGgjhcWwe6hU?=
 =?us-ascii?Q?eouMNqr21q289vz0Xjwv5noiupWxh8bNfZTNwopi+JYu7A0gxU/S1KcGzi7Z?=
 =?us-ascii?Q?DBCagcocMvmMKFw2R1lFDsm7NNpIdTNFDFaguniYu49jMDXC8saQM9XdpZTK?=
 =?us-ascii?Q?0RBNekZTyDuVszpFrx5SIxdM8hQExPbk/nUO5Km9jbZjyj18BjlwRpM5ubSG?=
 =?us-ascii?Q?r3zDqlWyDahGJYOuUoW3UySyb3pQ8D470kpCbsBeQQanK2C4Ft6VjimCGUAV?=
 =?us-ascii?Q?3pgXCDE1JRt0XV8UtVwORdj6gdD/asWwtkLajVFYCFVgo6Uga1/x2bFSUBhN?=
 =?us-ascii?Q?us6srIclddwLbl0IAscm/gXup8I1maEq6RMHerhCCNKY/nBPfAUOX3k4cGfi?=
 =?us-ascii?Q?OpnFM8eeW9rgRUZvdVC7jZEg6aYj/sOkjsHgmPXttzBs+nKs7lo0jhSLyftL?=
 =?us-ascii?Q?VNoD0Fg2LTdGbFN8ejJldwlkO8Xx2IwHZWxa/tyJjZvxoyn9Bq9yB0kt5nDG?=
 =?us-ascii?Q?lgSksH5ppL5UuRDMW0bUeYEdkaWanRu9jl6UZAkx4hKWjDxkL7JdDF4cjzUs?=
 =?us-ascii?Q?9VFy9fgEVjrmu0YidZeWP6DlhrloyXQJskUbYxtbVPTmxNEOORDofUVLkavp?=
 =?us-ascii?Q?trdkUiP2vQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e11c794-a2ee-46d2-4bad-08de5a8f59c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:54:46.7642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEbwx9gsMASE6jcptQiPNq/B3qJbO4jiGSs7gNn+3JdVQibzZvoltOpSLOxH3tBjF0dAhgmyEatDdhYmdzzrMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10159

On Fri, Jan 23, 2026 at 06:26:27PM +0800, Joy Zou wrote:
> Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
> use by V2X (Vehicle-to-Everything) fast hash operations.
>
> Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> Changes in v2:
> - modify imx95-19x19-evk-sof.dts dma-channel-mask property.
> - add comments for mask channel.
> - add Reviewed-by and Tested-by tag, tested on MX95-15x15-FRDM, MX95-19x19-EVK.
> - Link to v1: https://lore.kernel.org/r/20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com
> ---
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts | 7 +++++--
>  arch/arm64/boot/dts/freescale/imx95.dtsi              | 2 ++

common dtsi and board dts use two patch.

>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
> index 808a9fe3ebb2b9557be9e428583e76c32517de08..264703f6eef64813d64fe07713cf92fd02fa0778 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
> @@ -55,8 +55,11 @@ sound-wm8962 {
>  };
>
>  &edma2 {
> -	/* channels 30 and 31 reserved for FW usage */
> -	dma-channel-mask = <0xc0000000>, <0x0>;
> +	/*
> +	 * channels 0 and 1 reserved for V2X fast hash,
> +	 * channels 30 and 31 reserved for FW usage
> +	 */
> +	dma-channel-mask = <0xc0000003>, <0x0>;

Need add to commit message.

Frank
>  };
>
>  &sai3 {
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 55e2da094c889fc7c1096d0e36f31ae118d2a982..9ac82da2ff440e08ae8378d7ff830a568d50a354 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -631,6 +631,8 @@ edma2: dma-controller@42000000 {
>  				reg = <0x42000000 0x210000>;
>  				#dma-cells = <3>;
>  				dma-channels = <64>;
> +				/* channels 0 and 1 reserved for V2X fast hash */
> +				dma-channel-mask = <0x3>;
>  				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
>
> ---
> base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
> change-id: 20260120-b4-imx95-v2x-3e01c7bc6881
>
> Best regards,
> --
> Joy Zou <joy.zou@nxp.com>
>
