Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012050.outbound.protection.outlook.com [52.101.71.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510E20C028
	for <imx@lists.linux.dev>; Thu, 23 Jan 2025 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646737; cv=fail; b=T55+HCbltrju8Q1icCiutnzowvlyrAceAFVcHiJCOWS+EixFOtLHIrxGTWPxwNRmVQ6s+zpWZ1RcnNci6Cert8cb272lPILj0xTKkIP4TKjdey/CMopjL9fX++RzguB6H3IJYNARYQHKDXth6dKA7jtyR5SmmgynsaERQJAGTI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646737; c=relaxed/simple;
	bh=DWJ/oSPZzbvfsEy3tNeqhzqZ3I8+KHpuSoEAt+4wdNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=se3cVXfRPEyAPFNvF+ri4nKgEzs50ek/s71a9x+q/ivoNHwplxnolJPHMYNae/sLrqqca9BC4i5IqFh1kMWXfDXStVw47i+gTughD3HqnMGNntiYYRWuXnFM5hArt5dsLoPzmzVCYa2ztOkmINaGdRoU1mG6OFigRAieTGjowTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PzT/ml7M; arc=fail smtp.client-ip=52.101.71.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PzT/ml7M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxja3DXzZfImB9Lu83UAn8KXuNg8u080DGy9lBOBiVeEpkERPrw0LJYUA4GEjlfwMZhSOeuOcwC11UGHzmmY8fLXGk/BH2y2LZOP5Hh7N9dr/awtWy+fY9Au4fc/CHgQlqB+YjgOZf7dNwYAmuVcDUF7ryKAuTnb93e/aTP6nD4jwMSJxoZ9ZeiFH9NG+4LjrMgxIDrHpka3qaAuiC2spxMuKen0hqcyX6BttuWzq2BCv9ac6BLaeR6to61xaPO2dBIHMSpEfK+wtSGC8iBcaZe+N+sYITA0/+uHDlFhDsQVpbMLlzSVWA8BIE9TykOmCUAXOB/19Z11SG9YhFV++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G963kDD294MhgjbicF7R+n16YPM0npVeaMBwXUPFb+Y=;
 b=gakqB4VfLkD4yE4GfXCLBSSerk/1eQyTl5oNOY77LB8gIRownZWPq+wql3gGxQDoquQhrK5pqewc5KTx6x6EkZ86QmrsOMsA0FtMBfzepa5haN2oQ7tBZD6m+WWMcY/B0x3CpbJWCOvab68Ngd6foh9dC/YwZENXyF2Na9NsUVifYzWMYRSdYAq92SwAvscOwZ/mJEMqSzNKh7f/VWJburkEtE8xMYCW2tvJqV8imi8sojrLUBt+P0B6zBbpoci71GPMw1EJNG91d0kfc05zWjOJbxIv1TiDPBrZYQJS+Pe5wb8sFiEN6Ufv64Oh3Vw03md+BOLfuR4LzND/ePJd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G963kDD294MhgjbicF7R+n16YPM0npVeaMBwXUPFb+Y=;
 b=PzT/ml7MOZbKPqsBZJClItfv3xaZE18SOMNUXdsxLNSW6rhen6DLBrk/1yTysw0vsR12OfWo5O4B/UJ4vsv0N7MxPubXkIBYqY1ruEevv+BhBUtJgFJfO1L/gUgfALgu56twzPrfTQIJCJimKCUwgfpml7LphoGW/7silbW7Lwvb4PdXiDkSb9MWPQmDIAmDzbAyRW8IIKbWOmMN3XVIYY8G07qASi/4pbytyykTX1ddF9/sxUE3GGbPE9rmQfO6W8SxVAtkvGgm8KPl/9UQQMfbed6bjuTQHf+l8oM3Yd6LYLkFg8il9TzL3t85cEGgtvDJyW2jgrSZFVLvtRC9XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VE1PR04MB7440.eurprd04.prod.outlook.com (2603:10a6:800:1b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 15:38:50 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 15:38:50 +0000
Date: Thu, 23 Jan 2025 10:38:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, robh@kernel.org,
	krzk+dt@kernel.org, broonie@kernel.org, shawnguo@kernel.org,
	conor+dt@kernel.org, peng.fan@nxp.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
	imx@lists.linux.dev, Liam Girdwood <liam.r.girdwood@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH 2/4] ASoC: SOF: imx: Add mach entry to select cs42888
 topology
Message-ID: <Z5Jif6CjuSaXfWSA@lizhi-Precision-Tower-5810>
References: <20250122163544.1392869-1-daniel.baluta@nxp.com>
 <20250122163544.1392869-3-daniel.baluta@nxp.com>
 <Z5FNHnwvN+KeUrFY@lizhi-Precision-Tower-5810>
 <CAEnQRZDcjwK39Ed00+mJw-epcUw2BV3snXsOBQ6-Mk-DXaxCdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZDcjwK39Ed00+mJw-epcUw2BV3snXsOBQ6-Mk-DXaxCdQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VE1PR04MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f171bf3-1f54-4c0d-2942-08dd3bc408b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWd2Y3BDWVloaC9KRE5UOURhVWIwYk13T0hCZGpxSURQV0dOckhYa1JLR3pY?=
 =?utf-8?B?V0hJT3F4amNEcEhTcGpyUjZmNXR1K2QxMCtEdFhuRHB1V2g4UWdPYTBVSGpH?=
 =?utf-8?B?MFFmQVIrTTNlVWxHbmhNb1JFekt0cDByTUtGL3FDdDBjVm4vNmwwb1dEMEUr?=
 =?utf-8?B?RENwOVp3NUVycHNrVXRDOWVuZGdtU3l4U0NUVzBSRFFiblhMT25tQ2hnSE5L?=
 =?utf-8?B?UVZRSnNlbDhLd2pveTZYVXA0SGNUeWViT2dsaUNDMFloSXI3d3ZHMFgvanJl?=
 =?utf-8?B?WjRUbWhxQVpNWjJ3T3hQTDZZNVh0Uk9SczVZM2RldWNXdUJKMVdTWlVhdllH?=
 =?utf-8?B?MGZyQ21WaUJxOERPSXdCMTE2Q0dVSElsLzB2YnRlVU1CRUMwM0Y5d1EzNTFK?=
 =?utf-8?B?UUU4TUlvRG1QSW5icHpDRlhLRksvbFJPVjRLMGx2S1p0RW9JTTQ5SU1XZ2ZT?=
 =?utf-8?B?V211M3E2Y0J2VUUybFdNc1ErNGVyWFRkSVdiNkxoWUJ4TWorZkk0QndYdE4y?=
 =?utf-8?B?L0luRXVTczZmRmY4Vm1oL1FTNHMzN2dmQVcwanBCdm1taHBDZ2FkTVVtK0pQ?=
 =?utf-8?B?Q3FIT1dnVDF1NWlUN0hYSGh6QW9TL1dVYlJUYnNUcGtBNTE0cHlzMFpzd21j?=
 =?utf-8?B?emdUb3VmUWZwVFIwQTkxV2tuc3V5bUJqdFYyM2FLNndtTTlNTFVzald0WkxI?=
 =?utf-8?B?dmh0cnBYb3NWL3NVcEJKUGNWa0F2K1JwNi9zMDE3MWlOLzk4TzVlWU1SaFdt?=
 =?utf-8?B?UVVmT0E1SGJBL0diVlN5QVRhNm4vZWh4ZjZvTzhIN081MGI3bjgvNUlSeEtm?=
 =?utf-8?B?OE5iNHhReEF1emJLb0xwRUV0NEMvcjJWbWU3L1M5Mi9MNUQraktMRkwxTERr?=
 =?utf-8?B?WWd4OEhqTmFCS2hJRXk3dE05bmQra0NZempZajJLejRRVG5nYTlONnVad3Vt?=
 =?utf-8?B?UjdWU2dNaVcxQmx2RkcyRXI3cUNqZGxHNERwU0VPQTJPUVBKQ2l0OFQxN3hk?=
 =?utf-8?B?cytHNTFoRU5TTWhEbXMybFVDWkd1YXk3c0VDOW9iVlJWakw4SjhhTmtpM3Zu?=
 =?utf-8?B?NnVUbHhHLyt4cGFUN0ZpU05MNnpXQ3BObEpDaExuUHh6YTNWM1ptWEZpYnJX?=
 =?utf-8?B?ai9rQjMrOUFYeUVVUTllN1lpMVRjK1JqK09QckZXYlpLVGxpUXpkWHNUcWt2?=
 =?utf-8?B?QkxZYmR1WlFCUmZXK1Rta2VmV082NFQ5Ly9XOEJyVlNHZW5ZTitxd2FRQnZt?=
 =?utf-8?B?TXY2YUh1YmNsdmZENHVuY21FcDQxTndVdXFkUUcrajRmT0U1WVZKWXZuVXky?=
 =?utf-8?B?bTJuWFNPUjE2YXB6ZGkycW5jOTBXbERJZ2U4R2YxaDhnaVRsN2VzQXAyR0pt?=
 =?utf-8?B?QVRhZGxqdjVaUFBBVmE1UWdlakhXZHRMbGIyTnBaL1dweU5PazNSa2F3QU5U?=
 =?utf-8?B?UHJSc1crSGh6YVpxenVTeStUajZBUTArRkt2WlRnL1JFYmJjQlJoa3NYeG9z?=
 =?utf-8?B?S3BNYUhacXFXU0JSRy9mbzRmQ2Q5anMzWUVRdzhLN1lQalc3UWQ1UVZFbGV3?=
 =?utf-8?B?VlVLU1c0N2pEcmtQRXVKeFJaL3l1bEJweldIUzkzcytBOWdnVndHZ08ybnNz?=
 =?utf-8?B?enNFcGtTU0VIYnh1Yy9wVlN4VnFyWGxQU1Z2ZGxQYUhpVUJTSTBsRkV5a01j?=
 =?utf-8?B?VUx4cFlDU1o1RFU4Qzd5QXBiTWR5NmVISjVVdUp3aVpnSWt3eUhyNjR5cUs2?=
 =?utf-8?B?ZFRJQ1FBOU8yMldGR3dacldLeHJiZS9iOTZoOHpRY3N2czdvY0pFS2lZMnN4?=
 =?utf-8?B?ekszNVBhU3lzOGlHRnNneFFlbE01NkFNSVNjMDFla1laUFZSeDZmRndjQ3VR?=
 =?utf-8?B?c1pTNDB5VnhBOUd3ZDRsUVlMRlNjSmcwMnhpcmxyYzJhSnluWmZRWENLR0lW?=
 =?utf-8?Q?sQOjgP86T2qvEjoEPooqEtkglOsywSCc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L291ZW9oUTVWYm9hYUtCZWJwd2hzRHo2Q3RvMUNZWlNSYjlhUU1heXBRR3ox?=
 =?utf-8?B?ZEY5RFR5Q3JkKy8wTmg5UzRNY2NUNXVFdmtqZHhGUEtrcU9zdW1BRExvbC9U?=
 =?utf-8?B?WG1zMWhoMm1RTGxjUFlNNFQrNmU2REp2akRHZ05lU2c3anA0QjV2bkZyRmw0?=
 =?utf-8?B?ZzNoREY3U0JFWGFHaXhHK05aSFNPRjlGbE9INlpsdWdzN3B6alpHZW1TNVY5?=
 =?utf-8?B?cDhCam5IS2g0SVZZN3dOM0h5L2h0MzhxelZXaGszQ0RvNUY4WElGMXFjYm83?=
 =?utf-8?B?bVAxb0ZGeGYrZGYrR0xGaXZGeHVvejkzTjYrVXlSbXd0Ly9SR0FQMitrQnFX?=
 =?utf-8?B?QVNPOEVJdjVDK0F3OE1Kc2ZkdzNVL00vbnBUdlZxSmpKM2xhQTI4MWlCRUg2?=
 =?utf-8?B?cUlyM1hncnhmcnhNb2lOcXR1YnV3cTJkOXJkM3VacEcyQWlsYVhqeE1MbnNW?=
 =?utf-8?B?a1NzRzBwMHIrdVRUSkM1UVBiL09TSWErd2U2OGthYXNlYjhYSzlUYVJMUFNq?=
 =?utf-8?B?WFJCQzNmVnlLK1FvT2Rtbkg5NFZicUFXbC9KbFZORURqZnF3WFVnR2JaM1NL?=
 =?utf-8?B?QVVpMDBSZGdjWU1RWXdGWEs5RG93R29QWEFtK2VlMnU3a1NBT0oyRy9Leko3?=
 =?utf-8?B?LzhqcFRuYmtub0VFRTlyYTVIaU9zdWlEbDZlVGkzNjYxOGdQeHB2SWhlMUhk?=
 =?utf-8?B?eHFPek1RQjIvYWxHYmFraGZUZVptUEpJL0RWZzBmWGJyeFFOT1BiL2tFTFJU?=
 =?utf-8?B?b1VqNklTRjZMYWQrZnh3aXFoZVZpdEw0aUI2T1g5R0F6N0lBeG9LbXpoMncx?=
 =?utf-8?B?d3J4UEpyM1QvOUMyTGZmSEtBWE5ZM2pWREN3aE1UNXFlY1BycTlKWm9tdk1C?=
 =?utf-8?B?ei90elJqMk1wdHREMVVZUXRpQ3Z4WTRNL1JnRGZDNjN0QlpxOFFLcmkxYXNJ?=
 =?utf-8?B?SThVSk56ZFBxbEcvWFZlU2NaYy81WWVldnBEcFVqMW9rRFBRRWtDQ3d5VDVo?=
 =?utf-8?B?RkJWOG5jQWVBdnJuTE15WDFWQnZKTHU2czNldWZOZlVDaHlHTmlMTmczU3F5?=
 =?utf-8?B?TDhUSklRazJVeWxtTXpIV002bzU4Q2RuME9ORmZxQnlGcmpNWlYxQjVzU1o4?=
 =?utf-8?B?dUNVL2pBV1lUUE1aZkFFVm5rZy81RFBJZW4xeWxKMjkwVkFTMmNKS2VqejJX?=
 =?utf-8?B?eXZjRndWSTJwMlFSRjFhUmhJT2xqamV5ZTBTTXdjQXc4ZmJQZFlqZzZ4dlZj?=
 =?utf-8?B?RmJYWmhXR3Z3YmN4bGJBa25rMjFSSjZ0UHBRSWtrb01mZ3FSWkpXTVc5T2Zy?=
 =?utf-8?B?KzN1YmZaNzdka001azFra0R4akIwOXExV2JCUVZqNFBkcURzWkVhbDBqNWtK?=
 =?utf-8?B?Q3p0MmpRbkFjQ1NpWlJKSGdWVDhTQVNteElBbG91dmZHemRGT3JnUk96b3hv?=
 =?utf-8?B?NDc1a3lacVpVL3RnN0YwbHpDYWFwTWRPQzJsMGZGSzBudVhxYWltVzFGVkh3?=
 =?utf-8?B?bGQreStFYW1lZ01CcG9sVkxMb2E2R01XU0h4SmdEVklyR3hWdDZVYnVRWmZk?=
 =?utf-8?B?SVk0eFRMY0pZNCtMcDh6Wkgwb1hDbFEwVUhPZjRwUUgzam9LNG52L1pCSkJO?=
 =?utf-8?B?dXVsUlV2dTdwVUtxMS9ucXBydXhTbFNCU1VuMEEzOG9MTlFWUHhpdVpNcjJT?=
 =?utf-8?B?djVoQWkzMU9CaDdMc0hNNnhVTGJoMW1WVWpQSEZDY1lSdkdnVjBjZ0F6L3JR?=
 =?utf-8?B?RGQ5WkxNV00xUGxDMWlkWEJvUlVuQnJzRGRZSUxIRFdDZDdrTnVxU1lmYVYx?=
 =?utf-8?B?dGVjcnJML3JZTWZFeEF0RW1LOWhIakZ3T0VZZFlVN1doYlcrdnEvTUZqRkJS?=
 =?utf-8?B?Qzg1bGlPN2s4enBka0JmTElIbm9QZkVZK3NsN2NTWmpvcVhTS2k2YlhWRHh3?=
 =?utf-8?B?RTdIelM2dXA2SUl2dXE1ZEpIMy81Y2lXYlJpclpKSllyQ0c2WHdSMGhZcVVj?=
 =?utf-8?B?NVhZTmYzTVdnU0tDb3ZvWERLci9NNWV6bnpJMXl2Z2dDcExTczJFZUwweTVv?=
 =?utf-8?B?VlhuUWsyRkVKdVVsamlScDJuWVBxVSt0RXhIUDhDS3B3RDJqZVVXblZteFlJ?=
 =?utf-8?Q?Q2L2JR7bYSwmo43kDXiAMO56K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f171bf3-1f54-4c0d-2942-08dd3bc408b5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 15:38:50.3954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNuPflRmhV7nlM9Hd5HRGdX9lKECVCc6SqBLPH+bRdPwn0Ee2DjTXpvy6su6hSCMvoU/w0g6n9IpRkS7f6HhGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7440

On Thu, Jan 23, 2025 at 11:38:33AM +0200, Daniel Baluta wrote:
> On Wed, Jan 22, 2025 at 9:55 PM Frank Li <Frank.li@nxp.com> wrote:
> >
> > On Wed, Jan 22, 2025 at 06:35:42PM +0200, Daniel Baluta wrote:
> > > After commit 2b9cdef13648 ("ASoC: SOF: imx: Add devicetree support
> > > to select topologies") we select topology to be used by the board
> > > compatible string in the dts.
> >
> > I am confused. why not use "sof-imx8-cs42888.tplg" in imx8's dts instead
> > use board's compatible string "fsl,imx8qxp-mek-bb".
> >
> > More and more boards will be added in future. This file will become bigger
> > and bigger!
>
> Hi Frank,
>
> So you mean create a dts property named e.g sof-tplg-name and read the
> topology name from dts?
>
> dsp {
>        firmware-name="sof-imx8.ri";
>        tplg-name = "sof-imx8-cs428888.tplg";
> };

  dsp {
	compatible = "imx8-dsp-xxxx";
	...
  }

in dsp driver, map "imx8-dsp-xxxx" to "sof-imx8-cs428888.tplg" and
"sof-imx8.ri".

>
>
> This was our first approach but then we aligned with the community on
> using compatible to match
> for properties like default fw path, default tplg path, fw name, tplg name.

What's origial email thread. I think "compatible" refer to dsp node, not
to boards level compatible string.

>
> Now dts should somehow describe the hardware not the software (e.g
> tplg binary) used on that platform.
> The growing number of boards will not be a problem, each one will have
> a compatible in the dts.

Yes, but your C files will fill up meansless map code when more board
added.


>
> But the concern here is how we describe a hardware setup where we have
> a CPU board + a baseboard
> like it is the case for cs42888 codec?
>
> Our approach was that in our dts or overlay dts that describes SOF
> with cs428888 codec to put the exact
> compatible "fsl,imx8qxp-mek-bb" and match it with static vector in SOF
> driver that you see in this patch.
>
> SOF core relies on the compatible string in order to identify the
> correct tplg_filename for example.

Any application ctrl tools can link these nodes?

Frank

>
> thanks,
> Daniel.
