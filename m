Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2050.outbound.protection.outlook.com [40.107.247.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC51FC4
	for <imx@lists.linux.dev>; Wed, 15 May 2024 01:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715735142; cv=fail; b=Fdf+u5QfEsmpCc5NYK7XqgDwpu8G2UDEZBz8qOiKUWYv5D8jKg1irFdfpW6A4ApEmAOx8EZDEIFHS0VjdglCeB4Qees/ecs8vZY7MH1mEqkFjavxgjPI/wpafZ0lY8zVucMDC7SeXKG2UzT6Yfe5a87MQjTjBRzMMTREueCz5Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715735142; c=relaxed/simple;
	bh=7C0lGpkBYxrl1YTGyxs8Ii+97DNVUJCwYzUPQgDPpog=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R0ZJ+LUzKtksc4i1GbC/mOxwQ7TNW3LLyRFIWV/IV3ni1thsDAhbtp7iq3xT3DM5a5x1zF8Bc6GvU7q3jSAHtfdK7B3bVET0C1XGSmtLOi5NKvU5zOebwygnLj9T3mCUB2W5uwkMxw9vByl//viCHo7tPR1+NJPAAb+szgy3MH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=I6Hs5wm/; arc=fail smtp.client-ip=40.107.247.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="I6Hs5wm/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XGkHPQXYq0pazTtBevuybOgW0zjwYbaQ/sm/saIiSgs+ZKuQhlP3g1M99yeOVfcT/y+7Q/axz0n5JuNZmKH59yST5prBw7N8sCXkO7XznYOG4dkvLutqRsybLqTRSgy/Proon0VJ2MRFeqASTlEv9hoWK0ftEiPJxRBl9oeq+hIvPwDs4RV1S7q200UYR2g8+gTl4D5CvkRDBHcVHKMqRSj9SqYk6rXv5o9oUdnHmpxI6rNlo9QtE2rb4yOxoe0kcDi/a/v49dUJF/8mkIEMT/mIps3LGpmxXFQXchZLoptFjeKqK7ZegGu/6qx93LGh5B/d30/LKpEgK4FscfbBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7C0lGpkBYxrl1YTGyxs8Ii+97DNVUJCwYzUPQgDPpog=;
 b=g67QMXbfZu3YiB8oA8CJ4iUqOobq94u7sV5/jWpA0229hJW7Wg0ESAyK2upjAsUakoYbpw+xRLHNwHUOVgdU7moSMO7XhP8OElY6+N+BL1uHNmURQRccv2GfDcjNL4/eG89WgLaa0bII5vh30WEDGU6ssJSUZDYr3fHBlP/0MqsC5cBGmSqOEe2S4yk3lfio4bawQ0pecE2ClWQW1v4xR1VP9O6xNA/MJEikUAZYM7tCnJcDwf3MBHkqOOe3jjv+9kLfvMzhu+i/DygHvwWCH+PPIIzko1ZZOmNlYK3iMGnGscDJtGLhokUuTL/HDksF5zI5BSThKOkTJmLkXMK6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7C0lGpkBYxrl1YTGyxs8Ii+97DNVUJCwYzUPQgDPpog=;
 b=I6Hs5wm/obDACswvnasLQ9Tkg+ibHKi8uOuKSWzKPr9UUWTMB9UPu12iWZd0smlEHKTN/dzh4+wwawfsZo4SV4mDXiQ8ixNOJUfu+a571uLYjwJhmAth7xqkrFL/xp/z+PBYqRuuaMwPaQdYhg9eUnSTedZhGW9Ri0bsrosVYdg=
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by DBAPR04MB7269.eurprd04.prod.outlook.com (2603:10a6:10:1a4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 01:05:37 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%7]) with mapi id 15.20.7587.026; Wed, 15 May 2024
 01:05:37 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2] PCI: dwc: Fix suspend hang when e1000e network card is
 connected
Thread-Topic: [PATCH v2] PCI: dwc: Fix suspend hang when e1000e network card
 is connected
