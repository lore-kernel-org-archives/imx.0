Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98563ACA58
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716677; cv=fail; b=lmn5qU/WMQkZqgllGZme23NuX4B9tc06nTMbFPn8izjV65kgw58sLFYXP9237T4mCT7CNNqJesEF2UICviWukPq7eW1HE6FaKHH4WDGmW3XLSrtBGFK0jEq0ayaoSUD35OKlk0aFTwzpBRUalNQicTpmZQt/JJoXZsVUeFUEdzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716677; c=relaxed/simple;
	bh=k6gZlvTsT5cRWg8C2KtqI04qRL44Tj3UMk/s9Pq8p1E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u0/nfaCnNrY31600B94mbkku0i01nOHzRAgaMXwiMPtY5ZXN4kVutgNF1rwdlnhtk1UPyneaNYdsBPLZhPVzi5nhjOoNR/c4MfS6tAZ/xwdkId1di1LgPn2hGvXP4uWGv1g+YDoV7sycuDyrz0TGIdPMwM83cCyv4pkEMMYHc1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tJeZpd4n; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tJeZpd4n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ai/3sQX/qeXRhgRLVp41K0ZAEvpIYZvignqpqbGfEyijBQti8yKajgTa5XX/li5RR4ZdAEU4+YyhnLGvAGxE7sZYywsnlYn5EUjL8GeFrPxnSylCUwkIROzvAtOnlWjHb5jsP1V+uqzOfiGD0ZNVHKYtJwIZqeOlsfq7wMs5rWDwHSh2t0ov/rkTVHkR/uldfdqMKljrW1Kh1albGyG0pyJkfrJTNGh0KJrBtx54bLDT8Ok99pbT9FbEKwreNkXzP87iJH7QXkngBYqLfnRV+/acokT5O45sWaHn4A++fPnRNeKk+ZvV7VY2Q/duWflVQu46aDcZWZuIV839OdOJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQrPyjTw0vr2Dn1DvrOUR0AqKiee3gw+dT6qg3wKCoU=;
 b=CBZIAeAH0/XY/AL0Ont36D84rK1tZS14QbJQmKWRYQkrXXqREmpxYtOKNvUMlOwKvUVTXgeavJOawkFYIkdlZ+s8G5UlkD2ukXI+kwCrIQ/2ANTXbqwAGht/YIb5z/XMboktbPdDE4xGCHqzoeLGwfnX38HBw/nKj42BE1TJIycU+tjsoVsefz+8wo8WHsbEX6nlpFTJStvORXfKUQcTp5WttHPKsHPDpegn3NKb6tYSNXl4ZiwpFld71uRiMsKg9AfyPLV4nm7EpiDNMOWW3/WNsN+W5qwlNscpX3fSGLWGaHys5S5Q2Vti9rrIMfhbxf+8uGrq9GD+2q4GWu9puQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQrPyjTw0vr2Dn1DvrOUR0AqKiee3gw+dT6qg3wKCoU=;
 b=tJeZpd4nBp8K/Jk+LYySFLxSNwKmawN6J2DUDyYPq4XycppUchC4fZiUPqYbBNpSy31tGwSqT4wLKhEqpLgpGLLMfncGid6RlB3z1Y6Ftiv7iBKhLMq83COB4zachJWV5XGOnT7hETYa0D0M9j1wD8K5sEO4lTz/JuaXFgIfuJmHjFniqlbgLVzgO74PsRVR75ieZ9PzMovfmcYCpx0hSRgOqdJiqyOj/sTghcDkEP4tABbETsVhfyDhNr1Ny6dWEtDC6GGm47Hts/tk8OWNeuL17dbB2Z4UbZ78CzI0D5mklUZhcSS6KpZJ380YZ90nkaIePcU9eD0uJYVqnpre5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:04:31 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0159.013; Mon, 29 Jun 2026
 07:04:31 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 29 Jun 2026 17:52:00 +0530
