Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013069.outbound.protection.outlook.com [40.107.162.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D85327BFC
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782767918; cv=fail; b=XRfM/7/ggmAwbKWD5lVCzbcujcMREFLMVvhWWJsjJa8xYynOTrnbfxCaUQ9sqcPCx7hD/U5Q2j4aR8eGRjuhEdts9yY1dTj88Y2ffKbelJCnptBEvFdp67YdRfxqLWBy3/MsCw9VuISgiZL96J6g+j5x6W/veDoNsFE/1DDsak8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782767918; c=relaxed/simple;
	bh=/XU0ZcdGL0jXJ7vA4HUdFRU/6AiVB8Fvx0i1wbRxApE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CaoMGxfG5m2bLFFo6AbQAe7QJRlCzKBFwUbZl8Vuqw6SajyNPvtUmjQ0bLe5m3JPhQrYLMvFUa8cLBj6rDc7hYfOg3hjGZz8DKLwONS6pam7H6nZRZODSziaaUijb9n7EO5zlJwVmXcqT+7NgeHJ43SW36jMg4877Z3gQIpmrhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=yFL6VYXj; arc=fail smtp.client-ip=40.107.162.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="yFL6VYXj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adcEuCC5ceEsWZjvCCplHmFHVtCZagWPKALypO4bMs3ZfuWq3k0skAScLwpPYSFZgDqza2WVcsemQz+OuwUTxlk95JKmbOQWWSfJCr7CuCJ8SGBO9UUgOpxnwk7y3UcZ76B4IfcERCQeETH41oSqkXNk8j68HcW5febdLH8n24Ac9Z5WKMDPnBz72jPDQPsnwB5DyKHFdOtbyRYwwMaiubIm4yo7lPx0ysPClNWuBTgfkRzXtzm2j4UXGXwFC9TcYj1qh76Q7T0P/qe5GlV+ubdDts0rRCX3Hp/98ffqJlyInr/k/eDXghSEc9j2H+S8MBFt0YzR2mMdHkvLnKJ7PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNb/DXnwHpdxCTuxqfdjCJhyZtduLEN9Ytxr3W1qv8w=;
 b=fEEzOmYyXJd/jF0eZBMgrIoIp9EtJFLRE2yHyTrRGl2bq6jGHFJ4HrmoybEDq6HQuSTrpyDnCCEs3kNtIr8BfwMuhpADF7QHVOFc0tbP9Jqinrnj1oV9C4AOb3F9PmZQZMtsDL3EEhxMgIUUOq44i4a+X3ic/FQgAcNTX2SI/etdNN7WMi564JKUUUpFdwnjsINegu1SqS3piOJXifQw/j7ZY2SAz7AwhAMTKp2D+oJ8aMK1UqkYYVmLtEPMr8A4Gb3R0bvghgDW5FTheLjofBpk/majYANXBCk4CGPoHhmLPSNaZRFVglSictvV6NABvTInI48RN0dsdPOVeqNz1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNb/DXnwHpdxCTuxqfdjCJhyZtduLEN9Ytxr3W1qv8w=;
 b=yFL6VYXj1y4efFb7YEtKHWjYaIMJk0FtUT3G/653CHNUVOlz5fl0GJw8E4eXAOrTepdWTjSawU/ZHgixbDhjQ3MiD/Jf+xUb2d34//oCFXpvrYy1rLv8gIl6Fcsau+rqnrtfKVUxOwy53M80xacAa6oMQHHuv1iJrrY6vxVDFBf7NJ/5SnldfPpG7KLAyXQzuuugIRjM5FsRwfyrSGAPZIOyVaFBApZxc8qbbq1sRQTVPG2AcDzcMLSLhHYuz6yDfDU8x22wXjAVo/PZWwAXaHRsHz14qY2p/ghK0+UvekOCy7NEYZ6vlHRxaFvjcaLUa1I14/lSR4z7fG1ZP0RT8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8524.eurprd04.prod.outlook.com (2603:10a6:20b:433::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:18:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 21:18:34 +0000
From: Frank.Li@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-ab2: Enable MU2 for DSP communication
Date: Mon, 29 Jun 2026 17:18:27 -0400
Message-ID: <178276790384.2502695.3382459214617418071.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625054709.301209-1-shengjiu.wang@oss.nxp.com>
References: <20260625054709.301209-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:806:130::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 74f51b83-33a0-417d-e61d-08ded623fa2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|19092799006|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	C3bpVmVVH4hbcQNboVtvQAbCyApj3Fra73gmzLQhAm2ahjitE4vw35VW0Kbk5pT186lxi+ApT8QJf01v8UyFWejwxlGhwA5GehzgqnlxUClND+0G9XFAq36hn97a/PwpgLSAvgXjCKrD1j47fQNRavJpmtlcEcvDP3M2LjwaV/h3LPC8RlN5vBcMQukcOBa4zEf0EqsTbpo9IMQmwpxmWckayxHvWpW4DDDLOULw2BIqW7V51obPGPx8Bu5bC3bUrZUinocVk4TDneJIu/snl2Y3+bO5uzlUuM9DGlHICPJZo/EgHfxykgQ5ap/d9CM0g/NEn0omEa78OBzReNkRkpi2bkslhyoyHNrkWOuJSkC1S/pwVR4xwAIoCBWbTyYAkjAJnGh/16xhy4cfNQq5ShfpRU3tsJdl9zUYV7Aa6g3MRWthTVKOgyPCiUpsOKWgjBxo4hUMWzKUKiUtYzqeRqrDHM1r1Sp1H1Jji66DGoVxisBbe+A5dbT870rK2JYQN0N9qBLrDgJTQq10mhPX5fOcDcMjsNPr2m9aNLEIMPZq9V/uvzMMmUABP31rFa/PCx985OlxC3OxWBLDBHJiVmPX5Z8vrJwNQVNDmUmVqL+tM98Fb3Q4YbnMnCJL8lUjjboEdBn2fkLUsX4Lm24zAKQrEZgaSYGaz49ro91IIALkiM30Cvm10bTmYHLRXRZVR7b94iLFS93TfENy0AIZtg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(19092799006)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnNDVzdDL1pKWE5jUXlWK0JVVUJjRjRaSGdzbnlyWndMR1ZJaWxVRDh2b0VX?=
 =?utf-8?B?enk4SjA5ZWJzN1d4M2p4TTZtaEcyQytrdEdYOVZGZGJ6S2M5Z1hmVEJYU0pY?=
 =?utf-8?B?em15Y0RPOFdXOExTaGpSU0NFeDQrRWtIY0x6dGdCaVVCemFKR0d0S0VrU0Jm?=
 =?utf-8?B?UTM1OW92NUtjbmE3dWlJWVdPN2ZWRU05SmJPT2pIZlNyKzF5RTNZUzVrdkt2?=
 =?utf-8?B?a0h6UWhjU0hObks5OUduaTFIUm9CVUNuRkFDOEQrbGc1NHAyUmNlbzFDU2RK?=
 =?utf-8?B?cVRHWWtadDhQd01EY2VZUGVnWGRXc2ROTGxVZE16L3pCdTBzQVB2dGV4bWxP?=
 =?utf-8?B?V21BU2FvbUE2OFhRVlVFNGVac2g4TXZHSDJOTWJ3d1gycmluMjVtQ3l4N3N0?=
 =?utf-8?B?bHZMMFpnSDVvS0NVWlUxZmM0UEV2dFZNeGhUTEJUcS9pRFFKMWJSZGtSRnkw?=
 =?utf-8?B?YjYvcWRkZm1qZU81RmhKTDZNNUl5ajZCaTFCQ1p1TGhCanBJV1V6bnY0b0dt?=
 =?utf-8?B?VXJFWTI4bGpxWFQrTkx1ejRPVHV6SWppYzZzK3JwOThvN3lNbjZqQW44Mkpr?=
 =?utf-8?B?L2Q5SXBsTHNubUVYNUU5RmROVzhaRWVMWU9nUnVpTWhPTDJBUmJ6ZGJIL0RC?=
 =?utf-8?B?YStVenk5L2V0a0pQcEorbnp2dDFEOG0xdGFyalBRRkJBZ2Rjbk16WGI5MjZm?=
 =?utf-8?B?RkJ0d1BpbG1QS2IyWDVhUDVZdERsRitMbWFqZENDSWFDM0w1UFhJZnlqVVRP?=
 =?utf-8?B?WG43ZnluMUdzTFF1cDVqNUkveVQwUUtNTTlMQzVRTUhkbmE0YktycFdPWnl4?=
 =?utf-8?B?TVE2UFEvOGhKdWlJSERCM21vTWhyOGpPTklEOVgzcWUyRlJLSFo1L1ZEbThM?=
 =?utf-8?B?aDQybDdnR3p0RTlVc0hTb0RwOHhOL0JSRU5hVGNjWHAzTHR3VEI2czBQTVI3?=
 =?utf-8?B?TEcxcGVNZVJUUmRrS0Z1U0ljYVVxVVhIRG90RGFDOVl4T2draks2VUd5N2lY?=
 =?utf-8?B?OTJTbjFPS1lTSWRCbzU0bjd3Q3BOQkJ5TzA4Wk9ZNmZTM0s4K1FlcytqS2VP?=
 =?utf-8?B?NVQ0SnJ4b2dpRkNUL1REVkdKMzB5dDh4Q0VQVXFvSzBXNE5JY2hnR3FpQ2lO?=
 =?utf-8?B?WmtSc1ZYcjdzVGVqWDZZODkzdkJGdlpuUDllM29uL25aNGNvVmZFS3U4MUF6?=
 =?utf-8?B?eVNRVHRjcG91ZWs1RUNZcThyRFJ4YjFJWkZ2Rk94TkNydDg2aFdVd013VGdr?=
 =?utf-8?B?eW5PampNcTdOcGFadUpGenhOVFdDdGtQTzhBT3VoZ2x1V0lLTllRaGZNUDZx?=
 =?utf-8?B?ZVBuZENIemExL0p6VGE1SndPcmpaaVg4aUxNNTRVckVIN3R0bDRlTmd0S1F6?=
 =?utf-8?B?WmJ5cU5ZbEZaam9jTVRIVXBFNllJWWc2TDA0Nm9FTVNxREUwMlgzYlJ2N2w1?=
 =?utf-8?B?TkhuR215dHM4ZjBDcUZma2UwSlZNNzNhSy9xRVliOFZDc3QwKzhpdTJtbE9o?=
 =?utf-8?B?aDdQNnZER09rS1pHcEtiUUg3dGJiR2hKVWhDSXBqb3RhaXZ3T1d3QWZ4WThs?=
 =?utf-8?B?Nkk5OHNvcVRnLy90eTdDcHphTXdwN1JtTnZoR3YwSzU4OXJnYmtQSzk1YWhl?=
 =?utf-8?B?amVXRS9TcXRzOENhRXp6ZERMUjZLcWtKUlN3K0hReURlaDJEZzRTd3VJTS9s?=
 =?utf-8?B?dEVKbUNodlBnU242ZjU2ektpT242M2VIU2JMMjRVRXFMTWhjalI4K1p5L1BN?=
 =?utf-8?B?OTRndDlsaGRxT0N6Tm1CczZLMTJlcThnSVl0VjRzTDRlVitDY0xMZkpJUVhN?=
 =?utf-8?B?ZHJTSFdoYVBZSHNuZ1FFdTM1QXJhbzVDRStEVjZwWDFKWDBxU3h5ZGdWNFpL?=
 =?utf-8?B?bk9Ra1ArcVQwS25lUkt1NGNERXZDb1o5UGtOd1VYaUxoSlN6UXlMREdOdTN0?=
 =?utf-8?B?UHo5d0NDZ21zY2E3WHpEVnMvMlF3ckxvd0E0UlkrbjhaUzNJVS8zZGtzVjJO?=
 =?utf-8?B?NlV6dHBKTVBRWnp6bGNnZDBpTTVGMGNWcSt1WFlLdlllQmNpNWZ6ZHlvRXpO?=
 =?utf-8?B?dEZBakMwUHY3ODhZVHVFVGRLaGJTVlQvbVBFUGx4L2gxMjNSWWtXblllRitF?=
 =?utf-8?B?SXZud1hVcFVQL1hQcWVxczlpMmRWS2FsckJTNTNSUDBPTWNQdzdMQTcyUkkr?=
 =?utf-8?B?MEZxNXJ6Q0tkVzIyNmlBSjZOdUN4ZGh3VHh5MXdDRFZHQURlVUJTSlBYUzZi?=
 =?utf-8?B?NkxPVU1lQ0VYOWxOSjVNdEhqQ2FsdHczclZlcEN2WkNBSXVHSzQrM1Y0ZWht?=
 =?utf-8?B?dUd0R3c2S0JxL2lvS2dSVGNHZVoyT1g3cWxyNFkyci8xRU52WnFNam9Jeng2?=
 =?utf-8?Q?ZvRv5b07BL0jAeIVqP0pRbY6N+4MtJet/Wpsh?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74f51b83-33a0-417d-e61d-08ded623fa2a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:18:34.4052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBChAQLeZHSRM9vzjwpjGxcVC8JddtTkvPrKl0GbKjkk+FWndd57tPhxTFx6bXYlrrlYIUec+JCZ0F/S9gCxS9tkzYje+bqabEd1SiUPRRmJGJaFcan2muc2Pusa5mh9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8524

From: Frank Li <Frank.Li@nxp.com>


On Thu, 25 Jun 2026 13:47:09 +0800, shengjiu.wang@oss.nxp.com wrote:
> Enable the MU2 (Message Unit 2) node on the i.MX8MP Audio Board v2.
> MU2 is required for inter-processor communication between the
> application CPU and the HiFi4 DSP, allowing DSP firmware to exchange
> control and status messages with the Linux host.
> 
> Without this change, the DSP driver cannot establish the message
> channel and DSP audio processing is non-functional.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp-ab2: Enable MU2 for DSP communication
      commit: b1b6c1c4d3c63d8097c933009bdb618d1be18305

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