Thread-Index: AQHapcYz1MNe4t+sM0SQLvwd46LuKrGWyn0AgACwkmA=
Date: Wed, 15 May 2024 01:05:37 +0000
Message-ID:
 <AS8PR04MB86763A25FF7FD6A12F0C9A698CEC2@AS8PR04MB8676.eurprd04.prod.outlook.com>
References: <1715666198-9140-1-git-send-email-hongxing.zhu@nxp.com>
 <ZkN1GgczTvzAwYDQ@lizhi-Precision-Tower-5810>
In-Reply-To: <ZkN1GgczTvzAwYDQ@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8676:EE_|DBAPR04MB7269:EE_
x-ms-office365-filtering-correlation-id: 9afa6ff8-41f4-4cb3-b43c-08dc747b2181
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?gb2312?B?dEZ5MWNSNThkZDh5MWZaUGR2cWFrQUw5Y3MvY2xEMUFSQmswZUF6MzZJaEJr?=
 =?gb2312?B?YnR6OTZPR2N2T0gwalNOa2xtb1M1bXBtOHp6NmFiMGliS2ZiSCtHTVFzZFE4?=
 =?gb2312?B?WGs0TjI1QWpCN20ydVczMGFSaURHd0ExTWxQVVhWREhVV0RSQ1dOR09Ia2cw?=
 =?gb2312?B?T2F0djBNRFpxRkJDNHBsZUpqcC9LVGpNWGxaRU1kWC9jT2xONVpNaVozaThG?=
 =?gb2312?B?SHZoVnBKYUlQT0pYODdaNEhDYmVUb2ZzQlpCOCsweERBdzVZbVNSY2E1c1BL?=
 =?gb2312?B?T0xyVStDNFA1eUIxQXFQbWJMUEJUL1VEWUVTZ0VBQWpaZFFKZnNFNWlmTHpr?=
 =?gb2312?B?dkQvUm9keXY0QWg3R0Vjc1A0YitKV09jSTBlSndXSDdnZjRaaHB5Zm9hL0FL?=
 =?gb2312?B?WkJyRXNJRW8wVSswbnR3RVN1NEVycTE2REdBdndSMCtWTEhIL2ZoWXFwNFgv?=
 =?gb2312?B?UlRROG5qSWdyZHByM1NWMWFiQUhzVEpVZGpFZGhmbVYwWVVxU3hEd3d6d3lZ?=
 =?gb2312?B?MmtKUHBIbWEwWmhBRU1ZekpPa0lmWU95SitJYWFxd2dHZzBiVmNrVFpLNmUx?=
 =?gb2312?B?WmRKbUszaUI0YlFyZTJuTmJIaHN1YWJFWHB1UjRZcmxHK2xTdmcySHFtQmVW?=
 =?gb2312?B?SEp6VEo0bzB5NFdEejltYmZGSVJNWXlKOEwzRDZDWHJLeXFRalVoaXNJZ20z?=
 =?gb2312?B?cnFKcWZIeDl5cTAzUm1IdkJKM0NlQkR4QnJiRHFBa2NqL2hpenBqSGplK3lK?=
 =?gb2312?B?dmtJUzZBcWVtQ2dHVmVRakswKy9wekZqTFE4cWpDRzNleHdSR1ZvOW4xTENv?=
 =?gb2312?B?dFA2c2oxeWk5bkNuakdjQVBGK3V0OEo5Y1c5eHhCd05DMTQ2bFhveVVSdjg5?=
 =?gb2312?B?Z3VlL3M0ZTFlalFIT2pHbXdYbzYvaW9sWTJFSkY3bDRSaHp1Ry96b3BKdDM3?=
 =?gb2312?B?NG8xZVdRZ0xwYy9ITWJ1MmVqdTY2SjlKTXRLdDVUcVdkVGtuR2V3c2c4cnRD?=
 =?gb2312?B?Z3NQMjdLTmUzb1cvbCtZNlloeHZjMmY5dEcxc1hsa1d5SFFDOUhkNjJORVRI?=
 =?gb2312?B?QVluenJrUFRGaEg5SzM5ZFY5MFhvVGQ4NU5naG5ybVBUalc3T29OTlNSY084?=
 =?gb2312?B?Myt3VnpkcEw1NmJDeHM3RHlOS3BQbDhJbHYvNE8zbWpJN2swMDdhTlh5alNh?=
 =?gb2312?B?U0xoM3pwUVJJUkFIQTd3MlJtVUZzei93QS9tcC9lOUkzNEVnbjFaNE96N2pH?=
 =?gb2312?B?SGVHa0RycEZ6Uy9yNGM2RmZkS0JzdDVXQkhBWExISkIvV1lQK2ZZYWV6Y1Ix?=
 =?gb2312?B?R0xISFo2eUJ3eWNSY3ZmbCtZNTl4WDZVQTFPaXE1U3JsVkFEZGdWczY1UWF5?=
 =?gb2312?B?c0YvTkxUSFArWndpNytLRlJZVGk2UXlaYlpaNHR0cC9JV1RBUUEzL08yYjR2?=
 =?gb2312?B?eDlDdDdhTDU5VWJQWDVBSVlYRUhjdXhYdThLSEZHUm1hZWdWK290T3dIQnNv?=
 =?gb2312?B?RWRiaTN5MS9KTllBRTFkMWFFTWZNNXJhZjJrK0o2dDUwdHdybllqckRpVnlm?=
 =?gb2312?B?SWlvU25CbTQ3c1dsUlVNM0hoUEVJTndSeUp3c3BsZ2dqRjlaeUZycWwxTTdT?=
 =?gb2312?B?MFZUQm9SeWw1ZGVPcTRqQ1hPSW1wVjh6NGlHTEptSzJDSGlPMUl0cGV4eVBn?=
 =?gb2312?B?QjlNTU1IMlBvZkV6aWsyalBjb2F0ZVhpMVpBb0djU3NXZWlsLys0QndLTHNw?=
 =?gb2312?B?UkZaY2ZublFjVEFNZ1cvMjY5Wnd6V2xjNFFnWitYTk4wYy9VMmY2c3dwUjRE?=
 =?gb2312?B?L0VZMEd5aDNIR2lUeVNZZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MVdoMWVTeWJSRlBRUVVTTytLczhudmoyVjQrNk5IT2FMSTVjNFpQU3FydXEz?=
 =?gb2312?B?a2c0dmJnRG5WdmgwWTg1SnN6VEV6RTk0UEJnaTFPazNqZDdTTWVnVVExaWVY?=
 =?gb2312?B?Ym5PODZka25sUXZLLzBHT1BvN1BlMjBxRC8xMkUza3E2WndBRHZyOERkSE0w?=
 =?gb2312?B?NHZpUER0b1hmYlpkbk5MbU9kQklmRzE0aGNLRFVMNGljMkgxbVAwZ1FKNjhK?=
 =?gb2312?B?R2RRVGYwQlJTMXQ0QTVQRDJ3Rk96aTRQNWFvaXFrcXJaZTZ2eUNQbThodkJS?=
 =?gb2312?B?Q0RKNmFTeGtIbG0zejFYbkMxcGo0NzZZUVl3TEN3TG1nVkZ0WnlBQTNUZ0JH?=
 =?gb2312?B?dEdaVDlad1Vhb1N4WWFPdFpzSTA5R3hhTWFIVFlQb3NvRXl2QW9iSWRRd2Ew?=
 =?gb2312?B?d1VqSTJKQWl1S3ExdWZNLzVETzFpM2RuT29TRFYwQ2hyaGdDTFlQUVFtU1J0?=
 =?gb2312?B?T2d3aGEwWFNRaUpIOEYwcTNGeCsrd05MNGpqUFZodkdJbUtCYjJueVMwQXZO?=
 =?gb2312?B?cjVLV3l6NkdKZ2JxWndqOHA0bGRtdG9nTmRYdFV2NVQzSDVvcDJRdmdlb3F0?=
 =?gb2312?B?N2kyZnpoSCtZL1pybXBkRmhXUGJOSnhLMjVWbFpwSlRHWHJ6Tk03RmdXakx0?=
 =?gb2312?B?Q29McHVFYXI4MDNDb0RENitEN0IxUnNwZjZ0UThtNHVCTit0ZVhodHZ1dkFO?=
 =?gb2312?B?TnExeC9FbmtnSE9UaVJXcnlGbXpiZUkyL2FKekVhVXg3VGo5TTB6SlNyM2t4?=
 =?gb2312?B?ZWJoN2Z1ZEVUWm16aUp0d2x5RjJNTkk0ZFRNNTNFajZDYyt2Mnkwd0s2RGly?=
 =?gb2312?B?Y0VId3cybms1RU9yN2lYMFpIUUdJblF2bUdseVRTYjF1UGdVMUJKL0VOZDRt?=
 =?gb2312?B?N1ZUbndnVXR3b2tFOENxQVZaSzRkYmhRcUUzd2JsRDREbW5DcEE4YnpPY3Nh?=
 =?gb2312?B?Y0wyUGNMb2V5MDcwYkEwNnY2UklnOUZCVEl1SzcrSU5tQjQ3SW43VEdGdk16?=
 =?gb2312?B?aml4ZmpKazNrTEkyTW0wYUtEK2F5TDB2ejE4aHNaVVVYZ1NnN2pnL0FVZzdx?=
 =?gb2312?B?WFEwenNCcXNtWGJPRHFSbWZKbGVmQkZBSnpYajJUV3VQek9FU0k1ZGMxM0J4?=
 =?gb2312?B?Szc4bDJEbUtHYW96K2Jhcm9NU2VxUVpxb0lvSHNJeWJVaExmWEFPMjcxUWNt?=
 =?gb2312?B?bHNqdW9MKzVyTkdmalpwM0x6d2hyYXBvWUYxemlQSlA0OFVoT1NtM3BHWndW?=
 =?gb2312?B?QjJGRktFVHQxR3ZIZXdOWEg0MXJ6ZkRncHI4ZS9QOVhtaExITjd0cVo0SEFj?=
 =?gb2312?B?K25FRjd3VGxSZWFWWTdnWHM4QnBVYUMvZXZoTFJnVmZVMGpBTFdnMVVrbVF0?=
 =?gb2312?B?ZldBR2tZS1YzWitQQVBaMDViU0RBM1k5andiMmtYd3drdVhoaWFMRkZ1TjZ6?=
 =?gb2312?B?enA0YndndGo0TlNFU0hoMjkxQ0ZtZ2pZSk9haFdPL0FFbGt0clhkY2ZESGQr?=
 =?gb2312?B?REZCT2huS3NLSlM5aEhvMFFrNS9PeE1JVkdndlpGNW52dUNIZmNRRjFvYjJV?=
 =?gb2312?B?dnNTaEMzMzFFVUo0ZFN3aVZ3VDhkQUpFS2lIeFArM3FXV2tmb0o0YnBEOUw1?=
 =?gb2312?B?TDlYYW1OakJ1YVpEMnhLT1RtK2hqbXRyVVZsZnNsZXlna2ZKZXNzL0V6TElF?=
 =?gb2312?B?YW9RVGZFaksrZjZaclZOUVZzNXJuTi9GdUdaQzBlV1hmam91R2VRWjdCTFlR?=
 =?gb2312?B?VFJHekFzRlBGTERzRDVoeThDSGhDVUlKRjR3NnFLTEYyRXZ0RitNcE9KWjFl?=
 =?gb2312?B?d3hzYmpybnR5WHJKSEJjR3VNMzNHdHM4RDBUTHBxWXIxemNaU3BUVGJoc21H?=
 =?gb2312?B?ek5BUUJMWlg4cDQzdm4wTXU5ZkF0SWRGTHhNc1ZodTIyZWp1L3FjQkg1VHFM?=
 =?gb2312?B?aG83T1o4UVhnRW40UUNDNUFqbzd5QkZJQTJLMlpaajlDWkVjM2VtSTBWcGZj?=
 =?gb2312?B?NFhvUmJLS0tJTW5nS0JyVWpxNUt6bS9KbEhaQVlHOFVHOUw1K3pxTlJqejF2?=
 =?gb2312?B?QXgzQ2RmQ05aa0pNWUFpSVRWbVcvN2hSMG9yWitHSnFlbDBjZDgyWmJPNUhq?=
 =?gb2312?Q?Di5FjlhqMXQ4DT4B1brRQwutv?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afa6ff8-41f4-4cb3-b43c-08dc747b2181
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2024 01:05:37.1163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Be6F6zBd1FGZDDy3fOndIOxFKK87o2YsUQVLq7RdYFIwQLAj2dsY3IUYMjeDJ1ncJy9F/KxWtK/zrOTYMIFpAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7269

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmFuayBMaSA8ZnJhbmsubGlA
bnhwLmNvbT4NCj4gU2VudDogMjAyNMTqNdTCMTTI1SAyMjoyOQ0KPiBUbzogSG9uZ3hpbmcgWmh1
IDxob25neGluZy56aHVAbnhwLmNvbT4NCj4gQ2M6IGlteEBsaXN0cy5saW51eC5kZXYNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2Ml0gUENJOiBkd2M6IEZpeCBzdXNwZW5kIGhhbmcgd2hlbiBlMTAw
MGUgbmV0d29yayBjYXJkIGlzDQo+IGNvbm5lY3RlZA0KPiANCj4gT24gVHVlLCBNYXkgMTQsIDIw
MjQgYXQgMDE6NTY6MzhQTSArMDgwMCwgUmljaGFyZCBaaHUgd3JvdGU6DQo+ID4gSW4gZHdfcGNp
ZV9zdXNwZW5kX25vaXJxKCkgYW5kIGFmdGVyIHRoZSBQTUVfVFVSTl9PRkYgbWVzc2dhZ2UgaXMg
c2VudA0KPiA+IG91dCwgb25lIFBNQyB2ZXJzaW9uMi4wIGVuZHBvaW50IGRldmljZSBFMTAwMEUg
bmV0d29yayBjYXJkIGhhbmdzIGluDQo+ID4gTFRTU00gc3RhdCBwb2xsaW5nIGFuZCBMMiBzdGF0
IGNoZWNrLg0KPiA+DQo+ID4gVG8gYXZvaWQgdGhpcyBoYW5nIGlzc3VlIGFmdGVyIHRoZSBQTUVf
VFVSTl9PRkYgbWVzc2FnZSBpcyBzZW50IG91dC4NCj4gPiBPbmx5IHBvbGwgYW5kIGNoZWNrIExU
U1NNIEwyIHN0YXQgaWYgdGhlIEVQJ3MgUE1DIHZlcnNpb24gaXMgMyBvcg0KPiA+IGxhdGVyLA0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBaaHUgPGhvbmd4aW5nLnpodUBueHAuY29t
Pg0KPiA+IC0tLQ0KPiA+IC0gQWRkIGEgbmV3IGhlbHAgZnVuY3Rpb24gZHdjX2dldF9kZXZpY2Vz
X3BtY192ZXJzaW9uKCkgdG8gZ2V0IGRldmljZXMgUE1DDQo+ID4gICB2ZXJzaW9ucy4NCj4gPg0K
PiA+ICAuLi4vcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1ob3N0LmMgfCA0Ng0K
PiA+ICsrKysrKysrKysrKysrKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtaG9zdC5jDQo+ID4gYi9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtaG9zdC5jDQo+ID4gaW5kZXggY2I4YzNjMmJj
Yzc5MC4uMGMyNzk0ZTdiY2YwYSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtaG9zdC5jDQo+ID4gKysrIGIvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhvc3QuYw0KPiA+IEBAIC04ODQsNiArODg0LDQy
IEBAIGludCBkd19wY2llX3NldHVwX3JjKHN0cnVjdCBkd19wY2llX3JwICpwcCkgIH0NCj4gPiBF
WFBPUlRfU1lNQk9MX0dQTChkd19wY2llX3NldHVwX3JjKTsNCj4gPg0KPiA+ICtzdGF0aWMgaW50
IGR3Y19nZXRfZGV2aWNlc19wbWNfdmVyc2lvbihzdHJ1Y3QgZHdfcGNpZSAqcGNpKSB7DQo+ID4g
KwlpbnQgcmV0Ow0KPiA+ICsJdTE2IHBtYywgdmVyID0gMDsNCj4gPiArCXN0cnVjdCBkd19wY2ll
X3JwICpwcCA9ICZwY2ktPnBwOw0KPiA+ICsJc3RydWN0IHBjaV9idXMgKmNoaWxkLCAqcm9vdF9i
dXMgPSBOVUxMOw0KPiA+ICsJc3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+ID4gKw0KPiA+ICsJLyog
Q2hlY2sgdGhlIHJlbW90ZSBFUCdzIFBNQyB2ZXJzaW9uICovDQo+ID4gKwlsaXN0X2Zvcl9lYWNo
X2VudHJ5KGNoaWxkLCAmcHAtPmJyaWRnZS0+YnVzLT5jaGlsZHJlbiwgbm9kZSkgew0KPiA+ICsJ
CWlmIChjaGlsZC0+cGFyZW50ID09IHBwLT5icmlkZ2UtPmJ1cykgew0KPiA+ICsJCQlyb290X2J1
cyA9IGNoaWxkOw0KPiA+ICsJCQlicmVhazsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKw0KPiA+
ICsJaWYgKCFyb290X2J1cykgew0KPiA+ICsJCWRldl9lcnIocGNpLT5kZXYsICJGYWlsZWQgdG8g
ZmluZCBkb3duc3RyZWFtIGRldmljZXNcbiIpOw0KPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+
ICsJfQ0KPiA+ICsNCj4gPiArCWxpc3RfZm9yX2VhY2hfZW50cnkocGRldiwgJnJvb3RfYnVzLT5k
ZXZpY2VzLCBidXNfbGlzdCkgew0KPiA+ICsJCWlmIChQQ0lfU0xPVChwZGV2LT5kZXZmbikgPT0g
MCkgew0KPiA+ICsJCQkvKiBmaW5kIFBDSSBQTSBjYXBhYmlsaXR5IGluIGxpc3QgKi8NCj4gPiAr
CQkJcmV0ID0gcGNpX2ZpbmRfY2FwYWJpbGl0eShwZGV2LCBQQ0lfQ0FQX0lEX1BNKTsNCj4gPiAr
CQkJaWYgKCFyZXQpDQo+ID4gKwkJCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCQkvKiBDaGVjayBkZXZp
Y2UncyBQTSBhYmlsaXR5IHZlcnNpb24gKi8NCj4gPiArCQkJcGNpX3JlYWRfY29uZmlnX3dvcmQo
cGRldiwgcmV0ICsgUENJX1BNX1BNQywgJnBtYyk7DQo+ID4gKwkJCXZlciAmPSBwbWM7DQo+IA0K
PiB2ZXIgaXMgMC4gIHNvIHZlciB3aWxsIGJlIGFsd2F5cyAwIGJ5ICcmPScuDQo+IA0KPiBCeSB0
aGUgd2F5cywgaW4gNy41LjIgUENJIFBvd2VyIE1hbmFnZW1lbnQgQ2FwYWJpbGl0eSBTdHJ1Y3R1
cmUgSSBoYXZlIG5vdA0KPiBmb3VuZCB2ZXJzaW9uIGluZm8uDQpOaWNlIGNhdWdodCwgaXShr3Mg
bG9naWMgZXJyb3IuIFdvdWxkIGNoYW5nZSBpdCBsYXRlci4NClRoZSBQTUMgaXMgZGVmaW5lZCBp
biAiUENJIEJ1cyBQb3dlciBNYW5hZ2VtZW50IEludGVyZmFjZSBTcGVjaWZpY2F0aW9uIg0KDQpC
ZXN0IFJlZ2FyZHMNClJpY2hhcmQgWmh1DQo+IA0KPiBGcmFuaw0KPiANCj4gPiArCQl9DQo+ID4g
Kwl9DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHZlcjsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgc3RhdGlj
IGludCBkd19wY2llX3BtZV90dXJuX29mZihzdHJ1Y3QgZHdfcGNpZSAqcGNpKSAgew0KPiA+ICAJ
c3RydWN0IGR3X3BjaWVfb2JfYXR1X2NmZyBhdHUgPSB7IDAgfTsgQEAgLTkyNCw3ICs5NjAsNyBA
QCBpbnQNCj4gPiBkd19wY2llX3N1c3BlbmRfbm9pcnEoc3RydWN0IGR3X3BjaWUgKnBjaSkgIHsN
Cj4gPiAgCXU4IG9mZnNldCA9IGR3X3BjaWVfZmluZF9jYXBhYmlsaXR5KHBjaSwgUENJX0NBUF9J
RF9FWFApOw0KPiA+ICAJdTMyIHZhbDsNCj4gPiAtCWludCByZXQgPSAwOw0KPiA+ICsJaW50IHBt
Y192ZXIsIHJldCA9IDA7DQo+ID4NCj4gPiAgCS8qDQo+ID4gIAkgKiBJZiBMMVNTIGlzIHN1cHBv
cnRlZCwgdGhlbiBkbyBub3QgcHV0IHRoZSBsaW5rIGludG8gTDIgYXMgc29tZSBAQA0KPiA+IC05
MzMsNiArOTY5LDggQEAgaW50IGR3X3BjaWVfc3VzcGVuZF9ub2lycShzdHJ1Y3QgZHdfcGNpZSAq
cGNpKQ0KPiA+ICAJaWYgKGR3X3BjaWVfcmVhZHdfZGJpKHBjaSwgb2Zmc2V0ICsgUENJX0VYUF9M
TktDVEwpICYNCj4gUENJX0VYUF9MTktDVExfQVNQTV9MMSkNCj4gPiAgCQlyZXR1cm4gMDsNCj4g
Pg0KPiA+ICsJcG1jX3ZlciA9IGR3Y19nZXRfZGV2aWNlc19wbWNfdmVyc2lvbihwY2kpOw0KPiA+
ICsNCj4gPiAgCWlmIChkd19wY2llX2dldF9sdHNzbShwY2kpID4gRFdfUENJRV9MVFNTTV9ERVRF
Q1RfQUNUKSB7DQo+ID4gIAkJLyogT25seSBzZW5kIG91dCBQTUVfVFVSTl9PRkYgd2hlbiBQQ0lF
IGxpbmsgaXMgdXAgKi8NCj4gPiAgCQlpZiAocGNpLT5wcC5vcHMtPnBtZV90dXJuX29mZikNCj4g
PiBAQCAtOTQyLDcgKzk4MCwxMyBAQCBpbnQgZHdfcGNpZV9zdXNwZW5kX25vaXJxKHN0cnVjdCBk
d19wY2llICpwY2kpDQo+ID4NCj4gPiAgCQlpZiAocmV0KQ0KPiA+ICAJCQlyZXR1cm4gcmV0Ow0K
PiA+ICsJfQ0KPiA+DQo+ID4gKwkvKg0KPiA+ICsJICogUE1DIFZlcjIuMCBkZXZpY2UgZTEwMDBl
IE5JQyBoYW5ncyBpbiBMVFNTTSBwb2xsaW5nIGFuZCBMMiBjaGVjay4NCj4gPiArCSAqIE9ubHkg
ZG8gdGhlIEwyIGNoZWNrIHdoZW4gUE1DIHZlcnNpb24gaXMgVmVyMy4wIG9yIGxhdGVyLg0KPiA+
ICsJICovDQo+ID4gKwlpZiAocG1jX3ZlciA+PSAzKSB7DQo+ID4gIAkJcmV0ID0gcmVhZF9wb2xs
X3RpbWVvdXQoZHdfcGNpZV9nZXRfbHRzc20sIHZhbCwgdmFsID09DQo+IERXX1BDSUVfTFRTU01f
TDJfSURMRSwNCj4gPiAgCQkJCQlQQ0lFX1BNRV9UT19MMl9USU1FT1VUX1VTLzEwLA0KPiA+ICAJ
CQkJCVBDSUVfUE1FX1RPX0wyX1RJTUVPVVRfVVMsIGZhbHNlLCBwY2kpOw0KPiA+IC0tDQo+ID4g
Mi4zNy4xDQo+ID4NCg==
