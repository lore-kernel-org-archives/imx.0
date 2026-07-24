Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D583CF1E1
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 08:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880921; cv=fail; b=AVqjMuoib1NYieAPGnXbuJKcpn+ZV+4Pu9uSvglT8ML0KbqkYY1DiG4GZukZNCUR595dC5ZdiItOGvUAC/yjOvmTNoejTYwm7dU8PlkIjUeMkKrPUJzmOi6MeGQVZWTxowPyOc0mVC5qM11ZVvpPgO3F2z7HfIO5kbOPDFiNoS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880921; c=relaxed/simple;
	bh=B+5AuucAcP3CYiAvc/+Sl4xZTcZguQ+YjQ2p7TdVT4A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m46+oeADEX0ZDme8yeqsn5v87w7V62I4DVZ6kRJ1OrBANNzVWPV3pjmqw4LzjCDjrNK/YnFs7V9TU7Yq7x2BAOsqctldMAzHjL9Pi5SKrQVSbHhtmHSdRcMU6xPIH+IjhgAf3e9/WpSpumUm0KeVS9ISurepWT1ovSeXQtO/g7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DvhOxQuP; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DvhOxQuP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3Bg0MPBvQcD2FRb6cuZshd+fFxD8mbwVFvI7eXjRlLXWzkARsPiPNxH/iXDXqng3Uj1ubb1W6GruzCdz/NQZIkBgPUhGRDthEh9jHaR6G8jBIjWvuFpodO/Vy9ty1PPoG+0KvmqY5iqOERsvsRs/NX6koHXgpQvwKubOZogNuGxhtFh/9ILrN9heo47uEiezxIqCtbwSQEFMoqBojYPE1yRNMRIANIpdV0qx2VK+0yZDr0NbTAatF7bntLmGDvJ44LLyLdn7ZIOAAo3jLNpZTltpEQsMXm6VV61XCxbjvTv9el+OknJCKWJVKCI3ObXacSIkzu/5OFXAy2lGjCsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDdtxr3aivTpAuuxZOwBkTJgvtl4lpi+V/+4SwEOXW8=;
 b=K80FC//gv4DVqLoiRgdZkoJmCUv18MOHJZsM3xD8ucerORJ/Bv/cFfHhY4GTddy+Im3u+SluHanG3HW8A9ZALJehAouTPZBSi68m/EydlFySQCLLygzo3LNe/zMZXq+CHu1wixSBZN0r5hNhrrPcg99qrge3OmK7S18s54mv5IRWNG9p9UrM07tV2FK24pYMBxbAq+epzgRRjfoAQywPtv1SoeIqWMLVrGRBJ8iaMWfqY61Otvbk6Jewq3crBKLrSpdHPHMq+2rHKiXIWzgFwBkk2M/2QN7aCibQrUj5waDR7ctOimUoOPmka++2mmOnkwnPDr0jETX00k6du2UKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WDdtxr3aivTpAuuxZOwBkTJgvtl4lpi+V/+4SwEOXW8=;
 b=DvhOxQuPc0XH54yhhKnuXaRsIGZBccZ3P8EaDeuCd7NFR4PnpAft9tbJ7M1xFM9LVqpp1AieYlBgOfXDRLYDJbRW2kOv7ZD5VFrgtAhlWLsRC5h/zNw/qOPzsHKQkjY2UO4CXyolgAJspP8hDYfSRgJZk10PR7FJNEbYgwEFWrPPyM8oddp4ZEaVmBlykiDG6BOY3vY41LxEe3THxvPXXxjxNNFWa/fdRXIaV5odyug+XdBurgcwb4um3F7wVzthbeVY3FCUzQ/MxLuyOGd7JqthecVGep/bXLhJjrmgYBSrqLmZ4tlku9UVw7W8wU56eSORfatHxRLEM+MZeo9M+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:15:06 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:15:06 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 24 Jul 2026 14:35:12 +0530
