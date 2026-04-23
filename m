Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011062.outbound.protection.outlook.com [52.101.65.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B1638838C
	for <imx@lists.linux.dev>; Thu, 23 Apr 2026 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776940040; cv=fail; b=bsPE9LUL1odtJ9KahOzPdBOSWnvij7XPg53LCqV8aAwgJGcfidZb3uD4LzI1FXDx4Mv8jJDt+D5w2h7x+62SNRyjkU1o3lWU/FweZsoIpY5EfZq6VewK6WSRWBgwIPiMSApH41S6qfENlt2pfPQxIGxVg0jwE++dtNFkzk0WDf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776940040; c=relaxed/simple;
	bh=HVIhdG5fNU2/FwZPGjmbSFYmdvjiXo63IuxsD0d2HK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nMwsumF0MWdvTRUvdWRs0janrnvsq8FUpdLsl1qAlEb6CBd6TANlvJxsNgv487YKX29ew3HibSj+d8EOoKJRy84uvuAm1uOxbDNVjOuZRlDdg1yrf6WcHiCvVcZlofUIXD69sH28nl91PCd9MsnPR03hmHGJcXbd/ruRYbuYhdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ArrRXike; arc=fail smtp.client-ip=52.101.65.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ArrRXike"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKzFo8adLADmhDty5B11UJXD8P/yoCcDQmK140cVnrbVp5416jCaZz1vQqS4bvTbL04vc6uos5WvVzFDWAP/dcpNCyotpTJD/m+y3oocBM4CGPteTxe3nVCnwYYfmGqcnX+9GQ/7K1nT0M8elbJ4Qk9qzYK4W5k9IuYfjpYbBvnetg1eiGIHD+vF2g2VujE6bCi5gd43f7DR+eL6b3CoPzD8qpHTyNowptJ/goBG1H9OOonDTl8r5IXyeUAV3fGRHhbrM3WC4qneRdrDQeMw+BgSCbub4rDgUZZR6G4uL9/SG7ehMUSc0pdcEbFe6P5MEHAMjMqPekzx5BkeGtNWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DII8ESVPrEWFMFKxPHGIcaWGJ2joxr+CZzKed/RsGWs=;
 b=cEWX6I9C7F7y9cv8mmSGaAaSor8L0qJ543bKnkpTv0zadxkQdRwCfcXHlM5/67ng8vYWyBfm4u8pVnG9Bj8uxy5Eixmtd4Ymz4csclNs/GZOrBDuR+fGwPh90+/Hle+y3lUWm4bvxVPxTSVUDixnjEIQtHaYPy9SMQChwWg9nhcX7jXc+AatoHbgeDEQWKbC+TVYvKRIXWJYjlrIdETb85HdQ4kzztYiNH+TaMSNSW9wyFHMhbfyWRqlbD5EhLvtZMHkw3QhE5eGKq+LfhYYCeU/AEc1U8UYAZ+K/IPXzBLsOb42tqSrJsO8fTEUtUOyNBjqkt9DKGa515cBIFoqnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DII8ESVPrEWFMFKxPHGIcaWGJ2joxr+CZzKed/RsGWs=;
 b=ArrRXike7u/NVEXZBrerWa+61QixP7nIVEkII9t/ZCRilSwxxwgzLDvRAzRmP8M+BR19bufD0yvCiaGdpFLh+cNPOGdeDjCTpkmPJpBR9tQ2ALNUZRUP6VufExdLs6xA3tMcij83L76kusunlM92IkDylctG0qaz51xrwaXsYo7kiG1buqkwM9+xXbeme4eUoLJoHgtqcd+W3WSn57py3TGswQXsUKAgXM3c0+oXocsN/Vtpas+cYaVSgLPJHGKIk0MppcFgEa1VSCqX9L2QS3qqisHViplRS82EBNxcoQy2wfJP9iwg5NRmHzN4NdbMQvXIuG3ErG2ntRdwx1Uoaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB11726.eurprd04.prod.outlook.com (2603:10a6:10:615::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 10:27:16 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9846.021; Thu, 23 Apr 2026
 10:27:15 +0000
Date: Thu, 23 Apr 2026 18:26:31 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jun.li@nxp.com
Subject: Re: [PATCH 2/4] arm64: dts: imx95: switch usb3 controller to
 flattened model
Message-ID: <cfyvip6atz6hh57iga5gvkzrdxeorv4tuxontvzixflqn36h7h@2awtzkxkn45c>
References: <20260421105503.1416566-1-xu.yang_2@nxp.com>
 <20260421105503.1416566-2-xu.yang_2@nxp.com>
 <aehGKE8qLXiBKvvB@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aehGKE8qLXiBKvvB@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR4P281CA0419.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB11726:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7f3f4c-4835-4249-19d8-08dea122e3e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|19092799006|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	PzEDzxB/oTsTYCXIlh6vy0uhvjq/hPUXaDsvFFYXPykDNW3GhWTFGpXyI7NBqyUQQD78lktCMg3a9EMpQZdCnU9f8UwS9GebijI3aw2db0Ov1kArBPcTTsBtbzQsBmPxGkVNMZCwwXG611sh9zUgmOOtBb4WGB3RHL0hPbp6VRAoPQ7r4uFIrSaZlkMxG7FLVfz7Ktso96sOh7JnXv7byyi9QcPszbBULbsO07UeUDrQm1HYlBY1xE/mbs94pga6tOwSzyVWZjVZ3IZQdKa7xZ5j3afDmYeCPXMjCk5GREbOwpc2g8cOMk15mVLVHDjeNQnCG1Qp8b7lN9rT/zQ0IH3ldqKagcMmT37ZMrHeQU+3LDQ5auydgtQjpF+dxEifsbYc9Tyf0cIxmuH7vWsnakmyPRkgzL1PaokqKaFt9FSstv0njs+bCHzZYafzCZM4BbGralmZ9A8av7RTfpcsg6AGM8bbHrB5v90HrWbRZFjHcjKoaJaKKxFQ9tC/hy0Zog8IKKCvNVKpC+C9CKBi4k0mdbDdLlxFPsKd/0jO72RGEHlgmnbeKr99IY66adM9m5KV8DT5s0t/NKRcOemrt3vmcAvBzsQItheolDWiRRtNy18+CxdWlRrEAULCFXZPQQt9t78inlmnVz2WsyMQW1LyZ7DB11cjordh1Jvtbn7I2+E8m6l/p6SMWFFILmez49/NSNuefeFXF7ItB2COviq54W65jrG+FLoD9WHJEXy1o+KZnAQ6SkLg+dQC1PqJ0+RcVhbdMFw8hjZbektLt/g5iFGL+iNEhz2ZQp7oxQU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(19092799006)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8nMrqiMykmFUXJ1DXV8oHPizYXkHccG+Hcx3zP5lVPpEWmyd/bOThv8x7dh2?=
 =?us-ascii?Q?wqbtSjJ+pOGqHnS3pTH2iJCBprm0TNRHdbt7m2XQk5vCfJ2mZlBJM/wYVdyE?=
 =?us-ascii?Q?8XYnjpLB5osfplEkoRheAN6M/ljlCaAWCmjf8F4TxBx7wTCAPdcxqmFYf515?=
 =?us-ascii?Q?MbcQDAhmRWz+PkDZUdcS+FfD4MVkCAZp9eUbOzZQJDztpXmMQ6QepGmfVj2q?=
 =?us-ascii?Q?M96agJ1R7Flb7MuWDgzgLmyGAMNGb8t4gplmXPur4KXVtCFYTEkEiwl35CE5?=
 =?us-ascii?Q?zGyIEl60/LovjutDN4Y40tZTKGTwZzcYoTBAOfJGr0av8u0/WXwmcjzosw2L?=
 =?us-ascii?Q?u1r8HjakcueUuGTY0AVCsYdkDF40auPjX1R29EliPa9qm1+n/NBilKpLZTEm?=
 =?us-ascii?Q?+W7WUpXUeazywFHel2OwoOMmjJ20W36TMt6j7ThSiq2USiQxyET0clMjh2av?=
 =?us-ascii?Q?xGVOIiwnT8KXsBtH4A7VA7wvBhuQvlhNZlH4Kk7J0LUUotkp1lJBmjawQiYp?=
 =?us-ascii?Q?0TaRF9Uwbcg4O8LxFXcQK0qOEKSlRnNQWCyOnfTN/ZXunMxDw3jw3IKZf8Zu?=
 =?us-ascii?Q?eSM8z7Ccj2PbDt2fpUpf5rYriQrZ2RbdzSwth+Dfoo/cUIEk1jgwHE893qSX?=
 =?us-ascii?Q?UK1GFdLsajRIVqof567jToziE32TmBjjcUUnk4Z7oUvHdBsO72k2nV8Jv7ba?=
 =?us-ascii?Q?D3KvURxE8Ce0xlfqctUrsQjznlA/ATdn7LmcYYMPEVI+wHD7EJJm/qbjgxgR?=
 =?us-ascii?Q?u+f8KWunZkiDTvmu69y6X2FRSnHVu6O/5ZUssyn8kerUFQFpS0m5nwMmW+mp?=
 =?us-ascii?Q?/tqms8cVxcoTnQG7CVzWNfvOQVmdea0NfP2J6ZYE7jJys2KigokaNNbXLDbR?=
 =?us-ascii?Q?xisJEw4d6tWxRcMcCpmXW5RcD58huxrRbtM+hF95U5nQvUfWpISWBg6FYlLo?=
 =?us-ascii?Q?KTglv2789cV+wSZjJP81u8fb5wICDgLRLaZdIw6AUt0O0gYTr/BxFG7KenHc?=
 =?us-ascii?Q?igdczi00/hvx0GIY/GgMnLmAbVTgu8/mpsoM1vBBB4eU82U8AhZHNtpOtQJC?=
 =?us-ascii?Q?N6/ChSifgbjw4SjKz90Nw40EVXpnFkqcjKzhZx+3ddaXSM7nccd59Gor7z/k?=
 =?us-ascii?Q?oS+j8g2uN3wiWn6RX2LUeDDJKbM19xOO0pBEjDB7PQy/e+ED6760bPkl5GMn?=
 =?us-ascii?Q?+5POCM+rwL/vNvKnd/vwF1MpgrtFqsYfcXVkXt7D3D7RalRHta8C9qt29NT/?=
 =?us-ascii?Q?uhf0KQny/Y2/937a/yAp1nAarT/66fzYOlv4wriIUGuH9R3iCTeOCxIFgzsO?=
 =?us-ascii?Q?m3YxF6+6JjlBFSquIekl1vW8s0WpRhpUSzQ431UbhPt1wBpO/HY8p3B/vChJ?=
 =?us-ascii?Q?n6BP8UN0BcNRMHEZDlcOXNyeRGJCcJxxVJB4q3eeLFqkJdMQ0N2kHx9bOVRn?=
 =?us-ascii?Q?yuRpNkahm9VK/aoBvKmuMn2P3j+AQI6jlaclnH9oULf1fVdwfXnPpaoc8aVY?=
 =?us-ascii?Q?3vv8PouZm4vLuFZwF0s7adAb0ejodQNiFiB41B3qWZvgACXSecA1EEguY4T3?=
 =?us-ascii?Q?y1Y1KaIygxI7oWmZavoiEziRgAmL7kqOHFvRjRyJg0uE5UHma4CJPX0+5Z1T?=
 =?us-ascii?Q?OKvPOxwd5yigli6h4mq+SFoEnMaOK5u9J7G6QirINd/FxQWkPDcQgvuFghtE?=
 =?us-ascii?Q?QYnblUwKAmtGYpsSmU1hIzGo6VWn2G2vflQZiXWN6H4aY+BCz3OS8qCjc8KU?=
 =?us-ascii?Q?Z9GSprw8xw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7f3f4c-4835-4249-19d8-08dea122e3e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 10:27:15.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xu50oS1Y0is74lxKTFMutaquZBfPNeZIJQ1gB06nbOf+YMRKHPm+Ie2EMhG+OWgjKXG/TpdxTFPQRhea99pQyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11726

On Tue, Apr 21, 2026 at 11:53:12PM -0400, Frank Li wrote:
> On Tue, Apr 21, 2026 at 06:55:01PM +0800, Xu Yang wrote:
> > Switch to use flattened model for USB3 controller. To enable USB
> > controller with restricted DMA access range to work correctly, add a
> > pseudo simple-bus to constrain the dma address.
> 
> i.mx95 should fix >4G dma space's problem. Does it impact other no-nxp
> boards?

Yes, i.MX95 has fixed >3G address DMA access problem.

It's another issue. HSIO domain only support 36 bit bus access. If not use smmu,
no any issue. If use smmu, it will allocate memory space of 36 bit < iova < 48bit.
HSIO can't handle this case.

> 
> Need do break compatible judgement such as
> 
> i.MX95 is new SoC and still is heave development. The break compatible is
> accepable at development early phase.
> 
> You can rephrase it.

OK.

Thanks,
Xu Yang