Subject: [PATCH v26 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-imx-se-if-v26-4-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
In-Reply-To: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782735844; l=13244;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=MCWw0Pelhyc9XX5/+u3LAwhncBBVl7xO93l4OhVqJH0=;
 b=rCy6d+Rzf70pUVyTPmTvCmza7FPx5zpBpbQMEYbds+1PxqTgUsV5trg4VtmjLytsRDe0tiCXD
 r7c9Yg3l26dB8r0tBYmZFLYS2GbbgeCbX83LmVNun34P3xQvsX89Tp2
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI3PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:295::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e8060b-7cda-49ca-d618-08ded5acaaf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|23010399003|7416014|1800799024|366016|6133799003|11063799006|22082099003|18002099003|3023799007|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	mEiEhW4YnBHaJNxdMIqctaSZc/MbIBsfougpfUWB3vFQeLAek03JPJD0Vx7zE6c2xUphwj7QGIUPBuoLZwKgC3x4YK1vEtHgeXihn+CxN7NweDzedP8U6Bj/1jPkCI4qiiu21GlLs1Z98bwsWtIHP2lCdLeud/5xWxqQlu76/FqaTKNnktwbPAnc8rFG9dm7yLErd98c0zjRq66eeh5Ie4XkeLrJRoe2G4JMp4bTKh7c9wiQk0nUPY0vztMJqF/IxrPXpMex3FoBJz/shD5biXKs4JtE2Rir4PRKRuuFm7tOfDyf77Q2/9xXvk/h33ogKAYlVseryp91UjiwVUkam9yXovdDhrUZQnhhLhBFxxjMKjKUnmh5Rk6beAvAVicly7S670Av3iRkh3XvqbXlskLsu15ye3KqnWuYPqPq/4+InKi8hqtNnYmG8YufiXSgiUMeTPDUnzIjxXq4xy8PhTtVHl+vBt0mJBs2Jd23Td1P64Cnl5JoXuG/xKDMhJ+R47yUJ9/IavWuvHWRRoGtxpl7n5j09zjp21g3b6TTdYaAbt9OWJW4HbIKdusnkj4cmPctqohjixmk7nkQWraImght//4nKtVIUsEwZnGIqGa8qw/j1KLTYrlm7fL8L6Jh6nsRz3lXH7kEFD8+koFy8NWVhUn82ZKSBYgI0mKG67RC/jushFoBTyFczC48fNYnLYmpBZzvHVyD3Z/f2Sv1bQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(23010399003)(7416014)(1800799024)(366016)(6133799003)(11063799006)(22082099003)(18002099003)(3023799007)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWlwMk9lUkFVRFVHNkZPNlJjUWw1My9uMFovcWllN3l2L291bGh3UkNYM0k1?=
 =?utf-8?B?cHJZWllnOHBULzRRSE0vL0RnYXhoNlhWZmp5Z2VUYy9pWm9GekRaRHpiV2lQ?=
 =?utf-8?B?dXhtWGJFR2ttNmdoR3krOWc5bHBVbjFmZWpSTzZXd01ia1BscHNGczZLN0VM?=
 =?utf-8?B?NUJPZXNMNXByMnd6SlNLSkxJbFNES0MwTHVrMHpwMHBiVGVWQzRtUDBuWFNl?=
 =?utf-8?B?M3UrREFOcmhrcHpXZzUxVTJzV2dXSUxTdXIycXpZZlZpQzZLZlRMN0hKMFNH?=
 =?utf-8?B?OUUvdUw2b3pRb1JPdldhb2krWUNqTGR6OENGM01zKzc0SmVXcTA0RDQwK09x?=
 =?utf-8?B?TzZDVXl4MjM0c2Nwa24rYzA0dWc1K3ZpMGk3emNVN0NaRERVdndjdkpaeWZq?=
 =?utf-8?B?RCtZNjVsTFd3UHMzQldTcW1ETFdaSDlhTTUydlZ5Vms2V0k3Yzg4MldxK3Q3?=
 =?utf-8?B?djdOZEE4SGtIMlN6aDVOaXllR1Fsa3BzT3R6dEVRUFhCLzMrVjF1bnJ3ODM4?=
 =?utf-8?B?VkxpamNmRVhsMTNzdFkrWG5WcEZoQ05YYldkQjZ5Mi9JV3RwTEs5QURXdXpI?=
 =?utf-8?B?VEdWS0REYTZpSHVwTXJWRitMSER6ZmM2WnVYVFBVMkhVOUJrb0V4VTR6N3hw?=
 =?utf-8?B?dVRTZlprNHhaSU16emwwV3lYMzZmVFB1S1JQVmRMQzdDZjhOM0FBU29Ga2VQ?=
 =?utf-8?B?a3VscXpXR3paVW1FR3ZieDFLMy9ta3kvSmdQQ0Q2Qkdnb09UN3hsZTlRU1RF?=
 =?utf-8?B?S2plaEVwL3RnTGZVc3cyeXNlUGhRaEJ5WGxlbEJZd25wWjBjTTZxNTlTMWMy?=
 =?utf-8?B?S0FXejRjajNrMG5ZY2NRdGRlVzlFeFAvYSsyRk5FNWhNTkxsTWt2eG55VzVp?=
 =?utf-8?B?d05yUEpiMjVsMlMxS1EvRTFZNVlLVHdpZ1M3UVBBNGNpM1gwVDZGVnpSZ3lv?=
 =?utf-8?B?Q25md2RncklLbUlhNDFiTlFLWC9meTh1bDUrdm5JdmFnRlBtSXozdTNuZnMr?=
 =?utf-8?B?TE5pUEJVMXphOTV1VkFLWW9TMTRGR3lrWEF3VTRyRmt2OWJOM29PeDN1bnlw?=
 =?utf-8?B?Ym9mWXhqSjg1SzNmT2l4cjVTRG1HZ2gvTUJXV1ZsZHFlc2lPbTA4NjRrYWRD?=
 =?utf-8?B?WVhoZ1l2bStycER6RHd3VEdGaEVYVUc1U21FbUVWMmRVR3FqYkx2YjFSaHVs?=
 =?utf-8?B?bHlaSllGaGl5STNDVU1iekk2clVtTGJ4Qlc2Z1BNY2VZdmVWeVUxc1U0TzJm?=
 =?utf-8?B?WGZMRlhkS1h0NDhlclJYZk9kcFhQejlGbjV2OTk2WDZ6dDNkNUFmMGxrTWYx?=
 =?utf-8?B?VFJBeTdJeklrQW04ZVNSM203d0pZK0RBaG9idTRkUklBSVVLUmhucXk1dVRB?=
 =?utf-8?B?ZzVyTis1SWJnMDliTTVkSTViK292M3M4ekpoa2hTTSt4emd0MU9PZmxGaXdj?=
 =?utf-8?B?R2ZPQ0wwZENmdytLL1ZiWUNzdlEyNk1DY2FGZmtUc1RwaFN4d0t1OW1lZHRB?=
 =?utf-8?B?NHlNOEt1QlBEelk2Vzh6S29TSW14SVVzdDcyQTZpK1YwKzNtdnQyZ3g5eEk5?=
 =?utf-8?B?c3VVaGdpM1pLREc0U0k5VDhHbzEwWmpIazJaSUdzeHpTREg3TmhBeVZHQ1VC?=
 =?utf-8?B?UDZucTFlYnh0NTZDamxONXN5ZkZqdjNQelNnTHdsRFp0akwreGhobDdlbWFs?=
 =?utf-8?B?bFZnNHExSG1seWphdFZZNVYxWlQ4N1ZUN2wzQWdTZjdaMUxURVd4cndOOEUz?=
 =?utf-8?B?TVk4Vkg4elRzb1RzRHNqVjFFWUJrbm9QeFhMMVpzcGJ2ZXFXZ001K0pQdFA0?=
 =?utf-8?B?TS92YVJ6UC80MU5yVXBNeGVtVk9vTUFMNWdMY3N2cW4yVzZZK0d1czdPRldJ?=
 =?utf-8?B?TStIZGl0UDljRVZ0MVA4cStLNXc1ek5qNkJmZklySmF6NkhSWEk1cjhlQXZP?=
 =?utf-8?B?T0N1Ny93MlBjRVlncjRhNXVCN1BlMXBoUFNPaUlVSWUwcnE1ZUk0OUlmaGl5?=
 =?utf-8?B?M2RWRlZNR3cxYitpZnd4WEpTWkxQL3diWTgzRzZtbWZkKys5c3ZkU2JrRS9H?=
 =?utf-8?B?VGJiSnYwSW9nbjJOSzRvbTBjL3M1KzBadGhRa3UzZzNuZnVpODQyRkE0N0Jr?=
 =?utf-8?B?aXB2NFlxWUFxVHpST1d5Ti81LzhFeGdtNzVBamlMNkw5M2VtVFdsU1MwWHhk?=
 =?utf-8?B?cUg5bFkzRGxZbS8xYVhJbnF5SU9Ua3ozSlo3S0U4M2RQNjNIb0ptRWJOWVdu?=
 =?utf-8?B?RDJYNG9ybTI3ZEIvYXVqMjh4di9XSW1jandmbzA5dFQ1ZXQvc3JBbDZncERE?=
 =?utf-8?B?K3lpYkxReUpRaUlUcm9rVkZPNU5YZlArWFdQaEhBbDJ4VmpPUlBOQTNLb09h?=
 =?utf-8?Q?MqS4N/da4gKyzThCP0Mvw8pkwsiiE0Lf3uVse?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e8060b-7cda-49ca-d618-08ded5acaaf2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:04:31.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VrzrpVhxgI9W2TxzPKvNhOnBm28VMJ8QqCevvPitjBoIbKcdhylLrur75l+KeXDkmHuT4xqxwJHnik6mNbJoxPnj6ZLXeZZk2rYgtYqCu7MY0VUfCiVMahdPIH+a0UV7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 14 ++++-----
 drivers/firmware/imx/ele_common.c   | 59 ++++++++++++++++++++-----------------
 drivers/firmware/imx/ele_common.h   |  8 ++---
 drivers/firmware/imx/se_ctrl.c      | 42 ++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 ++++++
 5 files changed, 94 insertions(+), 38 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 54d79c3d75af..66bae4c7d464 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -60,8 +60,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
 
@@ -111,8 +111,8 @@ int ele_ping(struct se_if_priv *priv)
 		return ret;
 	}
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -156,7 +156,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!tx_msg->data[4])
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -206,7 +206,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -246,7 +246,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index ba606f4e8be8..b37ea1f14f75 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,7 +42,7 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
@@ -65,8 +65,8 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 			 * after the protocol transaction is brought back to a
 			 * synchronized state.
 			 */
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
-				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
+				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				wait_uninterruptible = true;
 				continue;
 			}
