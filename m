Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B213932ED
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909390; cv=fail; b=Ck9D0s2lu3ygx5sms44ocEYtz3NthrIm0Is+5iRZ5iQwAYPnKEBXv2RwtOz2Vg3c/DCvc+gPP0bZU5nn3YCXno9Vy+ZDooXJXcZkTUCd3xetwGK18gLjy2THenuwETYK3aB7qDEIl0T5k32lWHruCev6X2HcQtEs2Pzhahr5Wfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909390; c=relaxed/simple;
	bh=YRTfz2mPsSqRfF/+73NZ4FniPqZcUBJuOlw7lMkWSVI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=IDhqIJdfXXlu6ZnraTWaSgAj7sNMDL3trf041AVs+kke37TEFOzMC4JeCGoS4H2rohNYFvfOS82fxNCwplNArZzOLOn7ornqT4+934H+gCCU9CRPM1f2zdIWhpgRvt9qQyIg0Pb/xiFoh5zgaF/9TaECpPXnCXDagaUrfbHo24g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=l82vdLhW; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="l82vdLhW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+EAWMFfHhjM361dcir0SZc3ZQxJuf/xkPWsHiO8bzTgdds+vslzklD8F5648/x/gzW2uDziufEtZWIl/P07wEoHxlZgBH3TRErqqe6heKP3Q42XNl/4QS5BilIBvnh3YfDKJe2V+kppShhI/5I5fJ+nv1fvzI0Z2dltRukJY4n+QNTOdHBK7pVQ9pAlrz72mAG5F5gTwYwxdvZnS2W6fBj3sl/nVbybEqYuKnnj3P+1iXDTo4sMhMjxRBkq3fvb4eIRVTX/5ISSLkNEM/KKlZAU3LiGIYz6pTXhkQr/hqYuWXSJLw5SK3XTILyrwTtO5j+7XPfb3xm5rDrBrlnlFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llGiiELk5qQBDBa5m2W6rFy6HT9h05PEibi/21qDm2E=;
 b=hWuZPLc43dIv/OYGFiM9hksnIuKhe7xm66V+LPzqqRiZKevvvvSkvQBkDj6EPg66oTQWhj+2Zkrj/t9ySn5gEHnbHhMPBteOl86q+DcDXySBH6z6u7jhblwfEvlEkCd4EM88kae0gbtRHVnNmKh0t/HgPyCEg6bRuj7isWjsm2zxizGlVuKhf6U18b0cSVqI/CnoEv74/0BqVCU2HPPu96yyLTCmKoylE+l0F0fBaD0XohdUzx4lovXOWfpGJ/iSge0moMRuAjuA0NJp895j/yIqqIwN3fKfixZQVT81C0qpakINO9pp29ZxF732dR0/6FqM3KsoqDs6Qsr7YPAMJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llGiiELk5qQBDBa5m2W6rFy6HT9h05PEibi/21qDm2E=;
 b=l82vdLhW5fItAcyYh/FKmOZgKiC2BvFBul88LNc65ooqZmWyU9g/PPw6IOSNUfey+PJxYcIomOhzNatE187/fk06Jr+v5gqkV0EJHFsgbeEB05TP2WQDiSYf8g9GsfM3F+XjtWfy66LBXU6BLL5bxv+3Xrq6/gm06NmFnihbsCYlnzfM2oixy1O0RBdvQsEAFngu9OnFiXiGPAmAhBk2PT1p3d/BIbid1ME86Egp53gQBJlwh38A0lG3/IvRX/ShC3mVV/2vZ1UWQBhdU4S5IRWfJg7Z07KZKd9L7JPDGGCkm28R4Wwz8jzxgOoEPcpaoYxJBqcVSGpA+DVvxy0OpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by AMBPR04MB11786.eurprd04.prod.outlook.com (2603:10a6:20b:6ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 09:03:05 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 09:03:05 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v2 0/3] arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS
 panel
Date: Mon, 08 Jun 2026 17:04:21 +0800
Message-Id: <20260608-imx93-ldb-v2-0-1b1fe621bfda@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWFJmoC/22NQQ6CMBAAv0L2bA0LRVNP/sNwgO0qa6QlLRIM4
 e8WvHqcZDKzQOQgHOGSLRB4kijeJSgOGVDXuAcrsYmhyItTXmGppJ9NqV62VVQ1Go1mjcSQ/CH
 wXea9dat/HN/tk2ncApvRSRx9+OyzCTfvX3dClSuLSBWVRGjOVzcPR/I91Ou6fgGSYRb7sgAAA
 A==
