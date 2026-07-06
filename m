Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E2E42CAE6
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 12:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341335; cv=fail; b=IOqouOtKe0vlSeyxrYli0OznvMMb2i6PP5jlmAQGJ49rPfskzGnaxGHEko/g1RWwjrkGyalJunwY4LSOxR8bbebg1H7qg1ZVNT6WddjW7WmFQApaCXI5BAjA2DnE2TiTQFnjQLp5T5Lexff1PJNZhQst8CE+5T6JSz9wJtMgeiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341335; c=relaxed/simple;
	bh=5Rm4SxUfj8pBjcusUkkz8ePP45hcIPdoEJ6//QRi9+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pfEiLoZuWlWsxtlRXdfN0gGE4ij52a3UNtpqJUmk1L+Xrg6DK9Ly9jW09dqN7u8HL1N3G5BpcBUNzaqrkNMdOOYLeLVlNVMrgdT8C07voGkEEh4gLzzKsAHuGF82plLnmUsO9qvtJ21P1ZSlC4S/gd3bjBxPNATjhZ87oFD+oCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eC4njPGY; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eC4njPGY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPvk7ces9TrdaBpvoXyaardcrpftGD4ktQfrf0pttIXAusk9KZrAyXw/bFLKcYFbzX8Sc6OpjDXgzfTG4xz2FdzRAcHCTDXO6EnzpJoxTCPgdA4jXb99pGEMsRLDRX5EylhD3gRMy0Gj8+mu14MWLXASxqqvEPxUkjkfQuYjUBhXLfke8Dfg3ULnF8oaAwUeV6ydj5sdQIkJYaSM360+3l5omPSCgkrwxfLgZ7maZn+zNsvhkeoVX/Pp2YTkZ8iyMOVhdkhfcN1dHzpH45OL0C445FoRcSKCmIu4zpN7i09Wn3akhihIEkkh6SpXFo+vdNoE9CL0MvcuOcPJ/FMRaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Rm4SxUfj8pBjcusUkkz8ePP45hcIPdoEJ6//QRi9+w=;
 b=kr8pleqUKL7qNxupgqizo7ax6tLn3IoensmKTpqfC7svAMi0tzZG6ZRwCk33q3lAL74eMC4kwNFoaROOkXVTBQudVv/LkLMX6xde6ECQa/ybG+ev/cW68DK7N5iNYpjixzLQ7AWKIRGRjMu2IIohrdxRW0bmqmmBRH7M+FGmdZbDy7hVwQcWjkLa9UP6r09YuwIzW2cMeVHjt9znoIoPL+My4VKv1/6QxCdpMbvnVmOtKpiOfY1e4DshCJk5Sj6X2jJ1gKWBxv6RyiOj/2uVf2/VEFtvjFjJi6mYSLgT8leaefs77eSSwkkoWTfZrPP+VP11CBRFHfFEoo4sramdzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Rm4SxUfj8pBjcusUkkz8ePP45hcIPdoEJ6//QRi9+w=;
 b=eC4njPGY7QAMFgA+gBLD1aLQJgrhg786qhWirOS4QkwQwhyb/p0jWmX+qsyXoDSatOTMEiCs+p9iQaR11A+vGUN+EWYEthzSSfx39OZqgbtGmbLId3SnY05QFv0heLd9B2IeGor3cX9sDa6qKUfEz0LUh7KWXI3Wkmg6dn1m8W13vBhYibMc/SeO8yWVplHV1A+Su5H8MAlF7NjmUwDuFFgZcI7dwkr6VUrbrhnFuDVEvch7fLx4Mnh52MO5PonwiNsalwiZ0R9JYbHv4LS4BXFT7QqACYL7ZDl5qZ42e5Na2zAEjo9BT8p9K03RJICBBkZ1fTYIZH3+VC4IaqP00w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8576.eurprd04.prod.outlook.com (2603:10a6:102:217::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 12:35:30 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 12:35:29 +0000
Date: Mon, 6 Jul 2026 20:38:57 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 15/15] arm64: dts: imx8mn-var-som-symphony: Disable
 internal RTC
