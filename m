Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B962FF660
	for <imx@lists.linux.dev>; Thu,  4 Dec 2025 03:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764817384; cv=fail; b=PUtW3QZVsO0i4hgnDfxdGa/MDmTlYFg6fkExzufaPGZu8iQcts8CR88AzVtzpZhqH53w8fcUtr0+XEhoA5ZUWzPYKpLZL3nQpZoSkVa0iUcnhdqe7nPXhwzLPH04DF1/HJIpVtAMn6ZNW1lKdLrcxzD2mnO6la0lZS/YxIWesL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764817384; c=relaxed/simple;
	bh=15brEJcecsZuZ2sSnttU/FztZVqXELE15qzBex4bF5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dEjiB4/CiPiFekBhcd/biWmGn4iswSxNn1gFedh12Eal54lU5WUuMwbbbg6oFETkHfIOTI/jE5/pXFpjyK0claf7K8SZcTEoevXlXq44w/M/RpIZ1zgCvQfdXQU1PsvSRW02jjW5hkYvsNLCaLpDR8HD4ozpzigcFezAP/YVXHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wpUoOUJc; arc=fail smtp.client-ip=52.101.69.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wpUoOUJc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1v8bejIAOXd7WgWeY/96hx36g4lDMmC0vHqe6LkuB4dUuF31IsrErZnDOsIQSzbswj0QgcSFSr88A5wPYibYZGEOrScpHXClVLHlAyLYbcPduZxtzGtVEbEiWipaPWCXOsRvid+Wjs0v84dzuKd1indEes77X+AVuBK04J/Bmredue/r7EuKAycML0aM7CmXPVocKtpuZ4x5U4S+KHMMKMYsab35UL+29imqSM9AcTHALPrdw1iG24prHspFVsV69DQbbqasmU3P44hWqk9LXVpdHJ9TgulvlZwMcR2/0ksg+6nRHhmmLgcej1r8vayBwNWrUaWVX/BlPfo5Cxk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjJbsvz0t45yp+na4BrmWWd/lpmVgmMAneCKvxbdNUI=;
 b=uZv/o7mtqd/idrTax95EadFl6z4wK0vDWaba6EV+SNC3CVZRy0G0d9SzNWjJZYviZvOhwn6bHbCJlsDPa20q1lv4kE9XxhhnEryf1dVt0TJhxBjsHp1Zdg/yRjG24E0FVIek542ngFasuUDtuL0QbeabpmZw3g/32OKaYxwmyL6UcqqZpb7c1vSQHqxmEi6tJnEPMWdsGX41yVntslW7c5iGDrtPxiX1O5aaBN3MxisGH305XHfVSwcL1WpU8myIzsoi4YeElDHFVc0vN/q7y/EE6LtPdZOHxO7G6w2CgzAncuVqcQgdOeFz5s1XvLfF97UPyT8iCr5wNwpZ44qI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjJbsvz0t45yp+na4BrmWWd/lpmVgmMAneCKvxbdNUI=;
 b=wpUoOUJcGmVBRjT3vmwt9x6he4gf+T6QX6P7l7kJfnNAdKlAiuZ6cYZnm5wXj3dkiCUbUcQMDT75xWTLT1HS0DIyLlg9jidh0gzofoaXtRTiUuoCwd8MNTNRSwLrJq7oACyR3eKjvNZZjkQUhsqSxFT7o36L3WQOc9FmKwiF6A1edrbJQgDC1NU84bQdrWp+C8k/wdeX7pGBFRIfW48Mw6KmecD5fc3LX/1nOa1z4cV3sK3Gwexj22Ug33PacjMo7cEO/4riuDlevQOVEvpVOdHslu5AJLd7X2WoDpLzTjpagMalByvKW8YfrmVkxMHrVGEFETKcvxoAWbzcTEqYjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7214.eurprd04.prod.outlook.com (2603:10a6:800:1a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 03:02:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 03:02:55 +0000
Date: Thu, 4 Dec 2025 11:01:50 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@oss.nxp.com,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Message-ID: <aTD5np-HGaJqhzkD@oss.nxp.com>
References: <20251129143220.14834-1-marek.vasut@mailbox.org>
 <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
X-ClientProxiedBy: MA5P287CA0057.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b121390-10a1-436e-f7d7-08de32e19efa
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EavpigR6MmfSfMNbIV8ymUdePnhGOHZQ9B6w3O5SpCrdpaZccmezpdjozDnz?=
 =?us-ascii?Q?DXoPtPsT20/RYLLm7452Rd7DmKyFwflYgwFb9ojePDpCZ+ntsOSThMzZ3Vg1?=
 =?us-ascii?Q?uJh7nzwZ+6Rx9QGG+y38dVtvdUzemWUc+UpPwTRIBlR9UnNGgLfy7W1tyCIH?=
 =?us-ascii?Q?O9sA4ZBEbRY0Uwgt09CDMl7GBiIXxGwbMrg8J4yVOBKWx1+tt7IRsh4fULtQ?=
 =?us-ascii?Q?0vTSFMhD0fwc4T/geLQVz2aih4fhFVkRYXDAIN16YZS2R0Z9Wewyz2kR/iAq?=
 =?us-ascii?Q?/VhWabUNZqQaNfHqu+KgXnpMyNbwRXwYbdEf8PyP83jAUzEAJZtYSU4+d+uJ?=
 =?us-ascii?Q?sNW3vJAS8lXY/A3isO4MI9GbSQXhm1Weo3sHu5G+pwrV2h4mX/3kWUKeoLfs?=
 =?us-ascii?Q?9bOsv2CXuk04IW2fYfR7QIulMXxHvwLCOWT/ggqGhIEUYBcevJLCbgE8qOmQ?=
 =?us-ascii?Q?LOK9I3/JyLX1yLzHsDiNWXa4z5zCheGl/Pbb1bQf8AClT7WzFB1mvtERdfj1?=
 =?us-ascii?Q?ldoDInlncvIGMWz6blnHibJwjrCTnIqBYKc0JCu4BlY+Z/XyHQOc8jvi+4Zf?=
 =?us-ascii?Q?urb2qaKHelQjyoME7HCOPQ4VjMtIzZq607PQK9p2RgiBrCSBAgCvr1bfibZL?=
 =?us-ascii?Q?NvkZroImbfv8yzRaUxs9AtD0+VegwD1YIlifVc1CpJcj3ln7p2vVy7jWMzYb?=
 =?us-ascii?Q?Z9dNapNIt+P9xizwVYwfYDL1F8n4Ug9O7e5GjlN75bmCuSPVCCOzemXPIOnb?=
 =?us-ascii?Q?2DtkO6Ok5C0elM5nMuSRK0o67sRvo+5RKhfzrWcVjW7n+JykCTZb6rpPYXMH?=
 =?us-ascii?Q?mLFah5jshRlp1w0cm/NjJCn+PNVrMG6sv5Etn6YM/6XCzySRUmCK0dEVkPqG?=
 =?us-ascii?Q?725voKCsP9IGCxIA9Kj6JYIpty83o0r6bI5x2KPFZUDJDcmAfF0wThZycIKB?=
 =?us-ascii?Q?ye7oC8OEmHJxg6bIoW5RRt489SN9kneQUqLnWSIPlA4eIEcjLQ+ljCz9lCb6?=
 =?us-ascii?Q?vqBVG8xAtbQpW+JsseXksKRH11/vz3ritwi+eOGN8shv5LhFqjVOwcs1M+ox?=
 =?us-ascii?Q?g87QY09zYHUid2nMFFi0q5sPn6XBHxEiuQUrHtPjwr0Fnxb89n6WlutFGmeR?=
 =?us-ascii?Q?eJvmRNiflMsiVWdLKH5v8AHe1PxrYt+MBEL3OsVEZbPqcOU4YI7MV0WvlhmH?=
 =?us-ascii?Q?4HzuWrG6rlnSYw9Nn4POHfGyYBne0lnK9oRw6FHCltBhw9ZGIz0rEsZEvfll?=
 =?us-ascii?Q?+QXBWmYYScxyh4HZYmYGo8ZzY+vXN0d9BuJBBYeLSPloa18lx8V3rQ5f51V/?=
 =?us-ascii?Q?7jMQAgn9u8PxeeslAzgI6m9MsNxvReiDfJ/87HbNu/8askKGgOAr9AaAbj8z?=
 =?us-ascii?Q?qzrtRFHeiHuYVNMO6KdZRnwNm5YQC2nCMu5VHc1LIkj5xGpZFh0LcIZy+XMz?=
 =?us-ascii?Q?OM+GQwvnYzGcl5j44F9uWYo6IEY869CXuP64U0UWOHYT758zzFlWm+Mpy/ZA?=
 =?us-ascii?Q?IP7zzif/sCTD+/IO0aCbdYcte3hIhNg7DWeI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zhJPezp/t6wS9xX9OLnPPFjt4rZcaqIVgmkqzYRHMetw3PnITr+0AtZXOtAF?=
 =?us-ascii?Q?x6ZianB9tD0a0CEJkJ0kLZ3y4Qt/dpK15ZO4ehNL6TdTXBVAJoxt0AXyxkTl?=
 =?us-ascii?Q?QtuGIR7AEwly+xoTT5tnX1KhpnG/TiP98Tu0cAxQCwrGiVUwUZ64SPjklFUX?=
 =?us-ascii?Q?2/AtDlP/smb99kH2NIVc84wq8QR7aGYhqXsbqnXgoT5q1DVl/Hd8noV+dB6u?=
 =?us-ascii?Q?6gbb6eKVLdjKvyx7r9IZHcnr4wGiafvJ0KVyjjYWQhgblAqei3w/G7qTzTg9?=
 =?us-ascii?Q?pgBdoWT2g4PYARNinJ2XgaJ9JeJsZ8JAk8fhGCITyxxsCVrRQy7PAnVV976R?=
 =?us-ascii?Q?AujYi+snhlu6UXN5x2xTX6shgjc0OXU8096XHFKEa2wTb0qjjMCCKDmWdMGY?=
 =?us-ascii?Q?rA1Xm0f2Hp+riz9g6Ybom6U6KvcsFfdggexsiTUSMxeeKSTP8d9C6f5pyDUs?=
 =?us-ascii?Q?k3or9JGYHv3KP1FfFX7hSd+s7RBmV6SqwGfbDl4TfyHfCDt5NYV3mRSdp0pI?=
 =?us-ascii?Q?McmKoo7zJZQJqq7DwXav990fLKYkzM+BOC46tG9P8Hkv3T8WKQoCDA7YweGr?=
 =?us-ascii?Q?gyejdDZ0ubQk0EGq3xUvtJORO1gRbay2j7o213qNsQQ69/Eu4Y2S96Pb9L3p?=
 =?us-ascii?Q?yg4geyhHeWdLuQVdGxPWeAhGjx9t/g+zg5AxQnaG872AeHsDqh38oKRuarKG?=
 =?us-ascii?Q?fhoZUIxByjzSnuVlx/jzcsl15kkUYeNkAuNaB8qb1xtq25Ow6w4YraDIlvFz?=
 =?us-ascii?Q?x1s+a20U/Fntlw72yT1vr3eyTvmmeji/2MzjW8gQCY0Na+ti4+zwskZ2UzHC?=
 =?us-ascii?Q?m1+XT5dRGoabcBjHxkizCBbdJ4fsX7M5VIHj5DAhzjWWW7mQqXBtwEa7D2cr?=
 =?us-ascii?Q?kLvx8KqsfsJunmSsBGwzyLBROqnKLo0BcO3EzsWXKAZcoalNaq0GWekteR8S?=
 =?us-ascii?Q?r+MYG/nWMHLkLx/8ZGmsUS8FqTmUBiSPDyKycosB6qqqbPvEvWSk0s024R2p?=
 =?us-ascii?Q?ezsUAxqIHKJ6znu2CERMiiBGH0Aw9IjI3lcdo/h6FQ8AQJV06dZPYtVpITeu?=
 =?us-ascii?Q?RJHhkYQ/Y5YM/09i0J4oOkt+iGvVPTs3ekM3HBbcqFtDuMpJVCs39I9FJMjf?=
 =?us-ascii?Q?TxQ39GksvHxfk2Pwi41QF6/dgqoX4YEIt7OW2G2DgOTbtqoQBuEkQWq+TY1m?=
 =?us-ascii?Q?YwaFEAuTq9hS/6duFjvFPcg+7CwgBzv9IWUsxMJ09zNMaYOgzy1bKENUuk+h?=
 =?us-ascii?Q?HmohtjIKoZjRzxXLWJjqnHQA+bs/kNWOdIpy9khHqmXBGDVDkoLfpnWaQ2T9?=
 =?us-ascii?Q?Hq1Mm9LCDSyhhnU2sMbjdYCy3LxlbZjivA4AnUuqULqH2rBsdhAT8l2/rRr1?=
 =?us-ascii?Q?OUCZ+szTbQPXuRXr5bd8JAe8bmqkTb3CFH7GqjAb5pGHu/iDaFFlaeMBh0UE?=
 =?us-ascii?Q?Usjg1CrDu2N8QczFEghjtSlWykMI/3LKH0T0pm08h9388Ry9GQjU8xP2FN4j?=
 =?us-ascii?Q?A0kTjyZJav9uKfrjXB2T0w4DkpZL/cnzAF11Z5muJQo2/m8jnMLvcfBazRHb?=
 =?us-ascii?Q?gMs2oXAGA+VwaKSjRLxTMUuyyNdA5vgMJANaI78T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b121390-10a1-436e-f7d7-08de32e19efa
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 03:02:55.2416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T4UUmgeSIw9XgHFPLCfHjpmRdq9MEGg4noq4ZzTgo4QiU8i1i6xlWpydeaeN3u2W6X7l0m7MehnuhcVvApzbIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7214

On Wed, Dec 03, 2025 at 11:48:47PM +0100, Marek Vasut wrote:
>On 12/3/25 10:28 AM, Rain Yang wrote:
>
>Hello Rain,
>
>> > > Thanks for integrating this downstream patch.
>> > 
>> > Which downstream patch do you refer to ?
>> > 
>> > > Please note that CLK_GPUAPB and CLK_GPU are
>> > > always-on, so the commit message should be amended accordingly.
>> > 
>> > The GPU clock do not seem to be always-on, neither do the GPUAPB . It seems
>> > the SM can turn those clock off perfectly well.
>> > 
>> > > Additionally, the IMX95_CLK_GPUAPB handle shall be removed, as there is no valid OPP entry
>> > > in the frequency table, this also helps minimize differences between downstream and upstream,
>> > > reducing maintenance effort.
>> > 
>> > Downstream kernel forks are not relevant to this discussion, upstream your
>> > content and then you won't have to spend maintenance effort on downstream
>> > stuff.
>> 
>> This patch [1] was the reference point.
>
>Sigh ... I was not aware of that one.
>
>Maybe next time, it would be good to upstream these changes directly ?
>
>> For the Linux working environment,
>> CLK_GPU and CLK_GPUAPB are always-on, while CLK_GPU_CGC can be gated off.
>> 
>> Regarding the IMX95_CLK_GPUAPB handle, my suggestion was based on the absence
>> of its frequency in any OPP entry within the frequency table. Removing it
>> could simplify the OPP handling logic and reduce unnecessary complexity.
>
>If the clock can be disabled by SM, Linux has to make sure they are NOT
>disabled, so they must be described in DT, right ?
>
>> [1] https://github.com/nxp-imx/linux-imx/commit/695f2bdc57b869ca5189313e4b5fa7eb5a12f622
Currently, only CLK_GPU_CGC shall be described in the Device Tree[1], as it can be gated.
The other clocks (CLK_GPU and CLK_GPUAPB) are always-on in the Linux environment,
so describing any of them in DT is not necessary and would not be proper in this context.
>
>
>-- 
>Best regards,
>Marek Vasut