X-Change-ID: 20260513-imx93-ldb-c5a4194e41ce
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|AMBPR04MB11786:EE_
X-MS-Office365-Filtering-Correlation-Id: f18996d2-5b39-4df9-24b3-08dec53cc078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	LjaVLaJtDKLd8aJi/2dWLZfGAWxfy9m1/HVmFjESx9dEgmespC9N0fWMlNs+z7MMU8//T44p97Zgla809vf0GtzPFn4u6VEiveiukEMEN1/nbi0OVpbmV2RV+xiSOtNFT4i5Zl5GI3Kog0ZpGzZJz9Z7T2VUeglNPe9FFyh8Jnd4rTeicjQviT+SLDy75QOkLZrlSBw7Fb6Poe+kAf6LkbWzRQebGW/9fBZgVHuMAe5aLiT7EgdMyy8QGB3TDPkTI5eAeo5dHpruGUCzj2BUftOCZNM7ciOggRKOdBYL87uPGGIYFxhIqAzv1XkWMutdtxU7sxjKs4pl/mU8NaDzAKTbKeRF3vrMnevnaC07hSfX+xMBclkKA9jsGBL3fvvwATlDyUOSYj7ZqvvFUIsy6EVvbhoFqVqsF8faDiZYr+cpgl0c/mZa0bv2ohhWJl1atCYgZj4z8cOmYIfKxKsqXYaNBHX0i8DC7aobNuN7zLhsqjJO5+A2a6n5YyobOqj6g0D7EFKNlBKUtBb8LJVhv3hzEPCxaFk7mtx+l0347685EmK/0rbXQITNEOllVP0vy5SmJOqVPQhJSziFCAd3SRonvoacEdwIKvnZ0y4YsuHeBoK2jrjV2JR5uR8zLu6X2Q0ZaurdCB6orQ4ByCOl8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk5TZnZwaG5mUVZza3FQWnpiK3o3NkowbHkrK2dCKzBvQXAwZENkMGloalBj?=
 =?utf-8?B?R2JQbW1wUlp5Wk9VaWxvaUxYQWdlK2FOUWMrN2tnS2Rzakp1N0VEM1R0dWFV?=
 =?utf-8?B?dTA1eVllS1ZGWEhKYnh6VGw5OHhOSmhyQmI0UkNzZEpBbXB2aVpjODZBTlQ0?=
 =?utf-8?B?SW1KeEFJTnRra01Vb2ZRdlg5bDBRaHJDVWFnNTBCSG1wWjRwNDA3OWN2ampy?=
 =?utf-8?B?RlpSLzVXRi9RZ1pqOEVBSTUyTjZnVFFZUTd2M3FzMjdWazQ2TU1xeENvZi9M?=
 =?utf-8?B?c295MU0yVXZnT3dkUmRnYWNVS3NRYTI0RHhpZVFobHZoc0VxNktqMmMybHps?=
 =?utf-8?B?RzRHV25nMTF6WStmZ09TMlg5cGhZa1BrYVdDZkFRYi92WjRUSG0vOW5GUTVD?=
 =?utf-8?B?VE9FMXh6b2c3aWVWSkhud1k4dkRsYk5UZXdOWlMrNmU1NkhrVk9aWFFOZTRH?=
 =?utf-8?B?Smo3UXpZcHpTYnRKd2ROYWE0WkFwSVhDaTZhY2szZUxhbHFYSGF6cWFJN1dn?=
 =?utf-8?B?eUFEYmNqOXZUTFl2Y0xFZ0FIZ3BGay8rK3YzcThSa2xwOG92UzBaSS9weWZH?=
 =?utf-8?B?bWh3MXg5dFNUSHV5OGlkdUpoc3hSdUd6dzlrVkRWMTJuVnBKc3ZCdllIcm0z?=
 =?utf-8?B?ajdvbGRBSW00dWp2SFRtZlZuUzBWRlduRmZQZXVYZk5lTGNNdEliRjZqdFdL?=
 =?utf-8?B?bi9Yd2Q4SUQ5M0dRR3FwbGgzNnltVlBZZ0RaL0kwV3ZxdXZSVDE5YUIrTGlh?=
 =?utf-8?B?VDNqMUxBT3k2VFFDRE5sZzhyaXRTN1ZLeGpla3ZvTWN1Zzl5ek9MWS8vazRy?=
 =?utf-8?B?T1g3WEJwcWdKVFBZVmI2cXVlSjgvWTVOcnNMc1g2Q0Q4ZTE0THRISTBVbDVn?=
 =?utf-8?B?NDhpZ0FONEFrTlVldEwvZnZkUVhibC84REw4TWRqT296a25XQ3ZTMmk3NXV4?=
 =?utf-8?B?RkFjQmVVSFdhZzhLaFhtWHBzNG9pS2NUV2tRaTE3TjJjVGJKeHpXbzE1L2lX?=
 =?utf-8?B?L0h5V0hRLytBOFc0NUJnaXo1Qm1waTY0RHdpdUZZZ000ei9ncytVb29lSm03?=
 =?utf-8?B?aUt5cVFQakxBRzNzS0tkR0RkZGw0K00rYndvdGZuUWRsUUFMSFJiSVcyQjFE?=
 =?utf-8?B?WGNzbU9NZExJazlmVGVmYXZFUDl6M0xKZjRkbThSNzBKUVM2cUJMS1h3dWg5?=
 =?utf-8?B?TWNSYURFemYyTFRoVUJtb0hzK3R5TytwNVJ2NG5zU0lmU0x6WGYwQTlrTjhJ?=
 =?utf-8?B?TXIxVTZTaW1xdWM0VGNSdmZDZDRYOVhLN1ZqSzRGYmIvU3lKcTMxd2ZlbWp0?=
 =?utf-8?B?MTN2QlpSMDB1YVhMbW9aRERCTkdMQ0JTZm5jMWZVZFppSlhuZldJTmZEa0N2?=
 =?utf-8?B?VkhyUjdNblFnVzErUjd4c0hzNGVkQnZSeUNtRVNONXdPdEhWL3k0TWJhMFFD?=
 =?utf-8?B?ZjMzNFlLS3lGd3E5VnNwc1FvWC93UG0xaGdENnJ6WGR3bTA5ME9XSjViWlg0?=
 =?utf-8?B?ejN2K05LbUVDcks5Z3Jrb0k0OEdLeTZhRUh0blFMMDlPYWx6emgxTlJ1UFA3?=
 =?utf-8?B?V3JTd0tMdXV0VmxuNkFrTXlDL09TYWNndHp2dkpzbmZKTUlDdTFhczFwRlpz?=
 =?utf-8?B?cm9sU0JZdzYycFlabUFTTFcvc0o5V3AvV1J4OXZWdlhBVFpuQzNQdlptTldu?=
 =?utf-8?B?cWpFOWNTd1M5ZFFwbXYzdnBzaGFQT2RDZ08yV2JUajJ4YmhZcys3dDExelh6?=
 =?utf-8?B?TkdWaGJjTE1rMlIwVG93cUw1aUZ3VTVQaUY3VlA3SXdlcjFDRVdaVmI1OFA5?=
 =?utf-8?B?SThsZ2FJWUs3Q09TbWpEQlNmbVJ3MDZFUHRYQ0NZSHVwbUw4akltOERpdGd6?=
 =?utf-8?B?ckJkMVkyZUE5dzFSQnhoREJyRDN6M3IxWVliSUgrK1BzRnEzcDVQbTZ2S1hJ?=
 =?utf-8?B?TWFzdDR1VHdaN29lSWJsSzZZaXhaSXpJeXM3TGpUeU5KblFFY3JObzMzRm5u?=
 =?utf-8?B?elRpZ3QyRGNMYkF6bFVEV203NGpVSWFmMGJUUkFtMXp6REp0ck5FTEJUaXFR?=
 =?utf-8?B?OHdNQ2N4NFBXamZUZFA2RlNoeXZzdFh3SDRKa216YVNYRWtKbUg3Ujh2M2pO?=
 =?utf-8?B?eno4WGFlSTFhNUt2Qm4wUGJrdzJhTGtzNW93M1hkbEN0MkpTSE9NY21zSU9M?=
 =?utf-8?B?SHBnVFRvcjlEVVVWS0lTZlhyektrZmZ6bzF0Wkg3Um42bXhGSlhBanNJWmRh?=
 =?utf-8?B?OW12VENoTDZEbWUzTTdHT3pQWTZLV2RZTVZ5dUdOcHh5Q3hpY05SUElJVXI0?=
 =?utf-8?B?N1JoMUs5NlIxMldwYVE2cDlwNUNTV2JqYUhaNmYxN3hjSk1mSlVadz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f18996d2-5b39-4df9-24b3-08dec53cc078
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 09:03:05.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8hJiPfBNwmnsxVWnHO8/A3kJHMSehXrsViRi+WB8dZ9VTr5co45dChlRsh/QAiauM3rA7VJfdzfWr4JG1+MRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11786

