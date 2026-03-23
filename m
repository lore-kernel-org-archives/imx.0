Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6532F372B53
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 23:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308138; cv=fail; b=fq/hNj6fDVItxQ8LNSKTaN9EarGI15LgTR9d6+OefgEkq6yfN+RXfdBGiFHet7jv14iL1WER9ilZrQiiW3w/BnthyQt+2Nm1zghLZZ8uX9NYl8Hyy6N+POSv1aRvL24oi2LKegI/9QounrBVPZi1srOnLD37dFJWpK0p9+ydwJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308138; c=relaxed/simple;
	bh=uOkJbUbkqEHeb+JIdiUH0WM5sIPdOGksIlVbLM9LYwg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=PTUNU20Tjb7TiyASlAqcg5tcKyjy4DSjZLghPZOM3k/924Bosk8Oo+FnEqlp7r2dkjpcpIyS7tkSPfxdMOobYwlaMTohNmDIw/XmWl0UZP3jG8wmvESj21ykNQNhfoHPIQmektNYdUxIvH4qa4ZqXlLvDH5azC76FHWcw7NHYA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OBZfXAI3; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OBZfXAI3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDeUHAk/5EJpXDqd7NL7Tq5VCuM1nJS3k5EFViIWRD7MAfXKtCqwmNxnK/ZUdWBNdmWQsDNWX9woXK2uO75Ql8+28s4rgwBBh2lSbOSIydjg8Ra2n8NyUL97d1a/SRA7H7CrYSvPCtImhD6sBZ5TFCgcRuyR4C6cWZdhORn6vpTphz9wlB7rUB9BgJpawsjLrsC96Xz7IoiSJJAfvLPT/UmieEl7Ce87MjF0QEfuA7RRpjGMG3QmGdRDp/ijGMeYYR+4eMv+E0F+cbpHgnPOyq8m1TuilYYI+BmV3244uo3GKdgA2M94rFt1cVYzPO7dJaFwtp0e3RerYiMO3uahhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIDgyBaC82lm0XZId8B2Ksrj1HHEzgVhv/zBoytoUkM=;
 b=DLjhCAcO0Ji4xbwr8L9JIu866xBNBbLo3wq0z445vi4TxUu+22mvsqG8NTp1CWMuF4jo6UMVH6rDHfXfgalPXNkUQAyL3/EY23L4y2Wsp69YEps1L/9nV+Xeom1hzypSbvzrpli2yzlqsv+4YEjzi8/Zd+J29mn6yJzilXw5d54n/LAf+DFIE04NkTopOqZoXsPchL5+YlnJAK1Dxkrmusj2v2y0lY4QZZqB6tcvpAF7DReahkWUQ4gBlxronOKNeHODbJEVcngmKWNHk0Qr8A65aC7wBb9mzI9nO3pp/upMBzs8sU6JE3BHZB14aocg98+QYPN/2Cm4dHDKjqHV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIDgyBaC82lm0XZId8B2Ksrj1HHEzgVhv/zBoytoUkM=;
 b=OBZfXAI3Oe2Wop1XeE9zu52M+pEulRARpob967TpDt+pg/chVQkRC2wsKj9Gbq3mDeleH3zSqcdDRv8Oz2vAVmCs9xAHkaJuFBpxxxCtfRVfYGJfcYmHaa6ko4SdKuW/ZlJFQCTKZwCY3grLkiy2A8aUtwyW2Eh0Rhs+EQtckmcaxwwVKrZH8uhOGziNNxiDp1MusPyV/CtHHeIhEklEfdo34HFHOkyZbGt0jKIsYio3ly9EgNmLzUiar1GhV3sbmt8WccBDAYbvrIyqx58vTWMOQczzijGqfMNX1pDmotYIr6spySDyJy1PoHPNiug3n9gMqPZJ8SIZpPUrdwwz7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB11962.eurprd04.prod.outlook.com (2603:10a6:10:617::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 23:21:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 23:22:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, Liu Ying <victor.liu@nxp.com>
In-Reply-To: <20260311194111.2918037-1-Frank.Li@nxp.com>
References: <20260311194111.2918037-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] ARM: dts: imx6sx: remove fallback compatible
 string fsl,imx28-lcdif
