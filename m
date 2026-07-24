Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E2838F230
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 20:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784925066; cv=fail; b=KkqoOH9oa12TksXntrvmnzNs7a9+XLsV6f3qCnDlnOHXZrV1cBMb/SNUz8u6jgXglK4YIMEXTIdDrk0V3QuuIgVMk8viuoQSWdilEeEQ2f+geArZzGGkZjjxiuHZEbbT4ClPYY9rxl8l4FTQPwAyRU5MKunpDLNLOni6zB/0IDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784925066; c=relaxed/simple;
	bh=jl7yMjS1/R0vBxm+zORlVZT42FR1hIDGLW67Z8T1ebQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=smxmLZws43Qk+o0sQn/dcxBK2gvn0O5BZmHZNJu3agB2UzddB7p54GlQXuxAKM2vfcffcop2NIZwhD7N5wkDmevKAJFRhJCoeiiKHPbHTtGwKcbinvkLJ1MctLWNUnXWJ1Ppp6ScN41B03KDJPFrHgJxPZi58rJW2UJGtRTsfFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j/H4tdPW; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j/H4tdPW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouMJMBJubD9SFyxvbLoabeTerjmr8kyHpuaBkvHZ2uONhVVlnie2w0aAlsmyqsUl1dyGloOlU35cWMvaD255xo9QkAgFP2Qto3O0dPfHz59Uc0xz0NrEVx01B5vvMt5cYvUWeqovxzm1tCrVyGd3ekLSeUw3iHi/o9W78c0+t+JOUsQJ5IfJ+z+8hImY/WpxpgJina4VIbxR4KrltYAH+VVVdglBBLbLDF2spn5Ftc/tbjh73XEQuG0tY1JHpxK9gYduLj9uV0+IcTBjodAWmXjyR6QJ8goABhMEumasQBs+aFgcQk1OlmMxZmTH9lcagQnLaui6xa9GJ8iXpOAQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJBnkaGbWnzefc1dU1kN3l0dQRTCx+fMPtCZVEbtQms=;
 b=t0sJk7nV4sA3ESoxHA5XKaiHeCQILmNyNtg5nH3RtsJEdxl3D74fqK7fXgihBE3/pR1FteRAU2Lg0dYy2Vme0ZcTsM7qkv8EJp+2TXoyxiRXMWAHcHYAZD2+wtSU1iqSVdadZLRcOWmr/ts6/c3MxEXN0eZWti7V9FlSReOZoSim9oy7BB2UqNsmrmBTmU4p8QChKrPiKj/UCOk/e/SLLK6D+rgua+Z11h8TpPDOW9/imxKNt8lhM7R9/cN8rhwSHjY5YG5PpNJ968xjMcCHtcRag0X5qLzK7CHmqqILCR5+CafPiKVR8Nc3FjXwP0a4j+SddRqb/7bgINsAYfX7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJBnkaGbWnzefc1dU1kN3l0dQRTCx+fMPtCZVEbtQms=;
 b=j/H4tdPWKUYOlPHnijUqaKuHJ4h6XxMytD4G2yPhHu+6oKQ4OT7pAW93b8dL1G03CQZ5nfarK/imCPR1T6CEcFPwd+D223W8K8nDSLu9YcJkSgB9qm/i+0c/DD38hhajDD031vVjVljtDLFo0ou1Rvv/3ljrz1cIqFnd4mfUUSWlWylt8+wSzEQl+T7gsDcwsn8TR+8Fo4inEhyi1ihkR3JXxg36fciylukb4Tn8bqQOQX+BMmDlIMPwzaXQ7Vvx5rlTx93fY5Q8ypj7sFsQJjvE6IW6rNZPxAdQpprKDV7YFjcIy7eHFWG+2SiXoPwuLFYyeLPzIvC3HikP2yGpsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA6PR04MB11830.eurprd04.prod.outlook.com (2603:10a6:102:521::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Fri, 24 Jul
 2026 20:30:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 20:30:58 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] firmware: imx: scu: manage mailbox channels and global handle
