Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1355E34C128
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510004; cv=fail; b=iKiwRsW6h6sywrfX8bbZLA4qHJQmrhikJLw0vbzTcafonY78saFmjkNKzUXZGp0slYIEPDKtmR5NL+zQPwfusdA8GDRY9LHfGt9iOZFddp9oX1cbSk9T6IfrIJfEd7NHyyzXjXkrG/p9H3gM2fGniukSd/EHmerFNNPnH/msEgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510004; c=relaxed/simple;
	bh=BepHsQqOe8UeBaXEE5I8M5KcN19xtUa8QHYflPSWnew=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=iJN2AxcHjeCK4tP9DXJZMFGfp2MoVIbx+KLm8FgiRrHDjr31JxSA7v9Rf3KbB+uXQQYpUIIMwYL7eZW9s8nUijiH9lYgsUK4E/FNh87rn5uZZYzdxxPItaT7G0HAMbJCPMhmOLzlU8cFZFnpnD0hQ79KYwCG31l9pCC1vt4M9G4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CB31+xwV; arc=fail smtp.client-ip=40.107.130.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CB31+xwV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZuAkn7rm7wrOSjeuOvo7rQmDbIX8sLu6jkKL+N1GcNnOWzRe52RAeSjKBnVhmCAuquSZQekxBFVvyJjNeoJc9avpM3G2XNjNn8/NNb3fIbYFP+VyRZUPccgJJi/0Q35wdMKNw/GHttlLP1cJiPvswtcwrk4m3kVQ7kYWQstwrPJUOmamkx6q8uwxHWnloRGeyP6vwfB048631vexzH5rnPlPCyK0sukP+HHBUGpz56NJQU8qlkFPgLXixj5/q/CCN2iTssMx1qqm0QyM3HruKQm2X7aUX77BwtZ98HLaVxj/hvcJv/Np4Yaj3mZA6lBT7h82U+pdmFupryMQZ5Sjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zW6e0HvRaDoRaZG/rqQ8P+mOeLhLvwnnaRzN83zaqEg=;
 b=ItBRunHTyQJs5dNqa9QssiHN/Q7NVRTC++sQtagSAAP3cvvBy1CcigQOvT9hL0X/Kz3UOxxPivJJFbBO9hSLKLxCPAoxGQFBABCKIFsiR2mSP0P+kMJYQ95biJR8kxx6vX/+YhL931qU1kZGLL5/u9natRElWovGhgUtpdYJuRR+Q1zTJx3Exk5KLXqjBi3RfTRzJS1rolLppm490YYaGWNeXMUwABt2k8gtqvfhh3XCbolFtkLyDdfHUpH/g4rPhd4y/oZbHqGX7EdpAqbeOZ7kfdUyGunHcIxz18HgZcQpJ/ccBP96L2K7aWxCBoEMRT8TwJKbPlU6F34+Svpkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zW6e0HvRaDoRaZG/rqQ8P+mOeLhLvwnnaRzN83zaqEg=;
 b=CB31+xwVSk/0a1/J45k5Z3fK9LJYWnQYcWwf7Px+TQnczZOlKEGfVuH6E+3daX1F15hmchh7XTcwQDG7Lek1AnZraX0JAt22ZNz1WvIz2JXkgmvokJ2GLNUEw6FmE9p1jeW8owxCfXy9MgADXwnvatlVtF953b445PliTf7QeRJp8oReUkHJeWAxwZMDbFWI3MebT5+4rLwtZfpcW7Rm3/kd6zqdtdgJbdMTZRn0NbGFioT6tpUZGbh+AIIBENv6ylv5q3c6eEfIVivt0FBtKOXED5VM0Hl4+YnkxG0bRbH7XvwMrtB75huA4fACTzKVIAIloV+QJLb7iXNPyZ5l8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB6778.eurprd04.prod.outlook.com (2603:10a6:10:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:26:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:26:16 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 00/12] arm64: dts: imx8mp: Correct PAD settings for
 PMIC_nINT
