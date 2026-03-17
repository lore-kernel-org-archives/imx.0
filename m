Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2BE3C1413
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752809; cv=fail; b=nkfzqeZsUG9P2VwizDEN2mfS1MoXZHGUVvBvvfWYeUOPpAkTVw8F0fadUjyctHijN85KDxzzqZ37opayzZT4kkG/Reo8KLUGQDS6yX9pejN6SghWhlyBbMPJaerHPDYlTj0d04b02scuVQciP0htNBJbNY4x/RjuSU0nTl2zajM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752809; c=relaxed/simple;
	bh=WGGZSm4MB4Zii0kBZq3wDFCs0A0Zfb04GsdK9lKUgeM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t2ZwBfRjeTnYQf15PKhZwzoGUJKV9WyP4ZupMQB5qwykRbKhO3qm+iEj3VngX++cuSTaF5xHgA/ZsP0SV30NO9BpTuclzogc2C5oRbEcTRbmM8EIQlQ4hTPSeyJgeIoKbzQB1Gh5XqxQQBT7g0F4myuVyCGUW5SvwyvoTS4gljg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=d4tKoGRJ; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="d4tKoGRJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UC4zHyaMIg99vRtFd9EGF1lG9PK5Z4HHkUCX0AcNRA5TRpictJkFQhGG5dPmzgYuLthgDe2/OHmBeE3oI3Iuh5Ge1q8caDe1sMbzAZf+R47f+ECDndLsDH79u8rPXcUZ8otlcrnul17HqIBlurEV36xnaMYOuaMST9mhBJIitMw6XDJQbnKYF5IpC3sYbCRmaLOOpz9Y+1kGxkuukaCjims0ET9WxJkHz/7vre5OVXQtOiXSa4yNmViF8Ej06FGEWB5X5VCWy6GpxuOvRVKVR5WqblcevofPzqDEXE2AQeLf8NFvjJKAHgEmLKNMvE/j5HVmUgZvDQAyE5RYmnKwUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGGZSm4MB4Zii0kBZq3wDFCs0A0Zfb04GsdK9lKUgeM=;
 b=iID8jfiWAFnbCAFb3R2lizAOfEPV6thICB+QxhXpmwpf5rLFN7JDKBdn3sAjBSeAjgkd1byQMIk+jGuOOw7n/Pf1lLPChPoshm4hxt0mT4vEmD46iqIG28BKB3BP4w/Cf6oEXkEjCAgN4hzb3zdr0zsbQ2xR513ARQ4QR+S6X56Qc7mwzgaeh+hx+46XdzMA6+kLnkfe4kgthh7L/2JGlwWqJNOuzO/I19ZjcsMbT59xYyWOFh7avVYxM+fNp0vSsOCdHwJ8Yc2C8zgL7iCMpfjrDPqjB36z0o5pIPLBnU00Exud60e1wU1c623CAVrCgSj7+jC9wxieQeKK/4RKJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGGZSm4MB4Zii0kBZq3wDFCs0A0Zfb04GsdK9lKUgeM=;
 b=d4tKoGRJpJDbAqWmYMelghI3jTSGfvzTzyMCtH9Sql9zCiGD1tZOG6NpHxUyDtJMz5UQ+Kp3YgsP55JjXXuL12xfXHvVACQHytBghj9fg8/jhJuG5ubISvwxnbegULD6egr4qThSG/+PH7BY8ZaqThC2W/qqqLH7+RCMOJ0drYeOitu0jlX/xnS3B6lPSX7EfOwm5J5FE+vhzOvIfjKCI8EgRRY/Ocpm/jHE4WqReWZvveQBcZkGPsLfv9fzwGQE736DtRCNPbAdkOQ+Suysp8GsE1qZjAZUPafwLjqnNfOmjJSPoNHemEWRNTABQaH/IsDv6C3Ely99VW9JJINiwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GVXPR04MB11541.eurprd04.prod.outlook.com (2603:10a6:150:2c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 13:06:20 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 13:06:33 +0000
Message-ID: <79135f84-68cd-4b82-b7d7-4dec364933fc@oss.nxp.com>
Date: Tue, 17 Mar 2026 15:09:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini:
 Add WLAN/BT overlay
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-4-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260317111704.1075938-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0049.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::27) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GVXPR04MB11541:EE_
X-MS-Office365-Filtering-Correlation-Id: 204b0359-93a7-4891-0b33-08de84260390
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rMgQ53hz99tz4a3xzdkYUiCUXmlfwGej5aEghKJs3tvzXl8v7Af7mSZQ3kbeHA74QyN3Ggjh2CpMW5Pe0pU7c1LfgYcIAChn1rlAYFDi0vOxuThHELkNRJX71DOh0f8AGOxDEGCZV/95+KRvqZKVcWS+zjIVmbUMrygTbkAkylXueqd2z85sY/J3nd+EMvQzzO3dnFxw9DimA0OI4aeAAiva8kjaVWWed5yNdPK25O/CMD4+/q7ERmOhIkD6JfP1cVvVOWlN1u5Y/VxD66oLNOmh+5TYwPW8Q7gsFqFnvjr9V77Yf6VLCAvd3yF70+dZ1ikhdAgzot42qmHTIffIOLIqVZqbUpehLmFWHkCowd7MVsJOsaj0wxvUozcrm+dsQVYRmNoxOkXaIbCTaIkWiCMbm/YXud0+k5guRgfsYzlakD5L4t72m+GNKkIBQxeyd0uoun3E2bnkhBRmcB0yXC+Qu1ZUiYz/0SFvIecfYTfPNwK4clzswvyNvQjWKMaeyKuKFzSs/8b6sp1zk+J9QKPOQJX45OSg4MGxaNxhslpPKdzrmhNAQAAQb3LnptYSls93nSXNMjoVVmDImcRHDDLksTdRRFBW69gdYEyvP7TNlO8zTY8VbtE5HAimoB1mlAuSwyg/A8D385CvVYO/wlpRMCFOv7YhTcm6vQ+R9YcANaPCK0IfExG2yu13u7EddSpydNauah04TgJElRgn6X6/LPbpZ/XsduYs+0VK/4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVlvQ01nejJud2pSd3FjN3N0dE9OenV1R3NlVFRObkZsSTlCMGNOWnNpKzVZ?=
 =?utf-8?B?ZnBEYmlZVDhsMlBNZ2ptaGlSejZQWksyNXMrKzVidE4rUnc0ejhQVVNsOXcz?=
 =?utf-8?B?UmN2cVdzL0c4OTlxMWhQc0c4MkU3T0NCV1M3ekI0OTlLT2VzY2lCWExmRTJs?=
 =?utf-8?B?dzNKTWFFcVp2ckRaQUZ2b0QvUEtUSElqdlRZU0tyOGRCNC8zekwwK1c1aHZo?=
 =?utf-8?B?OGRkTFdhQmJBL3QybEZsMXVQQUYwbWtCME1oU05rVjhHdjVJQlhIWlI0VHhW?=
 =?utf-8?B?cEhrS2NOK21FUVdFYjF0QnoyQncrRnhrRlNnMytGQ3FwTE0xSWN0enVQdCtR?=
 =?utf-8?B?U3RHSDBQUkxrUm9RUmZFZkFqbWxHenBvckRGcVRIZkZQUmpWUWdQTytzRkhZ?=
 =?utf-8?B?aGlYQWJFR0EreWxyckREbXV1ejhBaWE4dVNnOVhhSjVIaWs1Y1dVM2pHRTlJ?=
 =?utf-8?B?bU9IeTQwbXR4dE5jMjRDc1pNL1J0eUxxRHR4L1FQRGZMalBjZlJSbjNHRm5u?=
 =?utf-8?B?OFVXc1BKVkkzRTQreG5Rb0V3a2FRMitBclFLSFBsVnRISFRCaHJvVm1RVUNi?=
 =?utf-8?B?amN4QmxERjhNenplYXZMNXFvTE04ZUVvcEFMVnNpMGt1VWdhUXRTNDJsdnh5?=
 =?utf-8?B?YXNGSEc4M0FTQStPRDVpQlorZUJERUpwV290SloxVmkzOUxVMW1UQUhZL0Ra?=
 =?utf-8?B?N0VwQmk1ZnlaR01QOEQzK2tNTGlPQWJTNzh3QkJFVEhwQVBiQ2ltSXN0UytI?=
 =?utf-8?B?aXBvMWY4dy9MbE1uRUVEeEZJczRrYmxiblNONjI1alFuMmcrdmRhM0N3LzZC?=
 =?utf-8?B?T1B4TVN4ZXFPN2lReFhURGRwcng4OXRXMGRTbjdxTk5ONWpwbnBwRmowMHNU?=
 =?utf-8?B?QzFhY1pmMm0zZ2FwV3FUTlpUZFNBVVRaMWU1T2pjYlNGN2xxb05rbUNYS1BZ?=
 =?utf-8?B?TjYxbkFHeDZXY0pMWXpsRzR0WEs1TGlkeTNiQmJvYk9YT3VXOVhZWmY4eWNE?=
 =?utf-8?B?U3VPQ2lJM0JCSno5N0VGaGE5bmsvODhqcTk0ZEhSQWlZVTAxYitTeVJ2L2h6?=
 =?utf-8?B?OWJDZ3BSWUJiTyswaEJTUWFmendTSkJMelhoT3UzTU04ZTF0Nm1rY0dtSTdM?=
 =?utf-8?B?RTBHQi9XSWlkV0hrWGczYTBRV1phcHM5L2dibWIxN2hlUGZDODRkWTJjdG45?=
 =?utf-8?B?bktsdlN4ci9Vb0VNUkN1SXVQRXdOeVpodjZKT0dXQ2hTNm1rQ1hXNmxsQ0lh?=
 =?utf-8?B?aHI4ZGxtNURTVmFYZElTeGtkSUFXMmY4ZDJGZWprVVRBTkNiV3RCcWcvU09N?=
 =?utf-8?B?eUhnV2RJT2QxV2FNU0RNUjRsTzhCcW1NUU5YRWtsSXpwSkZ4dGJ5TVNzM3FV?=
 =?utf-8?B?ZGNXNWFXVUxMQkFNRHd3bnlCc1lnT2N2dUpOSGg5clhHSy96L2Z4U3ZXOFpo?=
 =?utf-8?B?Yk9GWUpyOVMxaDI4YXB6aVRlb0t2TGpnaUJSZ1B6Z2Vsc3NwNThKZlhDNkRT?=
 =?utf-8?B?SUwxMGhGM29JNjZrSUN1TTF0RlNiMDNQSTlIdkdzYXpvUktKRE5saTVMVmtU?=
 =?utf-8?B?ejNvbnFxTjlxK3ZpdTNDUVRrNzRiMzE1YVUxQzEwWTlCZVJJUVhZZ3lKcFlL?=
 =?utf-8?B?dm1VbzhKVms4NlpVMzdlaG8yTnNkU1VOcmpVYkgyeU1PYjlMM25WWUlKVW1I?=
 =?utf-8?B?S2w2NFJ4cTdEWVdhTFA4TzYyb0E5S3ZZZW5Wb1o0d1g2elpmcEl5WVlzaDVF?=
 =?utf-8?B?aDNlOElnMDJ0ZnU5dVpvU09oZzhtSW40Zk9OSEZXQWNmYzJjZWRxVmxMazlq?=
 =?utf-8?B?RmtZZ1g3dE8yUHBTWDVCQkczRytKMmlEeldpcnY1b1Exa1R6WUE3NkxMSWdC?=
 =?utf-8?B?cFBreTVMY3kyMFV0WDJNRXpMSFZDb1NPanNJQUs2ZUZVNkU2TjY5WE9pNHZl?=
 =?utf-8?B?NVM4L2JQYmxDcVRUVlVWV0tiZ3BvbXNYMm9MYmhkY29tamkyZjNaa2JrQk82?=
 =?utf-8?B?U2V3SlNaelJmdXRCODZZSmRrT2t5dldDcU1nMW5paXdsQnFVOTlzRzc1WU5T?=
 =?utf-8?B?c1c3Qm92RVJUeUhHR2NSVU9qbVlYSXJpWWkrSW15SXp4aDBrOWtoY0JFU1VC?=
 =?utf-8?B?Y01VV254WEY3c3NST2VURFBXZEo2MzI1M25waGV6RTdDd3VaSndyMkU3aXM3?=
 =?utf-8?B?SDBjMmFXYW9mZ2J3SXUwUk9TNmpYMDNvdTBkZHZDRmhVUEtORDZxdXB4TGhY?=
 =?utf-8?B?bGRjUmluZVR1UXdQSG94RThSZ0d4MXBjWGYvRnpGcW9vWmd1eW1taVRvUEJH?=
 =?utf-8?B?dVFLTWd0L1lsZWlTaVJqSzFpblUvUVBON3pRWjN0bzdZL21hS1FLZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204b0359-93a7-4891-0b33-08de84260390
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:06:33.8068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3qcb5HuS5N4MrJmcb0ky+616D/O3NCssgU3u96q+VXAkEm3Dn/hZr+u9SF9PGoGAFK+x1GeFM4fyLFfnpdfHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11541

On 3/17/26 13:17, Alexander Stein wrote:
> From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
>
> This overlay enables the LWB5+ M.2 wlan module from ezurio.
>
> Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

I was expecting this patch to be in line with this comment:

/*
 * Display is not fixed, so compatible has to be added from
 * DT overlay
 */


