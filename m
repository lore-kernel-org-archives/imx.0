Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186E7346766
	for <imx@lists.linux.dev>; Mon, 25 May 2026 05:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779687446; cv=fail; b=b9Qm57c3cB+FPfTRi9MfT2KBLPz5usM3MErLfRaX4IcxskcluRG9jsxPR/cdekeVBLaswxeSc8VsvCG6ECM1DLaNDSBBrFg3McuhCtDL3orUhRponOYhERoFdCUcwYQxndkPyRDOtZ7acekvGyzf1M9RERMPvlHk8KrHsERq76E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779687446; c=relaxed/simple;
	bh=HlkyyhYKt4P0fC9cZ1PVH1P3fjA6D7Cy+5xJqRKSIe8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dJeDe+p0dxDzFwhCTWwH+yDm9xkwhIxpwQclv3gEpkL1kHQgMW0wTOzcQUKoDw7C0W7Flozmdz8gS9KbnSODYsH3BWzobMEEWCym4eK/OGjbyjN298RocO+X/2l6FywzxGHSPnEzcK4W8eZW/1CNHdIP8yH3I2Pe2MTrSgHolDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lx9NdvPT; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lx9NdvPT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6h/FIkl7O4gV0q5MEuOA9gaVPMMe0a3UpSvKtZJxuP6qSp0q9Pb3K+qK/YjqrGrlz4kX+3Ac6wTMwgn0c2dnronhqVgHpf1Cu2Y0h4TWXX2BEjaqpfmenE5RowarnDXIsRejseCSZwcrzQjfB3PqfY00PvzWq8etaY2IO7pmpMqhJBwsc4ATblmau3i8B3DVd7sbK3LiwTiUxXPGWkkgbzccp6JXisQtMFcB2c/CJ2b374NaS5r7geOtS+L4zXU1d7LU3KJFCoaipbbMGmsEHxP7VW9ILgz4u/sH0sJIvRuTLHOsjNTzfXhJercBXWZwqcwnUpNKr53EuUVOdl8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wN6p5ipIiIYD/CpscowQBMdhRp6W2cnFcXjzihsioww=;
 b=T5bDFZuJRg8HWCxeg0cAIITYqvvH1YADZHgzKqQLXmig9pclI54QWHvoUOxDQXs7h1oN2/iMO0Sd8YBUVJGB+tNNeETH1VCf9BGT54Ju7zmq/zm3bc+f9i/hkrD018qJoctxP+S8xYlqFbbeQmllYEYACSv0omVfCj8yngyOCmPSYMnU5HDipPztD66GC5sUxtLdyopPrspw9/jbptw/MkDgG8prjT6/KjYgCTeFxxX/IXdX2cXKBd2SleUy2Ef3XJ4TMzA9NTdWJJGP3oCJGBJSQsJom0f2Cp96wB5jySH9TohnMbktAaSPcmEevZ4INriUPEmfIcWXo6AVLpgLww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN6p5ipIiIYD/CpscowQBMdhRp6W2cnFcXjzihsioww=;
 b=lx9NdvPThas6wUGOtOBV16YdvcnJiXYDJftQT2CwZ4B6t+4AYZSQ9YDD3YZ3K8S9w57UWM19A4zJH0hjHtHQhbxE/aaNlUFHBnZ7AvAnC59mWQacBpq7uKtMPAt6mXG+JJPlzDqIiWPQClNqyhmcTeDwE9hRsUjqiI0B2DBcLvnMaeea+otSy8hI00AOkUPdouzkMMRX+zbCLSk16vrSEeKxbCXxx5Vsdbq6D4iYhLwaAKKlot5C/pU+b3Dh9WRPm6+ZX7gwzDlNxt87JsJuFdz+Bt4dp3QjF6cdpGRPaU8/oA6DP+e9y1dGKWN4PlifYi9P3Lb4PoowQeSW+Mbi/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by AM0PR04MB11996.eurprd04.prod.outlook.com (2603:10a6:20b:6fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 05:37:22 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 05:37:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 25 May 2026 13:39:28 +0800
Subject: [PATCH 5/7] firmware: imx: ele: Correct check_hdr_exception_for_sz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-ele-v1-v1-5-a9570c4bffc9@nxp.com>
References: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
In-Reply-To: <20260525-ele-v1-v1-0-a9570c4bffc9@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|AM0PR04MB11996:EE_
X-MS-Office365-Filtering-Correlation-Id: df032414-6c55-45a0-c9d4-08deba1fb18a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|6133799003|11063799006|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BfGA1n8ndkAH+rKHZkKZlejiXFKi1tSE0iarCgPvZvGojgSamGYmEG7RfyNHVUBrROaSm2FToO53E3uJTXKQhxxI0CAUmh2NGEhurYzukFMaG/FA1H8R39Jp3Hg7EYbzeejjHQCTLFI9QNc0zj03kx0x9mFYRuhhQbAwIs07SStUJOxtP+2hdLRmEjuHEP0Pxd/q6AgzeAuF0F3TlmykONg79Da9udaQ0A0cqLInHJ9v51oOpbpND+D7/Blo9P8uvNNQ0i/1Cb14v2BUiNwpePUjf/tYuKwMrIHSWpWSNBVUidvJFK67YwOKi1VXXIePZ+lI3OryzsPPFPIS/2NtdmfWK3B+6z8LlM3hviUaIIEp+el8MZuhsrZo1BhXnFimdnaH+vl80bVRzV8UXyDsPDqod1kyepscie6dtzcjmuKXgL9lu9jpEP6/ztsi+QPEkMHZUsdKucrkYGJoqGxCLTPAXX4fE3kuDSbWGVgMzJPDQdbdce5GF1gzYM+WsplJQLk4QB0ZeD/3mSSI9/DVaDX9/FBIMupt5UU1zo9TkVQj1SNZdnx2vC/FzdiSTxapiV+R1gZhWA88Zz+Wbq3HTS3ZTpY8NOQWidSPrJ2X18Yzj8cS5wcx1jj8SkG39iKpdI2UibpehPqz14129cLzgzXJpx+viA8HlOmoUrgXwPU6qRObRhY/CyPmT0MJpEe/RnLvz9tIx0aKPn8/FMypHxdacgF1VyGa213EidvPeNGJgpMJ4cHLEW5+aoXONlCq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(6133799003)(11063799006)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDNnSUFhSVF4Z3pTZ0IrRzI4MlAwamZtTk1LQWRCVmFiL3Q2bzZJaS80UXRC?=
 =?utf-8?B?WCtkNDhZa1FiSVRBTUdXaVgvaXZWWlhEZVJGL3VRcThvRlJDL0RtNEduSlhl?=
 =?utf-8?B?MW52Y3ZTNkZSN0dWYWh0TUZESWIxdjRXelRidE14ci9hTXg5YTBWYzZKRUFn?=
 =?utf-8?B?cWsvc09xc1Bjb2pnZVA2YWlsdnhiaXNLdVM4Tko5UU0rdmhUbjlrK3VPTytZ?=
 =?utf-8?B?MnBxVEdxMWJVVWtDSkxpMUdLL1lkeXRIa21LVnBBbzM0Tko1RkN2QUFKclZU?=
 =?utf-8?B?em5UWjFPVm9ydkl1NGV4TXl5VW1GZG82ZnlVK0VsRGdlaEVzMklqYnB0ZXZy?=
 =?utf-8?B?WUJ4b1krMFhlNEN1RXJxUGtRazFEZ3pnK1hJbG83Wnl5STk1UG12VUcxOU1u?=
 =?utf-8?B?UjI2bTNuc0crY2g5Mm9DQ3V5RUZlcTRoVlF1MTVFMXZDajFtbEYvaWRVdU93?=
 =?utf-8?B?bnhaaVFtaTN4UWJUWkpGN2orbStvNjhPcFdrTFo3TDJMKzRpYlRUR2dvYjRq?=
 =?utf-8?B?UTJIODhlTi9qR1Rrdm1abVZieWM4U0tuNExSd3ptKzhTYnZRekhQYzNyUEtO?=
 =?utf-8?B?Z3FZakZPQUp6VElUMGhzcHE3djBrRGpVVjU4Q1BMMXlPSWlBUUV6Q0RwYzUz?=
 =?utf-8?B?MVlwNExaR1VUNW1aVW00TzF0SkhUS3h1NE5ZbjRrRjFROUdtbkR2UktIOTYr?=
 =?utf-8?B?N3JrZERTNXpodzFZK0JqTU8rMTFOYmtEeDIrSERUSUhwbnlYOVJLb2tUSEsr?=
 =?utf-8?B?ZEVjZm1HYnhEZndqOUxpM3RJWGJlUE1udzRoLzVXMnN2bEtHRzlWa2IvdU9D?=
 =?utf-8?B?VXcrY2tjOHVXQ1pGdlhHbGpXc2ZudlV4cks4RGdxMGI1MHpodk13U2t4WjZC?=
 =?utf-8?B?c3hvRG4rdW16RzdWYnlsNnlGdDFHYjJ4b0VMWVFENG85cXhjNjJ3L2xqQitC?=
 =?utf-8?B?YjhmYmE2aHk3QUlyakxBeUV6MEpIVU5nRE1aNTJ4a3NHSUMzbEErS3dWU2F6?=
 =?utf-8?B?c2d4WDM5Vi9lQzQ5SzhQUC9iZVNqclQzeVRmMkkxMmNhanF5TE1LaWNBTU5L?=
 =?utf-8?B?OHdyNGtud2tCUGMwZFkyemlzdm4vWGlZWWpjckRrK3VZRGNLb0xxbjdyOVN5?=
 =?utf-8?B?ZUlPbHlHaW1YRnh0VW5sOExQQTVoMFdPUXY2VUFYbFJIbmRrY1hVOFpDdldq?=
 =?utf-8?B?OGJKb0JVUEIvUzJqR3Yyckg3czBqcXBMNkR4ZlFkWE93cXhnVkZ6V3ZqZmVP?=
 =?utf-8?B?dDRhTDZZNHVSRW1IMkNPRmlHVURySWQxQU5xblE2alBPelNiNWhOLzliR3hR?=
 =?utf-8?B?UVN6YnlJcEpGcjliSGhpeVdOcFZLeWk2SHRCQXA3UVhMaVJQZVVId3lEUkN1?=
 =?utf-8?B?MGJMbE5JVXJnNVBQWnlHMFo3SXQ0STBtcE9sNjhnY1BwSUVNSDBMOWljYlhO?=
 =?utf-8?B?UUx4dlhVNDVtN3IrRUlCVG1VL3RleHZ6MTBNWmVza1lVNlk4NFdXOElLQ1Bs?=
 =?utf-8?B?b3RGUnh5THJCY3NDRDlrRVF4Q0JCZEZ4T2ZKN3U2MGo5b0VLWjdaUTQ3Z1d6?=
 =?utf-8?B?Q3NXblpXV1NvcWpVOHAwSkNFZ0pjNEIrelVnVGQzWmxCQW5uTVhZdnYrSlQ3?=
 =?utf-8?B?V09rOTJ4TXhNNXV3anZwTjFpVU5mdnhDM001MHNSelF5MlZIUkNPeDhRVTdS?=
 =?utf-8?B?VmdMRlRMWXBOaTFkMzdZU0tzMUVJRkZBNzdXOUhkcWlOZzhXZzRuVVMxdGZG?=
 =?utf-8?B?aTFISFZZYWpiRHl2NU9BRHNLbFhKNVh5cjdpeW5oVkYrOFgwV3RBcnl0ZTlY?=
 =?utf-8?B?cndRMmlEdHlGelFSS1VFdjJsUWxwdUR1Smg2R0N1ZExtcXYwajQ0RWxRbUp6?=
 =?utf-8?B?T1JLZW9hUWp5eWVaNTdVUmNiWkFXT2V1cERDVEdWVGhqM2NFbDEyUEZWSnBs?=
 =?utf-8?B?d0oxU3J5emRKOCtaajVzRHRZa3VFYkorbFdHVFdZRTJPT0FodTVTVmtMUlFz?=
 =?utf-8?B?TUhDTWVjbDAvMnZiTHNmVzdub29HZ2FoQ2RXYWVlVk5ka0t3cWZhSTc0ZUtt?=
 =?utf-8?B?NGRWeUd4UlgxWktlZ2NpOWpVV25MTlQzWUxVY0haR1JwTWgxbHM1T2RCM1Bm?=
 =?utf-8?B?cG5CbTVXZUFra21ZRmxESFZTTytYTUhoV2xJRlcvc0ZZRnVmOTNmbkNTMFdD?=
 =?utf-8?B?Z0M3Q2hyU3lIbFRJdGt1ZzlhcDZyRXlMYTVBNTRsdXQ0RzRYamFGQU5hbjhS?=
 =?utf-8?B?WGFmVzN4Kzhseis4azA2eWhlYzZmYzdOeVlybVlJYWc0Y2krYWRMSURuQzRP?=
 =?utf-8?B?SHNtNXpBME5rUFQ1bzViOWlXM0xVdUZCSklaejA1dXpXd2l2amZ2UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df032414-6c55-45a0-c9d4-08deba1fb18a
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 05:37:22.1513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vtwRx+5XpTl2+/PacfvIUPrswh2VvbH1nyPLtsb+wkZh25sxx/POtuaKRTPdxqa0ccpkywoMcJBbHQVVdMT7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11996

From: Peng Fan <peng.fan@nxp.com>

header.size is u8 type, "header.size >= 0" will always return true.
Actually the check condition should be ">= 2", because a valid response
includes at lease header(4bytes) and status(4bytes), total 2 ints.

And ELE_DEBUG_DUMP_RSP_SZ is counted using bytes, need to divide it by 4.

Fixes: 106ffe5d78ad8 ("firmware: imx: add driver for NXP EdgeLock Enclave")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/imx/ele_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 8daf32eded43c62daf56540b63e292bf0c6c9845..76bd3841acfcb1ff33d3bc5d900300493190b8a8 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -164,7 +164,7 @@ static bool check_hdr_exception_for_sz(struct se_if_priv *priv,
 	 */
 	if (header->command == ELE_DEBUG_DUMP_REQ &&
 	    header->ver == priv->if_defs->base_api_ver &&
-	    header->size >= 0 && header->size <= ELE_DEBUG_DUMP_RSP_SZ)
+	    header->size >= 2 && header->size <= (ELE_DEBUG_DUMP_RSP_SZ / 4))
 		return true;
 
 	return false;

-- 
2.37.1

