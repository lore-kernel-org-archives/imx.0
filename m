Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682BE3E3156
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454156; cv=fail; b=NzHzbv80fu+UU5L24XvnTrYlV8sp0F2HFOxU/R9uu695spU3D28WKfvuyeTxoCI5xWhFAqSOc8K/igvaCB8vUG+kYVY3FN/Is5GdpXb5Z2RUcpbaO3PWpOQesDYU0u1i+qwqwqG5e0cOCE4uAQniUg++gEfioNKhg/MhW9pzMcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454156; c=relaxed/simple;
	bh=tJQ8qZkvAAlVpdyypTesOQqypQL4p5R4AS0qmz98ZF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iJwg+tDkim/sZGY9TJeefg9aq+x36cVvCkRdKajf19BIUPyw+8jx65XFSbsBR4lmbOFwGHt+z9p5QrMt771Mr0udpwXMnpQVmsefJmGU4RahTPm8E5ENERrrZhiK7CIy8Da8MsKe6u70Pr2BpKIkvJf64QwAzJe9naYe8JIkLtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dl+xw2vl; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dl+xw2vl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQVjAI/Q16hK38GdVKoDcdohpXvHuvKZXtF2ZYY7qT4AyVupE9rfga8mvYZ+8w27qu9JhuSwxv33KQ1BwfkLqJ+QvWijzdyd7PPqAdyI9587nRIyFt2EPm1NAVk82ZZzUYeuoURi3EQXSdIvQKtOVT+8PkxuzsCDw4bvgH0fbYNw97Mb9p/T6gUGX1Q7P0HrlxH29DY4q50DmY+1xw1aXFYrVN1gDvVNtqIzLJNhmXDiG3KiFD6mwEcAciLkpVH2gqMVyifQS1Dx28J17uxA/9b2cynJItc1xL3fT2R4zmlr+cUPpBpZ4fTlwiSpEFn8zoto0xzq/VNMHuZF0yUqmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJQ8qZkvAAlVpdyypTesOQqypQL4p5R4AS0qmz98ZF4=;
 b=o1OIZ7zB7QPbVNKDh5ruJzpUC8rp16k7KDi2Jk9YB4bAheSbl5xrN7Ivb58BNSLafoM3f6T/SRshtwSVl/E1r12K7Nm+b3ZkrvYVmwSHUAHVYZfEVUNRmASofIAQ8eW9ZqOORcrf2EEJ54goU5FVVhw/sQjqqvu5RPSBzqBBRBE5fSCO39sULCOWBEtQerZqfagGiPkfIV/JaVLbjYIJvIzU9P1K9AFP66m3zqf78aSfAWC2AOUoJLhpwN0yPvj1ItJoVck+6l9+lukHKYns3v61dOrcxF/PpBbAFvvQtsPdxhcRxk6JEit4SOjCcxyx1bxHirO7h2PbXpwCB5O0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJQ8qZkvAAlVpdyypTesOQqypQL4p5R4AS0qmz98ZF4=;
 b=dl+xw2vlP5ttX/h0ptp0eJRBDNAXcVddfdyUWNcpI8w6mWbfetSPT/aUWIzdVQiYjf9G3ZFyKrgpjzKgLI7HWkh6vPCGvm6WuEo5N+qtKtdgvOUAELtgP43gY9CmY1uBC55UV7GU05iHzzSNvfXBnH7CTs33uJs8aJn+Flhkp0vJSUFu4CqKbdD8/41B1zat91UBVeaBb5u806BpfQZeE/h3exVwS/v/h8W9Owa22gWtqIw+rlkPpIGgvpznaL88AZsHa+ibZmsoIJbJE5YTauMEp3/kxnBwY0F5N67RCSQbuS754SOC9po65L5KvmgAl3X5aqGTyOQcgaXdVDz5Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6870.eurprd04.prod.outlook.com (2603:10a6:20b:107::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:55:51 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:55:51 +0000
Date: Wed, 25 Mar 2026 11:55:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8dxl-evk: Use audio-graph-card2 for
 wm8960-2 and wm8960-3
Message-ID: <acQFgFjIsWHK2F0Z@lizhi-Precision-Tower-5810>
References: <20260317053738.578187-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317053738.578187-1-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SA0PR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:806:d0::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a64e9e-4fb5-4bbe-db9d-08de8a86fcca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KP64PXQCY6+Oi/L+TPAk6qnRaxJyDohk73PSoABdVAoSgq4saYIb9koJL3JaqR3NYnqCXBq2RzDW9sJV3rwii7QV1ZBQKfW12GnwXR8rIYa608g+V81FHkuloquPLLi7xVwAVVW7SuHYvZtnwAo5a3tkBYhff2zZ954kZBDgorLLYx/EJKZFfpU2baaWxKh3hT1wLd/v+C0rvtK+frMm6oUeDJyr1CnzaufbzvB5LVeLBKWa2uaCtGQkzzdGAHpnynGUnDc9wjYqFIm3cOu3bzZKAoThwq1JCZIOQAyAUdLkQoVSwuLmmC90cvMCU3u45IazsZJh6gAd0BY5r6CJz6UC+dO0g8MBCFHczaxFQ4IChB7Glydbl9cJaXlkW1lFPDG4amNCAHdMqVZ7ETBphLj1TS6Vp9+f3XAXgteGEjXzkjxu/Xa4xshQw64jIM997kAafcegHosohrHFo9DVlr+Na8Ssyni1HI3puz9aef/c2j+NLI2SuOpfBwbLW2ZK0udbOSWH1Tx5DhMykFirOVRJPjnUQjbz4VM6WSeyERtFSAOIAXA4KbY+9zWD/e5v8h6wfgmMyIr0Y3DjNNWt8addas4AUzKW58qZgfyF6TwSZLmEAjQ+10lmpRpM/Fe/vPEE/NH8k+YaVl8d9wjkZAGY1Ugs0S3Z6bWisPqRIB+5AQoiVkUcpFOZDYrG2deB105hQ3QwMKHd2HcXHm3eXNBV8g6YiULvT3I2JG1UV9Wd1ny182CFQNSx5p2WYtuezpXhRltvF8OWlH6ua86TLAs/aFuxbJjePQzSNTzo1XU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8//2BwNqX2foLLJCHSGze28kHzM6OTBGADo6iyIi8va16ttlPHQ52v6aPSNy?=
 =?us-ascii?Q?R0ofUjjT+/85tp/wz2NbCqMDctykC8Mg6AFh7uhq5puKbv3dM2wBBlj/QyXq?=
 =?us-ascii?Q?YZGeL5pnSgNj3xuYzLwcPl3A7UkM2bWOifUM/K41uHxxoZWelN7DykeMeqj+?=
 =?us-ascii?Q?eF0E4igljk89y5OhMPpwDC17ISCei0lWfJKKTt3afANhQGl0DxEEAm7hs2HO?=
 =?us-ascii?Q?t8N1WYaSzZ4VqDnPxkk+5a8vbVCCWRqYb0lmtsZ3yrPNkima5JM9i0d2rJBW?=
 =?us-ascii?Q?V2tMwJe3m8VNCzxAw0AWsS2u2MRS3PjCYY2051uygwW0BEkZpatDp9pdGKH2?=
 =?us-ascii?Q?EWbChSkkjiN/xAO48GAa6OiDw5PwSX+/tBf7akyWaiA2obuHAPtsPn1eOrPY?=
 =?us-ascii?Q?d2D8JFmcBD53nGbewO6SsqPDePsjkGJRIJENdmcn6wXoP7l6CeIErg3ol+bH?=
 =?us-ascii?Q?TIc2rqv/wAvyrqxm9y7uj2+xNlXzILo8dUzNa4u8If4uZvOaMBUYGQi65y/v?=
 =?us-ascii?Q?ronGxRwAerwMIZK2StfZ71H4jdqjnuoL2TRMtcTPHiwxoWsCObOo2jPd1r54?=
 =?us-ascii?Q?zqR+YMF/gJ8ofjgbQObIBHg6VUp5o+1cZwKepnHsaxW45aD9kDnnvZ61bGiK?=
 =?us-ascii?Q?eG/QRgX3vIoT5diFatvhUnaCcTVDp6LaDRWd90g6VSg4xtRD80ZzdyChntkD?=
 =?us-ascii?Q?3PC7h8AhiUsVpm+XyJV2TgiRZUWmnFo7gVqPmxYPmT3Vg0QVQOixT1I3+hD3?=
 =?us-ascii?Q?hv9HyNfalcLfwA6+mjCAccZmjoa5oHBX31lmZzhOj8fRevi5Qnik4PBqSPim?=
 =?us-ascii?Q?lY6/k3AGAkHbq82ceoDqpgM19tQJ6h3m4k5VzikFjulNQ+SSKgWGRrqAfAM0?=
 =?us-ascii?Q?LYxbaQsSuhqBjBOg2otF7XESqLeFqqM3BkYuqLiKrPwSHTXDoH85vI58i/JM?=
 =?us-ascii?Q?PF/ik4Lj2jHTPQcBamAX97s7sPzZXOgeuRLg/+LXIUZ4a8gZg1wMom9Z0ZJi?=
 =?us-ascii?Q?eqhNTVresqPLg8mrqz9uWDQwUx1MC59kriXNUM++n1/Lb08YZ1GJTYO+ThFC?=
 =?us-ascii?Q?fqcwOCqd9OO7U0bKZctcTVJcO79Rzy+EK3MbxBtVcrYK+p6mxO7/2U+nm0cn?=
 =?us-ascii?Q?PLPt3wFCANqt/QDS64If1ngh8f58w6FvbmgW+UYnud8oSsSqQMMi6FHMw2U2?=
 =?us-ascii?Q?S/vETKl1RUg0ZuJ94bgoQ+vWEZzz8IsSRj7qQnLKk+2QyZBRUeE6xfjLvwU4?=
 =?us-ascii?Q?1Cx71mBiyaxapHO/Gl5WF2RMePzTaKQgIEf8lW+D8iJ/WUeVk6XM6PmAnLfR?=
 =?us-ascii?Q?LIsnlVb9ushcInMgAyfYnYqvwzSHHZCIw+JUXxRI0zWgdTd2dHz+76skQavo?=
 =?us-ascii?Q?GODJTZ/3ooi08ZeZ30/FfR756u4iINc25ovxdO0Q2uj6HOAnaV81hpcsdtMW?=
 =?us-ascii?Q?bVojBzi5zE1p8FZG3lD+A1DOSRvsMRe+l+4KufJ4ORSvn31xgcNXqoIuS6wv?=
 =?us-ascii?Q?U3TtF/gfZu+y9Wnt688fJeTsrzR1dsWi9bE4gUJyQM5S1vpgYWmwSrFBRO+G?=
 =?us-ascii?Q?oL/2gzloCNfLZwHCfY5nECltbRKP66l9ryuEOt56tpU2IbgCWfe77za4R9Xf?=
 =?us-ascii?Q?5G/uMfjm+Awpxdgzn1vIfsjkdVPS+zriG6lJRBZOA8KpxoR1QKOW3B3/79YI?=
 =?us-ascii?Q?7PbrvyVv8Qq1oqPpzqDIhiGhHdvDSFUaZiUwHJhtDg36QU1u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a64e9e-4fb5-4bbe-db9d-08de8a86fcca
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:55:51.1772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TklQE5fKVPrrcQM1vnYFRhg0bBjkGxpnH2ErYv26mMy2gWziqHZJK8aFwZ9JnWOfUzEOg2ZL+4ympkN+tqOGXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6870

On Tue, Mar 17, 2026 at 01:37:38PM +0800, Shengjiu Wang wrote:
> The sound card wm8960-2 and wm8960-3 only support capture mode for the
> reason of connection on the EVK board. But fsl-asoc-card don't support
> capture_only setting, the sound card creation will fail.
>
> fsl-sai 59060000.sai: Missing dma channel for stream: 0
> fsl-sai 59060000.sai: ASoC error (-22): at snd_soc_pcm_component_new() on 59060000.sai
> fsl-sai 59070000.sai: Missing dma channel for stream: 0
> fsl-sai 59070000.sai: ASoC error (-22): at snd_soc_pcm_component_new() on 59070000.sai
>
> so switch to use audio-graph-card2 which supports 'capture_only'
> property for wm8960-2 and wm8960-3 cards.

Do we perfer use audio-graph-card2 for all wm8960 later? look like
audio-graph-card2 is more general.

Frank

>
