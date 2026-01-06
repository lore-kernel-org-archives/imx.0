Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962117263B
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767693137; cv=fail; b=n8XLiSjLNk2Um+o5DJEp6RGAFsG9AOe5TGR0INLHieD6/vrCwZf8y22664Gh1kxc97kK2XcMugA6gaoUY/PyvtEqjhOe+SqYwZsFvTvNx/Dtow2PJ51XqYhFgZmhka0lsmFQiJEkME/3az0Xtl5wFRYFFCbM8mH7jrpcQuApPP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767693137; c=relaxed/simple;
	bh=czq4wArV9BsBk/JbHqI2YJsVRbGHGcq8B0Z+eGSFmBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cRe5KV8BPTW2xNXBKetlMknLFfcfnVqnhBOv/KbW/7IipfQ8FcLSmBMunKUCHenpYGStgOrMfpwjE57GK86RcLzqC5HGC7vZ7KarEdiT8Vp6EGaZ6TX88+OVec3A4LGkCgX7P4JxgtuVMW5nF73HLPD4/9qn9GFQrUDW2LWtu2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Kqrp7OgD; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Kqrp7OgD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBIS4StJRpz22crxiyCy1FZR2/ah4Uzm2HSBwK2UHQfoQQYBc8iqx1dmLOA+UnAbyVKW8T/TaMzRbUM8OvuR/fpm8wfuTP2JEIoEEsVzMkZUB4D/6dF6nkFNJbw8yKSzM9VDGjgvkfRJoi7Ft+SHPfevcP2WHD4uPduEthVqO7p/k6YkEr0ZR6pk1VqaohlAy7jxvr2/iyXlY1TrfRJkMMA3PEeh5a4cqv1oaOmZ08UhPSpn4rGlQkyIRGiJAUCjzGvuqkPc2B3zFwjGO7cofGne5GoK2kVykYFR+M3yOL+vERQqvzH6chR+6bo8rYQHypY81s7bmJCjJxwSxL3BBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czq4wArV9BsBk/JbHqI2YJsVRbGHGcq8B0Z+eGSFmBI=;
 b=cyfIL+x2xr1wt4hkKyaPJxNICqnl8ajP3jP5+VXxkaIX7+N5aucXkKnH25txc2tVZ0cEwLXoozYdxLdpkUaLvpW0E4V57IdhrqFboJ3K/3HuB758oq4cD958M0RvfwNGcow32sfHYWRtw691dOk5ZyNs9jAy9H3LqIftMAL1NQ1DNjE/GAezQWoyICEH2YQDrHh6IuGBYdEMo38y2fgbXYGWksqGLJAgda8kry8eAXV3aeGpvUluzgAe5U6aTz493cMQqteF1ZXbhhz+jrbzMJaD7q7rasfbU70UW5WKkbJDCzsWP1Z/+eTp1/Y0t9Ck1rebXgR2hSlV9cj+gBNGVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czq4wArV9BsBk/JbHqI2YJsVRbGHGcq8B0Z+eGSFmBI=;
 b=Kqrp7OgDk1hrxSw9/vPB2hyUcqG9c3HYgFOXZ4AM7K5yqDeCryIMxfo7maBtPzufrDd5BoMXrcAc4/2dGc6jSUQ3t+rdHQIFiEsYXJIJGDp6IgPoQnFjXHEUh61YVNU+JXRoIie9VW0FXzpBSgLN3aHAXm7Q/jMt/RnZTXZbAM73gsalyr+SotDKtme1QneT5X2TFYz/K4Ju/xo80oteZ1Cw+/S78kqRGMT4+fZZ0SF6nRU6e2/OMpYJXAnjpcH9Nf8LezVhJmHROUaH9T9GGwhTpUGJvCcTa5Codnr0SqOCVqfGdvBwVA4B/xxt5G/wT4umsl+sJkfXlz1QBEKS7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by FRWPR04MB11198.eurprd04.prod.outlook.com (2603:10a6:d10:171::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 09:52:09 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 09:52:09 +0000
Date: Tue, 6 Jan 2026 17:53:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sebastian.krzyszkowiak@puri.sm
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@puri.sm
Subject: Re: [PATCH 5/6] arm64: dts: imx8mq-librem5: Set cap-power-off-card
 for usdhc2
Message-ID: <aVzbogRmHt+RoD9b@shlinux89>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
 <20260105-l5-dtb-fixes-v1-5-f491881a7fe7@puri.sm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-l5-dtb-fixes-v1-5-f491881a7fe7@puri.sm>
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|FRWPR04MB11198:EE_
X-MS-Office365-Filtering-Correlation-Id: 309bd338-50ce-4c27-7241-08de4d09425c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|366016|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pLNqcszDC3cAfOWywcWbrs+6AdRUR9uz92zGtDCeWvYPCDFk37NbZc6h9cP1?=
 =?us-ascii?Q?JQyz9qacwjv1oLJP4VpZSp8JRFE8mrXJg9EnPqLQG/dZ8XLVnCCT8Q7E85zG?=
 =?us-ascii?Q?TnVPnQiKTi3Qq4kxQFHkdnpW/zBGonHfmjbR792u1191Cku0hDUTocU8SN07?=
 =?us-ascii?Q?D4o4EzSw3xsBI7tNZeyUcvCdyIlUjGIAMM+BON3FBCapDZMuAvPWFMVXLloU?=
 =?us-ascii?Q?pEwOwFjV+FtUP/zDiqA0oukm4I3b3qkUusWxpMENeWuLAnp4or9XQ7KQfq6M?=
 =?us-ascii?Q?5kxo6tDjOBu0DJ2wSlgY8gqPBe69QIcMStcNIcIjpXiZTk145Oij+yRIY90J?=
 =?us-ascii?Q?lg+Ssoh3OaBMniOaSBUxthTxqS/dpYes+gBRjKNL7fbQSM/PmMsgMIKKaKnY?=
 =?us-ascii?Q?DWR7Jn9lBZN9Xg8tkPNXtU16Lb86d350Kbk0iXaufbnkMzmaWgYOfESIJCDZ?=
 =?us-ascii?Q?gpG6bf2novFcysaiFoopC44cOvN695R2lQ9cT98g+0CNz1Xd77mXMyh1HsFp?=
 =?us-ascii?Q?BRMFd2sS8QAvx0aCZEis5ji9dY83lC/oZQ6iLkXUzY9jaUDVKTaaYwAXwLN0?=
 =?us-ascii?Q?iNuVoSLNq94Nc75BlaFcg3lDuSYm0+Vz+i7smGCLVwBIgiBy6KW/ar1SGFYl?=
 =?us-ascii?Q?NeGHjFCJVzpL7M10lfzdodxYfZGp3bE4bcFZnGwMFGHZQbWWCGFdbfIDZS8Q?=
 =?us-ascii?Q?suAERmmy+pqeS71B3vsYecX67xcd7e+jy5QFn9I097N059q3pg+SWmMoBXDF?=
 =?us-ascii?Q?Fgmb/T8xuc+01CF0k0XjayrpGzy+GFW/+AMR8FTkjYPgS2eAp5kjiFgAvKxy?=
 =?us-ascii?Q?MoAyTyLP5enLXeIVKf+21MOn8Xp+qKbIwthoQgflNGaBQljG4/2nHgpiEdib?=
 =?us-ascii?Q?uil+mjpR5OCT9ddIdxtA0v9h93RkxmUJOGPRc2AKL/TQvm1e1jkUFAvQTwJU?=
 =?us-ascii?Q?fuh2u0F/MDmZYDPFo4daSV0WAVJeHKbnZ1B3O2pGx/EF3kwkoMZYq97kYMVu?=
 =?us-ascii?Q?ENU89QXHHUdUUs8B1efjPX94Yp5BLUR7P3xtIHROO8/VUaiVxD5FxVQ/FbBT?=
 =?us-ascii?Q?KvnrotajVO88/OfIIqfU2jJM5uU736kDOzgI4NpVq8LmiWi6l+8XIea0XknA?=
 =?us-ascii?Q?licXDz76apM7IBD50waZPuMfZwQ3yenc8eCGd1X34Y/I59hty2uYmHavsOC0?=
 =?us-ascii?Q?n7rHlIJ1vPU8iYmuL5ESTj3JotIeyH6bFJhs+Izf0NTgvrZSrWF5/LByYhot?=
 =?us-ascii?Q?3bqVX5UaQ6bs3pcEm5/t1Kw5vB1CeC8ITRz1ffXVtvcf8BvrvE97XZ2pn+VP?=
 =?us-ascii?Q?G5NJfQL5UIHvkSjjvhF/y8+Zto/O1K1efrZpAbtCbY2jKKYdYHK7OnildaOL?=
 =?us-ascii?Q?SCBFmEtEWYQRVlRYQ8Ll6KFvCCvY8GwUQgOO/sWV31ZgoLptonvXRSzRELhL?=
 =?us-ascii?Q?cUhX2mgO5DzIGndfAubIQ/GKLeaILsas+f4ff2HzBl4OjmGoan8rqvcj8pa2?=
 =?us-ascii?Q?FZKtuAw40p+a4XWcqdSNIf/3R8DPuf1xHqOh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(366016)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XB7cd8EZUzqyH4TTmXgLXDHwUW3RJfXhN4OQzrNd+7TctcKTFVkFd6Vz9Rbi?=
 =?us-ascii?Q?7tgTtkUE4QEnwAls1EJgqJN+oU92n5ie1wkknDJ/YPi26s03dHazpv8FEwVa?=
 =?us-ascii?Q?VY94jFjcPR5y7WrFGvOeW+4wW62IO3zZGWuYPTlXKDHbA43AMTmWrapTwcG4?=
 =?us-ascii?Q?fQ9ilivNtthNGTJ7TOZPEbkQcAhK4HHnFALcuqTP0Uu0dXmVhGxCK/dgMQ8v?=
 =?us-ascii?Q?pNIpyRVmaabgdRIjycIeNO8bviAEl06pJ/Bg2m7FnhqzVn0PJao14PWLHwcJ?=
 =?us-ascii?Q?UTAfi1mESifNYsG4qUUxqakBAYenm3KPB5ZM4DtxXG2CQ6UcS+JzBkji6BsD?=
 =?us-ascii?Q?djOnH1XToTCHFoCIdozR7pUcL8P2j3fnHfK1dimLhlTwSZvOPpkGXMcG8wtE?=
 =?us-ascii?Q?lwws2N4NihsGKlCNsgkU3GR/jWKU5HJlcO6b6tYPxcGTCoCkqjEvtNqb1qjz?=
 =?us-ascii?Q?9VC57kmw0Z9TJQ7UWO/jG0BJQfwhFezx5gqa69M0W7EqC8k5Gv0UaNB0uiG6?=
 =?us-ascii?Q?ZNMBFzoV0N32C36hd7wMSo4ZuXS4918APLBot5HA+kcJa5g+h5hnwH3vN5w8?=
 =?us-ascii?Q?mckyeaZM1nppEt33ToeJqMt6WNKBC4khKyXI14TBPuyMkd13Otij/Zb+PyJc?=
 =?us-ascii?Q?mgU8JyWBV7UBy88wCF+hbzC/jgHFD4jbVzU2qJ9C8ePtjWj1g6f27Gcdf2vm?=
 =?us-ascii?Q?ZXTYrXg7BWovHi0MIIlZ3IEC1Vj6/fRyg8K+VU5gWm2Br6LsT46T61Da5i8R?=
 =?us-ascii?Q?p0c5S+WX7iUEeJbx+LcKbNMV1M6KVHpHH/UjsD+TT9ZRVPwW7Nw4gDH4no4N?=
 =?us-ascii?Q?PIiNB4yxxaApSVELVNeE4BzCWYlFP8+s2udvyJ+bkZYfx5It5Ds3YXdoZW5j?=
 =?us-ascii?Q?lIku2UzD9BOD0Bx6eZtVz5hsfONvSypFP2sUQgRpQ/4BAnTeBWMDrp4UDoE6?=
 =?us-ascii?Q?ICdRiqHi8LKYip96jWA0jKmpMfsVhbY0tDoazo8/p/r1o3opFKDZsYlpLzE8?=
 =?us-ascii?Q?XbIBi88z2VM250T8H/VaJH2tkTetAf3o9M0Id8Jm02jsNYwbuh48k8RHwOoq?=
 =?us-ascii?Q?v40nl77owsLVT7yN3i96IU6Za2F/+gCgtTycea/t5280w4oMPor6lprQeUsV?=
 =?us-ascii?Q?FNSNWyxnz9/FYrU4veIS3vGTRQbNawWxYeRASrUbo9yEA4ySHXuCulFdVYNa?=
 =?us-ascii?Q?WNvrC11vMWloo+ml2QcdhhCIWYaPrriFvG5rVt8WDUYso+TEeVV5yTfZkTqg?=
 =?us-ascii?Q?oQ+0APVSkwqRSyijWuskq1/1JOiGdzjjmzjY+iwxRb+YxM+UpsjEe5kfZWJA?=
 =?us-ascii?Q?30JA7J8AGCbp2d4nZIILmGQ5u5OoZkw/hH0N8H04C01Wy9DHlyBMFlXn3YpI?=
 =?us-ascii?Q?2f+DIpE3XtKMnrosd7UK+1j12ZWhCUFHSPAwrX3fyPKhr6oExHtGuarnfdF8?=
 =?us-ascii?Q?MWjw2I4/cRxg4dDeMJrS6wvlBus5ojMXHDvFFydJJ91LQFet/SrqEK9T8+dB?=
 =?us-ascii?Q?9Ql9P1ZSfnABFhNJLprV81ZBGfiBmpV5mnlKLd53N8YoK4WUsmy0AawGxCsF?=
 =?us-ascii?Q?Wy5LM+l8kB3tYDwhJfpckrKEM3bcBT3+ad3U+qS1sVIg7YwSVss8FLyC2nYw?=
 =?us-ascii?Q?eYc5hJCK2mwtYCSLY+hvPl4pmC92sJmAvWjkIxy8RdgHVFIxH+dsudJW7uxC?=
 =?us-ascii?Q?JtBXDsykY2Ss34jiISXEbLRGPZFPhoXi9hZfNNXB8PrAbSNnqLe472yx8RC+?=
 =?us-ascii?Q?3+Obul+vAg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309bd338-50ce-4c27-7241-08de4d09425c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:52:09.7736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvI/MPjYxgBQ6dogxM33GXbuoUOX+ja5Oj0w8f9kuxowriW6MGfTOrJpVbuAOH8R0xBwnWBzK4Jx/Ekt+WjSmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11198

On Mon, Jan 05, 2026 at 09:39:42PM +0100, Sebastian Krzyszkowiak via B4 Relay wrote:
>From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
>
>This is needed for brcmfmac to turn the card off in suspend
>since 8c3170628a9ce24a59647bd24f897e666af919b8.

Better use imperative sentence. Otherwise:

Reviewed-by: Peng Fan <peng.fan@nxp.com>
