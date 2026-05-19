Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB98848033C
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189228; cv=fail; b=qpdUwamBvivkUgeVMUUMAoTzr6ujtinOb0KjlO4dkyboibJyVx4EEkgI5egNXFb7pYm9RhqXAtX+kjd3M4jLiAvdbMrUsa6BXD8QK07EJsJn0ZLXlOAjJMsptPI9a5Oo/KdFDpQS9Pmit1oRmR1gpgma2+d8tIhs3sh8yzSRn5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189228; c=relaxed/simple;
	bh=hQIozGuP72Y46JgsqpUIUz3X5Xs+NSYVPc/tcZmCtXo=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=QWh5YWwJZmt7mfiGE3pSSLm4F3F7yrwb5ueXkYMctK2X9faWg4QkS4V91cZ2+ZwnILlLyDgyxblRLxloSVPBrcJwyySX3RVZLkefa18aG14Vrv9C5xaJqaMAPQyi3jehB7UuJ4C8ExnpHD/IltPS5g0F9YRqZ1aCVCZLInZTPy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jETVxXrU; arc=fail smtp.client-ip=40.107.159.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jETVxXrU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neKkCdWb9gsuqNmudKv34gdFMRwtb4FAy+JdtHH9aa1Jv92gIpBNGGhWT6MxsSeyTtD7ZFrKUHYJtNDKGhIwZwe299o/pu6HIALktn6l5rx5n2ONP0XlheKk3MKg3Cy3P0hU1UVDBSiQuNHkWgDNyapozl0ecJYogES7cbrkR+kufIYeFfSN7piK4e1WkH0oNrMhJK4tGFDdlRXoVllEKCBI68uBPzioDawQJbYEDBCpd0uHGUjnAfVqYwjGevMBdVA83g82h1LHoY9I56KA//WCIdbMaZBznhU/1WJubFT/gwmN5F91a/T5L49bX3ca4i9DevJiBX8yOPDOyJtlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdh3CjzuGSJEHNx0OU17jXPF/ORsSBQDgIZTXXSRpls=;
 b=ouhYN9BfVgKM8NkrFMs5XocVAfWnbo8MVTXH0JMSTB0er6lrO5IJJiiGq8qFNBMCCNyMM8KEDZF5n/hcsRL03xaxkc0ljipgj8u89FAw1+1KVWcPBOu3DoJ1837FXZg+yjiquD8C6+kWfDAi37hVzw+5VymtmdJDpFw9cx8DyIwgkSsyY4oy7NJsMxwjnWkVN9I55Pqbvcesycn0op/5m0kAaKxoyxxFljlyWQb1XFsy3jb2/rcSLQjlc2MkKC19VmK2TbdWxIs90B/Xn6cVDGQtfKG2jJFXEXFX3yGPa7UhRxzIN/3TgeBvmFXjEcR1+W5BnyaVcwR2q2N8w+0mEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdh3CjzuGSJEHNx0OU17jXPF/ORsSBQDgIZTXXSRpls=;
 b=jETVxXrUxdEQiA+79dky5fdynpkkLy45di4mnSUGzsJWBxEfWPgx3QLAlpQ++kwk5BVwYBGUXzmUyqUcu59x3BgNkRdk5AkKlwMuN+8e9KBOfDFoeI3WWlDlCr3n4R7jGY+YJ2KdjMxviRK8DXFhPnwVlsrPIYNL61hrn4jsDbEUq3x6d+dpR/+ODPSNZPI7bjXMn+/M36/ZMVelyCM9/6glw1jxsOleCtiFV9SfMxi5rPlP6adGDpxRj7ZVnXrMs7TIcgo+c7o5KBpkuNGXK7n26FrymXBw3RsB2J72ccsosc6euL13AMej+GvXf6P5StNu+QGz6PbEPpWEqtTdiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com (2603:10a6:20b:ae::26)
 by DB9PR04MB10009.eurprd04.prod.outlook.com (2603:10a6:10:4ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 11:13:43 +0000
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69]) by AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 11:13:43 +0000
From: Joy Zou <joy.zou@nxp.com>
Subject: [PATCH 0/5] arm64: dts: imx91-11x11-evk/imx91-9x9-qsb: misc
 cleanups and improvements
Date: Tue, 19 May 2026 19:15:14 +0800
Message-Id: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENGDGoC/32NQQ6CMBBFr0Jm7Zi2UAuuvIdhQcsos4CWlhAM4
 e5WDuDyveS/v0OiyJTgXuwQaeXEfsogLwW4oZvehNxnBiXUTWjZoK2Qx62ROCeLPiyo69KaWhI
 pLSDPQqQXb2fy2WYeOC0+fs6HVf7sn9gqUaBzTWl7Yyqnuse0havzI7THcXwBU86mWq4AAAA=
X-Change-ID: 20260519-b4-imx91-qsb-opt-583b781ee250
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0352.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::16) To AM6PR04MB5765.eurprd04.prod.outlook.com
 (2603:10a6:20b:ae::26)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5765:EE_|DB9PR04MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fdaedb-d625-41a4-928b-08deb597b00f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|18002099003|56012099003|11063799006|38350700014|921020|3023799003;
