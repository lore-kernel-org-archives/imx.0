Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F923CAE61
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 14:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325544; cv=fail; b=SP5pXrZnDbmbND5LTa9jrDvzGxyWwmaoEm/rgw78NPBpnVWZLCVnDTAPGRwQ4yr35WXq7YmAM/rQbo8w7wZg1+OyfOHzc40ilNFATenfzJcYArZlLxqrUZ3C04OXV+xE6aFBFblLa6Zh+RxG7kBhxjjbF0sYvDRHu/9Tr3xX2BE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325544; c=relaxed/simple;
	bh=4GKZsNtd4IFkfy5maq9PltB+cc2sRbyj/dOVUK6mL1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L8a2uFOIPxV5fEIhURLDy1lUBtAyN38e2gVohqIJ7lcLx+i0750jBL3Ig9/l3HiD8j+m1i4UD6Z4OAbpKH3BZnSyWRVA5kwqLZgnZvvceCTtB14M7yfpbTCVSaCT6AAA99Jo4zzyck+osYl08ww4RxZxe6CxpNiTSlscmOURJ5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BDlzrtWo; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BDlzrtWo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFofs1ee2SV3l+Ean5OQuIfqokyB/EChk5YFKd6KuyT+cOp5sByUgpY+9UpYrAjhoM1f/ijeSaPehf3isXG5X8mO3foA/1iSLx7h2469HHYPfLAwY/v80fHFKR7BXSiF3sU2Ph5P80JCudtcioP9/61QxpkyzNCV3a9H/AL305gxlipndfNyel2fqgb7a/a1UNYzZRk7UFjoPibchU4/nm4A8j0w0bswS8mDCuqNbW/cU3JmC1PU9q2nD2jbKoBz1CDo+unCyM8shx/REYAPdN1RTOVaebTU2qPfiXA7bWAvffmPz5wZgRgh4hdPgOb+BsVDkOPOnRgJ8PmZDFtP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kum7I7xZcRKfWLGpcK9a4oVLMTP7iPN3cULQ/AknAlg=;
 b=EpwV2GNTqVN/6RBQ5bSI1gkgIgCSURSCyhTxoZbUl0SY5QLvHrfqoflULF3Ubk1qlBXFBcmo9OshvXmWs1iK/5hldY/gMqY0uDXFCi2ZT1LmQuR74cBBNg3CcOQ1Fcij6ScOshAfwA5qdKZdxN01K5yMzJHHNvq4RIVGpwzaCzpkr3pGvq6hUiA8mWjHw6pvkc0nClP7L8liF1FNNX3/BmLaWAhsGBGOzUHEXTosNiLAnVt8VQ2LoZl3nnd2v7vgB/HHvV610RjiS5wU1t19YaemP4H2oUan5dY7RUlJkG5+BvJWDewvqPiozEIwSiw3ovAuzp9Sfbx5Tuo8yTtfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kum7I7xZcRKfWLGpcK9a4oVLMTP7iPN3cULQ/AknAlg=;
 b=BDlzrtWoAmsHcBTjT451L9SH8n3lkF2C/Vgkk2KY5IoIPWG8Y0fmQ06Cih0cGRljAmZPh955LYIVzebm6L2FGfKvu1dsi8GmCFhd/PTjLXSqDzg+ldRvst5I3jZilel7nMsfYLpJBlVytocSjHzDTywe0XRBj5R91EdgznliKrQeUbTq5JiHTnDrgkTmPsAPA66CcM6sKqZdkSe+n4KWqKK7cqkKskjIKH5c20sl3gIWcZUx42q7g3Al31WcrOKfwy675LaSDSoItsSbj6B5bJnJax7JHQTi6rJTBApMNhpGBmFCsBgncbCvEMkBe8yZywg2U+/Cj3egQy+sPNMV4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 14:52:17 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 14:52:16 +0000
