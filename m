Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013009.outbound.protection.outlook.com [40.107.159.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AB33DA5CC
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 17:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421934; cv=fail; b=Qv8Hg/zNW8gRr7AOvrmH0QvHrtSOOgDvWdK1qmDYuqGtlztthQxvhuTRDPKy8jAGk8f1skT3Sl1+l9DU3V/EUTxOvtLjXvuFJkT7MBIiTA6J3rARyi/8l3cVSIXqieYFEtBqHzjRn9MPJ8UQ11ni7TzXfw4JGvAixo4b1437jns=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421934; c=relaxed/simple;
	bh=8gBWW9zv4Z3QCX5Mi3ZeSp1IrBrHw2hRl1Q/HVEzOBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FcpSZiwhuXuUi7lSaiwAXYdeLWBJvAYkLGD8upQXVHZqhQOhAqIQmh1T2uIWPyUaRzrljquhe3Utjg1HqwTJ1O4kbwep6abhw+FMNF+rMBw3yOoL0hquFij5S2cJW7S5xYefKS6iF1GQw6YBopGMMZOgvDWQD06Bhx8cAIteDvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MtcIGtvG; arc=fail smtp.client-ip=40.107.159.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MtcIGtvG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpBCoZq0WbrQey7UvxXcBCYWpbdhgWXcQz3aPdSfYHb7oifM3+MZr0+sWfDh6vOIFvTXC6XqqNwdymt+b2Y3uFzohgJQ3RbusRtLjWyaEKHNYua9rbu2OHqcfaUR03qxRxyH7ulUit25UDjionjzHfff6qkK9fsab/fA+NqfI8B7Qqe8z3kZZnkUe+RBvIJJH9F3jTNl2lS4D0Ati2b/ILft71lH743TzFppG6FBkYDG0phtbWnCNsyEOGj5bsv6sOthXBEA3I2Ugnq8LYTwb3UV5VvSiLvNewKFahvkC0SrGfevf2snxtASvL91BVnyspof9u7TgtHKWlgHstL7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+bjb8pBuGzZ0gB+ramnibklBUi8/zdxzYrcccrO2/A=;
 b=dekWn7FnBha1ldpet8EexedKhCJ8jQXzW1UwmLeqxApvocPtreT3ZV4hbBoh+aymXnfx9ELAA759Ao93G32p7OC1uYsniKjSZ5AtbJlJdEG0aBqYhZ8ULFtBeNzyVwt+FVPZAgwjbb1tCXWj4z063YYEewou8k040byo2kYPEaGhc+SjNhruvXh9RkAqk/piRXNvvWLe3+cQjsZjaTD1fNFuOevFiXRf55ccdnzLMxjkiRNj/f4sQjkOw+WtoYTZNoNvJ3mFiFE9rXdHDKmyDSszYBEHU+5NCWDsC1z2EQyWHq3c6TnqjVrXju2gzB3N7nqKS/qKh4pflxxE7X9tYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+bjb8pBuGzZ0gB+ramnibklBUi8/zdxzYrcccrO2/A=;
 b=MtcIGtvGRZFtJ7LHq8lkvil4MDqmRoHFH8KIv/KoLKE9wEUsxzCBYBC6YMnmR3CGID/OALPy+daKvnQCue6/G2+ZrANeXt+frd4g4BVXoAr6CyggeTYbhHJGciooo1g9MCd9iWHrhiy9FvhjTNcnlPMwzOLrnunBf5aeGhNfdUv7fpe5Mj3y2bmTOgMEyHY6bDuNf5aV6XlCZp42DWyNypJP//ns9/Gi7NCqmoi6cOhUxZQg5qaTkgJrIFwGE7rb7VRiQ+kU4/Y3uWqLSc85Wamc+yRnQrd62N4rNgCbndE9MaGZgbuzfj02rWwIjzS4nodLY5XjDzwKFI9TL1GmOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10702.eurprd04.prod.outlook.com (2603:10a6:150:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 17:38:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 17:38:50 +0000
From: Frank.Li@oss.nxp.com
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH] ARM: dts: imx7: add nvmem-layout
Date: Tue,  2 Jun 2026 13:38:42 -0400
Message-ID: <178042191833.3444635.17578938563345180383.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527093719.160777-1-Alexander.Feilke@ew.tq-group.com>
References: <20260527093719.160777-1-Alexander.Feilke@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0192.namprd04.prod.outlook.com
 (2603:10b6:806:126::17) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10702:EE_