Subject: [PATCH v30 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-imx-se-if-v30-4-ce8ba256692c@nxp.com>
References: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
In-Reply-To: <20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784883913; l=17085;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=eqxUCpGB889quzHCom6KhxpVu5KKOfvp210kKIDQY/E=;
 b=7hVUqcIcdh35Hyt6Vte4WD/O3AzquWt+xqciJ5dha/sCCNPDaOtO2qqdI8l7zkc/WuVrdWJmS
 8LJmTc0uUlXD/LO0ODIZSHQU+3CY38++zBhI+LEFZFHnwrTP8+Z1sNj
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0329.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::16) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS8PR04MB9048:EE_
X-MS-Office365-Filtering-Correlation-Id: f04c7d50-bed5-4566-c532-08dee95babae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|921020|6133799003|32116099003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QfrVJA3cQfYLu09RHt37ZFpOonP6NjF5h+w59Hvybhl5CjbsHz6rlWOtIi40Ht3+V1CRB29d+RfqeYPRy1uE1BeKXrew3+Wltj1TyewRyHsoduP0j26J8p9jHhVYL7Ys/XxylCn41Zy+xwd8QnKF8G8mazXJjafoJd92QSK9E2ocTx9nOBQUAduyczvYt8f6ic7iyNzHYBq3jYKuTNiCr81kefO/eoRHc0fM2eJBM0wwW8LqwASqmiG08FZr99i0EK3YJVdrm8sgN4cgNOdLO39r1sAyO2CfLEc0WIv/enNAe/dNiGU2K0wzqRZQ06piTRm0yEeRSRhqTBWm2FfaxxjdrEPbPKfcfxAjczLfQAUY7yvMpl0jTnwEO5OqjypUDcyo8sie1U3kfjIZ2rhQEFRfIJxLoJvh0vXtkASsST8ZzD1ld/M1t25G1FUbLrI7KiaBrqLmptDQH6d3gNHMKKKYaEfc88zlwBKp1Ysf0pfD1RE12BLu/kFZLWPh3Fr5XS+vN/u13grKTmbWcQRea1kPopmiVrLJxYPrUd/yXpj1llTU3f1rldTL4Ui/uP90guodyhepB3Ip/VXOZtr+Q42qfYsWwxzIsVZkOaBkoJWQGYncUF1I91TJpU31db0SB69H42e8cGBziARmhDp98g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(921020)(6133799003)(32116099003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzZUSGFRNFJnSnFyTlNzVUF2NXp4MEprUStpWWt6ak9aL0lDa2pveWpsUi9D?=
 =?utf-8?B?clFrdTRkTXhaTGJhMHdUcitpVU1TVHBuL2VrT2pHVG81ZHR6akFXQW90bmFx?=
 =?utf-8?B?V2tWWGtKekV3d090SmFnTXYyL0doSUdISlFidnZIaytVOEw0QUcxWFdEQkEy?=
 =?utf-8?B?bEJ6ZG5wVXlldWoyU3Y3alp5QlJRbTN5N1hmV0gzWk4zcHRFazdzZVJKcVp2?=
 =?utf-8?B?bUhRT2R3NVhVWUpkUTQ1c2JEN0dIRFh6K0RiUkNROUErcUlxbDRIeVpZd3gz?=
 =?utf-8?B?YmhCZVNRdytqcnFHZjh4VHdNMytmcmNjTVYxakc5UXBUTm5NNXF2L3g2eGdi?=
 =?utf-8?B?Zml1NytRSTdiL25qZk54STNBVFJPcjJkbW5hZEUzQ3p3cjFuK0MyV2ZXQUll?=
 =?utf-8?B?Unk5TXplRzNsc3pzVUtjSlhMVTFTSlM3Z3U5dGRLNkVLUXRvMVlMQytLQzFp?=
 =?utf-8?B?c0YvSGVucnl3VkxvL2VMYnppYUlOeUJDblVPeWJSNXFhRWZXWS9XNHAzOWo4?=
 =?utf-8?B?Zks5RUJWbC91a3ZPSVhPQ0w2WmU2QVZ4TDVZRHlIWTRIWkp2STVJZVA1UHFY?=
 =?utf-8?B?MXBUK3RRRXM4RWdDQjY1cGN2Z1FMZ3o1dHJsTlZmNzExYWJnVVJwbkZoRjZL?=
 =?utf-8?B?dkJwOHpqTURMNkpkVlAwVWxJSDh6TWpYTEt6STE1NE1FenUxaTRoN0k1Z1Zs?=
 =?utf-8?B?b2V2L0huSVYvYkRCK2dVR014UFNyeENtWTg3cXEwYzdtSzNaN3RLaU40Yy9X?=
 =?utf-8?B?R1VDaWhjSFE3Z3JBRUxIdXl5MUk5cXpva3UzZ3ZIR0c1UlVaL1FjZDFGdlhp?=
 =?utf-8?B?bzRkTDIwQzNDM082eTF1d21lU2VBTUFuaEZYdFF2TS9qVGxyZWpCd1Q0TVFy?=
 =?utf-8?B?Lys5enhNUmFLY3RMSUs5WTBhSnNFZjA0Mk54MjNocTVZV2pGL1FrQ0VENWdt?=
 =?utf-8?B?Z2xtTXFMc3pOcFJxV3hxakJxWUxzMm9iaHdMUGxrTzNhR3Y4QW1QNmRObDJO?=
 =?utf-8?B?aC9NbUtic2NPd0dycVV1NHlwN2tkeGY1encwSW9uNWtWb0JhVHB4M2JQck5m?=
 =?utf-8?B?bWxydEZaKzZKcHc3dnEzcGRXQ0hjNXZ3N25XTG8vY2dQbU1sQWozdTNDVUx3?=
 =?utf-8?B?QTU2eDJZZG1uYzVOYWduRUVPVlJqTGlHZ29YVWpWTnhBc0J0UkVzeFNZUTkz?=
 =?utf-8?B?YVl1YXdsTm9McGtwMXRBWk5XalJvVUxpSUNrc3ZmQWVpS0lyWDdaSlRvUVJu?=
 =?utf-8?B?UlhHVXhkUFprK0ZVYXRvci8rOHJIUElJd0ltdldldzRDdlNzNlZpU3RmZXFZ?=
 =?utf-8?B?ZUhycnBZMlNvR3NRK2VVR1pOU3VBRWpEajhER1lDVzBZZjBNbEpUZkVoV2oz?=
 =?utf-8?B?MHJaM2dpTldJN2R0N2pSUm5nL3plRjB0OFlYazQra3RaWjRubjlRVkNtN09G?=
 =?utf-8?B?bHd1d1Z6cTdGY3lyOVM0K0xnblV2TU0yeXBJdFZlYVcydFhwS25FaWRIMVhZ?=
 =?utf-8?B?cVVFcHNWa1RuSUJRZ1RVekN1RmhGWmg2QjFJNDZuN3NkY1NkcW40VnlNMENG?=
 =?utf-8?B?bEFQZmxnUHNQYXhJNjVVdTAveXhPc09qRDIzV0FoRUdLK21zQzRmQUhiTmRG?=
 =?utf-8?B?aFl3cisrSWk4NjB2bWVxbERDdlcyQUV3aE9WclZmajc1NWRFVENseXEzWXR1?=
 =?utf-8?B?N3VLS05TM25tbURhcjd6OG1LU2E3TEtxeTdMWHJoQmJ2TWo4MGtpNUtDc2Qx?=
 =?utf-8?B?Wm9oSy9HM1BxMDdPSmg4dVlvcHVPNnlGTjYwbDhCSmlDTEM3dTVGb1RoQy94?=
 =?utf-8?B?N25Td21pNGVqS2xzaHB1MmdOY2o3Q2dMYllIcmdxV1Mrc3FhNU5pQzNaT1lK?=
 =?utf-8?B?cnY5S1BaNzdCUjRBTUpVQ055bHF3VkN6NDkwcVNtY1NhR3M3eGlNY0xZay9U?=
 =?utf-8?B?aFQwQ3JJTUc4VmVLT1FEVFlzRmZHcGx5bWtHTFpZNFR0VWFaeHh3SUYwMHcx?=
 =?utf-8?B?ckszaVhFcTUwK1J5bEtJWXFsOTZ6Y1VSTWJUY016OUFmYXZNeTl4ejlTUnd5?=
 =?utf-8?B?SXh1cFM1aUFIMExWekdWZGNoVXBOcU53UnVXZjA1ZFg4MEx4ZU9nMUpMR3pE?=
 =?utf-8?B?Q0o3VFFLTFpnamsvMjBLZmhaOFdEMlVUNmdxUisvY0Njd1pDWThvQTVhMnRG?=
 =?utf-8?B?WDNIN0xSR0tkc28vZGUrU2tIdE5ZUnRVa0FxMEdzTVdDZzlwMjdhc2FhUkh4?=
 =?utf-8?B?VHI5a3ZCTTZQQXp1UlAvR2hIdTcwdVBaemVOQTBFT2VsRzJNMjJPU2cvcytV?=
 =?utf-8?B?TUJDK1Y3WHdhSVFZczdYZzdZY3htL3NRZzdNTmV4cmg0Y1EySnl1VURoMXU2?=
 =?utf-8?Q?8HBY5hbvNcQP4hK9oqHaSV8hKwHwwizJWXq8s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04c7d50-bed5-4566-c532-08dee95babae
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:15:06.6033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P10diqtB1NVB558QW9EBjqi21y0Nlh9G76cbw7faHpqk1Wk8WTmSsMS41ieDArFYhGZ1ZKYZXaGd6pQG1pnmf/nPk2ny7k9PS59gGaVZr19RH9OrPOYyLDkkPxyss63a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v28 to v29:
Address both findings from the Sashiko AI review of patch 4/7

Addressed (drivers/firmware/imx/ele_common.c):
- [High] Data race / NULL pointer dereference when initializing
  waiting_rsp_clbk_hdl in ele_msg_send_rcv():
  dev_ctx, rx_msg_sz and rx_msg were published without holding
  clbk_rx_lock. A delayed firmware response from a previous command could
  run se_if_rx_callback() concurrently and, due to CPU/compiler
  reordering, observe the new rx_msg before the new dev_ctx was visible,
  then dereference se_clbk_hdl->dev_ctx->devname while dev_ctx was still
  NULL from the previous cleanup.
  Publish all three fields under clbk_rx_lock so the write of dev_ctx
  (always non-NULL) is ordered before rx_msg. ele_msg_send_rcv_cleanup()
  already clears dev_ctx, rx_msg and rx_msg_sz together under the same
  lock, and se_if_rx_callback() reads them under the lock and only
  dereferences dev_ctx after confirming rx_msg != NULL. The lock provides
  the memory ordering, so the invariant "rx_msg != NULL implies dev_ctx
  != NULL" holds and the dereference is safe. The RX callback also reads
  dev_ctx->devname under the lock (cmd_tag path additionally checks
  dev_ctx explicitly) and caches it in a local before dropping the lock.
- [Low] Unused variable flags in ele_msg_send_rcv():
  flags is now consumed by the spin_lock_irqsave()/spin_unlock_irqrestore()
  pair added for the fix above, so it is no longer unused and the
  -Wunused-variable warning is gone.

Follow-up Sashiko AI review of patch 4/7 (4 findings). All already
resolved in this patch; no functional change required beyond a cosmetic
whitespace cleanup:
- [High][NEW] Accessing se_clbk_hdl->dev_ctx->devname outside
  clbk_rx_lock in the cmd_tag path (UAF / NULL deref):
  Already fixed. In se_if_rx_callback(), the cmd_tag path holds
  clbk_rx_lock across the dev_dbg() that reads dev_ctx->devname and only
  proceeds after the explicit "!se_clbk_hdl->dev_ctx" check. The devname
  used by the post-unlock dev_err() is cached into a local (devname)
  while the lock is still held, so no dev_ctx dereference happens outside
  the lock.
- [High] Incorrect devm registration order frees priv while the RX
  mailbox channel is still active (NULL deref):
  Already fixed in drivers/firmware/imx/se_ctrl.c. se_if_probe()
  registers devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev)
  before requesting the tx/rx mailbox channels, so LIFO teardown frees
  the channels (se_if_probe_cleanup) before priv is released.
