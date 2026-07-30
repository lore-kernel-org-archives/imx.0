Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011039.outbound.protection.outlook.com [52.101.70.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D89375AC3
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 02:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377797; cv=fail; b=f4ZmLNo+5gGxU0AVRXb/6/5ylz9foeFHbItHLmP2YEQ1MhidxuXdg9DgEtgknM3hNuTW2jlAqQG+YcQE5m90W3X/xS9BkYTYTdZoTBTqPxGAK47uoJfE8Pwhz+q2qwbROzRLLPFzjNtCFge3v4MvAH3gy5ZSDvpUdZwe5pHg1P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377797; c=relaxed/simple;
	bh=GHd5KH6w3WOlU6y4feNaONO34BiU5LgyxVW6inGU3FI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Td8UGtnwM/AAfUg5JK80WJe+c5FSaq3K+VE9gWT9dKkjbXjmseVMvIr3HlbnYHQ/dTJR1my417ujbHrWELLpXAFwBwQkSIi7E6KLvuXLdpZQEAH6Gx+eetUaMiAABe30/tFiSYneOp+4fkm1RUneFaOzYDxxtX4dbTTeyzIu0ho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e5Bb+OST; arc=fail smtp.client-ip=52.101.70.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e5Bb+OST"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qewiHsGhimMmU05ZPF8wXkgFxkQKI3V6ArYsyJ53aRmPOF28ybOZgiDkO6uZRhvM3H66z4tHUujAtnNNAeGDDhALFkeSzeQsahjbPWBqw2G1ovaGn6rs8QHUdXxlloJp6bMocSxsvamjrnhya7WJWjvIa8El7gQmWcPE2dNOjl9Sjhmj3HPw+PHdj4ks8becaYebhsm3gNCID+oHVngWw3TkNV6uDi8TPmlHImS5zX5R24VhSmztH8oYjXzPynTVuQTYUySIJq6Pw01mH0bzCnCngz413iIdHy8kYR/oAovEBxLkmcLBmieT1h/XbWYqSel7+/XkrztC9+ab1fOomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1cvKnnZkgFYH35Q67JI/Ha7V5Y4bBcrM2IHeDfZPS8=;
 b=J3IAEZS1N9NYQo/id4fv9lSYTSWp3kzU7Xwp5b6yOLgzpArlZH9qYfcvZ880aQNzNEmiBQpYcLuTVnHbcofyOKE4ZOGFrzoQrzKNR7+lUmHRZtVoW6615LZ7vpzkA1kkioGPFe39qq/0jcHvb1oI0MXFMj1qcEnHhJo7UjFMeaz6iah8tHhhMPphXppeLdP5cXGk6TV9hJ0leHaFUyJLXF2ViEUrvCZO/YuMtvyzASF0kVi+BGY8EmlDaoaM0LaL5y8y90K6uI1LuJRrOQXHyh1g8Jpf9Bo8XoLhwXf+ksbftVHP2suW7tUaIJjZasF5Edkf7bIZgRcJkmv2Gtn1RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1cvKnnZkgFYH35Q67JI/Ha7V5Y4bBcrM2IHeDfZPS8=;
 b=e5Bb+OSTc3yjMRmank4caURcGWFysry1XRhffCI4YbwUZiNTkxFoEZKYPAB40h4O7VlBzWZJuAcMUzpcoH8Mn1A3OxZHx74BgmNPdU8HrQGbA9m6+vmvbyyMsECi4NmWqf+FpxN7Hu0b9admC/PP5MACaxeHdqyg31oV6eIa9/WtP73cf3v9rqACPibPMVsBAmzO3Z67z22iuJegzHP7JQBCqn0CUN2Hv4jhj7lzIkrc4noYEfW/Vnw1KFk1cXsdGtTBmJ+0sJhMsDqH8wm1xnGLi4s3duWQxH0uyUkTgtyrDhoNpPHTX/bubFG0fNdvnA/7LjMuCpkTsaHELfZMrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GVXPR04MB12313.eurprd04.prod.outlook.com (2603:10a6:150:318::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 02:16:19 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 02:16:19 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 30 Jul 2026 08:36:32 +0530
Subject: [PATCH v32 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-imx-se-if-v32-4-95f56dff4ba9@nxp.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
In-Reply-To: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785380794; l=14329;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=jf0viptVfq9EWq5ouL92JjL1nIaeWG4aaCkfUdzRpbw=;
 b=UNQEwP6KEqGQh9E9g/Ah0nwYIT2QfDzLNfji/DCwETTGzIaAXv4FIxJDavn+whQ9siOKWexPq
 Qfh3K45nwthAYrMaYwmoP+lB6Q2VCSWWLTLnn9S8ahvJSIoiLPeb7We
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::16) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GVXPR04MB12313:EE_
X-MS-Office365-Filtering-Correlation-Id: 31a7be15-7e99-45c0-9bf6-08deede08afc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|921020|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gQxmp7y14J4q5f/aSjZ9AQex3OxPQCFT/OTtemnweXTu174nZO9/aKGCuOKFXQZ8FlBnu96YzUIC8M+3E8OaOOwf35PVvKrZMP4BrJEgEAsqsC9EWNNwK4frKMk2RavcNarQxApw0MmKikLsgLnLMvvIkPsODonLf2kSyERWE3kYlV2lfXwDsAkw/1SbxZS7Wi55qDtu661bsjsz6Ci40DvmBe3E/XMp9XebQlzkDUqEWN3IVBgAckfBhvXn9477BFR2P9cn4yyiOLaW/aNFAnsfG8PaDdV6vU7zgpXrpC6Vp4UcDaywboRO5BmV///P5dsQdJvN6j5k0lYdh9UezDPkHcvZFeUJlMeV6sTTsMhfjOvs0IJDM1tn/RTWAx4nkO6RXs7dDdYvLq0ZW3ubirHzxqKYDcQ36m3yvOkWKmqqkDUFwa/TWeFjAPGcKJndy5MUPSQZywgLUGjxM4WQCN2lLAonAL3w8DGIGQYC61R7yVEEvgObmeEnVjZZ3kziBmjuOr/kNsK7aD9v2T3JIIuP8Qjh2E2ksaCTPoA8LLLY8lF/O1ukWIXbHOToPRuXRsAj4htwKa+uvCsPKGuhtjWFD6V7Wobsxdr34BYZ4bY9xVVDxagofkIJJr9xIy3ZoJ199h+NpFBvOrqiOZ6V7A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UThzZng2K3RtT0FsLzJkT0lnak5wdk1UWkRUWllWMVVnYkRzRWhCZnVBNW9q?=
 =?utf-8?B?N3JkMnlUdVpFVVFrbHFFeFRpR2NQSmsxUVdRSXlCeGJHODAzQVU4aGFHbGNm?=
 =?utf-8?B?bDg5c0ZjK2lWZFNFa29lMCtMZ3hJaTJ1QXVRbXdEd1M1Yi9xTGVSdUZSenV2?=
 =?utf-8?B?YTV0SnlUUVRmM24xZ2srV05xS042ajUycmxodXVhVjNoL2RJdDZUTkpKVGRN?=
 =?utf-8?B?YldaTEF2ODh3WWhzMlhvbE53Mll2MForaW8xa1pwKytwZ2piMTdXcEN2Y29E?=
 =?utf-8?B?Zk5QeHJrdkNVKzVLc3ZzZmVkV0tvQkwweUNJVlJKNHpWL3JZSUNwY24xQkov?=
 =?utf-8?B?R0xGb0k5SmkwbUZtL29SVmRZb3NyMzVvbGkyRzNIQmNBS1d4QkEvakhmby9J?=
 =?utf-8?B?bWNocUhKcUQ4QnBkejk1bUhCc1BlZ3lNMll4YmRSclgyZzZ3RnAxbTdjeGZD?=
 =?utf-8?B?UkthU1NSandwczNBMVV3d3J6dVY2ODZNWFdoNW1rUWxtRTZFVlVBRjQxRlNv?=
 =?utf-8?B?WjZXV3Z3NFhud0Y3bStQRmhxZnhNbXh5MnQvZlNyUU1oZ3VhWjRtYUpleXVx?=
 =?utf-8?B?VjZuWjVvL3hNdU1SaEF3RFlVdjJUNXVqNDl4N2FVWm1DVkozTTFxVHZGSTI3?=
 =?utf-8?B?K2FnMUFJd2ZVZTlrSGF2VFR2amVRMUxiZHlub2txNDFVUmZRSnk4WlZjcDBJ?=
 =?utf-8?B?T3J4cGtKWG05dUtVU1d2M3gwMHVwWW9sRlFNNFVpVFdhcnNtbVB5b1VTNzI1?=
 =?utf-8?B?UTRNU2dHNkZpeHdkNXZabEhISjFRTlRFZGVoSU05Z2VyMENkaW9odWEydDVU?=
 =?utf-8?B?SzI5MGF2Y1VLUG9EZjltcUNyUDRxNVA3WS9pYUJqMDdqVHFGcGxaTkphMHBk?=
 =?utf-8?B?dC9wbVhESG44czhVZmkxTlRoVzhxUlBJTmg5bXgzejlVWlBIa1NXM3g5MFB5?=
 =?utf-8?B?VkhGaVRWSEFHelVxdDVlc3ZUK0p6OVNSWXZRWGwyWEo4SUNYbDlWS1k4bjB4?=
 =?utf-8?B?N1h2cWFJKzFyNEQ5azVnR00weVN4MzVzVGRWV0JmSWd5SmdBNC9hbjI3ck5O?=
 =?utf-8?B?MkZnSkQvZ3BVVXQyNE1WdVVhWUFuOU92Ri9EYmJVc3ZvRTdMZmRhMVlwRFBn?=
 =?utf-8?B?aWs5Y3hoY20wMk9VQldBVEpDSzNUcG04M2wyZ0xFM1Bia3ptWlFBRFVMNHYz?=
 =?utf-8?B?ZWR0a2ZHd0RlMFBzOGE3aXJjZ00rOEo4T1VDbzJiSnJjSjJJMG1vVFhvQVpm?=
 =?utf-8?B?NWhydW9iSTh6aDZ5NFZ4SWR6eVN3WWZ0ZzdyNVdhQzhRVHhsYVRFYjNINFNC?=
 =?utf-8?B?S05OWnRkRm9uYWhzRFJCN0NUczVBZjA0VWlVcHdzWVN6ZjQ0dlQreDZBTjJC?=
 =?utf-8?B?Sm02T3VyVnJvczNZcTRiZUJjWWVmZVVNWEZCbnd2b0xOdWJqck1kK0JOT2hq?=
 =?utf-8?B?UTRsU0t1NXFEMUhxTUlpZ3J1aXB4TnRhSjErcXBFR24xTUcxQmF4QnRCekdl?=
 =?utf-8?B?U1BwQUNHVXBKZUxaSFVHNnl4LytLQllldUt1OXk3SFM5L0Nyd2RITXIybXlF?=
 =?utf-8?B?MGN5UEg2TW5ZcVYycGFrdjhXTlp5Z1hnbHlsb2x6MVFVTEQyUzQwWkZrVU5w?=
 =?utf-8?B?dDJ4WEgvdHgxYmRVMFJsbXN5b01HeUdnQjhsLzh5bFIxTXdISUV4amZmL0RD?=
 =?utf-8?B?YjBKaVBja201eDVDWnJPanN6SnBxNTdrMXZRY2Y1eEhZbFJ0L2JqMVROTGpp?=
 =?utf-8?B?cW1lN2JJWnlicHJzRFo3SGVzV1pzanRBUkJkWnlTVVBQWHljTUV5aVVzQW5Y?=
 =?utf-8?B?RVE0WmRvdEo1UmoralFvQXY5RnFMVGJwT1hmUU9PUE15M2J5eGpDQm04Witp?=
 =?utf-8?B?eXNyREhJcE03U1ZuUlg4MFNFbE9YQWh6cEVoV0JEY3BXM2xBcWxGc3EyL3Ry?=
 =?utf-8?B?V0FzakdpSStMSTRkdy9pbTFTUXVVOWFNZU1pT09SSDdRdGo4SG1ZdlZZcGZn?=
 =?utf-8?B?MlhnVzBWNWNjMWJWTjFIdE1YZ3lRMUNnSHNIYnNmQmEvQzRWOHNwQkloR0lx?=
 =?utf-8?B?bkhKMmZjQjlrdVcrQlpKV3o5Zk5kN3h3eU9SNU1ZbWRsdTd1ek9VRnlaVWNP?=
 =?utf-8?B?bStOUitnRlVFcWcyajVJR0xNRXBsdVFBeXVLUldCZmJhcWd2c09Mc3VWcENO?=
 =?utf-8?B?M1V3cnBMUE5uYjFyUTV2TnlBeWpVNE5vdnNDcFBhT2x6bHRPMVR2dklodjF2?=
 =?utf-8?B?RW9PNy9oY3c1OHpiakJjei9OL1AzUEJudkUyM0J1OVdqamVIczJqd3gxWHpx?=
 =?utf-8?B?cThVZHcwUHNhb0p0azhZS3VZaFI2ODBUYUNzaWVYN1V6dWxLVnBNWldOekVI?=
 =?utf-8?Q?UuwGIV3e89BKeCBbNlWNyI5B6qtJyeA6BaFby?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a7be15-7e99-45c0-9bf6-08deede08afc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 02:16:19.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilAKLzw7tMaVvt4GOeuW3BO18KigOlOl3mfr/+ZDcW3nngE0G8tPHNuLGo+VDkg7DdEN70lHSBflgAZuvgn3IzjOhaKrIJvTvufQkv3lOSObLt0oxDIl2HTBlolQ5RQE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12313

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v31 to v32:
- moved the cleanup of priv_dev_ctx->dev_name & priv_dev_ctx, in the end of
  se_if_probe_cleanup(), after priv->rx_chan freed.
  Though it gets replaced in the next patch.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com?part=4
---
 drivers/firmware/imx/ele_base_msg.c | 15 +++++-----
 drivers/firmware/imx/ele_common.c   | 55 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 41 +++++++++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 ++++++
 5 files changed, 94 insertions(+), 34 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 724f6e913ce7..b70e3ef88a16 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -71,8 +71,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
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
@@ -117,8 +118,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -165,7 +166,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -213,7 +214,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -251,7 +252,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index f40eb4a07982..7254fc717e91 100644
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
@@ -132,7 +133,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -144,9 +145,9 @@ int ele_msg_send(struct se_if_priv *priv,
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
 
@@ -156,9 +157,10 @@ int ele_msg_send(struct se_if_priv *priv,
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
 
@@ -170,38 +172,41 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
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
@@ -212,7 +217,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -241,6 +247,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	const char *devname = NULL;
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -264,7 +271,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -278,8 +285,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -294,13 +301,14 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
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
@@ -322,8 +330,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -335,14 +343,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
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
index 53091cc37e7e..a8974eef190b 100644
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
@@ -328,6 +358,11 @@ static void se_if_probe_cleanup(void *plat_dev)
 
 	dev_set_drvdata(dev, NULL);
 
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	kfree(priv);
 }
 
@@ -425,6 +460,12 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->imem_mgmt = true;
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

