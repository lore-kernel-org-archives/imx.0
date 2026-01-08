Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFE6369203
	for <imx@lists.linux.dev>; Thu,  8 Jan 2026 08:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767860993; cv=fail; b=el4V3x6a7W6a1giKVwkoB/zrnmzcCNtU7csda72BIN23A9udONCn5ZHLUZT//PTjG5NnJJzbifuBda5OG+J8EUaGRU3QkvB3aqjgIcQ3A3uZqj1tfgustML2nNV/I/+pl03RHI7kcsO6siO7F2Ynh4N5jXI3iw9IQJ3lBX3H6z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767860993; c=relaxed/simple;
	bh=Pw7mZ5FonR/fFdjQ0U5v8Joa0/BiIZ55B9YcqAsjrQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bNgbjYEhMn0w7igH4/2gScQX1zmo/aD+gEKiIipF4nzbQmJu+44UZ8hd/+Bdtid0brCxQGXmfoBiUD2uPK37hviNoFlc8nD8nkR6FbisT+N2kxK0BGElFIQ4/iepDSnSbrHg5FNBAwklSLz2OcFqrV9tXI4UYuadUU1Zja3/6/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QucsDLQk; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QucsDLQk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rITDtffjxyqrlgX+z+xG/VTTbUgGET8YSVSX6kuyFZcxSGjuHrojEYjJaWKnBbjPPbY6jpaCz51Zh6TsV9DGcEKVYIen7QWb0nDvuVb7GIdujJ9+2YvzYSDJIu3F4G/mAbmDzjszi5QLHZEIrZstc+sLiCD7PzzojAlPJ66DEhIuwDiPaLr4+bpowFZi2Cn/6cLIMUzZgsHsGDdqhOPseHFLg+X00JMTAv2pouPD1sFxcBn4s16MRGitI5gnLIGjTV6cvfrj4EKELBAgnd6hTMTFZFNlz/PgZAbeWnASWHZu+8POWKgUF0xplpJFDkvK7z4lzNMyDMWH57Sew8SDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQg+S2d1UWYWmfxyHNBVr2D8tRnKzTl+aTb0URFUAKw=;
 b=V25YaWLbpI5JQGW8deCf7vFcdU32G9sQyZZ070+g/aECqYGDdGgFHpWL7yHzGcZ/RrJrg0xZ1afODGJhjewpUilB3Vv4t9cXGdieXzozdSgIM+aXnlAap7s8UcrzIJRW4vc8Q1KycwiDvSUDS7YpeF2d2NY03CoffM5Yy0TlrKwXmsczBVQoND+HSEsPh+udWfc3dclrQ2Sk80BkG2QvoNtBKZUkSCll2ksO2JN4YDrMQxjb/QFfj0G9PDt9dbMYOgapcPVaDOrwwwg09smOfWV8Er2T5MAR8NPhCf3v1YPq7mDiNV2b9yuAkJhFO51AwrnaEq8Yde1+YxMxgSqX4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQg+S2d1UWYWmfxyHNBVr2D8tRnKzTl+aTb0URFUAKw=;
 b=QucsDLQkZkXXuQXxnwuPfNtRns+CB/SnGx5+SoTR3p2RFJYL/ivNgR3CNBnhwXOFshGlP+2JoeLroqe8hWBoCtoNRWuCVUp8ibw1DjG5XIeFP+Yxpon4FFF2sl0mAjC7SpT26IjjUdJ/5zv+GllLCrhrdyuhV8a7RretY9LyvOOIYR6L4CBEEDy+GU6oz/pN3djrMo9ome+pI0NzbtB+Jec1UsalRJNm3BpSISQXvD8SDgZ2QU5fpUmVbihNfvNCP+bE2DfX26B81Z3t+EOltJMAwtGSV5uLUCfsZ0RH0wQPaNI0tJpV/RN4eosRMm5ebrLSJo49+Gsll9AN5VgwtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB8464.eurprd04.prod.outlook.com (2603:10a6:10:2c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 08:29:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 08:29:36 +0000
Date: Thu, 8 Jan 2026 16:22:24 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <7bbvfiy5wceantklz6lav5rwak53yhasfvzddtsirqorcylrf6@rbcrocqftznj>
References: <20251224111716.2925597-1-xu.yang_2@nxp.com>
 <9870fd41-bafb-4ab0-91ff-8fcea53ca0a9@lunn.ch>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9870fd41-bafb-4ab0-91ff-8fcea53ca0a9@lunn.ch>
X-ClientProxiedBy: AS4P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::13) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a572c11-53e8-49a8-4dd1-08de4e900ee5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2NjOXpWc2hOZ0I5Z204Q0loUHc3OWZHYm53RXo4VmJDUHcvMHR0a2NHQmx4?=
 =?utf-8?B?cW0waGNMejVOR2JCdERWQ2pRbHI0MVpLSW13enZrbUJPK3czeEQxb3VXRmNP?=
 =?utf-8?B?N1l5dVNBZnNmbEZ2SUx3alRsOFczL2NoTGl3aHhLU2pCaGVvckJMZHl0eTV2?=
 =?utf-8?B?Qlp1RHMyL2RjemlLcG5UNnVTUHBsZ0FFbm1WdUZvRFBwU0tEdmQ2L1Z5NWFE?=
 =?utf-8?B?bDlEY0ZUYUFqSmxSeWlMNVY2d1dheGxXWDZTbmlVbzQwMnhFM21INC9tMnFJ?=
 =?utf-8?B?UENYclk3KzZZQWUyODhJNjFEdUZJa3J2ZFJGalZaQ0NNd0E0eER2UDdsTS9Z?=
 =?utf-8?B?ZTI2TWlBRWI0b0hyOUlCQmQ1MVFreG0rQWZtWGFTM1JPbWNiOFcvV0NUdFJt?=
 =?utf-8?B?QUt0Qlh0bldwVGp3K0xFRU1DNXlQaWhxbHMwV1NMNnAvMkt6VWhPU29DMUEy?=
 =?utf-8?B?VlZuTThvUzV5Yy9Bem9OOGJwWFptTW0rNDIvWlNPRzdtRmFOWUdLbDVMYitu?=
 =?utf-8?B?ZFhrSUZxOGg3WWN2bCtNamN6dTl4ait6WjlVVXJNcFJzcDMzRmtBbEQwam5W?=
 =?utf-8?B?cTFwUTAyQ1FaamRtM1NEM21wVGg2UGN2ZER0NmlUQzVKUTRuRmtLUnhmc2lt?=
 =?utf-8?B?eGF0ZTYyYWo4Q2tUdG1oQ0ZHbUgwQ0tsM29xRDJEOTN4aHBPSk5mMi9iNk1I?=
 =?utf-8?B?QlQvQ1djK1dlUlBGK0l2azNRbCt0TGkxa3RPNGRPSGFYNklPc1k0clRMVU8r?=
 =?utf-8?B?U3BiK0JSalVQZXFPR1hFQXZWdVFKMzJKemZSb1BIOHJ0b05CV091MUdySjBz?=
 =?utf-8?B?cmlhZjdTWXhLQlRMWmk3UlY3dTdtOFpBZkYwVURTL1hYd1FrM2VFZTFaV3I5?=
 =?utf-8?B?V0Q2SkJ6VzhYdzZDZFlHVWdjRWdFLzlTaGIyQkt0NUh4aGhpd0x0Uyt5eUFi?=
 =?utf-8?B?bWFvNkdjQXRGUEdpQUM3aDBrNEhLM0pIOVFaZVZIUEUxSUFhblFYRng1OVNK?=
 =?utf-8?B?ZWZ6QW92VDVRUTBpaFZFV3llQTV6QmpZbUVrWjdVajFzTFBZVmk5cm90UW9S?=
 =?utf-8?B?RHlFY3U5Nmh0eVQ4WEtMeG0wVGZVdHJXOHUrVlF5SzZXSmZURGRaUXczcXN5?=
 =?utf-8?B?RmZTY0V5aVAzMmFxSURKdG5rMmdxY09NZENUMk5QM2FwbjRlQ3lYdlY4OVVH?=
 =?utf-8?B?VTdFdktOVEl0eDVHVmNiZ21NUmhvNDV1TTNOdi9sSFhaN1FMTmRXbW00Mzhj?=
 =?utf-8?B?QUNGeDh4eVdSQkJNSEFXblE1ejU1ZXZHS3dMc0RTM1RVOVZTWDBtdVBTS1NI?=
 =?utf-8?B?bFI0dExSUmpKcG4rdkpUVzhTMHBwRWplKy9OTDd2Q212ZSsxYjlNV0J5SVRa?=
 =?utf-8?B?dTJPRkR4ZSsrUlAwejFHMWtmWkxCUkZBQTNsRTVDSi9WNXR3UkxNWVFNWDhO?=
 =?utf-8?B?TnVncmpDRjR5VjgxVDJEV1hBczR1TG5vVjI1OWMrQUNLeWgzdGNpeGVpZjRK?=
 =?utf-8?B?amRvbysyNGxsYjdQd0wxTHZBTHNrb2J5K3pXZVkycnZMRE1tUWp4NGM2T0Yx?=
 =?utf-8?B?N3lNcDdnN3NoeE81aFQzRTd5MDczaW02SzZQZDUwYzQ1Q2JhSnZHdFBUNUI1?=
 =?utf-8?B?amZjeUNBWksxSVpmTUlWMjBDYzUya2JMaHpobUYzTmR2TkxpQlkvMzZZWjMx?=
 =?utf-8?B?UDlIYnFGcHc1ZUR3RDV1SmNsbFN0Ukd1RnZaWkM2cFlKdDJqVEo5Vk80TkRK?=
 =?utf-8?B?VDJmR0RuZlZ3OFlDNmN3R3pQVGROd1VyVWtmc1M0SEphOHhFSDMrdnAreTFr?=
 =?utf-8?B?dVkydkdEd1pUeGNNWkh3UCs3Q0JqcUhZcHExS21RZVN2NXpJMndYZzFLUTE4?=
 =?utf-8?B?SWVKWjhyMmtXdkhULytFQjY3TzkvL0VlaFdLR21ENGJTNXJETEJJZ1BqeUpD?=
 =?utf-8?B?VHpzZVluT1JKUnJSZFRzSitOaVJyaU1XV1dtdGhhelNUTm53OFVFT3UzdUgy?=
 =?utf-8?B?WG5CNVJqenpObkNiUFBHSFNjTHVMQXFGWk42NUdvazAvZWRHVHlLVm5pdWRX?=
 =?utf-8?Q?CPIYeF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHNmUk1XUGU1YU1qYUpjNHdna295eHlDSDN2RmJpUzFiZlg1REt6TXlUQ3pT?=
 =?utf-8?B?dkNYaUxFTUNVREsvQkoxV1VTTWdqSXh2Tjk1aDBWLyswYW5LUEVtOTA1K3JD?=
 =?utf-8?B?MDdMaWFZMjZpb3JkK1V4UFNQR0tZTU1aMUVjcHlXM2JqQXJHUlRINTFxdWdt?=
 =?utf-8?B?enJUSlBzWlJvNXBIY2EyTFFpYlB1TkxoUHppYVNPdjJsQUVLNlpNR1VYdS9i?=
 =?utf-8?B?cjQreitVRDZzRlVGZERjSW9GSUFzaDJ0UXEvQW9tKzM0QVdaSmZiRDJOTGpD?=
 =?utf-8?B?eGRhRG5WZElaNURDdmd4REtYTy9IT2o1K2NSQndjanBqMjlhSjRtMkR0SmNa?=
 =?utf-8?B?T2VKdFVpVUFSYktKaUcrMHBqQ3praDlsVThia0ZzWXN2TDAxZHlZcU9FdCtz?=
 =?utf-8?B?MFpXbWJyT295SlM2cWdGMHIwNjZvQmJhUTRnSktpY0ZNOC9rUEVoWFhoMHN5?=
 =?utf-8?B?b3p6cmI2ZFN6ZUhacUFCZ3B5OFUwTWVwbG5zN3lVb09JMzRlOWxTc1U2Rmd1?=
 =?utf-8?B?R3lObUxHbVJ5KzFkTEtlWEIzUW1QaHBhU3J4UkNBSnVISXZNaUQxMVYxRkNl?=
 =?utf-8?B?Z25BZXFJNkdaZ3dVc3M1RTFSRlpuUCtZWGRhRVp1TGU0ZDVxWUJCUnNSVnI5?=
 =?utf-8?B?VVR5b2tMbHF5YTViLy9LUkhBU0dEQVFvbHVWcFoyTlh3MkNsU0dBRlkzWm1n?=
 =?utf-8?B?QTFBQkxMSVRjcHo5Uy9KM1Q4Wit2d2Rvc3JZYVN0a0VPbWNpVElqSUJ4SHRO?=
 =?utf-8?B?Vk52SjY3MmsrLzdOMW5rc0pDYUowZS8vekNaUWtmZ3EwYlJqamYzdGFlNUNW?=
 =?utf-8?B?RHk5a2dOR2hhRGREWjFMYWtFRkxMK2krZVVTVUJUUXhGcndLNDZHNzhKQkdX?=
 =?utf-8?B?M2ZMWFZJUERVZ0g4VmxXRkxReVZmNjh1UmtFbG5EZDltckFuckJVL09XQjhs?=
 =?utf-8?B?K051SDcyTjZxYWIrR1dBejlQN1F1Z1BBSSs5YzZBWUJJTUtQZTAwRGhRVUow?=
 =?utf-8?B?dFNJZjdnN0R0cWRrcWM1TVJtVklSNHZtTFFuZExYaHBRWFI3MDNkSDBqWmps?=
 =?utf-8?B?M3RaSWFobzFJeXJGeTMxL0M0RHU4WmZ1aS9KV09DY3gwMzYrc2hRUys5Smti?=
 =?utf-8?B?YTRkUkpCdm4vT1hDbUQ1OC90RDd5WDEvUWlDR1lEdVFVeVdLbnk4ekFuWFpk?=
 =?utf-8?B?VnNDTGVjM1JSa09GcE5PYnpTb05hZmE3cGJnSHdoRnYzMUVjUE13L3VPaWNY?=
 =?utf-8?B?VWxkaXk1aFVIa1N4Qkh6VnNzTjhsR1lJZ1R4c0dVNlJLbW1rdFJXNDlOMG1F?=
 =?utf-8?B?TnN2WnozMUsvMDBGNmVTcVJBMXpBczNOT0Z2RFk2eG9PYm5MbE9ZWkdwQ20w?=
 =?utf-8?B?dXZLcTNkSnRpWWFJaXV4YVZSS0VxRlFPL2xrRS9IRlRvUFlydXZDbm8zUDBi?=
 =?utf-8?B?RDdZalJnZFdOUTgwU0RLSWZyNHhQdWhmV1FsQzFyVllWQUYzUnkzZlFaMkJm?=
 =?utf-8?B?bllHOVRjMDFDOVBaN1d6VThrU0NZYm12ZDJObkk0b3NkQ0svRWxBUnIvcjRF?=
 =?utf-8?B?OUR1ZTBGZ29qK2NxaGJGVENRN3NTZVlhZHRwWlFMaUJHdUFYZjN5dTJ0QVlU?=
 =?utf-8?B?ZFNTalVFbjNJMk5wWFRORlhiV0lEVUg2NTRvK3VqMGxGckhZK1B2dU53ajVW?=
 =?utf-8?B?Q3kwYitlaHFtZ0NOTVpxbDRXeDVITjYrUi9KcWpGeDRtV3plaUdwcHZIUmJF?=
 =?utf-8?B?SnJpMGdPWW5Md2RKVm04YXpsc1E0TW04MlJaVW9LUEZFTUEwc1NwZFhrNjN3?=
 =?utf-8?B?c2E2d092TDNLR2lva29HWWRSRHNkaWsxdXc5U3V4Z2ZSaksrNzBvWHRlWU8x?=
 =?utf-8?B?ZkMrd05qK3VFNWtkZzRZRFlDYmViaXBPY1dYR1V2TThTaTJ4TWthT09Td0hF?=
 =?utf-8?B?bDAxS0tRcnpnenJuYXlQWlZSWEN1QjNlbGtnYW1NTTBTRURVRjVGdWVWeklK?=
 =?utf-8?B?T3QrcENrUkNTQmlvdXlkZyt2dzdrZzZPZTY4c1Vxd2JZT2c4VGdOeFV5ZUtB?=
 =?utf-8?B?WlloVnhKc0w3VkczR29EZnFTNzE5WFQ2S3J4T2RreGhpNU53dnE1Z2ZFbHNt?=
 =?utf-8?B?eGlxVDRvV3F6R2xTbzZEbUtva3FtYmd2UkUyL0hSR3FpUFlMZFoxL1ZZUXBa?=
 =?utf-8?B?Sll2NnN2MGJ5OW0zdHBtTzN2VFh2YjRycVluRSthdWF5QVlwa0RzS2VCb0l2?=
 =?utf-8?B?K3d3aHdobGo2azNkTEphV1l4aXBiY2NUU21CYS8xelMxUVQ1MGwwYlA4Wk82?=
 =?utf-8?B?NU03aUtKbTdBZDk4ODZtVm1GaHdqUkgxQ2lmSmFYR2VHV2FFbXVxQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a572c11-53e8-49a8-4dd1-08de4e900ee5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 08:29:36.8942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjWX/BtVksarLe5mZI0K8s1uAYcFEqsPDzctxSWpf7Jb3T4XjxA4zSpFbD1sgY3O8yqr7ClGRLkAdU0BrkagPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8464

