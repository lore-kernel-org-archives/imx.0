Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010014.outbound.protection.outlook.com [52.101.84.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2932FF645
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 06:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764655462; cv=fail; b=MOoRW8ZqY45M7IdLQKk8VbR3LxCp0EDc+1INZEXpk3Xj4Z1HpUBieyk9QXsLBiVremXnE2i6E0+6OHFSbDyVFtApDI1rDtiTZExWlDl3/Y1Qa8g5f0W+rEC9ubKqIuphVab+V5sy3nSmGTT9TI8Mw4p9n6o0l/OtIzTuTn0xi80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764655462; c=relaxed/simple;
	bh=cwV8bBgPk670jGvAc8HS3B3crI4fvWToRRZJ+Oc77RM=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=LTu0fnbVjQkuTCPnYZba1P1yxKx7wk1FTr77IwYLF7YP2IP/nHHuiGH5eqLdd75E+xSnwuoxn3zt/Lnv9gS3D77tDebDf/p2JTG0Jh4WFfcXO4B08lqmuEr6Qi7tOPBKtnr0t2tBXAO7r/dJtsCn4Lai4vuTTG9ub4t1xme6p+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oGbGVSqy; arc=fail smtp.client-ip=52.101.84.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oGbGVSqy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u4clWdhY8UBcHsxHZux5nTJsTVqRApSvfmipkSnEcp07T47HVWg6mKfqUQo5b/lLodr8qI7FqeDmy0Dtguixjs150WbaL788px4IkDFJx3gwYawh+LrUg9lA5pZ4D+lRZos2rHaJBMyT+3B8WiH5Orf3a75ZxVPGfUAxTsWFdXLeYaUTPE5QFrMmENkf9epHXSfu8dCPW27UwifuYOeinuJYbx15jVbS8V+mY2CFSdz37S0VNKiF+kxWBzz/C1Az13ExtaEuE8XSliBZUBBS5vlSm5EJjpiNG3n8i566fD8gLg10czEUvQExDW9cqwZi+NrnLDxtnLEx/R5Uvr/L+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIyGMr+Tx9f7csB00AAkt5vo9Lm+ueom7DirpTMgexI=;
 b=mlezMQqS/5BTjg5S4JY6+aFnuoCrArtV7CLT8bivD8iVlhnr60kpFTpzn4BxkkPij0uCOqOS+pYBp7y1SAPUGzIpPomdZSECx4Sf6SUbK9IzC0NU1Wer6cOpaoCXjOA07J4lDiOn9lofZ24iEW6c9OV1uMDwNzzRgpP8ZFfY0UzLfud4bT5vgh5haySOC1v3fLqlCxX1avYvJJ15vZRp/w2p6CHB7SFWs9JKXbY2HB85Z6RNDQfJmFOL7O4B0zsMMoA17ccU/oxuoa6l8SpDL6AKyDG9iqa+xNiu+5h2reKPYje2clAyvtPjusCM9wnEUSz/IqVNHmkcXMayiWqh0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIyGMr+Tx9f7csB00AAkt5vo9Lm+ueom7DirpTMgexI=;
 b=oGbGVSqyh/DVefXW462kS2RSE9bRm2i5RsUZZ8sqCzqELJKYaKXnhLVzyPXAOP30EGINd0ve2zjqDsyflhEsz33X052R9z4vLV06+FaYZI0G0hILkTtiG2k/yF2JeODuK2+aox/0CSTnCIKwICcnTM5X47RipHop8FTUWnnFTaAtm1ssQztiUjbjX03iEwlOpT37UwwGuWmYSXHGw9i65hb8T+9ekAyukg6jjvBF8IHwt0mEMHbG3l3e5W7vSN/r6bdJjQ4b0yJaxQWlNNjvRecN6K1HlSIR1ahReqE+5Q9uIFimgj/Gn/V82Ib9F/0l2zA8+kv0vXm3LCF7tMoTrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by VI1PR04MB9979.eurprd04.prod.outlook.com (2603:10a6:800:1da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 06:04:15 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 06:04:14 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 02 Dec 2025 14:04:33 +0800
Subject: [PATCH v2] arm64: dts: imx93-9x9-qsb: add CAN support overlay file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-b4-9391-can-dts-v2-1-edab562615a7@nxp.com>
X-B4-Tracking: v=1; b=H4sIAHCBLmkC/2XNTQ7CIBCG4as0s3ZMmYIWV97DdNHyY1kIDTSkp
 uHuYhNXLp8vmXd2SCY6k+DW7BBNdskFX0GnBtQ8+qdBp6uBWhKMkcCJo+wkQzV61GtCsrznUl5
 7qwjq1RKNddtRfAzVs0triO/jQWbf9de6/LUywwrqGBe21aSnu9+WswovGEopH6FfRMysAAAA
X-Change-ID: 20251125-b4-9391-can-dts-2f4849978fc2
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, frank.li@nxp.com, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764655522; l=3248;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=cwV8bBgPk670jGvAc8HS3B3crI4fvWToRRZJ+Oc77RM=;
 b=PZzR1qejb2VlBzTh0iuH9yHwTcYTpwWMW1Ir7IpTWPej/nT94h2zAOF/mrUR6g2gpMMEQd8FX
 ggkURbvcgWjCgtsI0e/uHhLvitFb/gmH0fhXgFiY6phQ7TKy3Q1t4NH
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|VI1PR04MB9979:EE_
X-MS-Office365-Filtering-Correlation-Id: 26916f38-dc01-493b-b7dd-08de31689e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|19092799006|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzBLY3JBS2lBMUFZTEdZRzR4YjdvZDBTNU5kZXo3RE1GcWVySktCY3JtTUdy?=
 =?utf-8?B?dCs3eHFzMXhkdDdSckhCREN0MEE4TCs2S3F4dndzbU5QNTlBOFpNZ0VyV1p1?=
 =?utf-8?B?clhQYU1pZDI3Wk1jbE1HT2hjSk1FZHYvWElCZVdoVm1vc2VEMHhpSGpHUkRw?=
 =?utf-8?B?d3lqVkhhU2RiaGlhTzFuaEIvMVIxYS9YUndteXlYZXViTEhrcjhOTTl2WXZo?=
 =?utf-8?B?emtCYmxIRUxvRGtwc2pEcHdrZW16bCtBU1BldHVOMWJ1bVVGd0NFeS93alNQ?=
 =?utf-8?B?eTFWNDQ0WUZ1dkRlNVlNN2lFSDRwQXBnVTdEcVFkMGpYaytJalI3K2l2bThR?=
 =?utf-8?B?MEZpd0IwTysyTy9HZU9oNlYxRndhK1FtRWVnb2dMQysyVzJyb09xaTN0MGJq?=
 =?utf-8?B?SjVtVlZvbjhsa20yQjNERlNYY01wbGhCTmtBQk5YUVd4WGx3dmlNNGNPUFhx?=
 =?utf-8?B?L1pCVXdPWjM1Uk1zSW50aVEzTU1GRWlrSnQ0NlFhNER1S3RLdjZaeVVHZDUr?=
 =?utf-8?B?eXk3UlJVT2FwSDNVY0RwcGRlTU9MZzdNUkhqRTZscWo0V01XRzlaVmNSbnl5?=
 =?utf-8?B?OHhTTGY4Si9xMDJ5OEJWNU92Uzk0MERLck9aOWdhd2xYeTVzUnl6NTF0SGF6?=
 =?utf-8?B?MHRmeXVDSlF5MHc0K0NVdDR5dkdpb3ZxTTY4cy9nczdOTlpMUE1sNW9WTWtq?=
 =?utf-8?B?dU9WVlprNUJ4UEI1VFVydzZpMSt2b2gxOUpLZlcrSzhleCtmbVFVV1BvV2gr?=
 =?utf-8?B?V0NoL0JxTXhFTnRxbTVFQkVEb1FuMXpNUnVMT0ZLOVNWc1F0VGpzbCtmMlBr?=
 =?utf-8?B?cEZnWGZzVDRPWit3clplMjZQd1Z4N3g1bmJlOWplM3hUMzdUbXpac3pPWmg2?=
 =?utf-8?B?WGgwU3QxRURnYlBVdXlNMzRuaUFkNVFhMHFVcitRVGZ4ZzFKQ1ppSzE2bTJt?=
 =?utf-8?B?cFZyei9IN05PU1Y3L3U2Q0s3QzNOSGYwQnZXZnI3aTdEY1lYQTIyenVNL1dv?=
 =?utf-8?B?K2NENUppRUlDUFJ0Y0p1TjJaYVQ5OHZBUm91TENGRWpXZE1vK0x0M1M5Tkpo?=
 =?utf-8?B?ZkxlZ3VrazdTSVo5TW1BNmZ1Q1J1KzV1a3FiNUwrcE5pZTE5c3o4V2Rjbzhz?=
 =?utf-8?B?b21aYndRSTY0dGlGUWo0N2ZFcWVPRVIzQkpHRXZoSG13SGhEM0R2Y05aL2Ex?=
 =?utf-8?B?Mm9IbmdtbDcwVnVNWUd1VU9BcE1zUndsWTZkOFVBd2NaaFZyek9JRDRValVh?=
 =?utf-8?B?M0VCeVVzNkR0SDRtMjJpM1MyeVV6UCtFQnVTaFZsTTkxRHM1bk9GSGFtZ2dS?=
 =?utf-8?B?VmRiOVRCdzk5aWVPQVdRUDQ2MUpoT1cxbEFaWUFsamdtRzRhdW91SXdFTk1G?=
 =?utf-8?B?U2c2NkxKOEplcC9ycDU4T01GMjgvRXcrZHJZMEwrbWlzUXhYY3hid1hhaE9R?=
 =?utf-8?B?K3p0VjdpbDJpS0NCS2diVzBTTTRwam1kaTlicy9EQ2lta2ZHTkZtZHJORks5?=
 =?utf-8?B?T0ZwaTk2cjRkcUM2SjUrRXcrVXdUYXpvcWxhQi9qR0g4WWNRU2NGMGJZengw?=
 =?utf-8?B?UlRtZjhPb3huNjR2TTlHMnB4dmFweGt0WjdLNTlJelJXcnAweDVpWXgxUmVL?=
 =?utf-8?B?ZTdTSWdqeER3TTUrRjR3Nk1LYjlDZTJ3UnJQVHhQNXhSNHZmOHZ0SHNGKzhv?=
 =?utf-8?B?aDkxUWwyMkhTc3ZlT1ZmUVoyVXBMbXN3SWhrdExEUzNRVzdKN21ZSC9Mb0g1?=
 =?utf-8?B?RFlkVTZLcG9FNnVsY3k0ZWsrZXUvaFA4aGdwZTV2T2F5WnJWZForR3BReVZP?=
 =?utf-8?B?TVVaanNnb0JlL2V6MFliV0RqdldwRlEyYld1WXovKyszS3htUkg4eVJlVjBF?=
 =?utf-8?B?bExNUHM0UzBaTGlQWVhGOCt4dWlheEY5R3M2V0p0T3p3dE9hZW1pM1RBakh3?=
 =?utf-8?B?cE9VTzQ3dS9VZEJKMS9oMVZJc1NleDJMNndMa1FuM0pPS3d6azRqeWtCWVNi?=
 =?utf-8?B?Z1ZZVEVHS3RJZkhsN1JhaW9PTHhXS0dIVFhsTlVLRU9ReGx1NER4SHF1aFJV?=
 =?utf-8?Q?5PJbmx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzQ3SEVSTS9tZVBZRVlWU1hzMkxKNnE0bXYxeGdtSy9zWVNrbEh0TnlmM0c2?=
 =?utf-8?B?L080WTJ0eDFEcDUwTXdOMk5SSjBnLzAyaGV6dnp0TVc3QUVRcWQzbjAzbkpF?=
 =?utf-8?B?VlQ1V2pHVWw4ZWNtclB2dzBuVzFHWm1PdDh3OGdwQmlEZ3NKa0pKM1BKMjRN?=
 =?utf-8?B?YisvN05lMXZwbHNsS3J5RXpaVWxwWlRNZk5MUGIwU1BMNnQ3dS8wVnAza29H?=
 =?utf-8?B?KzJzQjNYdUNZSU8vTHR4eU5GU1Azb2hUbEVmZ3NpZ2hSeU42Vm5VbXA4aGdK?=
 =?utf-8?B?blJFZ1c1Y0ZQYXlFeC92dk9FOXlpYzVoa1lJL1R3SjV4bmRQREl6d0EveCtQ?=
 =?utf-8?B?UFcrZm14ejkzR3ZRc3hZUTJOam50Lzl4L1cvZi95ekpvL0kzL01WaUI1d1Jn?=
 =?utf-8?B?a1d1aDdXNTkvL1NIbFk5RnZteFArbytsN25HcFMvQXZaYUJjejlocy9VS0dp?=
 =?utf-8?B?eU5aajd5S205NGlHMEgzb0NGODRKZURSV2FrV0kwTlJWUTVFYXpWcDN1bWFK?=
 =?utf-8?B?S1N6MEtwRkZRVnQzZStRTFVTTUoxSGZ3NUgyOVVjcFZXRFE1TytiK3hHK0VM?=
 =?utf-8?B?UmE5dlM4NEp6eTQ3Mkx2enFmYVhlNm85Y0M5WEVMR0pIbUJ1TWdKOVpPbTBI?=
 =?utf-8?B?VG05R090UUI0SW9TRHpQc2pHQmE5US8zcGtFMVVxUUlhaCtzQktXb1ZQN01a?=
 =?utf-8?B?NlZxOFU3NTk3Y05OaWIvQ296Z01UVXJxNGNLUHVKdmRxZThOeVgxYzZmTmdw?=
 =?utf-8?B?ZUxOLzRZaGN1QUJHM0h3QTkrRTE3NTVERlRyemdnSkNGY2Q3NjRkOVpyY0Jj?=
 =?utf-8?B?QkkrcjN6NFhEZVNSNW8rYmtUYzdhMHZMdnVQM0lXcnQzM3RnTktlaFBlaHpH?=
 =?utf-8?B?ZVRaVFlLWFVBZGltTHl6eE0vbjBpYW1yUk5DWk5QcjhKQ2tseEpKU25rRkRE?=
 =?utf-8?B?aVJRUTJqUStSbFdrSjhYWjh3RG11bGFCMmhWN3BEekdlUU80ZDV6WktxSERF?=
 =?utf-8?B?dE9iZVp6cDk4VDZrSlVyaXJCbUdOMmFnSzVCM200TXhSeVFKY2pidEVYT0JH?=
 =?utf-8?B?VFN4TGlJY2U3Q1I3bzloWEJUOVNhb3QzWHBITmlXS1VMRmNsMmRQMVN1N0VW?=
 =?utf-8?B?S05mMmdiZmRLUHhhWDdHSHd2c2VtUHhKL2wxZXVXZ1BIdnErM2lOWHp1cmRW?=
 =?utf-8?B?Wk5kM3VvSCtRQWJKVmdWWDNTdG8rQjBaR0Z0TkZFakI4UjhXQ3RlS2twMkdU?=
 =?utf-8?B?R0srV0V3OW56ZDdvVnN2OTd4bWUyR1F4eURTR2xBVHdtVUZOVHYxYnJrQVJq?=
 =?utf-8?B?aTFqVFFaMTFFQ1JMRWsvZXRsakZtSjJRbVI2NFBHa2hYMXlBcjhteFcrRlJk?=
 =?utf-8?B?VVkvYys5bW93ZmxXc2JkRnN5KzVYcWhjZnhVVWNQOUFmdXRXd1JWRmdVWGVh?=
 =?utf-8?B?VVpwTFl1RXRZdUswS0FxV1VRamd2UksxSnludHlSR3V1VUJMWHFHUnprRmty?=
 =?utf-8?B?VUU5RkFHV1VwMEIvc29lMGdUcGQ4ZFZXS3ErenlGeEtFQmlQT3d4TlUzMStv?=
 =?utf-8?B?Kyt0ZXpyQ2dCMi9GZnA2RXNpbE9CS0krblNTN2tmejI4YUNnRTFmVUpRWUhB?=
 =?utf-8?B?TVdtQjlOWENZeHorSzA3cWR6anFvWndFRkpuY2x3QmlYWUNBZkRzUGpDNEpR?=
 =?utf-8?B?RGxRVURxUVhvTzg3VmFEY1BhYTlJU3FJb2dkazJyMm53elcySUlQaHdGQlZw?=
 =?utf-8?B?WHA5TkFUa2U2S1FSU0dIWXBhbFkxczVZVVRROXpRL2oyS2twc2l4bnM0MDRT?=
 =?utf-8?B?dkg4Q2dkbC9YaGRjdnNGSDBMRWN5MkFJY0RqWmcvV0k3elJ6Y200ZjJrTkYv?=
 =?utf-8?B?ZExGdElydXhmeXcvbFpUQ2pjMU9MSFVZUmpycXVIYlAwaThJdStNSW5YUVNB?=
 =?utf-8?B?NzhtVGdJdGpjaStwc2krVndUMUdhNEhTTU4xZFpMbDYzRmlLTVZQeWh0R0hz?=
 =?utf-8?B?S3M4blh4WUZxU2IxNTlYZ1dUdkFweWZJNFg4OFFEWUtaQlplWENxOTZsK3dL?=
 =?utf-8?B?cG1nditCZVRzcktuc2FUZWtLZ0NHbFRrMUVIT2tveVMrZGpuNHlxSk5QZHRJ?=
 =?utf-8?Q?0Euc6K/SRVri2Ms8JFGGPB76/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26916f38-dc01-493b-b7dd-08de31689e9e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 06:04:14.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isq4GpioC1z88x0RgVgmiNv1EMTrEhruCFuPEVreNsf9Id1Roxb5mS/GvMoJ1cX1jrOIpUGfkVWPnpS4ut3kOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9979

CAN1 and Micfil share pins on imx93-9x9-qsb board, use TMUX1574RSVR
to control the connection: put sel to high, select CAN1, put sel to
low, select Micfil. In default, sel keep low.

To support CAN1, need to put the sel to high. Besides, CAN1 use phy
TJA1057GT/3.

---
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v2:
- change commit title
- Keep order by alphabet in Makefile
- Link to v1: https://lore.kernel.org/r/20251126-b4-9391-can-dts-v1-1-c23145f0d2db@nxp.com
---
 arch/arm64/boot/dts/freescale/Makefile             |  2 +
 .../boot/dts/freescale/imx93-9x9-qsb-can1.dtso     | 63 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..e15a7b216c5c6753c39ab02801d82f23255b8e63 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -372,7 +372,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
 
+imx93-9x9-qsb-can1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-can1.dtbo
 imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-can1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..0bf1e9d4bad2ec540d71470fcebc64a82072b41d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "imx93-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	flexcan_phy: can-phy {
+		compatible = "nxp,tja1057";
+		#phy-cells = <0>;
+		max-bitrate = <5000000>;
+		silent-gpios = <&pcal6524 23 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&flexcan1 {
+	phys = <&flexcan_phy>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__CAN1_TX		0x139e
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
+		>;
+	};
+};
+
+/* micfi1 use the A port, conflict with can1 */
+&micfil {
+	status = "disabled";
+};
+
+&pcal6524 {
+	/*
+	 * mic-can-sel-hog have property 'output-low', dt overlay don't
+	 * support /delete-property/. Both 'output-low' and 'output-high'
+	 * will be exist under hog nodes if overlay file set 'output-high'.
+	 * Workaround is disable this hog and create new hog with
+	 * 'output-high'.
+	 */
+	mic-can-sel-hog {
+		status = "disabled";
+	};
+
+	/*
+	 * Config the MIC/CAN_SEL to high, chose B
+	 * port, connect to CAN.
+	 */
+	mic-can-high-sel-hog {
+		gpio-hog;
+		gpios = <0x11 0x00>;
+		output-high;
+	};
+};

---
base-commit: 422f3140bbcb657e1b86c484296972ab76f6d1ff
change-id: 20251125-b4-9391-can-dts-2f4849978fc2

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>

