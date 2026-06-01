Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8453534F46D
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 20:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344216; cv=fail; b=RF/kOftdTI03sBEKC6gt9hv9X8B+LQwgkDH1C5VvJ+SlTwGkIeGLWUem062ah9vsYjdciuNrEsteKvccefCd0SExajclwBFf89sFPGHgDxWqrPOwhP0Q611QxEuPM1PFwI0ZwbI/jCHQykyzl5hjHRrJ9iTmx74F+qWE/Ga5378=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344216; c=relaxed/simple;
	bh=dUi8lS0uoYML6T3CJBQWESc0ZWEfATGSnbNa4HrRDeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lk7zreWuvQl/BeL/3rGuqegziVPg9k1URZpOg0MM6N5YCRhieBAXz+myTSHGNGgmG9/JIfBO8Gh54ogTLwsl1AEydmHiqq21/N5/aCU50/bEtFeBdbuuY/ypoBbjEANXw50j9VTFMD18uo9U8WPJ01/CZuFS2pseidzAy2pzoJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SBoHybgP; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SBoHybgP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBissDhFFvITU3SubgbjwqkLHX/nyJVId9aINJ3Mhc78QPyOW83aYszxXKziCXajTnI9M9wfYQImRvM8opc8rV0uzgE2c7Kg0voqsYrRC0ROiDlC7EwQIljbqv1lkCNyiZHIfNZeyypwuVas4AEaHzgxXyzn/tQHPipO4/fe1kZgeKleM7OkA5SeEgeHg827wsB+4GANHljc+iHazguLF94v6lWyrDqj+jvQG9oEQIY8ewjYoaHYq7+UNvC42rzZ0q/Xw03klJypvCWHaVQL9oksurToOFyEjwSO+9/cgXpUE087uovrz8Nqqr7WsNzN4+aX12NIng/CIAhRivv1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUR5G2/mh3HKuJkIeSzOoXX7PTkmbLjTXj4+G67HRkM=;
 b=SEA5EGNM57rZclLKxatWS+0MKSR6uIvzLEEhNtijsHzKdpKJ7ZM/B182L82x8rpQXFHxV25sVNgJ7L8D/G6bSv2LkEZSo9ZVbWxvZy6zLQOjqsmWgWn5GiCD1I6HwyACq8OGAZbtjN+4HDQTfbh/mSRN0sDKGRrhKKuifxv5pIQWCcsdXPZroFEzn6Eg/ujcP97i5A69A1smAbWEy8SYnOv4Os7N3I5EK+3u7B0vPDYilhA0mqfAbxKRemzs1TgBRsKdYs3TS1j3tWhBoh/Y7f92PDZ1lo50Xd2sSTHNKNyP+s0jB6Sr7zJ5vIXHMs8yq5Pa3bLXNSSNUSUfjWEN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUR5G2/mh3HKuJkIeSzOoXX7PTkmbLjTXj4+G67HRkM=;
 b=SBoHybgPLNhrgBZZyyF5Gv1BncuPatfJVbgJcOqJX8kjvTDlLUT1vkN8UXdTt6/tTSWWu/kHPoATG09CMoimq1c3lzPXGmEGmDTHkCst+YxLdio83nLS9jMtH/cMxRpyu0KWvQ/0l/pKKUgvXnylIR0+1fIUyUzqnzgdqe2oy80gMmflRorTQjjvy0ZcRjD94gIGtR6MCMpQeoQYZ47g7GBBkgyOCRBTFpCpPSUSQqtRTBx5OMrnJoU8aN2GzrKtK77qOOuC+SVV+pO8s7fRmLberefdjuqkDlTEG7lCrnMEwFAz8GUlOaL5fj5hlHp/gkzGIZfzdVnAWGU6Kn0QYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB6822.eurprd04.prod.outlook.com (2603:10a6:20b:108::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 20:03:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 20:03:32 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/7] firmware: imx: ele: misc fixes
