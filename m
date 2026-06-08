Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010054.outbound.protection.outlook.com [52.101.69.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DE125782A
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 11:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918140; cv=fail; b=plkD3vgHFwfidOPTU6qm+/s70KB3dEmrw9GPTTTdxFjy0DZQ5QbvSDrov0ascWsqEPUFG4owNpMpuedw4NG3fzIyECyXXnxHg25t6C/3GXPTj9br86z5RQoc4WKnTfcepaP1qa1YK8YYJ7bqaSMtsjG1YxgKVX532SMtKi4GKac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918140; c=relaxed/simple;
	bh=60xUTiUNU1uWTLNTUnZM12bltIUjaEJ/AvGi2vgtqds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Z0ned2zQjKQWVTyEggNAuQIuyHGemStJdL834KXm/nfShebs39zKQJvXt2s3Um9PR0IOHCnkVfTYe+1OT0KLu6zdPcR5mHfp095oCegZ4z6vs15DRjJIKCpARDp6DfV5VbvBPdv96Ao0py/oidKNsrgOImanWLjzGI+uXi9Mauo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z0a7b41B; arc=fail smtp.client-ip=52.101.69.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z0a7b41B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxdfQrVHh+5EBDu4N7rmj8tNp/D10dydQiuEuIuKHn4uKZGOlv6hC2RLh6Eu7fnN8bU7Y6OirasE3rKqGfGN6hk+VpSv0XDeUC0iEEFlY+bEAWrshpaDF7WkXTDcI9Vusax8unmHkM8QFWo2H9bQphYFCs9Hj6osBxXBtncb4r05y6FNa5xCiP+pXCzRiZ0a6B9KJ3NlBcz+4i098/PgkjppCvyix8he0uSzW8n66GIGa3y+um98EBrG0DTCc9dw2MNBh4Ka/T2LV6ZazNRmy2V2yIaQC4W9AER3lQuZmKyHXpxUeS1FflPVJt2Og1kF3hlhqBr6TEEj2LRqZk1DuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa9UO/pE0gyb5PxSfhI0cZ1/8TETJjI/QExPNo8fb4Y=;
 b=qP1rDij0IY1B5gf5UVT0iWeBxYe7vnz/5JMOKjpnNFddcu4WqjYk7ltvpUtJLBGE4jWdOxP/SAu37HhNaBhNn83usSQ5QE1ulIS0q1B1Qfim/lRoMfrdoTRzshK5uhlmIqCIJv+FRQB84pb5ML4iuMxdhuIpjGqCMncfaf3DTaXx/OqaR3VvbQtfQiQ9NE9SY8mnGFVESVsVrjjllnFdqibIqqjWK6RbjmDEb2TlrsQniUkEaHPRInbbclfzphEiF1lEkv9b4wtCoy66A+O+6NsZIyMcc6/+Ycrp05ocYSeQ1EnMNVCOPNtycH6u7tBrWUNfVGiN5ZZHzCHafSgTdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa9UO/pE0gyb5PxSfhI0cZ1/8TETJjI/QExPNo8fb4Y=;
 b=Z0a7b41BJCEWbfZgQ05J1dnhYe3LO2t+avhdwt9BtIahlRJpEehDVbluQMarUWxNj5uvVQ/90RevwuYMA2iCiPj+7eFm7aN1fSB5pIXl4GbKcuxA4fHvL/U3/T6ALjUact2PUseyOPbGqUpOmXKf5zqreCPENr3dg3f7/JauIt2zyJ3Y9geW3UtC/mw41pILDwM9JKQKPhW+++6XSzKO1FL4P7RnBE7YY9Kv8Hy3ER/vUZH/0WF/focW/TrnNXzMi2LQgktUegCxCDrwCN3UtWgyCtEesBCOFII98OX5awe9omhzq7aG2HSs5dGOMr31cJM5YzMKRjSkqnrh8/18fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM9PR04MB8858.eurprd04.prod.outlook.com (2603:10a6:20b:409::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 8 Jun
 2026 11:28:56 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:28:56 +0000
Date: Mon, 8 Jun 2026 19:27:52 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v4 5/5] phy: fsl-imx8mq-usb: keep PHY power domain
 runtime always-on for i.MX8MP
Message-ID: <qsjid2ur4t724arjs5y3na7lhdkiicqbu6hcvbbjgc5hoo4z76@6rsvxsssusni>
References: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
 <20260605-imx8mp-usb-phy-improvement-v4-5-b2ddf2f3862c@nxp.com>
 <aiLrhzEdQE6zAauv@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiLrhzEdQE6zAauv@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::19) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM9PR04MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f5b7e03-2032-4d74-0d4d-08dec551206d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|11063799006|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	f59WnfVBt8OUeoZg0CNj8anhqDof0+Tl0rWYzLgRO9+m2YasTWoa1zPbjVMseowTT6gICELlDlmLLqmtdpR/R0nlXNn4leFn6rW6x8h5lYFl0XAxxz1rZv621xXR59oWO4otuzPUj2jmtCHZ4++Hh20heY0vwBtUmYCP9kgOXE9Y5uPN8AfTW1Er5FKMEzx9GJl/jItv3ocQDUiaHYuYz0ZBNWD/tNDIVc2rzw6VteUGfmRyBoFzl4N/tpAXKdlL2E/HzMHypfHyhJSzYj/mzJ74II92coSXjlWkTmiJ7hSMkxbC9A0UHAUoyrx8E5j0/QSxEG144bpoaUHGPuwnazLDx7M0EXtMT9QNtTvfM0IrC+bWlnUciN9SLs+f2T3qzhrhyNaztSYQFJlbMKyttM7s13iuuOJI7NFyuBPvtoV0ylbeLR2l2MPrG/T2SoX5LZBL6twOhbUvgfxTqjMM/oUKGmnueHmLueheD71KiSnsW1HsD7JiBZGYm8bMrpeJ5pxiD6StIkK39WFQse3/jHVlSjZlgTr1DGhOzjVJLsSUtGDdhbR+Wso9Oa+9Oudc5GH1s31nN1dmSUxtL3JJhqj5RkvOnTSgNhT5kjGRs9ysFQkYZG10/vlZjyZaWL8Cz/QUqHlBOhEC1w5pv3Nh5ZaSWBOLqMN+Bpgt1XK/Qv+gtK6k0T0DtnEeFt9B90k1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sxKWyBJi5zromnEnPyAH763rD8cpjd7fenKciQhUkMwhmXn7vv0FK1uWPUoz?=
 =?us-ascii?Q?S8Bw1nTVd0t9DMSLyL9TQOFT6Nm+p45YfVec6gCQ68rXOH31GoW5LCeEtPdz?=
 =?us-ascii?Q?5b/x/ip19F2vulm7RZ6JXEINatB1088MgwnOgfy/gtDFkAtdKrBexiUGhcFV?=
 =?us-ascii?Q?TGyobxT9V9QNCQw69BbbhZXhfuVFLoVUJKNoXcvu5Aoy6BPXlWzvbp33H6fW?=
 =?us-ascii?Q?mBiDFox7oBaC6wB8nDjJ8eO2wI4/8JJF7d41UDaEUucTzggxmZHI6cheATk1?=
 =?us-ascii?Q?PTm/RxQSeGOBrZrvDRW9TGYElSbDtSoOTS40w/7XQQBvXtduNaVhRzoK1hvM?=
 =?us-ascii?Q?XCrMNGi/D1yxteS0xQf58IUBc2c5jhbGcjjDaEZLUdjfCL5P1uNxBNE1FMlo?=
 =?us-ascii?Q?CVMYArjZ0hNDSV5486ztpoU4QF/1ahs8jqjgCxeQvYT8aPHUGOpHjcnYiETG?=
 =?us-ascii?Q?ZtnPD4wqW7bA8sdoXyyMoqML1VVNhlt9hOhb7Jpa8Yfzc+pajITYVNKt40TF?=
 =?us-ascii?Q?sGTL8rKbf3r0irq54+ldrYdFN7GOKTdD4k2KSBz2sFFn4WWvqkV92Ng1TN2W?=
 =?us-ascii?Q?sIlnpG22rUjNy0xngvQMqotUOPalfc9byY6eHIJ+mv67emcfB2DlgRtQL6g9?=
 =?us-ascii?Q?1rvwk8zbrMr8BOUg7EnqlFNEuEP6ps6dNBZdYF9wmjmFGuIlfkMOYAm24O6w?=
 =?us-ascii?Q?zU+zXmFQXwk3t3uNucgVmbryTEW6JJXHfKyrNFQBXdVaWRuz0S25z/gdsJXu?=
 =?us-ascii?Q?QPm0YTuqcT28PnMvKjvdzuI98EiXn15tKRfg/QlctLhWXGT0YpPvHtj0Iypl?=
 =?us-ascii?Q?qfiXpHqW7LY3pV4BaxbufNowtdhw1SNEXhB+GNOxkNXQK0mJMEUES8ZXSEV5?=
 =?us-ascii?Q?EHCtQamfvpAew6UvYq2iE/E3MlpXVn/TB5/peGeyaIEyWin1QXOhIapBupfK?=
 =?us-ascii?Q?nEp2vMnHnLSRQ9SIXACJ8a7WSvWfZ427mEIMkO+WPtBJIp/YgIgTRnuCTdwo?=
 =?us-ascii?Q?G2nZXDFXOeORZ0be4fS4IjoVxIpopBUjKZlp/+r06jt5rM5VhkZk0jD8j9Aj?=
 =?us-ascii?Q?+hsazZ98qsZ0knqZ88eHoF5uzSOveLM4Hp/IJEhzwrrnSAQjhCIvhnf3p3XU?=
 =?us-ascii?Q?VUS3V6PDa9VegtR+zWLgv4CxX2nk5ql79o62ehRTf8twqwxx6KFnOxMQqLbL?=
 =?us-ascii?Q?Cn8+OIq7j4NoOm1vqVOprH1P0goa7l7+zuWYMW3Oiix6R1gLVwra8MnZuz5x?=
 =?us-ascii?Q?PVphb9eCE8NlO0AvicdLYPuFYqCcQdTswwKtnsHq/9vIoJzkeGHtDO03VgFc?=
 =?us-ascii?Q?x8TOFAeaDIKVGf+OGs8cQwAr8c9G58l0ioVWt4y4/7vRE56m1uU/iT6fVMnX?=
 =?us-ascii?Q?C2dGyXogXzMUnmSewj2zWllZztcTdpE1nxwUv7C5dqdSo/76JnrtrE5/SZEk?=
 =?us-ascii?Q?LbM4XebKMHJdXchq8+8CGtsrg89JWPH1/B2+EPbUd5NVJkrPtgXTEEF6OI3j?=
 =?us-ascii?Q?2uERrNGEQtP7LDjMRJGSsZTA1zbZIoredPEumTGkGq1A48GYI5ouMhbdM3SV?=
 =?us-ascii?Q?lsL7PQgPxjO69jGswLGmhtspnyY1ae/H+pMqoDcvNOGWTphXXMlwq/uIZv+5?=
 =?us-ascii?Q?w5WRmCuY+IL6GZAgxn7/ZaqEtfq838WPevvkOjytvuw3oou5rJGMI0W8CUtV?=
 =?us-ascii?Q?V1L1HjKvQbhQ8AILSIzTiyDa/jyIcLXjjBZaw1Vk4OPjoHPCaTDIGoA3P3nc?=
 =?us-ascii?Q?9pPf31kYCpmH2AX+VwcoLyjx7lq1mHu5naDzwujuAcFezwoK88s7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5b7e03-2032-4d74-0d4d-08dec551206d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:28:56.1372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZN6pbZfA/tn0WRKpDpgSMyjBb0Sr5l11gVMP1qwqfP2eS6YVmPnBpmWpH76VQy4KXLxaRlp6D6pxYHuhnlv3eML37TjbUH5d6Y/QZoVQcOIl6WtK+CqdTD1U6vgY/I6P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8858

On Fri, Jun 05, 2026 at 11:30:15AM -0400, Frank Li wrote:
> On Fri, Jun 05, 2026 at 07:13:06PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > On i.MX8MP, the USB PHY has a dedicated power domain that was previously
> > never powered off at runtime. With the introduction of runtime PM support,
> > the power domain will be powered off if the device is runtime suspended,
> > which breaks USB wakeup functionality.
> 
> Does it need depend on if device enable wakeup?

No. The wakeup is for system suspend. We handle the runtime case here.

Thanks,
Xu Yang