Date: Fri, 24 Jul 2026 16:30:51 -0400
Message-ID: <178492504719.3813459.8752688568464104241.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616005902.11634-1-pengpeng@iscas.ac.cn>
References: <20260616005902.11634-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0117.namprd11.prod.outlook.com
 (2603:10b6:806:d1::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA6PR04MB11830:EE_
X-MS-Office365-Filtering-Correlation-Id: 265e4be2-a193-4f7e-315c-08dee9c2784d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pr8cUWxmDjBOUlqcfkK4BlIkfF94DZA/EhmY9M/NbTMDkLUekgsG6xMfBF5sogyUE5QDjMMVNDj2wRRol+tuHNlf48BcQrIcnPUyTYTCtJnW2s6YvI6UMkLbC3IR1eoE6Z+npvDOOvk6CQjsAiBiaYijBvRGppd73MT2uHBxNucd53c+699k0afHevyv3Gm03ZH17hSFCAx1WcZaWMLbtgqY8DkCGNYKXRT8Wm47XSZ1TxzGXhpOGimqra3ox6zH48IiLGhVLY53PmjJCPQfBkTSAHwJTDkvcrfowkaKqkvyISQu5AScoxexysZ7zukTduSsVONL20SUU+aVqt54lwO+h+xUIabYrycw8fWIkaXhSxEn/iaO7+Hcz1hHsgR2fdwMrdQo8QbnQ8n5NKbUyr+rsuoTD4+Hc3nskPSSQ089Gm7iAz+Wz0yzv50P7QrwmDzbfIyUF6fH/CiszjiHMTQc6StSgW/xb+qfFty1z2wx5yrv8fZhGrVy8F4uZ3jcOLaWEHHX6Qab/6iXvctsSoIvg50qn7QdtJN2w85LEfWUmh4/lGn1lWm8Q4ZsjPf5EyG0U6Rp+jq1m6E0iDjUvZi5D3gNgpR9w8D8sybeUIMiqIvgcBLeoYqgZ7ckxkrd4ewuFUDww4EbpfR3k72BU5lpSozvZutkTQwU7GVQY+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTQzU3o3NzQ3T0pPblErbVV6dzdOU1lnT1lpMWQ5R1pqc1h4TWRYWnNITnh4?=
 =?utf-8?B?Ym5NcERqdUFERUFlVXJQeVNPRFp0V3dIQmlTdjA2R2ZYb3pBb0YwdWtOY0pS?=
 =?utf-8?B?bWVXeGE5WkF4aGI1MWV0QlNhMXhTQ3VxNWQwTFdaQ3BZYWFIckc3cUowcWVo?=
 =?utf-8?B?K0VUM3NiTTBONWpRb0lqVEMzRnFQNzV5Q3dJTlRha3gwZEp4ajRYUTdTRXFr?=
 =?utf-8?B?Uk9uWDhzNis0eVdOYXI0ZUVjN0U1QnVDSDdPdXB3bWlGT2R1TVRDNHhUUklr?=
 =?utf-8?B?UTYrZDhZelJHbHNsU0lMTVNnUTR0ZHpQL3FucGYzUzgvelVibG10NUgrSzBZ?=
 =?utf-8?B?eitVSGllVjhGUmlrMkdTcWgwdkJxQnJqKzJWQno2UGlhelRSY3Uyd3ExVERL?=
 =?utf-8?B?RC9VS3VBazZodW9HeW1vYVJrZmJNbnRDR3F6N0NuRlpla2dTOG14RkI2WW5T?=
 =?utf-8?B?QWIydUdsNmFjdHUzcUtVNjQyczk5UTg3NDA2QXdrWTZkTjJNVHBPRE9rbEtm?=
 =?utf-8?B?SzVnVzhUcmQvcDdiZXVMNG5ra043Q1FXNWNKUkIrb3Jnd3l3NXNrVzhzVDBR?=
 =?utf-8?B?TmY5WU1PQnozL25OU0g2bmhkcFM2Y0VPRlJMNlVlQ2syWCt1MTFEQjNsa1pO?=
 =?utf-8?B?R1FjcUZuRWVOMjMyM1M1eDJFaW1tK3dLbVowNituMkl3bksvWVhpbit6RmxP?=
 =?utf-8?B?S3M1OFh4d0dKaE91eXB3N1pJVnhPMDF6NElMWVR1TDhDbHJlbVo0eitlTGU5?=
 =?utf-8?B?OUFPL2xzOTNSYlVuejM4UitPODQ4YlE1cWV6WkpGSTF2Q0lyZmJUSm9pM1A0?=
 =?utf-8?B?dXBBRVc1Ri9RL3B4ajgrSzNJOWY5NHVEMGhCVUhNOUtOYVNMbE4wdDNjOHd6?=
 =?utf-8?B?RHdWSWZjNFlUTktZREJkdEpMajRmSTUwdThySWpmNU5MbFJrd2pyK2lZWGxw?=
 =?utf-8?B?WjhYVzJQbER6bkh3bHUzai9JVU9yYjNoNXhOQk1RY28rb2JKcWRTZTFyS1c2?=
 =?utf-8?B?b3hnc1hqZk9NZGxXNmNFcEJ3S0YzM0MwRFFtbmlUdGhIZzQxUUw0VE9uaWMy?=
 =?utf-8?B?REFFUlZrOC9EZXBoQ3RzWWc4dWdYZ2tLVHYremZGSjcrT09MOHM4KzZiVHA2?=
 =?utf-8?B?di9Ncko3YnRJYWEwcENIVERkTmRzS1N2SFAzeHYwVGF1VWxJdE9EQ25zSmYw?=
 =?utf-8?B?OWVZanBKZFpYWTVmeGpRWXhNZFUxVVRoczFwdExPcnhlMFA4MWkyQjJFVkQv?=
 =?utf-8?B?UFRuL0JDelN0bU4yT2RyditsOGR0MjNoMm5RR1dlMnlvSWFWTm9ZaURxSGx4?=
 =?utf-8?B?djE0UVNBbFNvSSttTVI4c212eTNxVHpyU1Fqc3htdm40bnJDTTBhb3V0eGFv?=
 =?utf-8?B?c0YwSUhDTWRrNVlFZlVaL0tRaFl3cVpIMXIraVFnWEJVd3VhdnVGVElJZ0w2?=
 =?utf-8?B?VE1tTkV4KzdXV3VMNTdDM05yK3pLZkdNTWk2U0JSc21hZXNrbnd3d2V1Ukk3?=
 =?utf-8?B?UVp4QVppVG1YU3NkS0hxUUJHcVdsaGZHczRRMkhydUZLN1JmU1k4bmhhVHNE?=
 =?utf-8?B?eS95T1AyRSt0c3VGRmdlZDE2SDFLZVVOUHh0QjVOK3RCSERiUFp1cHdNWkRT?=
 =?utf-8?B?MjhPQzIxVFdDNnZmQlh3ei9oZmV5ZFRmRnVaMkZxTVFRTEZLRktqSXh0NkpH?=
 =?utf-8?B?UVRyamh4MThvOG1nWFlBTEsxd3pzdm0yNVgvN0E4OTBFQjF6ejNwVllsTWJm?=
 =?utf-8?B?RTV2cXBtQXc0ZThsUjUzMS9pc2tEYmw5YzljVjIra1NFUGwyS1JBTW9mZ09W?=
 =?utf-8?B?bEZKbjdpOHF1eXZqM0NUNmpaS2QxVHJ5bzNRUVExaE1Qc1YwU3kyanI2NENx?=
 =?utf-8?B?enNZZXdETUVGa3VwRTFveUhwTlZud29zVHR1RHlUT1EyUEVTMEZMOWY0TFUw?=
 =?utf-8?B?SEIwT2Y3QWx0VnA4N3ErMGEwYk8weS9NRDVYRFlpaGJsVTZaVk4rZ3BXVDRT?=
 =?utf-8?B?VC81RkIwNnN5T056bXYyU1NZTFV3bTgxZ3BsN2I4cjB0Zk5pOVppalhjRmVG?=
 =?utf-8?B?NW1hVnJmT0l4OTNwa04rZDl1eVRCbktkcm5nM0xSanJjeDB6Skwxb0xHZnNK?=
 =?utf-8?B?SkJnOG85Z2NBNnJhTEthRVhMM1lmUjZUbWpick4rYVM1eDdVTDcyeHBmakhG?=
 =?utf-8?B?T05zbytCaUo2WXRkYmxkbEFIZUkvNjVLSGlVVWE0K09pZHhHc3hDMm5oU2RS?=
 =?utf-8?B?aHpXUEVoRy9CSHJ3SEg1SEhJYWJjenRLUk85WjhyaHRKSGRzZW1YN0ppMlZa?=
 =?utf-8?B?UFZPTmtlM3BtUTdTN2swaGMvcU5oNjhsUk01dmFMb1dhajJNTGVaQzBkSHZr?=
 =?utf-8?Q?cWMBfhIh5Fvd7ej9CF+oXu9FXlDmklEz5+/hA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 265e4be2-a193-4f7e-315c-08dee9c2784d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:30:58.6087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdp+qkEzgvEI396tG8HBjMm4d68ghmtpfPSLbL9koGsom2kaoW7qpFS43EWSyKk0PeJrgw1a+FXsfxIag4eg9gVsG2MhBrFkEOEYk8q+7tvdBw5n6Hisg6q59pm1NDuL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11830

From: Frank Li <Frank.Li@nxp.com>


On Tue, 16 Jun 2026 08:59:01 +0800, Pengpeng Hou wrote:
> imx_scu_probe() requests mailbox channels with the non-managed
> mbox_request_channel_byname() helper and then publishes sc_ipc through
> the global imx_sc_ipc_handle.  Later probe failures, including child
> population failure, can leave the channels and global handle live after
> the probe has failed.
> 
> Register devres actions to free each mailbox channel and clear the global
> handle.  Also depopulate partially created child devices when
> devm_of_platform_populate() reports an error.
> 
> [...]

Applied, thanks!

[1/1] firmware: imx: scu: manage mailbox channels and global handle
      commit: 55c748d596f841a18cf659ce0999f64029a5c88c

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
