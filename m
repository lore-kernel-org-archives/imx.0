Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2052.outbound.protection.outlook.com [40.107.241.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C6C1A01D4
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 09:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364674; cv=fail; b=ZxT4w5sg5OWTw144ADdLtCHrk71kArCNWetGa2isMroBp77lfebKcZYdIi1ByboTKfaVWUuMLA2MoMwdy8bshUDcKpoMpZ+fNkQb2wfHOu7ITVa5sh05Ao0JT64VLpiSwYdMLYl7yatbiQwmUFeFGjHFKH67kSc6H7JNOey2Azg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364674; c=relaxed/simple;
	bh=TToyUTvlFMXMcXJ08kM4MzhgoSLLgbLTEuh8GH8RUQk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m6D/iB1DWET6hsHtzCRmcXDkS2dtV5dAypUi9b6uRIx5SYkR8ir4bd20pXM1gOw5McOuaAq3dsgDpU7dC5YGBGPGcdYKzHR8tW3ga3ZEglx7BrUYpm2CPpA+2UTEi7Us1ev02h0OFrP5zBvYE2MV9AMcTZrhgs65i39U3p+FunE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ntzzvxXx; arc=fail smtp.client-ip=40.107.241.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ntzzvxXx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsFg/gb2fVVHi2v2yeV0dgmCo3AzrzW9eo575N3Bd2zt+YhYmv+niDEOPnRIwAQGiMPdOKoGF7lmd5JEvjUqJIa9Q15CgN1Vj5alJPc5C4jcHD0BbOZX4QDbkdI4G57qCzws5g0QPGRR6ELHcqvW6ZqGbsPIbo2m1zW78tdEwQMuUG6t0d4tu7rQ48z49ax1+OB1OGBg7VRGmtmA+/WfR8TexMI+XmhdFCrXkUdwN4f7z/eXFMRfv9KIiUKfd6bzd+ypwXtdKWrThob1UQaw2mSaWVSNT1+/tOWpTHIR+2TNUblOyTVkXyfSRiiLe/itY0SYDQMZj3JAK1WyqbDGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGmBt3Frn+pUNmNGZ7W5wA2AvQ3IPTlOTHO2CRkTQYg=;
 b=uFf1IZr+eIE9GRb9S0UPXONQr6acjlZ0QBGZZgf/ZFWpEVjKOQu6fWgk5fCthjNucs6vkSF/LNqFFApt12B6Y7KEsCNSsXeQSW3Ir/FMqlO6ntoC5tY4A5AFQuw8UgDiPl2HOcsK6UDJtuFTrKK46Z97gCSOfsPTAkZXh0NXDsFDmgE4TebtFO7lMpdMqh8etVriT+1DWlAPL70SfeiT/HB8hXoCLGA2h4nGarJmkm4Yc3jsutU2tOehEnAtQ8NVM+KCqV3IGOQcEKU+ihg1RrJnaBuxmq2bRNEi1CkCtACkaXa2oYKJgoyBT/aWKM4pTv8cH3DsrZLNTfKQ3h28pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGmBt3Frn+pUNmNGZ7W5wA2AvQ3IPTlOTHO2CRkTQYg=;
 b=ntzzvxXxGVtgVOi6AnBPt3bMjTa0vCmYOmD+monma440YuBiQea6Y5Obl61UwpaD4qcmdWa3LEJJqkCtLzgRmrTTzx1KfzRHZI+xAiu9ya7lSzGgXOoaM+o8OBvwCl6K4Bp0VegCgYRCPRovjxyR8kVesFptqXqKH0hxPjJS7doBYiLsch4A2Uonrf+hH4/Jbc9vHPUwl5a3GuQdTXJuTrFIbeJQfARO5BXCxv1uqvRzDeQmC8I9Iu00bneJmDSM06RoFeh5O53nr7nyjKxmY7qiRCq09/P98bMqg0NWmbWdzMf9CHJjkDkRE6lYkVPpl2e2rQkkuSBeA07Q9fll8w==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VE1PR04MB7360.eurprd04.prod.outlook.com (2603:10a6:800:1a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 09:17:49 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:17:49 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v11 5/7] se_ctrl.c
Thread-Topic: [PATCH v11 5/7] se_ctrl.c
Thread-Index: AQHbaxvyzKLEjq9tQUq7izzHhJW4o7MfYhxg
Date: Mon, 20 Jan 2025 09:17:48 +0000
Message-ID:
 <AM9PR04MB8604BE6BEB735B44744537BC95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250120-imx-se-if-v11-0-4d7d8f7f4b56@nxp.com>
 <20250120-imx-se-if-v11-5-4d7d8f7f4b56@nxp.com>
In-Reply-To: <20250120-imx-se-if-v11-5-4d7d8f7f4b56@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|VE1PR04MB7360:EE_
x-ms-office365-filtering-correlation-id: 64e601b2-c835-48cf-e2f3-08dd39334f1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aWpNT0tmKytXbnRPbms5dUdsbGxOSXQzVzJTQm1zOThzdlpjNWlxNlhBb2Zo?=
 =?utf-8?B?QXovbURReVpxTEQ4bWtDbU42MFNJbFJJOFhLZ0FxOG9iY0FtNmF4Q3BWTitk?=
 =?utf-8?B?RjFYQnphNEU1c04rbkFTcnliS2hvand4WWZqMUwrVVNzM3dPTTFsRThHRkxo?=
 =?utf-8?B?TWV5cEFvVlVWYUxraHVXSDMvWE1peCtCRHA4UGRsK2hncDByWS9YaE50a0Vr?=
 =?utf-8?B?MnQ4c0NidlNTN1RFTlRNRWlnWHJQd0MzSC9jdW1mSG0vRHFCM1pUd1JrZ2dy?=
 =?utf-8?B?SkNTSGZmeFlFc2ZueElDNXFPRjM5UHFXV3YreGNEUW9URGlJVThaVWRaWXYz?=
 =?utf-8?B?RUhBYm81R0VsMVNJNmpKb3BQNlMvV3hwbXFKNy9DL1lyTDFkekxKVFhIZ3RE?=
 =?utf-8?B?MHRRdUtESnduc095QmVsZEcrcnVleUV4SE5IdDZta1kraSt4cTRmSENPSW1x?=
 =?utf-8?B?aWk1U2FFLzhodWF3dndxUllxbjk2RGgyVk9IWWkzbGIrdEU2QjlGNWVscW1W?=
 =?utf-8?B?MmFmSFN2MG9lY0xyR1I5MDUzVEttZUFvelVoRWRDeDg3eHNZUTV2UFJXWks3?=
 =?utf-8?B?cTBUa0VyL0RtN2p5dkN4bGlONTVDWm9GMVU5NndmZ0xWOWZlVFBSbldMa0dj?=
 =?utf-8?B?SXlXZXJsMmJtYitURzlFY0lhYU5QdEY2R2JFbXpjcHpTL0V6NDdrZGRxeTEw?=
 =?utf-8?B?U0ppaktreVcvWXFyRkxodmllZzBDck5rbWkwNzlMUXdiczRVODQwYkxpV1Q3?=
 =?utf-8?B?RGFxWlYwejBuTDRsZUdUa1FQcWhkSFB6TkxEK1kzMGVnQWpkeFdzZUdSMmpY?=
 =?utf-8?B?T1BZSkJ4bVVyZFkwazVxdSsrK082VE93LzN3c2RtaWZlenVoSVJ6cVg1Q0R6?=
 =?utf-8?B?RzdYT3M5OUpDUmh4Zzc1My8vTHpSTmptUlR0SUs0d25adEF3Z0lEMGpjaS80?=
 =?utf-8?B?Nnc3TUFEd25MbkRPQkpxUWhhNE5qMkR4ZWRUNG9DSEFLeE92V3phYjlaTG5E?=
 =?utf-8?B?b2FyeEk1RWpQU1FtVEV3SnV1Z2pFaWRxUWUzbnA0dlhRVFovNTNMUXlFZjMv?=
 =?utf-8?B?YW9HQVp1VXpNZTB0NDVmcEZ4S3VnampwTTRUYjRGZVg0TnlDbFRiVkhnL1Z3?=
 =?utf-8?B?bmtZOUlvN3U1bWpxa09DMFdNYmUzUTZ1TXhnaDNMT1c3eTdXa1paTUliQWtu?=
 =?utf-8?B?NXZSTDFramQ4b081L3BqUlV0SjV4SklCMm1BbVB1eTIwb1VtVVh4WXZZT2M0?=
 =?utf-8?B?d0dpSVN1MjJYUU0vMHBHbkFDMWpjZjVLcmV5aFU5MXNhS1N0VUNjNUd0T2Rj?=
 =?utf-8?B?R3lRaWhCRmRZRS9YZk1oWS9PU0FwdVNSWWVtb1AxVmYzYVEzek9UMjBmanJC?=
 =?utf-8?B?eTNMUDFVK0dSWHg2VHFvQWxiM2tpNlJnUnFFVWEyV2cwYVlZaTV0REFtV01p?=
 =?utf-8?B?alZxWHlRZEt4UHgxR3ZESXRwR3JxWWZiaEZ6UlpINUpBRWIyREtvSkRwNXpS?=
 =?utf-8?B?TVZZZE5XcTNTNlMxclBlOFdMdDh2SVo4dVBUSXRwSThlWm16eVkwKzFqOEZ6?=
 =?utf-8?B?MVJVeHc5NTBZblZWUmFJMEpNTWZCUlRJenp2MW5mcncxT080QjZDZ1U2a2ZD?=
 =?utf-8?B?bWR0SndWRGNuQmRwNDIvY3BUOW5XMnJ6MHRjYTBtUkxWU2E2dDN4NmdTamd6?=
 =?utf-8?B?OXBweEtaOFNza0xSNEhyZHJhN1IxS1RxVEcxejY1UmJJVm8vNm4wbG01ZHVs?=
 =?utf-8?B?MEw0ZTBkUGpOTStpaGpHK3hidFZLU1RMUVMwTzRYOEROOHc3OGRjVTQrZWlO?=
 =?utf-8?B?aW1ydnR4SDErN1c5RVlTL0FrRktQSVhxWU5lZm8xUWh2SXZaMlNqcmVrZmVD?=
 =?utf-8?B?eXdhM0JaaHJXK0d1dUFRd3ZjUXlJQWZsWm5HS2Nray91TEVoWHZFWm55dzNE?=
 =?utf-8?Q?nbdXwxr9wCRMGE/eTz6InArpyuVBkvyy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTJXYUZENmE3aXpHSXg0Q2FhS1VKSEZSTVJqMTRwbDZkN2dSVjBhR2JLOGly?=
 =?utf-8?B?c2hobjF3RW84b00zb0hMVVd1UlZOOTZubjhxT1J0TTBLTEhrWHRUcUVwMTgw?=
 =?utf-8?B?NjZnZ2xxZThMS2JlR1pRTnk3Um9NMDhndUY4dXhWMGF6Mk5iVlJyaFM2UElS?=
 =?utf-8?B?YW16dDhlRHdYRFQwSWx3S2dFNVZTK2MxdVZndHBYVmdSbDZZSFlabmlOY2hD?=
 =?utf-8?B?YWI0NXdqQklDR1ZtNHlzUzRWeDUwc1FFWmRrbUtUS1JDZkNyRUZvNW94WlFF?=
 =?utf-8?B?N3JhcWxOK2NWekIwTVNhaERIWk1tSWZhbGlMR1BHbk9VeTF4UEMrRXFtSW12?=
 =?utf-8?B?M0VUcHE2VTF2ajVTTEhITEY5b1R5VlNwSmluSDBRcnJhQTBNaU5hcmlXV2Yy?=
 =?utf-8?B?bTdpd0YwVEdJanIwQ2x3Nld6dDZwcFNkV0p3NjhUZ1RiblZUUGNyb21ldWhu?=
 =?utf-8?B?RGQ5Y3hGYUhqcXhGaXl3UUxYR1orQUl1d2NmS1NFSjRNMkFjUm51R2g5UGxy?=
 =?utf-8?B?OXhLVWR4RWc4a1ZMNXhRQmNLY3JJQjZrNktWU3BIK3dIZzhNWEZEemtwajVv?=
 =?utf-8?B?UWRTeGt2MUtJaWloME1DU2t4aGVOTVpEcnhWUjdoV0k2NGlObkVPUzhUSk1t?=
 =?utf-8?B?RU1CSTVYU0wzOERPY2tOMTU0Sk9ydHlLYk16eTl4SVhIQlBsZExJUVNjYzF1?=
 =?utf-8?B?aEx5MG1JMk1ML1hiZVNYT3R4K2RreGVTQzF4a0JmZVhiVTI0dktUNWFMQmRv?=
 =?utf-8?B?bFNNY1VYSjRQZTAzOEdxTWlzenJLTkkzaTRndmE2SkVOZ0I5OS9GQ2NhS2Iv?=
 =?utf-8?B?c1ovQVpmSm1URDErTWt2bk5wSXBkZHg4RWZtTTdLbHNyT0NhemlRUjlGQWNB?=
 =?utf-8?B?S2xsOEZKY0t2NnNyVlJ5Tnk1MTJVVWx1SVhyU0VZT0dlOUR3MktOcUZhemVQ?=
 =?utf-8?B?MlVsOXJiWkR2SHZScnpZeUZsdklUUlpiemwvSGhoKzY2Z0E2Y2FQcEhJdW9o?=
 =?utf-8?B?NU04ZWVLMytVWHkzNXRTUHFabEJMRmZwcm9KbE1xR1B6THY1SW5Gd3I4bG4r?=
 =?utf-8?B?bkdQNjZTNHIvZUF1VUFPNnZnVnh1S2VRdkk0Qy9RTlREOEg5dXNRNEl1WE5u?=
 =?utf-8?B?UXBWTFArTTVlQURUK1BaZmJGT3B4N3JSYUZGYUE5Y0F5cXhVcjlYMG0xdW93?=
 =?utf-8?B?MFkvRmVhdHdxTEsxM1djWk15YXdteEFrTEJ4UjRzU01CdC9ZdDNoR25YK3ds?=
 =?utf-8?B?QnVCOUJGVWlTSzF1cXNNcS9sc1dRU0lyRmVrVlBkeVJMV1N5Wlk4Rmd6cDVF?=
 =?utf-8?B?TFhtZ251T2JrdzlkMFNPd05DSmNhNXBjUTRrSUduQ29BOFV5NW4vMDhtUWNL?=
 =?utf-8?B?aTBmMUhVbGsrOS9FMGJKS0NiWlplRlFxL1hWTTB5VEFSVk1IOGNjd1pFc0tR?=
 =?utf-8?B?YlR0NDBUZDJRRGF3WmdPL0JKUExqUzJicmZzeUxkSlAyaG9KcEJrbXk4LytI?=
 =?utf-8?B?M2w0OCtBYTIvTXRmS3EvKytNNUZrck5hTXIvVnNJeW1TSlg1V3hxK0NJVWRS?=
 =?utf-8?B?RXRweU5VYWdIRi95WEQrNmZpbDlGamZydXF0TmpiQTVFV0V6c2JnRkNCTlJt?=
 =?utf-8?B?cHlDRDVZd1hobytrY2RDMUsxcEZkRVZ3SzIycW8xSDUwOUxIQytiV2tnUTVV?=
 =?utf-8?B?WUF1RTVnb29ETW5GZzVqSWR3T3pCN3l3UllGcjR4dFJXSUNJVUoyL2drSzZS?=
 =?utf-8?B?YjF1QXB6ZTRoSkJFMkNPSmhjd01CRndzTnlCMGJxNjJYSTZBdEkrb1Q3ZGlm?=
 =?utf-8?B?bVlnQmxTRmt2VFl1L0lzcklvOHpPVEREdTNXRms2Um04L3pMOHFGWjdTOW1E?=
 =?utf-8?B?TXJSTDl5ODJRaDRXU1FIV3AzUDZDanhhT2hPWFZJNUFJS04yK0Y2VytRQmdQ?=
 =?utf-8?B?M0x1Wm0wVDFYalh2Wk8rSUluWGE1RmV3YUZKajEwZlE0QXRLMDl2bHE2SlVL?=
 =?utf-8?B?VE5HS1lJOGREVXFtTFVpbWVuREEyNGdEUGRXRjdaSWwrQUZMdkhpMzRSSDIv?=
 =?utf-8?B?RVgyQ0pXUTRTQUN3WUNFL3hWWGdwZjViYmE0VFhBODJXM3FTWVp2bWFJMThC?=
 =?utf-8?Q?J4cIQXgXSVeu9dWLD4y/8pjGq?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0431_01DB6B4A.450E7950"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e601b2-c835-48cf-e2f3-08dd39334f1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:17:48.9964
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qhMdMiLsNYRijuFQFiMWZ6Bx8RWxnNa4ACjiTKKdMB8D8jadCCctw869sRBQniVsJtLC4IjiQ/RkDaDyZN3RWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

------=_NextPart_000_0431_01DB6B4A.450E7950
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit

Ran "b4 send --reflect"
But it sent to all.
Please ignore.

-----Original Message-----
From: Pankaj Gupta
Sent: Monday, January 20, 2025 2:46 PM
To: Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof 
Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Shawn Guo 
<shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix 
Kernel Team <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; 
Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org; 
devicetree@vger.kernel.org; imx@lists.linux.dev; 
linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 5/7] se_ctrl.c

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 drivers/firmware/imx/se_ctrl.c | 62 
++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c 
index 7260a9f93e06..7f6b9199e6ac 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -42,7 +42,7 @@ struct se_fw_img_name {  struct se_fw_load_info {
 	const struct se_fw_img_name *se_fw_img_nm;
 	bool is_fw_loaded;
-	bool handle_susp_resm;
+	bool imem_mgmt;
 	struct se_imem_buf imem;
 };

@@ -73,7 +73,7 @@ static struct se_var_info var_se_info = {
 	.soc_rev = 0,
 	.load_fw = {
 		.is_fw_loaded = true,
-		.handle_susp_resm = false,
+		.imem_mgmt = false,
 	},
 };

@@ -140,10 +140,15 @@ static const struct of_device_id se_match[] = {
 	{},
 };

+static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv
+*priv) {
+	return &var_se_info.load_fw;
+}
+
 static int se_soc_info(struct se_if_priv *priv)  {
-	const struct se_if_node_info_list *info_list
-			= device_get_match_data(priv->dev);
+	const struct se_if_node_info_list *info_list = 
device_get_match_data(priv->dev);
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
 	struct soc_device_attribute *attr;
 	struct ele_dev_info *s_info;
 	struct soc_device *sdev;
@@ -164,6 +169,7 @@ static int se_soc_info(struct se_if_priv *priv)
 		}
 		s_info = (void *)data;
 		var_se_info.soc_rev = s_info->d_info.soc_rev;
