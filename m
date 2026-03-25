Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3576D340A6F
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464190; cv=fail; b=gFbVDBXu+erkaWcFwodBpp0fBAQxDsM3/6w4lr4snQHtXoZ8+wJJpipjuelrxNTP3w4n0831fQEgKcF8bYGLMwg0qySPcQfiCIqfReaRIxyLFCkjFczYA0/NgoMdIXqqic717NCUDyrHb9DlK+ssf/1JYspklrOcAyxtGG2Ob6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464190; c=relaxed/simple;
	bh=ADpVX3U21twlWmZ/ouh14HjtE0UYrDFSiiIolZuoAqs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=Mqp+XlTyBkgf8d3s1hvdo7At7XMyebNnVy1s2YU6rmWNd56b8xVcf/mH6au+AeGMnyfXqFUJoEHFM5DCv6xKWGFnZlCaxWXRZmQ2uM09PT5A5h23R6Jy21ZW6feVwsqcmNwq9s9NDJO8R7CWJp59XYSzYy21l2HXm/SsJaVOJGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=glZyEZWS; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="glZyEZWS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZ09ILPFnGok6dQDqLFbkH2kuW4xnXK41MySxiurOS7ypYE1fCkgaKl2J0JqlhYaRHh+YdKj6a6htkp9TY54dnNvO/8uHhvfVgKZsW1Gnzdyr1Q+U4KgZaBNFMrx/Oiv1FBRslFHOkYfKqa/fBnGOSoQmJqE4eK2RqE5hOUAD5MGIRSk0KMXC7KuOaJOWvKSkjGuHZeFjbBlg0EkoZwsaTNuSCDQS8yeqsJhAICi5yIHLOsofpUaTz/oPQhpuj5mn8N8jFxzwQW0tYr0zWvU6IXRFvV94qvbhFtPiLpYEHjLL4N5t6H6Aghv+0mexi2XB4lMZ8BKmv3S9KZHcFdXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0NYiD2XEJL3KU2vBuZ8TNEqHXGtUHgW1tLSrjQmIcM=;
 b=FdNOmWWIKYe8s9j+JC0Tje/hDkogB52nLQOWlciVICzFcTD/ythEq6Q/ofSEyWnkA1mnxriOx0/FAypiChjf3tuCB8FqJXZRVueX5F0iNhjvQHjT2zYQqgx72Ge0e1HWQH5+lkGJkTKnTHRFKuzeXjTPpA7xXVeMmN9sqOizTxN6MCcGu2+9ceqr7KNwxwStXzj3cEgu/r5vtoEDmAXmkA+UAxv3b22Sf00cUasgDf0Yp8bAE1whrIbz3JNlwDK/vAH93CFWO/lRU4y+/wwU6K06yBX91Xo8YTDxFE9R5kKnRVjrcv2c3MD+kyT4Ad4ySVBzPucBztWMTNoSAy8bvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0NYiD2XEJL3KU2vBuZ8TNEqHXGtUHgW1tLSrjQmIcM=;
 b=glZyEZWS76lml1FeaoLho2iCPDVEom488PT+Itx+v/XSIRWOh824TKmWdaH01qxNp95v2Ga2VzYFT5anfkRSn/xVIwK2TegWs19XHu7uQDd/Zj5klNnPLTuDO9B1dg+DL3ZIgc7qJLz4Lk3RiD9qjjv4PICbnKYqChC/ztC6EU6oTEIB774sBp+cbEUA1HOyCBpSNV/mu8SyQwaLpaYHgkX/vF7DilVUTRiNSxasjQfWn5Br0c+3lPGP7EoJ9S4jv8oEQNaOEoEjTXLO5oKp9KbJ/AbU9yJhNIXVXGOZxwFiYSp3wzbkq+DvlJw3Tq/3w3ueZUd/xOGis9RFrmT5jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV1PR04MB9182.eurprd04.prod.outlook.com (2603:10a6:150:26::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 18:43:06 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 18:43:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324075842.815005-1-alexander.stein@ew.tq-group.com>
References: <20260324075842.815005-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-tqma8mpql: Add DT overlays to
 explicit list
Message-Id: <177446418348.3232155.4775721798897353166.b4-ty@nxp.com>
Date: Wed, 25 Mar 2026 14:43:03 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR03CA0375.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::20) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV1PR04MB9182:EE_
X-MS-Office365-Filtering-Correlation-Id: ff094755-623c-43dd-7b7a-08de8a9e5a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	J1MjHYfQJJt0jin1SdWE1526F6nluxvR85Dxup+4BzTON5FwZyi3de1gWIt5HDGRkpb+JSe3LBZRAnHGvLlCdJZSwr2Fa9T/fHTNFQU+64Z0tj3VRc3kG2XPzC/TpIQJ2Cx73BV0tlq/pA+49Kk7DFXixbl0MkFmX/BuSY+IH08Du4gK2xSFbdiZd7awJ8XN+kHGfh2HDBBrzvVn/KSlQc6q627HKngQ11L1e/MakBSDK2s7YU3MmNH6W1sWxwWSVxVA7JHfbw6HukmqEbd88xE3GmDPxutyVn6vHItRCWSke/UHFhxELEUq8zbQm2j5FUQg7bEEVKYBJSEYtXCVKzLghsGe9rIKDxwX9MEpuUbsR0AFPdukF8YSldSEu31cVkc+vAM/fx1E5Cdv89ueyU+7U95UBTm15+H6g9UIavb+pac7u3jswWbphIFv6LN+0OenJUAvjFNdDGCcVnlY19Nze/lUY5r/UtqA9RlxS00Zt4wrBljbUCQqQyQJSQWsmDGDPHCaTW4c70MynVqCtU55TWcqs1vijMNgpS3YTZW3VMBfHlD6xMgvHxACUDAWsw0K4Srki8N/XY0E5dAqyVUDGIOyLCmh4rMNoLiKh2mokLWnOJ4qz50WZaSpVU0edWv4XrZn0JC6CFf12MJxX28Ds/5uvoOei5w6XUvAlqgoEQo7GsfVcmCi61HbzCeXN/O5BReU8ScX8ZaFSQVj1HTFoakKR964SKW77eqO+F2TNa/apaMOaOOICMcc/fMwenObiFaHaNDV17GxT7TEbUQndTpFsMoIpiA2jgEukDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUtWaXJXUGNadWVHK2RaUzlFaFlpUWZlUTBBV0lrY0VkU202dW1XZlJIdDUy?=
 =?utf-8?B?amcyMTBXZlUyUXVnSHZocmtLYkVIaDRZMW1hUklJelZ6RU14aDIwMlM0YjBy?=
 =?utf-8?B?ZHlTOFp3ZUM0VERXTENDQWpXZHhzR1Y2N2ZZS0RiOUZ2L0RQS042Y293TXM4?=
 =?utf-8?B?YWl1MFV2Zk9WMTR6UEhpN2FwWFdlUktnYVc3WlhQRGVZRGJDUGZkTFZhMXlF?=
 =?utf-8?B?Y2d2U3YveXZPL1VkZzdBVDNLekx1R0hDYldnemc4UmU1ZzJXRmMrSExuMHdN?=
 =?utf-8?B?N3dHMmF0cUlpdzF3VUZTcGtmR1IwWisyZmJ3cDdYc25nRWhUSGkvSUc2akRM?=
 =?utf-8?B?Um1ONlFreUhORVdSei9TOWxhT0VaWjVrK2lXY25VNlBVcGhwNkMvQysvREIr?=
 =?utf-8?B?TURZTGYwZE1haWJycGRmMGFkNmZ0SDJjZXN0ZHRzVDh0Y3JRckhad3ppV1Vk?=
 =?utf-8?B?U2tLK1RFODJ0WUNlQXpubk9vRVkwbTh3b2UwZGVTelhLcW5sMGFkSHd6S0xF?=
 =?utf-8?B?TWlXZ0NHeWlZeVF4aCt1amR2eFIrcHp0V1kzNFNkdVVubUNMUlNnMDZFVTJD?=
 =?utf-8?B?T2JhUVZLZGYrVFU1aFZBdEJHMGFoMjROTjBRaFpnZEdpcndCTit0WTd6SXVh?=
 =?utf-8?B?VTVXVHI5WUdoSnpOL2NNOWtqZmN2cGE0cjRmSjFRaWF5bER2MTdXK0ZCNmdp?=
 =?utf-8?B?YWI3c2lYWGJDMWpxWVRKWnlGSGRWQThqZDNHZ1B1S3lRaGtuVEo3VnBraXRE?=
 =?utf-8?B?ZXkrdUllL0JqMTVBaU1yOXRsUUF0STAzN2Z2UStkUmR2c3BsSTlabGNZL3By?=
 =?utf-8?B?VUxvZW1RZnhLQ2ttNUpOTXo0M0Q0WGp6UFVSSDNZOVc5UUxTWCtGSWd2WjVP?=
 =?utf-8?B?N3YyQVJWcHZLWWwzZUxJWEE2Ti9VWGR2UTJWaFpnQTFxTzhZWXp6NmxLZWlC?=
 =?utf-8?B?aTNpcjUwdXFjck0rZU5wV3AvYy9NeURDOTMwd1c2ZC82RHNESzlhRzVpVXN2?=
 =?utf-8?B?a0lqbnNSbUxnZEk1RWJYRzlMQ28xNUM0a2tPVE5wVy9RYUhMN1Nua0FIaTVE?=
 =?utf-8?B?MTFCaFNaeVkyUmZWd3Njb0YvYUNmZjRZcUdUdWZCOXlrSENSbCtieDZoSENo?=
 =?utf-8?B?V0phbHpjalYrYWoxb2lZSTBWODl1RHZHbG55V1V5dU5vSFI3MVhXN3NoK0ZH?=
 =?utf-8?B?RDZJaWw5bmVRQ29uN2xxMXVNL3BWVHgvVS83TWpxR012TStCOFd3akNBaW93?=
 =?utf-8?B?R1pjQlBSS1dsZHJ4cFlhckI2ZVZqeHNOK0NGV1VJWHcxVFRyR0F3T2FDZ0g4?=
 =?utf-8?B?Sm4zVWtaNkNoVW41NzZJdE95ZnpMVStRVUpWKzhySzBqNjZWcTJuTDhMNTdo?=
 =?utf-8?B?VTZIOGMzeFlya0pYbGlCc1JYcmx5WUlPV3FYZi94NHJmTmMxUlEvODN1VlA4?=
 =?utf-8?B?eVZUcWZLMTNPazFtL2Q3M1VDZUZURStXUWc2Mmpyck5ZWnZDWmZQMkR0dldW?=
 =?utf-8?B?TmdqVGtRaVlVamFrNCtaTXl2bEpNU0wyL2dnVTVqeHhZTkhDcm5tMWgvL0U4?=
 =?utf-8?B?dGl1M01SajB4cHM5aUZSYWU0OTgzZGd0VGRCTHcrb055YnByc0NGVk40UE84?=
 =?utf-8?B?WHRCRFNQQ2N3cjBzMldEK1h0UFdhcVZnMS9rVDJYcWxlTE1hdk5iU05JSFJu?=
 =?utf-8?B?WEc0RUp5MHBXRzZJb3M3TkRxMjVnVFRQTFo5UTQ1QkxSV0QyWXhqOFRYUG5I?=
 =?utf-8?B?WURndmVkQzZPRjVQTmRURE9SckJqZ1hCYjBnQU5jOU1uand6YzNrK2J1ODVJ?=
 =?utf-8?B?aThiNks3czROOXRiN3RtWXNKcEpJZk1raEljK1hBMW45cy9ORFRqYVBxYlF0?=
 =?utf-8?B?QXBKdVh0bk85Y1g0bnk0VGV4dVZRZVZRRG5tcTc2SGw3T0g3Zis1b2ZFRDdq?=
 =?utf-8?B?STNBaHNKVTBiVDFVY2VkWUR2NVpMZ3MrZUlwYVF1M2t2RDJ3b2QvNW9tUFYy?=
 =?utf-8?B?SXBUTnc0eXI0ZnMrRkRLN0xINVhwKy91cms1T3ppVnNmRkNCMG5rcm9pcXdN?=
 =?utf-8?B?SDlNNUk4OUEzV0JMdTRBbzJqSndPci9uVVpMS2t2bWk1Ri9GSmpMd2ZEMFJo?=
 =?utf-8?B?RHRqcjF3KzRkZEVwVXhkWUt1LzBpREtxcDBVT3V4bFo4U3RzYjZGSkFjQVNP?=
 =?utf-8?B?YkdoN21LNzluQW1JZS9CMjhmL1I1bmNiUjBnVCsrODRwUDY0Q1BsOW5FU3lq?=
 =?utf-8?B?Vms2bHVqSFUrS3JWZ2ptUkZ1K1YrUFBlWXdCalYxU3JPM3hZMHJkSUp5Y1R3?=
 =?utf-8?Q?AtU8XH8VENdp6WTWy+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff094755-623c-43dd-7b7a-08de8a9e5a75
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 18:43:06.1631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ed/Ft7gtUFSb1KZXRNCwzIG1uf0XJ71gmZLrnMqx8HtiocFXHWwovnYIuxAieTFjTtiWirCucpdv6ZBQyRE7dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9182


On Tue, 24 Mar 2026 08:58:41 +0100, Alexander Stein wrote:
> Armbian installs DT overlays using dtbs_install. For it to work all
> the overlays have to be added to dtb-y explicitly.
> Add the overlays for platforms supported by Armbian.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx8mp-tqma8mpql: Add DT overlays to explicit list
      commit: 6cb68d84bc632865c89a22a4f956814df9b8d609

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

