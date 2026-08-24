Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70E377575
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 17:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787592824; cv=fail; b=XK3iQy/g4teoDlZhx7lH7JM+ErgcQhTzXiQEysvyHNb+tC1ul1MuBKe6V9KIr5d1Zh0WPNytRoURjV5mM7ETOyNTIMuo8q5zM5TK5ZNuShJy/8gC04/Sjx4eAaVuZlTfMbDvjpK9MIWGHNjeVFFcrLlEik3VVBR2n1XCUAkU8/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787592824; c=relaxed/simple;
	bh=nyeFFeMB0lRKAZDXtrFQ4DQrmbgq9h9ZArZLqEWq0i8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WcFJgy06GFZJJmz9jTjMtGUplSPCS2ojzc2UqKMkLZYkVxaJHW6uPJ8qtmvn4Os1CeBXbJyAwoOjo6sZtDZds2dp9yQkayAZxOo8fQ/8m2Nhfi8DRhSh8dWYmcNY+xkO2+HQ4oQDZfqGdQ/3kjF+TgSS+oEzasekwQdmV7YH9tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=j1Leb8U6; arc=fail smtp.client-ip=52.101.84.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="j1Leb8U6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npGzKA6YZ9W4oJhJ0AGKK7ucC9xuY4L4wIYEwrr5J6BI20o4XjPEd47ikVSr4joX5XMXngPedrK5sO4j6tEMFL2jG8ThZfCAAP6e6MC0T9p1YoJa0aoR/HfWYzbBypqP+emgBf6huUxdIk8777AEuzlQUth0iZx9mt5f1bCRQ2uc2eo7ZH4IhGw0B5bxDE/KpqWyIxjcW/pdF7J1Ndzusm56zlUVZ/b5elAXuB6YQOt/flIilDJ5UcO+jqqByvq4qVkbKv4sQJSZpPFSfz/LgNfQSe9VUuYBSs4O6/gERjj3/S6NbkCQBZpjYFty+AZYuWq8d761mRMzA+oeLfN3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPp90EA1L2s7GH30rZRW78CO+WqoGDBuIBgVvuhEgWY=;
 b=SC2NVqrdeK0VAH/gmIxdPEiX9yQrOD+wEDcCGjq4fIboqKkP448qLVbBs3JR3CbLHlN3xXGoz1MRsVqvxmCcl9++sFIzfqFoXm0s3OrxXvddfFutib4dSysJ8KB6XyEvj08sDFVGRyEH9pyj34EZj3h/6vI/pgxgPZKS/zyKHAq9HtgC9dEqMw1frz2PnTSU3+jLxxAghJc1vVk1a4NiTYFsk85WU7HJaKcjPKnblu2S0GE9u1kgX/vjJ1jYNnF3kKrY6+ZggflQH9KC4qQxxe8IyaJKt0+4Rryc+i8qugtvXl4T4NeDRfEsDFVClyJwFr6UCKwbCMhgjPj9zgerkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPp90EA1L2s7GH30rZRW78CO+WqoGDBuIBgVvuhEgWY=;
 b=j1Leb8U6Qa5q9pi+Euuar12mCHPeJstGCVOAyi1QkwoLql68wbFC4eEFFnWjiosGICQy8AbMaygJpM7n5DE1TqqoIlQOW+dKtGC8I/PeSEwntiHe0rJwKVIXiHtWWzJ6vNyePALrzLL4vhDr6Q33CbUFD4Q2nRqFu59JGAosnJM9rXXW0NwJoFUeMhvHCpFsn6FvInloz/ZH6RVpbFrKvhwY7n2ivI7xParSqVP2l/Lrbfoti0Ug9R3ZVYcJlNZR5YqwKM4iPoMHXM+A/MijItlL31VxkFWWM0F9qr3vZawVc01Aj66liTaF8ej6fb2q9oBBVB2TvKw2GHXbXf775g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMBPR04MB084187.eurprd04.prod.outlook.com (2603:10a6:20b:7de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 17:33:36 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 17:33:36 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 25 Aug 2026 04:33:36 +0530
Subject: [PATCH v42 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-imx-se-if-v42-4-2e8efac0bb16@nxp.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
In-Reply-To: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787612614; l=16271;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=zRqgrBevTt6NBXnztgN4et7RMZONMg3Y4ebGVbipChM=;
 b=5qzF6h0r1BIzrInTMxgMWI5AuiCEpDCnM16DKsn6mQ2EI9T/JhfySkZOLn4joLRyicLfvjz4Q
 BH1iMCEpmOBA4NAnYxmo8shkDIsaz8KOFhXR5uuaZPK0kRjjJCqtLIZ
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMBPR04MB084187:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e70b21-bf66-4f38-57f2-08df0205d40c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|23010399003|366016|921020|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tW6v5mjDZjFjeA0Ft1wLUCr7CLKBKFWvwnP75Jv+WTabL2FTtXrqFPtLUCUnKVnc+s8KEGhUOasmgLWnTgl1fAU0M+yOp3SX0fXpf1GK7DdOxnYA/gLS/L6nohOYwkOwBI2oMm3HRkA2Y9/aFuuX/Z2Ef7fW7oR1TxGFW+Vgx9xo4JTLWRDoP8J9feG7CxKjf22NaxWGsuIClllNrmr/ZyMvsRtAfXXFam2bbAbRpBK7gxDwuyEqAP0Y0d0X2AneqGFIM6jNo95eon5PZd3dXetKvDYKlH5mM9uFSuPpJUr56PxbIcPMhIipO7q6zXAVSuqNKNZffxP+a91iMZ7VGT8wTwgn1fZAOSo8wtg/hfY/GrHu5fwddM3ahHs3m0/CiXXiPcEZh2boZG5gZx2DS4+ODOI7YM3fkf6RkOwwda1MXx/vZjmgHnUa6CKViKz9Q0i2ATw3FRx+mJMx+y/SX+vAWpcG7tuhBQt1wc4Y0ROVFvMQoaE1Rweex4hObqns6+H2w19IkQiMkCn8+XqeVl6WY55bXPnN9dpU/eB/3T8SbrJYevIfFUaKYxYfNBnYraudB1yAuOhOY9x9pnzZU/qUdr6aGb0sJrDKv0pBztMit2MRGSRy/OugJVFmUJcXK0GqtG37zW13ldqnexsGQInT+7xvSnph9ggy+zR7aaqNjBgjDSIaBN26Fyq9qEMDwssbF7G4KtvxtwvIKINuWQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(23010399003)(366016)(921020)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1hXU2dOUkk5Q0ljUTkyYjZUQW85VGxFZXk3WkxrQWhZTHlVUmppMTJoWms0?=
 =?utf-8?B?R3pSVU1rMVk5WXh6T1lYNjVwSXJnazFjeWxnS2tXek4zRGlhdjhVMmtxQ1lF?=
 =?utf-8?B?RFJJQjR1a2diV2JNc1VZZ0k3SEgxU1hWWHVnT2JQb0o3Tlo4dzkreXlFYWF6?=
 =?utf-8?B?RnU1TkNCYktjQzVSU2ZNUHFXOU5KWE1Pd2JxdWlIM0ZOZnZRL3NHVThSZ0E4?=
 =?utf-8?B?ajJNcTRXNXNhcVpXcGdqNis0Tm1JL0JmSzNiZWtGV0VHWTJ6V3VsZ0pZaGt0?=
 =?utf-8?B?VlJ6elVuSTkzYTdlMVBqL2pEK1Iwb1hnbUkwclIvUnFZSHFTQWZqOWlpVE5h?=
 =?utf-8?B?amp3UUYzVTV3RE9YUS8wWXVHOFIrYWtMMGJmall6REhYK1dkSkRSRkJtaHpH?=
 =?utf-8?B?TVJwekJmT1RhdTNSMnB0NGthSUd5VHdmYkkyVG5BS3FCME85dFU1cDh3RHZN?=
 =?utf-8?B?eEF5azRESjNXUlJWM1dNSWp4UVg4MVdVL3hVbXZQS1dqclVhTVp3bTJGM2Fp?=
 =?utf-8?B?Qm81eWhJT1J6RGdzRll6UUdHLzJ4NVJiTmZVRy91cU44VmlJaXVqSHR1cTF6?=
 =?utf-8?B?TnNKcWhhYXpJNDVnanpWQ3JWbmo4NXVqQ2ErR1dZaW1lbHJsakpjZmJqcjBa?=
 =?utf-8?B?REVRaGFoNGl3U1p1R2NyWVhjRDJ0UVFWUFZEaEFPdDZ2QjgrcWJ4WEpLWHJn?=
 =?utf-8?B?VmRCVnhuN3FMc0hBR1RqRkltYmRLUmEvUjJwSW9nbVZxUm5ScTV2b0MvdFRH?=
 =?utf-8?B?UFJYMG05bVMxSmV5Q25kTTRycng5NmZ2WWNyb1NPeGtHQUJwNzJ0b0kyUnBj?=
 =?utf-8?B?Um93K2w0MTFPREhhUVNlMG1QVnVOS3lSa29OSk1oaDZJdFlLaTQxbEs1eXds?=
 =?utf-8?B?NWltemJLV1BGb1VmT0hwSE9RTlVUQTcwTjllUzA1c0UvalNObWdlZDR4cFo4?=
 =?utf-8?B?RmcxQnVJcXJhN0RJRVZ1OHNGRkdqdmxmaDJRMHNjU2wzYTQwbSs5cW9nK3Vy?=
 =?utf-8?B?T1JpUWlnN2cxVjJuV1R5YVptTW53cDRubFo0ZFMzYmFDa0dWb2NwYnpnUlp6?=
 =?utf-8?B?OVFZdm5CQjNiL2JOQXJVM2JJVFZxZVFjT3Z4d0l2YzlManBuQnBabjJJZ1Z3?=
 =?utf-8?B?dHdRSG9qM20rUkxaN2xmeXRIdG96RUF5eXlFaEIvWkhzejJpWUNmY25EVS9X?=
 =?utf-8?B?NHEyeW04MjN4bDdlS1ExRm5wZXFVR1lHYjhISEg2a0FONTVxSkxtT2tUdmNJ?=
 =?utf-8?B?OUZqWHZlbFNZKzh2Ylh4MHBBcjRINTFGM096N0dzTVB2STlwRHk2dHFnc0ln?=
 =?utf-8?B?Y3UwYlZLNVBmU3ByVUdpb1AvZEkyeElTOFI4MXI2VFhEVEd4VXBkbU9qTzhJ?=
 =?utf-8?B?cHczT0ZPWVE2T1RPMmtvS1ZJOGZheWpraEdMNlE1bkl0TlExUGhDM0tIUExL?=
 =?utf-8?B?Tm43aUpWeldLTk5ob1U2c1RkRHJGZTgzR2NmaUdyNVErMS92YjF4bW9zdW9a?=
 =?utf-8?B?MERZMERydHRhRnM4b3ZGaW5rWnQ3eXRtRE5MSTBJYlJYblNUTDgzRlZhbUVL?=
 =?utf-8?B?aUtGVSs1cnljNDhUelN1aUcvb0FubUFlT3BwMEI1NklwQjNFRENheGVZVmdi?=
 =?utf-8?B?MXowZjRKSmtKRVdXc3FUNG5LbEdoMEJTTVN5M3Q1VnNLVnd0ZjhWT0svTVB5?=
 =?utf-8?B?VHp4R0I4UTBZVlhENFIyWGtIWTNWQmN0bXFmNmVITW8rR3BVTU1zdVRYdnN0?=
 =?utf-8?B?ZkF4V0srVlNCR1JCZysyUXUwQ1dUajQ4T2pBUU9YZFVLQWxLL0hFSU5uMjFZ?=
 =?utf-8?B?R0R5b09tcElXb1pBM0wzM2h4OW5tT0JwbnRaSVU1ZnJrOFRqUzQvZkVqeXFG?=
 =?utf-8?B?UHB3dUdWcWx5bTJYWjlMbkUvSGRoUVBCOHBkUUU3NWVkM3Q0VmNjQlFZVVJi?=
 =?utf-8?B?QTBaMkk5anV1N1A5UjRuWm5EN3BTSTFickNPRUhuWFkrRUF2RUdQRDMrMlVQ?=
 =?utf-8?B?aEFrYzI0K25ya0lCWW5HaU4yTW5kbndJZ0hnTkpSMlYwcklXcDEyaHFHbGhu?=
 =?utf-8?B?M2VoaGhHNVJXa0VwTUV1S1RtSlNrL3c5ZVZwVmxscGNLVnZOSHcyN245SSsv?=
 =?utf-8?B?K2ZPS01NakZMMlZrcmFzTk1nUUtWeG5KaUFiTUVqQUR0RzVSbUtVMW9YQ25O?=
 =?utf-8?B?ckQ0cVZmOEpPUG8vZVZUZ1VZTlRRcGxwTkRDTDFXeXJ4RzdPQUlRUEM0U1Ez?=
 =?utf-8?B?a1I3bU0wLzBOVndVMlNQeHJIZVJ2TjdzQ3RUTXRpVGZiVTZreTdDeWx6YitT?=
 =?utf-8?B?WHJUbmpaRWZCbTlnUXhyR1hTWGxzdXJXMVRFNHFFNFJuTGtZaDBEd2w3MGRV?=
 =?utf-8?Q?KuKayhSV62UNp1Ui3kvNkpeq8Q9shjsU26Lde?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e70b21-bf66-4f38-57f2-08df0205d40c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 17:33:36.7182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O+c+pfvpCsYMLW4l2Fj9ULwnswtjRNXYz6Zz0XorFm3hUJujf7kibcikWzej7EgLDANPYgX9wI1q6ftuRezUNux1L/4cCsbi176c4Hu1VDyeBTZvhERPz5JWFbsSQavu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB084187

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v40 to v41

- init_misc_device_context(): drop the pointless err_str local variable
  and the redundant 'int ret = -ENOMEM' initialiser; return -ENOMEM
  directly in both OOM paths.  No message is printed for -ENOMEM as the
  MM subsystem already does that.

- se_if_probe(): drop the redundant error-code argument (%x) from the
  dev_err_probe() format string for the init_misc_device_context()
  failure path; dev_err_probe() already logs the error code.

- Add the mandatory trailing newline to every dev_err_probe() format
  string in se_ctrl.c that was missing one (seven call sites across
  get_se_soc_info(), se_if_request_channel(), and se_if_probe()).

- ele_msg_send(): add missing trailing newline to both dev_err()
  format strings.
---
 drivers/firmware/imx/ele_base_msg.c | 15 +++++----
 drivers/firmware/imx/ele_common.c   | 66 +++++++++++++++++++++++--------------
 drivers/firmware/imx/ele_common.h   |  8 ++---
 drivers/firmware/imx/se_ctrl.c      | 33 +++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++
 5 files changed, 95 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index a9a0fc16a553..d63dc4fbd4c8 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -82,8 +82,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
@@ -143,8 +144,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -201,7 +202,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -257,7 +258,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -305,7 +306,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 74cdac45231c..f7a6df5ea582 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -47,7 +47,7 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 
 /**
  * ele_msg_rcv() - wait for a response from the secure enclave.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE dev context data.
  * @se_clbk_hdl: callback handle whose completion will be signaled when the
  *               response arrives.
  *
@@ -60,8 +60,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
  * Return: number of bytes received on success, negative errno on error
  * (e.g. -ETIMEDOUT, -ERESTARTSYS).
  */
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
@@ -150,7 +151,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 /**
  * ele_msg_send() - send a message to the secure enclave over the mailbox.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE device context.
  * @tx_msg: buffer containing the message to send.
  * @tx_msg_sz: size of @tx_msg in bytes; must match the size field in the
  *             message header.
@@ -161,7 +162,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
  *
  * Return: @tx_msg_sz on success, negative errno on error.
  */
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -173,9 +174,9 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
@@ -185,9 +186,10 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
 	 * the caller-owned buffer may be released after a successful send.
 	 */
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.\n", dev_ctx->devname);
 		return err;
 	}
 
@@ -199,6 +201,7 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
@@ -206,7 +209,7 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 
 /**
  * ele_msg_send_rcv() - send a command and wait for the response.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the dev_ctx data.
  * @tx_msg: buffer containing the command message to send.
  * @tx_msg_sz: size of @tx_msg in bytes.
  * @rx_msg: caller-provided buffer to receive the response into.
@@ -219,32 +222,34 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
  *
  * Return: number of bytes received on success, negative errno on error.
  */
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
 	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0) {
 		ele_msg_send_rcv_cleanup(priv);
 		return err;
 	}
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		/*
@@ -255,7 +260,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -290,6 +296,11 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	/*
+	 * devname_snap: a local copy of dev_ctx->devname taken while
+	 * clbk_rx_lock is held.
+	 */
+	char devname_snap[32];
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -313,7 +324,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -327,8 +338,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.\n",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.\n",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -343,13 +354,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
 		 */
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, MAX_NVM_MSG_LEN);
+		strscpy(devname_snap, se_clbk_hdl->dev_ctx->devname,
+			sizeof(devname_snap));
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				devname_snap, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
@@ -371,8 +384,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.\n",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.\n",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -384,14 +397,17 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			sz_mismatch = true;
 
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
+		/* Snapshot devname before complete() can free the context. */
+		strscpy(devname_snap, se_clbk_hdl->dev_ctx->devname,
+			sizeof(devname_snap));
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 
 		if (sz_mismatch)
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				devname_snap, *(u32 *)header,
 				(header->size << 2), exp_rx_msg_sz);
 	} else {
 		dev_err(dev, "Failed to select a device for message: %.8x\n",
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 7bf2febefc45..07e6b6a1bafa 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -16,12 +16,12 @@
 
 int se_update_msg_chksum(u32 *msg, u32 msg_len);
 
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
index 9e3f81a9a272..0792e5152436 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -293,6 +293,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return 0;
+}
+
 static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 				 struct mbox_client *cl, const char *name)
 {
@@ -337,6 +360,11 @@ static void se_if_probe_cleanup(void *plat_dev)
 
 	dev_set_drvdata(dev, NULL);
 
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	kfree(priv);
 }
 
@@ -438,6 +466,11 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->imem_mgmt = true;
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to create device contexts.\n");
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 54b2a262a2c3..dd4a1ea7e35a 100644
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
@@ -106,6 +113,8 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

