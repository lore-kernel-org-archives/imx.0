Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF881DF248
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737372514; cv=fail; b=d10IKmv6+K6jzcIp3q1GoGDDawtuKF/IwF2m1orMesIBKw5yEgVslx1e/+hc+ub2/z4acxNkAs416fScHU6QMeHlkOM5igEIU7VXeFe4ZU5Oc1xFvuib+FAy32/V8j7wBMfpNAvlct/8QcJKf4WVfQPqiG9ddIR7OaAk8ZMZdOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737372514; c=relaxed/simple;
	bh=erbSe6B4p0hgVvk6xileiJ/J8PXocChfVcqkpZxv0CA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MqkHI4YfqbXsjDbFQ76aPqlF5eW/om9aNSt5TG4k5Au/mcTVLymm7uetVVZsF/nTykr/rkICPBwwMxuHSk+6baSp819mCZj30RMnekhRBoUy/RjnbQn7tLzESnv1qJFpm0G31UqNWzSIlxo/Ho2YXnuojVHJddfjPB5CRoGx9QA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m+YL1QeP; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m+YL1QeP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1ikUQQ9xfYpkukyHM3lcTdAULBKI7V3en3ceY3U9O8yt8j5zhVZXjRfczMISzatZDKRu0fH5eT/qLSA1G/K7hJO0EgQe7SXq25dcWGJxJISRYAs4Hyi5DZ1QQPSLNX2XeYD7DJTUgdrBA6typWlKQ/O1NXHkyQqEdyb2LYhTvsVq870bOYmc1/GvhbhiZbtbGlOU4qdkZkwcTdw90A3HWIXDLww0hcXF5bP1L+zIyYJGtwVh2Fn6eO7c7J+zFmfoJk0MS/eZjHAp2cuqOSFEqviLiAEeFfRq0LWn6gVb2diYmQMXAJI+vhkKQJsOzLgc5XNxOWDUv0znIxYk+rYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa2l017+wYncDB/W4I/cdpcaPZinY/0ZmofBrgPGdkA=;
 b=i/3YDKzv06prMSVZ4kYHoXaL30PpHhK20vl6dQN9bBUCb0vyIB9kZvlP62rGr+OGByD/XPFGPvZnI3NC8FkmlJGB97BYrQ/+eO74zHt8KfbyCDTinCDSRuwS8U+8feAgmrynWttqcI2iWaKa0ZJwtPAAm8s1G+IMMBKVxfk5glgRkxZQPDhyA+M2q1mpZTkKbzyJnilJ2ZkCSRFbmZUdY6NgI4P2xHeVKMaqp+WLLfwFl8AH6CzDixnPV9IROdcc7XE6s5P7XmqPTtpTgY4AobZ9nhUlb9PVbYGq6wno49zcWt7Gt1KP5ngLx4GNTEcIioFAxj2hbz6QQjSm+UY7AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa2l017+wYncDB/W4I/cdpcaPZinY/0ZmofBrgPGdkA=;
 b=m+YL1QeP6Z+b4AhkM0Et5HOJmJAERq1gIkbtIx6A1k9Hxast/pmU3mXLIzm7MKgbF7NyiUWxFpBeeVUZqLO7lM0y91NJimykjfUmi8fyPt9fZyj7sGDXqX9hrL33d8PTMMKwZ+itHRnBzcXbR8bHO29DJBYXOsysTcyxFIgqH8OM6XgI62xoBSxSxCuNnDdH2huZYCUGKcbkr8uq242CNkLQvGC0C1EoN3TI709nhD3VaxLQgKDrNlOHcFJYsc5drMP7HSWvrQTfzSY+KvtSV3Faad6ItrMbLe1/YvDBTPIxygeJBSXcdcqYVYId+5uQNBj0ZMh7MF1lRSy0T7Nnvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS4PR04MB9551.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 11:28:31 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 11:28:31 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Mon, 20 Jan 2025 22:22:21 +0530
Subject: [PATCH v12 3/5] arm64: dts: imx8ulp-evk: add nxp secure enclave
 firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-imx-se-if-v12-3-c5ec9754570c@nxp.com>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
