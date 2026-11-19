Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.159.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795081402;
	b=phqHd457R4l7JhCHikPya1HuPZ7GBPuqplXDbxPGPxOPNOEtBszlWsQ596Xp+BofetDt
	 kj+5shym8FTveIYzNYwdW8JGumWFha3YEl1retrvgjlq08Th3ZpqOF7a0ggcfJjeVZSxP
	 qRcyzZW6CxRZFSnYHULyUaJJiCCShh1B71biTR8tc8LmrvxV42RIhXefoLxnnrcDvei5x
	 NBpVprnfOVhIvuCuxDT9bdEqv6ikIfU30ifDbZsh86cFkBqFLw20cvTg22dCZjFiXUQMm
	 jbD8kNwELuikC0npMDyynTedICIJfiswpJWlmAx9CsAVGexr5G2mwVlMj33bQjdebBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081402;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ckyq7Y33ocFMq0n6yVe0+IIxiBlK1SRZPNplbFnQ1XU=;
	b=inaFvThzRbQM0dun8+VQ5wRUNM1qfPCrRSIp3XTNTK380PfrYu7qaCswnKKoPki9VWAx
	 KybwL+l40Zo2WJCFOh+0LHHk/R2psmRnss1jwoon/8o+LUIidbI17RPFlQf8+aS7Py6kX
	 Mo+ZelkGQ0utHtn49+/nJofwgkeUIHSAUOfnaAyJrXv54LwxAooYFre5UtGt28rldnPnA
	 JOWKSNfM7l3w6ZDfTaSazkI29eieqqQDYT5vC4UrL02Me/tZ22xOuyfOObIwySzNx8DS+
	 fchu6glyp/9PbPxg4ae69XUKwioCCygZwxMA5xPEcA5/qd1kqxoYWWZgrwd0vPeJeMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=fail reason="signature verification failed" header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BmuVYqGL;
	arc=fail smtp.remote-ip=40.107.159.2
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49331606A32F
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49331606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=BmuVYqGL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBUW/nr+pju8u/Zrqg3X/PaePCnfbqDeKPfdIMiN6kXSvMayLFG5lxWrAOOATA+pI5pe77fIAJQA6sxEfSs9RCUOZ/XnnixhEX+pfTk/HY1eXLFNaCHJi4P1kmSP3aA86SzzlDKCJck4J1aPpWFqWaXKTFh3iQO5nrB/r2h3ujnuXBdVKYlwI5KZNO8TmGXfjOqXBZc0hKXcNhZGSgDv2cIAh9owmvV8TxvfW0/KiRjy5HZDfQaOxMFybjkcRv9C5gBAJiCgicOdibV1W0mxNm8hv7f/Hiw0n0G+s1h43uRdgw5l5+9BwwvjmSuiF/fSLCin3gcGRhfFO/f5uivR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MR8GkeeHN2lZQbEy26ZCKJYVpIH1Kb1WPBeyz0itdXw=;
 b=yGI4KIiCjm/5R/0oRNSCFYmIltQe/JqLq1Qe5L6KDH8NCN1Z83U1KZbC2pocH0VK1qTQarYsnUzvz3Rl8DFmhXgLG/1zlnlku76qr0jdvf7jQKnL4IeYNztQTwv2cjLtlXqeU8SGuyJJrH3vCOXSKlvkv4ZWvp/eUld81CJejKTAmmTRzRzzry5ErnvabKYKJL2tPJqCwXGhvBHhNxr/bwSGfNX0LLCU6eJYNuWbsPvBQ87UIT2XnPe/Ht0sE9naQ9vp1Mw3Po9MKonHlhQ6WDFABFEtbd+yuYuVHQeVFyRN26kA9uUnNjF5gJFooy8WXrexRPdKOcMXS0LY9mIX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR8GkeeHN2lZQbEy26ZCKJYVpIH1Kb1WPBeyz0itdXw=;
 b=BmuVYqGL2LYKTXLiiFQjs1kmoIbC2S+OlgOD13SsCzupuT5shWLAaDEIsIK/mzqiO/arxTPpxyC8JMewNXuZBDXws9W7nrlDq/69090HTXC6ntZTe9a6ro/yNviQzuNvGLWkXQBktTShl55A7HF5MncgIfzYsuQdRpXw0A8LFiMTcq3gI1owp++8JzJ18jJPnmgTkFwUp3XAr8/kee93gUuUNWzfioKDCVpt4T8+273FXdmpgKlfvsuiFfLpElhOwN8PetfIcnx+k6AMhXr00LRlPTPIWzbiOfittwn7q0Bdynb7lUDIe18/OHLuc5/SAnidfcJqTjr/e7d4ECtv1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI2PR04MB10833.eurprd04.prod.outlook.com (2603:10a6:800:27a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:43:16 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:43:16 +0000
Date: Thu, 19 Nov 2026 11:43:12 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net 4/4] net: enetc: let core segment GSO skb when
 headers exceed TSO_HEADER_SIZE
