Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FD072634
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769678547; cv=fail; b=lKT+7I5o2o/PTPlRVSYjmA9PXrGfYUvZ/TQUwZXvcyPRy78AnpITTDyVSbdwkTVXK7fLE/Run0QQG+rsK1cMSbtSuJg21HV3XEvDsRhUxAe+H+lQ3PeK3HgehYReZlYcE7Gl8maOnPvzWRScXrDvULIR9iN8zmeVSM+n0CpeL4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769678547; c=relaxed/simple;
	bh=LnU/TrIyIUDDr3XpouDDK6fAh0CSAn6IL0mGNxA0G/U=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a1LIcQFtkgdkCb4mZOt0B/Twca3Ixoa+inpm/xR8vHnPNydZjnZLsJPwkTEoRCB4JvibJw8tbvX/6dGI86C/T5E1/HhyLqcleSpyrgfMwACpsb9JQcKEe/a+HfxeJK4UNBPaC1nx6VPp9ldiKCk8imTdPifiY7bCu7lWHIa7f5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sMkVUSxh; arc=fail smtp.client-ip=52.101.66.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sMkVUSxh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHhya4ny5jxiQEaUwMoeDu0MgDOKkjdCY7I+xvudJKpxt8IzZP9wWPaQmjlia+Uqe2bJj5dwbVH/iWxJJYwTLFKOibpZ8AruR+2t67hkoa7wEGJNz3sZPHmXNGdSEGTzafgBUNMWzOHfRzPWLKp6E8DBZ7PnOx1rV6CAhDJvpVPS+evRBwwlJFv55EgyrYdTu1M7r3XvxEgCXYNmbbyl86LfZzSTEZnC8QASL7XwW1/e9d1qUu/Iu4pVUYbcUPeGLdLKkForlU+Tt6rEtroiWbIkazY+wMj0MXgWzpIH/tjIKa9dA+bq+KwZdXQLDbajwCUiAVUvjWbcOOQ2bo/z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnU/TrIyIUDDr3XpouDDK6fAh0CSAn6IL0mGNxA0G/U=;
 b=GwkyBYsNNSMQl2/OSMP0WRuvO3Iwo8jtlgFAalKPHAsX+dqaUrxziE9GDawZ5wnHESJcVq0+A2MfUiUtNWcglmzdgMbbSK6J/Jh9aYpx77B1ooL5vlQT+vMrn+9Y3KLTmQKXMr4RJnRVKmc3y9dO7febiRGc55NUwYa0n1OsxkpJCnK59+9a7iJtOOreSQbgQMSGUx9T27DBt7aiUjS/3QuOn/bhTc8MH/pCFATX/GDRIAfVfvysQrbEaaMFKu2l2/4gUZEKBq/zRJvAvCxFAUJyu0iuUASW7VhPHdyZMMcuSudR70U+vvtOa/2/ilr+8WvYXB+FIV6dGxYEVSSbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnU/TrIyIUDDr3XpouDDK6fAh0CSAn6IL0mGNxA0G/U=;
 b=sMkVUSxhb+wBxZRDepau8o9hzqHzp7WKB/ou1iPM14ueBKm5S8Zn1J95Yp0LmBsvn3GoD/yNzRYaYXFV3hE6gfrqrP5NYJk8qqt1xwYibm7ZaV+G+NQ++qocMd7qo2vgWrh6dcKlyT7E0glFwnXqAwEf5if7X/qPM05ypzzl/p9uLyLfmF0WeDibSSazF6FZXlYMEbmFrwnGsrlgtED2FNHV085xhe/pK5MLXkgOMg5NB2rGU3Ici4QR6wObZI45eA1/0ZDysJ3bqeRTM2Bi2I+ZWaUERD/Vv2/2DNG4XLa0+77gk6+V1GVGTj73jynkT9zb0CzljTxqi7zQ2Nt3hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DB9PR04MB11559.eurprd04.prod.outlook.com (2603:10a6:10:605::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 09:22:23 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 09:22:23 +0000
Message-ID: <7e34b098-bdab-448e-a34a-02bdc643f700@oss.nxp.com>
Date: Thu, 29 Jan 2026 11:25:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: fsl_asrc_dma: allocate memory from dma device
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
References: <20260128071853.2602784-1-shengjiu.wang@nxp.com>
 <20260128071853.2602784-4-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260128071853.2602784-4-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR10CA0044.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::24) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DB9PR04MB11559:EE_
