Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863273C3450
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 11:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735913; cv=fail; b=cUBlYjLc2yszp6EqiUT/7k9kl/tr9M291nyxjIiuhRf0D57QkBRBE51E7FQsvMfdR5WOkBqbkc8bj11DBaVlX4LaYK+2aob5HcvP3F0KF+9KomoAhwp76jDub5iEDfWNCPP9hFUJBWEzXO/CaLscVu+gc2ue/ad0dDD6vt1lJSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735913; c=relaxed/simple;
	bh=lb/r4mCs9cSpMF5sVv3NPJPmzlzi4wjHXBsRInNfp54=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=fhR0+a7vQcEc/V1PS3oC1i3wtiCWm2ET+C8TuPuiZSyG6xRMPcAya28GySZDMOQuf/0zTrJ7OAsTA5r9aCVT4MuX3xLfQXWFYGGXO/FKjVf/YPRZw9GUPgIIoOwFiDlhTBgOc3n1BVFbg4Bi3gWjkey0cB34zy0dwK31y7CW/A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rxH2bVXE; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rxH2bVXE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQwfmvo/riuXM34jthbePUo+ST4rcwBjxMcczX77Va+a4jkJZ5Q6Gk7/iL86ObqVaotTbSs+moCh+U31trsLV7w3rbfx7bcos5dDdlVrlEfIPjsOqQC4dqL7/Ag6wIdp6E9Odb1uQWOkNElvrGp+SaNzsEnO+jCiN9NP1Wl0zzPBMKtOJ77eo1HcetoE+ex60YET08JK40obVYC8pwKS5gfdJj9oswCiwC0xTKoPaiTgZ9dt1MtjRD02JoYK0AKQwCwtItFjbkajV4FAJl7H15hOHR8DaKLW/tMJkyPUGlYVO5A/Ji7BYfqPBB7SPOzeKNKz5Q/UoLUi9hruibvt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cu91uC2OuwLs6uadNX9Spimyo5+gB9vkHExvAWjsviY=;
 b=snknczhLP4HR47b+ANAOAUeAaNFUHt+3PWOsYYEVQegyWhJSZiFlCwl+4z1HRr+9BV1CHsgLiyPsn3QtgWyjDV9MguqOxzdEd4H3uPD4UwCDIAeUrLa4vY6AXJzwqYxniXmcY1CmC44T0OL2Lu+iBjhleDlWErfumzSqJn9Fr893u9pGQ7XQiF6ujmEvxpPjhrxfQkw7vn8ASZ+l7oeopqvNxO2asYmUklDyIWLyfEXx1658aLTP8fFeLgZmaPBxOCrA0aNFJ/63D6Jv7domp+P/2DIxUqH6CUDXw/4WZ1djW9+DntPT7hpHg6/ZDSkdDtISvH7fo2eQMUGVby+kQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cu91uC2OuwLs6uadNX9Spimyo5+gB9vkHExvAWjsviY=;
 b=rxH2bVXEth38a0O6tVV57jmxybC/Jc6eKEMbM7Z6R3uBjYPEgUcYVWK3BZRSo9GSCaI3mw7qZ+eZ1duWVmZ9TzRb1xerjtWBMRRmacyVHUM+RrjTg1Y9Yz1Ps8ddYkrodjKxJQ6ti+XnJ3KS0NPFPGixp4z1Cuv02hlswo/v3Pq459v6wp0EQwUMubnowNf4a3zmyaUqpVWOq2ZO2r256IuZZ/tJ47MbTPqnuOjJSDsy261ArEMQhDIbcWbKK0X0bRnfomxUzk8+GRJySDgvc5gt9S5CVX+ezS8ALi0bSSzUO3I+soeFZBk1oodIvSfRfdt+jmpdCf+lhNL+Oa7g0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10686.eurprd04.prod.outlook.com (2603:10a6:800:25d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 11:58:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 9 Apr 2026
 11:58:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/3] arm64: dts: imx95: Update for smmu
Date: Thu, 09 Apr 2026 20:00:00 +0800
Message-Id: <20260409-imx95-s-dts-v1-0-858e83ae1a37@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCU12kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEwNL3czcCktT3WLdlJJi3VSLNEOjlGRLk2QjSyWgjoKi1LTMCrBp0bG
 1tQDSopD7XQAAAA==
