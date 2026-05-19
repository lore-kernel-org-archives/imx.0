Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011032.outbound.protection.outlook.com [52.101.65.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA345403EB2
	for <imx@lists.linux.dev>; Tue, 19 May 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203882; cv=fail; b=uTrc2CxfFDWI6COZrAbWV3ndju0F2/QISaTZ30Z5y0FBt56vA1SMBzy13afKncNZZPxBOjSqapW67DtzJMHWWag/IT1BqY9kMz+4o9cH+tQ8qslp8GItFBjXyiVAvelSqRuLAjV1dodsuuTPHPxFF0BIT1+QyJRNZvlx+lTLo+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203882; c=relaxed/simple;
	bh=FXVtR/py/sr6v/aMmcpH5MT4Xlm5f2fCe0QSNI3f1Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kdducE/oD8O9vZqdbob5PwDgVhfNfQJ3rq1wxrO5ew+807VAafLKSOUU8vpnnaozuYKexZQm41K+Hhagh7fp/CR6V50Lrf7IdYypcboXKiXR1QJ0BOjt20vRim9huji6Zc6AXC9ETJOuFejfQx5t7gj+MzxumfzeL3j/7Das3XM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VFs7aPeX; arc=fail smtp.client-ip=52.101.65.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VFs7aPeX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmHeO3cEjXx3EOly7wPo7NRoRQc3vuGAPuzM05vpnZDvhufeb7pk1wvsHoi1dfew/Jixm0B2Zxh4pAv13lEdID74v0JuAxKnnPM5/oZMS/CkVhqaF0YcfyC28VIdl+/Ros1y8ipFOtjjIsrLYa/W27RRWNMS9OXnU63eti2DLJBwgGERPGznAQzI7QLo+NCQZlaO1Klf+yE8EX+YnsuUXth2DzAL2qudvH2rcowSwigSVeYk5WgNIpZwj1DQWMqLiYDQ1YFB4EvhsTDERxNCb5vlZfL2KLgfi5B8TK0lwZm27fb1mSX87L7j6p4YmtymBifak9AIAwCWDwuuOLbX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbAKk8JMqlZL2MbkM/Bywq+64vdmJlrMa1KEJB8xScQ=;
 b=Xo8phmoscp3AN6dK2BGsJ5Sth5b0pYCo+LEmjkTQIeZxhTGa1kzEASeOyoQ0hfIO96toC4Kg/6QM6nugnPvSAJzd8aeCHyLf/WeNSmMTwctRUH7WmQECMOMJ2ylgRhidujJ757K3f0cYW8SPjybpr39dxM0CY01ueqHvZhe162LaWbPOvXWGt+XWoVuyAw92+eN775Wgt2B8Q4xqZhzOKodYpd8s/kheEXMoVIKcouSTOhcteWweROV530oS2h4lO88SyZXl4ELDAzRb6JkRPn+3VoZW/BJXtiGmb5ZEKwdgIMRQ8nKxY73UCF7aVCHoY9JP3m7U7Q/0Arqi9YTt4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbAKk8JMqlZL2MbkM/Bywq+64vdmJlrMa1KEJB8xScQ=;
 b=VFs7aPeXpFzStxpQcZKHCpwyCmzOKNsv4ngDkL9GqHW/DEko8RoJu3nFlmPCncbRJTM1tOhMd3CFFu5s29S0t94giFSzOEM8pe+pfFSiKB0VkmqhA/v68gIe8dRcnzW4EesijWoX/vl3Cbjm2s72rst2kMZMxkJKhRv1qULX0fxA3BcfqQfLE51SICH20jK/vDXG9e6g9D2iG3E4JaDvttdZef5o4YenzvKZwUJCN6FId2AmOivJo4vvbD7GiIqyTkdvMocIBpKspaOKeD+pNabf8s2oknpiC0Voz3u06WSICuKEOxo67t5UtTuwh9ohR5Df8Uc+KkfGVevwrebf2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9789.eurprd04.prod.outlook.com (2603:10a6:10:4ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 15:17:56 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 15:17:56 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liu Ying <victor.liu@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel
Date: Tue, 19 May 2026 11:17:46 -0400
Message-ID: <177920378775.2480765.9583435220017696387.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
References: <20260407-tianma-tm050rdh03-imx93-9x9-qsb-v1-1-24d514a62fdc@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0035.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: 896bccf6-9d1c-4e91-3bfc-08deb5b9cd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|1800799024|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	VSeUcNAHSG9vQBKqYuixtKfu+cWs95xbWKIqzHxJLYJ2aX1f46q+yIAte3jCniyolF3k2cTDkRPSqdbJys2tFQTVZ32tf/16VjucJI8hyKZM5wCMoEMdRRL7asasPje1nMUQrMQYKS1F3Npv6U03htvDs2ZeRvouLCVCFUVNlKCjVaGMuXnuMiP6flWJm4vEs2aYetYTH82qvJZXQJz9xmo2PWJT9/Sigiv5fDJbZt/Q/sLRhZ1yoF886dunBF8+ZNMapOSOtI+xAxiB6oVhVrfsxkdfZvY3HvRaSH+N9ukEVR4YRlScSkkdoHsM9Q/WW3uBwATHQ+g2cPOs6NnLwYZwSL/6PLG5NR+jF3Su8IARi6n+0+7qOH7n762pI7guwgtRTaw0ZfFZEwHc99UBq7f919usZwNGs8PodHZjJNacmAXEThToaqz+v4Wk6PUpPWjHCQdCwc28MJHsgQUst61NCIVTsrcUDvi2juTbSxMGlyKeeR6qkae64ui8rmpwdCsSFLA0pn04dRQh9XOTzpbMS9WLvIybiobq/23ebsqMjHSGz8GoQJwEtD3tk7VbKNR2tRiUQxKUO/zqvZVTNcZ7bh6yT7Zy3h30IUDz/RMF2xhY4jpHUqReWlxlOIDy/OyGV57nZcOpgccGm9LGMC0TFyohqeMhzTMkCw51eclVqQToH9u5/m8Hy2EygAqE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHdnTjRtUnE1VlJqVjMyVWJCWkowZk9ianB4RUlsOVFVMUxkcEQ5LzB3Wkdz?=
 =?utf-8?B?SGJ4Y2FYWUVBcnVvTTY5VlpSWEFZUjVESUtrcDBTSG51OC9CLzZLRk1YbHVT?=
 =?utf-8?B?R2VPVmNjSENSVlBkdVpVSjd5d1UxVHBOTytQYWdsaDY3RzMxdmlOVUZES2p0?=
 =?utf-8?B?OGl6QzAwNllsaWxkQXlKY0JkRDBtOFJOa3VVZkhSSjZJWVlhNCsweVEvVmxj?=
 =?utf-8?B?TE1UbFBUNms5Qko3SFBLdHFtMkIxUVdHK2s1SjBFNzFtWm8ydUJicDAzZEZi?=
 =?utf-8?B?Y1FzcmFCUEVxVHNzYm9UQWZjQUpjQUJLK1BwS3UyeVM4bDk5RUI1WXBONmpV?=
 =?utf-8?B?ZXhoaEhKZVA4SjNvaE96aXdOYzg1OElJaWk1bmhjeHZIN1MxdmVlRXpZVzNP?=
 =?utf-8?B?a3Z6TENzZC9rRUFpQ0RFdk9XZHgyTG5xQ05ZZDcyT0VWL1NqMGY1MGJwc0VD?=
 =?utf-8?B?ZlQvMEpKT21UMzdKQWZucEdwNDNjWGl1cTJmNnFyTHJmbnJNTEU4SzFveElL?=
 =?utf-8?B?a3BlTWlwYnFqRXR1MGZEUDN4N0lYdjlhSUhySDFVYmRWUnpEOUJzN3kvOVo0?=
 =?utf-8?B?TVY4MmtLK09qRXpVSk5LeEtURWRKckczelBDT1B6NWNmTHhXNlovbEFtV05x?=
 =?utf-8?B?WnRMVUxPTFM5U2dQYkdDUWR0ZEpMSkFwVmMrRzBKSkh0dHo1aTg1emExRktt?=
 =?utf-8?B?a2tGd2ZSalVNMXFCRVhMZFlmUGFJcWRBMFRuR3FVeGFwZitiVWRxSWhoWkg3?=
 =?utf-8?B?OUVScFE3KzdNYWY4RU1veDRYeXh6VVNCendzVms2cUFpK0ZqcUJjMHIwTW1t?=
 =?utf-8?B?M2piNmRpSDZxaWZlVVVXRTRrdXdjQkhNc2ZkaWVGYndtMTFDdUNTM29Sdjcr?=
 =?utf-8?B?TmVUTXdJK3FFT010RzJ4L2xBOFBtaUV0RlhjSUJocjgyOFFPTjlXSUFKRDQ5?=
 =?utf-8?B?VDhzQjNwZi91K3IwQ0pxUnlXdVAraDVwa3NDSnduTHZic0x2T1VLMFd5bjcw?=
 =?utf-8?B?UWNFaEFiTUcra1lIQlI3UG9EVE1jTW10UnFWR2pQbmExcy9xY2ZNQ1ZSeHFO?=
 =?utf-8?B?S0JYTk4yd2tBQkRseitaN0pvTXVBOGlpVWJORERjQzBPb2h1elQvQkpMcE1r?=
 =?utf-8?B?dFpiaUlGR0xIcWNoRnNPb2hxSkF1Y0pwV0UzbUZRRVZZMEtrWGNoNk5NOEtM?=
 =?utf-8?B?OEVhTHpzL0NiRVh2eHg5eXp5bXIxc3ZsQ1I1WFc2K0s2clUrb1VMWTRUcFZC?=
 =?utf-8?B?OCtzcEhGeFdJM0VNd2J4VzY3TFdBQXFLNUdOeVA4amxROXJkTlRZRVJqTWxG?=
 =?utf-8?B?WFY1b0RvaTh6THM3ajlmUCtiajNPSmUwTGMvcmNnUDRWVGlUb3hGR0VKWWZM?=
 =?utf-8?B?dmY1VmdVWUk4cmdUYVhYQ3JSNC83Mm1ocGlCRjBXWG53RjNmUWtIL09acCtO?=
 =?utf-8?B?dFZPWnV4NE1vVEZzQnY3VlJScjZtVUR1c2xFZWJNVTkyYjQ2UXFBWVZRR1N4?=
 =?utf-8?B?U0Y5V0NJOGphNDk0eDl3b2lVdi80SDRTRExPU1Z5SEVaSFFhSWJzU1RmRlNo?=
 =?utf-8?B?VjAvOG4wbGVyaTJUeisvZzZoSHFQM2NIbFNVeTZFOG1FMWtlamM3VDdrMXE5?=
 =?utf-8?B?V05xSEtSYWlYemF1MXRJZEtUSjNCb2ZvYkhKbTRjV1ptdFR0VzdCbkZHYjNq?=
 =?utf-8?B?SGgrbGMzcWdMazFvWTFSb2hJMXlaeXQwT0daN0tLTDRSZ096eW1QVkFoUVdE?=
 =?utf-8?B?ZE83SzNnd2FubENnWEpJaWRBUzAvemxWL2NXOTA5aUM0YUN5V1RrRzhoZXNH?=
 =?utf-8?B?a2c0ZWc3M25oNG04MTZnZEhra1ByTm5lRFZIN2Y1aStSL1RrdmJ6RVlTUEc4?=
 =?utf-8?B?ZmppTlVyamZ4K0NzT2V3TEV5U0xqb3RKZ0RwSkkxSkdnVWpwZ3hOci9FMFZH?=
 =?utf-8?B?MXQxRGZqakpoRm94VTlnM24rSzZERDZscEZCZXpaT0dSNEhGSXlDZ3Y2YTJr?=
 =?utf-8?B?M1lyUWFZQ1NUSW5QNk15VWZpeWxWRk1PRGtqcy9mUkFwNkVPZCsrcTlMOTVs?=
 =?utf-8?B?S3paWE1UVERpZENuZ2tyTU1SZDVpRkpkSmdrTjlBT3lyN3piQ1NqWDJ6S1Ns?=
 =?utf-8?B?Y3NCc2crc05vMFdCTUthQVBzRTF6U2R0d1J1TGt0VDZ0MWRnTHJaSGg0U004?=
 =?utf-8?B?RXFVa2hDbkVRK3RpWHlZSmhTTnpGamR5NWo4Y2ZweW5yQ0NobFVzc3hxSFFx?=
 =?utf-8?B?VFY4a2NvaGlVOHdHaXprNUZsMDlwc0tCZll2Nk1BOWl2eDR5aDdzY2JPb1B5?=
 =?utf-8?B?VnJQcjJvekRwY2JmekRXNXZmck5rc016blBuNHBwUXIxWTltZDhqY3k3bjMx?=
 =?utf-8?Q?0n6YrS+mE2oDsBK8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896bccf6-9d1c-4e91-3bfc-08deb5b9cd5f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 15:17:55.8425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRIVG4im2QKjEFM+0QhLxqTdkwPchrwy7PKt8NhnZJlooP+6UpZJq1eFa4m0ESPpQFZviVSJ3nIKu3g0tLD8c8ZHnuzqdhsLUVoxSDef5moe5bFswot4RrIGq3aEBIGC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9789

From: Frank Li <Frank.Li@nxp.com>


On Tue, 07 Apr 2026 17:15:31 +0800, Liu Ying wrote:
> Support tianma,tm050rdh03 DPI panel on i.MX93 9x9 QSB.
>
> The panel connects with the QSB board through an adapter board[1]
> designed by NXP.

Applied, thanks!

[1/1] arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel
      commit: e19f72999dd1bdacd2d15957919557c9457067ac

Add description about create common dtsi part in commit message.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