On Wed, Dec 24, 2025 at 02:51:11PM +0100, Andrew Lunn wrote:
> On Wed, Dec 24, 2025 at 07:17:16PM +0800, Xu Yang wrote:
> > The CR port is a simple 16-bit data/address parallel port that is
> > provided for on-chip access to the control registers inside the
> > USB 3.0 femtoPHY. While access to these registers is not required
> > for normal PHY operation, this interface enables you to access
> > some of the PHY’s diagnostic features during normal operation or
> > to override some basic PHY control signals.
> > 
> > 3 debugfs files are created to read and write control registers,
> > all use hexadecimal format:
> > ctrl_reg_base: the register offset to write, or the start offset
> >                to read.
> > ctrl_reg_count: how many continuous registers to be read.
> > ctrl_reg_value: read to show the continuous registers value from
> >                 the offset in ctrl_reg_base, to ctrl_reg_base
> >                 + ctrl_reg_count - 1, one line for one register.
> >                 when write, override the register at ctrl_reg_base,
> >                 one time can only change one 16bits register.
> 
> Are the registers openly documented somewhere? Could you include a
> link in the commit message.

We integrate a SNPS PHY in Soc. So the registers are documented
in SNPS doc. Anyway, I can add a link for reference.

Thanks,
Xu Yang
