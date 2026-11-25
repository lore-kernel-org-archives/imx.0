Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795629227;
	b=egHhYa1P1P0MmjamAxpuE6jz+UCXte10PwPm/g/UelXEv8KvnZsvLMq41sdM4+Sm9ivA
	 GBs6Kvi7grFknOMS1246YO0rGZiveixnFvhAIqW2PXExItZ4GJZ56O0YIt4lAjQdRN+lS
	 arYfLi4P4RqhrDjCvxxb1+UN08UD/vtqLMagFXFBOQMtcN0HC9criME1zO5YpY7eyIgxU
	 UMBkk6JhcYhFa6shAw8XtgvYlxI5Uo9mm9uGEAXAsDx4Dnl3RWC2i7DJ4QiCBtOtDT4tS
	 xURY+69dbj/ZXIWUs0r1mt2/+ZzkWSQFhCq7f72GZ6GtN4sOo8IKRyHw577pWoBFA3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629227;
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
	bh=WZ+Ybr+GiPJ8yHE+GILk+KRcuB7/fK8Xmj+RE5QCV6A=;
	b=1/2Fb2xeXzGR7ex4AlIPHYUEbm264khqDl/YmvMN1UoBbceQyVJS68mYHb7ze67OWEoN
	 /9HUxKMv4mFphUKTVcC5uqsor8iwAXXvsFB3lu2y2qxsmG8o1PjeXKLj2W+BTDB7aYFDj
	 aUv2KDQyQecJX/oDAgmxrN6d660MWnEtPxrTpvpDFHhRQ1kxMBhDHCD7Y9nEL5xa+542w
	 d3FNhMesZhPqDNnienESfq1ql8nUBqJ2Iryk19xcxy5kxF/RAONGeHlFLAPHxMYgZFB3D
	 i1TsZbuyJGQBd4ZQ6jZw+Q/ycXvmdypjP2s7vIBQTZ4Ipf+DN3ZY/BYttgmHAZtV17Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=d5nF1i1T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.65
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013065.outbound.protection.outlook.com [40.107.162.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14282606A32C
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 17:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14282606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=d5nF1i1T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M12K1pl964EqNjQDyc8tsvr5fxHehlxKfkasdxzfiE+w5URIJxLeHUPETSZqrBSUMZBVdEOWoJqISIL5JR8aWQAVdgf9oNbJ5x22bFXz+Llelrf+/ERUzaZU1ImAwh/LOYAx9MemHrWujhr3OV67MmtSSQJOaR2ti8RrHLJTezma1JvXiJifrlAhXcWXNZwW6XVgm7j9dfPR16aWD8g4zV9mcs6iNuFOBmpt5XbFhGIdI2oh9/l7GssCdzZ+MOvXq+BEWtREaFqg7JsYttQbE5b8WUx9rdXnCWTZnDC6ESxjwfMqsQGMElSmflcOIO6rrgKS0v6U4cWADpYgflccCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZ+Ybr+GiPJ8yHE+GILk+KRcuB7/fK8Xmj+RE5QCV6A=;
 b=Gi1ZXXolZ5QEtMY0SJFVAtHylX+QQcGnWsc5964XcqLphY5sRlHn8MuDKamp9U4QHFwZ8JvUXUUj1iqIiFqLd1R3AgvUDVHhhpjGMVuD2v2sGBywf77qeqnVDVYvcCa2aQeQBSO3AOSWR5gbGPhTStYFVRuUtLeRBkyA5kr4xPkbPqeB/m+Ckahj/yKYCpgVuEpBFQ3vo3kECqRAdguaH2hsEdHSQKUJEOxLy7VqWfV6IJYCTLB0/fbgT/aRtSiK47/vN1u8IHc1Mm81fo/N3h4Vh+4fD5cw2WOGiJmi1vyIhDgDYgZJXsoOOrn70QNubnhABxWW5Ck/2OdbujAXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZ+Ybr+GiPJ8yHE+GILk+KRcuB7/fK8Xmj+RE5QCV6A=;
 b=d5nF1i1TAP46bBJo+kSkGRnLu7BofFi8D0suF58WcgD7kd/GKqUFyKDBh5FSSyZY918U5tcInEIC3scJT0jbanEJhEiaxwR/oaaFbZmW8Be56ywjnWo9rS7oSDmF62kvj+AXQTavmOG929HWlVUOD7zeiSevApn1p+D7wjcJvqb/kQNKu6TuExKZ3yoYqp3/vMsh9iaZwN9BVlpxwupuoFz2HvNdBGoISXEFYoI/Iokd5EYB9bEzbi9FaOhVyhWCIUFWvkpmcf+T5be81zHUflOW+LXU+EuY8b0oNjP0oB6lmfE9lwUa0d5hm1Dva2ve9HDBTPfKSXb0eHIv54KmxQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI9PR04MB039066.eurprd04.prod.outlook.com (2603:10a6:290:b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Wed, 25 Nov
 2026 17:53:44 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 17:53:44 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: Re: [PATCH v4 0/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Wed, 25 Nov 2026 12:53:38 -0500
Message-ID: <179562921092.3128061.14859076263868776714.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CPBP307CA0015.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:2::9)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI9PR04MB039066:EE_
X-MS-Office365-Filtering-Correlation-Id: b18530d0-1100-4563-ea92-08df4b1d0c62
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|7416014|1800799024|19092799006|10067099003|261021121427099003|11063799006|56012099006|261009223027099003|261022075727099003|261102123227099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
 hlVR95lnQxkcEP1xKPbd7MF7X7bBR3z2skxi1qxElm/or0UR9Lp/pyUrTI0zB4BQLl2eggBr/Px5Li5/4kcJMLUb9oHFhv0bpvMe70OQuIzRG62yxLalnh43kpsl63wFxokm22KTFkIYxZEG6dtxAqZTxmlinLwk+2a7OLT9IAcYGXqlVysTfbbugVZt1HI5aSBex1FvG+htgKrkEgLwNUanBewq4okwYq1ujR2OMeeYIEIpM3GpdJtCZxBHdXIn+74d4cUStgjaSbTJNkP7aC6sj4gzK2q3DGJUMX1g3dZsFSWnzWMtX6g7G937/Oo++8lKwZEUPRbmLnxwOQNdDAPAwb9dgxJAUwcdE432m/M9TDw7gdqIQIw/gfLxIX9tXQU5c1zScscFo5J1i3ZkamcOJrzTztobcWQb/U6r4+PsPIrx3itfrwvurt+7DPrriPjveiFtD/MTRuiHQPLUXi1a+60rP4d1RsRG9NmjfLn4LRMPwrKQqmViDNRVsKdHU+lF5tk50hi+3ouPxGjKoTZSUfrXLoOXmJWXbV63IquthoQfADU+3/LMDKEdRTVh7nrehIof/5tDYhvMb47UkN/i7sduypt3Jo3TVvhuWSAmZFEtKO4QCXvyoa5XlEGyTw/1ZSEAkYPg+bVP0AWe3kUmezWtakXv6JwgDsptgrk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(7416014)(1800799024)(19092799006)(10067099003)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261102123227099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YnZFbnZtcGNRUDVtcFFsYU1aUzl5WXU2VXZucWl2V2E2REp3SWJTTjIxdDI1?=
 =?utf-8?B?N1UyM3gxQjdDR2piTGJWYmFSTU1FdVdldm9lc2FtSmltKzNsUGMyT1dBMkh6?=
 =?utf-8?B?eHBPb0VhanZSMllDbE40MUZJWDNkYWs2eXIzYngvcXYva0FzMWthV3dqNDlN?=
 =?utf-8?B?TUJNYnNML2ZRSVJoWjJ1OUtlV1Z4TGJFNXJwRzVaYzVXWldGMEdadmsyLzZZ?=
 =?utf-8?B?R1pjcHIreVI4VFY2a29FUDN5OUt6bjN2SXQrNzkwUDdOQjlGbng1SnRMbkJN?=
 =?utf-8?B?UEorTDdkckdSc0dEbEo5aDVEVTFyeUJBbU81Snl5ajZaNklzaFpvOWFwZWxK?=
 =?utf-8?B?MW45QjV6U1J3cHhJL1lVRjBEY2NURHlMMFpNbGIyZHdFTEVjWktJZ0hWQXYv?=
 =?utf-8?B?ZENlM0tZRWRnUWRBZTVVcUNaQ1NPOFk3c0JSZFlPazUvYnZkVmxqNmdtUW9k?=
 =?utf-8?B?WTZXcGRldlluUWh6aUc1eDdsYWJLMEZNdlV0WlJwdjZ6WWQ5Rk1ENis3b3hF?=
 =?utf-8?B?WitxTTJqam1weTR0SGttN1duWDdua0JzWWlMenRWYy9yakdLS2dYZzkybDZ0?=
 =?utf-8?B?OHEwTnBoLzQ3ZmhkeXdBOWtiVjZTeFZ1VDlFK1hOaEU1U0dSQzg5SmJjY0tz?=
 =?utf-8?B?Y2Z0bjJ0QURKWHNDQXZMNEVtUnJrZmJZS3IrWTY0bFBUTTMxOFA5Q3RId0Qr?=
 =?utf-8?B?ZjIxK2padDFtM2QxK0dEM2x5NS9weDFiWWU5b1dNVWR2UDBJbVVOclF0WGwz?=
 =?utf-8?B?TjVzTGFjbnFUTUNxT2NycTZydTZYMmxRS01hVlFqWXFVVE5qVDRMWmUzeWxr?=
 =?utf-8?B?c3pGY20wa29CMEJNVXk0am0rWGtFQ2R5SEx6ZE53bGZ0ZHBUTnprbFUvRm1u?=
 =?utf-8?B?aEhoY1lFQTZBU3ZCUzB2TzEzU2JHRjU3Y3BuaTBZbzJVV05ReDhEdmw5QitT?=
 =?utf-8?B?RUZMS0I2ankvWVp0czBIRUl6OUlrMW1ab1lqeUVxTy9xLzMxM0hBc2hPNmNv?=
 =?utf-8?B?ZVo1eEtWMjlWbUdBUWV2bTNHWkJjMkdwallUM1dqZFZBcEViakhoSnN6WXRy?=
 =?utf-8?B?aUMxMHNqVC9KM2MycUVtMDcyczJrUHNpRW9jQXZjREpUaFJES0h2NmRRSWps?=
 =?utf-8?B?Y0x3ZkFkaUVOTk5lNlNpYmllbmtnRG9IMzVXZDROcWp4LzFodE04T0tUbzcr?=
 =?utf-8?B?cTc5Q3N1VTMyNGQ4ZjhLNzduaVJDSmhJM3RiNklNU0MwNHNYQXA4V0lxTkFl?=
 =?utf-8?B?czlqREQyZ0NmMTV5d3puSVJNemQvOTVRVzR0Qjg4NnNQOHJWRmY3dG1qUll4?=
 =?utf-8?B?dklQT1Nic2VXeWZrZDJZYkdCcm5EM2JBWVlLdGM3TklLWXh6ZVU0VkxlRkQ0?=
 =?utf-8?B?aG1oVE9SMklZL2lsUG9ya2REUXBzWXVlRzBWK3d6RWFOTkxXb1lwWmErSnlq?=
 =?utf-8?B?RC9xMmF2d3lFZkdKaGpSakRDZFhVMWUwRFNtdktxODkyNnZNcXhyNlFUUzdF?=
 =?utf-8?B?bW0xRGVmS2J0SWZ3cjBmY3VuM0lxbWczZG0vWnIxZkcyRGxMS0pTQ2xpWTdV?=
 =?utf-8?B?TXljc05MV2Zad3BCWGNHenM0aGVyMFFIRmExb0hUMVZNenJ1RitYQ2FTb2sv?=
 =?utf-8?B?cjgwNFYwSjNqUUx2NnNPblBYTzU5aFNuMFBDMFBucUNJOTByTGFMVmFITlMy?=
 =?utf-8?B?OGEzZFdzQitCS0cxajRpUklsdVNCd2ljMFNzQVdDU0QvZUJsc1NPZVVVWmUz?=
 =?utf-8?B?Znl1WEJPelBFOXdyY2NpeU44SG5IZGxlRVpHc1BUTllsc2JielQ1TW5lRHJM?=
 =?utf-8?B?bTNxY0xJaEl2dm9LTEptTlUzWmZENTc2cGticDdDT0huRGlNdStPb0VtQ29k?=
 =?utf-8?B?K1dtYmV1OTUyK21SSllsV0txY29peld1eUtQOUFxcDNYRklhTit0aDZXUDNa?=
 =?utf-8?B?ZE9vczRpS2wwTE5HOHB3QXcyciszNWNSZ1ZueENXWWZnckt1a1E2Ky9kNE41?=
 =?utf-8?B?ZGFhL3FVamNsaVlDYnZhbWFlTXk2ckxJRTNpT0Vhd0tNeTk0aWl4dzRwdGhN?=
 =?utf-8?B?MDgxUEtKV2ZjWVNxemxJem9CNHhzT1NISFZFUHpHeTJzQVVnU3FrRWRzcnlF?=
 =?utf-8?B?QVFaRGMrMGdWN05LZlpSYnZFb0NKSHgrRE9xd21EOU5EcXhFSjZBdFQxUGln?=
 =?utf-8?B?YjNtdmxJQ25LV1M0eFB6NVZlK3NwOVZ5TUhOTnZ4UUdaMWFycnRMaGpJWjhW?=
 =?utf-8?B?N3hZdTlJY3p5YTYwWjk2YnFzUmpKVTVSUUF4MzBiTU45NE0xUXdocm9SYzFJ?=
 =?utf-8?B?czAxaTh5c2ExTWpKSTdZRU1nL0hOaFMwMjczaWY5djFWS082RG9Kdmo1bVcx?=
 =?utf-8?Q?l0NjD0x8a9j0vQ2eE5jTlqh1Pg8dSyWHyIm/T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18530d0-1100-4563-ea92-08df4b1d0c62
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 17:53:44.4818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+iEA3BT9zgWZc3fwH6KTgPonhJkFCQcsDSlHrtJRugD8WpgjjA9NcMHA5cGh71xtu1ZbjU6Pj4PM9mA+WIxBQqKlBBEcp0ELPzpCbW9NY4+TCvZ/MKzFzLx1llWF3K6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB039066

From: Frank Li <Frank.Li@nxp.com>


On Fri, 20 Nov 2026 19:32:27 +0100, Stefano Radaelli wrote:
> This series adds Cortex-M33 overlays and combined DTBs for DART-MX93 on
> Sonata and VAR-SOM-MX93 on Symphony.
> 
> The first patch corrects the Symphony resource table address. The second
> moves the M33 reserved memory and remoteproc configuration into a common
> include shared by both modules. The third adds the M33 overlays and
> combined DTBs, and moves the common include from the module DTSI files to
> the overlays. M33 memory is then reserved and remoteproc and MU1 are
> enabled only in the M33 variants. The overlays also reserve the firmware's
> peripherals and disable dependent devices.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: freescale: imx93-var-som: Fix resource table address
      commit: 673c77963db746d03fe4a8d4bd996f9d1f434b92
[2/3] arm64: dts: freescale: imx93-var: Extract common Cortex-M33 configuration
      commit: 1297336e072497048e303f78405b09bf84bfc38d
[3/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
      commit: ea0a01add4c61d799453842c65c7073f1bb89854

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