@@ -91,13 +91,13 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 			spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
 			se_clbk_hdl->rx_msg = NULL;
 			if (!completion_done(&se_clbk_hdl->done))
-				atomic_set(&priv->fw_busy, 1);
+				atomic_set(&dev_ctx->priv->fw_busy, 1);
 
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			ret = -ETIMEDOUT;
-			dev_err(priv->dev,
+			dev_err(dev_ctx->priv->dev,
 				"Fatal Error: SE interface: %s0, hangs indefinitely.\n",
-				get_se_if_name(priv->if_defs->se_if_type));
+				get_se_if_name(dev_ctx->priv->if_defs->se_if_type));
 			break;
 		}
 		ret = se_clbk_hdl->rx_msg_sz;
@@ -107,7 +107,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -119,15 +119,16 @@ int ele_msg_send(struct se_if_priv *priv,
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
 
@@ -135,33 +136,37 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
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
 		return err;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 	return err;
 }
@@ -209,7 +214,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -223,8 +228,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -244,8 +249,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
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
@@ -271,8 +276,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			dev_info(dev, "ELE responded (late), recovery FW available.");
 			return;
 		}
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -292,8 +297,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
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
index 96e987ef6f88..5bac14439d7d 100644
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
index 9a2c3c611146..a4823f485f88 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -199,6 +199,36 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
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
@@ -262,6 +292,12 @@ static void se_if_probe_cleanup(void *plat_dev)
 	 */
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
 
@@ -329,6 +365,12 @@ static int se_if_probe(struct platform_device *pdev)
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
index ef834a845e30..5d7cd10b4d02 100644
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
@@ -89,6 +96,8 @@ struct se_if_priv {
 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

