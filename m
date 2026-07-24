Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012071.outbound.protection.outlook.com [52.101.66.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5431C3AA1B8
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879372; cv=fail; b=lzP9UxzNiN7fAXeeQhSTUQMrGjRBSNgC+8yQ9SInQVh9/TZttDTzTo6tZLZgZQ/b7ToJqPSRMkkN1GE84yIq1QGiWKycmESC/a5Hn4Ay8o5lV1bi5Qp3CQZK2jrEOCnADCiYaTzAdPkP7OOa5ml2v9Ll4aE5+TkLz/Ll66KYmjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879372; c=relaxed/simple;
	bh=MwpPp7alLqctKRDQx5K4SorX8osLSiJx5foLLcsevP8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IvuNsVNw8PWDpWWgoARjjn4X2tRahTWAWM6/kjZME5nlYOUeG/WlqjVj3KW3xdpwESKitrOdVGxgNz63UV29P3UhICbJU3fLhTRPXzMmwyanK9zkDAiWZUImLyBNn2vvmpDjrvwfIWsN1dwmO12vRV9PI5MQRRe3aDhZM+9DxPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QrMfAM+8; arc=fail smtp.client-ip=52.101.66.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QrMfAM+8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCtZ87ZUpUG8KyxXeCqUJLeCw2wz3/myzUUsbFgTv3YJbl31VBOSPcRYJ105OdGDU//wO6S1vm15AOr1gNsuBbSk63vweAlkTydUo7ltPzuYwsUqZ8/lwXotc5u1vCz0UIxQe0T5WVLTkwhAtDd5uYI44vEdc5Ytx0qiaqMHLD3N4loKzWA68EDt6KVPuRhjlb6R43cnktZteGFGqZramFzXlB8YgsFzyRF7yeyN+eVWjZsqFn1s+nqYWdat4r/XQog+DhgBJKi+7x1O4l3UZuJLwUjpK3ze0sUtKw3DYqf6IDHVq2BujqxmoZST5CGrm6fzGsu7AzBVLGHqtlyV/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QI6aSEQ8zsBAobzAyW9ZK8ge/cJHMTeKnCwf/xh+g50=;
 b=IJEAxvBHwrVhbG+FtRKIdARfXzrSzZ3ofwooumddyI/D5Q4BesoCgTwOJGhCXQAg3XWvGcKajJ+9ZnnaqTNGmHXEGRftd8/AH4yu7t1rCN+aW33FwVSL202NWaSSbxysNED70gqrYDoEGJrYrasGoOi8c3yqWfESf5C1omGGEEnreSpCjijrgAyKBFlF7CEC2X72iZVXBCGpDsibM/GPWaNVV9CaNCOZ9UyQvZEdjyu1M++EXVvgTreV3PvJ7IDPuAuMuxXxrpDwzY1TY9YpMn0vhDx54filbwOuVWfBRrwIKBJfDJ9YvbgJ+o9HwISH9yb8kOYxraKQ9uPpP0HJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QI6aSEQ8zsBAobzAyW9ZK8ge/cJHMTeKnCwf/xh+g50=;
 b=QrMfAM+8ACMY5XW92DztezaXWKzGBI1m6SYB5T46pHoIkQ1FzlTvoQO1HOgOtGtDsxcZbvENCMlqw9WtifftrdelBg2EKZC4iyZSvr53MQe1O6gn6ala++O75UyfjCHh/6xpKeVjNJI3iHdUBzS+DuzRvM8DsVvBrBbji9Z/qEYVfDxvMkjFDVBOw8NAmp3nc0KHhA8frpRqFxgNZX+LxArTjWAZ43Jiwm+19z5bmY7mWERHR8z74r4qkPzOraCL/YPJ4dn+Z1rF4Z5Owa2wrtWhM8hvv/hkERzNtavcpIegBlhP28KK2a6RDMk4ce5TJAobm4qwfQpCjO2n5nHD+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by VI1PR04MB7023.eurprd04.prod.outlook.com (2603:10a6:800:12f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 07:49:24 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 07:49:24 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Jul 2026 15:52:56 +0800
Subject: [PATCH v4 1/3] media: nxp: imx8-isi: Implement per-stream
 reference counting for multiplexed streams
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-isi-v4-1-27df7b5f6060@oss.nxp.com>
References: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
In-Reply-To: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784879577; l=7987;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=MwpPp7alLqctKRDQx5K4SorX8osLSiJx5foLLcsevP8=;
 b=7F/cChde1PLtjlGGbM192ZPStq/PozK2QK/jlEIcNO/R5ehgQmmk3dSPOChFrCSeeEiInZKl0
 C62KI/a8avUC/oLHM2JrkkrkXIlxnCcI0PYAKSTCaEJf3q35N6dQMsj
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA0PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::9) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|VI1PR04MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 250042d8-00b8-47dc-a186-08dee9581477
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|19092799006|23010399003|366016|921020|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
 fSi8e0TmVRm7eQc7qJpaJTIJZQeGqfoTYKLkzozzXa1tJ/TVPMVbhfmjlvjFYYPlWNINR8eTk0SRNtVKVMis0FKYTnrAFl+aOah8BnIFN0xlHmazo3fgQjkhAsdqzCp66XAQMhwFT3xbvhgzSqJlIFNQUNCu2QKuMCbkfMq+r17TUuLVz2W5LMFP+FclGe7Dj7yjcSbqDAI6NgNS/NRz1VvLj7hImNkXT1HrF+CVk+tD6KNvgIoqtat2kaUK9gJAI5DOGT/FrQihqrPQSrXZxj9egFMMyUXgQ63TaFlKVSB10DAOSFpdKhMsVpoMa+G3MPyIowEz2tUuRCHa9FbmXem0yFFFeXVjjKVf1BismABMnM9ncxmXvky3EXg4RktR8xa6/WC927T/evcfLXQ4JCoP4uIRGFU/mbxw9hEDhYznOQn2ddrJfgQo3rGeehAiLFdjllB/oicfVN0gFm6o7U6uDOy/fX3C3Gy6oqeNqGhnQt3AbO1eDjErCOe2FAbq7wvwvmOvUTLIWx1OqOtJFFJ1v6o1lN5SVHO/4iQjCljW8ZpQOdYSYIfebJw3/nM+MwTlvxdRjzvMYxJlQtzyfVvCAYhzahYmqXec8RepuakqTQdH7D8+ffObfCLpDa85dvqViDSm1Ayke3S8LdOpEurdRQ7hiSKW7qzEgch9eLwI48kyoFwRY/fJcbsFWpa11LfII+Lj5Bd5mSyLzNsBCQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(19092799006)(23010399003)(366016)(921020)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dEJTcVdXRmVGbms5bHFzRVZ2ZDRIYnQwcGFWSHc1RXVhalB6cUVTOHdRQzUv?=
 =?utf-8?B?RHRKVGd1a2N5bU5GRjBQL0lyU3J2aWRrSUJuZ3ZLTzlEeEtLTzU3SXVZSCtK?=
 =?utf-8?B?WEZ5NjJRYVlnNWhhYlRQUjIwNzh0dmIzeURFY2x0bDBKaURzeWtYZ08vbGFk?=
 =?utf-8?B?M3VkTVpYSFdURlZRcXAvNC9IWjY1SkE3MjVGZG5GNDBUMXdhU1pFNVNyUTVm?=
 =?utf-8?B?OFI0T3lPeVQyZXdtQlluaXpnL1FXRTl3L2k0a3podHh0N2RMbnN1TWhSSGZP?=
 =?utf-8?B?d0RPQ0hMZXVnTUo0RXZ1WitoUGVhcEMwbUFkejdlNlordEdLZWhHV3JuOEdo?=
 =?utf-8?B?d01tVGVjNUZVYVovTnIwcUEwdStKayt1TlYvNVpCRU1scEdmUXRqK0ZoRldW?=
 =?utf-8?B?Y2t4NEQ2ZldlamJqdE1wZVA1TTJKMmFGS3hNQTZ0NlBJZUlMR1VyT1dmaUJP?=
 =?utf-8?B?VTRKK3laMjJpRkFNSEhNelVUQUd0bzFyUlAvWHVObWg0M1RQZkk4UFV0cm9Y?=
 =?utf-8?B?VHJrWDV6TmpQZEF0Y3duOUROZWpZTFJMSStmbjBzYjVsTlMza0RsR1k2aHE1?=
 =?utf-8?B?QzFwRkFQQ1ZvWE1IODJHdDlkUzlKbFBRQ2taVDlXZDZGTjZVajdFR0Z1RGx3?=
 =?utf-8?B?M1hNUzRXdG1NSGpRUW1ETjdRYklRdkp2ZUgwTm41eVlPczhZYlppemZJUVVh?=
 =?utf-8?B?VlJRck1SdS9xT3B2S0JBZm93cE9tR1pGcTkxdGp6dmdNcjlCeDVtYUNzTSti?=
 =?utf-8?B?RmxndlkrOVpsUEhrQ0VxamJWWjNUeUZsbC80dHpuUTY4aEQrcVI1cU1IWFJG?=
 =?utf-8?B?STdqVG8vd1FrOVkydDZJcGtlZ0hhTVJaNFVoL0ZGMDFxdWc2M203MUlEQ3da?=
 =?utf-8?B?bVhvY3hZMXBLRTEzQ0Q0c3V5S09WdVp2Q2VVZG9NaHRKK0Z6cUs2dzNkSVhB?=
 =?utf-8?B?cWZmaXpTNnI2UUQ4Y1VsUVFyTjNFd0lsdmpWQWFrWXNtYXRJLzh4b2RFS2dQ?=
 =?utf-8?B?YXZvS2QwUGs3K2gzYUV4MmpYTjNrbGdqVU5qVUlkcnZsWmt5dlBSTkhrU0F1?=
 =?utf-8?B?SFAyYW9zZ3JpUUVnVW5Xb1RacXJ4cUZ3NVlyUyt4S1p4bjRSM0JvYjlYTm42?=
 =?utf-8?B?RmJOSFRHaGFjL0tWQ2w5QURra2h0dFZ5dklwdGhPOGY5ZlhNakZaT1hwS1Z4?=
 =?utf-8?B?TmNRMzRTRWJzUFBSQzlobzhMeGxNN2xlYUE1ckRTQlplSUEvRkpldmVjMXN0?=
 =?utf-8?B?TS9CUWYrb0tFaFc2alJDYksyUXppdUtlQTFrQU83TGZyRERJOWlxK3NIdE1J?=
 =?utf-8?B?NzB6TzFWMEZ6RWtEeEV1SkxaQ2lEZ01lZ0IxYVZsaVlhVDhlTG1jWnM2VmNM?=
 =?utf-8?B?TnFTTDBBaWx6dWhJdVA3ZEV3ZHZvTnljOC9Zbzk4OHFsSWxMdG1CYWIzSVhJ?=
 =?utf-8?B?YW5tQm1CcVo0VVlmWndkM2orWVgxTGZCcVo4UFBGZEJ4QTlPTVJVd25CSTA1?=
 =?utf-8?B?UDVGZFg0U1dUeEg2bS9PdWp4Qko3SzhXSXpSQTJnZmVVNWpLaHNrYThqRHYy?=
 =?utf-8?B?VE5IYWVwOWhXQ3U0czFwODEyWTFSWTRKa1RkS2duOUpSZDJOOE94YXd1TnFr?=
 =?utf-8?B?aDUvVC9ZeWRHdndnUEFQb2FwOG1jYzdGQU1kSmN2SjYwd2RZVkw4Q0NLK3Ra?=
 =?utf-8?B?U29pK1JzelNNbGtmRE5CL2N4ZmN3Z0xsVHlhSURLNmpDU2RGNkIvYXcrdExT?=
 =?utf-8?B?amZLSHZpTmx3MGhqU2xlSDdCVVVnNUR3M3hYM0hoWnJQNlQ2RVBuQ0F6VFhu?=
 =?utf-8?B?SDV0cERod1hGZ3l1aVRhZHlKQXREci9hREkrQlFrMjlrME5UVWtwdG0rWDhF?=
 =?utf-8?B?MkJVQ2QvQXpjRXZydnZrNDZGNUJ0QmRSbmRIWGdPTUNFWjN4Nk5CTTFGaHA3?=
 =?utf-8?B?YXdLLzl4T3V1ZGlOd05jdVVtUEVEVFZsZ1ErVXlHeXpiT0hvMmpVVllDNTR3?=
 =?utf-8?B?Ui9wbkZ0aW01a2c1TGwzbHVjc1p0dWVsOVdsNXRBZFZncy93bHlVSzBBbXFv?=
 =?utf-8?B?SklSN2V0eEVFZWdiVFlKc2RaS2l2RENrcVJUbll0QVhIWkprYVJGaWF6RkxM?=
 =?utf-8?B?T1VGQWNWUU1mMm0yNWVLbnRWYUR1cFgyT2tXc0Rsd0lLNHRYb2ozMlUzVmxx?=
 =?utf-8?B?WlV5Rzdzdy8xMkpuMVV6emJPeDBTUEhObDI3b245V3VTYlE1VzRKY1V4VWlH?=
 =?utf-8?B?V1Yxb2grM1VhbkE1NEVSSjNBcFIzb0JDa3FrWUl1WkZJWE5aSTIyVzBkeU9s?=
 =?utf-8?B?YVdwOGlTaTFsVlZhWkVwOXJRMGhUbFZLc0ZvdWNaRDNxY3hYb0VKWGljME4v?=
 =?utf-8?Q?a6sJIubJZSpgToT2Q1i5OyAGqi32t+VPEFMgv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250042d8-00b8-47dc-a186-08dee9581477
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 07:49:24.6084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbP2CjmjdR15AE8UbVS87OB31j9HkFfnnI0YDblzLTP62DZFmIUfrzVI4+Pyym5v8BLzTBsMsGMa6IzyzqJsGF8pcPaJcupI+vX35rfDnK3H9RGoK+HV5ldnFvszCLom
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7023

The ISI crossbar needs to properly enable multiple streams from different
virtual channels on the same input pad. Currently only the first stream
gets enabled in hardware, subsequent streams are silently ignored.

The driver uses a single enable_count per input to track the input state.
When enable_count is non-zero, the code assumes the input is already active
and skips calling v4l2_subdev_enable_streams() for additional streams:

  Call 1: enable_streams(stream 0)
    -> enable_count == 0, enable gasket and stream 0 in hardware
    -> enable_count = 1

  Call 2: enable_streams(stream 1)
    -> enable_count == 1, skip hardware enable
    -> enable_count = 2
    -> stream 1 never gets enabled

Similarly on disable, when enable_count reaches zero, ALL streams are
disabled regardless of which streams are actually still active.

Implement per-stream state tracking by storing the input index and stream
mask in the mxc_isi_pipe structure. On enable, record which input and
stream the pipe is receiving. On disable, clear the pipe's record and
check if any other pipe is still using the same input stream before
actually disabling it.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- Make enable/disable symmetric by checking stream_in_use
- Add mxc_isi_crossbar_stream_in_use() helper for both paths

Changes in v3:
- Change from "Fix" to "Implement" as multi-stream support is for newer
  SoCs not present when the driver was merged (Laurent)
- Remove Fixes and Cc: stable tags (Laurent)
- Store input/input_stream in mxc_isi_pipe instead of using per-stream
  counters array, avoiding arbitrary 64-entry limit (Laurent)
- Use UINT_MAX to mark pipe as inactive to distinguish from valid pad 0

Changes in v2:
- Use fixed-size array for enabled_count instead of dynamic allocation
- Use BIT_ULL() macro for u64 bitmask operations
- Use MXC_ISI_MAX_STREAMS (64) as loop boundary instead of num_sources
- Remove mxc_isi_stream_counters_alloc/free functions
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  5 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 84 ++++++++++++++++------
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  1 +
 3 files changed, 67 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 9bb4d430d15e..c07abdd6a1f0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -186,7 +186,7 @@ struct mxc_isi_dma_buffer {
 };
 
 struct mxc_isi_input {
-	unsigned int			enable_count;
+	u64				enabled_streams;
 };
 
 struct mxc_isi_crossbar {
@@ -259,6 +259,9 @@ struct mxc_isi_pipe {
 	u8				acquired_res;
 	u8				chained_res;
 	bool				chained;
+
+	unsigned int			input;
+	u64				input_stream;
 };
 
 struct mxc_isi_m2m {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 9f0231ca47a3..f7a629b341cd 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -330,11 +330,26 @@ static int mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
 	return __mxc_isi_crossbar_set_routing(sd, state, routing);
 }
 
+static bool mxc_isi_crossbar_stream_in_use(struct mxc_isi_crossbar *xbar,
+					   unsigned int sink_pad, u64 sink_streams)
+{
+	for (unsigned int i = 0; i < xbar->isi->pdata->num_channels; ++i) {
+		struct mxc_isi_pipe *pipe = &xbar->isi->pipes[i];
+
+		if (pipe->input == sink_pad &&
+		    pipe->input_stream == sink_streams)
+			return true;
+	}
+
+	return false;
+}
+
 static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
 					   struct v4l2_subdev_state *state,
 					   u32 pad, u64 streams_mask)
 {
 	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
 	struct v4l2_subdev *remote_sd;
 	struct mxc_isi_input *input;
 	u64 sink_streams;
@@ -351,29 +366,44 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
 	input = &xbar->inputs[sink_pad];
 
 	/*
-	 * TODO: Track per-stream enable counts to support multiplexed
-	 * streams.
+	 * Check if any other pipe already receives the same input stream.
+	 * If so, just record this pipe's usage and return.
 	 */
-	if (!input->enable_count) {
+	if (mxc_isi_crossbar_stream_in_use(xbar, sink_pad, sink_streams)) {
+		pipe->input = sink_pad;
+		pipe->input_stream = sink_streams;
+		return 0;
+	}
+
+	/* Enable the gasket when the first stream is enabled for this input. */
+	if (!input->enabled_streams) {
 		ret = mxc_isi_crossbar_gasket_enable(xbar, state, remote_sd,
 						     remote_pad, sink_pad);
 		if (ret)
 			return ret;
+	}
 
-		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
-						 sink_streams);
-		if (ret) {
-			dev_err(xbar->isi->dev,
-				"failed to enable streams 0x%llx on '%s':%u: %d\n",
-				sink_streams, remote_sd->name, remote_pad, ret);
-			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
-			return ret;
-		}
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad, sink_streams);
+	if (ret) {
+		dev_err(xbar->isi->dev,
+			"failed to enable streams 0x%llx on '%s':%u: %d\n",
+			sink_streams, remote_sd->name, remote_pad, ret);
+		goto err_gasket_disable;
 	}
 
-	input->enable_count++;
+	input->enabled_streams |= sink_streams;
+
+	/* Record the input and stream for this pipe. */
+	pipe->input = sink_pad;
+	pipe->input_stream = sink_streams;
 
 	return 0;
+
+err_gasket_disable:
+	if (!input->enabled_streams)
+		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
+
+	return ret;
 }
 
 static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
