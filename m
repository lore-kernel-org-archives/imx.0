Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040332581
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 22:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770159470; cv=fail; b=bJweGgFM+4UxJq17wQfX3F1dUxq3HuIljebaG3Ieux0WmqgdyPzfnJ70eWNyRRIrwQ2+csidG1WmIF3KGLTHUr37xzFH78ewZZGeAQeqGrQ3Sk5r7vB7RDtopjwhzuV0afDxV7Q4stBDEEEtf0liNhY0zxBn3e8RC0p//iVaPnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770159470; c=relaxed/simple;
	bh=RZ6nLsOyT0h3EzkDYqGY5XeZmyWGYlALhxnZ/XmA1H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ET1My+XHCylknk06+7p3FUU5dQpoFKMuW3mPQG2NO0jwHXqNie1EbEgRNeXSa4UwMKoLH+BV3TgiN5r/g/ofDuDlu4ejIFW3fMKU48fINtKdSPMcsKsQ3g+1Vtv/Xbr5/AW7f2sGc0bX82NA1RkbvSf1ajw+2MOiTnLrmMzgw94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fUS1C3Vh; arc=fail smtp.client-ip=52.101.69.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fUS1C3Vh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjOHrdBXzTYGGl6ZUMWKxIXFwS5Nn/VWTmrSMm+3s4+4/sj4egHAkRcDbJm2+ZJqwz5yV/eG7zDvzOosYCt6dIQcmNBhUKdaaU6w08kSFeMP4F1Ss7xGaF80c60fvWu+ZQ7A/CQLgdmCTHYjhnnM6+XODyGfOlPbRhXdYLmSSpIxKhQdc7rfsrhuBvH2gw4l2Yms8mfAg0XrgDDzBji4ddGQ6PlltnqoocDRMQAfA298KzVcnY/ZwzIVWe3dTNqszasrI4xtvSIY0T45TFQ8NMYhQlfcqDR+EO69L6RnBbVV8RVX9YA2RXYn2IELfwi3qt4uZcXbzFEompDTYmA8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVHkZC9uLgWaakDmFUSbWj6JIV05gYfsoi+d8zEdRg4=;
 b=mA3PijC7TrM7J6/iAQQbbZhcm2G6THmWKPb0BfBw3urZotq8enEz31uX3ibd0gXV3E6Ep1UcLxmlkZXgB8qYT+E2DxK3OuHaNj5/CG9cdF4ZWg59ydd/CvsrrwbQKoRsJqDq20oMiAay9c4L40nDLazAEwWdj+uif8VXeidGz5C9jpL0GeDRnIwGMssYeLctOQQYkfSo0KPESLM4oh+q1K5yuNdGYt15NeW3mq8OwFrnCSKcUQyTEEPo7B0JjyL0qbNkLMtaJ/rW1Y3aNCLHSBqev+2/lYrwK0WilC2lPBcaLZplT8LJoHttD53/OhqBHhiktWObolffsnkNEh8zSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVHkZC9uLgWaakDmFUSbWj6JIV05gYfsoi+d8zEdRg4=;
 b=fUS1C3VhT2Cxcqg4dphCJRmveJU7s7toHW7TVxTSI4EFjyWAl9bdgnRfnLHMEQev+qMJQqSKE5mWmNDTUAgvTG4cbLd22fTRRpbQyjqQ/4KGdIDJT93exfVV07fDBFMuNDDictpOOi/4F2X2L2bdPV/2c+p4hCYfjF7grydt0vmfz/Cf3cRWZSRJvy7NkXz8IMxgy9xJCUnmp97LuY3g7W8OoaRzjqFjRiEXOFp3Bdyh9q32qfaBys9B0bynq3ocMWgTqDfw1iWiKnUbbIVHG0ZnKUHc7ok8xATHo6eZcrIjb/lGee7Ntq7sAxz3HjYche2Z/orWxkeXMD8gTEdC6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10577.eurprd04.prod.outlook.com (2603:10a6:102:493::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 22:57:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 22:57:40 +0000
Date: Tue, 3 Feb 2026 17:57:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: Tim Harvey <tharvey@gateworks.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: imx: Add i.mx8mm Gateworks GW7906 dts
 support
Message-ID: <aYJ9XG8ptxtK7kNQ@lizhi-Precision-Tower-5810>
References: <20260202181029.1832198-1-tharvey@gateworks.com>
 <20260202181029.1832198-2-tharvey@gateworks.com>
 <aYD4BwB3McK45vCk@lizhi-Precision-Tower-5810>
 <CAJ+vNU0rwpoedAvPH5whLSXKHXX+jbsnAy1hKx_0To8KoMqBvA@mail.gmail.com>
 <aYJOQ42Scp5jAjzR@lizhi-Precision-Tower-5810>
 <CAJ+vNU2toxmJGQX=PNxc3U2w5fHNhRmw2vTe8LM_ksarPixXzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+vNU2toxmJGQX=PNxc3U2w5fHNhRmw2vTe8LM_ksarPixXzA@mail.gmail.com>
X-ClientProxiedBy: PH3PEPF000040AC.namprd05.prod.outlook.com
 (2603:10b6:518:1::5b) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10577:EE_
X-MS-Office365-Filtering-Correlation-Id: 844b9a3d-4e18-46f8-5739-08de6377a1bc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?a0d6elZ2NjNydkhERWpCd0FiV24rR3RxZmtDZDJXZzdZQ3Iyb3R4NzBsdXZm?=
 =?utf-8?B?ZG9OWlJlbnFMUTV3OGlkTmQ4My9kVFFwWkpObmJlcVlVUGp3Y0JUM0hzb2Rs?=
 =?utf-8?B?MzRjekEyMGdhNzh6L1FYNTRxVjU5TkF2eFJWdlFKWkxYOXlaVUJSNjFBaUVK?=
 =?utf-8?B?TVNMUEFjWUkyNTVrUlBjdk85alNZS1Vwdmwzc09wSm1BRHluMHhuZmlVOXM1?=
 =?utf-8?B?MWJLSmhBNU84QzlCYjVYdC80SjAwWlU0T2lIc2FQeGJ2QVN0bUJMQnBWT0JN?=
 =?utf-8?B?S1VRaENLdmRITnFrb1RJd01pVEozV255V3pkVnZvRnlXb3hMVk45UkJ2b3Qx?=
 =?utf-8?B?NUFEdjJUUmVMb3dHVWhVZmFoVGpuaU5tQXMwS1BMdjA4OXlyS3VIQjU3eU0r?=
 =?utf-8?B?djZIQm1YdFFRUlNWT0k5TU1xcWlvZGVxOWJhUVBGdVQzSXpVSHdQV01hQm01?=
 =?utf-8?B?djdhTGNDTEhtMVhva21GM0M5RTNmK1hJVjlzNGZobWwycWY1TFNaaUVPMEIv?=
 =?utf-8?B?K3VzbC9LNGhmdHBaekM1MkEyQTk1QzMvSnhzM1pOZUk2TzZoVThFa3dqK0xF?=
 =?utf-8?B?WWtGdVhXUHNhZEVZYUpEcE9xOFVhVWRBVjhnK3YyOHowMDBXc1o4UXEwMXNl?=
 =?utf-8?B?NE5ZU1NBTjJlejVtUXhqOWptWTVmcFFXUjQ4RUMxRHlUdGRXZXhDa3BCckFq?=
 =?utf-8?B?V2tja3NreU9NQk1ySjJmYkRzbUhSZW9LeWxIZ0JWelBnem9zN3diWER6ay8x?=
 =?utf-8?B?L2t1UWYyb3daYUdsRmZaNVVnbzBYdk92UjJ2UUdvNmZTVU5Jcy9yRzNOSjA0?=
 =?utf-8?B?Q0hUckVleTl5eHB3bnlpSjcwMkw5ZE5uTkZyb0xPbmFWUEM3TTZpQnd5cDVt?=
 =?utf-8?B?U0c1aVBKSGNONnhzOWJGb2x6SkpKWnRpWGw2STlKM2FWTUtXYUphY1J3WEdu?=
 =?utf-8?B?TS85V1FBeVFFL3FhUXFRdSt2Y0ZBa3FrTDNvRVA3U1E2MVA0UFloY01rOC9T?=
 =?utf-8?B?UUxHcmxvdEVGQmlyNTJKVnc2NDh4ZVlacTdHT3hQaGpwaDdrR2hRdUJWeUg1?=
 =?utf-8?B?NVhBamIyOGJXYzBNaDd1MitTeWEybzE3MVF1Tm5BbUc3R1gyM2wwYjRJcFJz?=
 =?utf-8?B?V0VuR2F1TnlJTXBOc0RaTEpiOWNxRDY4OER5ellCTnFSZ3g2NmxBeEtMekxG?=
 =?utf-8?B?VlBFSjQyV0hubCt6cjE1Tld0L1kydkhzdW45Rmk2ZHFFL21yWEpRWldMWGdk?=
 =?utf-8?B?TiswelpveW9pWGhSY3FNMTc3UUUzcTlDMHNNbXl0ZWw0ZmhXUHBHZWlVSGlJ?=
 =?utf-8?B?SVMrNHFJMWR4clpYVDA1ZjhsazdiOXM4Z013WXV1NkQ0VzFTQUYxMVdPc1ZP?=
 =?utf-8?B?RGZGZks1ZkZQZytHTi9yRVdZM08vdkQ2RXlYeWQ0TVRIZElJZDZmYlNicUtP?=
 =?utf-8?B?eTRPQ3ZjbmVWZzVzcnAvMjZId2tnMFJmSERuMkFOREJ4dGhwZ1NEZUtManN1?=
 =?utf-8?B?clNUbGRCakNNMkttOWpaT1ZiRjc5TklUWGdVNTV4ZDFqWmRlM29PZ2YrckNI?=
 =?utf-8?B?a3k1SlY2azRlTk13WkxuaDYvZ2hJbWtBWVltcjU5U1dId1lSeEl5eFRaQTlN?=
 =?utf-8?B?QjFPMWZLWldpNUM3YjNTWTBtQTRLb1FRQ0paWjYrcXAraktsYU81Sm9Vb1hT?=
 =?utf-8?B?dS82SXYxNVVHZUhub3V2WWs1V24vZXNFM1JWcHlFdjRDTVZtMmpKNk5MaWkz?=
 =?utf-8?B?M01DWkw1OFdaZUd1L3pERFFDSHdENUlrVnRsaEVmRVdEa04zTlRYS0ZSQzR3?=
 =?utf-8?B?QWdQbzIyUHdvbUNGTFBYZ29kNGpPR21WUHJRZFFQb2Y4SER4YmZEU2ZiMk5w?=
 =?utf-8?B?MXZyTkFIMU1vdWNGOFFKd2M4b1hpdTZGaUVoOXN6Q2NwN082Znp6enpPUGta?=
 =?utf-8?B?VURmMW1nM0dGOExCMU4vd1dneDhSanN6MmJnRXdrSmRlOVpsNncrd25NNVVP?=
 =?utf-8?B?bDZvb0w2Um1EZXVtcEFuNWh6VFRjWFNONTQ3RE1tVW9xM1A5dm9WOUpldjc0?=
 =?utf-8?B?bDJ6bExBSmJhZFoxNmtWRmlVYjVtNlU1azBZbEJPUFcrVTlzOGc1ZWxYb1M3?=
 =?utf-8?B?OXVUY1o2cHhZclRnQ3VlNGttcGlBOHVJUStqZkZmeTZpNkxBTXBLSy9MTzFK?=
 =?utf-8?Q?KSU1vrU5Dy/Lev8rchVME0/9RxOBC+OnLt/nDnIjWQHU?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bVZubTVNT2pPcUl4UjVaTzQzbzVoUnFoTG1vU2xUaFA0d3N2aWhEQWJvbTQw?=
 =?utf-8?B?elZGTGhmeU9VMmZweSs2ckVmSndYd1JkLzRjUzN0bGRNZFp1cmVnRlE4Smho?=
 =?utf-8?B?bTRLcVZUdStWOEdweVlUMlZEaHA0bzVvM1lLK0F1dTRxdkhTYW01bzM4bHVT?=
 =?utf-8?B?TG5DWjBoOUc4V2NWRkRTcGZNTDE4Y05xY0N2WXlicjJKd0dHWEFPMnFYWjYr?=
 =?utf-8?B?eEI2ZWU2TERZMFNmZjNaZGdzTFNzNlJGeXFyOTFSK01JWllNTU1xYmFOMkN2?=
 =?utf-8?B?a0RsN3hhTjNRYW8vVEVHWUFmNkNKQUlWVEI5K1lNZWUrNHVRUmtHUkg3VmNE?=
 =?utf-8?B?MnhPTGNBcUxzQ3l0eWJYSExDcSt4S1E3UnJCTGkvQzNkUGsxUzNVZHpHbUZw?=
 =?utf-8?B?bTZ5OE0xTWIzT2JpYmxNQVBsQjdWdEx2c1F0ei9CR3R1UFNYUWloai9ZKzQy?=
 =?utf-8?B?R3Q5UDhjZCthcGhlTmNWWHkxeVJPZUUvTXpsUGJUcjl0ZC9DT1hvOGpIZUpS?=
 =?utf-8?B?dElHaTF4eEplVTgzN0o2UmR2SEhkSFk5d05NNC9Wdm1OMmxWaUZyV052S3ZF?=
 =?utf-8?B?aXpHNm13dVZURHkvQUQ0Sk5xaFQ3ckRnVWV2bnhwSDR2dFZwMmcwYXVxdkQ3?=
 =?utf-8?B?c1UrOStnaStUcmVlc0lValFzdVVvRmhpQ0Z1MzNLVXNBSTljd3ExNVdzWlJK?=
 =?utf-8?B?dmhJUFJueDltRWpLN3ZlWnloU3o1ZEhxKzE4TTRNVHIvMkMwRjkwdU10TFk1?=
 =?utf-8?B?aTZ4ZzJsempGVlVWUFJTUHdaS2RkS25nOVNXSzB0elJWVXpSR3JycTJLNmRq?=
 =?utf-8?B?SWZRSWhySHMxU0NtR3NJSnlWOEJOS1hGYnVQOWZvTEVOeVk0b3YyUERPTEhR?=
 =?utf-8?B?bkJRVDQ5R1VoY0FiSEk5QVBlY2tvM1AxaGZ6ZDdHY1VBMHJ4aUMxUVhhNHhk?=
 =?utf-8?B?K21heHJXY0xSbmQyY1BtUE9CRmpTTXNMVEVQRTQ1R0I3RWh0ckF5SEM4Qnls?=
 =?utf-8?B?WHp6dDdYV2tnSExVSUpKZWRCbFZDL3JiYkhlR2YxZm5LMGlkWjE1NkYxUEVE?=
 =?utf-8?B?WXg3cmhkeUJZUittQzZUakY5RDBsaW44MGRYS1NMajdDR3RLb3VNU2Jzdnc2?=
 =?utf-8?B?SWNxUG1tOXhEQnhXWHVURGpoUEwzbDBmVkpmc0QyckYvOTQzNUxhays4N2N2?=
 =?utf-8?B?bnJidTlCMTBMMkk1RUJKSHh4K1BvamgrVkZ5M1dUUFlBcXR5d1Q5cGQ0YUh3?=
 =?utf-8?B?dXpUbEc0Z3NjYkJaaXlaR2R1K0pFd0lycGhTQ0NDNThlNDNGMitIMXAvRzMv?=
 =?utf-8?B?emthc012UUpaakdQRTFaM3ZWYmhaa0FodWtXODMycndpa3MvMXZUV3dQODJi?=
 =?utf-8?B?N3hTclc1cWh6c3NocWV4VFNvbWpIMmc0NEtOUTVoTnF3cUYzNmJxZEpKQ2Iz?=
 =?utf-8?B?UzI4NThJa1RCbDRuNlBLUVlQSEtrK0VwYjl6VWhvdGlvNXVDL01odnlOS2Zm?=
 =?utf-8?B?YjZjSFpSYmE3WWFWeEszUUE2ZTYxd0UyM3BsUkt4TXFORjRndzZGTmo4MW9N?=
 =?utf-8?B?MWdzRVc2VFNQeHBETzhhUW1jbFowR1dEMUZUalpLVjlxTWJ3dzUyV3E4enRN?=
 =?utf-8?B?RzZycWcrdjZ1bGVtcHppbDV3NWhzdU9LZWtEeS9BWTdMR3dxQWx4akIxVk5Z?=
 =?utf-8?B?byt4MDMzcnNqSlB1Z1R0ZnRJUU1KSVFsRCt5dlB2NnBaZW92S093VzFhZkNw?=
 =?utf-8?B?WTR5THo1M2xYVWN1alFVbUVhUklPTHZtMWhWRFVYZ1B3clpxaFhCNzRkbDVU?=
 =?utf-8?B?K1NsdDZoMysvQTlLTWhnZHZXTXQ3SWtMaUl0Z3RERDJLZ1ZDdTVYNStSU3ZZ?=
 =?utf-8?B?OE1GL1VpYmVoMnMwMmFzSTMwL3laY3U5TUdYR3F6RG1obzU3amgxU21BeEll?=
 =?utf-8?B?S3ArdkdwRFBuYmJsTnhRM3VDbEZoRzRQbWYrS01icVdIWS9OaTVzWEpTOWhG?=
 =?utf-8?B?SnBHSm1IaFNSM3lzWUVHMFkvSjVqeGJFd01SMERabnZJN0lvTEN2Nks0b293?=
 =?utf-8?B?NnZUeS9HdFltOUdyQTJGTlNUUkw0QmV2STZGL29tMnlWWG5lb3ZmUm5DTEdM?=
 =?utf-8?B?R0E2ZlhiSEh1ODJOZHJqMTQxcjVBSDdDY0ZkY3NHcmM4ZkRKd1pzNURiV1Vi?=
 =?utf-8?B?akxYUkQ1cit4RGdTdkx3TkFPRDkxVDNPODF6dFhWOG5VWmJjVytxNGxkZWUy?=
 =?utf-8?B?NitPNmRMdjdocGhyaVlrU01RNUlrbWJLR3RTQnlWV0JBSCtyaHBsSWNUMWRq?=
 =?utf-8?B?WEpJUG9XRGl5UzhEOUpyRlJ3dytBQnBwdGI3WUJ0R0dpMjhoZXlyQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844b9a3d-4e18-46f8-5739-08de6377a1bc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 22:57:40.2452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aL4jAc/3yq2poCMv7I7yoUYNKgCn26Y6aLUFCCbOM9xe5I/IO4yt0+p4xehmyAnYy8mTk628ikfNe7+81GN/pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10577

On Tue, Feb 03, 2026 at 12:31:42PM -0800, Tim Harvey wrote:
> On Tue, Feb 3, 2026 at 11:36 AM Frank Li <Frank.li@nxp.com> wrote:
> > <snip>
> > > > > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > > > > index 700bab4d3e60..83fc7faf81d8 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > > > @@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7901.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7902.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7903.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7904.dtb
> > > > > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-venice-gw7906.dtb
> > > >
> > > > Please run https://github.com/lznuaa/dt-format for new dts to keep nice
> > > > node order,
> > > >
> > > > If output result is not good enough, let know
> > >
> > > I notice you asking people to do this but is that tool robust? Every
> > > dts I through at it crashes:
> > >
> > > $ git clone https://github.com/lznuaa/dt-format.git
> > > $ cd dt-format
> > > $ make
> > > $ ./dt-format ~/linux-6.18/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> > > Segmentation fault (core dumped)
> >
> > which version imx8mm-evk.dts? It works at my side.
> >
>
> Every version I've tried crashes. It crashes for me on v6.18 of
> arch/arm64/boot/dts/freescale/imx8mm-evk.dts. See
> https://github.com/lznuaa/dt-format/issues/4 - reverting the latest
> patch resolves the issue.

Thanks, let me debug it.

>
> Is using dt-format really a requirement?

I want to avoid re-order nodes in futures. The properties order is not
so important, but nodes order is important to avoid add duplicate nodes.

git log show some commits, which remove duplicated nodes. Without tools
help, I have to manual check it.

> If this is a requirement it
> should probably be picked up and integrated into the dtc somehow or at
> least properly maintained? There are issues reported that appear very
> valid to me that have not been addressed in 7 months time among them
> being the fact it crashes on most dts and some of the ordering rules
> that have not been the norm:
> https://github.com/lznuaa/dt-format/issues

Sorry, I missed it. I will monitor this project closely.

>
> I welcome a tool that helps streamline the dts process but this tool
> appears to need some work.

Yes, let me fix this issue firstly.

Frank

>
> Best Regards,
>
> Tim
>
> > Frank
> >
> > >
> > > Best Regards,
> > >
> > > Tim
> > >
> > > >
> > > > Frank
> > > >
> > > > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dahlia.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-dev.dtb
> > > > >  dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-nonwifi-ivy.dtb
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > > > > new file mode 100644
> > > > > index 000000000000..ec146a2b7549
> > > > > --- /dev/null
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7906.dts
> > > > > @@ -0,0 +1,869 @@
> > > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > +/*
> > > > > + * Copyright 2026 Gateworks Corporation
> > > > > + */
> > > > > +
> > > > > +/dts-v1/;
> > > > > +
> > > > > +#include <dt-bindings/gpio/gpio.h>
> > > > > +#include <dt-bindings/input/linux-event-codes.h>
> > > > > +#include <dt-bindings/leds/common.h>
> > > > > +#include <dt-bindings/net/ti-dp83867.h>
> > > > > +#include <dt-bindings/phy/phy-imx8-pcie.h>
> > > > > +
> > > > > +#include "imx8mm.dtsi"
> > > > > +
> > > > > +/ {
> > > > > +     model = "Gateworks Venice GW7906 i.MX8MM board";
> > > > > +     compatible = "gateworks,imx8mm-gw7906", "fsl,imx8mm";
> > > > > +
> > > > > +     aliases {
> > > > > +             ethernet0 = &fec1;
> > > > > +             rtc0 = &gsc_rtc;
> > > > > +             rtc1 = &snvs_rtc;
> > > > > +             usb0 = &usbotg1;
> > > > > +     };
> > > > > +
> > > > > +     chosen {
> > > > > +             stdout-path = &uart2;
> > > > > +     };
> > > > > +
> > > > > +     memory@40000000 {
> > > > > +             device_type = "memory";
> > > > > +             reg = <0x0 0x40000000 0 0x80000000>;
> > > > > +     };
> > > > > +
> > > > > +     gpio-keys {
> > > > > +             compatible = "gpio-keys";
> > > > > +
> > > > > +             key-user-pb {
> > > > > +                     label = "user_pb";
> > > > > +                     gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
> > > > > +                     linux,code = <BTN_0>;
> > > > > +             };
> > > > > +
> > > > > +             key-user-pb1x {
> > > > > +                     label = "user_pb1x";
> > > > > +                     linux,code = <BTN_1>;
> > > > > +                     interrupt-parent = <&gsc>;
> > > > > +                     interrupts = <0>;
> > > > > +             };
> > > > > +
> > > > > +             key-erased {
> > > > > +                     label = "key_erased";
> > > > > +                     linux,code = <BTN_2>;
> > > > > +                     interrupt-parent = <&gsc>;
> > > > > +                     interrupts = <1>;
> > > > > +             };
> > > > > +
> > > > > +             key-eeprom-wp {
> > > > > +                     label = "eeprom_wp";
> > > > > +                     linux,code = <BTN_3>;
> > > > > +                     interrupt-parent = <&gsc>;
> > > > > +                     interrupts = <2>;
> > > > > +             };
> > > > > +
> > > > > +             switch-hold {
> > > > > +                     label = "switch_hold";
> > > > > +                     linux,code = <BTN_5>;
> > > > > +                     interrupt-parent = <&gsc>;
> > > > > +                     interrupts = <7>;
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > > +     led-controller {
> > > > > +             compatible = "gpio-leds";
> > > > > +             pinctrl-names = "default";
> > > > > +             pinctrl-0 = <&pinctrl_gpio_leds>;
> > > > > +
> > > > > +             led-0 {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_RED>;
> > > > > +                     label = "led01_red";
> > > > > +                     gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-1 {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_GREEN>;
> > > > > +                     label = "led01_grn";
> > > > > +                     gpios = <&gpio4 30 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-2 {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_RED>;
> > > > > +                     label = "led02_red";
> > > > > +                     gpios = <&gpio5 2 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-3 {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_GREEN>;
> > > > > +                     label = "led02_grn";
> > > > > +                     gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-4 {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_RED>;
> > > > > +                     label = "led03_red";
> > > > > +                     gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-5 {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_GREEN>;
> > > > > +                     label = "led03_grn";
> > > > > +                     gpios = <&gpio5 3 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-6 {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_RED>;
> > > > > +                     label = "led04_red";
> > > > > +                     gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-7 {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_GREEN>;
> > > > > +                     label = "led04_grn";
> > > > > +                     gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-8 {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_RED>;
> > > > > +                     label = "led05_red";
> > > > > +                     gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-9 {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_GREEN>;
> > > > > +                     label = "led05_grn";
> > > > > +                     gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-a {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_RED>;
> > > > > +                     label = "led06_red";
> > > > > +                     gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +
> > > > > +             led-b {
> > > > > +                     function = LED_FUNCTION_STATUS;
> > > > > +                     color = <LED_COLOR_ID_GREEN>;
> > > > > +                     label = "led06_grn";
> > > > > +                     gpios = <&gpio1 8 GPIO_ACTIVE_HIGH>;
> > > > > +                     default-state = "off";
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > > +     pcie0_refclk: pcie0-refclk {
> > > > > +             compatible = "fixed-clock";
> > > > > +             #clock-cells = <0>;
> > > > > +             clock-frequency = <100000000>;
> > > > > +     };
> > > > > +
> > > > > +     reg_3p3v: regulator-3p3v {
> > > > > +             compatible = "regulator-fixed";
> > > > > +             regulator-name = "3P3V";
> > > > > +             regulator-min-microvolt = <3300000>;
> > > > > +             regulator-max-microvolt = <3300000>;
> > > > > +             regulator-always-on;
> > > > > +     };
> > > > > +};
> > > > > +
> > > > > +&A53_0 {
> > > > > +     cpu-supply = <&buck2>;
> > > > > +};
> > > > > +
> > > > > +&A53_1 {
> > > > > +     cpu-supply = <&buck2>;
> > > > > +};
> > > > > +
> > > > > +&A53_2 {
> > > > > +     cpu-supply = <&buck2>;
> > > > > +};
> > > > > +
> > > > > +&A53_3 {
> > > > > +     cpu-supply = <&buck2>;
> > > > > +};
> > > > > +
> > > > > +&ddrc {
> > > > > +     operating-points-v2 = <&ddrc_opp_table>;
> > > > > +
> > > > > +     ddrc_opp_table: opp-table {
> > > > > +             compatible = "operating-points-v2";
> > > > > +
> > > > > +             opp-25000000 {
> > > > > +                     opp-hz = /bits/ 64 <25000000>;
> > > > > +             };
> > > > > +
> > > > > +             opp-100000000 {
> > > > > +                     opp-hz = /bits/ 64 <100000000>;
> > > > > +             };
> > > > > +
> > > > > +             opp-750000000 {
> > > > > +                     opp-hz = /bits/ 64 <750000000>;
> > > > > +             };
> > > > > +     };
> > > > > +};
> > > > > +
> > > > > +&fec1 {
> > > > > +     pinctrl-names = "default";
> > > > > +     pinctrl-0 = <&pinctrl_fec1>;
> > > > > +     phy-mode = "rgmii-id";
> > > > > +     phy-handle = <&ethphy0>;
> > > > > +     local-mac-address = [00 00 00 00 00 00];
> > > > > +     status = "okay";
> > > > > +
> > > > > +     mdio {
> > > > > +             #address-cells = <1>;
> > > > > +             #size-cells = <0>;
> > > > > +
> > > > > +             ethphy0: ethernet-phy@0 {
> > > > > +                     compatible = "ethernet-phy-ieee802.3-c22";
> > > > > +                     reg = <0>;
> > > > > +                     ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> > > > > +                     ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > > > > +                     ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > > > > +                     tx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > > > > +                     rx-fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > > > > +
> > > > > +                     leds {
> > > > > +                             #address-cells = <1>;
> > > > > +                             #size-cells = <0>;
> > > > > +
> > > > > +                             led@1 {
> > > > > +                                     reg = <1>;
> > > > > +                                     color = <LED_COLOR_ID_AMBER>;
> > > > > +                                     function = LED_FUNCTION_LAN;
> > > > > +                                     default-state = "keep";
> > > > > +                             };
> > > > > +
> > > > > +                             led@2 {
> > > > > +                                     reg = <2>;
> > > > > +                                     color = <LED_COLOR_ID_GREEN>;
> > > > > +                                     function = LED_FUNCTION_LAN;
> > > > > +                                     default-state = "keep";
> > > > > +                             };
> > > > > +                     };
> > > > > +             };
> > > > > +     };
> > > > > +};
> > > > > +
> > > > > +&gpio1 {
> > > > > +     gpio-line-names = "", "", "", "", "", "", "", "",
> > > > > +             "", "", "rs422_en#", "rs485_en#", "rs232_en#", "", "", "",
> > > > > +             "", "", "", "", "", "", "", "",
> > > > > +             "", "", "", "", "", "", "", "";
> > > > > +};
> > > > > +
> > > > > +&gpio2 {
> > > > > +     gpio-line-names = "", "", "", "", "", "", "dig1_ctl", "",
> > > > > +             "dig1_out#", "dig1_in", "", "", "", "", "", "",
> > > > > +             "", "", "", "", "", "", "", "",
> > > > > +             "", "", "", "", "", "", "", "";
> > > > > +};
> > > > > +
> > > > > +&gpio5 {
> > > > > +     gpio-line-names = "", "", "", "", "", "", "", "",
> > > > > +             "", "", "", "", "pci_wdis#", "", "", "",
> > > > > +             "", "", "", "", "", "", "", "",
> > > > > +             "", "", "", "", "", "", "", "";
> > > > > +};
> > > > > +
> > > > > +&i2c1 {
> > > > > +     clock-frequency = <100000>;
> > > > > +     pinctrl-names = "default", "gpio";
> > > > > +     pinctrl-0 = <&pinctrl_i2c1>;
> > > > > +     pinctrl-1 = <&pinctrl_i2c1_gpio>;
> > > > > +     scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > > > +     sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > > > +     status = "okay";
> > > > > +
> > > > > +     gsc: gsc@20 {
> > > > > +             compatible = "gw,gsc";
> > > > > +             reg = <0x20>;
> > > > > +             pinctrl-0 = <&pinctrl_gsc>;
> > > > > +             interrupt-parent = <&gpio4>;
> > > > > +             interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> > > > > +             interrupt-controller;
> > > > > +             #interrupt-cells = <1>;
> > > > > +             #address-cells = <1>;
> > > > > +             #size-cells = <0>;
> > > > > +
> > > > > +             adc {
> > > > > +                     compatible = "gw,gsc-adc";
> > > > > +                     #address-cells = <1>;
> > > > > +                     #size-cells = <0>;
> > > > > +
> > > > > +                     channel@6 {
> > > > > +                             gw,mode = <0>;
> > > > > +                             reg = <0x06>;
> > > > > +                             label = "temp";
> > > > > +                     };
> > > > > +
> > > > > +                     channel@8 {
> > > > > +                             gw,mode = <3>;
> > > > > +                             reg = <0x08>;
> > > > > +                             label = "vdd_bat";
> > > > > +                     };
> > > > > +
> > > > > +                     channel@82 {
> > > > > +                             gw,mode = <2>;
> > > > > +                             reg = <0x82>;
> > > > > +                             label = "vin";
> > > > > +                             gw,voltage-divider-ohms = <22100 1000>;
> > > > > +                             gw,voltage-offset-microvolt = <700000>;
> > > > > +                     };
> > > > > +
> > > > > +                     channel@84 {
> > > > > +                             gw,mode = <2>;
> > > > > +                             reg = <0x84>;
> > > > > +                             label = "vdd_5p0";
> > > > > +                             gw,voltage-divider-ohms = <10000 10000>;
> > > > > +                     };
> > > > > +
> > > > > +                     channel@86 {
> > > > > +                             gw,mode = <2>;
> > > > > +                             reg = <0x86>;
> > > > > +                             label = "vdd_3p3";
> > > > > +                             gw,voltage-divider-ohms = <10000 10000>;
> > > > > +                     };
> > > > > +
> > > > > +                     channel@88 {
> > > > > +                             gw,mode = <2>;
> > > > > +                             reg = <0x88>;
> > > > > +                             label = "vdd_0p9";
> > > > > +                     };
> > > > > +
> > > > > +                     channel@8c {
> > > > > +                             gw,mode = <2>;
> > > > > +                             reg = <0x8c>;
> > > > > +                             label = "vdd_soc";
> > > > > +                     };
> > > > > +
> > > > > +                     channel@8e {
> > > > > +                             gw,mode = <2>;
> > > > > +                             reg = <0x8e>;
> > > > > +                             label = "vdd_arm";
> > > > > +                     };
> > > > > +
> > > > > +                     channel@90 {
> > > > > +                             gw,mode = <2>;
> > > > > +                             reg = <0x90>;
> > > > > +                             label = "vdd_1p8";
> > > > > +                     };
> > > > > +
> > > > > +                     channel@92 {
> > > > > +                             gw,mode = <2>;
> > > > > +                             reg = <0x92>;
> > > > > +                             label = "vdd_dram";
> > > > > +                     };
> > > > > +
> > > > > +                     channel@a2 {
> > > > > +                             gw,mode = <2>;
> > > > > +                             reg = <0xa2>;
> > > > > +                             label = "vdd_gsc";
> > > > > +                             gw,voltage-divider-ohms = <10000 10000>;
> > > > > +                     };
> > > > > +             };
> > > > > +     };
> > > > > +
> > > > > +     gpio: gpio@23 {
> > > > > +             compatible = "nxp,pca9555";
> > > > > +             reg = <0x23>;
> > > > > +             gpio-controller;
> > > > > +             #gpio-cells = <2>;
> > > > > +             interrupt-parent = <&gsc>;
> > > > > +             interrupts = <4>;
> > > > > +     };
> > > > > +
> > > > > +     eeprom@50 {
> > > > > +             compatible = "atmel,24c02";
> > > > > +             reg = <0x50>;
> > > > > +             pagesize = <16>;
> > > > > +     };
> > > > > +
> > > > > +     eeprom@51 {
> > > > > +             compatible = "atmel,24c02";
> > > > > +             reg = <0x51>;
> > > > > +             pagesize = <16>;
> > > > > +     };
> > > > > +
> > > > > +     eeprom@52 {
> > > > > +             compatible = "atmel,24c02";
> > > > > +             reg = <0x52>;
> > > > > +             pagesize = <16>;
> > > > > +     };
> > > > > +
> > > > > +     eeprom@53 {
> > > > > +             compatible = "atmel,24c02";
> > > > > +             reg = <0x53>;
> > > > > +             pagesize = <16>;
> > > > > +     };
> > > > > +
> > > > > +     gsc_rtc: rtc@68 {
> > > > > +             compatible = "dallas,ds1672";
> > > > > +             reg = <0x68>;
> > > > > +     };
> > > > > +};
> > > > > +
> > > > > +&i2c2 {
> > > > > +     clock-frequency = <400000>;
> > > > > +     pinctrl-names = "default", "gpio";
> > > > > +     pinctrl-0 = <&pinctrl_i2c2>;
> > > > > +     pinctrl-1 = <&pinctrl_i2c2_gpio>;
> > > > > +     scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > > > +     sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > > > +     status = "okay";
> > > > > +
> > > > > +     pmic@4b {
> > > > > +             compatible = "rohm,bd71847";
> > > > > +             reg = <0x4b>;
> > > > > +             pinctrl-names = "default";
> > > > > +             pinctrl-0 = <&pinctrl_pmic>;
> > > > > +             interrupt-parent = <&gpio3>;
> > > > > +             interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> > > > > +             rohm,reset-snvs-powered;
> > > > > +             #clock-cells = <0>;
> > > > > +             clocks = <&osc_32k>;
> > > > > +             clock-output-names = "clk-32k-out";
> > > > > +
> > > > > +             regulators {
> > > > > +                     /* vdd_soc: 0.805-0.900V (typ=0.8V) */
> > > > > +                     BUCK1 {
> > > > > +                             regulator-name = "buck1";
> > > > > +                             regulator-min-microvolt = <700000>;
> > > > > +                             regulator-max-microvolt = <1300000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                             regulator-ramp-delay = <1250>;
> > > > > +                     };
> > > > > +
> > > > > +                     /* vdd_arm: 0.805-1.0V (typ=0.9V) */
> > > > > +                     buck2: BUCK2 {
> > > > > +                             regulator-name = "buck2";
> > > > > +                             regulator-min-microvolt = <700000>;
> > > > > +                             regulator-max-microvolt = <1300000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                             regulator-ramp-delay = <1250>;
> > > > > +                             rohm,dvs-run-voltage = <1000000>;
> > > > > +                             rohm,dvs-idle-voltage = <900000>;
> > > > > +                     };
> > > > > +
> > > > > +                     /* vdd_0p9: 0.805-1.0V (typ=0.9V) */
> > > > > +                     BUCK3 {
> > > > > +                             regulator-name = "buck3";
> > > > > +                             regulator-min-microvolt = <700000>;
> > > > > +                             regulator-max-microvolt = <1350000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                     };
> > > > > +
> > > > > +                     /* vdd_3p3 */
> > > > > +                     BUCK4 {
> > > > > +                             regulator-name = "buck4";
> > > > > +                             regulator-min-microvolt = <3000000>;
> > > > > +                             regulator-max-microvolt = <3300000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                     };
> > > > > +
> > > > > +                     /* vdd_1p8 */
> > > > > +                     BUCK5 {
> > > > > +                             regulator-name = "buck5";
> > > > > +                             regulator-min-microvolt = <1605000>;
> > > > > +                             regulator-max-microvolt = <1995000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                     };
> > > > > +
> > > > > +                     /* vdd_dram */
> > > > > +                     BUCK6 {
> > > > > +                             regulator-name = "buck6";
> > > > > +                             regulator-min-microvolt = <800000>;
> > > > > +                             regulator-max-microvolt = <1400000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                     };
> > > > > +
> > > > > +                     /* nvcc_snvs_1p8 */
> > > > > +                     LDO1 {
> > > > > +                             regulator-name = "ldo1";
> > > > > +                             regulator-min-microvolt = <1600000>;
> > > > > +                             regulator-max-microvolt = <1900000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                     };
> > > > > +
> > > > > +                     /* vdd_snvs_0p8 */
> > > > > +                     LDO2 {
> > > > > +                             regulator-name = "ldo2";
> > > > > +                             regulator-min-microvolt = <800000>;
> > > > > +                             regulator-max-microvolt = <900000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                     };
> > > > > +
> > > > > +                     /* vdda_1p8 */
> > > > > +                     LDO3 {
> > > > > +                             regulator-name = "ldo3";
> > > > > +                             regulator-min-microvolt = <1800000>;
> > > > > +                             regulator-max-microvolt = <3300000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                     };
> > > > > +
> > > > > +                     LDO4 {
> > > > > +                             regulator-name = "ldo4";
> > > > > +                             regulator-min-microvolt = <900000>;
> > > > > +                             regulator-max-microvolt = <1800000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                     };
> > > > > +
> > > > > +                     LDO6 {
> > > > > +                             regulator-name = "ldo6";
> > > > > +                             regulator-min-microvolt = <900000>;
> > > > > +                             regulator-max-microvolt = <1800000>;
> > > > > +                             regulator-boot-on;
> > > > > +                             regulator-always-on;
> > > > > +                     };
> > > > > +             };
> > > > > +     };
> > > > > +};
> > > > > +
> > > > > +&i2c3 {
> > > > > +     clock-frequency = <400000>;
> > > > > +     pinctrl-names = "default", "gpio";
> > > > > +     pinctrl-0 = <&pinctrl_i2c3>;
> > > > > +     pinctrl-1 = <&pinctrl_i2c3_gpio>;
> > > > > +     scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > > > +     sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > > > +     status = "okay";
> > > > > +
> > > > > +     accelerometer@19 {
> > > > > +             pinctrl-names = "default";
> > > > > +             pinctrl-0 = <&pinctrl_accel>;
> > > > > +             compatible = "st,lis2de12";
> > > > > +             reg = <0x19>;
> > > > > +             st,drdy-int-pin = <1>;
> > > > > +             interrupt-parent = <&gpio1>;
> > > > > +             interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
> > > > > +     };
> > > > > +};
> > > > > +
> > > > > +&pcie_phy {
> > > > > +     fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
> > > > > +     fsl,clkreq-unsupported;
> > > > > +     clocks = <&pcie0_refclk>;
> > > > > +     clock-names = "ref";
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +&pcie0 {
> > > > > +     pinctrl-names = "default";
> > > > > +     pinctrl-0 = <&pinctrl_pcie0>;
> > > > > +     reset-gpio = <&gpio5 11 GPIO_ACTIVE_LOW>;
> > > > > +     clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
> > > > > +              <&clk IMX8MM_CLK_PCIE1_AUX>;
> > > > > +     assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
> > > > > +                       <&clk IMX8MM_CLK_PCIE1_CTRL>;
> > > > > +     assigned-clock-rates = <10000000>, <250000000>;
> > > > > +     assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
> > > > > +                              <&clk IMX8MM_SYS_PLL2_250M>;
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +&disp_blk_ctrl {
> > > > > +     status = "disabled";
> > > > > +};
> > > > > +
> > > > > +&pgc_mipi {
> > > > > +     status = "disabled";
> > > > > +};
> > > > > +
> > > > > +/* console */
> > > > > +&uart2 {
> > > > > +     pinctrl-names = "default";
> > > > > +     pinctrl-0 = <&pinctrl_uart2>;
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +&usbotg1 {
> > > > > +     dr_mode = "host";
> > > > > +     disable-over-current;
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +/* microSD */
> > > > > +&usdhc2 {
> > > > > +     pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > > > > +     pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> > > > > +     pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> > > > > +     pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> > > > > +     cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> > > > > +     bus-width = <4>;
> > > > > +     vmmc-supply = <&reg_3p3v>;
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +/* eMMC */
> > > > > +&usdhc3 {
> > > > > +     pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > > > > +     pinctrl-0 = <&pinctrl_usdhc3>;
> > > > > +     pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> > > > > +     pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> > > > > +     assigned-clocks = <&clk IMX8MM_CLK_USDHC3>;
> > > > > +     assigned-clock-rates = <400000000>;
> > > > > +     bus-width = <8>;
> > > > > +     non-removable;
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +&wdog1 {
> > > > > +     pinctrl-names = "default";
> > > > > +     pinctrl-0 = <&pinctrl_wdog>;
> > > > > +     fsl,ext-reset-output;
> > > > > +     status = "okay";
> > > > > +};
> > > > > +
> > > > > +&iomuxc {
> > > > > +     pinctrl-names = "default";
> > > > > +     pinctrl-0 = <&pinctrl_hog>;
> > > > > +
> > > > > +     pinctrl_hog: hoggrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10      0x40000041 /* RS422# */
> > > > > +                     MX8MM_IOMUXC_GPIO1_IO11_GPIO1_IO11      0x40000041 /* RS485# */
> > > > > +                     MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12      0x40000041 /* RS232# */
> > > > > +                     MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9        0x40000041 /* DIG1_IN */
> > > > > +                     MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8        0x40000041 /* DIG1_OUT */
> > > > > +                     MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6        0x40000041 /* DIG1_CTL */
> > > > > +                     MX8MM_IOMUXC_ECSPI2_MISO_GPIO5_IO12     0x40000041 /* PCI_WDIS# */
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_accel: accelgrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15      0x159
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_fec1: fec1grp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_ENET_MDC_ENET1_MDC                 0x3
> > > > > +                     MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO               0x3
> > > > > +                     MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3           0x1f
> > > > > +                     MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2           0x1f
> > > > > +                     MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1           0x1f
> > > > > +                     MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0           0x1f
> > > > > +                     MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3           0x91
> > > > > +                     MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2           0x91
> > > > > +                     MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1           0x91
> > > > > +                     MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0           0x91
> > > > > +                     MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC           0x0
> > > > > +                     MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC           0x91
> > > > > +                     MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL     0x91
> > > > > +                     MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL     0x1f
> > > > > +                     MX8MM_IOMUXC_SAI2_TXFS_GPIO4_IO24               0x19 /* IRQ# */
> > > > > +                     MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25                0x19 /* RST# */
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_gsc: gscgrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26       0x159
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_i2c1: i2c1grp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL          0x400001c3
> > > > > +                     MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA          0x400001c3
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_i2c1_gpio: i2c1gpiogrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_I2C1_SCL_GPIO5_IO14        0x400001c3
> > > > > +                     MX8MM_IOMUXC_I2C1_SDA_GPIO5_IO15        0x400001c3
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_i2c2: i2c2grp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL          0x400001c3
> > > > > +                     MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA          0x400001c3
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_i2c2_gpio: i2c2gpiogrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_I2C2_SCL_GPIO5_IO16        0x400001c3
> > > > > +                     MX8MM_IOMUXC_I2C2_SDA_GPIO5_IO17        0x400001c3
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_i2c3: i2c3grp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL          0x400001c3
> > > > > +                     MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA          0x400001c3
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_i2c3_gpio: i2c3gpiogrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_I2C3_SCL_GPIO5_IO18        0x400001c3
> > > > > +                     MX8MM_IOMUXC_I2C3_SDA_GPIO5_IO19        0x400001c3
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_gpio_leds: gpioledgrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5    0x19
> > > > > +                     MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30        0x19
> > > > > +                     MX8MM_IOMUXC_SAI3_MCLK_GPIO5_IO2        0x19
> > > > > +                     MX8MM_IOMUXC_GPIO1_IO14_GPIO1_IO14      0x19
> > > > > +                     MX8MM_IOMUXC_GPIO1_IO09_GPIO1_IO9       0x19
> > > > > +                     MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3         0x19
> > > > > +                     MX8MM_IOMUXC_SAI3_RXC_GPIO4_IO29        0x19
> > > > > +                     MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x19
> > > > > +                     MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13      0x19
> > > > > +                     MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31       0x19
> > > > > +                     MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4         0x19
> > > > > +                     MX8MM_IOMUXC_GPIO1_IO08_GPIO1_IO8       0x19
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_pcie0: pciegrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_ECSPI2_MOSI_GPIO5_IO11     0x41
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_pmic: pmicgrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_NAND_DATA02_GPIO3_IO8      0x41
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_uart2: uart2grp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX     0x140
> > > > > +                     MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX     0x140
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_usdhc2: usdhc2grp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x190
> > > > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d0
> > > > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d0
> > > > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d0
> > > > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d0
> > > > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d0
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x194
> > > > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d4
> > > > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d4
> > > > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d4
> > > > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d4
> > > > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d4
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK         0x196
> > > > > +                     MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD         0x1d6
> > > > > +                     MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0     0x1d6
> > > > > +                     MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1     0x1d6
> > > > > +                     MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2     0x1d6
> > > > > +                     MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3     0x1d6
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12        0x1c4
> > > > > +                     MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT  0x1d0
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_usdhc3: usdhc3grp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x190
> > > > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d0
> > > > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d0
> > > > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d0
> > > > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d0
> > > > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d0
> > > > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d0
> > > > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d0
> > > > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d0
> > > > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d0
> > > > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x190
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x194
> > > > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d4
> > > > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d4
> > > > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d4
> > > > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d4
> > > > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d4
> > > > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d4
> > > > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d4
> > > > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d4
> > > > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d4
> > > > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x194
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK       0x196
> > > > > +                     MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD       0x1d6
> > > > > +                     MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0   0x1d6
> > > > > +                     MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1   0x1d6
> > > > > +                     MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2   0x1d6
> > > > > +                     MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3   0x1d6
> > > > > +                     MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4     0x1d6
> > > > > +                     MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5    0x1d6
> > > > > +                     MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6    0x1d6
> > > > > +                     MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7      0x1d6
> > > > > +                     MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE   0x196
> > > > > +             >;
> > > > > +     };
> > > > > +
> > > > > +     pinctrl_wdog: wdoggrp {
> > > > > +             fsl,pins = <
> > > > > +                     MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B    0xc6
> > > > > +             >;
> > > > > +     };
> > > > > +};
> > > > > --
> > > > > 2.25.1
> > > > >