X-MS-Office365-Filtering-Correlation-Id: 0181f631-9dc6-46d0-be3e-08dec0cdce92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ycktSpLPRkjx+vUAKr94C2ZT7hX4RMMbZAW/3W6YbptaFI9RRnpYKaCUrSfjE89G3YaJjxn0K0c/qWOlihI70y5rE78dES11xwFnBuMiYxxOiudSnGS3iYmggifVeLKczUDY8jW9RXwuhIBxcKBtJLG5A5u40lVRUJLBrGYryAmAi9IxYdZX5GSSWYgiX+1FA/V2rJ+cF06rTNpCIp9NXPwmCSW8zraumKob5rJyYGRrdE5vxGNI9ruOyGa+H+0/ZRmtl82Boi8Z/pPWUZXzOMgo8AFtK4vDTfhNxA3gg48KoopPl1ye06yJT/YxMw7B/aPYQ6CYRHLoi/8ZP4yd6Y6lvxBu+xqzyRQQqZqeWVhNSsx9SzCAQ6qCqeEBSEkjbREAUkoQM73NRn9jY5RCUdr3UpxtetlEPAIRlI2qTXeZ6FYLABsJfk1exWgxcWGPP9jsfJiBDNzluYU0W+mLkwUIMMSrxNq+LSIKPEPvhnbrDwkemU0O1rGdWutKVQkm3+8mZG2DkIJ5K9Wre0EYYXD828YGRYQd0B4Guy1W4uvCosQbncv5EZMpXJ3xmzdnpmMXgPz94ac75J0Gc6YrzNQx9qHpySG0w5/l3NyE2rjHNcGRFDrm7/e3Hc64eXq03KkmShSArQZTagEme0OVf+O5TOGev1Orpdv8LkN2d5JC7CNkA17hgXsRsiWFlUuy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnN0UVJxeVpRdnE4SmxhSVVFVm16allmVUpxTGRBTmd6MmdVUEtORys1MGZM?=
 =?utf-8?B?Si9jQkVwUGVSQXlHZ3JSb2dGK1hXQnhUSC9sL0dBWFRSWU1BS1VVMDlIN3Jq?=
 =?utf-8?B?Um5nK29IY25MY3FtYzFlQVcxcTdaSW0vUVlPQ2lrSjllTmtFbHZzeUNaOHFz?=
 =?utf-8?B?RUQycTJjb1AvSXlLSTJ5MGUvaTRIdlBTN0xaNmZzR1pxM202VjhGcHB2d3dp?=
 =?utf-8?B?QjhqYXZtTVIyTmZLRk56akZNYUhEejVNelFaSFU5Z0t4OHY1MXpJY1BZbUln?=
 =?utf-8?B?bTZzYk9hK0Z5RzZHdVZOazBoVjJtdDhoNjZzUXR0eTZjTVlqZnRJaVZjbzNP?=
 =?utf-8?B?aG0yWDV2MU9kRmNOT2RSSlRnNXl3MmlHV3ZiL1hTNlZUUE1xeGc2Mk1aU2Rn?=
 =?utf-8?B?eHdhVHZCSnVIS0oyNTdMMkxuaWlmSnBHL2l5aHkvOHRYRlFvTWpXR0l4aG53?=
 =?utf-8?B?K1V0ZzBoRjZCTUZUN0VZb3Y1WWNvLzh1TFNJWEsyMjZCWjEzT3FqcTNqTzhZ?=
 =?utf-8?B?djBQUU9PN1RUL2x1R0xpV3RlUUJvemxxVGMwZC9FWDdyWFVyemcvM0ZHT2Z0?=
 =?utf-8?B?MTVISjMvUjExRGg1U2NwUW1tZ29QSUtFUDZTekpZemlVYytpRXpuNEQ3cmdi?=
 =?utf-8?B?L00xZ21FQ2FVcjUxY0FOeUh6TXBJZDBLbTJjMmR6bVdQY2RhTlFiZTFvSjkx?=
 =?utf-8?B?S2J4MVBrOUo3V3NqcEY3eWZnZ2dWblRJcWVEZ0wrOTFGZDlNTHVaNEppVGdH?=
 =?utf-8?B?V0YrK3ZEMGpkamxUR29Ea2xFUFZFdlBYeElqOFF4MTFnV2lsM1VSZG4rc3hp?=
 =?utf-8?B?ekh6ZlNFenNTTXJhUDZtTkhzYmd0Q0picVdiWW5uS0Z0UDdYQTkzRlFqOFBQ?=
 =?utf-8?B?Qms2TVpNSWhQZkFteDZ0a0ROSFVOSjFQNnJFa2QzdzB0bDNqQkIrbzFVaklk?=
 =?utf-8?B?VFEzeUNEUzdoWXg1RzhvN0lLY2dNNTZuR0E5b0kzb1ZnRm1rZ1duUFNLWWJu?=
 =?utf-8?B?SGJxWHIyTWxkQ2JZVkxDdE1DSWJsdDdEaXVwOHkwSVJCZ2JvM0hHbGNIb3Nu?=
 =?utf-8?B?SVp2NUx5UTFBRXpGa1VISlJ4cmlTaEhvTWhObDYzRi9aWlNFZytqVmNrc2ha?=
 =?utf-8?B?RGxvc1lnMXBnWGczbXhWSUxjcXlrbTZXbUZuRVowTXNSMWRrV3ZQMEtEMUFk?=
 =?utf-8?B?OThmT002eE5FUC9xTWg5Z2dMQ3Nsa1JuQkpUbWtDQ2RjNmFsbWduVkxScTRG?=
 =?utf-8?B?b210bU5Ia0M3a0tyM1R5LzA3bHNlNmFzd0NBRWZxQnFKZ0ZpRHoyRXZLNXpK?=
 =?utf-8?B?MnUyK1k3U3NWS0Z6cmpPTjdxSlBtU3ZRTndSTDZwUURraHRiZTdoazFLcFZG?=
 =?utf-8?B?VmtQU21rSktyRDZENnNuNktPVDBvUjZTeTc1MjlvMTZwUkVSRC9xNlNnd2hD?=
 =?utf-8?B?L1ZCb3hQaWRpa2o1L2J5ZHlZZGF6UTlLa1dxT0pvRk5QWVZLSHRuQWdjMnkz?=
 =?utf-8?B?US9aRHMxLzBVdkJkMjBSekIydUJ2b0xSUXUyc2QwRjhjRFZ5dGRkZlJ2K0ZG?=
 =?utf-8?B?Qnk2OWMwRzYxUWoxNDV6YkFLVEhFMi90M2RaQ3AvSVFZUTZoajlMcjcxVDIr?=
 =?utf-8?B?NVplR0NzV05aT1JFSmFPLzdoUHB2d3pSVzlWVjFodW1IbFVFUkN5UkVLUEVy?=
 =?utf-8?B?MU80NzArcjVXL05Pc0gyaDFxNzc4bUdGTXA0dXhMWHh0M2dsUzBFMHNvVUhY?=
 =?utf-8?B?UzJWSjRsdzNwMS9LRzV4TDRuYkVYRzB3dEVHdlhWVGx6M2hnaHl2dVRtd1V5?=
 =?utf-8?B?Wm9mbmx2Y01DWHZoWldUNU9uYTg3TEx5dnFvRXA4Q0kwYzROb05iVGlNMjc0?=
 =?utf-8?B?WHFPY1JWT1p5dXBQbU52RHN1TU0vMm14VThpNzhrd1RpRW1qbGY0WklRTy9T?=
 =?utf-8?B?SnoycS93d0tXM2dMTVU1WmdmY05qc1R5Mmw1emltN0xCNUtkcEw5cEJjSStV?=
 =?utf-8?B?SGgrTUxSSTlQdi9NdkJUcmkreGZnQzFyemh4Y3FBQzl5N0RlQlpPemtUTEE1?=
 =?utf-8?B?YUU5c1d3TDNSZmlvenMweHdtamdyWjJPdFFFUGZvQjRTT3BmSFVOWlVidUh5?=
 =?utf-8?B?bW8vZkdrVHBQTEg1bFYyTEh0Nk9ScEEzMk1xSnNRRGFYWXBYMSsrZ0lqNDd4?=
 =?utf-8?B?eVUzZTNJVlA2THlsTVMvZmNmTXVmQjBMYTNzaUFrVnlOZnVxUzFVS2c3VXM4?=
 =?utf-8?B?Qk5XVzJBUnB1TWx5MW1lY282RkRvWEVFQ01JTlBHalFEQ1UvK1h2Q0JnQ0xL?=
 =?utf-8?B?NTE4R1ZHekNSS3lMU2NyZm1ZR0lqMEdsVzA0U2RjVUZpMXRoK1JiUThBbEVz?=
 =?utf-8?Q?92kgPzVpWBLs+iAMQ2F+wOsvxDxr36m4IOPqP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0181f631-9dc6-46d0-be3e-08dec0cdce92
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:38:50.2767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Axr0XwO8rPscFcdxa5ewSwviXMuprFpNBmHGs3q72gBKH8jca9k7RBVuv1CCEcS0nhidL7Fy9IKhYBZsezwLqwVYXZHVD4ju5aqOatK7CeQJkDDLUrglmRmnMsutolpM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10702

From: Frank Li <Frank.Li@nxp.com>


On Wed, 27 May 2026 11:37:17 +0200, Alexander Feilke wrote:
> TQMa7 has board-information located in EEPROM at offset 0x20.
> Add necessary nodes and properties for nvmem cell.

Applied, thanks!

[1/1] ARM: dts: imx7: add nvmem-layout
      commit: da6662e9933880124ff6e8eea73e73a775d9ac65

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