Date: Thu, 26 Mar 2026 15:28:04 +0800
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAXgxGkC/x2MQQqAIBAAvxJ7bkE2MOsr0SF0qz1YoSGC+Pek4
 zDMFIgchCPMXYHASaLcVwPqO7Dndh2M4hoDKdJqII3is/EPujfiLhkToZnY8TiQsnqD1j2Bm/m
 fy1rrB6BbYehjAAAA
X-Change-ID: 20260326-imx8mp-dts-fix-v2-89ede7320c6a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB8PR04MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8cd722-3ef3-4dc5-076d-08de8b08f782
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|1800799024|19092799006|376014|366016|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 Ih9dkGq+r70sM371Ana7UkArckDVmZgiDPHY8GY3jBpwtNJ3yW4Lm0TZ52fCrTWbdR2WLk90ObifuWPWiwKEozd9Gjmwini9fC3QzfgKiRMaQuUnBZCQ0bE+QHhai6iif9HMG7Tk8OmslljfwecQ4rO6gQZH6mdsJYPeVAWAcHELX5SFimZxL0rpaN7CAfZ7ThgO/pyHnmM2t8zPriljGVcbpR0ySY1mrJ0m6vJz7qvezEIAHubKIzbcBKoOKqBRqLN0yfNpcgAByeIYMb/QaKKfJj3OlPxgihTyccRO53EdvL+OszGDFiCtL5qxsJeL5eFT6bzMeZGidw5EA5thKH1NP4FGXkgwd9CB57f160aj5YFXzzeuMIedthisZBkiXXhj0QRBfHUT6A5MnkriffK8AoJsrOPIqNdWiJwtNyaSIyZ5d77+Ls8oLtjf/YUj/lySerKXd8dA5G0OLH/BrL8IB6+AMFsMGrJpfuFJpIzPoBOe3PgM9QgqLfvUKnWVOxBdGyD/wwYtrLYNwnRoZZWZFwJKlxjA0JRiL0nxR8ijbhMRR/4ch9DrIjl6FWGm07z54xJG3n/w0fBNaqOIOKlo/hFmNQMNk4dfyu7sTkSgurE7yNCozHXCLa8GOrkFFHOUZx9n9TGuax4SzBY8dJ23FWPt08qtLcHF6V2ZaWgaPyyKpvD8uv/gjwkk2fleBLr6AdLmaOGzPrCd/vPDP9dQufly/3US3WsLfY57qxmCpB1rGujqWXrckEV1zPeFHrW4GgvHfK6MbcAuCS5J4mR4+3UgGeLD9zPphFGJf8PaYSYzwF1rfM6k2P4yY9ivzmC0AZUUwjlFhOp5bY9Vpw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(19092799006)(376014)(366016)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VHFPN2xIZVBNcnp1RHdPT1NMZGVMN3AvcSthdS9FaVRXMFFnSFRtTnNiNFJ0?=
 =?utf-8?B?SjBlbGt5K2c4WW00ZXAzTldvenVpWHlLMUpBcFZJSGdUMDFCZEljSmZGUmxD?=
 =?utf-8?B?elpzQWZVcWlUcUhKV3pPRUIwSUJxT3BzakZFSThnTzIxbTZza25FQTBMamVB?=
 =?utf-8?B?M0JxVHUxTnZIRG5iSWRsWXVmeWFEZFFLWjFHVGtidzU3NmUzVFJGaVJsYkVO?=
 =?utf-8?B?blRiZTRVVGp1NkxBRDBBVmMvVFo5YVZ2SHZPZW9kMUNaa3hxWkpsRjFaTVg0?=
 =?utf-8?B?TktuSWJ0MElJaVZ2VVg3a0kvZ1ZmVzlnWS9oZnJNMSswSFJkUkpDTTA3LzRj?=
 =?utf-8?B?TnRGK0Q0MGZwNUVvOS9Qd21OcDRlTDdZYkZUK2hpZDNMc1pNcTB0MnZ3VERI?=
 =?utf-8?B?UndkZUowMit4eDZGc3pKNElqZlJmTU9uNWtIbmd6V1k2aytIeW8wNEtPN2gv?=
 =?utf-8?B?TTlBdGxPT0Y4eVBsWnBDN3N0SzZkWXB0aHdFd1N6dDIzU2dOY1RTWTh4djdh?=
 =?utf-8?B?S2RuZERLK2g2ZWEwc2FsRFdGd2g0OHNZdXI2ZURYOTA1eElaUWg3N0pLa3cr?=
 =?utf-8?B?Q3Jod3lVWHpmRmRwb0FkTTJWbmtINGFPenN6T0o2U0JpQ2R0TkRVK3pabElp?=
 =?utf-8?B?NElqOVpyemJIZFNIQjd2MGJRNTZzbEtNTzdaOFcydkhlOUpwTWFJQlZENFdI?=
 =?utf-8?B?SUhvTFlycVc2Z1dlbkhQUzdmck81Mm9HSzJoUjJlODBHSHVVTEo2cHFSOUIz?=
 =?utf-8?B?TXNsTGlVSGlWams5aFlta2RLcjVPdWMrQ0VkK2M3eGNYM2lyY29DQ0ZoZlhn?=
 =?utf-8?B?eTN6N3BaeE13cmd6cCthWDU0UkozTUZzaU9BU0RXZUdNd2lyMjVRcVlJNG9V?=
 =?utf-8?B?em5NZVkxeTdUKzlNSXlPOEorLzNDeUUvamFYYTdjVUc0aEZMS3FYQ0lndkZy?=
 =?utf-8?B?Q25ZcFdpd1hoZk5yaXJjYnNqNjlOZkt1T1liK2JqUTdZOU8yTHdQbWtxdXZU?=
 =?utf-8?B?T3F4MXJCQyswcE5FNjN4TmZNOFBBYmFick9TeVNSNk1uU0JLRlZna2ZlM2Z3?=
 =?utf-8?B?TXgxVnVKbllrMTZLMHVnbUdWenk5NEw5K0hIaStPWVlLaUp0WDZkN1ZpRjZE?=
 =?utf-8?B?NEczQkZuN3ZjcDY1a2o3b0hJTFJUU0dEUXlWL01MY3dWcjF3SlhBRDhIdmtL?=
 =?utf-8?B?dUs1YnV6ZnhuUW4rRDZFRk9hWGE1dHZNQlVqRktNREt5a3FyVnNOSDBlRmpH?=
 =?utf-8?B?TE8xb0ZzcUVTVXNYWGwwRCtmckYrL0dZOThEWG5VMnhMVHN1dVZLSTRUa1Rp?=
 =?utf-8?B?bCswNjAwcU1pemN4RE1ZNU80SU1weG5nSDFEdEZ3cTJrZTlCRWpoTnZQRENC?=
 =?utf-8?B?MHFvNlhmQzc4ZFZ0SHBrQTRCSXdtQWJjY1ZnNHBxbzhyK2lpOHNpSDdvWTdR?=
 =?utf-8?B?dEFuekJOajVHNzJwUitoYlBvRmNmOExXamRIc25ENXpIUjg5V0ltNmFzUElT?=
 =?utf-8?B?aTM3MVMyWHhxcHB4NzBNdldMMmpiRTMyQkhKWnVlb2tDTkZmOUJkMHQ2Wjlr?=
 =?utf-8?B?MlhpRzdpdWRqQzIwTkJFdHVSNVUrZEJONnoxK2dhWTNmSVJCdUVjRnpoNXlE?=
 =?utf-8?B?aUJqSU1nRmxTSGhnRm9MRGhDTmYydEYrZ09GeFhNWGY4VkhLeHJYbkJmWGVE?=
 =?utf-8?B?WlMvM1RSMUVvaTRSY25CamdFSVhLc1U5TWtsR0hia0Vya3c2RkExNDhJckk5?=
 =?utf-8?B?dVpjNzNOZHl3NWt5Vk5nTis0Qk5DWVRlV1Jkd2tyUkNMOHAvMVpoSmkvQXBN?=
 =?utf-8?B?WW9JbGozQUI0Z09NYllOenBnVGZvdkxEWjJPZnBFUEY3Vm5BU1IwWGFVL3lH?=
 =?utf-8?B?THJvbEZLdWF0RlZrRmpqSFQ2UzRXTmsvekk2eWZ4S0o3eGV5SWc1QXVnOWtk?=
 =?utf-8?B?Y1pyR3VQN2ZHdEp1WERuaDRGN1I0WHFUNitWNzQycVkyRFZnT3NpY3pJU3pi?=
 =?utf-8?B?UmJLUnROVExYR25oS2FTd0xmelNqSGIvZUc5QWxqa0NJWW8wUS9sMzRGYzRZ?=
 =?utf-8?B?Ym53eVlsUDErUDVuaVQzdU90NDlMTmM2SGVIL1haZXhWY0k5K0VtOGxpMVFC?=
 =?utf-8?B?MGxacXUyWUtsd0dWejJORDJqQXQwa1RrNWs5VHI5NnkxRWV2N3lmcFI4TVpr?=
 =?utf-8?B?VGViOTNIcFpSaENsWTZzZjRmVWxBZjM1Nldvalg0NWlRRGZyMnZnSThkMlJB?=
 =?utf-8?B?S0VIaE1qL3k5UjhKang4NGtFa2RzeGlqZnorczZ3OVZFRndDZmJVNllMN2Uz?=
 =?utf-8?B?NHIwbnFFQTIyL3NURGcza0pIeXR0dFRCaG81SmdCU01tRnRuaUtCQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8cd722-3ef3-4dc5-076d-08de8b08f782
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:26:16.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ND0U1hgrxCAHXn+nMM35c5d7/WxkxkziU4QA4jWg3HRqLdKTy9pCSe8obFvqksrIr56NXPQwRwzchcUAr8Ti/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6778

