Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E31387572
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061434; cv=fail; b=W3cRnEqV7+Kxf8T8aloVmv6fEZV+GSl9fM12Zn4l6/18OfWgAy/SsL7egEoheIql9uwwi+CrcTXyZcnf0G5fU8uou/XFYH/LSwcCg08TXAITTUyYdSua3Z/nrKZTIk6pHQDPkN2UHECU+VE65XyadZ75+zchAskua5k4lcQcSQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061434; c=relaxed/simple;
	bh=6SZOEVp8kMswdertECtKEdCJ6EKauNufhWZuK7UTWIE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NA8d1EiOC7odPFF/VbQQoYs0KuWQgabnTC9/MZV0+7MP3fnRoHxxyAucdRfp8+pkcWius48kQCXl73rZzNhBX0A3kMA1KRXbul9/eIyp9mcAB2yYK64H4QFWZOv7Zo17u3U4s28DxRcc4IbAFNk3km5m45y6iYqEVw2V06vnrjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GY10YsKz; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GY10YsKz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+kiT4A7J+a0y/mZp1xOECrUcUH2gETwKgxVHPEnsEOyYUAX7J09E++0+mUIw2wKn5tUgUH9u6pIk+H9eMgyhgFJJ1XNKgskSipYhPwOHVUbY1s/i1j8FmV1FOYcPAiWRNhsUEVEDBtqVv54rvLsl7cgjPq85YvgCtbVw0uUf1K0A3k0A3mqGQz8IYn7Gjq0CJIauWFvwSE+dvKFbzXrPIskssXio7LQ9OJK+PaKxjDh80WJKQzzgbrjlejyJFUuPLuRyI1utJUavN8BVBFVCE2WhasNiXreHUvt6ju0h1V2HEnKCK3/PMz1Ca5kCK9wj2rTPoW7HyYz78QNQ9JS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4drG1hYrmIJNzeLLpOrlckgjsLJLVPpV7H2rMst1844=;
 b=metF1igAuXOuen9R+5wvLH7aeUZEf9vaR06oWE3Q1tr/VzY5xSKLvI+QRov/ues56Q/JblPCZoVuLtzSf2yOvm+VahzYostKm4jDEFgeUyAghi1COPd9WqMQXhy5xOJySRMO1Ujs2a+7PbO/HfVWagyMcFku9qQnUn3DxSg5ILpXzJJ+oWF3j7Yc1PD2oGjCQiPDl32HF65jeZykv15ZAzyJRiB96HnjwiAwuswwbEuPFffsE1G0nY/33G3eJNSjyOK4/mYWilsyRZmtPz93F20J4K38PucoHO9d+Zo7za3KGoiDa50kgQMPX7IcWUMsQrGp599dV2aFH7MB2BWO7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4drG1hYrmIJNzeLLpOrlckgjsLJLVPpV7H2rMst1844=;
 b=GY10YsKzMmnPXjuwFNYixJBTmpYl+8vC2vt46X5EwbY//iqLlR22IcX/SuE1fjFNhFFf39q+kPt3malySLt/MEBkLUJn7xcRqJKwPDoc/n+GQL5jE560DzawEYgsToUQPzcEq8SlqAZderTjsgcYtcstXW8oPoCHgMeNasA1YEmpXJPOU3KpjXuQ09woYWNo++qDKhsKQal+nL65RIWx8McjZTIxyutnTLp0e2yRkvAmA91Emw4kBdC6/X8B2P7Nzpdmht0E4y3SdcVeNrr/jNQJPiK1tJKyYT0aeEHjZ1INvBujB8Bp3oFq1KJ7WGFNOWojq0WIfHi9IVO3FlfR0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8667.eurprd04.prod.outlook.com (2603:10a6:20b:43e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:50 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Feb 2026 14:43:24 -0500
