Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA3140802B
	for <imx@lists.linux.dev>; Tue, 19 May 2026 15:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206369; cv=fail; b=iHV1hAwsKeqQaSgIEXAJo92Z4C5uPhy3K9eeCAsSfe1QYRzF0aatG93MIQ6/rlay4/CtDnjL/vSd54hykyNgap5w5tNoElEjWUTamn3sMspuzBBKwLV8BS+ROeTqITXj6v1RCaa3nMeYSeTNagGUIT2sZbB/FtmHTGvS63MGqpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206369; c=relaxed/simple;
	bh=AZ55YqPeS6vk7MOxoW4AAj0jt6sJjZravlgx58tCORI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OP4A/hV5uZmHH6stEmcxviV28tCPSFPXXdn3DhxjMQdyjZG7pS6wQd3DvKNgbjZJurbHD2si+wYK5xoUbyrtvcR59g14lPp3+dvTfwKyO7UVPr6dkB7/t1aIvicsK7kex5PV6iT2D1+DELOVV8E+9exyrptZv7BQ1AOuuzxmn2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DSjDthIo; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DSjDthIo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I65pOM/Rl1BWsm0UUq5nLPyVoDtZLc9ZfvSBesJOu6SIuVpmMrS5BG/RrlJ65qYVgW7AifWROht1XNtvmnzbKGqlmJ3mfxpA0RB94NHvlBrBeZ8xcsK28kBZrRVmDbGnH+bBSBU9xKweRPnH1V5+I7JPwlrtopcgCl6GzhWvKR8PxdxElgH4Vt9+lTg3ey3qYb5EnzedCgdNRybjm8LngrorybdIUAd8dcbxbemXMDo6Wn+MMwufLCE0vV7xvPfZ/NJY1rgbqVi47M2LrE4KvFU1qQRdO91s2g1IXj+e446wTeXGGZFLU3a/7nkS1tbT7NiheRf3OqrYskOUzSkpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HpePE40wGI82tM/w9zn7Es2fznCGV1lRUmN0wU/lPE=;
 b=W1rJ70JMR+akIfh4X7PBoYjzj5lrO8UWN3eJayDApQWmdntr9jwfYzl/9y3nJKvVGzjoW1am5hnKQ3wM6BS7IQsgVdDEf8GKAhSP7Z++rQU+SvfUO+bLKCnwutg/kEq981Q9MbbhUldd1QgXla/N5gaggvXPrJazuAp5IIqTZiyWM2U9syf1xOrZZFO9I7bO4BnUlRH0XDOKLftlbfAEcVHEdTaoIkV9FHjOnuO3tIuc1UsjeprJDZJWB7hd+ZwJ2Aeu/3c/lDW9ouMGbRYb7w0RF46yb1PIlRcjI16s+35iRdJsE2F7b29t+dXLeuPMw2ynTUsxKJn6V1yuda9E1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HpePE40wGI82tM/w9zn7Es2fznCGV1lRUmN0wU/lPE=;
 b=DSjDthIosVwZPYV/c2TJZ8Irw57fahmo2M17WGGMyg2//lXTUDIq3TpvRCH97+Ap78C9ZRov7xqF7Dq0K8OvLDHNVlhx0qzymWiAFUBTLBfoY9TM7WK2A0Sx4MRaymmqXd8McO6XBky6aPySJzzAgDE31XZ/fXBXdDy5NftlSHiPrg0j0pVL3mbwCpOFRR7SexUz45WXUwte65GMEOUSChLoq2W5k9dlQ4Pn467cMN5hHtSuQaQSMdKgjH2ymzyksm2tW0EqgQu3D/nP7XYKLY6w7HZ4afx8ZlcJyk+wNrGxuDfUvAhDuWFy09woWqHkd/q4gqtMgsSxYiob6EWR+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9884.eurprd04.prod.outlook.com (2603:10a6:800:1d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 15:59:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 15:59:18 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH RESEND] firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb variable static