Message-Id: <177430813062.1478690.15814957630399467031.b4-ty@nxp.com>
Date: Mon, 23 Mar 2026 19:22:10 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SN7P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB11962:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2d9220-6d26-4b77-0eab-08de8932ff3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|376014|52116014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WqTSC787q649ZqmddMRa6lOZ1mqHB7cXy5bt71l9h/l8pFNpT9A08H+MDwcNvv+e04jqTerMGofJwToL1JNl1gJixAOQ/hq4OIGWLXn74oii+D1arZ2H99R6jRbKKWDNu5eqOiCOkx4BNaHltVSnhYuq06rwE25SuNCELESMyVvCrLzHyFXk0zc/7FUAw89KLS9hTnwgP7lCOD60CVL/xZ3l0PkKSPYfFDbumblAvxfgYm4cMCsFLt+ftpcPJVKv8cDTSR7Rb730eZXKc2Ehix5YEf3qApLOi9y0haevVKOcI4XE3j7IdAS4wdDgylAi5cPfj6P5tryWzo/yNUOuclKlDbgngymY+xH1nygHChKTMClhdlZSgI6vAjvORsz3D6eM33rANbYh9+gi/sXkyeb1qm4aFpTSdp+vaJz8pdsa5dsAPWF7f6Dmij1QEOFp2nkl2rtJdmV4829Dr5we4cBTlwcQnBPDhanZN+/Xs8FNVyKDQM4Jxmcvg6Gux1Pjt4XBRGA2eeulpnO05DW+9Uhf139ONP0nI5GL4Viun5MZK+7jhMKsfvzHPAqIbBpX65as92uStFPzNmjLlVg8FxYo6WT6CY2IEDLqeAN82ZAl24H23xkYtH8gB3lDVzKaAE5UKrQmoBHeeJeHUgmPXfKqHhWtWrWe2MidwA4KvpNBcYAlKQW+jvT6CYCRMzL6MUdUuHpPWiisVRCE4ois0bzTV9KEzKff43X5dK9yRvFygUKSLynGMW1i6fcucrS+v//qksq0R4boR0rErnLyiPCig/TgpZSIYkaetZld0rlsQvaXMIdVxtqZMGYPDAwV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(376014)(52116014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEV3U2g1YytxcVFpYWRKeDNrWkhDOWdqVHJYNGNlUjZFRks5MXdEVnF4Q2pv?=
 =?utf-8?B?Q3NaRWdreGRpWHZXYjJEQTBEb05kN3dNTkZ0V1I2YmR4aHY4T3g2ZjBCclN3?=
 =?utf-8?B?RElZdVdvUUtJWjJhZjd6SjFTblB3d05jcWhxdlZidWpodkRXeHFMT3JCaVZa?=
 =?utf-8?B?RnFXanRkWGxKT2MxckZOREZadlRQcjFnMmFmRXRpQWtTdmpCSnFEUXczUGNV?=
 =?utf-8?B?Q2V2cHpBdytERHVwZWZONUM4citKSzRQaURLd0I2RStSNTFKZEI3WmlLRGJ5?=
 =?utf-8?B?WXJUSDdLTWw1YkNIeGJ2OGdLcjBRU3lVWGUwTXR0cjV5WXBHS0xDazJ4eXBq?=
 =?utf-8?B?STlJMkZyU0IxYTJQQVE3SW4rZTZvR3hLOFRpdHI4Nzh5QXRjSVBpL292dzVm?=
 =?utf-8?B?ZGtLN0pDYXRDQzNGdlZES2hiaUtKQjB4cXByK1JUQjZxU1p0VitweXU0YzYz?=
 =?utf-8?B?RzREUkwwY0RvL040L0FJN3hmWmRVaXFyM2tHSk1DOUNlR3lsbktkM2d5Nlg3?=
 =?utf-8?B?bGdZSUlyYXRlcHBwYWp5U0gyS0xScXdCeEtEdUdnbnh5alRkL040UVFkZEdX?=
 =?utf-8?B?WjZ2bkY1RllTcWo3RElQV1BqbkJOK0xJSE5qQ1c1YmRpZzdTRVNTZE9IbCtG?=
 =?utf-8?B?dDAxNVBwS2tuL1NBVVp2RW1Cakx4ci82Q1U3Z3o4TkN1YkpsREgzOGpuMEJu?=
 =?utf-8?B?QjgrT1BiZWd2T2FpVDl0b2VsdnY5WU1DVWM4cW1MRFhrSEVWaEZFQVFJakl1?=
 =?utf-8?B?bXgzU0VkaEplWko4MlJoaVVQTkh3NnE4SzlRM3dhakc1UW16eWg1aG1SLzhp?=
 =?utf-8?B?bzdDT1lPNEpoYzkwZGhKQkNlN3FXZUNTclhSWnRGS2JCRHF1Vk9kdGxsNlFG?=
 =?utf-8?B?dDFzY1AxN2RQZ3FIN0hObFFXUTJ0QnFrSjNxTFBMMm9yQllIMitOSFBJWGZS?=
 =?utf-8?B?R1RwdzV5WHNCVXkzZ3BxL3puSWk5YVluMWN0bVBMbnBYREpScjhXYWlmZUtn?=
 =?utf-8?B?MnFDc00xSHFqQzh5MlZQd2xKVWVRangyUmtLSFFDOEliWDk1YllPV2UwRFZM?=
 =?utf-8?B?cVhRT2NvK1A4cjdCdFBOOWowL2F6c1Z5eEY4NG9FWTJUcHU2WGRYYlNsaHRZ?=
 =?utf-8?B?YkJXU25ETTd2WjB0RER1L2dEb3I1QlNTaFVFQXVJYXJiOEVRQS9JL3o5aFdH?=
 =?utf-8?B?RXNMZVV5U0VKK2kzN1JaRitJT1daaVZwMjNjRmxRTGJxSnZDMkJMR0hPbk45?=
 =?utf-8?B?Tm1UcmZvZ3dnT3ZhYVBGUzdTM3ZmWWlpOUZZUXNLUnRpdnlzdG9tQysyN0dS?=
 =?utf-8?B?SU5pbDAvVzMwVVJsUXFRWjdGTW1TRkZPWDBLUE9MenFmUzRVT1k0cDhhYXh0?=
 =?utf-8?B?U3I0UmgwckNqdWtRdFZ5dlc3UFRtRU5UTVpPTjg2SVdudWNNS1lxMGNKaXpw?=
 =?utf-8?B?OUtGTGdkZ040bjljYk9mVzNrWXd0OTVHNTluNXdiQkh3NDdkTHIxY0w4MWYw?=
 =?utf-8?B?NCtnUVh0MzRkdkxOK3dJbzRHNzNJRWRrTi9NREVOUlc4bjd6OVFSallhWFEv?=
 =?utf-8?B?Rm5IMTFIdVZzSWF6UGpoRmtMbFgvRUJoZ1RwcG02NVBYSkZPY2t0T0doeDlu?=
 =?utf-8?B?RjJ4WWNidFRFVDdzaml6VHU5SHpBc3hhM09DbnkrZ28yMjF6NzFvOFBtSzVS?=
 =?utf-8?B?c0h5MHMxK2xHelZVYnE4VGRtbmhBbDVoWHVyTjNUY1ZnRGhMZzZNVHh3bGdV?=
 =?utf-8?B?bTFHM2NBRkg0eElNcThwLzlCMFVUZW44TGZURmF0a0xDNC9od3pISytOYWNh?=
 =?utf-8?B?ZDhtaitHWFdCL2RKbnJXck9Damp3MVh4bittY2pIWFk1ejRoenhtUUd5TzMr?=
 =?utf-8?B?cENEV3djdzZZY1B6bTdCR1QzT01wYkZMT21OTm1mUTFtWHZlYTRsKzVYeTJI?=
 =?utf-8?B?bm5JdUE2c1hGazcrV3JiM05QWnE4ekNBWHdEN3pVelY1bVV0QW1rK2FGUXc5?=
 =?utf-8?B?SFRlcmVVck1reTYrVkJ1Q3RPck5vaENub3FUdCt2TGhhWFJsV1dhL1VFVGEz?=
 =?utf-8?B?S29JODlEeXNMRyt3cG1KczZ4TS9PN2Fwb2N4cHFCc0dFeVFmMDdZZFh3WmRG?=
 =?utf-8?B?YnBHU3Vvd3hDejY1S3pBYUlmOTBHdmt2eFg0REY5ZkU5VWt3RWtTcXpmUWlp?=
 =?utf-8?B?dFpwY2ROeVoxSGV5YWZZNUJ5c1dIQUllcVllWG9kbExpeUZYUjZZZ1BrMkw1?=
 =?utf-8?B?UmJqcXBzNGszdndJNml2Y2hqTjBnRDE0Y2s4NTd6VjV0RFluT2JBUUhTNVJ6?=
 =?utf-8?B?Rkg2d1ZxZ3RMQ0FsYTgyT1JUa21JMWYzeHppSTNSV3A1bWU2TGxudz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2d9220-6d26-4b77-0eab-08de8932ff3a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 23:22:05.9323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sm5EJeQV48td90PWPZAayHoHIBfvCDD2cOKkzW0rKnTIEv8DQCLPmfonDe9L9qyNb5yYEt7GwpcddHclMz9/Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11962


On Wed, 11 Mar 2026 15:41:11 -0400, Frank Li wrote:
> The i.MX6SX LCDIF is not fully compatible with the i.MX28 LCDIF. The
> i.MX6SX controller provides additional overlay registers (AS_CTRL) which
> are not present on i.MX28.
> 
> Linux has supported the dedicated compatible string since commit
> 45d59d704080 ("drm: Add new driver for MXSFB controller").
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: imx6sx: remove fallback compatible string fsl,imx28-lcdif
      commit: 2031fc524eb2805ec3eaa972041ba5cb27b8d707

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