+		load_fw->imem.state = s_info->d_addn_info.imem_state;
 	} else {
 		dev_err(priv->dev, "Failed to fetch SoC revision.");
 		if (info_list->soc_register)
@@ -219,11 +225,6 @@ static int se_soc_info(struct se_if_priv *priv)
 	return 0;
 }

-static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv 
*priv) -{
-	return &var_se_info.load_fw;
-}
-
 static int se_load_firmware(struct se_if_priv *priv)  {
 	struct se_fw_load_info *load_fw = get_load_fw_instance(priv); @@ -237,21 
+238,9 @@ static int se_load_firmware(struct se_if_priv *priv)
 		return 0;

 	se_img_file_to_load = load_fw->se_fw_img_nm->seco_fw_nm_in_rfs;
-	if (load_fw->se_fw_img_nm->prim_fw_nm_in_rfs) {
-		/* allocate buffer where SE store encrypted IMEM */
-		load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
-							&load_fw->imem.phyaddr,
-							GFP_KERNEL);
-		if (!load_fw->imem.buf) {
-			dev_err(priv->dev,
-				"dmam-alloc-failed: To store encr-IMEM.\n");
-			ret = -ENOMEM;
-			goto exit;
-		}
-		if (load_fw->imem.state == ELE_IMEM_STATE_BAD)
-			se_img_file_to_load
-					= load_fw->se_fw_img_nm->prim_fw_nm_in_rfs;
-	}
+	if (load_fw->se_fw_img_nm->prim_fw_nm_in_rfs &&
+			load_fw->imem.state == ELE_IMEM_STATE_BAD)
+		se_img_file_to_load = load_fw->se_fw_img_nm->prim_fw_nm_in_rfs;

 	do {
 		ret = request_firmware(&fw, se_img_file_to_load, priv->dev); @@ -467,8 
+456,21 @@ static int se_if_probe(struct platform_device *pdev)
 			info_list->se_fw_img_nm.seco_fw_nm_in_rfs) {
 		load_fw = get_load_fw_instance(priv);
 		load_fw->se_fw_img_nm = &info_list->se_fw_img_nm;
-
 		load_fw->is_fw_loaded = false;
+
+		if (info_list->se_fw_img_nm.prim_fw_nm_in_rfs) {
+			/* allocate buffer where SE store encrypted IMEM */
+			load_fw->imem.buf = dmam_alloc_coherent(priv->dev, ELE_IMEM_SIZE,
+								&load_fw->imem.phyaddr,
+								GFP_KERNEL);
+			if (!load_fw->imem.buf) {
+				dev_err(priv->dev,
+					"dmam-alloc-failed: To store encr-IMEM.\n");
+				ret = -ENOMEM;
+				goto exit;
+			}
+			load_fw->imem_mgmt = true;
+		}
 	}
 	dev_info(dev, "i.MX secure-enclave: %s%d interface to firmware, 
configured.\n",
 			SE_TYPE_STR_HSM,
@@ -494,13 +496,9 @@ static int se_suspend(struct device *dev)

 	load_fw = get_load_fw_instance(priv);

-	if (load_fw->handle_susp_resm) {
+	if (load_fw->imem_mgmt)
 		ret = se_save_imem_state(priv, &load_fw->imem);
-		if (ret < 0)
-			goto exit;
-		load_fw->imem.size = ret;
-	}
-exit:
+
 	return ret;
 }