- [High] Memory leak of priv when early probe steps fail:
  Already fixed by the same change. priv is allocated, stored via
  dev_set_drvdata(), and its release is tied to se_if_probe_cleanup(),
  which is registered early; any subsequent probe failure unwinds through
  the devres action that frees priv.
- [High] Unprotected read of rx_msg_sz creates a TOCTOU race leading to
  response truncation on late interrupts:
  Already fixed. The rsp_tag path in se_if_rx_callback() reads
  exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz only after acquiring
  clbk_rx_lock (and after confirming rx_msg != NULL), so the size cannot
  change between the check and the memcpy().

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com?part=4
---
 drivers/firmware/imx/ele_base_msg.c | 15 +++++-----
 drivers/firmware/imx/ele_common.c   | 58 ++++++++++++++++++++++---------------
 drivers/firmware/imx/ele_common.h   |  8 ++---
 drivers/firmware/imx/se_ctrl.c      | 36 +++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 ++++++
 5 files changed, 92 insertions(+), 34 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index a2ede9c01691..524ebc0f697e 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -66,8 +66,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, ELE_GET_INFO_BUFF_SZ);
 		return ret;
@@ -112,8 +113,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -160,7 +161,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -208,7 +209,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -246,7 +247,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index f9be8b8556ad..3811c37d1754 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -46,8 +46,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 	return 0;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
@@ -126,7 +127,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -138,9 +139,9 @@ int ele_msg_send(struct se_if_priv *priv,
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
 
@@ -150,9 +151,10 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
 	 * the caller-owned buffer may be released after a successful send.
 	 */
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -164,34 +166,40 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 }
 
