Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069A627FD4B
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 17:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135977; cv=fail; b=ZJN3cBci3QJvV9xWfHnXOHl5utgb0XtSnOjKKK+Vs4DR1YpxU5tz0u3z5lnFPsxcjow1FK7aCLhnjBu7gqR2X/5Nunpf8MhHWa2VyGu0hwUPliGaG3x4tHs4D3OX1JXJl7+yOmzDCSj5HrjAgbC408BGKaGl8azOZPjWPfGuSdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135977; c=relaxed/simple;
	bh=qFK0plXMGZeEwO58GovBdmgPrNSBUnGg0400x9/66po=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hKBncZG+0rXDOqUzUOMSpCZx76Ts7lwVpV/Pifq67oHujogAdqUNeOdxjCRHtBo6bhkOIU1HO11F5woFmRoQV1fjJ/uw6nyJmJMHwJTPTKkllnu7Y2MmG+O6MjVo4/gxZfnh3K4S//A3pW/YVzZhQuIKfa6wPs6cCNSleix3E5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ra24TXIi; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ra24TXIi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlROn/y4j2DvjC6ansjUhzz6r+HK0z1L9TrUxYEK+0OwnxMQYA1F440J46ysUZEovsZ1iusIwcFHBm2PQm3wDAZkZ6hBO1udUVJLyj7Ae1Xd+mgu6GDJH9josSq+7bvZNoRH9+ncZVQAdMixka/wmk8nxkFdL3mbxctoTUtoIZg4nfxe4X1VA/QChEMJboaBVoCVd25fhxo1jzpr5nV6i7V4+Fduoxs+/YCGA2cYiBh1n9d7X9VeFQa0wwyv8D16dRdcjaBRe55g87fSPeagBBwuuh+u1xsSzqMqq0jFPjWN+Zq/ct/EXEi+nZeyhlKvOIz8Sz9+bYg4N/z2G5yZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5X/kLyhIC8FRuxbF8JOVchdoo3MknI8m6BHKKPAGhY=;
 b=RSKTprCrW9b8mKbDuIIw9d8HRROn7Vja061NOFYXGsADUJ1QmWYHp0ig/aQOaBQDsehO/s1NedfYYsHyUazyxCzsAxPMsn19I9r8upFkiz7El0O5SsfHFXI+SfJYLw5BVVZg3QXAiVV1WHiD/HykTTcpyYoPoMJ4UZGWYiS77Num+RRVh6T1YvI7ikCrFAH7TW0u7yVlrHKpumStl4+NPsq0AL3vIBtEbhwJIiIZjnR6izw7qxq9Ax/EeYo2CGexvxCLT74XIcLZA9+iJvuoUzkTYWdZGg/xMW4U9bF38GkyvyQEBeuAOnmh6HVnnFwkie8l3HmgwMawtW0aKpnz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5X/kLyhIC8FRuxbF8JOVchdoo3MknI8m6BHKKPAGhY=;
 b=ra24TXIi5UdvCBqyO/cmIgnnF9nAnxIl+DGREZWtqdfT7M/2ALPhNCkmqB6XlsWBr9Xytjxvq/Q8s9iMkB/0kWW5QbgDiIK53nApL90gUJyKSCJD793/F4ic9plXk2twfl3ZovLchjoRP/QOIbrTwAnc7P/Oc/FoExtsDZbe5RwPPk10LVfvkP4Sr4ZdR/k7w6P476JyhoRFpSh5oR/3uW72DMPoWIPuYHzGMW04P9E+OHoGe5QOzztHVmjX67R5WjirIDFhPkDYreyNTJ2H/CToxzuVLJRgNYFbQQCk9ey7VnvnpxcEgXOoGsULD/TS54aHYAM5gwTUYFmXWVXlRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI0PR04MB10509.eurprd04.prod.outlook.com (2603:10a6:800:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 17:19:30 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 17:19:30 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 15 Jul 2026 23:39:10 +0530
Subject: [PATCH v27 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx-se-if-v27-4-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
In-Reply-To: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784138954; l=13572;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=Xe3v8bx5NZDmba65ikPAgiMjQenzZMQT205wYryIx3Q=;
 b=t20r7ppHexpVPeVDmlxGRRkIVedoaF76dAmusairkDEnf9ruLddeNI0F81CIQWJNdIORz6O3c
 Szof1aFtnECCZbv0ZmQ6mQ4yzNEaWXneQ4DqE6tWpmTLjayWFfkW5ff
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0362.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::19) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI0PR04MB10509:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ea2ee3-5ab0-4bc7-eea6-08dee2953b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|10067099003|921020|3023799007|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OCJCQGuWuTVtFcmxW9zhxgatapH9Cl+mj+N0PfNJAHlprhL43x733eGNNfFl9FcHGaR2aptqdQ3Mm+QxxGRzYeW9tTy2M3RIUCBMxZ9NSeAafub2oTLapiFn0Puz3TH32nha9PFtuXSn6r16Fe8Ipgb0rH8SwUNlgvaInZhPIyhMr1tBrr9WIGo6Ru1P/mQZWjgL+iWvKCt/AqByMbzjc3QbzbT3YZrHrLBpM8+kwBOI8T+702nXb+PhKInBuIZvTleP9W2ijxxdwN4vYt6pFp6SsKyScgoPQgbuiMuRpbNqgEr32rqNQxZgM8mIghvQTNaLFMk2YIJyOqVhOyZ3kVmZl6tSu4Q5ljovq84qdv0T7u9jqKBxi9Hu5K36sSdgcdnFp5P1z4XFTsl0AsxaUPm2sbQajmKmFPUu0acpiePpSuR9NQzm1ODYePTzIlR49ilKrYjeVRuDHpOFXDpktbI9Z5sVdobl7MyN3Ix9WIc9zUzpdOdB9UzFgBl3kxA1RdffyNcqPFMzSssoVSVbtSRzG1zcpZNmp0YQ1CpJsIsQ2zigslbEzZLHf0rySPMaZqo1qfoN/UHafD8/iQb7CxUfTMfxtldGygllyqLx7clZPjHEw3Z6Xbfjme/DdFQZUafdPqtSo61rDaW+g5zjS2yHWHlt0sNNH89Bw7HOrIdewV0YtGwT51lid77x58xH19+J1Zoe8DP/vxlw4pZFSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(921020)(3023799007)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TlBTK0JLL2VuazR4OG5DUzZXN3ZrQ2FZZ1Iwak15a3lPNVB1M3dMTjNJR0hQ?=
 =?utf-8?B?VU1yOWt5L2dyK2l1ZkVYUVVHeXdzZy8wV2E5R3pURE01bzZ5elE1SWNtRzVz?=
 =?utf-8?B?RU9Fd2tOb1VkeGl2bUtCbUJvei83YUJ4UmZxcHdKK0ZVcUZmeFMreGYwVW1v?=
 =?utf-8?B?ZjhuaWFIQ055eFBjZGRvSE1WL1EyR0YvVzFFbGVsMDd2Z2tqS3BWWW0vQjUx?=
 =?utf-8?B?QWg1c2lJbkFnR1NTT0tVdmxqUkRnSWZGWU5xa2N0UytxRHVqalhHZjVEQlBn?=
 =?utf-8?B?cHB5dGk1Nm00VjEyU1ZteXYzN0RoQUhKM3VpR2F3ZWZXT0VQemRJVVVkYzVN?=
 =?utf-8?B?cVdReXV6SWNWcXZKWFJYMUtUVzZ5Z1ZtbTRYbnpZdDdjc3g3M3hiZ1dOeTlp?=
 =?utf-8?B?Y3Zha0FTdnZpZkk0TFgyZmdsejFmSkhPMFdZZVJIc2J5Nm5yUGhZei95S0hO?=
 =?utf-8?B?cW9IN1BzUCtzay9iNmFsdDBVRklhWERtRzJYWCtQKytGbSs4MGc4NlFvNVcx?=
 =?utf-8?B?ZGtuSnVGb2hYZjRyc3dZU1lJamwyNlhrTGlIcTlFNTBhNDNxK1ZUNWRNNUlH?=
 =?utf-8?B?aG9JNGZ4b2Z5QTg0N1lWWGUxMDFzMW5NcytlTjdIWHNWVXh3ckE5dFpib0k5?=
 =?utf-8?B?Vk4rTUsrTUU4RlM4MDM4eStLOVNwckg5WjEycVZKMjdJaThHcUZwTUNUS3I4?=
 =?utf-8?B?ZFp0RUxXdXA2ZGJWY2VNYWJmeCtOcWgxVzIwWk9qTGxhTUFDd2lGdGx4Unlq?=
 =?utf-8?B?RllydHVXM1ZiMjh4M3lsdld2ZTV4WElITTNpdUVrdFR4S2VQc1hkYjdLejRJ?=
 =?utf-8?B?SjV3R2RyUVBkci9oTmU5bTVUZ3RKRmUyZ2NuTXNsdjBFaDBtQTV1TVZwTkJt?=
 =?utf-8?B?ZHY2Y2lBKzhMWG1EQk5hbFBSaTM3K3NGU0lNRyt4MHFQMXVwdzZlTkJLSXdB?=
 =?utf-8?B?RmdEZHA0bjRFSElwWGsrWmMvdWpqSlV0MStDaEk2WG83RXJKU08zNHRvT25J?=
 =?utf-8?B?aXBQa0dvZFdmK1dob1BINDhqQlFuS0NEaWl2R2tIZjZwSTF6REk0KzQ5alN2?=
 =?utf-8?B?Q2hqVm9uRVlaeTVEcytVcWJUc3E1eit4b05qazdMYW9EMUhURElaUnFYQkFP?=
 =?utf-8?B?TXoyd0YzeEQ0dUd4Yjg3Nmo0YTFwaTcxQXoyekpwSXVHVmJocS93dzVhQmov?=
 =?utf-8?B?cG9PbW9pak9uTHVOeTcyeHZLWE1SQUdwcWdaVkgvQy9LUVQ2elZ0UWJ1Z1lT?=
 =?utf-8?B?N3RDL0tRS0Z3WStla1JWUjFzVmdHeThVOS9XT0hGZTc2TVpIOGF3ck43WDBP?=
 =?utf-8?B?K0J1UXhlTTFKa015UXJZNWlJZDFKbEhEYkpMckpjNVZIUEdnNWpZKzBDMnhT?=
 =?utf-8?B?eHpVUlkvZ29aQ05yMTF3anFIb0tzcDNLWE9ITDJQOUpPcWhjSDZoUGY3TWUy?=
 =?utf-8?B?REhQZUtOWktYMjRxUlpyYUlXR09zZS9Fd2p6cU8vMVY5MTlNOXRYK2wzV2Qx?=
 =?utf-8?B?Tm1jWG9rZ3NMNjBDVDh3ekVXU01GMmxnNSs5dXNXRWJDc0k4cEtUdk9ndCsz?=
 =?utf-8?B?cDlWeE0xRkFBV1pWWndVNktzeit5TEVZc2syMjNhcmwweXZPZUN5ZVB2Y3Ez?=
 =?utf-8?B?ajBvVDRVdzQ2NVpVb2hPTHJrYWNyYk0zNUE0R0tFOXhzdUlTRU9UYUJSdEts?=
 =?utf-8?B?eFo2a082ZVJ1aUorTHBzMk5YT1RPUXFVQytQbzlIWERNWnFYK0tuVUQvMEJB?=
 =?utf-8?B?NE9sZHBJeVdWVStlNlBCcFlrWHgvYUZCRHhoSmJDWEVhc0tyMzhOV0ZTckla?=
 =?utf-8?B?d0c5MEh0T09XTHp0WVMzdTB0UzRwWGdYQ0xXcU5zbGF2MkxkUVNjWGpsOGtY?=
 =?utf-8?B?dTN2MDF0Y1p4OURndU5ldHltOGJGN2Q1S010NU01eXo2UlB6ank2NWJ3bTZS?=
 =?utf-8?B?Sm5SOXpOdjFUTkNVbUs2ZUdwY09nRVdVczJ6Qy8ycVJxNmFNdVhBZnFFMEd1?=
 =?utf-8?B?TkNYSis0RzJVYW5uK2UrUU1NV3J0K0F2QVcvLytKajFabGVNczFqMmFLbkJj?=
 =?utf-8?B?SnRHMUluRTZUMjhxQXFIY3FqeUFYYlpCNlI1NWZuWEhJMGtBZlFHS2hnc0JI?=
 =?utf-8?B?Rit3RW1lTjdZZi9pV2VvS2JFb0dZNnNrZHd3L0V4ZDltWDdEb1dWRklBdXQx?=
 =?utf-8?B?bC9HUlhidEtMMEttd2I5RWVMRkY1bmZoUDYyUGxPTHFDdm1ra2NKZWd2Y041?=
 =?utf-8?B?K01ZczIyRkFvRlYzNzI1TktNQ0FFNFFPMFNRUW1TYm9IVXVYNEJTTlNtVGoz?=
 =?utf-8?B?QkJnNkFPMlV4aTVJS2hGTkY1QmZ4N2JTYTA3OHUxNy9JVEo0ZWExQnFMT1pN?=
 =?utf-8?Q?+YuafYDmu8drm1ceuFneCNyJ1Hy3ms4Nm6cPZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ea2ee3-5ab0-4bc7-eea6-08dee2953b45
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:19:30.6709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6tsgpaU5b3phNC1z8glYwiUcrrwAPZbqy4+rczK5KbNa0ttmIPkuqtTvkIupC/eM4CxM+LSOD/LQBtr0+BKzLQJ26UNxDgcxtCmYx+2IiykGH7RLX80kyNjZE4ykJui
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10509

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
No Changes: Comments disposition as follows:

Sashiko reported 3 pre-existing issues while reviewing patch 4/7.

1. ele_msg_send() failure leaves dangling rx_msg
   Status: Fixed.
   fixed in patch 3/7: common clear_waiter path clears waiter state under lock.

2. ele_service_swap() truncates 64-bit address.
   Status: Fixed.
   fixed in patch 3/7: dma_addr_t, upper-32-bit validation, and reserved-memory
   design.

3. dmam_alloc_coherent() double-free
   Status: Fixed.
   Fixed in patch 3/7: Manual dmam_free_coherent() for the IMEM buffer
   has been removed from probe cleanup.
---
 drivers/firmware/imx/ele_base_msg.c | 14 +++++-----
 drivers/firmware/imx/ele_common.c   | 52 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 42 ++++++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++++
 5 files changed, 91 insertions(+), 34 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 997854e10e14..fcd2bcaeefc8 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -57,8 +57,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
 
@@ -104,8 +104,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -155,7 +155,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!tx_msg->data[4])
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -203,7 +203,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -241,7 +241,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 3f5f78df49b5..955b7409ff9f 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,8 +42,9 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
 	unsigned long flags;
