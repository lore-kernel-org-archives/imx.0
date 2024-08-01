Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49D653370
	for <imx@lists.linux.dev>; Thu,  1 Aug 2024 02:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722480772; cv=fail; b=M7kDdkvDParEstkbrmBFB6gVXEQaDtSNxBU664LoVgE7dqnS0wH2RhYrKqKACbf4/LLL01BAzx870ubUytL+CFjE4Z7E4IUbz1T50cmY3SBuygJgAcWTC1gQ2GgC33nHuf6eSWSxr/9W2XzN/46IWAssIACe3mYDSrEzH4ykTp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722480772; c=relaxed/simple;
	bh=mb15EXA8r0jH2FDQBGovVolHpFB2x+xzU7i3wcsfyZo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fzjcHkea7QnaOoyyvGhEIU2W/KjauOpMBQWBDZ8sbxiK8va29rrNiHuDhE8NqTCkbUfbS/7SKidc1/ry1HP39AHLN/78GUh2wVnmWahlGNuf97NZtSUNUlrXGsX7q4c1XSfYPSxuocuEeqmfg+TLBWd8sU6GGCYm0CkKHbbutjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QuCadcEu; arc=fail smtp.client-ip=52.101.65.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QuCadcEu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+APvmK5pjOAHG9BFIAj/3gefJZMJ87JUXgPzvj95izjWBQzpsEDHQWc3URTw18aKfP0z1Su656TJH2Tjf3EQqgDQCnk+TNAlB2QyD7XpxpAEdt3LgcqwFZNFcnQ3AjGKebqBhVq+xgk18cgE32//mBY7lM9At5yE6DKqVNor0Zg0xUQS5BoCMYk/USwSt1nmwY7/dkpy67+pfJhgphHaVNJKpKijRluxCsXZ/rsheeTbLhrQEg5hfuayH2tL4knX8boQWXAdzDrWNYqUFG7pttqhHCLOZjJDWZ1gwVoI61Yk57/cbOmgnDATyW/6sN+Oif5glqV5jfbTO+58nLdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mb15EXA8r0jH2FDQBGovVolHpFB2x+xzU7i3wcsfyZo=;
 b=vBn/qtAFrp+rwDS3KNL2mCOIsGEzuaXllYPKlnfRv9k2IOpC3cbCXUB6eD2HErbeP6PwjLdBu35kddiUdPHwBkKaa0mGUEXLvd1awNoaMfsN2CEq7iu2ZcenAq338YBMf2gz5viXlu2OzJ9pfcxnHaA5HDLVoaaMx+B91wwr/a5eougdizy68E/58XFGuq0N3HxCWu2exK+mvnK8NfLYTTfeBbZxDQsnXbimlgS3f41xomyaRBh0EjQLOW2cki1HiMmIMdgwMcMKVgF4cTBCUQ25HtCH33O66NxZdrJ8I5U8rr5CxAyA7duXUMZ8/0BccFm8+vA3PGJyRigP4cXE7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mb15EXA8r0jH2FDQBGovVolHpFB2x+xzU7i3wcsfyZo=;
 b=QuCadcEuVciLI7iWzIuFGPxpgpMSeji9bmb6l3CTiYcyIo0yQE/g8cWkD7lQ+CvJTLM8zbUKebNCW89XvsBMxKqDnK8l7Z+F3C/0R4ZPWOUIeFJfzWM2FCMTXOo7OVaIh6VA488dXiFlmhxc4/7WVqEoLOI917eM7sbnFprT0M4J7rp09eDbhUI2jLX76Bv7Ef/6ML6Q69/C6vvyDpWcyb/SLO1V23YgVUofg900Bv1mTZEUGoJHsiCDIiO45W6ZIkNaWVqSf4FzcwafQ73D2Nfe4WZ7hM0OXCA5GWOzqJmIC49AwiEDLuu5+VxbaMFjLVXivxnn6a1soMBD/ex33w==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7954.eurprd04.prod.outlook.com (2603:10a6:20b:237::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 02:52:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Thu, 1 Aug 2024
 02:52:47 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>, Sudeep Holla <sudeep.holla@arm.com>
CC: Frank Li <frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>, "Peng Fan
 (OSS)" <peng.fan@oss.nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Linux ARM
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: mx93: No cache hierachy definitions for ARM cores
Thread-Topic: mx93: No cache hierachy definitions for ARM cores
Thread-Index:
 AQHa2HG48+NtuRbqiUKdzQIy5fTxTrH9WIsAgADM/YCAB4bHgIAAT+UAgAAWuICAC7eGMA==
Date: Thu, 1 Aug 2024 02:52:47 +0000
Message-ID:
 <PAXPR04MB845934AD30833EC87C3CD5A688B22@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <bffb5d44-4eca-49cb-8624-e7bcce525fbb@gmx.net>
 <CAOMZO5DDk6eX+Ad9zKZmaEVvRHwFDETwuA=J7366QCRqhq_ZLw@mail.gmail.com>
 <Zpp9kRkEMXkp3d3i@lizhi-Precision-Tower-5810>
 <a029009c-884e-4235-a384-76090e4ccb5f@gmx.net> <ZqEQ4vOVvMIazIKc@bogus>
 <8c4e26f5-cf28-44f6-8b76-c80832cfe1a2@gmx.net>
In-Reply-To: <8c4e26f5-cf28-44f6-8b76-c80832cfe1a2@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB7954:EE_
x-ms-office365-filtering-correlation-id: abc7a1e4-aa59-4d90-3279-08dcb1d5065c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UGNmUDFwK01RcHFuOFpsR0ZZWlVOYmxwVTJyTXcvRmdUdnVEV1MzUTlXVDl6?=
 =?utf-8?B?Vk5EVEx2OVl2SEFib2NPUjlKNE8ycTlNSzNRZnd2ZkIxbkJXNU5kS1BBTVZE?=
 =?utf-8?B?eVFxVm9aQys5cDNrNkl1aVFBSDRYWVZ5NlJaemxORlJTWDY2bDNJUFptSkVJ?=
 =?utf-8?B?Wk5pdzA2UnFMVlNBR3dLc0tBdjEzbnNxbHBMR2I0ZzdGdk9WSTRYZlBKblRm?=
 =?utf-8?B?U1ROakNMU0Y2bGRzVk5kd2s0Z3hZbUgyUEJ0dUluK2dlVUNmeGdubnVycGpV?=
 =?utf-8?B?cHRMS21jd1JIUy9TSkJVa0tvTFEweVUvblAwVUl6cTJxUTNuNy94eW1JOGVu?=
 =?utf-8?B?OWgxYmplZVF1TFBGU1Vhd3l4KzVNanNYcnBHUS9rS3p3UEx3TDR4SnpuSUFF?=
 =?utf-8?B?Q2tYTy9HMjlxWlZLd3NrOWZzcmNHYjVSU0Y0L2dyUTljUVdzUDRMTXV4VlNk?=
 =?utf-8?B?NmRJemNqSFlEVE1reDd5RzVTakpmY0NvZnl2SDc3VDRzeVFMLzFJTW5rZlNQ?=
 =?utf-8?B?eDhYTVBYYUJMWmRhRDJudk9sT2tKNkFzaEJ2RXBYMENDNVd1UEkzeW1TNFA0?=
 =?utf-8?B?QVUzb0hBQWpQV1FSSTE3U2s5NUMzaTZaV2V2Z2RmRGNPSWllZ2kwR2NpcGJo?=
 =?utf-8?B?alNraG5heTQwSWd2UVBqTEk4b3FvQzFpY2VEdm5pY3pQb1M0cHJXdDF2Qm9X?=
 =?utf-8?B?WTExS0MvMmZSSEYvaFQ2dXVPS3ZSa2lBWDlhbzQwWFBKNjVXekRxODRkM09p?=
 =?utf-8?B?TVh3LzA0eFlHYWtuQnl0TEJ4R0x5M0NiTUVwcWZqV2g0LzJHSnFwdXU5UUJ5?=
 =?utf-8?B?NDMyWkQrOFNDTTdjcEZmWXB3dFVqak9VUnFnc0JjbE9PTTJTM2l1cDJxeVhZ?=
 =?utf-8?B?L1EwbHkvQnNIcWpIYStHM1JuZ3Z5K0thT1piSUlTWURYZW9NUFdTZlVBVlYv?=
 =?utf-8?B?YU4vRmdLdytUc1V6YlhHRno1SXJLTUdKcDd5dE5SeEJ4elZpNmJRTGI2K3ZV?=
 =?utf-8?B?ZTcwaTRaQXZoZS82TTlMR1FJUnd0Z2FjNW1nOUh5cjREeU11ejcwVUZ6TUJa?=
 =?utf-8?B?eXBEdkgvclRmaWdnc3BZaFVWN2Z2ckN5Q0E0b04vaHo2SzNtanVneXFkOGZj?=
 =?utf-8?B?ZjJIWkVPNXB6L3RHNDlFcU54QTMrc0ZRa2Q1RGlyZzllSWVodTZMejdXMEZ4?=
 =?utf-8?B?NEVJcFJtTUoyamQxSEdnNGJwOGRtc3BWWldhUzAxdzRhWmVGK2JHbGdGdXZX?=
 =?utf-8?B?Qloza1NaV2FxWDhONXBITmM0STN6cWxxTE1LYTRNVWxqMDRWeFZBS1J3azZE?=
 =?utf-8?B?RHVIVlBTbmJ3bUhZUFhxNFlFWC9sT2ZyQ1Ywb1NOaW5qcUxMRmh0MVNJUWlH?=
 =?utf-8?B?RnhnanMzUGJoeE9uM2xpZzRhWVFKN1dianRIb0lSSFU3WG01V0lyTlIxVmJu?=
 =?utf-8?B?QjJDNzVnSURkMzhqZXZXcWlkTmp0cVQrdkdxY2UxdEF6UjkzdWEvbVRIZjFB?=
 =?utf-8?B?akFxWEF2N2ZNbWpDMEF0c0RMNjVtMHhmTWFxMCt1cWFQRUpkeXNFMWZWaUxj?=
 =?utf-8?B?UklsZllIQ2lzSXpRbXl5OStKVVErcHdmcWxUTndBbTZSblJydEhxcXl2RzRI?=
 =?utf-8?B?K3l1WkNuTXFITG1EZndMeVJXdmIzeXFReHBzMHJhV0xPaGIyMFJ5M3VOdDJH?=
 =?utf-8?B?emtCcGU0SzVKRDM5aVJOQm1HSS9QQU84M052eE04eFpjSDJjYVRmU0cxUTNo?=
 =?utf-8?B?RUVtM3RpZnFkcXptbEY0M20zMFZYVUhzMzZzTEFidXkvM0VsbGdBL2lUQXhH?=
 =?utf-8?B?SHIvcnRDOFlHWDV0OHZjZz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OXRYdC9pQlhGa0U2WldWRmRuODZmRHpCVW5UbHlPZkZVZzNYQUowOFpMaEtz?=
 =?utf-8?B?bW5rUFF5U3ZHNHFoeDdRTlR6MFpoTEQ0UU9lYlZpNmFmLzRRdEpTMHZKcVln?=
 =?utf-8?B?VEEzZzYyS2xsbkhDLzlnR1k0N3Z3NitxUnNBOUxhWVpURnRQMi9aZmIzb21Y?=
 =?utf-8?B?MWdpcXkzeXRMOU9VMFcvU1UzSVJNd1pielZDSFpZcmRTd1orc25uR2pjdTVx?=
 =?utf-8?B?OHZjRWp5WC9hcjE1SVM3OFFQZThPQXVWTUFmaEZTUFRvUmh3YWc0a2dlWG9l?=
 =?utf-8?B?eWJ3ekRQdXlwczBaTjU1K21Gc1J3TCswUlQ0K1Fzb2s1Y2lab1BCelVENkps?=
 =?utf-8?B?ZUJmd3M4THdUWkhNNE14a3AvdTdGYlB3c29GMnZGaFBoRVJXV1p6d0V6V3Y5?=
 =?utf-8?B?V2VkRm5DQUZNdWFnaHBuVmtkVEI3cmhMcWowbTRsSEd4c0hkdmZSUDVSbmRu?=
 =?utf-8?B?VlMxRmJJSTEvN24raTlRZENSSlFyNXY4bDg0ZDZudFM3UFhsOHNLR0E1LytV?=
 =?utf-8?B?MFhBOWRlUTdtcmwwZCs0VldkbDJVRnlIZGg4bUsrdU83L1NINlk5VjJDbjlw?=
 =?utf-8?B?MWp2eWdWUFdwN1VUMFFGREsrcmNuNE9mOGluK2RlRE1hSG5DSGdLYVlsc1l3?=
 =?utf-8?B?eThMMjl6OFNHbnptK2FieVhUNHFsWGJXMWljbjJMYVN5V0pkdi9PN2N0QnJ0?=
 =?utf-8?B?NHNlUFd4UWgrN3pWNzhObi92K2F2d3l1ZTMrMFZuWFFkbC83a25CUDVFTUpZ?=
 =?utf-8?B?TkFVanVldEs3LzlqdVVQTndod24rVzVqMWswenpyK00zTmp0dkdhQ3RpVmZD?=
 =?utf-8?B?VXVadkEydGIweVF2OEVia3ZJYkltQmk3TDdLNjVFN2dPVGQvcTM3bEpRaUlO?=
 =?utf-8?B?QU50b3lZUGtOQ0Q1SDI5QlRvQ3lMamNucm5XY2Joa045L1dJazd4S0tBbkJR?=
 =?utf-8?B?TTlWcEZnNTFrK1pOZ3ZueHRrY2pBRHFucUFVRUU3VWJucVlMQnpWMVI2QUxZ?=
 =?utf-8?B?U3ZwM3lGb00vU3NGTUF2dWVsYmxvVDRsQ2NHY0JibUZFbkhqSXQybVlaVU1r?=
 =?utf-8?B?WVNybCs3MzhKZ0tqdnpZOWQxcndNdmY1Sm5CUE1KUXpRSDd2MGVEbGVhNnhs?=
 =?utf-8?B?aGg0UUFUUUFYclhBMjF0M202V0ExRHBHcEp2a2tNVXVmL2d3eS9oWlg5b0xW?=
 =?utf-8?B?RVNybUVMVlZhSUl5Sk9qZURMUTA4UHNZZHU2cHVFRkdPQlRKd2pONEF3RWRa?=
 =?utf-8?B?NkhjbVNBcFBOSDBQTHFoU3RzMEVkM2hKT3ZxcHdMNEFBV1hYdkpxemlGeTlq?=
 =?utf-8?B?bXZBU1E1Y3VyblN1VENGSDBxZlF1RUlTYzFnTkEwaE1udE0wcnlKZk5BWHJi?=
 =?utf-8?B?SzlQSFRZTG5PNEVsUEY5QTljQnQ0VWM5V0gwMWc5WVJzeWtTMGJzNEx1Vklm?=
 =?utf-8?B?My93QmRoVlByUE1TSWNLYUNPOUpoNTBDbll5WUdjNFNvZUFPZVR4bGVsQUNJ?=
 =?utf-8?B?QldUMWhEem0vNXVMTWlsSDk4NTE0d2pVVjVUWThYdU5kb0UvTjArelg3Rm0y?=
 =?utf-8?B?akovMzQ2clBTZVhpa3pRT0hxNERxRWdMTFlycGgyWVlQUDN2YWhpcW1QSzE3?=
 =?utf-8?B?WkxLVXQzWEVGRk9FRHcvNWJjNzQ0b1dPNEFKWFNKVXZWVjlacll5VjBmU1A5?=
 =?utf-8?B?SU1VanFhVjZCNDM2VVNUMUx0WGYxVmlzRTI5enViVlEvTG5xdXdjTmhQWnA0?=
 =?utf-8?B?UGlGQ2lQMC9ncjVlaUNOMEhFaHpTL1RBVGo3QmtlMTBtREdyOE5DMGZFVUc1?=
 =?utf-8?B?WTdROTdHR050WGRDTU1JVWlJMFJidk4vZkVmd2d5cW8yaHl5MitXTE8veDRN?=
 =?utf-8?B?SVNKU0YyT1ZXNWV1cVJaakJSR2hmeGw5c2ptcmdDd0NOcDZrU0dadWRCWUVM?=
 =?utf-8?B?eUNCeXNrMnU1Q3pxNGZTZ0NwT2FSMTBjR0swdWkzOGVsTy9Ub1lTangzSVdz?=
 =?utf-8?B?YzA4anB1b0dOelJLMWRDeGMyV2hkOVEzd3JzZXNLSktjQTMwSm5iTzdRckpa?=
 =?utf-8?B?RnE2TnF1QVZjREdxQnN2YXREcHN2ZWpLKyttUGpMcyt2cXNqV2kzR05rSjl0?=
 =?utf-8?Q?D934=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc7a1e4-aa59-4d90-3279-08dcb1d5065c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 02:52:47.2585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YGBeyf49dKCqZ3b1BpRYE3A5skvSVVf1jJm+cYl198QtwdsbXE8xbAGetyiVtkJZsqTjZ9Cv1uZARxEGy1gAnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7954

PiBTdWJqZWN0OiBSZTogbXg5MzogTm8gY2FjaGUgaGllcmFjaHkgZGVmaW5pdGlvbnMgZm9yIEFS
TSBjb3Jlcw0KPiANCj4gQW0gMjQuMDcuMjQgdW0gMTY6MzQgc2NocmllYiBTdWRlZXAgSG9sbGE6
DQo+ID4gT24gV2VkLCBKdWwgMjQsIDIwMjQgYXQgMTE6NDg6MTNBTSArMDIwMCwgU3RlZmFuIFdh
aHJlbiB3cm90ZToNCj4gPj4gSGkgRnJhbmssDQo+ID4+DQo+ID4+IEFtIDE5LjA3LjI0IHVtIDE2
OjUyIHNjaHJpZWIgRnJhbmsgTGk6DQo+ID4+PiBPbiBUaHUsIEp1bCAxOCwgMjAyNCBhdCAxMToz
ODoyMFBNIC0wMzAwLCBGYWJpbyBFc3RldmFtIHdyb3RlOg0KPiA+Pj4+IE9uIFdlZCwgSnVsIDE3
LCAyMDI0IGF0IDI6NDnigK9QTSBTdGVmYW4gV2FocmVuDQo+IDx3YWhyZW5zdEBnbXgubmV0PiB3
cm90ZToNCj4gPj4+Pj4gSGksDQo+ID4+Pj4+IHRvZGF5IGkgbm90aWNlZCB0aGF0IGlteDkzLmR0
c2kgbGFja3MgdGhlIGNhY2hlIGRlZmluaXRpb25zIGZvcg0KPiA+Pj4+PiB0aGUNCj4gPj4+Pj4g
Q29ydGV4LUE1NSBjb3JlczoNCj4gPj4+Pj4NCj4gPj4+Pj4gY2FjaGVpbmZvOiBVbmFibGUgdG8g
ZGV0ZWN0IGNhY2hlIGhpZXJhcmNoeSBmb3IgQ1BVIDANCj4gPj4+Pj4NCj4gPj4+Pj4gTWF5YmUg
c29tZW9uZSB3aXRoIG1vcmUgaW5zaWdodCBjYW4gYWRkIHRoaXMgdG8gdGhlDQo+IGlteDkzLmR0
c2kgZmlsZS4NCj4gPj4+PiBGcmFuaywgY2FuIHlvdSBoZWxwPw0KPiA+Pj4gUGVuZzoNCj4gPj4+
IAlTb21lIGluZm9ybWF0aW4gbWlzc2VkIGF0IHB1YmxpYyBSTS4gQ2FuIHlvdSBoZWxwIHRoaXM/
IEkNCj4gZm91bmQgaXQNCj4gPj4+IGFsc28gbWlzc2VkIGluIGludGVybmFsIHRyZWUuDQo+ID4+
IGRvZXMgdGhlIG9mZmljaWFsIEFSTSBkb2N1bWVudGF0aW9uIFsxXSBwcm92aWRlIHRoZSBtaXNz
aW5nDQo+IGluZm9ybWF0aW9uPw0KDQpBUk0gcHJvdmlkZXMgc2V2ZXJhbCBjYWNoZSBvcHRpb25z
IGZvciB2ZW5kb3IgdG8gY2hvb3NlLiBJIHdpbGwgZ2l2ZQ0KYSBsb29rIGFuZCBwb3N0IGEgcGF0
Y2ggZm9yIGkuTVg5MyBBNTUgY2FjaGUgaW5mby4NCg0KUmVnYXJkcywNClBlbmcuDQoNCj4gPj4N
Cj4gPj4gWzFdIC0NCj4gPj4gcnZlZD0wDQo+ID4gSSBhc3N1bWUgeW91IG1lYW50IFsyXSBpbnN0
ZWFkIG9mIFsxXSwgYXMgQ29ydGV4IEE1NSBhbmQgTTU1IGFyZQ0KPiBkaWZmZXJlbnQuDQo+IFNv
cnJ5LCB5b3UgYXJlIGFic29sdXRlbHkgcmlnaHQuDQo+ID4NCj4gPiAtLQ0KPiA+IFJlZ2FyZHMs
DQo+ID4gU3VkZWVwDQo+ID4NCj4gPiBbMl0NCj4gPg0KPiBodHRwczovL2V1cjAxLnNhZmVsaW5r
cy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkYNCj4gZGV2ZQ0KPiA+
DQo+IGxvcGVyLmFybS5jb20lMkZkb2N1bWVudGF0aW9uJTJGMTAwNDQyJTJGMDIwMCUyRiZkYXRh
PTA1JQ0KPiA3QzAyJTdDcGVuZy5mDQo+ID4NCj4gYW4lNDBueHAuY29tJTdDNGJiZTcyYmM4OTQz
NGMwMTU2MjIwOGRjYWJmOTBjNWYlN0M2ODZlYTENCj4gZDNiYzJiNGM2ZmE5MmMNCj4gPg0KPiBk
OTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzODU3NDMzMzM0MTI5NzcxMyU3Q1Vua25vd24lNw0KPiBD
VFdGcGJHWnNiM2Q4ZXlKVw0KPiA+DQo+IElqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklp
TENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJQ0KPiAzRCU3QzAlN0MlDQo+ID4NCj4gN0MlN0Mm
c2RhdGE9clhGM3ZBWDlwS1h2JTJGQW9LbUNtYjVLMVhQRFB2dTJlM2FBcTRqelI2Rg0KPiBRRSUz
RCZyZXNlcnZlZD0NCj4gPiAwDQoNCg==