Date: Mon,  1 Jun 2026 16:03:24 -0400
Message-ID: <178034416895.443970.13775352823744180841.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF00013301.namprd07.prod.outlook.com
 (2603:10b6:518:1::f) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a44eb56-2b76-4f33-0484-08dec018db6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	h7dAiCSdY/V1aKxN1C7M9OeuA7XFb0Ia26fRcJJU5XSGIbwyNQ4gbBgLhJvQMcSqwfLkXOmFwFfc2eSU8fuKwPJEK+8SrfQEm55hApulVS7Nq80IkIU98qgnnpSRP/NAFOIGXdEcTsHr06xWB+VVgtOGSFTa3GS6pVOckSxSmmGSmYyc7srcMlfcjueCThhT6Wmc+ffg4ranZeLibOYnZ0REmndzdIQKSYmIxW0F+SA2bfN7B9uY7eZ7JWHEcGw2xe2KMmz1mtPCtZih2ZH8uQVGe6gt7m1QV1jknzuvg6CWT+eTMANNF6M0mrlkIK/CoTR+gtg4S1THrPBqg9bMGjkd9rE0qV7f4cyalayHIMSKQWFkSBAkbJrS4gUjGd5e/hvHwz+kw1WAMv56O49DZIKutICZyvvqv/e2yD4daUJqYT6h0YgEfqECNAPKuBkBrd3av8rlEt90rQk/P4n0WInL7Iuj+gySzEjq29WENfWLhXMzitgJv2F9jMi1oPzTZmBux7lAo9rxmuuI2osx5YvtOS0Hm8wwRV2jIVc+SWe9SAlTrnplr4LLR+ER3TjS8vb8kYnr1URlQnh8ahxpDOegGUjevA/LVXXjrtEgm826UjUM7eiQn2bdamiS8vnCR7x1crKbcHqgZnrGTpRie1ITcYMqgdazp8R3ith2jeX0T0pTCjVsDU6KcuPqm/OR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHdiUCsybDlnU3U1dE5NTDE1QUhHcStEVUdYY0pYbXFRNStGZmloZFRFcXpF?=
 =?utf-8?B?UXprZlM0SkQ2VER2U0t2L1ZqaWdiUk9VQTlkU0hpMm1RcVRKdUtMV3FoMXpL?=
 =?utf-8?B?cTNPclVlcjF4cWx1SlNNaUh1SERLSkMxR05uM0ZZTURMWnBaeU9wQllGLzFz?=
 =?utf-8?B?Rnd5Q1hmVnpocFE1YjdKekVLZE5FY3pXb1laL2ZXSjN4MEZELys3QWU0cis2?=
 =?utf-8?B?SUw4a1UyRitkVEhGNWUxOFl6aFRrc3JHR0Z4Rk9NVXpENHM1a05jZmQ3V3JT?=
 =?utf-8?B?OTh1bU8vRUxlRHh3cktnbEUyV2NPVmFsWjd2TGplWWs1NGp5MmpxUm5KelNM?=
 =?utf-8?B?dEFTWDVxY0R6ZDlJYTJEeFhnNVBCRUYvREdkaHhmNnJrQlozY0NlUTh3MGFS?=
 =?utf-8?B?VUp5K2NqaEd0bVVRRFpTWkNacHBIbjZXZndIeFlhSW5lUlhKSjJaVlliN2hV?=
 =?utf-8?B?OVZCdU5JenhUWThVTVpWVDNCWFBIWGk3TFRuSkkyMFNTTXpDZDQ2cEJ3bmV5?=
 =?utf-8?B?THUrWWtBd3J6R0dwMkNQYTlLaGx5cElCVVZQRVlucmZYY01UT2ozamg5Z0xG?=
 =?utf-8?B?RG52bFFURGJNUkREd2dWRFpocFFqa1lYRE1ucUIzUDZOckhpWldsY3ljaGJV?=
 =?utf-8?B?OHJrVEdLQ1NQZDByU044bmFFQkxHNHpVU0thazdubGg4OElCR3BYRWFkRXNB?=
 =?utf-8?B?eW15MXk5S1VmTHVVak5zT091RlVxeGkvWmNVRWxKdkwzRDk2aW9XZmhPeTZK?=
 =?utf-8?B?bXFnT3c2NmZlM3NFcFJFUlVXMUhZM2hMTURFNHNkelRaZmEvbUtMV3ZUcFZI?=
 =?utf-8?B?VVRRUzY5ekJteHVHL1c5dlFLc1RmNjBtcFlYMDVBVy82b0hPemtlWXJJbjdD?=
 =?utf-8?B?R3UrbXJDYk1HY0g1Y1JRWlBXTWVTNjREZWcwL1VnTEtqY3crUTdqQVltTE5E?=
 =?utf-8?B?bUdVcWJPM2pUOW9leWZxOExzNThOcVMxT1A0T3RxL2lRMUtWbVpBRkVHenBk?=
 =?utf-8?B?QTNqY2tnSDVUODJQVitTaEpwdHM0SS9SLzk4VElvNkovZE4wZW5NTzQ3NFRx?=
 =?utf-8?B?LytLWjF6UWEwMTY2WitlQUtHWmx1RmlRd085alIzV3NQT0VLNGN4cXErSXVG?=
 =?utf-8?B?M3ZGZjdIaTNGK2pRTm1jNGxNK2ExQldiY1ptbW52cmNqTnk0ZVZoMWRFeUhC?=
 =?utf-8?B?K1R3dTkyazAzQVk4T2hBK2RIUnVyTnE0ZGZVWkU2YzRvekUyMUt6RnpveUQr?=
 =?utf-8?B?cm45aEtyYmdMZHU2dEVlUHNseXNMNGw3OUhPRngzbmZwUmZCblV3SjNMYUNm?=
 =?utf-8?B?YW9iamk4dTkwTDNBN1JMTmtkSzVIOUNCbm1CK2FlazdNK1lhYVJPbm5DNHF4?=
 =?utf-8?B?Vit2UkhPdU1Dc0lBRlZwbVVDWXpTS2hUbUJ0ZlBpRnUybndLOFdxRDBqOG5W?=
 =?utf-8?B?aDgzUVNhK212SE1acUpRRFZrQWdsRzg1dnljTjhOVUIzSmY2SUJRYkduSFBI?=
 =?utf-8?B?eExEYlh5OTRocEJkU2I1bWtXNXA3K0EveGowWURUNGIzelo5S0hFNUE3T2ty?=
 =?utf-8?B?LzhFWU5UU2FLL2prdm53ZSt3Z2FYU1o4Njd3TWFGS3JzOW03akxMRVZaTDQ4?=
 =?utf-8?B?UCtPUFB3bTJJelpHdG5rRkJtRWR1V2oyK3Naak85TVhzMm9Jbk1mSGlMK3Vi?=
 =?utf-8?B?SHRSYzRFTldYb1hjc1lEZTNSSTRWWGxDTWNXTWx0K29FeHZKS0tWcTZmVTdQ?=
 =?utf-8?B?SDJtQlYwSmlhRHlVZ1ZtWXVVMFVDOUl4RVdIcC8wRndLZmJxb041cWtjYzd4?=
 =?utf-8?B?eDFybUhxVlZLaWVqUFBveHZDMFJ5N3JRSWphN001MTFSek9rWHIxSVQwNnRO?=
 =?utf-8?B?eWhuYi9lSG5qRkh6eGtzeE1oelZoMG9lb0dmMTJMSXZlL2pseFdHUjdGUjFk?=
 =?utf-8?B?Z0dUdEMxalhMWUp2cEZoamhrR1VXNU9DakVqK1Zwbkw1VklRUzBWMkdrRGlE?=
 =?utf-8?B?WmlWc3dKZGVtcm9MU21jMWtQYlBDT0hjeGxMRy9BTHA4SEhtTjdKUlUxSVZn?=
 =?utf-8?B?a3Yxb3JKRjdSSFVnMWNTeUlma010bXFkd3owM2xuaDNKdjZrRVhhbjhpV3hl?=
 =?utf-8?B?ZUJNdXZLN3BBcjhROUZ2ZmJZelA2VThKK2E4Qmx1V01HV3AzVlNkd3VWbUpp?=
 =?utf-8?B?UVZad0ZjQWduMTV4RHcrRmhaemU5TnAwaUF6dWNHMTNDbWx1eHkxQkxXNmlJ?=
 =?utf-8?B?Y2dwMkhVNkpTM3FDYXh5V2ZhVCtvcUNVZ0Iyd3lTZW1pSlV4RG5XYnAxSDdF?=
 =?utf-8?B?ZDJkODA1UzRxUWJQTEZXMldjMnhRaUZyTGVHNWFORkE2UXNMWlVlT1BHOHFP?=
 =?utf-8?Q?CApCK0dCNmEJ+7cpqMWvOt5IzATFiOm1DDnfg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a44eb56-2b76-4f33-0484-08dec018db6e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:03:32.8259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HpnKAuQZ86hd65qJDvRe4tpCSsLN9+m717KEkU/T8PdQPbXw1mehaHorAl2zsfvR/EeTLZf3Hr4M9cF9F1JaK3MrZZgyCr9InN6yBZrHmOHMk0rI2T4QV7mmZIuNyVRD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6822