Date: Tue, 19 May 2026 11:59:10 -0400
Message-ID: <177920633842.2580086.3274264072199925864.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428135732.102945-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260428135732.102945-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9884:EE_
X-MS-Office365-Filtering-Correlation-Id: 2738f401-68f2-4c21-3b80-08deb5bf9559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|22082099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	LEKFyVI3XVXhWWm3pD7qVqIX8Vuna+Gov9Uk3gSvDHljaO1o5fobZelipHBPqGDRLDLB2LXYOncmA/sHmPZxyNUIcetlsgwyR47mGQyjdWakpa8NWEvJeKMJ9J6bywNetwBw3jp2V44d/hDeltKK9f3jdoTiuSLW43836OvFujzRrE17HWTLezBpiuDp7tzMwvVq/FBSYgY0wlv4jnYB+fOoHO6Io4jV0xUoFmy2AbCcO/dTfmVUbWf2RjTD55sE7fOsKqxpTIykKFInrmhz5SeumZlwlLI5iswLqDRZUMTj0lSZY9CRLI8fvv/ORPsX9SMJXI9B7O2CnWL9viF4z+g24Q6NNMWAkcGbqsaICQ0mcmvmEWbRpqqT9F74u/piBkp7j+6R8oJ9QQ3xRu4CsO3O5xZFQ0PolF8BtNu8/80+fF7oMRPQIvF+rv3ycD2T4DwaaQnPeJXtDw970VB0k0uXVRcjCKwZN7gS6aghMHoqZTL/A+bkTmLX4psYcVXtnBqR+L4deVgnomW55x1ZzjMFn2trXzthJstLf0h/srL/GdkZgFMvjhq9LkuxFjPhkxlhXo3CFeflgOy89lQWRlreVvCrJTnd5FKh0jhwfKYZYAqSEweU5Xc5tNmvOQ6qiPVvm6cOa6SiA7p0LVQHaWWkIll5yhCzU9LpapKW9gzTLL8Nrs+M2y9GTOIVSdiF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjBKMXVNNFMvczhhZFVhMlF0VWhIYVBOS1lSdFRiOVRiSkRzalMwSVg4NXpy?=
 =?utf-8?B?eUk4M3ZTaTBGRS9NUVhqWllUQ3Y2N0tJdFJOQzNoWTBoWWZQbmtoVGxCcXMw?=
 =?utf-8?B?c0I2L29aVVpTazR4YzR2VGR1d2RNUWRxNFd6b0FUZ3VwTzZYMXhIQnJRRHhx?=
 =?utf-8?B?VmNwRmNEcDRRdW1MdktQNlkrODdaVW1HY21XMHpTeGo4aFVwaTNqNDczeHRR?=
 =?utf-8?B?dDlTV3FXcndkMXVqaXIyUUlwY3QxN1Y1dTJDbXAvS2cxR1YzSE1rbnVsaUJL?=
 =?utf-8?B?SWZRZlV2dDBuQ3VtQWEwT1dvOEtqRkpWNENFN0pxTXFHSStlYmUzOGRWVHd4?=
 =?utf-8?B?NWlOdTBxUThUVzQrNjQwaFpMa3pnQmhBMGF4WlkwUUQ0K0dmaHI1L2lUQjZE?=
 =?utf-8?B?SGVSZWtWaTVlR0ZJbVRaS09ZVkRPOHRsc1F5aDFaWHcwamZ3VlJLZHBVbmM0?=
 =?utf-8?B?WGJTZU9IcDVvc1BGcXBmbVFZYStadTgwZnYwdlZ0REJQTnc0NHBVT1NjVmtW?=
 =?utf-8?B?Z3F3NGk1VXZON0FtTjdPRStLbVpEWGZYV2VqQmlCV21yZW9xZFRZY0IrR1NM?=
 =?utf-8?B?aGxrNkN6Sk5jbHJpNnhuVnpJREpFK0xPSUNSRUJlYmNna2hNQThHSHJzdTZa?=
 =?utf-8?B?am1Rd3RMZnpKSnh4Zk8yTXZrL2RESDBObFJzSFpLVjlCV3JFY2UyRzVrL1Qw?=
 =?utf-8?B?M2ZSTXMwVnpUVE13Vkc3ZkZ4RXdibEd3YWh2cStubkVmbW9jazA0VWpUaW0y?=
 =?utf-8?B?R2lBS3ZaYldPRTF3VDdzTzhKcW1nWUdUOVdRdDNJQ2dJQWZPS1ErWHJiR0lv?=
 =?utf-8?B?a1N3MEFnbHdua2locWtlZXRhTEtRcUFnMmw4YVZWZGdjVmxaekY0ajY5Mkcr?=
 =?utf-8?B?TWxMbTV3MzROdmZKRklsY2lnVWw4R0hSSlpaR21WSmVRUWsxcFBSYnlOWjJx?=
 =?utf-8?B?SElXWTBzUzhQL3RmZ3ZlL1JLWDQrcHFPNlZGNTdZaWFQZDl5eEJrRHJiR2ZC?=
 =?utf-8?B?WDRQZytSRzhWTlVBek5QZEkxVENHcmJ0YUxNWXVEV1ZrdWRjZ1VvNUpxVmRD?=
 =?utf-8?B?U2NLYzFJN0IxM1Z5aXpxSGtKbkJ4RHU1dDZNMU0xZHNUSFBUOVVuR3I5ejdC?=
 =?utf-8?B?TUNtUTRIb0E2ODlOWkx2SmcrK2QrSHorTmx4SENnU1JHb1EzTVNTUVFJZ2RM?=
 =?utf-8?B?dnU1LzVOWThOczlQaWRzakQ2MWVHRURya244V2VkY0FiWWp4WVVOOVZhcW5Z?=
 =?utf-8?B?d3d2T2ppQngzaEl2RG1rejZvRjdsdGNUUjh6UTlnL1c2a0VDb1g0Rlkza3Rn?=
 =?utf-8?B?eUh2UkhkOFBGNWZMOG82V2ZyOGlJRm5KOVM3UTBJOWd4U0dPNjZjU3JSbmo5?=
 =?utf-8?B?ZWZBYmRVcUdQdC82VXZISzlGQ1hFMmFOM3ZpZTU1WmI5TmxoWlhpQXhseTNp?=
 =?utf-8?B?VTh5YXNsNGtnSXlKM0VPaWRUZ1YveDB6cURwOGFtVENmaktXbTBSakhGbEpZ?=
 =?utf-8?B?Vk9XVHdsQzVLcGN5ZWM0a0YvbVUyeXZSelpOSnpqS0pYcGhpQTkwOWJ4c2g5?=
 =?utf-8?B?cmpETit4VGE0Y09CeUZWaVUwdWRUbHQwYStKNVlBZU1TUjl2Q3J6TEViV1ZJ?=
 =?utf-8?B?YzY0c2xQdE5OZFdOZGVtSjI3VTVmTzd0ZHFYK0tVYkd6WTBMNzVuOEZkaE8y?=
 =?utf-8?B?QUdtZTdleFFyV09SWTMrenRIWk5UWTFuSEdRQ3QwRWlwbWlLYVYzUEhCdlIx?=
 =?utf-8?B?enFXNWhFS0lLTUh6TldmU0N3M25zRFZVemRHbE9zcis2blRuM3lLMXVhTzlr?=
 =?utf-8?B?ZmlXMjdRclg1RnBHVHA2c3k4VlhiRFUxTzJkKzB2YjZSTW4yS2VPRzNUVmRN?=
 =?utf-8?B?NzZSN3JLMFp5Tno2K3h5VDJmbCtMTUU3emZaREluUzBNRFZBK0JqOWhFR005?=
 =?utf-8?B?dnMva0dDSUFmSXp6cVVTaWtUWCtlaW5MWERCek1RY0VuRCtjNFMrVkxlcGls?=
 =?utf-8?B?QlF2ejBzUFRTVlhkdUYyMkIwZ1RKV2xIdnQ4WTFpNldhdEZHcUovR3NkbDQ5?=
 =?utf-8?B?SEhzMUFvZnFuOUxoc1dFeHBmTWpwaWJJS09Wd1cyT2w5bWZWMSs0Q2w4bTRx?=
 =?utf-8?B?M0hFbE9NalV5bm44Z243UTRxQ2hCeEdPS3VBQ2ovYlA5c1AxelNtNlhpQTE4?=
 =?utf-8?B?THNMaW5INDhhN3JOaTg0N0hpbWRuSlpUaG5RQS9odXVDL3hIaVdpckdHblhn?=
 =?utf-8?B?YW9VREdDR09ESW1KcUhyZHJMZkNVYlgzU0VHYUpiRlJKenhCK2dzNHVHT3VD?=
 =?utf-8?B?dTdEK2JPaG1rYmtsZURGbU50WG5vYS9RRlY5eUgrZHpQbGg4a3V3VWsyRTJO?=
 =?utf-8?Q?PbaG4+fODmlx9PFsYJ39Y5C9XsvYCdKhJh5PG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2738f401-68f2-4c21-3b80-08deb5bf9559
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 15:59:18.4394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5dpRNkjm2fGCSTwDzv8jJuPbV6r2hL3To2O9NeTraQ1JZehtpMacdje2Mn8Oj1uf+t+NpzCbdX+KDAL+nLriMsz8iozC4H90h4r9H4ANCWHLCWGICaHLW6fSiHzIyW1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9884

From: Frank Li <Frank.Li@nxp.com>


On Tue, 28 Apr 2026 15:57:33 +0200, Krzysztof Kozlowski wrote:
> File-scope 'scmi_imx_misc_ctrl_nb' is not used outside of this unit, so
> make it static to silence sparse warning:
> 
>   sm-misc.c:19:23: warning: symbol 'scmi_imx_misc_ctrl_nb' was not declared. Should it be static?

Applied, thanks!

[1/1] firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb variable static
      commit: 2430f2080f2a4e45b69befba26ef726d62180bba

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