@@ -511,7 +509,7 @@ static int se_resume(struct device *dev)

 	load_fw = get_load_fw_instance(priv);

-	if (load_fw->handle_susp_resm)
+	if (load_fw->imem_mgmt)
 		se_restore_imem_state(priv, &load_fw->imem);

 	return 0;

--
2.34.1


------=_NextPart_000_0431_01DB6B4A.450E7950
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIImZTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
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
ggEKAoIBAQCsljsxzffby7IAt42e7cJH7K+49RL+7i56h3ORt8dS8WNVSdDlejp6uS6mLk/UX0wn
sSxDK1S5KquGJQzaT/3gxE8tdgvfFNBVdrgr48DeCVwWDr1o/UF3RmGcMdxqRz1M/oLDJ03C8n6h
L/0JXiwsNx0KZJoqDrN/48yX5TkoeKJmHFftZ5Op57xV0WkZJ/yLxSC1Om75jOG/UPdqsDzl+wi7
YVj5egV24hoaXgHBxtCeJzUgsHcJlo9nFtGe11j6H1vqFzkPzN9ydjRmhQATV/WLqpG8uot79u0m
6n7Mjwsd/HmJf+8xpovMcHPO2a0axppssKso/3APP6mR1FuVAgMBAAGjggORMIIDjTAOBgNVHQ8B
Af8EBAMCB4AwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMAwGA1UdEwEB/wQCMAAwHQYD
VR0OBBYEFLNr0DCWM1fCXv4ubOt/elkvcoiaMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRw
YW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFua2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAU5TJ6
9GbBR5Ykf/wngDlY3ysX4rswggFKBgNVHR8EggFBMIIBPTCCATmgggE1oIIBMYaByGxkYXA6Ly8v
Q049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1ubGFtc3BraTAwMDQsQ049Q0RQLENOPVB1
YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2Jp
LERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hjFodHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFAtRW50
ZXJwcmlzZS1DQTQuY3JshjFodHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFAtRW50ZXJwcmlz
ZS1DQTQuY3JsMIIBEAYIKwYBBQUHAQEEggECMIH/MIG7BggrBgEFBQcwAoaBrmxkYXA6Ly8vQ049
TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2Vydmlj
ZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jQUNl
cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTA/BggrBgEF
BQcwAoYzaHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFAtRW50ZXJwcmlzZS1DQTQuY2Vy
MDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRVhu2FOILrmUuaklY/hMbNXILljX4C
AWQCAT8wJwYJKwYBBAGCNxUKBBowGDAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDANBgkqhkiG9w0B
AQsFAAOCAQEAWS4IrHXWhCGNWk5vn20xV7mlLkM7JPwltVJzB6MRzwUB438upbyUMwNHcEgAmHcs
xL9hafErN+n9rLL00wEqZsCV732s7YOxSRRjZTE3CmZQ2+TYjXR7A6AzQKo0fv/x43bpSes8ttQ6
Qtt8nzIbGBkDAcI7wfXsUPF5o0NwLOxre+Z+JCPNH0eaOj2J7EKD2ERLCClmvohrYdlmu85iXfyi
nJo42eq9g08FtnxTXVQSIZCtiETiGtXA7+t2Aa8429XXunsijRznaYw2SwI/s4sVmvaK3XHaif0D
QaUYxQp4s2ctzgz3eU6hK68OnNzbhBtF/lx6PHbifqHDzrtUbzCCB+8wggbXoAMCAQICEy0ACwRu
JYOozH+yQuYAAQALBG4wDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMzEyMjAwOTIw
NDdaFw0yNTEyMTkwOTIwNDdaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAklOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
ODcxNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2JT+kRihW1mBdeZFOoCLGIl4DZ
VL7FWt3V1iFFJJe/bZDw/SUf5z1HeA8xv9+S8rqMyybjlSRHFLgiMm7qrGpVEDniKe8eiqP8Un4Y
3fHgK5FKZIVVn0KlaMuD5G30AMk9HyUdc2MkVRL8YSQCewkQDEVjB8gnx/e6xfbWEVHf5+dOWJoR
aket5+0JKV0l/dPV7cT4hL3BFtiBhq8976Li6rn8gxIi63u0G3qvm9Scqk+EHzemDhw/W+eMmGR4
nwKVLKzumxko8l6EOnnvqqF4vj2hKTpB+2lsEXH1giireMEsvB2RY40lnRUXVQ0FDklOIQV4Qdgi
EJfUdq/ZhCUCAwEAAaOCBA4wggQKMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/gbeCPIPthzICAWQCAT4wEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwHQYDVR0OBBYEFMJ81PK4p3H8Q7gn7u/5OwWx
uAwGMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRwYW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFu
a2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNV
HR8EggE9MIIBOTCCATWgggExoIIBLYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENB
JTIwNSxDTj1ubGFtc3BraTAwMDUsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENO
PVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9o
dHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3
dy5wa2kubnhwLmNvbS9jcmwvTlhQRW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIw
gf8wgbsGCCsGAQUFBzAChoGubGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENO
PUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdiaSxEQz1ueHAsREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1j
ZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29t
L2NlcnRzL05YUC1FbnRlcnByaXNlLUNBNS5jZXIwDQYJKoZIhvcNAQELBQADggEBALwIIuww1PaF
EbpQoy5vgJ/4N3xS+niIpFTKyYNAD0Ar38FcUlSnj0FIHKRj8rUmZP9WTky3U8m5B3LOyhJ14FPh
iy1EwkhZmds9fJiZyEEFiwQWYDG/uknu6zIKOTlLmtlYPfbzfi58keGcjD3T5H8D8DpCGWI1lAwe
clR9fJCbcYnQSQnuicSCfrHjjXiDZ2O8h7WbE1CC6Cj/qwo5nmS0lMv7yoG94rTNBvYe8iqOkcav
7KiZA6SdhXms3ppvFmBukI6pTheMvT39SM0S6E0dgeqZSGSxHrM7dcxUdAL4fnYMv3Sa+GAgyXB6
rihWC11+goz2eawt5TRU2w45TmcxggSzMIIErwIBATCBzjCBtjEcMBoGA1UEAwwTTlhQIEVudGVy
cHJpc2UgQ0EgNDELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5k
aG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJ
kiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MAhM/AAV1goSs
wyqoLYNbAAUABXWCMAkGBSsOAwIaBQCgggK5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTI1MDEyMDA5MTc0NlowIwYJKoZIhvcNAQkEMRYEFLurGbRfG2QpRdI7dJu0
mLKzNs/5MIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
hkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsO
AwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMIHfBgkrBgEEAYI3EAQx
gdEwgc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjCB4QYLKoZIhvcNAQkQAgsx
gdGggc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjANBgkqhkiG9w0BAQEFAASC
AQCd7szCjHlFfLwY+7zR01mUlf/LFhMpON8ctnhXCAdJ6PbToABGUuQopGWqcwoHsH55EDrn+TVN
84yKczIgByIaetsMOTS+pmvQ1tnuMrnATZ2JMTyp+cYaRPHNChJ+SIQQeJ3RuUln5QrjGyKmKvcW
mbZv81LTi49G8cUiTMxcBz7n/ylarMookSK5V+qX9UQR0uI/uGcjyQTfD0bLO0qkjoa64Mjw2u+U
2NvVyvkFIFsQBKBYSbs9hyXYXRFU6rgVzlI2g8MhbaWUiXyT8B/HKeYy8wfXSiGNJTqNrvRA7vlf
1ppQoaBsDtNuP/dVSoMrgL1PpwPJ5r/CkGVokKbvAAAAAAAA

------=_NextPart_000_0431_01DB6B4A.450E7950--