Message-ID: <av7D_O1jzxnZvO_u@lxl00025.wbi.nxp.com>
References: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
 <20261118235055.1225115-5-vladimir.oltean@nxp.com>
 <CAL4WiipQ_=cN2+F0wFiMy8Ji-d2tfd6ZuBo3HCYiTEQ6RxF29g@mail.gmail.com>
 <av62HrrrRs8qwiHw@skbuf>
 <CAL4Wiiq29baq2c6X9YV6Vj8ymc4n6sTuvBUSHU5e=kPa2iFkKw@mail.gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL4Wiiq29baq2c6X9YV6Vj8ymc4n6sTuvBUSHU5e=kPa2iFkKw@mail.gmail.com>
X-ClientProxiedBy: AM8P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::33) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI2PR04MB10833:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bafe46-63cb-4aee-26ee-08df46218961
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|19092799006|366016|376014|18002099003|22082099003|11063799006|56012099006|261028144727099003|261022075727099003|4143699003|261022105027099003|261026140227099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Ao95d+3bjNUhkzWq2AHl7LQPs0rk2RO6eSfbykbmTc4qlbFUdMoQx8VUj/R/zZjmHJ6Oz5QZtLm3/geOgpmJEVOrF7TDbxacpbKGBmnG2XQ0G7eY+GQ+jwGfcSytn1iKyjnvA/Y4hvcvV6LIQrAIhszo9h+2jn8tqaVh5aUzIxs92sXA9QJCVkK/zcWKfCvathBSPqUirjq/Eg9YtMn8PcNmvP+Yp/A40MDSnaYR0PCcjGT2AfM9/LerwcTDKDBehcXvasmEWL7mW4iNTtrVLePmfRwbNCSJTRm9SoKxG7NpBE5jWGrpJWdB/xCtUdgNfjn0XdVSicgb40P//WLQOxplk+O99bhQcjsU3KGlrNEk5Khnh1uZPVuhzOdoshJFmhHUIy3EYAkkYU5rO0lgTphU5aJsddKFTG5SRhHamCkny6j37cRRU3MOgDYdqL0DrOARxv6/1HHX8+uH97DFeHC94Xd1JFkGVZx1L/T4/QbdbFHjguKVlBJZbRihaFpw91VrUnuXhix+Hids248hGQ3b4PIIzz4K3svp0e7LkwqHV5tOxXid/l/mFF0G0YQ2pxFgT5RY+PXffioMLzLXwKEknVZwsHPqtJYqcZ0u2wgdUsAsL3lV3FT4eVjpgjrABsegwML71yb3n7loJoyQiB8LBM+QWMSNfahlMRkRSbs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(19092799006)(366016)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(261028144727099003)(261022075727099003)(4143699003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?RvilB1ujVcXuJKIYBjfGYfg4jhJdGOCs5hAgGKOjWgTiR18NFP9R+PmJx5?=
 =?iso-8859-1?Q?ExkoKXN17plyBNrITiM7/Y4DB1069vhNrSnu3ouHvxtaLwHwiMtp4lStyt?=
 =?iso-8859-1?Q?u/F/zQ5CDCu0Uz5NaNisQepDNSGXDPuk4LlBb+IGBZJcNlcjY8GZstpau+?=
 =?iso-8859-1?Q?j5/E47EFZFubJUhK1rulw+1NojSdv9ZExb9T1mERqPgf/UaZm7jaC3JIC1?=
 =?iso-8859-1?Q?roNMQinm+Mzcf6cpS3RU+Bn1TEEdwkmJ04CLOuEeYc9Qw+EmAH0QYl1cak?=
 =?iso-8859-1?Q?y5cwg1VTOyi7VZorOD4fJMFdttrqVI9pFJZ8RoGAPeRNjd9BIj7+ZrDVtX?=
 =?iso-8859-1?Q?H8jCYfnyXZbPual3rvsrtfM0XP7IedUi+EJNrCkvtyuYdrJNW/wqPaxhRC?=
 =?iso-8859-1?Q?bLgQ/GpY2W29QjOLzAVN7AnAf0irPFeArlt3vYjaeagVKcUJ0CIyaotO27?=
 =?iso-8859-1?Q?XIuZP9IG4zo2I0a6zbDdpwPfYMsdZWMJL2PFbIUTW4/dKmXXZnZj9dkBfc?=
 =?iso-8859-1?Q?YbpW+9w/kXA6rnfmU6f4kbQbvHTIX2Lc1z8jgrwzgx1Nj+FXntCGp0L+aH?=
 =?iso-8859-1?Q?Rf7KbCjg8BqCJzZxxLPvRSKvB81L5PAVf0BQ6iqMxdRZOwCi3H0dWV8cI9?=
 =?iso-8859-1?Q?QfWZbzIkKUdsVtmlO2PQt8Zkhx5lwlABs/A9AvEwcI/ez+0dlqCMG+8oNW?=
 =?iso-8859-1?Q?ICSvO1Z1BeRYXKyVC8kqVFT3Z1pEv8unexXBqHvBq0tY6GlrPNvGwX96bi?=
 =?iso-8859-1?Q?8SX+iWeF0Icx6rnUuCtfmftCJOEa3g4gWjebc8NdbiOyEPwgYRWEMqKN0v?=
 =?iso-8859-1?Q?rX13Uufd/IFn7B9hX8fCMCqIPaZoZzyWTHlVzrqUMKWHLknUaQ4/DcdVV8?=
 =?iso-8859-1?Q?DsxuxJr8zpiPzZbE+3bcRmxu9APcqQSu8fjb/fpo+3sehPSbp45BNxtEed?=
 =?iso-8859-1?Q?F+gU/D3brGtgkP4uOe5NHIS++pMADb4wAiLli1lpDaXa22xpkgNtbCXbmN?=
 =?iso-8859-1?Q?hXum53SMqg9QMuwx+zfBXwwJp0UVb4usQtGrOzPkJ17fqHL+fQXpUZX8T1?=
 =?iso-8859-1?Q?zoT82jBoE+XQe+bEa1Lw8W5GDT/Que0Jc9Gg2cbEF8GZzSePyTMaPcd/x5?=
 =?iso-8859-1?Q?/ojYDS74cSWEi0BFlbKcmQSdW0QAV5kRVD3wsnUYyG16DbvbrgEExT2Mcd?=
 =?iso-8859-1?Q?85H4TKp6b6XF1LsDMcstp7bwSmxALcgWyG9REG+HoPZxG9E1dQ0w9s7oxw?=
 =?iso-8859-1?Q?iIVSA/CUncG+FN2rPKHjLTp52LOPnChM2aAE6bnYIjPYD2ArWbNDMIQwJa?=
 =?iso-8859-1?Q?sR1aHTnVVfFE0pBIBxDMt0w4Nyl1iuPV4wb4Y1C4Fdz3Mj6NxdWmesR65J?=
 =?iso-8859-1?Q?ll6UUOtxtG1hDLUKokl1XT49BVRYjbiSVVh46RTYesNTzLcIcwdZj0Tniz?=
 =?iso-8859-1?Q?B2uENDSpwEgyJ0ma/3qLCknwHiapd2O/1+fEKH7c46ZX+/Nw7dr+vUt2MF?=
 =?iso-8859-1?Q?zfR4zY+MIzX1aUqEOR71TVWpHZHWEK1SJ4hNimkeqn6a6d7EWRSzm5XSdJ?=
 =?iso-8859-1?Q?NQl3kEicMMccrAXgGwaSYNtRNTvjuG6btn+AekXHP+BKzUBPY6tHtITmoV?=
 =?iso-8859-1?Q?PFq7/A9AkcfpXbls2VPkjvglPmA5ktZVFgYoCcgsETiLCe9GpRzhzqnDTV?=
 =?iso-8859-1?Q?9rA5a8aDV1VSCu9yTw1obYug4q/RSlw7gYBzb92TVx56zUXeOMxTopnqO7?=
 =?iso-8859-1?Q?pklyiIFasRNGU0DX3Gqwl/hxPBeB6f+io+JBWxMjQxyHRx6JN8tJ6A0ySc?=
 =?iso-8859-1?Q?owtQKS0RbSNJCdAxh5x2lxw6d1jAZHefT1U5H9A6ZGU2CKO0EaAuKaMsOJ?=
 =?iso-8859-1?Q?Bo?=