From: Frank.Li@oss.nxp.com
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus DHCOM SoM and boards
Date: Mon,  1 Jun 2026 10:51:59 -0400
Message-ID: <178032549989.3914057.9286728278681213512.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326044411.222907-1-marex@nabladev.com>
References: <20260326044411.222907-1-marex@nabladev.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0006.namprd11.prod.outlook.com
 (2603:10b6:806:6e::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: b830bd87-db18-4283-ee5d-08debfed5fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	G7c2QTLvQ5aO80z4M4fHJMUrzSg9AbK3W4aMXrhyeRtK2tw+CqS6vwKl53k1D6TQWqh15hUyjnTO7Xc8NzCwaCQAwrY4Ne7x5zZlm4U8HsiwmoN6T2gEYdw3Fadd/yew0nIafEO6igsajeq/67jn7ufLvKOGXzdP0YsS2UH7ZLanJfBo37+3qeKfieULT1VkbH63WfIwWcuE2qP04y9BBz3MsYf2vzxRDSo8yJPGVRMMMZoLM1Nx7XVpfeoccaLUNmGSgcS0mvdbSjZpIbr5e68rfZKooZBUYvEaxaw9ojs1s9CfuBkLsGE28mJPYV36RVWQFQvkgPgl9STIUsfH30W1bHp7AL6jYedq4QD1eQMiDIHrs6BUh1ZjiRyc9lfUYfcv48DSbqtfiuHzbKSD2TvDttOFfWC+fl6NX0v8xSt+3xhRMCAF958LH0P3dbYQdntpwYvyrrqPzR+8GlkbVs+tdCKbATJzkWKdiTzeVxunpqCBuE89b6wRWd25hhsewLs/2qtZroCoHkXRRKNWr/yb6NQOzdxzXpvqA9rYmHtrHOr+HdEuyy0KfhF+GJq+GgqzaMv0YpiWVICS5sHJ4JRVvnf1UuN9LGJkohoXC/a8ay1ifkhRgFfA0XHuHVf3Jd1Y6knypqpSmjZ8i+W9kXiUIDpOUqeukb9PUdCPdvvLFYdEyIDxfk9jv9TsBTbj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXM2UTU5MHBBUDlGeCtNSUdNTlIzbmM3RlBFdEJScGRIaXM4ekN6QjhmUUVz?=
 =?utf-8?B?Q011WVhnRU1qcUVobUtsdkhVb21DS2hOTEIvZjBZMEh3S056WEZqVVVqZHdn?=
 =?utf-8?B?SnJmNUZGTFpiSkRJU0hqSW4rTWFxcWNXek85MHpOMWJhNGNhL3hOK2dpQXVH?=
 =?utf-8?B?clMzakFmVXArTld0Yk9UeGIwWlhaTEUrbUxNNENwQXNpNlV6aXAwWlRpT294?=
 =?utf-8?B?UFBEb09iVVRBdDZPcU04dDJTSm1iMkNFQUx2V0VEV0dlZE9PNDQ4dlZESGQw?=
 =?utf-8?B?ZkNjUUlKOU1Fclp5QW94QzEyOEg5RjZOTnBhWjVPL2x5cXg1aWM0Z0c2K0NW?=
 =?utf-8?B?ZUE5NnJCWllLQTZCUUdFZXQ4UFp5WnB0SHEyeVVzZ3RxbWlzRjluSnBTZjNE?=
 =?utf-8?B?a0FVWDFLOVNqZVRkQnp4a0Z4TUxITWhJSmVsUDhtZW02QzA0emxjTUpSaVNB?=
 =?utf-8?B?RFA3YThZK3g3WEZYMVdVOXpQZGFEYkY2Z3kvb2VKMUwxQXpwdFFUZ2ROWEhZ?=
 =?utf-8?B?ZWU2SG56UDNMTVRKMDlwU0p2bE5kWEJmS0owcWxjZ0dpZTBzcWtNRmVnUXhO?=
 =?utf-8?B?MUo3ZXNCK293VFdSWnRUYjloM1E2M0NIbGtYVDUvcnVOeVNLVjFwQjc4cjAx?=
 =?utf-8?B?Z25uVXRUTXJ1a2VwODlsd2VKc0R5dUk5eWlmOUlNZitUSWRjZVlIOHMxNW8r?=
 =?utf-8?B?Y1ErZkM2VWxDK1NZc2RaU0NrZzNhRkhFd2FKSWJZTm8veG5DWkFRUDBRWGdm?=
 =?utf-8?B?L2wxalZ5ZFZONkxnbWU5dDdKbmpmajRtYlFjVHVrS1RzVGFvUzZvL1lGWVE3?=
 =?utf-8?B?MU53bCtSY1VFY0RVZVdnS2NKZmhzOGdDN01icS9Ga0hPZzBMdjdMU1R2WGlR?=
 =?utf-8?B?UlZ1WitxMnhJOUdFY0RxS2YxZVljUFE4cEFYeGp0emlXdTkxK1BVaGpOVUZ6?=
 =?utf-8?B?Tk54N2lid2ptamJPNFQwTVZEOERqR3BMM0lTZjd6VlJDWlpCWVZTTlpPYjFa?=
 =?utf-8?B?Mnc2TmlmT3ZtallZZ2J4blJFbDM1K1l5eVhxdGlHanI1K1FWZklVM2FteGVP?=
 =?utf-8?B?MFdQUHlrVDFJN3htSWcwTDFiVC9RdnRmcUxXWlJlVCszemo1QlpMd1J2VjBH?=
 =?utf-8?B?anEyTzkxWkkwcUZsYzdmYmFqdDRXOTJwRDNKejhlMndTcSs1RjB4d3ZKaHc4?=
 =?utf-8?B?SjR2aGZvT1lTUEk0S21LYWJ1d3Z4bjZUdG9qeGhJVDRKWDZrQm9hT1BoeVpU?=
 =?utf-8?B?SHhnTmhFbjNMSjRBM05yc08rUVFyd0t2R2FJd1lnWGtEMmptTE5SaTZhSDYw?=
 =?utf-8?B?ZkNqZFZXYmhzanZYbm5YTU9iZFg0V1QrWndXeUFKbmUrY20yWG9lZGZ6TDlP?=
 =?utf-8?B?eXZtbjdvSzVvTW53V3lVTE9mc0pKb2ZNWWV5eXpQak5sR2ptWVZpWnh1ODFU?=
 =?utf-8?B?OGJLTk9URGJjRElnd0paT1FCc2J6TjJqRkI2dE9kMmo1bDg0OWtETzh0bHE5?=
 =?utf-8?B?OStLaXpNUGVDdDR4b2ZIb3dCblJsb3RSRHN1U29Ob2FKWDFkKzgzMG1aUmZU?=
 =?utf-8?B?SVdDL05XTy9RaUs1SXhuMFprd0ExWUtSTmFsZmFtQnAwZ3FmcTd5Ums2d1o3?=
 =?utf-8?B?SXRYOWowZE9SS3VPb3U2WVg2NDUwVy9uc2hZeXF1UVdiNGdMV2FKd3VRRlZv?=
 =?utf-8?B?SlFjVng1OTZaYjhTWnQzeTdnZkJVZkxKejF5U0lYN3g2cXY3U2RsWWYvQVFP?=
 =?utf-8?B?dnB2Q09sMkwvRTZEenVTazlidkV0Wlo0WTBMZVVnOHZOWFFHSmdmLzV5SnJo?=
 =?utf-8?B?WFJjRjFIbDFKR3BlaDR3aGFydTlmOFQ2bUpqak15Z3IvazNPSndHNDlpQS9r?=
 =?utf-8?B?QXBwVVlOMEhnVXo0MTMyeTJQZ0Q4SmlzdjE4WDYzcnhvbUJBUDNrc2ZzNThw?=
 =?utf-8?B?VUV2dFVCL2grcDhIZm5CSmMremhiaUo2SXBWaHIyNDIvK1M1T2x2SHpKK29T?=
 =?utf-8?B?aWxBbDc2NGpmQzlRQyswOFJtZU1FWVBPcS95cGVwa3ptcGlWaGpGckY1R3BF?=
 =?utf-8?B?eE5ReXZMcEhvbHVwcHBxeUhSZ0tCMkRFRTR0VEVPb1ZGTXQyUzBSeDVNVzUz?=
 =?utf-8?B?SVEvUm9QUlgyMDZKL2k5UjUyM29rQW5wTWlqMmxueHpON09sNnMvWUY0RjUz?=
 =?utf-8?B?YmxPcTFoVHpwSWtxMHZPUFFLdlYyQVNFUHZRWkxDQ1kvR2hjMTkyUHRyaGRR?=
 =?utf-8?B?YUlvUm1wbnNLbnVEdVMxL015Qm8xbEVtdytEcUdYLzJYSFdBMW9JT29WUk1P?=
 =?utf-8?B?YXI0Zk1WMnhPVVNEV1c3bXViV0M5bkFSWFczNWM3N2M5OE5VS3VyV2VxMlEw?=
 =?utf-8?Q?Ki+aqSD9f9uJRLbA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b830bd87-db18-4283-ee5d-08debfed5fac
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 14:52:16.8815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YofV6mewyVog75XqyprCiYcDy/QmxTkM1uIdQXqQD5GmwB1lC6XzutmJL5zJCbyQhiBAVq2cy2LsfkRJEQamauYKGHzQBnwNjJkXO/b7ES/2HwekirFKwTNJQO6We+iC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026

From: Frank Li <Frank.Li@nxp.com>


On Thu, 26 Mar 2026 05:43:21 +0100, Marek Vasut wrote:
> Add DT overlays to support DH i.MX8M Plus DHCOM SoM variants and carrier
> board expansion modules. The following DT overlays are implemented:
> - SoM:
>   - DH 660-x00 SoM with 1xRMII PHY
>   - DH 660-x00 SoM with 2xRMII PHY
> - PDK2:
>   - DH 505-200 Display board in edge connector X12 via direct LVDS
>   - DH 531-100 SPI/I2C board in header X21
>   - DH 531-200 SPI/I2C board in header X22
>   - DH 560-200 Display board in edge connector X12
> - PDK3:
>   - DH 505-200 Display board in edge connector X36 via direct LVDS
>   - DH 531-100 SPI/I2C board in header X40
>   - DH 531-200 SPI/I2C board in header X41
>   - DH 560-300 Display board in edge connector X36
>   - EA muRata 2AE M.2 A/E-Key card in connector X20
>   - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X31
>   - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X29
> - PicoITX:
>   - DH 626-100 Display board in edge connector X2
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus DHCOM SoM and boards
      commit: 244b25e43c15b6d9e5b5c0f5187743eb2fe7a5b8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