In-Reply-To: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737391948; l=2640;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=erbSe6B4p0hgVvk6xileiJ/J8PXocChfVcqkpZxv0CA=;
 b=ZVhJ8nZSXKyRRHCC1qFJ9LB4qXKF+M0/yAtOPZPkLJ6VzbcykZZD4h71llNsO2DkqTlpMu8fF
 pH+O1EeVT7IDawWyRzpHC0bym+ia4kaZCKOgrH/jpB3xc9gpNPIJtVn
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AS4PR04MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f039ad-e3d3-4a2e-2443-08dd39459151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dis0MnJhMkZhVlF0RGltNTUvcWRhdEQ1eEg0ZXRldEJhd0RMOEswbDFEbXBL?=
 =?utf-8?B?NkRBUXZBZzZBdUI5MlVFYWlTeVY4cVZ3MTdpTUl3THpveThJMUNrY2d2cFUr?=
 =?utf-8?B?YnhSY1g2OWxwZlptLy9KSFZSWWdYSjFQNGVwZVAyT2tBNFYzR2dQT0hOVUlE?=
 =?utf-8?B?MWE3NGpOTm5iTmFiQ3NTbnIxUTRscUhHZGpCU1d5SFJzSHd3VUJnbytSQUtx?=
 =?utf-8?B?UnRMNTRpS3NPOXNjcTlvN05CRitvZGpKZ2VXWjFoTUlqVG4xWHI2dXBqVW5y?=
 =?utf-8?B?MXpOVzdyR2p3emRtaGVxb0FlZW9EMEw0QzdkOEJaMUlHSFpOV3p6Y20zZlRW?=
 =?utf-8?B?Mm9yRlpkSDB1dTJKZlhzZWxreG9CTzIwM1o3bWNNcEJyMnlDcktOUzZrMHNk?=
 =?utf-8?B?d1d5aDR6Z2RmYVVuT3BpZnJhcGJROGxYYzE2bXdGV3FOa1Q4YjRUR3VBc092?=
 =?utf-8?B?WTFJYlhydmRObmsvL0ErU2RpbE1GQ09WK011bExQQm5pV01vN0ErT0JJTURS?=
 =?utf-8?B?QlZYenNOQjZvSVNEaFRRZ1FFcHFPR2JYMm5vb1FiWUdYYmRVSFZmeGdQejhw?=
 =?utf-8?B?NDFIeU1aY2ZjS0lPc2tyLzVaZ0RYdzhKOEFkMExHSXVCbWR6bEI2a1hXOEdH?=
 =?utf-8?B?N2MwVXZrSU5PZ3ZsMW1lckdoU3pqUmVicmN6NnUvVnZnS0xNSk5XOWFOekpJ?=
 =?utf-8?B?Y3FJRERWTHVxSmdCMnVmVWxSUnRMNjY2WWRtcTl2YjZHL2NtVU0xWkdDWG9J?=
 =?utf-8?B?dG5QSnU2TldSVWwzbENwVjBHSEdaQ29VVkxoS3lJWGtBekx5UjVDVkVHVWlq?=
 =?utf-8?B?aWZUNTlsSEkzUmR1RHRVWGtueVdmNEhSaDU5N0UrRVFBaXdqZ2FvcGZVM0Uw?=
 =?utf-8?B?QjZjMzhTc3hxUTZTZHdXRyswVWwzOEwzUnlIU215YU1FeGtBOFc0R3NjS3Zw?=
 =?utf-8?B?Zkl0ZWVBNVVWYURnVGpzR1ZKSlJnZzYvT0FDam1WZ0lZVWF5eEFxWVNpa3Mv?=
 =?utf-8?B?Njl2b1pMQWJ4alZWMzRlRC9jWkc0bnFhVllMc2l1N1RrZWt5N2dMTVoxSWdt?=
 =?utf-8?B?UjN5d2gwclowTWhxMkV4YXNwdHNUYnVXUDdITzhzcGNkYVRHOE1wamxnVzJ1?=
 =?utf-8?B?TzBCRjdvRngvSnBCS1J6S3BJSWVrcmZKQzU3aG1FYTdaSkMrdE1NS0diYUhW?=
 =?utf-8?B?M2orS25STDVSYmxweFhFVDB0QjVUOWVRQkwwZm1BR2QrMXlMakZZOU82aEVY?=
 =?utf-8?B?YVEwUkZlQmpzOFgvaHhDN3dRUEp5QkFsL0k1RWRZM3pReHdRdXdEb3JKYm4z?=
 =?utf-8?B?R1BWZ0lKcm9UZS9CTWwyTVRRQmdDRVF4d1lacDNiOFZUS2ZTQnVTREVvWkVS?=
 =?utf-8?B?ampGck1YRTRGVWRYQVcvWHBoZXBTUW02enY4T0JIVXlFV080TDRrYk9qSUJM?=
 =?utf-8?B?TndXSjZBd0JTUm0rLy9TdnlncjdQbWo5a1ZZV2FUdmNhNmVrZFFkM2c1K0lk?=
 =?utf-8?B?cmdxRERrZ2J2aEpjK0VEaWZZOVIrUGpiTHhLb05xR1Q4dndmenVFUGpMTUdQ?=
 =?utf-8?B?ZkZoRWNhcFJ0ZUFQdFhTMHlUaTh2QVlZQXJHdjdob3BOdTRpcFFnOVhuZWpz?=
 =?utf-8?B?bTExZmF1NkhmV0FpVmczeGNUSlR4RnhWVzFRRCtaZlBsekV6dTNmcHREQmNn?=
 =?utf-8?B?TWIxaVFibEU2dnR2SWdWOVo3ck5nSlhBdHVlbnNjb2FqY2hEV1d3d1JiVW82?=
 =?utf-8?B?VkY5WXZLaUZFUmZnZjNKZ3lSdi9pVzk3MU1KeXlJZFY3ODVTVUtaWTdnT0dZ?=
 =?utf-8?B?UEJETVJ6YlF6aTBoaXRDcy9JVjRYdWhWcW9Sb1d1UnN0Mzh2UmU4VWpERUxX?=
 =?utf-8?B?OUt4b3lUbzRubHpHbFlxY29OYW1jWUNVNS9mdkx3K0JDVkFtT3N5TFJKL2ti?=
 =?utf-8?Q?d+HO8cev4yvbGyFp82vUAYZkeLpkbqMB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWlJbndienBaSWtpUkJYUW9uM0dpbzFPQUo3N1BzUWZPR1ZCbGsrSVFlbUNm?=
 =?utf-8?B?WnhPaDNKbnp2dWJmQlJFaDJwWEZabll2SUpxZWc0SGtjbGZpdjQ2OCtKSDlx?=
 =?utf-8?B?Y3VQUndsN3l1RnFHYk9uVll5NVdLeUlkZitLcFlWU0ZDZ1ordUMwTk9iNjh0?=
 =?utf-8?B?MGdaSWxsYzhZSFE2b2dKaUhQWGxFZklJdERYYUhXdm1LcS9rRGNib2FNajhI?=
 =?utf-8?B?Z2xqQW9JUTFneVR2Mm1uM1UzTGNYM3FYS3IvclpkUUJNT1UyMVQ5VWQ1cHdK?=
 =?utf-8?B?NnNleFdwY3YyeU5tY29rS2lqS2hSVmpGTXFSUjN2c25Gb1ZMYWtRYWdMV1dL?=
 =?utf-8?B?UE8ydndnTWcveG52VmRRVHdLQ2xiVmVON1RscG1CK0FxY2x2Qmt1eE8vRzhX?=
 =?utf-8?B?SlF1S3NVa3NIMDlqd1QyS2V3NEdJYnlPNUVCYXhtbTRaZmNrT0N4SDdMMlF6?=
 =?utf-8?B?MXBqbzkza2l3cEtONGc0bkFiNndtU1p2b0tDR3FsNG9WWUwzS3JPTDlieHQv?=
 =?utf-8?B?Q0QrenRDRE55OVJWcHFQaGpRZFdZZEZqcHJ3c3NoR2J0bFd4cE9aaWFPVVN1?=
 =?utf-8?B?R3NNQmY4enVIZU1xSGVqTkVTaUZDTFNyeGs5OWg4MkRXbXhnK08xZ2ZoVWRS?=
 =?utf-8?B?S3JzRlg2K0hZK0w2bzRNejFWVHlrRC9UVHRkQXhKZ09MT0Rva0x4ZlBoM1FX?=
 =?utf-8?B?MkVLcjJ6R3ppckdqRlpkU2RrTzdtUlFha3E4Z2RzbFhLSmpsSUFLMHlJakww?=
 =?utf-8?B?RUdjRjZ5eE94b3hYQW5PNWdMUkJYSmpNbWFXUnhnQzBlUFlyY25TYVJrRFpp?=
 =?utf-8?B?bHBuNGNyZVVYVzhabjVkRllnRGJ1VmVXRVBjcVU2eElKelRLTmtIUkpwcTMy?=
 =?utf-8?B?OG5IUnJXNFFqY2RxU1FNMzRVTDY3Rjh3UWlVUWtwNHFsdGhXOEh5NjNLWUtL?=
 =?utf-8?B?a2gwUlU3cGpBcjBOUkdvOUswbUdsZ0FydEhqY0JuRkNpVmFQTEN6U2FyUkJH?=
 =?utf-8?B?dE52QTVMUFpGaWpucVFvcmNzeFA5cGJXRW0wSjRyQ1g2QzdOb29abWVBMTZp?=
 =?utf-8?B?a0hFc3h6ZGhwQlNudUJqbHQ0eFRleEZQRGliK29PWTZrbnhPdGhUTGlpZGli?=
 =?utf-8?B?WUIwUTBFZ1g2K3Z5RjdJOUh1RFdRVWpEZDRycEhNS1htUk1UanZraWhSVXVv?=
 =?utf-8?B?VEV2eEhnN0xLMVFoVTYzWm9MK2NwVUdHenpCSlZSbHlDVGtoWTVad3N0ZWFz?=
 =?utf-8?B?Sk9wTWtGbHBUbmdlenhKV3B3ME1FZG9ZRktrVHRsTlUxZ3cxSDZpMGMxV2tB?=
 =?utf-8?B?TWdtMWNHNFEvWmdlVUJ5WkJPN2pjTTdOaEpYcHFid0poTS9xdjdDSXFINHRi?=
 =?utf-8?B?VDhxZG9lM1hIL0swcGt6cFBockZVTi9ncFRMQUpubFJHSTFCUnZzaWF6a2pM?=
 =?utf-8?B?cjEvNjd6Y3ZQS29KeEVtb1dTQUJQeTJHNkp5V3FLM2YzUVhPS3dOa2FJL3pV?=
 =?utf-8?B?MnFMOHVOQ0RSc3BxaVJtQjFjSE1PNU9vUWc4aUFpNE1VNm1xVk9NY1NnRURC?=
 =?utf-8?B?TzdmNVpkVzZiblpLY1JkeWo2SEQyTDBoY1RHTTRZR0RBR3o3R3pQaE9GRFdN?=
 =?utf-8?B?SE9YcHNDL2hwU2Q2OUx5ZTUwUElpajFPcEpBd0x3NFBUbGNuMUxHYkNSSVpt?=
 =?utf-8?B?RzdvTkZYTWZhcC9IdEMxcmE0aTBSVDE0WVVML05lQUhHRWpZRldJd0xCNUV6?=
 =?utf-8?B?NWx0QWliQVVhcjN6WHlnNHVpL0JYZHZGOGtTQ0I3MlUydE5BVHhXdkJTNGRB?=
 =?utf-8?B?YlBKK1NNa0VqcGVlYVhzWEs5dUJOWmJzb1V1ckFDUjhNNXA4dTQvUDFPczVw?=
 =?utf-8?B?RDlmdVhMNmZqTXZ5SWUvYmRpYWpLQzhiZHNkdVJRbDFJc1c5ZTlBRnpLMXRz?=
 =?utf-8?B?c0dFeEdYRlIrL016T0drZUdCbkFOZERhRVhaOUpsNzNhMXJxTmlibnBhemZq?=
 =?utf-8?B?RVJWb21FV3A0U04yMk56RmRxQU9nUkQ5enNMTGxmeVdhcjVQSkxhTi9hUDhm?=
 =?utf-8?B?cWxCNHROM0wxQzZjK1IvdGtNUmtkeHlNNkZaVTBWd3U1RGdwdmNGRkZSRkxz?=
 =?utf-8?Q?AW8QybjR/GxZ6jpIphqZF4YQm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f039ad-e3d3-4a2e-2443-08dd39459151
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 11:28:31.1356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAnSZ0ZdRddlh7CEBQFlunl/D0idO4UuRwc/foiLZQI1E+6IO2LYQk72FSDmOYCKxgIhaetDWdeHTZijfc8Iag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9551

Add support for NXP secure enclave called EdgeLock Enclave
firmware (se-fw) for imx8ulp-evk.

EdgeLock Enclave has a hardware limitation of restricted access to DDR
address: 0x80000000 to 0xAFFFFFFF, so reserve 1MB of DDR memory region
from 0x80000000.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 17 ++++++++++++++++-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 13 +++++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..6e68ede329c3 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2024 NXP
  */
 
 /dts-v1/;
@@ -24,6 +24,17 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0 0x80000000>;
 	};
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+	};
 
 	reserved-memory {
 		#address-cells = <2>;
@@ -259,6 +270,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&ele_if0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 2562a35286c2..976bdc4eb0b9 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2024 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -169,6 +169,8 @@ scmi_buf: scmi-sram-section@0 {
 	};
 
 	firmware {
+		#address-cells = <1>;
+		#size-cells = <0>;
 		scmi {
 			compatible = "arm,scmi-smc";
 			arm,smc-id = <0xc20000fe>;
@@ -186,6 +188,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		ele_if0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.34.1