X-MS-Office365-Filtering-Correlation-Id: ee97b473-5b63-4fd0-0a79-08de5f17e933
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|19092799006|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ym5GSkRoamhoeTlvSFRXdXovNndDZE50b0o4VTRpQW5DT0s5dmNXZW5HM1Zt?=
 =?utf-8?B?c3ZaR0pWWGdpcnNVbTRQeDFNTjlQbE5wUGJiZThXa0VKU2xGRllFVXVoNmxN?=
 =?utf-8?B?d0wwSk5FSzlNSDdBaTZkWWd6NElYVWRtbTFVcnNFRVlPNWZrUit5RHE3NjYv?=
 =?utf-8?B?MEo4YVQyeVBPYnlCcjlONXBaWUZUNXJ5YkN5bHZ3ZjNZWkNxT1RROWVpakxG?=
 =?utf-8?B?VXN0alNuTlJWSEdZc21KSjA1ZHNhRDE0TitvempuQ1Zmb3RDanBHWUZKaE9F?=
 =?utf-8?B?SjMvQmpBOWluci8wZUpiK2w2MUdpUWJ5Mncvd1Z6Wk5IYzZ4UWJPMWx5ZlVN?=
 =?utf-8?B?WFJFNmxHMERwTFNXSCtYcXU0dUVkcENGSnQ1aGpvNTNNZW9QTkd6NXAzMVlU?=
 =?utf-8?B?QjlNNm84MGp4bGVRT0JlUXZyang4NTk3TElTOTFnNVNKQ3hOU0ErNFF2Z084?=
 =?utf-8?B?UzEyNVZjV2JCVUwybEVQRmY2ZnVkUm5xVU90bXlabDhvWCsrY29laE5VeFE3?=
 =?utf-8?B?VGFMdE9aVGRsRGdodUk3RTJGTVphbVh3MHdVQ2p4cHNUeHVrQVRCNE8zZ3dZ?=
 =?utf-8?B?RUo1RXoxeWJheFhmdFZEbnIwWkJ5SGMyYlUvbnRUZHVjdndTcm5TSVg0Z3cy?=
 =?utf-8?B?U0FMRy9IN2Z4alYzVnNYaHB3UlArZmN6dEgvTWsyeEdmeEwwRjZ2dWJkb2lV?=
 =?utf-8?B?eEY4ZkV0YTlWa2lzTTNVaFUrRHp6U1FWT0pKWVo0RWEvR0oxci8ySy8yRFRq?=
 =?utf-8?B?bTdET0J4K3JVREg3ZU1pVG9uWDlxVDhpS1hHbElYNlhuU2pHZi9BWVNkUERr?=
 =?utf-8?B?VW1pd1Vuc1VZTVVZaGo5N3pvcVRVWFlUN09sNy9ZcUs0QUpXdUNzb1dJOUM1?=
 =?utf-8?B?NWI3SlBrUEdHN1E0SmdMb1NGWmZjazhZbC8rK1BHSzNDczhuNzZ0b2ROMUc4?=
 =?utf-8?B?SmJPRElxbUlWVUZtaFhRODZFS2I0c3VNc21qUU9HWGhwTnZSZVhzaHluTkhO?=
 =?utf-8?B?Z284M3J4elY1LzRZNkl6ZmNMbE81dU82L1pVNGhkcHZUOTZiR1pIc05WdzNX?=
 =?utf-8?B?N3JXajM2RnUzcGtYb2R5NndHOEJTTXBvUnQxWEhmdk40MFpYTWE1Lzh2R0h6?=
 =?utf-8?B?N284amhrdC9CZlF2V0dHNjFmaG1xY01FZWVZMklNbXVWVU52WDVaUTVubFMy?=
 =?utf-8?B?VTFjTkRPZW8vQmNZRTF3MXNFNXVJb25CL2NyZXFaaTJpKzA3VjlSeUhIWVJv?=
 =?utf-8?B?Mm5CaHVJbVZSWjZyTENIekhySE9OT3EzOUUxSGVQUm1Xc2g3TFp4Y3VpMmY3?=
 =?utf-8?B?Skl2SDdjd2l2dnQvMTFNY3hXYTFva2N2RjhaWXIyc29WcTJGUUtJdVdxT2Jv?=
 =?utf-8?B?d0NHNFRwbWZkcHFNYUxUai8vVFhRT09ObXpDbzdFKy9LN0N4SUQ1azVUWFhz?=
 =?utf-8?B?OEdmN3d5K1V1K0szSHgxVVZ5U0c5Z2VVOUY1b3FIRGgra0txYXJrbEE1N09G?=
 =?utf-8?B?NFp2M2hTVUhOakJobHhzNVFtNHFRWXFmRXBRdTFyRDdha092aXdDaFRWb0l1?=
 =?utf-8?B?bnRxOTB6WUxPOFFXdzJ5UHhicHlEWjNmcDFEUDkzUVRPZVgxbFZSQVQrODg3?=
 =?utf-8?B?bFdVaS9MbFpxL1dUV0tFaG9DMmdPV1h5ZjFMZWZRbHVjbGswOU9FeWpiWXMz?=
 =?utf-8?B?alQ5WlVVNlRqcUdUbnQ5YXBkM3VHZ3FxTm42TkFid1oyeldLbmdEaktsVUVq?=
 =?utf-8?B?R3ZiQTMreUk1bEFGV1hMdzJ1U1FBb1VUMzNrWmJ3c1R0MU52RTJuV0RCZWNE?=
 =?utf-8?B?ZWpUSDYrMlVtOVIwSHRjdUc1N0ZxUytLclAwL0pHby9WSkMxSmw5QjMwT2Qr?=
 =?utf-8?B?MWh1dTV3RXBOV3c2eXphbEFVTVRJbDlwenhvTExmdHEvM21YTjdHV3RBbDRx?=
 =?utf-8?B?dHhCWC9UMEtMaU1Tdlk4ZnJhdE8vNEQ1QUk5VjRYL2l6cGt5aDVnR2dyK0w5?=
 =?utf-8?B?TGZkMHNCOE44VUVuZG53NjhGekRFU3htOXdxZHQ0Nk1xRjJkRm1IelRNeTdI?=
 =?utf-8?B?ZVZpUWVZZktWdzEvei9yMGVpMHNWT0NhbkJMb0ZmZUxhcVFmSit6b2JCMDla?=
 =?utf-8?B?VXB2SENkblZWL2tmcUp6dXV5emZBdEwzaXBJYWJIWklyaXovNHFVYWVwd2R1?=
 =?utf-8?B?amc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk1IdU1kekxRam5FZ3cwZHh1TXBoU0pYVUJnejlkaDhmQkovWWJLL3ZlS1By?=
 =?utf-8?B?dkFnVG5hWEthVWZQZ0xnYzVoc1BEVzhqQTBXTVZ6VDE3aTRzMUNqZmcvYmZt?=
 =?utf-8?B?TGE4NHFRTXNJazZma3hYdFVRaWZGQzczczJUSDlTVG5QMzFocjFjRng3bnJJ?=
 =?utf-8?B?djhJL2t2dTM4Snl4TmVnNXN6TXMvVFJ0b2lXSmlJQ3pmWWd3clFJUGhzL20w?=
 =?utf-8?B?N3o0UVJOTU4vc3Uwc1Vick1rd1hFU3ZvU0NTQTh0YWlIbjVxSEJtaW0yU0RU?=
 =?utf-8?B?RUVDZjVlSU11WXErZzZLaHcyTEYvTk9VRE5hWGdyR0VOa3Q5TXF1VWMrdGRQ?=
 =?utf-8?B?elU2Zkd1R3BPM2NHTWM5R2VGNWtoMVRRUWp1MmRseUswTTYzandlUGJEQXIw?=
 =?utf-8?B?UnZxRlUrRkowdkFqTS81S2w2eXVQN1J2Sk1NOTlwdjNqV2ZNek5RWUx1UHpt?=
 =?utf-8?B?ak5JdkJ2RHdZQWdjV216c2Q4ck9DVkVuSFJDK2FFZ214OFRhalpydDkrSlVO?=
 =?utf-8?B?QkZ5aTlqNzZQK2hoUDNqcmxIakkvSFJUZ3V0bys0dUZyN0tYN0VvV0ljZjZL?=
 =?utf-8?B?ZmVYVGw2UHlsSFRVSUpiZ3M0aDh3QWpnKzQ4YU9kUXdYdWxZR0l6SUptaU92?=
 =?utf-8?B?Q28xT0ovdldieTBFQUVxOVd2Z3N6a1VEbXhoQmMrS3FUK29Ic3VaSnRZUlRh?=
 =?utf-8?B?ZllYZzVjdy9BYVdTUXpjcnNNcVZrSlRKakNaNFZ6RjlWSGJhVHFDeVZxc1hj?=
 =?utf-8?B?VHdJampsd0FCUEZ5ZHdqdTZoQVJabTZIbWxzdDVlaXBJVGZjWnhSeVVKZzhX?=
 =?utf-8?B?M2pKd2RnVEhQUVRlOXl4YzlRa2tMNUIwSk9JMDd2Yng1MS90dnRMWkw5UDZs?=
 =?utf-8?B?TVRqc2RDRXpySmgxMzlrL3k5dTFIVnQraEhVNGRyL2wwU1cvbldMRGhHT3Vz?=
 =?utf-8?B?S1dpSGFxc2wzVVNnWmZaZk9QZWN4MmdaSDhWWkkzMk92bG5waU1xd0gvSU5V?=
 =?utf-8?B?NDBpRlhjUUVHWndWb1J6WFdGU05QaGpUYkxFdXhoZ2VXYVErVm5HS256WVg4?=
 =?utf-8?B?R05QM3dBQlFJOTltbWZiTXFJRmNJOVc5OGFPVDhDR0dvMTRoaVlsN1Myd0dS?=
 =?utf-8?B?aHp5ZE9ibGhyc3laM1VlNThTOXkyS0dwS3hyNUMxWXNGeHhBbmZLWjh1YVRa?=
 =?utf-8?B?MUNwZDQ2ZXBKWmR5eC8zQjREMmJJZTRKVmFFWlo5YktXcHVkN3JjaXNRcDBS?=
 =?utf-8?B?OGU1WGd3VEVpMW9UYUhGamlmczJWL1RBeUtNZXA5d2FvSithaExiT2xvMDZu?=
 =?utf-8?B?MzhVUWpadDRsVHBTLzRKWWI3ZHJkeHd4dXQ5bnRIcU43cHE0TGNkZWNIT3JG?=
 =?utf-8?B?dFNWNkwvN3dQcURiMzJXekZXbUt2RUpLZzN6cnVjdFVrMFNGNktoTVZoVERw?=
 =?utf-8?B?eEVTd0JpWHRhbzFkNTBGREYzU1F1VGFXdXVKTjBjd2UwTUczd252TjkrVTJO?=
 =?utf-8?B?c01CNWdYR0c0SktvTU1MSytOeDRCZnduMzVpNHZtQ0l2U3ZIWXZEZGswRExh?=
 =?utf-8?B?YlRwQzZHOWhOYkpEamdSaUE4WWdJYzY0WGtrcnNPY2F1enFMWEhzZFRTUDFC?=
 =?utf-8?B?Y0FQMGVFWHN4N1hVdTlIUEFHeEk4ZzYwYVNGeEE0VkNkL2JtV05Pd3ZvcW9W?=
 =?utf-8?B?YS9TTFJ2dlJFOWsvUjlTYUI4TkFYNE1aYVoxV0FreSthU2ZFNW5rZk5NY3k5?=
 =?utf-8?B?WmFxZ0hyeW1ua0lGTm1BZnpESmtQN1FYdDJjZ281UUFSQkVDdzBkc202dE5J?=
 =?utf-8?B?Mnd6bEV6K0ZTajhnVmp1Zzc0d29nNFZoY25PSWE0ajJNYWY4TkxLNTlvdlNt?=
 =?utf-8?B?dmpMWjNDNitoREZJRDlTNnVoWVVGZVd6TGNBakhveDZuWVFrZkR0WTA5TFY5?=
 =?utf-8?B?dDRRUHBVK0lYUFQxaGlWSFFLUHROWXVoVWpzVU5yRkdjcjVUdWZ4S1l0VVlU?=
 =?utf-8?B?UWJ6d0M3YTBuK1FiM3VLR3VMMWl1YnM4Ly8rV3VCelRNQS9hNzhocUxiNkIw?=
 =?utf-8?B?b2FvVUt3S0pRVHFwWVZIL0txQlRCWEZ3T3VZTmpuWE40S3h1SGlFc2tobGJn?=
 =?utf-8?B?ZmpKTStYWmZQbDR2NFIreCsyTDlUcm5QOFRuanFUVEgwSy9YUUJwTlNOaVk5?=
 =?utf-8?B?ODJ3Nkk5Zm9uZGJFNU0xZFRMVTJYdUJZdUxPdmR6NXV2V0U3NCtQcjJhY2Za?=
 =?utf-8?B?Z0ltOS82di95Vkl3dStpTG8xeW83T3F0OW9FcldKYXIwc0tzOSs3T21ZS0ZB?=
 =?utf-8?B?bFNNeUcwcVk3dUZjbEx4c085UGMrZVlNYWVrRXIzSDE2dTRDemxTZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee97b473-5b63-4fd0-0a79-08de5f17e933
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 09:22:23.6036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyXihk3EJRcl8937PRCMlEiJNJEt0ht7DP/5l1gR9ARPmKEhSSG7TiEKLGGJf2qu0jPK1bcM0WvtSWxPI/KWTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11559

On 1/28/26 09:18, Shengjiu Wang wrote:
> As the dma device may support dma-coherent property on the i.MX952,
> allocate memory from dma device to make asrc driver to be compatible with
> such a case.


This commit message refers to imx952 but the change in the code apply to all supported platforms

So in not really clear what is the intention of it.

Also, it is not clear why do you allocate a pair only to free it at the end of the function.