From: Frank Li <Frank.Li@nxp.com>


On Mon, 25 May 2026 13:39:23 +0800, Peng Fan (OSS) wrote:
> Misc fixes when reading the ele driver, including check condition, size
> mismatch and etc. More information could be found in each patch commit
> log.

Applied, thanks!

[1/7] firmware: imx: ele: Correct check condition in se_if_rx_callback
      commit: affeaaa41902fd1a6725c1d0cf3bdd32d78473c4
[2/7] firmware: imx: ele: Correct ele_fw_authenticate API
      commit: a3e16ecfa7a19205323ca2b055aaaaba8d375320
[3/7] firmware: imx: ele: Bypass memcpy when ele_get_info() fails
      commit: dbbf3f2e2806b910fab25d44db892dce81daa45d
[4/7] firmware: imx: ele: simplify SoC device registration
      commit: 1c140aa865f91ed8e6b2d5105adae81742b41971
[5/7] firmware: imx: ele: Correct check_hdr_exception_for_sz
      commit: 1065132b2bb3de722c44b1181e2b613238f62a9d
[6/7] firmware: imx: ele: Use dev_err for error report
      commit: c0b4f6fbaa3d36824718f10ccc0d7b3cf765eb32
[7/7] firmware: imx: ele: Fix debug dump size handling
      commit: 406d072598536b03078dbccf54009a2faa3d6108

squash to previous patches.

Frank

Best regards,
--
Frank Li <Frank.Li@nxp.com>
