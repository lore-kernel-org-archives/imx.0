Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751E9346AD3
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 19:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343976; cv=fail; b=FW0n8lW5inZINGR3/j9eZGx+Gv9kRkTyvQRPNGQ55O7VGGDOS1WlENttm+P702DPJ997sw4fDjB5gH0TzXoUStXke8iL1JYnt7yI3VBQ3g9LBmVPIUN4hjBjCVHFKl2DU8SpSq+PoA4UhxGU28VCvgBNEDU124StNkR5cYbtnP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343976; c=relaxed/simple;
	bh=xaSGawhYaRzWRE2+4vBGcXRf9EAky2UP+AjoQjOUEAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t7loISQZ0Vg+5kugrPdOqTCnUFRt0aevfm01N8ZZXatYuy42w7Hw1Un8ROJkpI2J1paTEMqFD1FrZs7G23jk2HCE+NcTxras/WHLyHNtmhUvRqk0ruT+CHrBlnh06HmEjAjoACd68n9jJq4d4KrP93hJd+f4I+joR3RxGlz6Omg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cS4gRBnP; arc=fail smtp.client-ip=52.101.65.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cS4gRBnP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waUFQKQLCm02MmZBwKIYsYnrqCShJy8J/k1czFRSRUxfYvZDPB557X6M6sSJY8Ycus/wfgPALjI9z34g6kaD0w8UMd9PmR+pDkMM7QEXz1xtavK0IN3UOsM/Izx81zfpr0SpX6jp5f+qeVKiKFhfiWPW/E2GTK244JlvA6MyIJWjfgvB8TcZex80JrHE9rkUMb8ezlxz/YkNtS5br+DW1WsFv/cl8N3LBCAnc/pzgWCG8uzaoirnlGRM4YgxkChLr6nNcWY4TvQj1Z0evd1DEDrhKlj+9wiBtR/PbeZ8um2ci36S4WcbD1KEUvF7KaiY0sQ1L9Rcj2/6qUvb5hsJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQIpT1/I6+Jt+HCY7Y1asyH1q4exfxJQSxcesZ2sWFY=;
 b=SH22Uu22Ki2p8WIPzjGVDyW/T9yduPIh/6QjO0tuei2dw4mLqGqn17Ycwc8Xh/X7dps51+WDVrJp8YeLBZAhGLXBOSK8bKigAeSIlgyu0K/qKVMnEQXCeewZkPEu5Nj3urCwwV+dDCdNyRyowtvYXeZ1OJh9r47u013UKq/dg8OZIRzlYVDYTHZ1ZS3nge+se+IqHPSca0sHGPp7HUGgleM9SErOyxehuxALQ1v5q0FsZJ6Dkm02TZcxp5tsD/MveAg1cnEsYttogEZZz0Uv9eNJbpnFE40toDQ9DXexm3KIMj4r8ES1tDvK088a9XTu09MC74XR+mdsDShzRPUpIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQIpT1/I6+Jt+HCY7Y1asyH1q4exfxJQSxcesZ2sWFY=;
 b=cS4gRBnPHP/ML2a/vfett+76bESODkhF6GYkXGwJbbRJJrlu5eJlb+gswM7kO3k7yFZbTZMfPzaXMlLCDScqTZxzoj1i8wGQvVIG+vcs/Bxkn/7JUFH+tzi2v95UO05qtvXWcGCcldgTuR3jAC8J7eUPxOieAb1Mmgb+pjkvbce/5Rbz/s7zzfXoC6KQPm2NDXdunf8AdefghB3u2BMBVKzMSV5rvRmiIttVsNgl+uRFjE+dzFpnz8seJef2JEv7KopWQL64oCTCo/r8enN1Kyj1Nm1Mrs1z/efKVpADhftyA4E8nTE+AaQSYIlZjtptB2Z6uokc+foCnYPCIN8bxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6822.eurprd04.prod.outlook.com (2603:10a6:20b:108::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 19:59:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 19:59:32 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Yuho Choi <dbgh9129@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Russell King <linux@armlinux.org.uk>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: imx31: Fix IIM mapping leak in revision check
Date: Mon,  1 Jun 2026 15:59:24 -0400
Message-ID: <178034395667.435610.16081459856669833501.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525040158.1352069-1-dbgh9129@gmail.com>
References: <20260525040158.1352069-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:510:4::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: bb567f6d-377b-459c-2baf-08dec0184c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	nJKvik5KpDP3NGwfpHiLxEo+SmeLLzlzSA4X6M0uxs5nYkXb9O3CRJe2S1Xh0MNr0o2GC+0q0QTfBqvnBnb2Zp+NlW/iWNwuqzNFLNPLskmGPLaz78Pef9lDQcpnrUS2UNLTvFRz/c8LOkIVHq8RiYW2279KIMCS9YQuHYgYcAG/xIxK3tJspOTZ0jvCoXRaG721R3IWDivxG5fJAD5y5XiiwE4f+MQOrBNcu+2NHkGnK8E73ZcH91D8aMqcXE6W8HKt8tV5xnDozejS87oXyHHfOIwDNWHNGun6BKeyrZoPjHWaWKGx4tKYbAA5PeSMtcBva6xwQkDcX0O0DR6OrK5m9j+cwB95TZQEQrLScL10sxprbFSqmsb9E1UL1FqkjQSQjhianeWpVKfzdXKzmEUZMkkx8pd0zXX9KYySyg9wzpGxaS0pZHrZs9bBixSJM+UUfoiFknvFGzKDklCVUVIqI5R/nxpBR4X+oSm6yO+hpjK+htQECCe1mSo44NfSUHp5kihZn4n6ay9oSEJEAyJKYF7dxgrQ0ufi4D/KCoQPdI5deNBzuDkl/4erV/amU9jPQXF1uTtpZ+uzw9G1FratnqxZ1TN/4YzoK3Yljxb09pbqvJFKddo0puQC6CSYhqpPlq+HgQMjeQKZypEOGKdt01CrStmnRT6ZtfotMkRknxhXq1N7zubtWUgO3w4L
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFNIdXp2TzNWVW5wOXEyUEk4c1NRMnY2SmJKbjZ2bEFCUGtDQi9xYWlhekJK?=
 =?utf-8?B?bllYSGo5dzhsV0VLc3VaT1h5NmpvcktCbGlKSzArTFQ2Yko3QnNxUzE4UWUr?=
 =?utf-8?B?L1BlWWsxenFqeDhZQVVHcjlJZGhnUzJDQ0pJc0dvM1FwSVFKam9XWFl1ZWtw?=
 =?utf-8?B?YXVaVkhxY3Q5bzdlV0FIQUhUTlJhb0M5VERkNW0yeEp5d1NYUHEzK252Mk9Z?=
 =?utf-8?B?emdmOStzblErekFSbWk0RS9Bb0ZRa05Bc3U5Qm5EcjlKTWxjVXFRRWl3MGtl?=
 =?utf-8?B?UlFocHRvK3p1UzdPdlREc3RzQ2V1L1padDZ6eUU2SlVtemtzWkNhVGZXRWpl?=
 =?utf-8?B?ZkcwSStoYkFhL1ZLR0dWemNQWDlrKzErNzNYeURVNU9mRGJleWtIQXowd3Js?=
 =?utf-8?B?cXdXS2xmV0dNMWkwbERVcHBLbXlFNi9xbkRrU1R4OGo2VkZ3cmF2Q2ExWVJB?=
 =?utf-8?B?cTB3VDJnT01iYTAzWGplY2RhcDlCejFaZ1FXRWFrM2xBNDJONEpJMURQdlJj?=
 =?utf-8?B?bFU5dFpmTkd2c3hMLzZXSVoxeUxjditsOEhtcDJFSitoMHdVWTVicEpDQnF3?=
 =?utf-8?B?MGVPbHluY2gzQStGWlNrTnZrTHRJWHB0SkdFeDhVT0hYN1l2V3hJYy9nd2JJ?=
 =?utf-8?B?Y21EZy83eWF6UEFzNlZGNC9pM1l1M0dhWGEvT1RRWmt4OHVUekgra3F2anJ4?=
 =?utf-8?B?cmpuSFBQam4rVXJpUFR6d3Y3eFRKV0I0dXBHN3VSS0d6MEdDdXdoWEp2TE8r?=
 =?utf-8?B?YUYydTVzcU1nckhXYVdqTkRyaUNJa2VwTkZtWjV2WjJCSGRZbVpTUUlIa1lj?=
 =?utf-8?B?dlhwQUk5VEZpVDhwU2d2ZjVqQ0hkVVdMOUhncUszY3lGT21xdDdtUjlSKzcr?=
 =?utf-8?B?OWV6MWcwYVg2MXpsRGt1dFFpMHlnYjhBeTdVTDV3WGlMaSswNnYxSGw4c1pk?=
 =?utf-8?B?R29FVFhFdDMxNytURWpacVFSOHpOYWllOWF1WjRZeXVtdk11d2kxWGU0Z1lL?=
 =?utf-8?B?bkFSOCsvNmtOSkcyZUN0UjZWMUJhdGQ5L1ZreE9uWmt0VG94Y2dHT3h0UCtW?=
 =?utf-8?B?cXdRYzNBa3Q4Rk9GUWtVTUhNZE8yR1ZpL0xucCt2VlE0N01VMmM1MUV2eEM4?=
 =?utf-8?B?MzRDMDVGTEh5U3dNbWVoVmdzMjNJQUpsNERvTmVJMmd2T1RaYTkzU3ZYVlJT?=
 =?utf-8?B?OWNEK2pIMzZuRXlHOWVSZk9KREx1aUJhM1NUNHZEdUJyOHo5VHZ5R1ZrY3BS?=
 =?utf-8?B?ODc3N2FJWUVTWE9YK0pzSHpMMk1HbVUwbXdqSUFPYUJ3ejh3UDcvd3BRNi9x?=
 =?utf-8?B?TWU2MjJVMlp0YStyN2tBUmhPVnRvc0IyQlNQTVNIQThCUFAzODltTDVmUmZy?=
 =?utf-8?B?cXdLMWh4OXNLRnNYTEp5TzgvTDA1Y01lbTB2c2FvcHlvUk02aGFhdFB6K1FE?=
 =?utf-8?B?N09RMGVaeEJjTnFaeEdHVkd0dFh2WmtCY0FFcGRwSnA4cG9wUGZ4SHVSNnVL?=
 =?utf-8?B?M2N0a25xalgycjBaUDVVUk9IeVl6ZmhZWVNJTW84UjJQYlpTUnhya2FTc09i?=
 =?utf-8?B?VDM2SmhuTHVlRWlWU2J2UDRzVmRUOVd1dnBXYzBpVDV1Y2dEWEFQeDZTUnFx?=
 =?utf-8?B?STcyR1JGR1BkQzRBckpYNGluNGpUOVpwdzZGQ2FtemlOY0Z6dncvNUF3WXRP?=
 =?utf-8?B?UWdUaHM4bmIvNjJYNzIxQ3U2M2JtWWxFQ014U1dYMHVNekNWSTZLY3lCOUow?=
 =?utf-8?B?NStsUUpRTmU5SUlocjI0bG94eFIzV2NaSFltaGhhRG12UzBqNDRZYjdjR1BJ?=
 =?utf-8?B?Wk1kcGphV042U0hlSzVZa3l1dFE4d3lyT0JZSVcrRGJlVDMzTlU3VklyTzZI?=
 =?utf-8?B?Q1p2WnUzbTlTYk1uZk1maUVGR1E0UUtDNnk5eDNUZWh4Ly91M1ZNRjh3TkVX?=
 =?utf-8?B?VmZrWnVlem5tRXMwWm4zazVOVmY1RHFTV3ZwaWk2ZG91am9JU0NaSzdZaDJw?=
 =?utf-8?B?OFhzRkkyYVpsMXpyeWFsUnlsTVRXN3FORmtXVjM2aFFSOXhxUWlxWHFOUExL?=
 =?utf-8?B?S0RJaHloWVFOdjd4MDlFbDgvejQ3WkdhT3NWNTFad0NMTDNyMlI2NlJlWnlV?=
 =?utf-8?B?clVCU0tDOTRodktBUHM5UmZia0pMOEsxeFp0UnJCRnRuQXQwSzljL0NuUVJs?=
 =?utf-8?B?amhJUWhzdjl3Tmt4ZEZOd3pCZEp3ZXFsZ0t4dFJDNWFzejJaQlpNV2FUTTlp?=
 =?utf-8?B?SWJ6TzNnMFZ2ZmV4Z3ZMSkticE1FRUpobEVYaXoxVFVlNkpkTUNvVlg2UEVx?=
 =?utf-8?B?MUpMZ2xTUmVJbG9iaW82S0dvQnNEMjBVSE9DMHUxb3p5SmZEQk96UjBsNTZp?=
 =?utf-8?Q?I3nY1ftRrMFoauqZK9n6hNCX6E3j02tE8NjhV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb567f6d-377b-459c-2baf-08dec0184c3d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 19:59:32.5309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qumvolKAp72J5ZogB8yDRIlkNPfGvPZm5hSI90MiIyfoqoUrb9TZ+/60+wJ8UfAZmcq7lVHyhkfN9GmnC2RR7VFILSHrnZ8emASQmVgjkye5Z2EhaVnsgJz8Uoa4gNb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6822

From: Frank Li <Frank.Li@nxp.com>


On Mon, 25 May 2026 00:01:58 -0400, Yuho Choi wrote:
> mx31_read_cpu_rev() maps the IIM registers with of_iomap() to read the
> silicon revision, but returns without unmapping the MMIO mapping.
> 
> Keep the normalized revision value in a local variable and route the
> return path through iounmap() after the revision register has been read.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: imx31: Fix IIM mapping leak in revision check
      commit: ccb4b54b8ecf1ebafef96d538cd6c5c8455bb390

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
