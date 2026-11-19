Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126403;
	b=jCt1p8xICnUknf6DlEcx7/v4JdRkBd7n6Qsov9GArk1F5I5u4rPW6A8emTXa8lZAxj4j
	 j7Bqvi50Upmh2pYM4g2Ymvy6/EOB8IOanx9NgksiNeH7xwrt6LoZxh7MhA8QvkNwXaJwa
	 vrtUzEN3QwbehkfIJb/MnQJOyVNNBNLTZGutFaXw8UQxtnwpIU9Z9TDUvn5BN/jPOLD5w
	 u0kkHipZw4xJc1OA6+Mm1DqXbAWI0ND9aw/dkggiI+Tt+Biluv9KRcEQY8D5rBuVTfcqg
	 oyNqk8pt2MUMszxljxQJdxDVu0ggfo9/4r75DZ3+TFwmMp0HUjbeXdCsTBsgJ6enCnA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126403;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=N3OpQWgdPKXkFSh/VF1KVyPuBh2tsn8XZYd9NZUJk+0=;
	b=cbeLDllIARIX1UjKiw/CfTJG1yw/MhJsojYQjRgb1All2yQId9v6WWu/RRsGLXS1n1/k
	 hoCfF75g/jgNIT7DA0jCZj1DAZJk5ff3NQj4zNMCXGpu02LicsJeFrONtIoUjpDfWF80S
	 RYHcKzFkXftxvOng/Jd6CYhUvurS0mtDEIGUaK7cryZMIncwcyfvqY0gVeOWCzk8jH8AX
	 QdsMO6FYAADspBh2giT7CKjfwibPGJwwUHZYcTVfM8Y4llNABOkiYGLckmG8qiBih0Jar
	 /LXPwqB89tO9+ysx1n22sSxWJ7u1PUbJEjAWYFmbqs3/WBHFs1ishBltdw7QWCecf3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=S8cH5fCQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.8
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011008.outbound.protection.outlook.com [52.101.65.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FAF606A332
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 22:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FAF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=S8cH5fCQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nemKDpx4K3Aj7DsXFvHZ+DqH3rGaCa6vLyWPwa3aIiVsLX/nvbxfVMsNqL6ErZeD+FzbAinvKWUthF2rdakJVzHo88ezT6WGAk0yaslDecXmkINMi/t0Ba/Ff7owuQAUtRgpObpM71NR9qtz45T2L8GZlZRL7CtFVMnnCyNpefSt34AIHybBCFOx3tzXQEpD0RHrXExQJW8cb83LvyMyzLMxGouf5Eh9jDckb17ereFzwylwWnwP6gK7AiuyVz5JOUf0uNIjhl5YjXEaM90oFsjyvuvUF1CAZyKv0sfJWwmS6qxbeIbHwPK6L0w5Y8fkbkSlbcDjTrZqeJPn4NKamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3OpQWgdPKXkFSh/VF1KVyPuBh2tsn8XZYd9NZUJk+0=;
 b=E/lzdDkA5dU0nIN7/LlnGztVxF4YEuyKt1n1HnoM6JBZaDS2jkyMq8kYjpMlk3UpXDV6io7Mm7GmmpGMqcGdDmO2iHxDkLPcvDY5389uDjfSRm7SvzWaiHKMQ6cQAPa/i/Wf5dvZuM5kL98Z66CP8X/6TzEAd8s5QBZAewOGowOGHi/6hg+BpR02M7fE7dQkw08aycTggyvLCuqo8/q2ZBpDlM6qdiRnmEHelKBfCoMtduhgbrO7j3MrUg3ixBK0WGj5PZ1QqwfkluKY8rQiRlESNqh/axBAA9WlbiGB1NdFZH64Kt2hDhgRFZjufTu3V9FluJodKzxY4kKXlpjcNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3OpQWgdPKXkFSh/VF1KVyPuBh2tsn8XZYd9NZUJk+0=;
 b=S8cH5fCQIbEVx7ftenIlIOFEkvLKFzlQzSFPpuGxCNZlV0wWjjM8tLoZOhDF/UvMJmjTewKVMFnA7A61gniAjNF5hs6378gebA2WJW95v0S+XoAtk0edvAKE94R4OGkmdX1PpdHhmpDUAbYSjE31rTofigeeo00timmvjI+3w9FLMt7pCsOicbxtZ6GZXrlhonbqQIzocU3JZSpObuMb6FohFMFAAXnyaMw5iIT223LeU6orsnZVHC1M+kR/so5coM36L+JPhOQIvppeeFrxFFXY9EWH14+Zj8ap8oUEWbNYUbXBob7Ip1cP2D/GQ/c4m507nfji9yjlUPDVuTyJnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB12057.eurprd04.prod.outlook.com (2603:10a6:150:313::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 22:13:18 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 22:13:18 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2 0/3] Add support for Variscite VAR-SMARC-MX8M-PLUS and Echo board
Date: Thu, 19 Nov 2026 17:13:10 -0500
Message-ID: <179512638003.1959211.14168078214611413757.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794420001.git.stefano.r@variscite.com>
References: <cover.1794420001.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0143.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::25) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB12057:EE_
X-MS-Office365-Filtering-Correlation-Id: 4188df37-84f1-4627-48b1-08df468a50db
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|23010399003|261022075727099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 LCjHlnAohUc/8RKZOPezX3vXpeFEhZDGLC/d+FG7hnieeZ4bkAZv36997PfRKpwdSVK3mtJuHMwlmgDu4A0yiT4227AfwW0FdQ3Y0VWLO1aaKRfgzpFUmFCG/N8qNrkjvX3aOntIxStfIHw28SzfRNiAtw1yNJXmv2eLwtC2U8jDMM/BfJ8FrCyTigqSFTN01e9KhyC+dlG4Qgm2PxI/hR6FohfKlb/awHgCGh69HuLaOfnLpsTfirypotun601Z6f2zr2qWLHIwpExBs6q3IZtshWP7u4ecrs/SO8B+a3Fmn1eKCfibxnQZ+egYXwC8miVYrRRECY9Z8f6HHYUIr9+BA7OrJnQofA43zQcI/4Zqi36DcnI9BjzS0q85tw7wFu4/cLkkem/slxpWnAC0AYc7IPnyzzVh0Nfs14Z2hdjugTlUHpSwlq0jOoa2T2EcJ7SFJ8EQJ/snIf1nTEPEQhvTHRSZ5sk2pDxTokVl+YFKgwvdn2sETWic4TwcKICo4Ft5CLctt+IFJJV6fbdTU8dTNvQvgQ6Lf1qeqLxkq+ymm/Ie3XQhGMU1UaJ7i2xxmW8PPW96hiYI1JNQQW8NPSYIGQTPEg7y5w1bc6JesbGeDf34iBEdb3ETp2qzzTfnRHsnC2XKecTPUsMgdQFecLZPClkUbCb+B4b9YqzQ10w=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(23010399003)(261022075727099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TjRqM0ZQRitnTzdNa0RjK1F4TE44ckFrQnExaGk1OHZIekcrWk5VMlgxUUFB?=
 =?utf-8?B?UW4vZ0s0M0hFd3M1WkZOK0hHMUpvYVN2UkJ6bFlUaWR1SzRGVit0UHBsRHJ6?=
 =?utf-8?B?bkJ0LzRkMktNbUpUNkpQcUlhTWNyWDVqZWFibzVjbjlPakNkUnVLQU1vQkI3?=
 =?utf-8?B?cjY2WWZDNTRNUnRRS1JFMWRoT2l0Y2hBbVNCRThqRGtKRnZTbXZRWmZmTFpv?=
 =?utf-8?B?RVF2Z1FQeDZHVURiVWpmZkVjOGdoYTlPTERpQ3dPS2daSnMwZDZaZHRGQnpF?=
 =?utf-8?B?d1k1UDFtRHViZlFBWHhsSkZjZ0Z6ZnNnQ3E2RXhsN1hTOWkxZStrRXVCTDRJ?=
 =?utf-8?B?ZFBIYXQyejgvRnR3WVNIYm1FUm5CYy9ob2hMNnNRUEtkYlQxVlRXc0RlNVp3?=
 =?utf-8?B?UGVZOVdUN2lHQnNJcjQxVHd6YW5VRFBUbjhKMDArTVk5ZFRiVFpueVcxa2E4?=
 =?utf-8?B?dXZNeEtTL3V1bUdsbnpzK2tSN21VMWFDMVo2MU9aa3ZienZXci9EU2owSjF4?=
 =?utf-8?B?a0p5RmlYUmhzRFRaUkJtU2txMWhMMk1jbkg2SXFOaHdUSkdzOWtyZFN3enVD?=
 =?utf-8?B?QnZoV0VsS3BGc2JUcUpwZE02bTZGb0ptOG5IbnkrcWo3K0VZOXlvYml4OVla?=
 =?utf-8?B?dW11MzRKWkpyZUZQNHhmTVEvKzV4UGZrREVwejBiQ2RWVm9jOS9MWXIwMWFB?=
 =?utf-8?B?YWloNlVrbjQwSjByTHJpWU51RzVqWHJ2bzBoV0RLczl6M21ET0txaEEwTEtk?=
 =?utf-8?B?b3pmU3EzZDA5YzJHR25GZFl4MEhZLzVvMlpKNVdwQ0hJbGpNYmZOUnBsSFVE?=
 =?utf-8?B?dmVJN2pGTnF2Vk1wM1o0QWZ2UEVEVUN0eC91TmQ2czNJOFlyRnhjeUxvK1Rp?=
 =?utf-8?B?TmhKRGlXN05LQnhKWlhvUG5xdDRiSDBadW95MW5nK3RmczdBTDVOTG52VkRo?=
 =?utf-8?B?SEtNY3VBVU9wS1F1aCtabE91azNaZHBKbEZDcHF5OFJBQmgrTjVSeFo0NTZN?=
 =?utf-8?B?dnhuaVN3b3Z3ZDVDS2dOdmpGVWRYaElLVWRiRk9YcXZsa1p4eEFCcDhwTFY3?=
 =?utf-8?B?Rzg0cVdKc0wzM2QxcHNUeUlFdnVITVpPajNMaUhFVHUxU3Zlb2c5SmVYY1F4?=
 =?utf-8?B?TXRUOXJScUlZdFdQUjdidnJoZ0dQTjB6RkFiMzlQLy9BSEJEWlRUa2E5aVRK?=
 =?utf-8?B?TGc0U29MS1UvWUcvckJLYUpoRVNOYmJFdWIzQjgvcXpRbEo3UTdxTGxwVWNz?=
 =?utf-8?B?eUNtKzg5ZGFFOElSN1IwSmNvOGFFSDNDNGhiMzBmdTczdkhGNE52VzhVZlpV?=
 =?utf-8?B?RWwraGRqRkc2dGpzK2JXWnhUOVJ3SC95VmZSZkgyWTc4cCtEUWZQcVBLYXRH?=
 =?utf-8?B?UDVPOHNhTHF4d2QrcVJHUEJNTG1TVnoyZ2ZJU08zR1lmYW5WTWNsZ0tuMFNp?=
 =?utf-8?B?N0gvSkRvRTRHTUR6OExpUVJVc2Z5SE9tT29qa2ttNU5VdHRGZEEwbkdmZ3pE?=
 =?utf-8?B?aFVRQW9rbGxCU1JvRlBnbERHZ1hLK0V2WkxsQnNJeFRSMklKWXYxcTJQTnBr?=
 =?utf-8?B?emxlbU5FeGdZWWVCWjF4Wnl0eks1cy9ZcnQ2MGhwbkxQWU00c002ai9ZM2FW?=
 =?utf-8?B?eFRYaTNwZTR0dm13VlRKUFd0YnRlWS90cmZUdGFiWldCcXlIdnNqQ1dRNmly?=
 =?utf-8?B?Y2FDNXpXc3hUQXU3dTY2L3dUWTVIN2xHRllvOXJmQm5VSmViaXk0NkQzdVB1?=
 =?utf-8?B?TGxLZlovK2RtdUdBR1pNaFJqYmVvUHYvbFVubU9GWXM3WVRzS25iSVcxZk1G?=
 =?utf-8?B?MFF1UElLVlU4M2FvY2V6VDF0RUQ1c0JzWWoxWmFKdjJhNUhaVVgvbjRKWXla?=
 =?utf-8?B?NjF4c1A4SzdEVEZxQjd6Y29oY2tNSVFqL25UT1p4c3JUdklqYUZQQ0ZsK2J6?=
 =?utf-8?B?Wm9nNzhKNCtEYVFjSU5KVW5jVlArOExBMmJOZWprc0ZKdzRvUTFJRDF1QW5j?=
 =?utf-8?B?dlRJYjlGa203SUZmZEFqeXlTVVlsdGR6MG9XVTFtdlJMYVBqS2RuTmZ0Mjk3?=
 =?utf-8?B?TGZ4bVNDQ1JjVW9mN0RYYXpRM3R0dWlpRVFmSVphVTlYU1o4NGNUSFBhbk9j?=
 =?utf-8?B?Szd6UXR1N2RxaVJFbStHbDlPYi9DSGxYRm5EQ0lwWERHd2x1Y2lGUEhQa1gy?=
 =?utf-8?B?OGh2UkFESzg1L1M0dzF3NlR3ODVGYnJqbEdpUldSVUN5RFplTVVPWlA5ZHN5?=
 =?utf-8?B?TGc0NmVRRFlZL2lsb3IrR1pNUmJlRXlWRjdQaGpSY3NJb2hOVGoxanlFT1Js?=
 =?utf-8?B?TVd1SkVySHRmN09aWW1zazhwdStyeXNjMzF5Mk8xTlQ5bFR4Y2VYMzF6ZytW?=
 =?utf-8?Q?8wdBMmCPDlJRV8WPtGDz4UqS4KCyP5DxN2k8C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4188df37-84f1-4627-48b1-08df468a50db
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 22:13:18.6787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBv4A1vrfIbOQjlhC1p/DGSceR/T5st8iZpzFxARqOz1dKQfajvXRZmMBQgOkdLGV4CzeazvxQKe0ZCBRlL/jBMnPQTC+zuEkoBUoTGQTkh/TN3IvrykuGNCz3wxcddI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12057

From: Frank Li <Frank.Li@nxp.com>


On Wed, 11 Nov 2026 21:23:09 +0100, Stefano Radaelli wrote:
> This patch series adds support for the Variscite VAR-SMARC-MX8M-PLUS
> system on module and the Echo carrier board.
> 
> The series includes:
> - Device tree bindings for the module and carrier board
> - SOM device tree with on-module peripherals
> - Echo carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: Add Variscite VAR-SMARC-MX8M Plus
      commit: d9910013d79162508e504de08bdf56b60ba12db5
[2/3] arm64: dts: freescale: Add support for Variscite VAR-SMARC-MX8M-PLUS
      commit: 47832b74796e5a071078f85195f083cac63efbe9
[3/3] arm64: dts: imx8mp-var-smarc: Add support for Variscite Echo board
      commit: 7a3f699c2b123a130707f1ecee6c0093e104cf4a

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
