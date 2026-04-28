Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010003.outbound.protection.outlook.com [52.101.84.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A843B2FC7
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383207; cv=fail; b=oJA8yh29846tYvpL8vpSL+bowh5G99lCeVHemrx44X5E52FfPn1N/oaD3YvmE6eVEjt76+kcOopCG8/YZn9EZ7kAyOVe3T3mLMd2PkRbnnSsedzD1FmcI8YRCPjjA9vL8NJIJ3JojAC/TPcADkDuAoDPu0ntYlOsL+fKqnf3W+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383207; c=relaxed/simple;
	bh=cKsAGqX1l2hY3Mo0twRFJ0Pw1mLouIGqf7xkCjZ8S9E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MGEJzHoZyX3YoTyf1PqcI/Axe7WPuV4q0QRb9ManFUSuqCNCG0omb/xJLvmALICEGUFt7tyu8/8MLp132SXj/HUNHPqMMgpvXgirSXJvmCBHTC5Cbnf1hJM0Q6qWkeEBggJ7OxqYveu3RxninIgX9spPEC5qb0krucK0MxXutrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Yg1nsPpM; arc=fail smtp.client-ip=52.101.84.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Yg1nsPpM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrRqvgTauHF9akepEhq7AMyv+SgYb3QCQLH7TX8FfXbFMFYwn83XNabnJouptiK5KnL7HHZ/xmoDcpbbPBZ2MqxhRZVMnkta94sueInGL4UKLpvRMcRx9WdCRLc3S+3PkGObLBzdionHA9oPq2LvR62yNkWlqquFrtAB2bFwSJS/gjpa4e58Ma/1Aoh5Qk9zXlTBW/ZuCMFKIu30t3Uq5A7e/8RbIcpjBU7JUvgKSVU/2R5PKSoHIsmwR2frk8/4h7rpgT5bV025EVu6JOJKwhgM0TonDLonz1cfTkFpO+LgnsriRGrSSoeUj7a758ahQ0TYkNgl4c3jsoOAOJbsnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP3rzJlXCVd8nPjr2i4nvd5gbpfK6YtUCm6KvDZ9Qxg=;
 b=GZ+wheLgULqUzF145j5nw/u2C5IPGhGKMpPYZ56In0iYE1EYeJFuB3DbtohvgAcCaX9HDjz3ssrxwwXrTdh2lwNocPit1EaWsQPmrJkqabTLZp6ESCFw28txTC9b2a3c2xUevfi/zugHltl+ppQeH5bXjGvqRq6QQQ0D/H+0QbVeD3xf0zY9AU/oEEmyTdoYaVzVvIrNcSM4BWpuAaaWOACMncLvCngg8M2nq0lurQ8t+Ee2kEbYLZmTPHBOFsj2lfiaZs9I99QRXgpPHxMJy0ANWLWMDcCZ+61EgJ2LyBp0QzMPGhfyqrS94CjXFr3edTgRf1AU9zidAaxBoEXacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP3rzJlXCVd8nPjr2i4nvd5gbpfK6YtUCm6KvDZ9Qxg=;
 b=Yg1nsPpMpkZB+oZaiB0PxvKpbqzixgIBZvrD8DKO06dRqf8u7cvEQd6gEFmyo4fHIuaxcpdr3zumeJNa+YGU18lfm7bWqj/j9v6cM3HlJy+CLJcQXIzpkyT0PKKFzUh3JhMfmSNhFcKGpx1OuGYJDQwMAzCkaB9ABSA6lo6X2/wpsQGYjJAHvmlm4daugVsSnMUVI8QyGUGHD3zcyEKmi+JDZIvEGSApNRsjnYYPyHUspDa0jtOCvF/PM10F+eCPzqD5X7UFsYWFtSTIgZlqjmjvMi3Uf4OxRigEtwnxKbq2q0r+PuLEVjlx7vK4n7X7zEQ6y28NZ7JmCdnt2rRiSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV2PR04MB11568.eurprd04.prod.outlook.com (2603:10a6:150:2cb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 13:33:21 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:33:21 +0000
Message-ID: <685ed732-fe54-4d2b-b2e9-6bfd10d67b82@oss.nxp.com>
Date: Tue, 28 Apr 2026 16:36:34 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] remoteproc: imx: use device node name as processor
 name
To: Jiafei Pan <Jiafei.Pan@nxp.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, peng.fan@nxp.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com
References: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
 <20260428090819.17761-6-Jiafei.Pan@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260428090819.17761-6-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0292.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV2PR04MB11568:EE_
X-MS-Office365-Filtering-Correlation-Id: c65d2a2b-1735-45bc-de8e-08dea52ab6b5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	ilRa+4eQLFmN1R2aC62uHveVNkPeeqFldn+pcg1/jlHt2Qqsc4UhB/sLPwggijieyjib13YdzWvPXu4PqdzxVcULPCQ+MPQvigByxMueLmilZq01Ckjm/4TyZ8Fs0R/cp7epUTgW266zHOTK/UKAL3XsGMNV270/U0sxDBrlU78qr1w9C0ywsr1rEU+45hJW+bsgSxlqdx+iIqx23P+J72FFlTNbXZ/8iN1yVEqFgtieymG8cTi2tQJrHkXVb0187U+xkMqZ4pCSQ0T6qUrwJI3Y1kOcD4XwayB2myq8xsN6tWL7FWXIO+lN6IBwMkijYg8usJYIVWBho9xKISTDMEl+ygzapkPmYsi9wLikxcGPfZkArh5UYPR777jXUJVJMImEBj8grcvqVtNSLfGEvZ+DCPvbKOKyerFGe84ZJ1JhkY2L46oiHB3nRUKB2OVURObUY4nlIpUXvQqzdVrTH4mJ9DGSB+DqOJ8tu57plkRoCSljEBLU8+UQ+8WEHwUSeAmeaFwegqGkbz02MZGGILTsBR8qpFihTA33oUGPOuc2+mDKwIaX6B5z/vJja8Nbts4qt7v1qWydeb1UZ61CPh3heQf6JgkHofGr4F+RMLbl+9kCXahTMP+sQNdLB1szH2iqOTL3PBsXezCOdgySkQT+KtINUVRw54jrQyhzYOVpJwsAvAqvPAcKSzCK+A1Rded5t9qaw+q+yn1VbEHA+hEnMv0+ZekA733sIwxLaz2s+ib4/lYWuksZ2eL5JU5ue1G5tmyHjnMHgyJhcaSmEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnFHY0JQWWYydEUrWUtBMkV2ZG12dEh5ck9CYUNreVF3THNBYWhJcTMwbTNV?=
 =?utf-8?B?U010ZnpXRHhHWGliVWRHQTF2bldqbjUvc2x1SjdkNGRRWUFRVmRpSmZKbStw?=
 =?utf-8?B?YzZlSVlrSTBVSk5TcERKTG93eFd0MzN2MzMxNlVhR280K3FqeUY1SFFuM3g3?=
 =?utf-8?B?RkFMdUdpRW5xUGs2aml5a1NqMEFETEIxWGZGa1lsUVAvdy9QdjJ6S2hlRXNX?=
 =?utf-8?B?S2xQNmRWbm1pOHBqcGdPUU02UExTQ1FZcGJDeC9RMktYUGZ5Y0g3elh5RDZB?=
 =?utf-8?B?d0czdWx6NEtPR0x4UkRBczZkeGU3ZWFTUEMyMGcrQTRJMVhlZkEvRXZTK3VI?=
 =?utf-8?B?cXQyL1QwUnB1aXFjQm1SVWV5K2VXVkxuSitnMHV3TEN1dWl1d0pOQ2lCOE1L?=
 =?utf-8?B?QmhEV1dMeXFvUldzckFSY3JoWStUSUpkVEU0ODEreHdaTVpwdzN0V2hibzlW?=
 =?utf-8?B?QjIrdHlDUkRpZDJraHdycWdjR2hGcW1VZmtrazhFQ0lLQm1jSlVTRXdyUzB4?=
 =?utf-8?B?b2l6azZ1NmltWVhNbDRJY0tJTzRVTHRBV1JzYVNETmFEeW4xVSszalZLQVdS?=
 =?utf-8?B?Y0FHOGs5MDNlVERsVkpZd21FK1NndURJODc0aTBhU1B0RkJCTVM1ZVlxNity?=
 =?utf-8?B?Q2FLYjVCZ3hHSi9CVHlJZXRSQUd6NUtjK3ZXZFhGR1JpMWZkaTNvM2orWjIy?=
 =?utf-8?B?QzdHbVY3V09UMGFsU21FckkxMTF6ZzhQbVoxYWg3ajg0QWpyTS9mMjY3aVpG?=
 =?utf-8?B?S01vM3lBTFcySDNETk43U1RTZ09XTzJMa3Bhb28vSFRweVN0TllHWmhlYVcr?=
 =?utf-8?B?S2xDNEhtRVBUOEU1cHVReVFYMG9jbkowaC9SMW45ekFmTFdXTzVnSXVCbjhy?=
 =?utf-8?B?RmF5QTNBbUdoeUNObGNBZnZtek1QMVFlOU1aMExhT2Z0Y3g2Z2hVOWRhK3Qy?=
 =?utf-8?B?dVJkbVBIZ3F0eTJuK1VQUTRNK05OeEJvR1oxMWJ2a05zNE1aWTN0b05BaWZj?=
 =?utf-8?B?azQyeEh3NncxMllvMThNZkFGbEV3dDJsZnRhem9ZZFp3SU1icTd5K3RxTHNI?=
 =?utf-8?B?L1c2TXlIYXFaWmxkcDN4c2ZTdDl1S1BEb2Y4ZG9PS1c5THFqMStXWnAreVRP?=
 =?utf-8?B?M3NTWEppSkFMQng2cUhTZFM2U2NJSWpxR0dNY2N2ZkVQbDhwcy9WZDRRa0Rq?=
 =?utf-8?B?SExwb21zR3VWQkxsQlhjbkM2VTRrRFM4YXI3bDMyZUVZWlBGT1d5djlBVEtt?=
 =?utf-8?B?dFhqQXBLZEtWTjc1RnVBYWoyWnZ5SUZSQk5JbmE5L1hPaEQ1L1pFNlBTM0Mz?=
 =?utf-8?B?bWRwcUhKZFREdE9jeGt1THRzSzdUZFQvUlNSWDgweUpNb2xSOVl2c05qZjJ2?=
 =?utf-8?B?a2gwdjA0SHNBN1Y0VjhiZnVpRS92UEhoY05UQXFHMFNkbVQvRUF2Sjd3L241?=
 =?utf-8?B?dzhReHVHT3VvLzJmSWR3ZC9TWGthNSs5SzUvVXJIMUlqVDBqYzBmLzJENUIz?=
 =?utf-8?B?VjZROTQ5THViQlNwS1NZa2sxaXhjK3plbXowaEFuNGxtUXMwSXAvVlNadkRp?=
 =?utf-8?B?a2Mrd3NwY3V2WFdHRDI3cFVzTStBd2dEcXh0NEI1dmVITXZXa2VuM1lZcXU2?=
 =?utf-8?B?RGZ5R2NveE5nRGlzSENkMC93Z1lrSG1ZaEJzK2MrU2lIUzVVa2dDMldjVlBw?=
 =?utf-8?B?b2FDOFIxaVJBYmlpNDZnbkNLZlMxNFNpb2w0VUFRV0w3Z0FnL1UxbFlXdUMv?=
 =?utf-8?B?WE1udkRBSFcyQkFwVG5OdDJsOWJURjlZRDliamsvcVhCejErdTlYODd5NHVE?=
 =?utf-8?B?NFYxVzdhT2hDY3dCd3JZeXVEMXJDbUhlM0loKy90cXoxZVRGVXM3YTMzOVM2?=
 =?utf-8?B?NEFzZUVjT1Zzei8zcUcrdkh3Q1hzaEZXc0pHMEdkNm1USHBuVTliV3EvdjdH?=
 =?utf-8?B?emdCZU9iUHFFS1JEb09MbGlPVzE2a2FNTEptVjJlR2JOeklzL2RoK3hiZmFv?=
 =?utf-8?B?MXZJQ2tYQW9WUVhDcVJqeGRjT0tzOGwvTnNtZHB1aTRpS01YUWFDWERWempL?=
 =?utf-8?B?MXBoRWh6alFScUp1Y0F5T0ZESTZUYVZVOEQveEF3UklXZngvZlMxcFJEdXRl?=
 =?utf-8?B?cVQ0emh0TVd4WkxYNU0wcXpaVVA2YlBZaHh3cTVLZ3pTYy8vby9ML1lHV2JC?=
 =?utf-8?B?TDhTMWhCN2xXTUhzR3BPMVNldHlPa0Q3cElHaFNpRnVKcUpkNmxoTDdNak1p?=
 =?utf-8?B?Y1pZRytHNC80aEpNSzR5SmhJdkRVZ3Y1NkRFVnUzMnpabFlJNHNPczh5VU41?=
 =?utf-8?B?RkE5OWRlaXRyQ0htclVQMWxQSzd6bmhqTndyYUxWSXVsa2F5RXBvZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65d2a2b-1735-45bc-de8e-08dea52ab6b5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:33:20.8506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QKi5GUg5vcO33rNNgJluGHceb34+PipyH7II2bWhfQyoCvpCu84PgvHXBRL6oE1ia1ixtDIE5xVxigk6Va6kPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11568

On 4/28/26 12:08, Jiafei Pan wrote:
> [You don't often get email from jiafei.pan@nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> As currently there are maybe multiple remote processors, so change from
> using fixed name to using device node name as remote processor name in
> order to make them can be distinguished by through of name in sys
> filesystem.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index e8d239bef5c9..17026e390e88 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1357,7 +1357,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>         int ret;
> 
>         /* set some other name then imx */

I think you can also remove the comment above.

> -       rproc = devm_rproc_alloc(dev, "imx-rproc", &imx_rproc_ops,
> +       rproc = devm_rproc_alloc(dev, np->name, &imx_rproc_ops,
>                                  NULL, sizeof(*priv));
>         if (!rproc)
>                 return -ENOMEM;
> --
> 2.43.0
> 
> 