-/* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+/* API used for send/receive blocking calls. */
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
+	unsigned long flags;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
 	if (atomic_read(&priv->fw_busy)) {
-		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
+	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
+	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 
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
@@ -202,7 +210,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -231,6 +240,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	const char *devname = NULL;
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -254,7 +264,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -268,8 +278,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -284,13 +294,14 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
 		 */
 		se_clbk_hdl->rx_msg_sz = min_t(u32, rx_msg_sz, MAX_NVM_MSG_LEN);
+		devname = se_clbk_hdl->dev_ctx->devname;
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				devname, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
@@ -312,8 +323,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -325,14 +336,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			sz_mismatch = true;
 
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
+		devname = se_clbk_hdl->dev_ctx->devname;
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 
 		if (sz_mismatch)
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				devname, *(u32 *)header,
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
index e9e2f48f4f71..b053dd00286c 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -284,6 +284,36 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
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
+	return 0;
+exit:
+	*new_dev_ctx = NULL;
+
+	kfree(dev_ctx->devname);
+	kfree(dev_ctx);
+	return dev_err_probe(priv->dev, ret, "%s", err_str);
+}
+
 static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 				 struct mbox_client *cl, const char *name)
 {
@@ -411,6 +441,12 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->is_fw_tobe_loaded = true;
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	/* By default, there is no pending FW to be loaded.*/
 	if (se_info->imem_state_mgmt) {
 		load_fw = get_load_fw_instance(priv);
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 00ac892997a6..24ef97d01be1 100644
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