Hi,

This patch series aims to add DY1212W-4856 [1] LVDS panel to i.MX93 11x11
EVK board.

Patch 1 allows LVDS Display Bridge (LDB) child node in i.MX93 mediamix
blk-ctrl DT binding.
Patch 2 adds LDB child node to mediamix blk-ctrl node in imx93.dtsi.
Patch 3 adds a DT overlay to support the DY1212W-4856 LVDS panel on
i.MX93 11x11 EVK board.

[1] https://www.nxp.com/design/design-center/development-boards-and-designs/dy1212w-4856-tft-lcd-panel-with-lvds-interface:DY1212W-4856

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changes in v2:
- Rebase on next-20260605.
- Disallow bridge@20 for i.MX91 in patch 1.  (Sashiko bot)
- Cc Marco.
- Link to v1: https://patch.msgid.link/20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com

---
Liu Ying (3):
      dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl: Allow LVDS Display Bridge child node
      arm64: dts: imx93: Add LVDS Display Bridge support
      arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS panel

 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 39 +++++++++++
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 .../freescale/imx93-11x11-evk-dy1212w-4856.dtso    | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 37 ++++++++++
 4 files changed, 161 insertions(+)
---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260513-imx93-ldb-c5a4194e41ce

Best regards,
--  
Regards,
Liu Ying

