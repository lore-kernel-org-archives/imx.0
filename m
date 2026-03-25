Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013030.outbound.protection.outlook.com [52.101.72.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636D23F788E
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774456085; cv=fail; b=B+BzdRoXr/DRAn8b7zEn10Ubf01V6Mn9qH1jBUyOoUlH0SWTlWfOFmSg6nP/OK1wd86uHw/FDkR+s+OvkBlMAwy4fYroCPEwuSE4+YkWx+fDc641Zqx8knzmW2s+BlafljmOVab6JBzeLBQo7rIn4Afm/Fu0d5FMcUgeU+Jnwv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774456085; c=relaxed/simple;
	bh=Tx7M0kzu2wrBKsurwujnV6VmmTr2MrhwmuZzjDX/HIY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=X38NDM4ImvKA9wAKryMmw4LgyYE+zUPJb78ZAjuABMPFydbVy9mRc5/Y7fofbkDTE6enL7JCtnN/iD7oLaZIIxQ6zxdzX7tidPiZebPLy9hcoFyQEwHbsO9ZgZ1snluB0ETAtNHHyBy8Bn6lrPtirHnMqDSnrPVZ3+Y7bEUxjKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EsKykfvI; arc=fail smtp.client-ip=52.101.72.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EsKykfvI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqEQgjCr+tee9UQVGL0ZI20sOl4ukZBgAhJnA/GAq9yn1zERNQ1FsW+MkJZU29HDzbYHg7hwLeXtBWQ6QIv/hMCTwcEc4ViEPFbW2IVBxV/vk07+nUmpR2IVsluMAWyncQIiDe5ZYskZV2LtUoTmGLfBGByrQKfhh+ByozHYYN0xsom3F31ZfDhSD6oLHVRE/MN8jUtAKRRorNoBWioQGsvqvDPNbh2XrHdc2PlNZ/WchBGJBcTd7jqBIRX1S0vb1Z/tqy7XbIPAmwr/mEz0JFJW8K3Ul+hv+VdNiMZMYDzf4JoR8/gY2ZWW5oNYlKbrtrvgYsSxSAGi2xOAd7KlfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufAT/FhBOZZoz0jFT2zXHvr+mBEe/u91vID6eiNzE9U=;
 b=LKTXlXylhiQTiyfcrGgIvRvpb2HPdZuvU0gWxaL9L6soJYqni3umr6IcGsvnMwAWlSwc47CiUesQvEhWigXZQPb29WL0I6A9372A6W1gQaYpVo3Jm/CMuq7605UM2fXYM1P50umVTTv9s4bndfLVfU2XtP7LNcH2SvPx6/WDXkvYAzHBG3STUUJe2XWv5IRzTx3sCDwuyC0W3lafbvxmmaxA+IrYg2n5/LNzwHW05f1IBULeRycMZ9eXX9fm6YN3jw//bLvXIOsOygXwbMXMILrt0Eij+U0fsgYELU1KHDTV34F6TY/GcHkTY/2k5/v+y5+kT4ikU4AF3uqvxI4hJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufAT/FhBOZZoz0jFT2zXHvr+mBEe/u91vID6eiNzE9U=;
 b=EsKykfvIPyfP+vwPTyKowx6o/hZyXoRS1DUIfPLDxJKqZsNrhGGv0a/catCcTx3HYVqcjkhybl1DAWK4XNGUFNYZSXvQXUU85v/1q6jCRxOuoGDHCVbNPyGW/VHIAAMTvVO5BC4IzpnaLZ+TYCRvKhWnV/1UxDKsbZA3NSdTqPR/rUbZLiiBSSayyImRh8vTwsCTCdLkVtfO1QHL85styVFae4CUqasJxC3+7nV4idybhdnBDT/qMoMbzU8/ORXXAP5Uhmv9HN4Ko3tLPXsL2NgAJecQPzHbOUXmXlL5kDs/Gw6bpPtGPYDm6lHzT2BuNCS0Hw/EmcdlxBZvYQv8Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV4PR04MB11291.eurprd04.prod.outlook.com (2603:10a6:150:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 16:27:58 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 16:27:58 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
References: <20260325-verdin-imx95-upstream-frank-li-base-v3-0-b2b5221a8077@toradex.com>
Subject: Re: (subset) [PATCH v3 0/6] arm64: dts: freescale: add Verdin
 iMX95
Message-Id: <177445607381.3141305.13416954574124381215.b4-ty@nxp.com>
Date: Wed, 25 Mar 2026 12:27:53 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: BYAPR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV4PR04MB11291:EE_
X-MS-Office365-Filtering-Correlation-Id: d90027df-40a8-40ff-d192-08de8a8b7986
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|52116014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 eyzNT/y7fRWlihHry/FAOGpw0CJgmj7JOPItoseQacI0gjygRN10FcNN2ua+hpCTub+YELmsLEEfQHl9uf1HFcVU9wMkZ5rFUsi5Jg7c8PueaKXh9a3TXoaPyjGYCNM/PanCIrfNQzHAiucvcmTt2EYGc8G02UR7gYASuTSUHPooVBFiJsn8WasjipQ96wSiS+SwTi+PIDbHJdLhluc5WzTbM9tkGDY5iYDZUmBnVgRmQjnQ2Uzs/LhgdD7HX98ayx3xrVmtz1+Iiv8mRh+enYOAMaItry8SeqBGCp2zEheTr8yh+nUJBk6rU9BJb5tQR0Hy+DcbSag193Qax9ZzSeV/c3BqUiGpXBLlTMMAu3Go8Ue459rDkc5F9Q3nUmGO9dMA70jg/asOAzFYQe9ZCHNMpkBkv4cu5pVYiStMIu/oFROyYkVWnTR7LakiBchE8WFNBbl5Tbz4LxDL4aMUZFrmsrdwTkcSWrdrRbYs7wfqBFZwMrZJE8eMq9YVIK6U9QxGVJ0AvJPz8HUMCDEwYCsN5RwoQKOBbU161VHTs3JWjNvAvfiubE1Roj0CjUnE1QgI7eOal9HHRvCK8KG7GzhyXiHxBeW8Nwnv/SIlpLIwstJshkDgkOchLw77mUwo7ZAir+95MEMWrzq3nKlhXCeTgnE8k7mGZcdGYNxKwm5UAa2p32A8niPKAsbCxtuYhVAaw29rUsDzR+VbbcqZUMozNkbBsL+AKYw7QpTa9+lkYTi0WOZ9KboDh78L1WVbFDkwARuWQq2avgSBhXuJkWYqc1aY45Fj4Lt9Tpdvhsk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(52116014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?czdlSVUzeXAvNDRkK1hUOXdsRGVINzgvNFVvRC91R2N5ckw2M2Z0L2lCdGRp?=
 =?utf-8?B?RUVLakVMZUxVd2pMdjIwOFZYYVpEM2VpelI5WnhSek0zcExCVE0wL0tZcFpM?=
 =?utf-8?B?Q1pKaXl2YmdTQm5PaUNVSW1HUGRzM3Z6b1NMY081VnJYeTM1QU5EaEs4bEhm?=
 =?utf-8?B?M0l3YjZUQWx0Sis0bkU0bUxEdkx3R1dVK2RaOEpCbW1uRWNrK1Jqd3VGc3pK?=
 =?utf-8?B?SHJsQm9pTUZFMDlvYXNwTm9POURzT0MyM2JxSy9oVFlFTHNrNTNsOCtkOVpX?=
 =?utf-8?B?bE5RZEFsY3hibzMwNi9zOWpGNVJhZVRDbEpPWXdKdkxHL08yVy9Nd3hYWEJO?=
 =?utf-8?B?WWxYM1FBeXNwRVRBMXpzQXhIY3hBUUJPVHpnM1UvWk1VR0pWTEhKZEVmQ2g4?=
 =?utf-8?B?R3FXUFl0T01DSzFNdm13VlM4V1pOTDRjemo1WmdpRFZLTEM4Q3dTbVA4QnlJ?=
 =?utf-8?B?aS9WN0REY1N5QUUzRlFhK3ZoMDVxdDJzeUR2a0FzVVRVdEVhZ3VoeHFYL3VO?=
 =?utf-8?B?MDBNZ0xvbFRNeDFEdjhOdHVRWlBoTFYvNkpkWmEvbWpBL1VWdU1MV3RNcU9j?=
 =?utf-8?B?UEpyOGNpMkw1Wm4zbjlIbVc4emlOVTJyd2ducC9EaVVhNGEramlMSWJaVmlt?=
 =?utf-8?B?T0NPVEdZVnZSZnZXSE84K0x3c3pHM3NyN1dsWXU3VWVpK3drRnZnaFpLS2Qz?=
 =?utf-8?B?cEdYSWx3b29LTHMyVHcybTBXQzhkQ0wvekFOZzFSZHk1QVFscG81VDhBNXZ6?=
 =?utf-8?B?NWdva0hUTkhSbXdjNkFGSzdLRGtUVHhRUEFRS1pCTVhrVUE5ZWRiaEdnTmIy?=
 =?utf-8?B?S1BBekp4U0NkREh4d2hkQlFadDgxVlpYNk1DZWFTTHRDeDhpY3hzUGIzZkQ1?=
 =?utf-8?B?dDRXUTlHU1pkMGNrQVBSWWJ1ZmVuQ2dYeU4xb0VRY2tSVWhOT3NGb3FocktJ?=
 =?utf-8?B?RVB5K2N1UzYxN3VJTUFUclMyRGkyTVpibEcwTlBMYUdweTZzOGd0Ynl3ZmNw?=
 =?utf-8?B?SHd6eG5CUDBKa2E1R2xlWG44K2cwQW03YkhJV01zaCtCcE5zaFRRbFoyZEM3?=
 =?utf-8?B?ejZxMnBjYkQvV1JMWXJrUGQxMjFFTGVlbGs4dC9HWDI3ZFoxaGtWVXRBbW80?=
 =?utf-8?B?OE01b0MyNGZQN3FSU3lHb1lvUXU5YXh5NERRRjRnTmI4Z0k4djRNZFp3Z3Zx?=
 =?utf-8?B?YkR0MkthOVJ3aThqSmJiOTVEMENaNGlQb1lnM2svaFVOSk9FbERhbTVtanZS?=
 =?utf-8?B?U0NvS3FNNzFqQi9YQXpGQSt3M3JDME0vSkNRektEdjNBa2hrNHg3dGZwK2lv?=
 =?utf-8?B?QzFzc1NXQktXYlFhODRHbjkrZ0hLTXphTVRpUXVwMFhQRjhXcU5PUUw0enl0?=
 =?utf-8?B?Mzdhb244bVBvRS9jcnhTemRkQWF6b3dhcEp6RkpqOWl0SU5vUGc4SzRXbGFs?=
 =?utf-8?B?bStvV3Mxc2JXRXVZVDFtWGtkY01YMXNHbkl1WS8zYlAzdlpsN3RvSjl3U1hG?=
 =?utf-8?B?K3JEOUJQZmxRckEvcVdoRENEcXFpUkpOMy9pRmVqVmswandFTWRNNFNlejhN?=
 =?utf-8?B?WW02TlpqVW9DVWlaYVpkcGovVG9oOW8yc21YNEtldFZSVjRmdUh0Ulp0cGt1?=
 =?utf-8?B?aUlDOGlycFJSMk12NUllTmFuNG80ekFCclBQQ29KeG1ISmNscEI0bHZONlJR?=
 =?utf-8?B?d1hsMG8vUFVUWXA3MWtrRkdVb0NVTktkSVpQTDRDLzhyeFBSR245Ym9VK25T?=
 =?utf-8?B?NUNoVnlGTDAvOEdhNmlaUzlWa0ZXMk81RTZOV1ZMNzFHZEtzM2JaWVFBWjVJ?=
 =?utf-8?B?WW1UK3NJNDdkVUNtQUZQNWtnOGhTck5LamxCeVNLeVpvVGFYalNINVBQS2hH?=
 =?utf-8?B?VGFzZmxZNW0vWEh3TThBOE0rVE1QdG12WExTN21DZnNCOXNwejRKYk5CeCtS?=
 =?utf-8?B?blI5K0hNNWxQUVNkU0g3b0hNMmlDZE9BdCtnRXpoTFNjNkJGeXYxcjJXMS9k?=
 =?utf-8?B?aGo4M092SFZPbEpLaHM5N3o5Q2paR3k3d0haVkRtTXc1b3o4OVIxSFM2RDVn?=
 =?utf-8?B?aUppRy80YTloWkE0VVE3M25WQ3BGN0NCOThzSFZKY1ZFdytFaWF0bEFZWllk?=
 =?utf-8?B?VExVRXdzRWtjaTJzQ0lGU2dVblNldDVqY1RXOFh0b200ZFpVUHB1N2hSYmg4?=
 =?utf-8?B?SU9RZ2tTTS9QcDBTSnFlc2xvYTVEVTUwekNJRklRQ040TW1xVE12eFRoYTVp?=
 =?utf-8?B?bWtnay9kMWZyamlodUVSa29sYWRJZGhOSk4rQ3JKZlhTU3hlRG53Vm54RXd3?=
 =?utf-8?B?d3Fwb1BnaUVyN1pCMjF1L0owdVBVRTFLY2lHeHZzS2gwOG9VMVdIdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90027df-40a8-40ff-d192-08de8a8b7986
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 16:27:58.1894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFvGjxa1ETdBled3vDY5bNtybDtGqxGxILPxUV0i6EqXd8cIBnvLPnbWk50SquGwuWwrcOUKHIdI9vuyIneV/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11291


On Wed, 25 Mar 2026 15:46:01 +0100, Ernest Van Hoecke wrote:
> This patch series adds support for the Toradex Verdin i.MX95 SoM and its
> currently available carrier boards: the Verdin Development Board, and
> the Dahlia, Ivy, Mallow and Yavia carrier boards.
> 
> The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
> up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
> I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
> interface, one LVDS interface (one or two channels), and some optional
> addons: TPM 2.0, and a WiFi/BT module.
> 
> [...]

Applied, thanks!

[2/6] arm64: dts: freescale: Add Verdin iMX95 support
      commit: d77901ff827c6583563d4b24b34efb795b63bdcf
[3/6] arm64: dts: freescale: imx95-verdin: Add Dahlia carrier board
      commit: e69a8fd8827699f9de5ec0e092f04462656d40bd
[4/6] arm64: dts: freescale: imx95-verdin: Add Ivy carrier board
      commit: ad37ed93a2b564cb7026faf9a0c9dd01ce566479
[5/6] arm64: dts: freescale: imx95-verdin: Add Mallow carrier board
      commit: 7d84f7fa8293739d71f92270f46079d4d7c5f0a2
[6/6] arm64: dts: freescale: imx95-verdin: Add Yavia carrier board
      commit: fd589d6e8b38eb2783980ba38cef9dd5cfc68386

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