X-Microsoft-Antispam-Message-Info:
	98ah0utQScVn7lkE3D6ud8lDLOi4AxFifA2QPqyV1Lv+uWqvkvp4Uz5r2m/g9sMLbFPP8jv/w4/3osxZhWAG7bplty+pu8QR/8Dbij5W+O2svSSYi/h4QpUAwFrmr85Lrd+FXwU8GVSdKg4RtV4YZ+SxbX2eaZhNVU4+u688Y45/vYX7jWrDwjAo81nnQ28HA1mpplueyReIy1v2LlAf517YYvz3TkQU2thK3PQU6/vk2VxH/OLtDECE+M2uIglTP0iOssfvoc1t6rxb6qy73NQFhAfzcxwBpA534tggrPrzfahNujsjR05wwfq/+eSGKW+EsXZcGv+3mjuUal4ouF8r7uqqIS3EXmGrKSM+EyJOMrJfRjpUXUiBHu2crfFarR39mIH1q8+5QwPc/tnvyYsJv2pRAPf3WR9J7qGnO96DZuxvk9bqzQE27L+2XpYV7KAK13+E3R23uXahV+umKMa78dQTe4eepAtV+DX/l8/+qa5l9J60hUK85MEmogcLhxywN4+bhh/SCtBR9kpWh/+UBWpUtD3zwe6z+zkxCE+QvEUP23cwI+OQnK+PvF54dfuimtbAOyqxHU3NcvAqLDUQ3rpsenI8o91ZTgHS9Hr0y37TNAbBzoQcKAN0Np60SSJ2xu12jc30k0rCaV+XaaN2HYYF5OFOqZxGcd+AFQ1rXux7oqDNmBvD2gm7HbwYgDk1VxwAHpbZ/lxQ4t0w5d265I0JFDU8KH+V2N1zYur8D7TndpJZaP81it7ZxPJK3polc4GvSK6llP6fkiaMRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5765.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(18002099003)(56012099003)(11063799006)(38350700014)(921020)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3QrejNBWFljWmZLR0dwWEJ5NjJrL0QrOWZBK2JDWEU3b2oyL0xSUHhjSHZm?=
 =?utf-8?B?T2FVVVlZdnozSVN5czcrek5CZk1xdTJ2MjlVcHNRaDVSRjkyeG1MZzFMUElO?=
 =?utf-8?B?R1VUZVB0aXhDeUl0d0UrTFN5WWhDQVRibmZMUUprUFlpMC8weWhRZzFzTUlX?=
 =?utf-8?B?dnBZMkdHWVl2VUwwbytPeGZVRFgyQlZ2RWJrbU10TVNHazgvc1d5bGhMS2Nt?=
 =?utf-8?B?MmZLR2JsaG01dGxJQytqM0FzYmJjUVdHRytYa3RFcVZhVW8xajdsNVN5SFc4?=
 =?utf-8?B?ZDlXQTZXNWlJNWVjL2FObjYyVHpGMFdEc0pXWENQdDRVUWZOVHErRTlVYS9Q?=
 =?utf-8?B?TDJ3c3A5S280TGZjOHIzSEFDWXBMRW9pd1ArRlVESEh1OFdNRklYc3gwbk1E?=
 =?utf-8?B?KzJhT3hkREp2WktQOUFMSlBnQWZmbXBqU3FpdHhYOVJhbVVxeHVrOVFnVGF6?=
 =?utf-8?B?UFNDbGVDZkpVWkpZTHJMYVdaSWhoK213NEVIL29QRHZsbG83SEltYnZNYS9H?=
 =?utf-8?B?cVc5cDlSUEQvTU43TDNpdEhWMTI3U2ppVy9QNEhVcFZLRmdTb0k2TXR4VWJL?=
 =?utf-8?B?YktlaWpxYWlPcTA2bkVKT3FFVU52cklOZXZSV1hYVkVvNFNTbVlZd1R6WDA0?=
 =?utf-8?B?Y01UZ3ZmdVdaM09WeXhTbmdsTmZkNk5YSkJFcXptSmJ6ek1aeW5iUlU4WEtz?=
 =?utf-8?B?K2loVWd5MU1ubkxUa2VNY2tITjdUME5GYW9vU3dkY2xiaHlvZmJNTjJSM2pZ?=
 =?utf-8?B?bXNBbmg0elREU0NnRDNNWFFJaVk5eE01aVJvUm81ZjlsaWh2ZEx2OS9zU2xh?=
 =?utf-8?B?RTNJTHlQSlZjNTlFVnlLckwxVmRkS1NTL1d6N0hjbjBtZStvbEhadi8vLytI?=
 =?utf-8?B?bEpFYndkNkppdVFVbEZFanpqVklRaElPa1RYMjY0ZUk5WFNtUGsybjA2MzBi?=
 =?utf-8?B?bmJZcndLNEwxdUdDU1krZVZpZ25FVHVYdEJDbW95dm9TR3hlc3JWZCtaRmdt?=
 =?utf-8?B?bk1vNUJWRkYwUjlIQ0xYbDdQZGh1ekY3QTY3eWhmcFFXOFhXSmdmYTRhWUhJ?=
 =?utf-8?B?cEU4dDRMcWc3RWE0S3FHUXU0OGI0SCtZcGdUS0tZRHcxem9TMHZ5L0NsZEJZ?=
 =?utf-8?B?RzRqekVTUWcrbTNoSjhpQXRhbHd5YzliWTVwQVJyK2tPeDE2eGhoSzVUUisx?=
 =?utf-8?B?S1h2ZXc0N3lsam5MQWp2WlBNeU1kdFg1MDE3TElhc3lEM0drNXhoYUVuRFRt?=
 =?utf-8?B?NEl0VGlsUDJRMGhBaDhrcXZ2UUx3UzVPaUNNMTV2bmVXOHhnay9oT1AzcXhl?=
 =?utf-8?B?UlZDUGEyS3BtUnBpUHVwS2lzRE5ubHlYbi9naTlaWWpabUdjVTFqeWlPcjBH?=
 =?utf-8?B?MDlsQnJWNEU1RSttc2xXT3hkWDRHRnpZMmRlS0JEZ2YvMTJIMXFBaEYzWlJ0?=
 =?utf-8?B?aGlFc2RESGY3SzFKUzhUS3l2R0JBdmhtdUI3WE8vMnF5cDR3alNsckNqaVJ2?=
 =?utf-8?B?ZkhxNVQ4Mnp0ZG9mYmNBejMyS3U5ZEJ1bXBGTlhzWi9ncEd5amg5Ui90NlYr?=
 =?utf-8?B?RDhyRlUvcTBLNDhpeWUvd0JxY0VLb3pYZ1ZuekNJUDFlWmFiOGdVT1AycWY4?=
 =?utf-8?B?YUxvamtZMjJ0MnVxTWtBYnF2dlozTEx5OXV4dzUrTTFEcnZlNEtDYlNxODZo?=
 =?utf-8?B?ZERtM3kybkFCK0xWd1E4T3pIUkpuQ3ZiaWJKV1VFKzNNMXRCU1hGT2tzK3pZ?=
 =?utf-8?B?bURadjRNcDdkVXZ0TGFrS1Z2RnNHZFFXTmROREcyQjR0ZlFDc1U5S3BKYVQy?=
 =?utf-8?B?SmhKUEhLdzFBNEpBY2JOOWJrSG5jVXBMMVRTZ1BwMTVHU2RPMmRVdGtVc3Ex?=
 =?utf-8?B?R2FQc2liY21OaFdidXlFVm9PMkVGNndDNWJCcGlaRlkzK2h4T21QeU0wRXpm?=
 =?utf-8?B?cDlLTWhIVkF1dU5nY1NQRXkydGpqQlZHQjJHNFFCSzhoRnZxb2NHYmVMS3FV?=
 =?utf-8?B?TWtiZkhjNjF6RWJXR3I0R0kvNWhCemUrRHZQV1g1dGdnS1kyblZrNjBBMUxi?=
 =?utf-8?B?bVM1T0ZBanRQb0hyYWZxeWdHbU1jWktUQXdYdEs5SEVnRkV5UWFTR2wxMkRZ?=
 =?utf-8?B?ZThveDBLMjFSTWVSemJGY0lrMHptaEFET0RWWFRYM0FzNFI5R0hlVElIVXVh?=
 =?utf-8?B?ODFTaFZtcG51aDFOb21QcjNpbDBzOFV1NVZua3pFTDJHTXAyMnZaWkhtUjNv?=
 =?utf-8?B?ZWJvZ0hQamE0azVEZmZ2Wk9VN1JqdkJpWGVXcUE2NyttZi9lTGhVWS9VZDRr?=
 =?utf-8?Q?rIEhoEvLgVL+nVNXjK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fdaedb-d625-41a4-928b-08deb597b00f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5765.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:13:43.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HlM3zvpVEtOIOhTVVze0tmRMs74uQJsw8pmnc1uU6zeJfxQuM3EnGh32eEaSXi0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10009

Remove unused clock-frequency property from mdio node for i.MX91 QSB.

Add watchdog pinctrl configuration for i.MX91 EVK and QSB to support
external reset output.

Add Ethernet PHY reset GPIO configuration for i.MX91 EVK and QSB to
ensure proper PHY initialization.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Joy Zou (5):
      arm64: dts: imx91-9x9-qsb: remove unused property clock-frequency from mdio node
      arm64: dts: imx91-9x9-qsb: add pinctrl for wdog3 reset
      arm64: dts: imx91-11x11-evk: add pinctrl for wdog3 reset
      arm64: dts: imx91-11x11-evk: add reset gpios for ethernet PHYs
      arm64: dts: imx91-9x9-qsb: add reset gpios for ethernet PHYs

 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts | 14 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts   | 12 +++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260519-b4-imx91-qsb-opt-583b781ee250

Best regards,
-- 
Joy Zou <joy.zou@nxp.com>

