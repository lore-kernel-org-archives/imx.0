Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012023.outbound.protection.outlook.com [52.101.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE791A256B
	for <imx@lists.linux.dev>; Thu,  8 Jan 2026 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767886992; cv=fail; b=lUMnVU0fP7vVwig8y+5kBVyaIAHbJtD9/WHs2SS1U171PNYVwGBcLf9I9OHd/pxmDqFzgKUGmPRfUPgNnAs3AEdhHg/7xtolbnMnrFBs0ef3E+g2nKhOcm2WAt0igg5bgqtj41y4NYJawpv+cDG5IfvZhpGZIK1onbzPl8dE4mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767886992; c=relaxed/simple;
	bh=RcjplR3Rb0Y4aAjV9eB6GQGRmw3y8BAwIewx2ztqdnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oWPzVU+cf+X/vU5g5RmT16Y3rjtD1GOr57Enf6AhZHMcojlpDwQBaWKFrEyYoekF02coJdoC/sDYKCdPRDe3v/9FQHHAMUv7uA1JKVY07ZsatiekZZk5n04BIhJypZFK8SB8PZA09k/FmttckMwYyOvBC3LNSi6y57tBHK0021E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KtJZu9VY; arc=fail smtp.client-ip=52.101.66.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KtJZu9VY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JV3n7f7Hv+EbJkgefkrHgXQ83g2AvU+AtRMrRLW1n5jeP5ekjB5FK6ivYtmZCofJZBehNUVSR4MEVQQVMyxUwmuCdmYLTatIhl6W0O06HA7tE2xVFccvlmjARhO0Scc5YQW4H4So8ie5U4ZSzKYPu1ahgw0rCNquDtLWavZWAiZxU3P/o/D2jXePbV9Ilc99OfmogWtkkpkIvM7wp6a3GgIxDV1RP+cwqXkjbV+zgCEE7u1ovkN+7y3WKFpiggn2e/O40dSbyYV8DSybIRtGypO1W0cfp9k8ogcoz/7PWSwnWZC2RUGGPFm8uRQyjcgf498fLJTg8IVVcGfsCw4Eaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+1T/9ZfCxdJuA9czmjK8nRSkXWvdtcE65nTxe8QuWY=;
 b=FfsMxer/yMLWdfLgUC2c8nzEi3IQB+ymlECn+YDlo20sJ0dd7yGiUDZe0A0nDe4IxJKcEWeZPyFVVZATjWxdkkGyjw1A3rmImyy8i/qphcMePCR2mezpkoIgBIVe+V/EEF59KnO8WDD4g07EIFVU1wCgIb/EIJNlYHnJsN2/FBHSW9uhqQmmpnwtT04RwiNzS7uQqPARoCXqfg+Y0Xn7vN0RKM0QmWMVmt/Prhn+0Irfmo4tPM4isi1hWVnFTYvqRIWzaoZ3ntUBmbtgGxtvKIHdYTDknL8UvPFAlfjt2DRFhvuE9C30RBpVa7WXXJlXr2hQwu8KElsblu9jBQ+u7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+1T/9ZfCxdJuA9czmjK8nRSkXWvdtcE65nTxe8QuWY=;
 b=KtJZu9VY5W9/L6C9mzjB6u4xy/L6kX9b7yjcAWGticnrPM4KOcpwGCDMeWyMF3aDLSXz4ib73nt0HpWgoZC7u/DF7IyjMQ89u+Za0yqjoe4TMyratyAH/mYyhhxNdWxob3++46LwHONc+ClZxreo1sUGN8ubEAcu69xHMxP7usH0f4k2/jNTXse8EcL4WBXAvQ2PTgbFEGfqFPaVoQ1mmfo8bXoq1CeiAE77Zm2FoEbED2cuNEiCqLKACyUYJCc6O5XEaWGc4Im2dznaTLUMe2mNfq8WAxCtTcIa5fNRLtxAGiBLFgKzvu0v8/Q21naq72Lg8S9E8RrOGFmwcDVibg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB10576.eurprd04.prod.outlook.com (2603:10a6:10:58a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 15:43:08 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 15:43:08 +0000
Date: Thu, 8 Jan 2026 10:43:01 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <aV/Qha0CQ+LJHo76@lizhi-Precision-Tower-5810>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108083641.2119616-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH7P221CA0036.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB10576:EE_
X-MS-Office365-Filtering-Correlation-Id: a5534eff-e2a2-4f0a-1049-08de4ecc9f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGM3RGkwUmZvTElpT3VVdGx1dmpsSWt1MVJ5N3l5cVNOM05wVitXdnlVSmJG?=
 =?utf-8?B?WHY2OEF3WTlHam90c2IyZEdJeEhaWGVXZ2xTa3BIWXJIeG1KRDNFUksrM0tm?=
 =?utf-8?B?UU1pTS9meGFEY1RNdmJGNEIvN0dXbzQyYnd1cVQwV0U0MlFRbzAvVUM4K0dZ?=
 =?utf-8?B?Si9aVEg3TEpIdUxCLzhnRFRBc243VXFLY2RGTDJXczMrYUdRZmFxbUtNUkpl?=
 =?utf-8?B?RmF3cVZPYldrNTVBQVA0Y2IrRXBNWkZaSDZyTjcrZSs3Q0dia0RDUWZLaFp4?=
 =?utf-8?B?TFM1RWQ0bzQvVTM2OVJGZit5T1ljVEZjTDAwYmdzMEdaeUJ6bXhRZWNqSkM0?=
 =?utf-8?B?NXlVeFhxdUNyYjMwOHk2L09yNnN2Zno4ZFIybmhEQnJabllIOUo4SjRVUU5I?=
 =?utf-8?B?RFU4VFRxbTVOOUwraE1ReGN0SlJSR2lCMFlRYU5YSjdab1lDRHd2VThwbjVl?=
 =?utf-8?B?WTUrRXE2QTB1VWd6UmJHeFAyQkxwaWVMekxpbTBBZjlFdVRiWVo4ekV5RDRZ?=
 =?utf-8?B?NndjNDk0MzVmMVRZbVFtdmJocVI5KzJzQW1rTjNmNHNVRXdRRy9RYi96ekxu?=
 =?utf-8?B?QmgrWHdCckxWWlR1aWo3TWN4a29jNmc1aXF3bmtuYS9ET0s5SHFTelV3RnBv?=
 =?utf-8?B?bFI4WHAzRy9JaUcvcmwrNjN6UU5ITmxaYmJBVXo1TXpPQWx6NC9MbXhyVkEx?=
 =?utf-8?B?K0NrT1ZITmtyY2p3OTdybEYzMERJelB0Wjc0QWUwN0k3aW4rQ1crQm5HSnNP?=
 =?utf-8?B?SDNZcGlxQ1I3cXRNelpsNWVmL0VGV0lmVjN1R0J1aVI1NjRXOEVlbnhNZlB5?=
 =?utf-8?B?cmN5ZUtKbCtXa0xnRnpZMzdGQko5QjAyWnJuam5oOXhGU2oxcXI2SUg3b3ZL?=
 =?utf-8?B?R3NzNjZVdy9rUWNxSXJSTzNqMEFhb2xUUTBibStJSnl2NEFkU25lakV4YXVO?=
 =?utf-8?B?MEdieXRXaTFLNU9pZVNEcjBPWVdwSlBFYU5OQjQ5SUxzZTdNVTZRazBTc1Nv?=
 =?utf-8?B?RHBuMlNoWERXbW9qcng4NWJHUXRXbmUvUzdPT2puN21TNTBBbmpyUVAxQjQ2?=
 =?utf-8?B?cWdNTlJQU1JXNTRPajNyaHVmNVpSNzI5dEorcngveFUweTI5L1lpNFpOV3NT?=
 =?utf-8?B?OUhIS08yZCtWNnplZFJZY2pqamsxRjA1enZEZnV6eUE5cHA3cGRaRGpjTGlu?=
 =?utf-8?B?cEV5bk1ic05hUkhFQnFkOFozYkdtMVMvUjliU3dYNHo3TElUdVQwaUluSHFn?=
 =?utf-8?B?Q2svNExFS29SR3M2eWJUUFJJZFFHTmR2YUlJS09kcDBSa1dhTnBnL0FOZEZm?=
 =?utf-8?B?MFhmRURyVk93M1R2S0s0aVJuVERzUHZnR3ZOVHQ1ejFaY3NVeVF1Y1o2ZEx2?=
 =?utf-8?B?QVIwakRBVklDS2dieVBtTStLYjYyL1pZc2xDY1JVTEI0OEZzbjhra1ZxcG9n?=
 =?utf-8?B?NUtlbk93VGFVTGc2elQxUy8zZTBjSVlnSFloOWc5NDhGNHI4VFRLNmRuSVk0?=
 =?utf-8?B?YkxnZ2JzRGI1c2JCbkk1K1B4ZU5LTHRqSEM4SG9TWlRXVkRlMys0L0Q4WGpv?=
 =?utf-8?B?NklqS2lHeWloT25xcnFOT2FyS2tkVUtBUU9BYWp3Zis1RFpuTkc3VURqT09q?=
 =?utf-8?B?Tm9zRkkyR0ZPR1FlV05iN0J1SDAwRTVGUjMvVXlMeTl3YVhtd3JCZTFKU0V3?=
 =?utf-8?B?RWJwWkVqSUZDQTBham56VmxLTXJQQVVPaVkvZ1FIRGVmSzhmTXZTL1VWZSt1?=
 =?utf-8?B?Um1PTHI3aEdLY1lzaG5jbjBSazF2WFlGbUxsZTFyN0ZaWmZKSUdDMEVrWjVY?=
 =?utf-8?B?cUhxWGJLVmFhNnFDRnRQcnZWejZrWXhpcnMwUTZaZzRSaFpDTDJ6bkNkQ1RY?=
 =?utf-8?B?OTNQOEh6U250Wis4SUhOSW1oQXluTytYaWZZMzZ4T3JtejFTVThaUmNyYTRL?=
 =?utf-8?B?SlZWMkJLTDBFQ3QvRkt0bnY2QlVQVit1K0FjaDhwZWo0eFBTMmJPOTBDZG4v?=
 =?utf-8?B?M3gyUGMxR3I4Qnh4NEJWUWZmMzJtME92SjNZZGxmMk5VL3JqZGJFcTRPSjlm?=
 =?utf-8?B?ODJsWXFMd1NTMHF3Wk51VmZ0bUFVQ0FtaTdKUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTlBcWdzSEdIOGJ1cmxUUi8raFVKanR6d0VnTUMzM3B3cEdtN3lKOUVNUnFl?=
 =?utf-8?B?RlpndTBGOGFmZSt2VXZYRG8xWHpSWm1xNEFiTXR1S1NVTkVyTFJvRU02MFE4?=
 =?utf-8?B?SWh2bjFidzlXd0w0cDVOZ2FQNlAyYjNGWFVubDBOT0hlUytFbTJ3ZVF0eUZT?=
 =?utf-8?B?dnlzRDE2RWhoZ01tWlZGOUhPT2V5a1h5MWN3VnZYSUhvN3VWajdVTWMza0w0?=
 =?utf-8?B?RXQxWWNjdVc5bzBycExkVVYwMitNL2FnK3cxcmh6SWJDN3J5TnF4UThnYUlz?=
 =?utf-8?B?TmFidjJPcm14ZFlCOWJpbU9XNzN0VTFtUEFWWG04cGNKWmRkbGdhalhYNi9W?=
 =?utf-8?B?MmYxd3l3azVPWVRKekVGVVJiTmw0Uml0TEdQOXRwaUh6ZHRnb1N2ZnpDc1Ba?=
 =?utf-8?B?aTZXTFRLRTJ5Rk05a3d4MGdWTjUyQ1RST3hwUlI4bEdLMUZKWHRLWk5UU1NE?=
 =?utf-8?B?dDdCdDJ2WWJERkh2VktHZVg0NzVGLzl6SHlHakw5Vis3N3hQSThZMGF2MWEz?=
 =?utf-8?B?aWNZOU5SaHAxb3gwZXFna0RIRXdFSlRmdXlJanVSZjJpNFNLakdaYi9TQkgx?=
 =?utf-8?B?VW5jUk9ROUJEVjU2MjRMS1BjVmFOYWM3N2VBclhKeXJRQllnUWU4YmMxUE42?=
 =?utf-8?B?ZUxjWGF2b3g1UFdoQ0c1bHBFL2pyY0VHUjFEZzFIZWEyazk4RzhNR0wzWnUv?=
 =?utf-8?B?VC94SWNoaFZKQVRhUW5pVVlOWkp4Qk41RnRLeFB5UDRDMUNDR0VQRm5rOFVm?=
 =?utf-8?B?OGlUM0oyWkdWNm9hV29ZNjV1QWE3OXk1TDg1cDY2blY3U1V4cGhxTFZFVWNB?=
 =?utf-8?B?S202cWx2YUh2YnJLRkVEdDhHV0czZEVGUXlkZC9qSkhBeFZkTGRLczZaVkhQ?=
 =?utf-8?B?c2wyV1crZ0lmWllWTkp3WUM1aG5GSDUzQnMzb1NLTXFYUUZxRkFYUkIxckgv?=
 =?utf-8?B?TXF3b3RwaWdhSVRvdjNXa29GN29CM1lpek9nQ3BIdzQvYzR5M2taWlhON085?=
 =?utf-8?B?ZkpjQXBhaGpRWHpMb210NkltUUN0VzFwa2pRRHRRMTdOOWVLUFExRCtEOXZu?=
 =?utf-8?B?MDc3a0hOT2hYOGdXY3hWWGwwTjFWR1Juak5WRjRYZkRIYXE4RlpGZ2xLL094?=
 =?utf-8?B?RytrYVBXSnlaVEJLSXhNUi95VVQ0d2dDcTNSd2JGZ0M1OXNBRThVb2RMd25M?=
 =?utf-8?B?dkttSFRYYytoak5jakd1OTVIS2Y4VHhFcGlLZGo4bjUxVFY0VDZqeEc3ZlpP?=
 =?utf-8?B?V1F1NDk3ZE5iVDBGU1AzNjVKWUJ0OWF4a0VVbG9jUldrNlNKeEZWcUhFUnZx?=
 =?utf-8?B?UHNEVERoZVk2cDZhZjUxVnp5SDhLd1lzOFhnM0xpTWtlcWtoenU1aTl3aVN1?=
 =?utf-8?B?ZndFU2pqaDg4K1ViUjJqSk54NHZ4QzlYTEU5NnBmSlYvUDhrK0FreGpnU1li?=
 =?utf-8?B?WnMwU29uK1UrRUdxM3VMWG1jNEtDTExYTVJPeTcyK0RwbHlCc3NiSFFiNGx0?=
 =?utf-8?B?Rzl5T21GMm5Ca1ZTR2g2L2FjM1FDSVhpWTdLVVM4WGVnSGVQREdwdTV4L2VC?=
 =?utf-8?B?RHdWNnJ0c0FGOHJWczRnNE0zYWhpL3lEc3NQWW5xTWl6UjFHaC9Hc0R0Kzl4?=
 =?utf-8?B?VEo5eUkvUlM0dk1sVUlMWEh5bzViWjl6YlhGNnBaMHJOeEdyajJzQU9TNWh4?=
 =?utf-8?B?bEtGVVdNaHdUcFpKcE9VV2gyc0RzS3NmQmxlbzZvRk9vL2xCaGc1alBSNmtY?=
 =?utf-8?B?VldBWFdtMjcwWTZvYnNMbHhxQWx5VkFZNW1ZMDA2eWExN1hBYzM2YVdZVmc4?=
 =?utf-8?B?V1luYlVDNkNqcEFOU3dXbUtwejBOK1lrYnRkQU5wRTdkVUg0YU9TbHMwcFUz?=
 =?utf-8?B?ZDByODM4MHpLczBTaHJLWXZoUjdlYW1ma25lWGFSMUZ2UmZCdjJGOHJiNFcy?=
 =?utf-8?B?YWE0alJjOG1UOFFoWkRLYXIvZFJHendqL0V2VlRrVWxucGxXNnNYTno0WnpX?=
 =?utf-8?B?SlJLVXRWMGVGWXAvVUVQUEZ0QlJYOXhXZzl6ek9QZlhIbmluTU56U2JTNC9k?=
 =?utf-8?B?cnFEZ1piVTl1YVBjRjdsVHIxYjVOa21uZkovQm02ZzFVOHUwUFBXem9TMWov?=
 =?utf-8?B?UXpCQkVzTmM4TlFjSFFRSzNHQ2VoK0VYTC9SbFl6MUxJOEJJbXZMSlBDczFW?=
 =?utf-8?B?T0V6YnQzbEIzTkV5TE8vWEc0RXlVTmFBTVBvYUFNTTQxeWlnQXpMYXZQVWR0?=
 =?utf-8?B?cUJHNXE3aHFHQjN6R21tVm9FQWw1WnQwTWRxMWdiNGxKNFQ4R2dYb0VhYmtK?=
 =?utf-8?Q?W4ax0oNDyJQXoD3rwX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5534eff-e2a2-4f0a-1049-08de4ecc9f0e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 15:43:08.3583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQY/+W8ALSHhETQA2TejPHnghHNG71e7p6Iq0Gqw3UrPdOBagJDbr3IBK7IQF57qWY2dtU7rE/aosrEt4itB2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10576

On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> The CR port is a simple 16-bit data/address parallel port that is
> provided for on-chip access to the control registers inside the
> USB 3.0 femtoPHY[1].


> While access to these registers is not required
> for normal PHY operation, this interface enables you to access
> some of the PHY’s diagnostic features during normal operation or
> to override some basic PHY control signals.

Simple said "Export these registers by debugfs to help PHY’s diagnostic."
should be enough

>
> 3 debugfs files are created to read and write control registers,
> all use hexadecimal format:
> ctrl_reg_base: the register offset to write, or the start offset
>                to read.
> ctrl_reg_count: how many continuous registers to be read.
> ctrl_reg_value: read to show the continuous registers value from
>                 the offset in ctrl_reg_base, to ctrl_reg_base
>                 + ctrl_reg_count - 1, one line for one register.
>                 when write, override the register at ctrl_reg_base,
>                 one time can only change one 16bits register.

how many regs? how about create file regNNN,

cat/echo to regNNN?

or create export file

echo 100 > export, then create REG100, so can use cat/echo modify it.


>
> Link[1]: https://www.synopsys.com/dw/doc.php/phy/usb3.0/femto/phy/x652_usb3_ss14lpp_18_ns/4.07a/dwc_usb3.0_femtophy_ss14lpp_08V18V_x1_databook.pdf
> Signed-off-by: Li Jun <jun.li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v3:
>  - add documentation link of registers
> Changes in v2:
>  - correct copyright
>  - add imx8mq_phy_wait_for_cr_ack() helper and use it
>  - use DEFINE_SHOW_STORE_ATTRIBUTE()
>  - directly create debugfs file under imx phy debugfs
>  - remove debug_remove_files() since the phy core will handle it
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 180 ++++++++++++++++++++-
>  1 file changed, 178 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 95f9264bd0f7..e11054f6673c 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -1,10 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (c) 2017 NXP. */
> +/* Copyright 2017-2025 NXP. */
>
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
> -#include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
> @@ -57,6 +58,20 @@
>
>  #define PHY_TUNE_DEFAULT		0xffffffff
>
> +/* PHY control register access */
> +#define PHY_CTRL_REG_OFFSET_MAX		0x201f
> +
> +#define PHY_CRCTL			0x30
> +#define PHY_CRCTL_DATA_IN_MASK		GENMASK(15, 0)
> +#define PHY_CRCTL_CAP_ADDR		BIT(16)
> +#define PHY_CRCTL_CAP_DATA		BIT(17)
> +#define PHY_CRCTL_CR_WRITE		BIT(18)
> +#define PHY_CRCTL_CR_READ		BIT(19)
> +
> +#define PHY_CRSR			0x34
> +#define PHY_CRSR_DATA_OUT_MASK		GENMASK(15, 0)
> +#define PHY_CRSR_CR_ACK			BIT(16)
> +
>  #define TCA_CLK_RST			0x00
>  #define TCA_CLK_RST_SW			BIT(9)
>  #define TCA_CLK_RST_REF_CLK_EN		BIT(1)
> @@ -118,6 +133,9 @@ struct imx8mq_usb_phy {
>  	void __iomem *base;
>  	struct regulator *vbus;
>  	struct tca_blk *tca;
> +	struct dentry *debugfs;
> +	u16 cr_access_base;
> +	u16 cr_read_count;
>  	u32 pcs_tx_swing_full;
>  	u32 pcs_tx_deemph_3p5db;
>  	u32 tx_vref_tune;
> @@ -411,6 +429,163 @@ static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
>  	percent = min(percent, 100U);
>
>  	return (percent * 127) / 100;
> +};
> +
> +static int imx8mq_phy_wait_for_cr_ack(struct imx8mq_usb_phy *imx_phy,
> +				      u32 stage, u32 *data)
> +{
> +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> +	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
> +	u32		val;
> +	int		ret;
> +
> +	writel(readl(cr_ctrl) | stage, cr_ctrl);
> +	/* Wait CRSR[16] == 1 */
> +	ret = readl_poll_timeout(cr_sr, val,
> +				 (val & PHY_CRSR_CR_ACK) == PHY_CRSR_CR_ACK,
> +				 1, 100);
> +	if (ret)
> +		return ret;
> +
> +	if (stage == PHY_CRCTL_CR_READ)
> +		*data = readl(cr_sr) & 0xffff;
> +
> +	writel(readl(cr_ctrl) & (~stage), cr_ctrl);
> +	/* Wait CRSR[16] == 0 */
> +	return readl_poll_timeout(cr_sr, val, (val & PHY_CRSR_CR_ACK) == 0, 1, 100);
> +}
> +
> +static int imx8mq_phy_ctrl_reg_addr(struct imx8mq_usb_phy *imx_phy, u16 offset)
> +{
> +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> +	struct device	*dev = &imx_phy->phy->dev;
> +	int		ret;
> +
> +	writel(offset, cr_ctrl);
> +	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CAP_ADDR, NULL);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to address reg 0x%04x\n", offset);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int imx8mq_phy_ctrl_reg_read(struct imx8mq_usb_phy *imx_phy,
> +				    u16 offset, u32 *val)
> +{
> +	struct device *dev = &imx_phy->phy->dev;
> +	int ret;
> +
> +	if (offset > PHY_CTRL_REG_OFFSET_MAX) {
> +		dev_err(dev, "Invalid reg address 0x%04x\n", offset);
> +		return -EINVAL;
> +	}
> +
> +	/* Address stage */
> +	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
> +	if (ret)
> +		return ret;
> +
> +	/* Read data stage */
> +	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CR_READ, val);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to read reg 0x%04x\n", offset);
> +		return -EIO;
> +	}
> +
> +	return ret;
> +}
> +
> +static int imx8mq_phy_ctrl_reg_write(struct imx8mq_usb_phy *imx_phy,
> +				     u16 offset, u16 val)
> +{
> +	struct device	*dev = &imx_phy->phy->dev;
> +	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
> +	int		ret;
> +
> +	if (offset > PHY_CTRL_REG_OFFSET_MAX) {
> +		dev_err(dev, "Invalid reg address 0x%04x\n", offset);
> +		return -EINVAL;
> +	}
> +
> +	/* Address stage */
> +	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
> +	if (ret)
> +		return ret;
> +
> +	/* Capture data stage */
> +	writel(val, cr_ctrl);
> +	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CAP_DATA, NULL);
> +	if (ret < 0)
> +		goto cr_write_err;
> +
> +	/* Write data stage */
> +	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CR_WRITE, NULL);
> +	if (ret < 0)
> +		goto cr_write_err;
> +
> +	return 0;
> +
> +cr_write_err:
> +	dev_err(dev, "Failed to write reg 0x%04x\n", offset);
> +	return -EIO;
> +}
> +
> +static int ctrl_reg_value_show(struct seq_file *s, void *unused)
> +{
> +	struct imx8mq_usb_phy *imx_phy = s->private;
> +	u16 base = imx_phy->cr_access_base;
> +	u32 val;
> +	int i, ret;
> +
> +	for (i = 0; i < imx_phy->cr_read_count; i++) {
> +		ret = imx8mq_phy_ctrl_reg_read(imx_phy, base + i, &val);
> +		if (ret < 0)
> +			return ret;
> +
> +		seq_printf(s, "Control Register 0x%04x value is 0x%04x\n",
> +			   base + i, val);
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t ctrl_reg_value_write(struct file *file, const char __user *ubuf,
> +				    size_t count, loff_t *ppos)
> +
> +{
> +	struct seq_file		*s = file->private_data;
> +	struct imx8mq_usb_phy	*imx_phy = s->private;
> +	u16			cr_value;
> +	int			ret;
> +
> +	ret = kstrtou16_from_user(ubuf, count, 16, &cr_value);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx8mq_phy_ctrl_reg_write(imx_phy, imx_phy->cr_access_base, cr_value);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +DEFINE_SHOW_STORE_ATTRIBUTE(ctrl_reg_value);
> +
> +static void imx8m_create_debug_files(struct imx8mq_usb_phy *imx_phy)
> +{
> +	struct dentry *debugfs = imx_phy->phy->debugfs;
> +
> +	debugfs_create_x16("ctrl_reg_base", 0600, debugfs,
> +			   &imx_phy->cr_access_base);
> +	debugfs_create_x16("ctrl_reg_count", 0600, debugfs,
> +			   &imx_phy->cr_read_count);
> +	debugfs_create_file("ctrl_reg_value", 0600, debugfs,
> +			    imx_phy, &ctrl_reg_value_fops);
> +
> +	imx_phy->cr_access_base = 0;
> +	imx_phy->cr_read_count = 1;
>  }
>
>  static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
> @@ -731,6 +906,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  					"failed to get tca\n");
>
>  	imx8m_get_phy_tuning_data(imx_phy);
> +	imx8m_create_debug_files(imx_phy);

where remove debug fs?

Frank
>
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>
> --
> 2.34.1
>
