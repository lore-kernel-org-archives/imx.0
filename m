Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5114028313D
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532180; cv=fail; b=oqtmapGXnzdVQcbXdU5OJuE8hFtlW26XlbLiHuXHml/jk4LTlrAUOOghJVQlcq1+WOIpj4mVmC6Ac1JyPBS4AOac1YxSXVcTkHqS/14ywMlQsupQJ4OlRHWQtc5kqj6dGFyM1qRdl+GyDQz6uh8BE7uZ9Xl2Y7mbb7trTwguuHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532180; c=relaxed/simple;
	bh=JM7lE8E2A+6T27UpZ3Reyx2/0wOnZwBrbETyXji34+k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=JTtHBo8Py0siUolf5hHC/y31by4SnV4E3xsDayneN2VQmkxJlkBCZRuDujTCXGIOUsTG/gTNxFfK/J4lY8JB9BdgjrdQ+BwlhEmvwyh8hlmKqua8yWFxTWSR+dNTzRTRV1OItdJlHXHqcKIREV5QuU1RknLLds45KIGaM1wePM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iprvNg0g; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iprvNg0g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1jmnTTx2WOUlCITsI6RtFC7knUzVB7jZETU91nCjGdHs28y+wYbPtlq5HUZWVvZ1eP+tOi+4PS2jeNe8xqXSmtOYRMGqVdFhVurAy5RrWYLO6MxoRP76eskaaLBZ80MQ9Q1OEb39wEaPgVOcJhN9qlG8qebgTkAbPar0hepFiFolPmJoBoCK/ezibEQhIJ+5PRueEKRceHijOf9Z5PDzeFkkLmT8RAy6f4WIlH7FV+zi6BLzmdyEJaz60EyG03C7DZyr3NNrvL/TQFCcIwgihsWGKHzvBolvAke24YS6JtIdBMOgl0weRbEMOWkeaHmBPYi2W9b6E4fsAuTguhy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaQAuVhRvFPMelDB4MUbF4u1co77TOgUuI4sFQHBCso=;
 b=r3tV7g8fUGFTKavQWnOl0JHoIuBB7ff8jwdpd5jZGhnCFqqzXhuQr2Ko9CVTavxt3M35oH0Qi32l7Fj+GZ6QCBfudMnYUKN5d84QgC4JCES3ALAbEMSEEsXcSWcJ4V7/g59zZjO+6TaOwAy1m5Iri2d34TgMEfLEcPlahPUmFjJZowAk729QPwz9fdPcu6uvbDzycMZWiooqMeZ0PNmIAJVcjnMst3clt+IBV2thuAf6D/HmgbqJ9H1MZdxWkH+XoQFIHlKroYThBU0eFtegmKnLpn00GyEIQBMVzKRKxNXMRzmN2mJamQTC2sPri0RP0hS1LS0Gw090YcF/6BW7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JaQAuVhRvFPMelDB4MUbF4u1co77TOgUuI4sFQHBCso=;
 b=iprvNg0geQeiICShy0XdDgDPNlGaEBMzI2H+3cQ+nYLRt3xgzlKXKOTQs9cNpcrJVO+pGaAkOyO4d+6fbOjaq75JUpmDV8aWimHda8gUIc4nWjK+5MSLcF+Mu/2JWl8rJvOh8gX4Eo1TdBnRQ1bfQ5c8o6LYpbbwSXUgceAtiG+E2hyIyY+ypiZn0GwtK7FcpR5GuyU8U5pwCFkhuu7Pmxlpb2/W/zKlj01BzKInjdNWEt3+YSd0L+h/QOeAApRMkLFm9h6vpQBMNnSMf7uEY9jCPAB6P2WXOlCOqvZwHtE+PVmI5nJy/OkqCGiXdtlxawtHw2etfFiQKQUvTMAeog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 13:36:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 13:36:15 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 amitsd@google.com, gregkh@linuxfoundation.org, kyletso@google.com, 
 Xu Yang <xu.yang_2@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260312071609.388047-1-xu.yang_2@nxp.com>
References: <20260312071609.388047-1-xu.yang_2@nxp.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: connector: add pd-disable
 dependency