@@ -65,7 +66,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 			 * after the protocol transaction is brought back to a
 			 * synchronized state.
 			 */
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
+			if (READ_ONCE(priv->waiting_rsp_clbk_hdl.dev_ctx)) {
 				WRITE_ONCE(se_clbk_hdl->signal_rcvd, true);
 				wait_uninterruptible = true;
 				continue;
@@ -106,7 +107,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -118,15 +119,16 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -134,27 +136,29 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	unsigned long flags;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
 	if (atomic_read(&priv->fw_busy)) {
-		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		goto clear_waiter;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		/*
@@ -167,11 +171,13 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
 
 clear_waiter:
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
@@ -222,7 +228,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -236,8 +242,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -257,8 +263,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
@@ -284,8 +290,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			dev_info(dev, "ELE responded (late), recovery FW available.");
 			return;
 		}
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -305,8 +311,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 		if (sz_mismatch)
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
 				(header->size << 2), exp_rx_msg_sz);
 	} else {
 		dev_err(dev, "Failed to select a device for message: %.8x\n",
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 0365759fdd12..6c419e5c4404 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 7cb98a373334..25f9cd5441f9 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -197,6 +197,36 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	const char *err_str = "Failed to allocate memory";
+	struct se_if_device_ctx *dev_ctx;
+	int ret = -ENOMEM;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+
+	if (!dev_ctx)
+		return ret;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname)
+		goto exit;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return ret;
+exit:
+	*new_dev_ctx = NULL;
+
+	kfree(dev_ctx->devname);
+	kfree(dev_ctx);
+	return dev_err_probe(priv->dev, ret, "%s", err_str);
+}
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -253,6 +283,12 @@ static void se_if_probe_cleanup(void *plat_dev)
 	of_reserved_mem_device_release(dev);
 
 	dev_set_drvdata(dev, NULL);
+
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+		priv->priv_dev_ctx = NULL;
+	}
 	kfree(priv);
 }
 
@@ -319,6 +355,12 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index b6833abd81d0..355d38684b1b 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -20,6 +20,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -44,6 +45,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -105,6 +112,8 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