Subject: [PATCH 07/10] ARM: dts: imx6qdl-sr-som-ti: use fixed-clock instead
 of clock-frequency
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-imx31_dts_warning-v1-7-434dd2643c3b@nxp.com>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=1335;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6SZOEVp8kMswdertECtKEdCJ6EKauNufhWZuK7UTWIE=;
 b=XfRk8HGn1wJAFQhT0TiE33tJtnkcKzyZ/+EuZNUMsSpFTAl7uKaNT5D7hPF0RsKEuZ+XEGSau
 gud71y9zraPCnjGTjwOOWvVzjruwpUvnwsmHEIuRhBE4+lHThlHFrMt
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: b60d6ede-6d53-41b9-6d3d-08de62936382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlhEUDI1QUIvM3VvVjl4TS81dHBDdkwwVXJBWThmV3cwTXRGS203NlRvSG05?=
 =?utf-8?B?Y1pnL0liK3JsTC9JcmNpSG4zT0JvMGxkUzMvT1ZWa0Y0NmdXYTlRaWhlQ0pL?=
 =?utf-8?B?dExydldJZHRRbWttaERXczFkaXZzdlZVSW5LVE5CN3hlVFFKaG9jaFZKUitV?=
 =?utf-8?B?NytsQm1SL0RZODU1UVNkUmZXbmo1Z0xET01MaXZoVzFEczN3SDk1cFRPZWFM?=
 =?utf-8?B?RW94YUZzejBjajNYc0tnYkZQaWFSLytHTXM1c0VMQTIyUzBMdEdmODNKWURw?=
 =?utf-8?B?bU1xdk1kdjJHSjBxdThEV1pqRklTMlpUTFMvaisvNXJhZ2h6YWh6UmVpY3Bu?=
 =?utf-8?B?UWVzL0VnaDhCeHc0U0xVcDcyRWswcXhiZTUxZGgwMEdLSHlEZlA2QWU3MXB1?=
 =?utf-8?B?WXlyNk9yVjl3OHIrOTAweklHVE5FQlRlMHo3eGpEQjIrUFkzcFhTL0ZYQWR6?=
 =?utf-8?B?MDVwVUtaUnAwZmlxYlByTEdXT3haaEpvQ3BFbXZFOWJEdWVMQVpwTVJDK3hL?=
 =?utf-8?B?bWd5OWZtZWN2K0VHdnBlVXNQdkpiYUZlVkxINjByK2xGTXhpazJHaWdEVENx?=
 =?utf-8?B?Tmxma3gxNE5adVVQMWlTUXlTQUI0bU9laUpNc3NHRFI4eXRxS3E5SmhNRkZ6?=
 =?utf-8?B?ZitldnBtNjdoWnJ2a1VrOVorSDdqWnBNTFVMQWpFNm5rRXBuaGpONzdQKy9I?=
 =?utf-8?B?WGo2SEF5VDFUeWJCNHlqU2ZsVFJGdENBYkFCenB5eGFrSCtKVWRvTmRnNmRo?=
 =?utf-8?B?VSsySDdxNi8xWVh3aVlyMjdxZGZ4TW1Gd1JsUU0wOGJ6QlRNbUZTaER0VmpW?=
 =?utf-8?B?M1VoSFhrejR3RzlHZ2hlYWhNU29kN3RkMVhJaXZEbFpRWVlKWFpLSGUyaGdD?=
 =?utf-8?B?M3RPVmc5MWgwSVh1Z1BCK01KYVBBRVArTHRQU2VYemlvR3VHTEpjZlFGUlZ4?=
 =?utf-8?B?L1RPc0h6QXIrZUc4bjRPYmNwUEM1VWVtN1VMUzZld1FVTXY1M1E0Qi8rWTdq?=
 =?utf-8?B?TGlpenlVOUd3Z2xyWGhVMTY1T2hTQ2tGb0hYOTV1YUg1cGdZbVpFM0d2bTha?=
 =?utf-8?B?WHFCOFZzcGxuVDJWRWlhdml3UGJUU0V0M3V0dTJaNGZhaUQwb0VjVzd5ak5I?=
 =?utf-8?B?RHc2OFhNOCtwQmZUWjkybDVnNDFTbTUxU1RhQ0Z5dU9wazVkYlFjak84bFFD?=
 =?utf-8?B?enpjMkNEYUF4eGNlTzIyd3pWUGozY2FEVFNWVmNteVNyc1V3a3RqdFdLcDZ1?=
 =?utf-8?B?MlBzdVAva2FxamU4WHhLQUlEZ1hLSGEyOTdKVElrczAxSzAveFBBNkxmcHNU?=
 =?utf-8?B?SCtIeW1mcVpJQnhLeTZyRDlOdnI5MHRialpRL3JMYlpKQnJVWWkwVkl5ZENo?=
 =?utf-8?B?WTNZOVY0WDNZOHNtUlNGMU5FMmNSeE1yUXpEc055aWFlRmk2R3I2V0p6QnpC?=
 =?utf-8?B?UlhNR253V1BkcFp4WXdmWkdiMjA1cmNmVHRVZGRzcytPVWFZNyszUDkzV1Zn?=
 =?utf-8?B?NE1INXFRQ09rWTI2b2lvVmtrU1BjeWl1M2ZIVUlHS0xLZVpBenZXSTNKcmI4?=
 =?utf-8?B?MU5XWnp4L0tjRHlNMUgzT3BxdFlXYkRhdnNjNnUvSjI3VVNMRHFnaUNGY0Rq?=
 =?utf-8?B?K2xXVFdyVjUvaHpNVkRhNGtlOE9BM1JWeFJOc0s4Y25TaVBEVGRrcmlaL0NX?=
 =?utf-8?B?dmFQbGxDUmMvUWs2OXFNakZIazJoa1lGQ2tWenIrRGc2a01iQnZZMVk2cDF2?=
 =?utf-8?B?a3RyeVMyNjV3SkdvSTNVR2VBZGxlbWljQUNTY3BiNWRlMXpGYUdpMDJPSGY5?=
 =?utf-8?B?WkNhUHdaT1ZlYUhhNURXcmVKa0VLTmp1Q25TOU5zY1lDekE0bG1HdWpRUCtP?=
 =?utf-8?B?SmpCWGZrWXlSUVgwUUNnb2sxdGx3VHlhVzB4ZGpreXYza0greUx5UkR0MHFC?=
 =?utf-8?B?Zy9SOFZabm4rdmhzODJEYXNFNExyckpGblRBemN2QWhjL2phMzZGcjl0cFhZ?=
 =?utf-8?B?MmxDVVhuSTY2cmZyNTc1SHNJV25EQUdtc3hHdTcxNUlRYjNRYTZvaCt5cVRK?=
 =?utf-8?B?Njk5MkovVzBKRXBLOXJCTmo1SGlzYjJZSzdFZVNieFRHMkJRQjM4SkVhdFZz?=
 =?utf-8?B?SWxCdzdrTXhFamF2VVFjNnUzN3VPdk5FRk5PaHhQYTZqR3dRWFVPT0RkMUk5?=
 =?utf-8?Q?phEqmiKizX/uJwqBymWyB2I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUd6OHpwT1hJdzMvUmFnK0NwQ1h4VnBndCt2QmQ0dUduYlk4TVpTaWhHcTVF?=
 =?utf-8?B?T2JSOXRDSjNOd0N1S2laUTF2c0RkUDl5OUR4aGFZaVNhd1hCMEpubEl4bFVD?=
 =?utf-8?B?T1BNbG5udDJFMnk5WWdVMVpLeExranZTTVZ4aDgyRU9FT0d4aDJlczFET1pu?=
 =?utf-8?B?YnpnRFRvN3pmKzhGdGpHQUMwY2JUemZqeGUwR2dKWXBjaTRJVmVSMjcwNXZ0?=
 =?utf-8?B?VzlNUFB6ZE1TandoZ2cyZmFqSTBvRlUyUlVVMzhNRkVwS3JWNW8xSk8wTWVq?=
 =?utf-8?B?dHJIYUJURnJvZ3Y5U0hwOWJzeFhzNnkycFBQUjFRYVZpckZUMlVrWHNUWmI5?=
 =?utf-8?B?Z2kyUDR6VlhjN3p6MmNPYVBDL2ZXRGdCL01icHRDZ24zeHdyOFArUitGODg5?=
 =?utf-8?B?aWpGR2Nkc1Z3NDNRTXV5TGFKNUlZK29tTUJRc1JuT3FPeEw5ZlhLTzZyby9a?=
 =?utf-8?B?R0tmbVJSK1J5eG5UZzBHZEZ4RjYvYmpPbnFCTFYxUEZENGk2dTBsc2Z4STRm?=
 =?utf-8?B?TkN4QVlDemR2eTRnV2pJVk5qQ3kvNTNWbVR4d09vODRVQnlUTkltQ1V0bFFQ?=
 =?utf-8?B?YmlEcWNNTU5TNFVabFpkaGIzU2VwSDVwYXV6VDd0WlM5aXY3aUJWZE1hYmRp?=
 =?utf-8?B?NnF1OHJLYnlDKzJzNGloVWlQUjc5OWZraWp3cURxVTRIbTVtaVFocnRvMkly?=
 =?utf-8?B?MzZYeTd1TGdMT3F3aVpsODhYYUtLQVdxTGM3YjNvUFczbEZNejVQVnorZFlX?=
 =?utf-8?B?QWVBdHZRUmYzN0FWRm1kYng5NXZkOEZkR1BUcU5JRVRrd3ZLSDlyTi9ob1BI?=
 =?utf-8?B?VnMyTnU3MVZSV2VvSlVwSzlZbU9CR2NwU2JDRSs1WlBqbmJZWkVVbHZGK0NH?=
 =?utf-8?B?b1l0eGNzWkVmcktZVi9jdEZNRnVqQU1hTjVYdFU5R0gzeHQ5NmdTeWc0b0hB?=
 =?utf-8?B?T0ZUNkYrOWVEU0h4U0I2WXR3UXBxSHFpUnFoQkxKUnhPWVc3RHBiRTVLVE94?=
 =?utf-8?B?QVcwS05BSHY4dzVJN3I2YS9Vem5Kd2ZHaWZSZ3NWK1orOG9uSU1nek5BeGJE?=
 =?utf-8?B?TzBIdTA4MjVhaElkbUxjdXEyQ3JmQ2ZDV05idjY5MGkxSG1tbEt2ZEJLUlox?=
 =?utf-8?B?RE5kQ0ZYQlJZV1k2Y2QzMUpnZkxqT1FhSTB6bkVYZG5UQjZTM0RUYk5ZMjJr?=
 =?utf-8?B?Qk1zYWkzY2RiZFpaQW1LRzhQbmZLTFlQZld5WjNrZGlaRy9URWRBakJNYmJP?=
 =?utf-8?B?ZUlscFQ2OU1hK3lJdXhRMnBtYlpNN1o5VDUwNnpJay9Ia1MxVlNrR1dHVmJ2?=
 =?utf-8?B?cFNUUTN3Z25yNENPdFBTcGQySjBUYU1VY2tmVWQ1bndBZVQrUkMwbytrUHBN?=
 =?utf-8?B?M1JWSXUvNVZ5R2FRSTlaY3VQT3lCUUdEY2cyMk8yRzhDK1NVUnN1V0VQWTlS?=
 =?utf-8?B?WEtxaURiVURxV0dsWjhhZFdkRFpSQkEvTnNMSnVoZTdpSmd1SjB4QWszWkRJ?=
 =?utf-8?B?cWhvSnBXZ21QdW5tWUZnU3VTK2xVNVllZzEyMHRyREdwVlZrZlFYUzhMMWE1?=
 =?utf-8?B?TEljWDZzcVJIdGFDZVAwdk1vN0lHQzU0ajZlR0tORlhLS2Z3L3o4ZTBzV2Nl?=
 =?utf-8?B?VUVleFNuZnhZZTFYUU1lellySmdYMGg1L1lWU2pKM093SFdJYWVHOG01TFZx?=
 =?utf-8?B?ZmY2YkVETEN4Tkc4VEM3Yjd2WjRJNTNmd29PWmNRYXhLOGY0ZFBTTUtGc0hy?=
 =?utf-8?B?TDRHKzJtMGMvVnZTbEtFWUNCNEpMOVg0TGVqQkZBN0lYWnJKOWxXeDJrdXBD?=
 =?utf-8?B?T0NLTVVaR1pEclAwWCtQam9ZWDM5SEhFQk5ybHlEdkdnMUxJejlKTUN6am9s?=
 =?utf-8?B?clZjUmdqN0djNzgxTkEwRit3NWszNlB0d0t2NktoTkh5UmJYdXBLVTNRZHR2?=
 =?utf-8?B?QlRkSG9WeDZRQ2EycjVZM21oZkFWbXRqY1pNVkRXcnpBR09YYUVzdmpveTli?=
 =?utf-8?B?NmYwbE5SaWRIUi9MWU9tbGFVa1B5UlQ1V1J1bGo5eEdOZHN2VlU3WTNPbkw1?=
 =?utf-8?B?czllNTQzM2h3bkN5YzZlSW1la2Nsb2VjVXJhemZwZnRMS0RLNW1wNlg3YWJL?=
 =?utf-8?B?eFlXK3kwVVpPL0lReVZ5SXlYZzYvUm81Tmk4TFd2emZRWWpJZXloUTUwZGJy?=
 =?utf-8?B?THZpRUhZN293YlB3a2pmL0I0bXkyWTloMXhQOXRXZ0ovUzRrNmJ2NG1MNDVJ?=
 =?utf-8?B?QklmeS9YMHBxZ2dvQ2dJenJNRE5xVldCR2ZqZmhiM01WeXdaL1EwbWVVem1l?=
 =?utf-8?Q?qQlw7q5WDp0WNPHYpn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60d6ede-6d53-41b9-6d3d-08de62936382
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:50.4206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /G5GZd61xBNaW8/KYb9oWruyCFklkFa64kREHHmV23NIWzCUCF2vM9emCTxsiOMfQ5zaMQiNNi4Xd42hAQjbaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8667

Replace the clock-frequency property with a fixed-clock providing the
32kHz input to the gpio-gate-clock.

Fix the following CHECK_DTBS warning:
  ti-wifi-clock (gpio-gate-clock): 'clock-frequency' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi
index cd1e682f11add204f373b54b7ad90909fa6bfb5d..8192344d529462b7ee0a926e8650cdb316457961 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi
@@ -41,6 +41,12 @@
 #include <dt-bindings/gpio/gpio.h>
 
 / {
+	clk32k: clock-32k {
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		#clock-cells = <0>;
+	};
+
 	nvcc_sd1: regulator-nvcc-sd1 {
 		compatible = "regulator-fixed";
 		regulator-always-on;
@@ -58,7 +64,7 @@ clk_ti_wifi: ti-wifi-clock {
 		 */
 		compatible = "gpio-gate-clock";
 		#clock-cells = <0>;
-		clock-frequency = <32768>;
+		clocks = <&clk32k>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_microsom_ti_clk>;
 		enable-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;

-- 
2.34.1

