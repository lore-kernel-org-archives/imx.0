Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA4C3B3BEF
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 14:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635770; cv=fail; b=XQJgl1E5sg71m1NwXlkTdubnklzuAnZvsWGbtMYwTcQ1K04fVTPFSizRXcn66BZxR66zcffLyTxHvyzwfOawJu0u93bzgA2/WamDg92H3JgKTEonsxa6ynZeQrTcVd/TjdzzHh/oCD0S4tjox/4NM2tiYC/qZBL6cLCmoi018/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635770; c=relaxed/simple;
	bh=/1wcHu9ugwTqzN6duKItJOI8FYrri22A2CWES0VJH/o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hdAJ09FA3yg5WiA8tmREgIYN9dBQmk1ZeMFP/FA3pSuOjJIliDKkOurOIp8mD2xz4NS9D14v9jY4QJOV/4LSN3oxiCYjZhBe7T3P3/kOePKWXgGSaxnbE08kgxpTzE7rUXna9a2BUOEuKkiSFf5uI+d6G1axx2eB38p1IhyOBGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mE3/beZM; arc=fail smtp.client-ip=52.101.84.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mE3/beZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WCYSeCP6aWIERVGj3v8nooTG0fJ0nVgzCfRjYFCMjeX0HUMqwYO9k1FVcFxHKvwKD6F7TvPKn7hZ1WRa6Qp9Q0+eUf7qlr8fUXgjcC+2O1WIte1qIrCtvaxb6Xkdd4IaZ4EmaB1kg6IkdsI7JUxJj0qhs7yDQyOYtej/8G1QJBD2x+eO0uWlFV8btzDR3/8FSdCkRcoQ+VlCQtAVcZMdcQI2lOBmEcatzIrKeYiOIZK5KldTdMA3XR4vytjB41j1ET3ov2MoMW7XvPocq76k9bqOOvJnvLa0IEmOGhyPrBxMPsIUL7d5WoxUNSK3MX9Q0LvODlZjf9F4SZksEfsIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1wcHu9ugwTqzN6duKItJOI8FYrri22A2CWES0VJH/o=;
 b=CVZ/7r0NW4KmZp9dwYHp1kZ97kW7PieauZX0tbQ/iXeOldxFKh3KDThkSFaEAps+4felryUTprSZnB8zuF6hG3yqDIBOd6fvQrXRGFl+lPxx3it9UX6TSVclnAnMDFyjvvVPqDmt/9MSb+Er/zLC2aeitnFsJ+Toy3hmgW+kWQ9wW0Fkypv7hOTKT4H5QEJwLXvrUzkzg0GpDV/uBgL7/h6KsvM0mTcwji/iLQDutbVSzZG2d72G67d3Qp/ejyC32pzFjm+4v19mS6/IBvXUJBMzgrDkYKiDlwz4BOS0ZPOYrfOx2viS99A1uQd5EEt1tzZ67RpZHyyb5/pxDqxWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1wcHu9ugwTqzN6duKItJOI8FYrri22A2CWES0VJH/o=;
 b=mE3/beZMreTuuLczLBHOC2WrSmGOm8IDsAg7Hy5XUK3eMXUm70eE0UgYBwPh1sUNqgODB5aPZRpxPHxqPZemSaRS/SMEMqNSseFPhn8wxpS1tkkzhxCSHRjNebQZqDz0VzmBbA6JMW1QSxmwC5DZXn1amtTEMciV9yz7FLb2uAM2PRp1ZDwbsy1M6ZoWJ/BR4UZoIbobBmMAIOEdZZH3Ngj4XOu+sXF0CnB6woq+3V6oPC75whHcYDdY3LjkjO95bKYzYa0CSumvpGsvL7GzpgVHZcUbJPk1tssCDMnAsApn+tSCyxTXXLSjWlhIyk8CYHmtt+x5rm/oGhX4Lw3VBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA4PR04MB8029.eurprd04.prod.outlook.com (2603:10a6:102:c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 14:49:24 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 14:49:24 +0000
Message-ID: <84a985a4-490b-45d4-b591-96c8d9e5d0d6@oss.nxp.com>
Date: Wed, 4 Mar 2026 16:52:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] MAINTAINERS: Add i.MX team to all arm NXP
 platforms
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
References: <20260304144423.1511858-1-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260304144423.1511858-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0125.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::22) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA4PR04MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: cc580c8f-165f-43c3-d136-08de79fd3a00
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	7bF7ZT0eOMGuKzSWGMO1odET0EEVxhkSceDTNO5h5+JIBqkKFKAD23d+YoIO0I8IEh7v7cm82SvJTkvFBCWHTTaWMGgRqbbfvxTJf/z8kYyF9WDf+thpUDZq9ZlfDTtEYujSca24sRe/ASVMn5y56U5kYuPZMEFhOdcPlpsIfhBYaOmAkXkgyohuBArEQiOzvGbBTHFHXBCz4x3+YOIN7mTK+vo43C2gTrzosuWMl9oSZ0AJkJrF4BYTr9dOVk5erPVvXwvcxu1AM0itBwVwZRwLbDPt7QykNE1LPwsfsY99Me0kjDbTnbWnuo/CDg6QHPmBGrd6yYtvd55YO8nONZG2MGKpBBNY5MYNMroxZn7B8VX9rLpvkKb8fHyppkRAp6d0Ft8yz5GG/50y1BkFSJ8PS+ky8WjJjPEozLwdy1ZY4+peR4JwUyBlLH0QDz4vZNMGxNF1icydDsblshIgYWEpRrUUUbXsIrxJvkgUDQNEcajD6JXBI2WQ3jeX+pF9J9u+Dka46q7QYewN/BjsZ/B545E0osuFrd6Ngxb7A3b6osfWoghVrwtgePYZF2puZFoCL8uFd5pM88EuK72/mEHfWO9rGKr9T3hS+CmBMmhm9mu4R5Qmmilzlo9rHRCmknFHXE6G4HS9Cm3ClA88/5kqoR+WSfetV9Ya9XB1QBTIiTC6/qrf4FFNS89riwgf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGs3NGNwWmxVV1lRSEhXS0tKUDNIbW5JdTZ3dzZ6RkJaaHIyNUlUQ2tUQmNo?=
 =?utf-8?B?ei9kdG9XaWJrNnYzYmdRSkxuVGRRRmgvQ2xmdnhmWlYvUUdLcTJHS2dVTTJz?=
 =?utf-8?B?ZEFpUmJLVmwvVzZWZlc5SU9jOXpBdFgvZnhhT0Mwa3JKUVhQNTRvWHJxeEx6?=
 =?utf-8?B?L2Vja0M5SWJXbFNtcWFPcTBWRVRRMTJ4a2liUk1NMTFZNVUzMzdFeWJ6Q244?=
 =?utf-8?B?TUVJY1ZVeCtXb2U3QTEyMVRGNFRFdWlvcnZPY0k4cTU2NWs3WEJhNkdzWmlC?=
 =?utf-8?B?MU4vZEVySFg5NktZaGF3cFVlaXExNUsxKzZvUWZjQnNwOHJrVUordE1DSkFp?=
 =?utf-8?B?YmU4NWJIT3pqeUxwTmZubUZ5TDZxUjR0eWNIU3dpWVEzcjB1OE1PVFBwdnVa?=
 =?utf-8?B?MDlFcWlKb3AzamJ5UUpqVHh1NjdwaEIva2xTVjRaaUtxcy9xWFBiSEkzWVpK?=
 =?utf-8?B?RkU3WTlIN1BOa0MyMGptTE5GWDVGdTk1Y3ZhTUhjaHlnb2o2V3V4OUFHb0ZY?=
 =?utf-8?B?a3dFWVgrdzMvYlpDNlYvemVuVDc1Q1plYnd2Tit5SUIrdEZtWHhqVGhSc0pH?=
 =?utf-8?B?b0MrSkl5N0F1YmpFelJUaFpZUk1UNUpteFJLSUNFMktLL041enNoMzRXTS9v?=
 =?utf-8?B?TktlaEY0VGUydDJCYzZqcW5wZUFLNWthSFl4L2ZNQmxHOWgzcS9raGR0TmU4?=
 =?utf-8?B?c0FmeWMxTlNiUXhsU0VMUlBoV0FvUFZNODI3QVdMaFJSTjAvZVk5YnRVZDVr?=
 =?utf-8?B?VkxmeW9kYzBaU2pZbS9QZkxMZmFkOFpEU3paSTJxMk04bmFNZWJ3dmd5b1NN?=
 =?utf-8?B?MFY5MmUzUVdVVm5GeWp1b2R2VzlDbFNTRzBET1RsZjhRTkpDS0syN1ZtMVRq?=
 =?utf-8?B?cjIzRFI4cjk4eEt3L3FHczlTbldZZWc4R2hMY2lIOVZ2OTN4ZjdrUmRrWmZK?=
 =?utf-8?B?QllRSGRJQlZwaHVZSnNqY0Jqb2E0eEhsMWVMYWlHRHhDb0dGbE5OS055blBL?=
 =?utf-8?B?cnllaU5uRld3N0toUE1kY2pQdCtKLytoTnpjUEkzbjRtRG1MQVJwbjM5Sk5p?=
 =?utf-8?B?VnpPb3QxR3VrNFNRSW9pdHFZUTQ4eDlmbHhSSjYxSDVXR0dSZi9WYnVxRFhz?=
 =?utf-8?B?aHQ3WHRKNDdNRzkrQVZwVysvOXVwK2cxdkJ2SWNqY3c2anB2R0RtS3RZNEV6?=
 =?utf-8?B?Ulp1ZHkwNTU1MFZTMmU2eFVNY05wbE5vQjNTS3BQRExydTUraURKQTJaMXNx?=
 =?utf-8?B?S2hIcWJPOXpzQ3hBZFFWTnlUeHJOTXd2NXh2TWs1VFMzdVVjeUNuR0VZK2Zm?=
 =?utf-8?B?NU9tcjFQL2docFJsaUw5OGZ6ZDc0NUhIdElTK2xlL3dQSndKb1l2WUJ6VmVC?=
 =?utf-8?B?SVVuc1RINFkwUkNmQXBFQ1ZQdmI0bGUvQmUyMFQ0RndGNjcydk9VQ3VPcFdB?=
 =?utf-8?B?MGx6NlRhcWV0ZW5HeTB6T3BNOGpPS2dKbGxNbjRSV3h3OThyU25mNnRZbnJr?=
 =?utf-8?B?OFlwdGxqV01talQvVnFjMTY2UG05S3hCRTIxQXN5ZmZxWjFZOTE2VjU4THh3?=
 =?utf-8?B?YzlmVFRBeW1ZMUp5QUFZTWpmUHJVeDZVTzhaekpWcXY1NzdUaEN2aVMxaTVE?=
 =?utf-8?B?eWp5djBxQWJ4bVZ2ZUIxY3R6OGM1aEV2Y2lTY1BUOWs0dWJXRC9mbkpoM1VD?=
 =?utf-8?B?N3IvR05DT2NJbnNKODJyQnVmeDgzajlpaGt6VjdxUkpiU2QxNGQrNG9wTG5y?=
 =?utf-8?B?QUpOWDIwYTZIamFpMGNZUXdtWFBHcmljaS9CWjJya2puZXptZHJuRTJsNHJo?=
 =?utf-8?B?UU9HQld0bTVLY0tpRkI5YjZ4VmNaUVJtcEMwVmd5bHRGTEMxTXNPaUorSDhI?=
 =?utf-8?B?MDRhRUFqdTB0elVqMWxzQkJHUEg5WlJXUnVMTFByVzlsQ01RdFA4Snp3WWRv?=
 =?utf-8?B?OGc5VDNURkU1ZThUY3oyWUNpRnRKOWRRNGl5ajUzQUl3b2RyTTRyazJyK2hs?=
 =?utf-8?B?S0NlUHhLdFdsbkxjZThWQWpDK0JHM1BBWWk5NWhIL0dCVWRNU3lsT2xURm02?=
 =?utf-8?B?KzhpZzhLUUJ2QnVuWXVMUnJqMm9iS0c2ck5qY1FQQUFnRTZLRmR2QWQ5L3pn?=
 =?utf-8?B?VU15MVpCWGRQUDV2aWxsTklGMi9hS280U0NBRFN5NGpYMzBCR1lyLy96YmYx?=
 =?utf-8?B?RGFobGRRcWVEcjFsQXU4S2M0aU9tOW1IR2gyYXdKVmpoS0JGYUY1WHRXaVo5?=
 =?utf-8?B?OS8zQU9ucFBwQWs0VDY1cnYyeGZjVnhKSXJYTGdDU0NrUXFGNUp4S0Z3R0xC?=
 =?utf-8?B?Tmo4bWZKeGc0OW5tMjZNeVp1OVU1VjVKdUd3Ulc5Y1ZvcVRRUzljdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc580c8f-165f-43c3-d136-08de79fd3a00
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 14:49:24.2706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HhGme1yyn1asBxtoAsxy12UtqqGP7LgPXOJm/Sxhv5+Bwk3l+zwrcq9PPLno28KQh9Vid52y8rC+RzzV9qzWSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8029

On 3/4/26 16:44, Alexander Stein wrote:
> i.MX team maintains layerscape as well, so add the whole
> arch/arm/boot/dts/nxp directory as requested in [1].
>
> [1] https://lore.kernel.org/all/Z+Vs+pHZs2fMP%2Fp3@lizhi-Precision-Tower-5810/
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>