X-Change-ID: 20260409-imx95-s-dts-e8f12dc94c29
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e0aef0-648c-4556-c96c-08de962f4f4f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8VINqRaUxrWSDm3BxaHUDPxkf9Ywt6lBe8adksCYJTd4WlWl7zGXGE9lii2JHPC3YPymxu6TGY0o3isv/EpnNtGstvdyA+fNtgMORtm3o3UTbjmb141490vJ8bwhaIo+81anxJwNF5UUVijTX388IXn2EGD3rNwVfUfr1lAENqLs73w8+fU6TrdY2f06dJSzFck6v1TgcNz6BXhWxSIW4965NVq171H134sJE7Vfddmk+bj/IavSxaCzCyJgNPnDM7grL4r6JJVr9qB4mEX2feS90P9cXuV2x3JI19uDq+66Ma2XOkY6K1gqWW/BnEB4Dixv2To5niFw3qAQtu+O4l7I/Dae+qn6MCFPoRalpjduJIm3lptyYXxf5Vxt8BqnHUo5fev2ZfMOYaRRR6KIkz/IIT34nirg+J48bMwgPCth0vcHv50s0zjK2nHdgH+s/nK2+m/bytRiO/ehf9oARj9tbH7BheqJDh9vLy2+4yrr2YPHdyZ34JHNxSip6RlozxW9r2fgKsOV2Jb4HIZwvfSBrogwmXn3WDpcCU6BVnV++AGO1De3jraXyUYaslpHO2dPcONtOW7RCQ6dZMr3CZXzNx5Yxfl1EwTMMC5POucIkzb//rpWLahHtMPUvz6aTy1zy1rXPKEy8r49+caP5tyrA7DtfFxdeWNbBp+Q/ztj+CDJwe6XdCJ2TB5IVsybdCYAKYSKPTLW4MrOMfAxmnZNWbj0hqNr4ifEouADSiQQEJ0Y02Dlwfd3NBUqAXzjjEkh4+MSmXdKaxiswFTeeW0L/G0qamSM62QUbLlJcW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1JOVjlmSTl0YjNEV0hmVDJ5RXNzNHJJWjZMUW0wREROcFVrM21OcWlQRy9j?=
 =?utf-8?B?QlJRRmRuZWkyc0FCSWxBeGxrZDV0c2wrbUxFUmhtL3huTUlOdW5IUjZmd2xv?=
 =?utf-8?B?SUU4bTNrREU5MWhvVXdqaUxIMHYya2poWm4zcExtRFdoOGlqUXRodWZyUlZO?=
 =?utf-8?B?bkl0dGc0azQ2QlQ5Y0VTU3JUSW1iRml2K05hUkVHazc2VXNzYUZLcFFzdkJ2?=
 =?utf-8?B?WjgyQWlxVFlVeGJaRTRZWC9MK2Q5OWhQSktHWVBSZXFNbWwzSXlhU1BOaDMv?=
 =?utf-8?B?K0F0ZzRQL3h0QkcwakY0cVV0NlBHRE43WUN6Vk9HNk94bnV0OS8xRSttZXdN?=
 =?utf-8?B?LzhSRHZDMmRNc2lqRTV0TE9BN1B0bnM4Vkw0bHhLTEhEazVPNjJKQ1YvOG1S?=
 =?utf-8?B?QVhRQS82ZE1JcEdzMWVJOFRRNDVQVU9FNlBIcitlNGsxYVp5b3QwM1BRVUJM?=
 =?utf-8?B?UVFBR3RvMXQwdjVWSXR2d0gvWkZPTXo2WFJHSDlmRDIzMVVVNkZMcXdzaHdt?=
 =?utf-8?B?L2l3aHltbnd0NkUwbUZzOUhzSWlVUmtXYnN6a3BCUXh5SzNpWTVuUDFYNENT?=
 =?utf-8?B?bkRjMGpvSjAycE5XOUttQ1BZY2JlZy9xekVZdm1sdm5PRFQremxRSmRzU3F3?=
 =?utf-8?B?NUg5SDgxN0RVUk9WQ2NQL0Y3V1VkSjNBYkhvRG9JdE53UWNpSkpsK3dxeFJi?=
 =?utf-8?B?K2hRdVlRNjBUUnpoUU9hZy8rU0MvcVFtdjlSemJCT0EyM1hFS3o5MndvTERh?=
 =?utf-8?B?OVA3RW1oTXEyVHJ0dnpMdU1zbGVzTENkTjhmZlBsQk1QRGpmZldaZHVZVkgv?=
 =?utf-8?B?VWJwU01nd2ZVeFFVdTNnb2M2TTU3OTZUK0hkZXRQUC9KU2pvQ0JQYTJXU3Fk?=
 =?utf-8?B?dWcyOTdQaVlsNzF1UFIxTHJQdXErS2R3SFBsMXlzREtmOVBNUncvcHRNZkhJ?=
 =?utf-8?B?c205WTF2NXY2K3V6ZUdKcmNmaDJRTnJvUDh1dFZ4TFJ5WUFha0s4WDA3aExW?=
 =?utf-8?B?MGhJeXorUDdCK1o0cWpDL09nTVZJQUd6NkhKMDVCWDZ1blFoeFkzVUU5WUpB?=
 =?utf-8?B?NFFUM1l5aWs0eTVCbThlQjlSTUVKc2tXdExDcXRBMzh1bDh3aDVwR3J0UGdp?=
 =?utf-8?B?L0NjWkdlT1dTYVR2cXpMR3Yyd3VKTEhoZFdjSm82YmJQRXd1TDJDOG16aUpY?=
 =?utf-8?B?cjJCQmthcTVpY2hMcEl4VitHdmFSOW1SYTRXWEZSOUNmUHZLQnB2eGtXYml4?=
 =?utf-8?B?RlF4SThVcjN0eUNUc05BUEpMaE5aZ01pOHB0MXh3YXlxK3BET2w5VURoNWQv?=
 =?utf-8?B?bWdMaXhJZkpEbVZwWmFMVHhLNWtVZU9xK052TVNPdW1iNlNQVzZJTStpZjEv?=
 =?utf-8?B?blRwemlvakY2MHB4K1YwOVVTY0NteFBBb2Z2SmtKWnlDODlyWU8ydUp6T3o2?=
 =?utf-8?B?NGVSV3ZDTEVYR1dPTW5YMHFGc3k0V0lPeDhlVzlTM2M0M1FiS1dYK2tlRVU1?=
 =?utf-8?B?Y1RGNGJoNVRTSk9ZY0JKTlZUK0x0c1RwN1dQVjVsZGVTS0pxeHNRcnJLMzlO?=
 =?utf-8?B?d2JUQ0hhYWgzOWtTU3krdHFzMnR4V25vaWdrRXB3a0ZFVDI1c3QrcDNlM0gw?=
 =?utf-8?B?ZGNSMmk0d2xIOGVxMSs4U0wzdkRodzhRcEkwZmpoWXNrRGl0R0hWblNLc01E?=
 =?utf-8?B?KzdyUDNlR0pqWU96ZGhaU0lXOWRrSGxmbXlRSjBSODIyRTR5QlpXSEZZRjJV?=
 =?utf-8?B?d3dUUlZ4MTBsNldRL2Z2UUt0ZVJoTnF2UzFDRkJkTHcrVkJFN1BUMDRtMDhI?=
 =?utf-8?B?VDdBcGpML1ZFd1dHeVZPOUFZcmlJb1F4cEQwRlkwS3pTQW1pY2p2RDRGOEhI?=
 =?utf-8?B?NW1YSStJOWZRdkFETkZPSDJBejdoWUNRczZJMEZiaS9mZDBtU3pHRUZxQ0k4?=
 =?utf-8?B?ZTlyZUFpcE9iOTNFSzVNbjRqVS9GQVd1T2FUeUozNVN2K1M2eWd3T0Uya1hv?=
 =?utf-8?B?RXMzTy9FejliTW1LTUtJQ2F3WVRpUldhNGNDTVFLVE1RZ1NYR29uQWlFbXZ2?=
 =?utf-8?B?Q1hCMHU0cEpmZ0JrUTROMzZFdmhKZ1U5WFVxendHZERJWm1QeGtUMzlUZTRL?=
 =?utf-8?B?c1I0RUdOYVVKNzJQN1FVb0RjUmEyMzhUUmRwSDZxSGorVzhoQkZVbUhHOW9C?=
 =?utf-8?B?U0dGa2ZydVMvWkVya245VTZlU0MvMTBKWU5qK0hUVTk2ZnQydXpMb05WZTBQ?=
 =?utf-8?B?OGw0WTFmSjk0VWptWTNGbE40b0ZFMm02SDh2RytSVGQ1VWxsbTJVeklhNVBw?=
 =?utf-8?B?SHJ5dER0RnhSSm9CVDJhaU9JS1kyR05hd2U5QzNFRHdlU2wyOFNQUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e0aef0-648c-4556-c96c-08de962f4f4f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:58:27.3499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyFdWJbXP4vhVkjtP1U2iZK7yZy7NQqu3bSeDgyCMA7cIDkRadIlquat9vtseus/6oe2+jNMCy/wGGEHQN/CQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10686

Update smmu reg size
Add SMMU PMU nodes
Enable SMMU by default and add iommus property for sdhc/edma.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      arm64: dts: imx95: Correct SMMU reg
      arm64: dts: imx95: Add SMMU PMU nodes
      arm64: dts: imx95: Add iommus property and enable SMMU

 arch/arm64/boot/dts/freescale/imx95.dtsi | 91 +++++++++++++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)
---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260409-imx95-s-dts-e8f12dc94c29

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

