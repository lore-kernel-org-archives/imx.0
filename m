Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C503AC0DC
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787317708; cv=fail; b=CG5P60MK/pl3iu6cTzRFbfO4/4wT68ZjZhmTXMz+hLXhaDoNCaLBuqQWrNnaiqpS45IlxqxT0RTrzwuBIXS4s/MCltV7NYMEv05mRiPZy2JW/OWqb16ZiE3MHIpttwqu3ZhA32CawMqDzFDmYgXbiCtkHnMu3dJFh+kRqSk/wxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787317708; c=relaxed/simple;
	bh=sCOCOE3D3sNmRlJ6wkRabdd9VcKmTEZM273iWpEOiHc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=a22zVIAKSP3KbF+QMtDLFKyExAYxfKCq8mbvyx9GtDpfGbFV6+k/ABPs+gBgWVF/WLiMNSdJ5RyLzKpJlbv/fuepG+FPY8vUSXOxLHUxJhPiuCWSIaSAJLJEVUwBcpy7iPdrwpvkgGM3lk1Y11x7GLPOZ834YyY1pV3GfTdMYRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=crOJX8tp; arc=fail smtp.client-ip=52.101.66.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="crOJX8tp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJwQcCbEngj6btj8dX1ZbkzUAUch44P5ElPZTFnZP5+MKOw28YsuVlf99/t0AsEzEKuwIZIirQS+HprRWvTTpME/pfpBG1KjgAOZlvFkWSRwqR6MwX2GOtNzBtvHgqGpCY2b9sviqbKjSF+NrosR53O1WhpFKX5OpZKyHde0vSYVnebVfbDVXc4Nw87/kxDRPojjHQWu0CZLdbJPReVm4WZgkyOrycPpeCo+KtNF9FhanBTNY8td7INgWy9MSLNS4VJbi/Ip/EgFWjEJvRRUpGJjKKQYeXHQyLcsm1SWKCFd/cypfhZR/9QKz+Tq1kD0VBS23RfOxCHZMAxi2l0QOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyXLBr/NzooUBS0AG6J6qlKEkCaUmx5ngg8GhJ5ttUY=;
 b=QPXWYjtmq3WzsjTW0B5n8B1jjuNleUoqEb64bUfKsIM8p+uoS0TYC7nOS9CAdYEy6CekyZEaGwdCi0I5Wpz04E3WTneHUOeyZhJyot5KMlT4mZ/9MsMuvMbKvaG+Q2Qophfz9530ERmSGm5PrGxy7LC0zitlCWJWYDubAg5XVVoZVj62QIlm5yr5lPHSnv4+LnnxqaIlTWeLp9ZZZvjt8XbGlNKnpXMFo4OCxoeTiq07EMzlPL8M1sJbf9jhMWsy7YosnfH/1I7AUbKMY8JqpTIHjO2m4uAnGNUX/ICFNGc0hE+xov1sy/kGrZgnd6LFhC/JyhBnXYYhaFzImJxOHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyXLBr/NzooUBS0AG6J6qlKEkCaUmx5ngg8GhJ5ttUY=;
 b=crOJX8tpKLTc626kQ72f3foWE8xNT8U4Tnjrhz7FKIfgX7QkLl07fwNZzLQj4w+Sm5vuls+wbVqDJYdEyFpL2hXBdgt9hXg8FpiZC+3MdVKQDHTit4dPvJLbJ/snjXUavp5/YTcMBQB3ocaUEVQ2SLdi1Uk/WVPiAgfjI2yfdYKGIFBMkgiAz0KkwPxm2Ybgzg7piYkf+jXK4C/paIbBphZMU9JYDKNRV3ucMMPxLYIPDtBmeITWxxaBtYQOy0VtCO3gRZ0PVzgdlQWcjWIGt9hOnb3Gc9DUjmFm+vh3Jg4tYZLM3g/yoWK2NIqIWYQHM4beKXR3wyooObPHxNCtWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMZPR04MB191951.eurprd04.prod.outlook.com (2603:10a6:20b:7c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 13:08:01 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 13:08:01 +0000
From: pankaj.gupta@oss.nxp.com
Date: Sat, 22 Aug 2026 00:06:11 +0530
Subject: [PATCH v40 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-imx-se-if-v40-4-74fbce2f2f95@nxp.com>
References: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
In-Reply-To: <20260822-imx-se-if-v40-0-74fbce2f2f95@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787337485; l=13976;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=1mW/OOYaqrs1NQjnxdWvVd9M+GzE/TcGWScmEeN848Q=;
 b=n26AKUPYT7jQfRNKDTIqI58JWn9vpbEiVxHPBvTeKBnDAiqeodgUVRpSpwzoNqD2tqOWPdhl0
 gkcXCyXNrEmCf48pWsRt8qu2WC5X8d1Phs3vr/WS3j7ONiItHT/V0LG
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMZPR04MB191951:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8aa364-2569-4d8c-e27e-08deff853a6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|7416014|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	2+i4sNdXV73/vM3fNxPqQ+qT0Y64V6gyQmsOHGdSVHM+bP/uVr8kHrRt3HK5c19w7dzXoSsQIhYb48CvJ8wKq/pn68EfjTeWVJwPg6aocNfj9WanL7p19Dh/zhoUfW9E0bb3jadh0pwipfbKTc2HpWUSX1HxvATA9SDRqeGRc39V5AJUEGbEIkYuo/pGs5SmbAMBx4xX6aNzZZ6iyH9OnaC8+t43NmLLSvi99Lmssaq4OEkrO/EX3N8a5eTJcZ5iubiO6wqH1AemwRytO8LpLCKLZzaleFhJQgjO3NAib+/qV7cQNAWVqBIpKHfx+E4FniUr9JOaU63rdkieB536cmrk981qlVMR+FCYOMBkYiBYG4V0Ls16xSxE+wTWf6uQjviTQcI6a/Dj7ukcH63ZKcVcJNZw4sw0NIYcVzuXKtvxJghpAoqbXNB3970ztlteeOoVVa0IBL7pXqByl2lXZYyTt2L7Vjy/nkW5U0qtgdRtTQrLWY58luErX9xkmo5pmIxIBCDRJELTxmPbZ167gytkMV8AraAJNI5h+MdhkZ0ab2/3kUxAtmfzXXbad7SB4lYzBFmXLqIJJfqZ/Dz7g7/FDnyfjoKdovwOhp80/BjnzduTyVZaoeIGSf6OnF/V9TExakTVAA5OQvP+mr6BhuN5XxoLW9uisxfJ+KPatf+Pf38tpVEnJGq+OwDbMY77ws9YGOFbqPRqms6/MJdaMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(7416014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVRNandKcXoyTEJ3V2YwNGJkOGk3b0diQ3cwL1o0RTB2R0xJcGxMN3lMUi9s?=
 =?utf-8?B?di9YZE5BTFBRZHVrUjlkSVc1V0VoOVp0S2VEbXFFS0F3dERDdWZkR3phVjdL?=
 =?utf-8?B?YTZHZWtOOExBSWNuRldRWWlvc1hraVJ5Ukl6NmVYNjVoUmZEV2psemdyWTZ2?=
 =?utf-8?B?NU55UTFVc29uRmlVRzFGT1QyL3QrNU05dUVYc1lnRExUQlorVnFiNTV0ZFlj?=
 =?utf-8?B?aDd5azZiSjBjdkhCWmZEejMyODQ3ZGdiMmNHNnkwRWFqL0JlOE9XYlRVOVJq?=
 =?utf-8?B?Tm1oeWE0WXVxNmI2TEVxSHRIVEtIUk5yQkd2MFRBRytJOTFkbDZ1d2VIU294?=
 =?utf-8?B?ZlhzSlhMV2c0SkxJMTcyVnVNZGZqaEp6SzlNbHZXdE1yL2EweitSam5UTXE0?=
 =?utf-8?B?eHl2Sld4L2UvVWE3ZDBiVC9obG9VMXl3UzZXek1CQ3VTclB3NENGY1BFSjlH?=
 =?utf-8?B?eVh4UWxmcE5nMGd6bHdpVXZ5T0FmN3dpblZBTVZjVmlZRllzMGFNWWZyTVJt?=
 =?utf-8?B?NmVtZ2U4UEk3UmVRZ3FOaGFNWlF1dldFbC9ER01oWnNtWW1xL2UvcWVyNUMy?=
 =?utf-8?B?ZXBqRlYxN083bktVemRicGRjU1Z4MkpzakxROHl6ekxJV3VObEU0SEFCaXp4?=
 =?utf-8?B?ZmVBV3A1dk9MQXh3djdTclJwc3lTUmdORkY2Y3JkT0FiNElqdVpPYW5aU3d0?=
 =?utf-8?B?TnVBL2tBeFFlallITHpKM3FMRGMzMnNNRlVtYWx2MUJ6UWtCSmkrMTNWU2E0?=
 =?utf-8?B?ZGV0SUdhY0hLYjV5ckNtaWhwbTJ1d1oyNTM2R1U1NWVPdU82UnBtS0FFUG1n?=
 =?utf-8?B?MDQzZFFpaHVEWkdLZWVkT2ZBUzBUeWNiUzdNRmdrbXN3SndkMVlmaitmdjBJ?=
 =?utf-8?B?ZlQ4TVkrWjRMOGN5VGNZK2MrWG5YVkprRG1MK20wSmRuaisvMFRCbkRBZlhD?=
 =?utf-8?B?cjRwa0hqMEx5bDlldjJuVStHZFBYSlIvNk94YllmWGpYSXUvbEpFbnkwcW8w?=
 =?utf-8?B?aXNjamtpcXliZk9acUUwQzRRbkQ5a01YZW95bmVseUpoSmlMb2tVRG9xbGVM?=
 =?utf-8?B?cloxR0dPajEyQmJrWWtybjdGdE1IZjc0SzVZb1pkWlNxd1dLVEhOWXhQdnpl?=
 =?utf-8?B?YU9HZWlqRms3M1BiMEVhQXE3VzJHaWt2ekRyU0pQV080S1RPL05sRlVyMVBI?=
 =?utf-8?B?emFGNmxVditaRDlibERFMDBibW9vV0dLSDJSL21tMVBxTmp2S01rNUxEeW9x?=
 =?utf-8?B?WU5SQnBkV3Z0amR3dXlSQml4WGxYT0duY0NBb211Z0twOXdvQ1R2S1dLU2tK?=
 =?utf-8?B?RDlRWHY0emJhUEtPWFNVUDJsbVE0NXBqSUd4TlFpai9JTFhGMVlSWnorT0po?=
 =?utf-8?B?L0xDUWRoM1ZpU3Q3bERmNDhaNW9RRXhWTnpkY3BsNmlMVnNWZlp4djFwOENo?=
 =?utf-8?B?V2dMUjh2K25JVm9xZkJNV1R5MGpXUU0xY1IwTnE5RDdHdWwwRWNzZFVaVGdT?=
 =?utf-8?B?dVFPLzZybjhSVmpHZnNZcXRueUp0L2pzR1VheGovV1orUTA0empqaTNDcXc0?=
 =?utf-8?B?RzhtUnRIUVBVNDB6RVBVWHdHcTBvQjNUalhUWWYyQmhsdUZtT2xhRXNIc0Ni?=
 =?utf-8?B?ZkJoeU4vTWFvVmZSM0VRb0lpQmFHSWhBQ1NvSjg0cHpId3JMODlWdHhNcmtC?=
 =?utf-8?B?RkFyTEFRY1dFQjdXUmwyMDFCMXp2bUtHSGM3YjM4WTZwdjlSMUVaREkwWVhv?=
 =?utf-8?B?UTdLVzAybjhEYjNiZkw0SDJNREMyby94YnluZ3RhUENYKzdJajVLcktPMStw?=
 =?utf-8?B?R21IZHhPaXZacW9laWhnT1JXQjJzVmlwbzhGTnp3TGJIa1R1MSt1R0Z4WVhC?=
 =?utf-8?B?NER6UVZmTFk1Rml4emJNcU9BeGkzaWgrUVcyQklvZG9Ra0tYYWlIR3B4Z3hF?=
 =?utf-8?B?anlqemtLUmUyODI0WHZqbGUrZy9URlJBSUFSTzQxSmQrdzdjUC9lK2Izelgy?=
 =?utf-8?B?R0ZMS1lyc2Z1aFB6ZU16RVN0VjRmU2oxR2RVTWF0c2lTODd4U1VoOEpCL0VW?=
 =?utf-8?B?VE94ZmF0TmRFRkpuTUpUTmxJRFdIVG5oeE9UeHZtbkhOV0dOMzBTb1lVdGFK?=
 =?utf-8?B?SVdIaDVYaytheWRMRFgwTmU2TkJlMmZhdG1GUXhidWMrbzk2ZXdWR0FGb1hB?=
 =?utf-8?B?QnRsZU00YkJWRHg4WkdmYUVKMTZpT1haWStHMHI1NjFKOHhrUWR0d3M3TVV3?=
 =?utf-8?B?TWxNZjJ5Yno0amNQdDAwRXZqb0MwT041cjZVQ25FaEtqV1h1cXFhcFptQXlt?=
 =?utf-8?B?NjNicXJhZm1nSHFGVE1ETjRKK1hQdjhlZitDditqelFjbTI3aVFuNDdKd2Vi?=
 =?utf-8?Q?dj7uYtjO39s1eTtWl3ENZkFVyJ14AZ5COeE7l?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8aa364-2569-4d8c-e27e-08deff853a6d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 13:08:01.1054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwW93Z3oc/mj8L91tx+18fJtl2I3V/EkLFVDTQVnhCyMWbzulDVAHk6dCRsA60IbM7O6gNB1uEDGdQMoXhqN0h+NRn2Wn+DoN1UxboEXbcs7htZeTClYzVjgFjU5VFs9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB191951

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
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
index 04ee5112d346..b662063c3b1c 100644
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
@@ -134,7 +135,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -146,9 +147,9 @@ int ele_msg_send(struct se_if_priv *priv,
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
 
@@ -158,9 +159,10 @@ int ele_msg_send(struct se_if_priv *priv,
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
 
@@ -172,38 +174,41 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
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
@@ -214,7 +219,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -243,6 +249,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	const char *devname = NULL;
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -266,7 +273,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -280,8 +287,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -296,13 +303,14 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
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
@@ -324,8 +332,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -337,14 +345,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
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
index df3d1da28a75..2ee0f70c38cd 100644
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