Message-Id: <177453217245.4128870.950413594868265206.b4-ty@nxp.com>
Date: Thu, 26 Mar 2026 09:36:12 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: d685bc92-5c55-4071-f60d-08de8b3ca74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|52116014|376014|921020|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	p5FCsyyjlbJZdu5ZcAOosi4G/xad/gn/93yg5ybcu9UeESv144lX4Kj/K+r1q4iQKk2sKRIdVyzUlAHoDlTPs7IfFjTy7obF0BTYhP1XWGkkhCcR9N9RaJ/BlOLf9Z6PJD7vEZus/poM2RG26B5DZPlggIXnkt5odb/TGZ2elioRtWAG+iyFbLqwsoVWJHy5XkbmfhVlL67zD4/v/rxznXzbQVpQauM8Yrii2+UiYFBCpaeq6trcj99RApVwnjnJQtduDpn4PutX2bdgcpjVQmCCIOvCBQG1VpGED1Gy9ReZl8auTiN+Jhb5GDWmT0FRU9vZYQjD2bHAdHk1Xo2atvYvmYtqrCgigt+7XX+FmAvn/FQa039btb7yfzhpXrwmYQOyeCvgz+hDObkDdbC1NryVDwITnErSi0SqNg4WuW1XaBwI46f3nmmpOPxlr/c4iguaCZZTIjFPn52Zdf4Cp3QzuLD26oJOx6jHutx+jm8o9C2ZLSh9+koPJy8pv/hz98Ct2uYCT7e6D1mK6+iu2Hpqng16RoKOsioeJ18Uzkv4XdXT9ovBUl8LDKAj5LN0XB1aL2qAeuXlXKZMCy4T/iIhqcik8fzlgQUc8+K9daeypRw3H8PkVe8JM/+Q01VYepI2QSWf03zizrMBG1LdneCt2/GJox/OfkAtSngC04gFKFVMuLbFnv3XZn7j6tJUMAUfgwqIDmoFUiz8oS/UIhpoP08cOXLNSjEmCjydV3mab1MBbhEdlb3yJm2L0pI4bMrYQESHkcM8Jm2KeDmtvRWRLVtL7FuGWk8obcFXPFNW88aQHOIpAMzStrCIV/vH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(52116014)(376014)(921020)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXNtcUNNS2luMVlDbnJwM1V6ZEhNNFRTZEhWcjJKZmtVYnRzREk3RCswWWtr?=
 =?utf-8?B?ektFNllOUkRYUTgvOGlRNEpiaDlvNVpWalVPU2NOalF4dzFYbUdJdHlxLy9q?=
 =?utf-8?B?VTI1Y2QvTkpyUkpvVWNOL0dJSEd4aktMVVN0WjQ2M1F2aVlUc29ieW13dGV4?=
 =?utf-8?B?K1g1V21tNllTcUVHbjMxdk1LZEtnTGw1cC9NdTNVSWFJeGRxeXRlYXpoMVE5?=
 =?utf-8?B?UHRuOFFnT2ZiWm0rMUxmcGZ0d0JvY2c4TWNuenY3aDkxSG4zVVowY0FiZ1M1?=
 =?utf-8?B?ald3dzRSOVdxNS9uQlNaRDJBaDZLeVZ5NW5MVEk3R3NtL0RGNFgyWFRJK0pp?=
 =?utf-8?B?cUNVZ0pCeWNLRHAvb2pmL2hvT09rQUU2Y2IreFJkRnJObmRaNWtrNUk4Smx0?=
 =?utf-8?B?c2M1UFpmUy8yem82SjhJclRURlNaWlVaOFRlZjIwRTNsZzV1YzdzUG5uTDZY?=
 =?utf-8?B?VFFrYWY5NlYyTkFUc2FSaXhTa2c3djd3TGJNYlBHL2tKUlJTcjRrbHhncUJp?=
 =?utf-8?B?Q0FabWg4N3UwYkFPYmUrVjNXcU0wUWdjT0F3b0Y2RE9KNlBTc3hNUjd3dlJS?=
 =?utf-8?B?blVpM1hPc3Zjc3QxQytLL09YcEpGdldJY1pvS2ZxKzF0SkROdWJnMkFPQkdS?=
 =?utf-8?B?eEdudjQ2OVROaithbWU3VHJGU3ppQlNWYWFEQjZCYzB6SUhTZXlyRHBUYW8z?=
 =?utf-8?B?bC9lWi9jVW5IT0pTZnBZQWpIWkQ5WjNsMENPc3FtL1RGNy9odjVGZ3pwamVF?=
 =?utf-8?B?bzJDMkRmSUwyL0NLSTFVUVZ1VzdIbkpMZmJRTHdWVXNsYm1nRzY2Y2FGVStP?=
 =?utf-8?B?eWNrQisxb2dseGx2aDJETDZaTzI3NUNnTERnMWk5YTJ6SEVFMnBqdm9IVjZJ?=
 =?utf-8?B?UnA3bC9ENVNWUmQzL3M0dUtGQ0xLdjVUT3dTajJ4Um5hQW9jbnZ2VElUS2N6?=
 =?utf-8?B?TG9xenpneUg3cVRrKzgzZnErdlFXQ3lDUHM2MlFIUmZqUTFvSFJiZURya1Y2?=
 =?utf-8?B?amtubTVvNDFTaThaTkFRaGFYanNMMFo3Yy90cG5iZzZidndNYytwZm5FOFdh?=
 =?utf-8?B?dmVVcHRtNlRDTWFOZFNzYjdnaFNSUVhoVUo1dkxRMWkwK1RqSkJNRWFNVkJj?=
 =?utf-8?B?bE5ySzk4bUg4d1hNaXRNSmZhZUIyMjhDWFNMNjRLUy9GQTA2WHRWeUNnL2ZO?=
 =?utf-8?B?bTBPV1QyQUU3a0l3cjlrKytoMmczMGtsMEszbGlpVVZSMEcxeWpjQ2tBakkr?=
 =?utf-8?B?YVhVRXpmd3FzZGNvUXVsWGJ6dEFIZ1hUSmt0dFZYbXk3ZTRLTWdvS3NRS05K?=
 =?utf-8?B?N3R4NHEwM2k3bTM3eVpHb2t0YjB1SW1NRFc2djU4YVloeXFkMUJtNGdVQ3pt?=
 =?utf-8?B?Qk5nV1ZsclhJV3BVU3R0Rm1JemRyMGo3eVpCaDA2Y1VOOTlxTXRPSWQ2NW1C?=
 =?utf-8?B?ZVAwRWZFNjFUdHF5VEpxS0VqUVVySWxJdHFEdjFhTklJOFoxOXBwVmJzWHFE?=
 =?utf-8?B?SDZsRFdZQzY0VERJSFBJUzR6YXowSEhzdEc1bGgrdityN1V6Z2E4NnlUU1ZT?=
 =?utf-8?B?MUMvREVtOVZBdHVpb2VDUnFFL1FZZlU1a092aVJyZC9SS21kVjk2MjM1V0ZD?=
 =?utf-8?B?ZFE0M2ZZR1ZiY3dEUnAvYm1aSjdZempjdXY3cTFUL0RTTk1xalJhajBEcjNL?=
 =?utf-8?B?MnhaMkZ1L2dMVmFCZFFwenl1NnJScE5OVGk0WEkwTDdFU2NTdjBvNDZYWkNC?=
 =?utf-8?B?Uy9NdmJtYVh4MmRNUWZmUmwybk52dFowbnYrU2JaUHI2a2lJM3dKQXdkYi9y?=
 =?utf-8?B?Uk1PUWhQTXllY3d1ZTI0Qk1CT25ETWJUVjRPOC9NWk5xSG5hZ0VOdU11RDZI?=
 =?utf-8?B?SEJiaE9wNVhKWWYwOW5sSEF4TXR2NUJHbEJwUVdBbUxLTDlGVG1jTFRodnpm?=
 =?utf-8?B?VTlQWE84ZmdZREdlWTlXb2pMUzBCZTFsUC9tWU5xSm85QlhuZk42OUhQUGpQ?=
 =?utf-8?B?empxanp0UW1wMExVdUxRL2gzU0c1cFRQclQ3a3VrVnFUTkI4SlMzNndNVW5r?=
 =?utf-8?B?eHg4R1hIM1FSSmtHZlUrWS82aVV3OG45OE1OQTZpWDgrelZlTEMvUE9UYm41?=
 =?utf-8?B?WXUyRjRLSUxsSHV5ZkFMMFQrdmNFOVpKcU9WYmcyZkQzNXl2Q0VyTmNVZ21u?=
 =?utf-8?B?Njg2UkRKRG1mWVB2cmYxNnkwQVdzWGNKQWhRdzNlWWl5dnNIVzR2OVVWYVlj?=
 =?utf-8?B?QTdiVVJseGJTY3lIUXRFdFlwUERvZVdBRDYvcDBrRWlXaUZzcEt6Tyt4Vnd1?=
 =?utf-8?B?UVVjQ0FjaDFwWlhvclRPc08zdTVqT3k5ODQ1VjN2TVRWbEhrYzRFQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d685bc92-5c55-4071-f60d-08de8b3ca74c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 13:36:15.7910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwD9SGRitEb7PUeOFoTR6rZFoKvi3jvAiFoH5w8sZVK83giFvSAN8+AjH80aP0EKyQkXAnRugn8gwqjWPXmdpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967


On Thu, 12 Mar 2026 15:16:08 +0800, Xu Yang wrote:
> When Power Delivery is not supported, the source is unable to obtain the
> current capability from the Source PDO. As a result, typec-power-opmode
> needs to be added to advertise such capability.
> 
> 

Applied, thanks!

[2/2] arm64: dts: freescale: imx8mp-moduline-display-106: add typec-power-opmode property
      commit: 057756df6770c033eb8ebbc9b0066f6602e99b08

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