Message-ID: <akuh4UQQigRhn1QA@shlinux89>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <7a31f7ecc4fbe9ea009dc7c5f611105daa989c7f.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a31f7ecc4fbe9ea009dc7c5f611105daa989c7f.1783330236.git.stefano.r@variscite.com>
X-ClientProxiedBy: MA5P287CA0307.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ab742e-24d8-46b3-c0ac-08dedb5b106f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|19092799006|23010399003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 MYx7/NhxBSa0y6LIFHg4v5EHlEchctgJo982xAJSA/goTlqp1uqOXFK8sKjE8qG9d5NhWdoJ1AC6ia84/erkz7e03CRxyAkvZLboUFNIFSt2QuNQ+ioClJqDcfaQwHYMa9AyExJB2A4PIFy9TGFDnEzXhpKb+ZCHg77l6YdvGmhKpzTdOiVXNk6uep2/AaRjXG9u/ac+w5KSuKYof8GRRt/UXEj2BCAADnDvkQp8mXnIaPD3vRGkLYDBIdub3+XW0lvBEazoYgjmbVdr4kD9opD30g5ooDsxGPhG27D0lSa/WPc5G/Ggru1KJLNOulu62HRpH+PuDJOGbrBiB7pSvuNXy/a56BEBWLG3i/jRVgJuyFi38asFhfEDZpUeMst7a2BVTTKcK+EeGM8MdSy1Q3RfqnpiW0Z3w8UnEt8AOB2aBEo9qPKAOhcm8Lmxigce3ymoRPO/7Y0fc0HHprzKJyXFwKuVhwxC6QEZHd4rodyeD85CuDZKx2XKu28OCbatFfojijPj1wH5PiAZJQqwUe5WU0uqhzAaYarTLUKxK9HpA6Cbs7+vFIDqeo1jqQbOGL/pp0MVbKlUcqw6iIsXZeYaZgWAWLsWZws9cj5KyhQ4CL8oRdW1isnR+P1BrhDi1wuZ4O3weNZ6JUMHtNpdKNgiZMjRbUDOaMqUGLFmN38=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(19092799006)(23010399003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1N2RFryDF/+D8vFYHCiHOt/MGkfp5R8HMe9SD+EZraW4kZa9eFhBPMcchmM/?=
 =?us-ascii?Q?vxNnUwLl2Wzu2N9j5+4cRga9wn4/KqkOkntfVOb6iXW0XDlSPjWry0KqPKJR?=
 =?us-ascii?Q?CKX6vfjuUnsrMpEnw5h3royBsaI77U+7FZuFruqWoK5PEYx38iDjHo1q4ymD?=
 =?us-ascii?Q?Bu8glj7Ep0B8hYw5sExL3HEBg82wRljw1m0CU81i99RgHVFaBJTubdjFVsDb?=
 =?us-ascii?Q?clK184Ou8jCY/xxVfXRAT+c+YZYwQx8ACV7RjGUkWu5fjTtLenpg3qFT2YDc?=
 =?us-ascii?Q?rpF8p6TkYpsmLRB0VRA2Vtq+H/gnrcW0Wv8ZKI4HM7NV7T7161EfM1I9ocbZ?=
 =?us-ascii?Q?vL0CfnsFmeTRKUfjELGF7LBlfCJZ/rPQlgQM0SOfSo7DDrjgnxGl2S9x/J8E?=
 =?us-ascii?Q?uXN09G38rIZQlshkRiArCw+9FG4NFDpW7vkBTq+cuGjONmzeyA+5cljZFjpz?=
 =?us-ascii?Q?VUSyrQNd1BilxhwlIB0AQff/u20poQwTxMSDQ8fpmfVMkj4g701Aio+XlfBo?=
 =?us-ascii?Q?tVyrQdTs/Pz/MQKVlMpiBC11HOrlhyrVtWFrFqgco5987y2UDS6Cj7YAMSLn?=
 =?us-ascii?Q?0QBeForXwh1Vatv3qmcRU/z/AK0GSQhyQnX5quYT/5IR26NlrrrSXdL+3APO?=
 =?us-ascii?Q?pJsvv4s5jqmMhQGPspYc5hz5pXo5JUmDiBWqV/pB1TZAMV9jYpbcemrm1xBM?=
 =?us-ascii?Q?/1dO1BJ1LISM09yZFgCLE+TfpJtS3Na66V4n4RT297fLmXcU+vx6rkwX7f4Q?=
 =?us-ascii?Q?RBsHZrPBPTczHSOSBFPI6kKIwkd84O6gkjTmAJLlxh5HEs759q4kKdDBjJoG?=
 =?us-ascii?Q?meqhtcbzBjjgTSrwHOOXsVqZM7ybaNGWUGad7QqFj8mf/thJT72WMrtwmcYm?=
 =?us-ascii?Q?NQK29CjLV8MLN1jh5fmQxouJtuS+iBArC973zlYhQsKtcOf6F888YykHtPEr?=
 =?us-ascii?Q?tYhte7rgLIBnH3cO9AhO0HZPb8OvkAATTtqGavsdHaDOzpFepDtrdEIxarHB?=
 =?us-ascii?Q?p3bFi0iDMRMfueyU85ntf46nG7Kn2RYBjWEXe92+2HyIls7VZ1rotU5pHmaJ?=
 =?us-ascii?Q?gP5miJm/V3u1z3QaJ7mE6z5OtGPesHz7xeAKEpA09adrQe6m9jwnCwE2L+I0?=
 =?us-ascii?Q?0pLsN8CIO19+9tmIQpUYMtvpWWTdXdCkHEcbp6eqao05ukgiJeo29jYzDNRl?=
 =?us-ascii?Q?z2BcWVJKiPOETW5lQl7yYtk/kAptqt3Tjyx10H3PJUc6TFajcTo848kbXK6B?=
 =?us-ascii?Q?2/VlPnsDMIFezEBuVGKCnPwwJb2PVO0HwzRIDySq6XIlYLsU/wgcGVhO8/yK?=
 =?us-ascii?Q?N0wIYOGHkUrbehAPjhaBHUT6pkf1f385Oi/RzLpDU9L5o/mXZYvoqKCz9oOC?=
 =?us-ascii?Q?vxjVOizrfWzP00Y3regi2L9+C+1uwVsMB28nP65ZbJmaY3jYCL5dqlhKa9Pd?=
 =?us-ascii?Q?hfyVHiu6udFNilVREqGAZadnA6iW7LuSZLBl7b7mIvxxePvWztTk7LKpYIdh?=
 =?us-ascii?Q?tDYpp4ltraXnUnRiMDOWWK8J6iA5YjA5eXpF/sK3sdNCUJnTLuB0uiA1pp8H?=
 =?us-ascii?Q?s1wPYi55vzOdG+kqyHNJ1j9BMw4cCIbfE+TTZNQ7ta1tvbDPww9vIEo6+0FB?=
 =?us-ascii?Q?tvW6i03p5rYWCXnNwn34JF/rZXo5XfbZsQ2i9KF5Al+A9r3weMEoxaVbyJqg?=
 =?us-ascii?Q?nJdeaX5AKVCi0NtQ4CbV7tgL56Wk79aH/McPqNK8dVGLTvTG+6ZPs/vSsjrj?=
 =?us-ascii?Q?AzqZUBZyev0/ch4c7rb4yQsTaM3Jt4aSq67azGPW8kywzM3af6tr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ab742e-24d8-46b3-c0ac-08dedb5b106f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 12:35:29.8539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyTQhTD986zEojZgWDIu4q94epO5EGo4bdcROUHxFA2XfrfbrMQ0rJzSvSusqJsFPAmczu57iqfm4SftGmJej8JOF2vlvvneVPnUkefZk4xR1O1tI/Wk8MIuRr6EafRW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8576

On Mon, Jul 06, 2026 at 11:34:45AM +0200, Stefano Radaelli wrote:
>From: Stefano Radaelli <stefano.r@variscite.com>
>
>Disable the internal SNVS RTC on the Symphony carrier board and use the
>external DS1337 RTC instead.
>
>Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