X-MS-Exchange-AntiSpam-MessageData-1: wVTAh5IP8rrjdA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bafe46-63cb-4aee-26ee-08df46218961
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:43:16.3979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUtVQlh6qLvc8pGh959TbKt1VtUMsSmLuvST4j72ODlKqbvPVwde6NepkGTjaQGlfhooERYtTQ0LCB6zP/GnSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10833

On Thu, Nov 19, 2026 at 10:38:14AM +0100, Eric Dumazet wrote:
> Le jeu. 19 nov. 2026 à 09:44, Vladimir Oltean
> <vladimir.oltean@nxp.com> a écrit :
> > Do you disagree with my analysis that only enetc risks corruption? I mean,
> > for a second layer of defense, having tso_features_check() everywhere
> > TSO_HEADER_SIZE is used probably makes sense, but I opted for a targeted
> > fix because I couldn't justify it for the other drivers.
> 
> I agree with your analysis, I could not find another driver where
> headers can exceed TSO_HEADER_SIZE today. Your targeted fix is fine
> for net.
> 
> The other drivers are only safe as a side effect of the
> NETIF_F_IPV6_CSUM rule in gso_features_check(), and none of them
> bounds the header length in an ndo_features_check(). I might respin
> the tso_features_check() series for net-next as a second layer
> (calling vlan_features_check() this time), and enetc can be
> converted on top.
> 
> Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Sounds good to me, and I mean, I do agree that TSO_HEADER_SIZE not being
enforced as a maximum offloadable size in the core is definitely a trap
that should be addressed. But at the same time, I do have tens of other
'net' patches queued up waiting for this to go in in a minimal form, so
I also appreciate not waiting for tso_features_check() :)

Thanks for the review!