@@ -381,6 +411,7 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
 					    u32 pad, u64 streams_mask)
 {
 	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
 	struct v4l2_subdev *remote_sd;
 	struct mxc_isi_input *input;
 	u64 sink_streams;
@@ -396,18 +427,27 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
 
 	input = &xbar->inputs[sink_pad];
 
-	input->enable_count--;
+	/* Clear the input and stream for this pipe. */
+	pipe->input = UINT_MAX;
+	pipe->input_stream = 0;
 
-	if (!input->enable_count) {
-		ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
-						  sink_streams);
-		if (ret)
-			dev_err(xbar->isi->dev,
-				"failed to disable streams 0x%llx on '%s':%u: %d\n",
-				sink_streams, remote_sd->name, remote_pad, ret);
+	/*
+	 * Check if any other pipe receives the same input stream. If so we
+	 * can't disable it yet, so return immediately.
+	 */
+	if (mxc_isi_crossbar_stream_in_use(xbar, sink_pad, sink_streams))
+		return 0;
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad, sink_streams);
+	if (ret)
+		dev_err(xbar->isi->dev,
+			"failed to disable streams 0x%llx on '%s':%u: %d\n",
+			sink_streams, remote_sd->name, remote_pad, ret);
+
+	input->enabled_streams &= ~sink_streams;
 
+	if (!input->enabled_streams)
 		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
-	}
 
 	return ret;
 }
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index 16085f23bc0b..c0ec59856374 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -816,6 +816,7 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
 	pipe->acquired_res = 0;
 	pipe->chained_res = 0;
 	pipe->chained = false;
+	pipe->input = UINT_MAX;
 
 	sd = &pipe->sd;
 	v4l2_subdev_init(sd, &mxc_isi_pipe_subdev_ops);

-- 
2.34.1