As reported in [1], there is interrupt storm for i.MX8MP DEBIX Model A.
Per schematic, there is no on board PULL-UP resistors for GPIO1_IO03,
so need to set PAD PUE and PU together to make pull up work properly.

DEBIX Model SOM also has same issue as reported in [2].

I gave a check on current i.MX8MP based boards, most boards have wrong
PAD settings with PMIC_nINT. It is low level triggered interrupt.
many boards only set PU, but PUE not set, so pull up not work properly.

Patch 1 and 2 are to fix issue that confirmed by Laurent and  Kieran. 

I checked AB2 and NAVQ schematic, so these two boards are also having
same issue.

For other boards, I not able to find any public schematics. For per
the DT settings(interrupt is configured LOW LEVEL trigger), so PMIC_nINT
should be configured as PULL UP, per NXP reference design, there is no
on-board resistors for PMIC_nINT, it counts on SoC internal PULL. So I think
these boards are also having issues. But I use phase "there might be" in
commit log.

The last two patches, I think the PAD settings are wrong, but not sure
they have interrupt storm issues, so just correct the settings.

For imx8mp-skov-reva.dtsi, I am not sure whether it needs same fix, so
not touch it.

[1] https://lore.kernel.org/all/20260323105858.GA2185714@killaraus.ideasonboard.com/
[2] https://lore.kernel.org/all/20260324194353.GB2352505@killaraus.ideasonboard.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in V2:
 - Fix more boards
 - Drop preceding zero
 - Link to v1: https://lore.kernel.org/all/20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com/

---
Peng Fan (12):
      arm64: dts: imx8mp-debix-model-a: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-debix-som-a: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-navqp: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-ab2: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-icore-mx8mp: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-edm-g: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-aristainetos3a-som-v1: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-nitrogen-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-sr-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-ultra-mach-sbc: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-dhcom-som: Correct PAD settings for PMIC_nINT
      arm64: dts: imx8mp-data-modul-edm-sbc: Correct PAD settings for PMIC_nINT

 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts          | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts     | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-debix-som-a.dtsi           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi             | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi                 | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts                  | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi          | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi                | 4 ++--
 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts         | 4 ++--
 13 files changed, 15 insertions(+), 15 deletions(-)
---
base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
change-id: 20260326-imx8mp-dts-fix-v2-89ede7320c6a

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

