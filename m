Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B6223A561
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934263; cv=fail; b=sKVQk2r3z/kSYrrb9VQy5lHcprwxrFJfw1N4xiKIkx4/yJiWPSl8DK/5BbXduBQzwqx2NU4B7n7VIFL/jiHHVSlJ3tNQfPAbsUAqriZRHk7pLBo4MAJGSQg54p40o5xyMQs34kkHQWdzTMVEt/reDFiNSXYJId3XdC9satVNK4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934263; c=relaxed/simple;
	bh=3+THJPgIVKPvOSnl8Q2LgeP0qjA5FN5xlf7HXqaRmgE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YgVfZazGCJ98DzROXOeilg+27jP9waUyMctsbWVLCwwKRG0rdcyzcpz5KnIpoq8MXqnEGtMS14UN0Y25T80yiB7J9x+GC/roQ59hoFWZfxEpva9PRoB/A6d1rrWktJ/qKO7OzKYNct9SOwcpyo9p/z7pCrMgJqZAYTKQYzlTfKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=raoTvvyi; arc=fail smtp.client-ip=52.101.69.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="raoTvvyi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzoyweCpXAWAxKFsJ9bK6sO0v8nMg0IvR/MxdqrPeG4Zr+204uSt3MXCiy9hmc4Vy6xGqIThcqNdzvfWIdbjjCtLgnKuF8UdV/7h8cTU70Jt6ExtQEFO6sCSROAhNRNsYZBWl46es0jvVbyyTz7UnejShriJn/f1WCY90OyPe76g0OkFaWDoW8r4YqmbPkQ5q6jiB2ObVzWJuFerWiruUug64ADQFjP3XQu+1eUTzGhGipIC4BVzrphr2KsQLXfy2owKXic8zjTDEIXxkoGj57efldBRYHXfPQc4vMZcH/6tyqJ3hICFp5+7U5/+oiwC8md4pj+TaN6xhGNaavJrSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0LN51A4h3pio/ijjg4m8ye1GPc46EkNoxQioCri0xk=;
 b=v+Q5SApmHdfTi+ewf4hblApezsLzvqboil5Lkl+tJiHboOlJxFf3HQLQSH2vCSdLpwDY2mG7oyksWzR48GSGbuLdu3b/7c7DNPVLnnNWjllhO4u3AeYscK2oSpoAXxDuOmQukWHsicJ9XzbYAEANuU/2jNR3PNlwKpo+b3wt0cf8ZTmGaG1nIlQAUnZF2CebplRNH4XVFyB4D4IhC4AmjR1XPS3r4wsaXuC2h+34xNSsXiOeB/rU9Qxmk+aQQyNIByosMAM4KGJu669QYXDjmYO1KOcfWORbi8i55ccAuE6Kf8TLruHLt9Veb9n7stb7AoiD/UPhug2WiuARRSESRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0LN51A4h3pio/ijjg4m8ye1GPc46EkNoxQioCri0xk=;
 b=raoTvvyiGReRv+AS9Al0M+yfXCwfskqDM94TUXoPL2gvSsLc0Ft3pAaaJhWiHJysJKlKxrt6kO1Rj3sIGgnMkLKU3fzHpM3YbmxrYI5UcPiG/GRi4fqJP1EFpoKNs62sdbliJ09MxWmtco8B6nixdtTZkO1ZhLlf+uU+6u31HeaIeouvBD9LFJKehCqOB8iOsDMeOm1vZFchwfTYr0DEQsuAC0yIRhyAKyghdm4WRHkXXFVT+HgGHCldFNLZVBzCWnaSj8Z8rdKuHt6d7fAiRZJevXTVatSsqkksOznzdHiPfStUIZtxzllnDqrd2kaXXk9K2vWLWOzi21TQmluWbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB8009.eurprd04.prod.outlook.com (2603:10a6:10:1ef::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 15:57:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 15:57:37 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX arm64 dts for v7.2
Date: Mon,  8 Jun 2026 11:57:30 -0400
Message-ID: <20260608155731.2323181-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0067.namprd11.prod.outlook.com
 (2603:10b6:806:d2::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: d34c79f7-40d9-4510-8972-08dec576a95c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	OOW14SS4Z+l6iZA7Q5+q75aR1Kl6R2K8DySZE9UXu7z52FQctPzEhUCS7tOibO0k8I+/ij7OOw7gB7NEUiUKrHOwO1vuR9m2PP6CkrsNWnM+HBqprxGd8epv/isANNv2XFqc9qlGJQlfSuks+Av72vNbeHXV9ndvx9FooIRgkmkNxbGj1uooOR0iJFS+ZbqjRcNyUVQbNdtZKQnyVkFO2skqz0LxgSR97D88f/Y+m/OMnM8HR5IvH1RF4uhpuxlZdpx6CkNNW9X3mENuQNMnpvxyzQJfQdqewwINh3n5n85cMT8gKh+pyfPPnEV1ZoS43gJ/qs5IeatJKP7TfxtBEEvaclGd21cqzrFtKsIqIHFECm8Jlmv4RgIZYTYZoSpYSpRlqp30KM52Butm59FQzNzIVTBM0f266d63G7BtNVXAOjkWxec8DOIwC9eAvOTXXInXuxesW6R34iMc+lJSIOtDogqZc35QnWNxJ3pjFc9TdcOhHShut7UQbKs1pER0akcoiTAAEkLnjCGmIE6vgwTKJKOLo0QEC7a2FosmbdBqTy6ltnQKj3cWyGXpRxpjhrRg9QIfZkLzqctIEKCBxIZtfDaGly2p1e22oyJBi36Lnm35VGtC1pdQB+iXNFcaQCpZw5x0zSpv9j9ql5m3FuPWg/MgLjW+RL3TOnQOtW8dmoqEHoRHPmr8/uJy9uuk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VS9iT3VoZDFDSzM5NTMxNXZScWhDd0tHVk5GSXhvbUtlTnY5QS9RS3U2MTVi?=
 =?utf-8?B?Y1RBcTcrMzgzUmk3TDNkd3NwaUdFMzF4d1kwQlExUVhXQUNkbFkwWGVlMmd2?=
 =?utf-8?B?MlNUK2d0QllpcVJPSWRtOUJqZVh6TDgwZ2FQcnRPK28xL25BSWd0aDFZRUJs?=
 =?utf-8?B?WHkrcG1sbTdFUW94Q3hINWFKeS9LVDNEYTVFaUxUQ3hsd2NrbWk0L25QblFG?=
 =?utf-8?B?Mk1ZeGZJRWpyOWtCY0dSSjBFUUJ4blkvd0lWOXMzT1kzbnVuMkMzNkU3ek1j?=
 =?utf-8?B?V0pzdVcrdWhhekM4Y1pRRi9DQnFTdldFK0NaMUFVWjE4aUIzZVZVdUt6UStI?=
 =?utf-8?B?VU1nWGppdHZyNG9pN1dhZ28vaUNweTEyak1JeUJBSmd3eHRIT1F2YlFXUjYz?=
 =?utf-8?B?NnZhendXanJ4anZaUWgrNFpoUERWNC9RU1l5YzNyekVpeVhSbkJZTnJnYi9X?=
 =?utf-8?B?NHU5KzM2dEFLaU5NSU9QZ0xvcmlGZWExL3ZYZml3d2lmcDg4a2RiQ1VLVW1w?=
 =?utf-8?B?TnNlazArWDYweVVWRDRJL1R0WXJIQmJaVDV6WlppSUo5MndocGw1UENWT2dP?=
 =?utf-8?B?bGJYU0lXRlh4NHFSczdBUlJnb1QxVk5oeGZDRnVkS3Rhc0ZwdktSNWhvVmlq?=
 =?utf-8?B?RHFEVkRaRERDNEVzcFNXWlFnQnUySm5YZWxpWm5uMWFwa05mV0tES1R5YTNQ?=
 =?utf-8?B?ZUtUbnk5UkxUTElvbkg5a2Y0SXdvaWc4UVdMdGFmS1V6eGp1L2JSalB4QnQ3?=
 =?utf-8?B?c2FsNHNBbDdtdXZIZ05Wc2dBS3RhQjlYRFhnS3N4OFcvQVUrMUw4UG5sUmov?=
 =?utf-8?B?SXlsb0QveHhveFBLNnNseFFNY1c5cllpVFNOWWN3YzhvcEc2YWlyeHF0L090?=
 =?utf-8?B?cHhRZ2Z0YUtCWHh4bHpuUDhQckZGZThsajdEYW5jRnc4aWRidThFQUhWZTJY?=
 =?utf-8?B?TWY3L0tDM09hd3hHWWdJdGpYZDNsK2lKN1ZXQytvcWgxaEFNOUtRaWlQb1c1?=
 =?utf-8?B?Q3hmL0VkN0FyS1N2VEFKdEN5dklEejcrNUYzTitzM2d5TUd5S1lmUXJEUUNV?=
 =?utf-8?B?d1krc1dxWlRmM1BPdlNsWkl5VndlM3M3ZGpyOUh5OHlFT1J0QXRpbWFSbi9z?=
 =?utf-8?B?ZFZzM05SU0VaTkNVRENoVXNwRWwzUEltWHBHRVl6ZU81dEh1TjU4aFQ3UHpP?=
 =?utf-8?B?Sy9FU2VYbzhqTVNidWE4WHU4ZllsTTlpU1poRUNPd3VxZk9oRGZ1ZXovYndE?=
 =?utf-8?B?ekU3VVRic3phQ3FGdENBYm1sOE82YUtKZjBMNjJ2RXptcFpXV3pGU1RkTEg3?=
 =?utf-8?B?SEtXS1VsRkdkc0lNc0FUQmNlN1BUWGg5aEhpdHZ2bG80L3FDSnlZMkFVSkhH?=
 =?utf-8?B?M0VHdWhwQk1RdFBhNHRidEtKMEI5Rjd0UTM2UU54RWd6Tk81V205S2hsc0tt?=
 =?utf-8?B?MTcxRytkM1JaWGh0VmxnNjdGd3k3MlhPNlBRNktlYkFoOGdSSUdId1pSK05I?=
 =?utf-8?B?ZlZ3K1lldkJMWk5VMjRQRVhlcWpXS1hISU5NckVMOTZkaXBKSjBYSWRjcjc2?=
 =?utf-8?B?M01od1pjVVBkVEY3RWJzS2k2dzNJV1FZZU1DTlBPZW5rM20yYzlFb1VjYnla?=
 =?utf-8?B?R1FPN24ySFpFbDEwOTFwWG8wLzZwWnBYbzJLUVNoYnJVcFd2UVZ0T3JWZE0w?=
 =?utf-8?B?QkpDNGxGYTBwTkcrQVV5eDdVTjBINVo0WmZ2WE1sMk9xaFB0RVZlK0pCWHZE?=
 =?utf-8?B?R21uVlh3OG9hWG04NWZwY2ppaHlId3hSRG5KaDhCV0E2ZVY5eTVWd2ZydSs5?=
 =?utf-8?B?c0dLdUxqOEdCUFZGcGFjNEVpengvNVYyOGVSWjdrVG13MkdPVE5xd2d2dC90?=
 =?utf-8?B?Q3Y5a2ZGRFVvbS9wL2UvazdIOUlVQ2tML0JyUnllendXaTdxM0JVeDJGQTdz?=
 =?utf-8?B?VG43Z3dnWWtYRms0dXlkcVIvNGtZTVQrcXo0OThOL3M5YldHd28wV2U3Rnlh?=
 =?utf-8?B?eDBORkNteStxWG9yV1hrRytORHRxUWEvdWppY2ZFcTM4NlNmSWlTRGhNK1pC?=
 =?utf-8?B?VDlBM0xWQk1DdDgwTlh1MHdZdG4wa3AwUU40WFNuYXVLYnorbnozVHJ0enJR?=
 =?utf-8?B?d2YyMENKcG1SQTQyWm9aaDlGM1F6dGxIaHB5eHBBSVVOd1IrS1JqVFVkSFNj?=
 =?utf-8?B?VFQ4TlRCWFprUnd2MDVXK3ZNTlYwVDZhSjhJR2JRTWxnSk9HL3hzbTJIbTdX?=
 =?utf-8?B?Y2VVeVZvM3N2QUVDTU1IbFhhUW1zcytjeXRMc0Z4RURzajJQbS94QnBKTXhQ?=
 =?utf-8?B?bWhoSHVzSlNrU0k3UTljditNSGNlYWdjRDZSREFvUHVLdmg2RkREVGp2SUd4?=
 =?utf-8?Q?bMpv492JFuMEk48U=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34c79f7-40d9-4510-8972-08dec576a95c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 15:57:37.4578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V16RZ8yEOeKM9WeG4+69jUrcoU6IVMhV/DbT20l2Nrc7jnL/9l4PZ3gaBGa4CGak9+6sKZB/NthpGNsnBzzjwNmgCokjGe3bkOal5bfbSR+juFhjWv3iLxSNuPtYTzsr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8009

From: Frank.Li@nxp.com

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt64-7.2

for you to fetch changes up to c10cfc952215644956284a42fa7b7860dfbcb5f5:

  arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18 overlays (2026-06-05 13:21:22 -0400)

----------------------------------------------------------------
i.MX dt64 changes for v7.2

New Board Support:
  Added 15+ new boards including i.MX95 (FRDM PRO, Aquila, Audio Board v2),
  i.MX93/91 (Variscite DART/VAR-SOM), i.MX8 (TQMa8QM, SolidRun i.MX8DXL
  HummingBoard), Toradex Verdin Zinnia variants, and LX2160A Half Twins.

PCIe Improvements:
  Added Root Port nodes and PERST properties across
  iMX8MM/MP/MQ/DXL/QM/QXP/95, new PCIe support for iMX94/943, common M.2
  PCIe overlay, fixed outbound address space configuration

Graphics, Camera and Display:
  Mali G310 GPU for iMX952, HDMI for iMX8MP PhyBoard, extensive DH
  Electronics panel overlays, Extensive overlay ecosystem for DH
  Electronics iMX8MP boards, PhyBoard PEB-AV-18, camera (OV5640), and
  ethernet configuration overlays

Peripheral Support:
  S32G2/G3 PIT/ADC/PWM, iMX8ULP CSI/ISI, iMX943 SD WiFi, USB hub for
  LX2160A, TPM/CAN/ADC support for Variscite boards, Bluetooth and UART
  enhancements for Toradex SMARC boards.

Enhancements
  Added gpio-line-namesacross PhyBOARD platforms. Watchdog reset pinctrl
  configurations for iMX91 boards, Ethernet PHY reset GPIO support.

Bug Fixes:
  Corrected DDR PMU interrupts, SMMU registers, watchdog addresses,
  interrupt flags, GPIO configurations, PHY reset handling, and RS485
  polarity, USDHC signal configurations for PhyCORE SoMs.

----------------------------------------------------------------
Alexander Stein (3):
      arm64: dts: freescale: add initial device tree for TQMa8x
      arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster
      arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in audio codec as well

Alice Guo (2):
      arm64: dts: imx94: fix DDR PMU interrupt number
      arm64: dts: freescale: add bootph-all to watchdog nodes for i.MX platforms

Antoine Gouby (2):
      arm64: dts: freescale: imx95-toradex-smarc: replace deprecated gpio property
      arm64: dts: freescale: imx95-aquila: Add Clover carrier board

Christoph Stoidner (1):
      arm64: dts: freescale: imx{91,93}-phycore-som: Improve USDHC signals

Florijan Plohl (6):
      arm64: dts: freescale: imx91-phycore-som: Add gpio-line-names
      arm64: dts: freescale: imx91-phyboard-segin: Add gpio-line-names
      arm64: dts: freescale: imx93-phycore-som: Add gpio-line-names
      arm64: dts: freescale: imx93-phyboard-nash: Add gpio-line-names
      arm64: dts: freescale: imx93-phyboard-segin: Add gpio-line-names
      arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18 overlays

Francesco Dolcini (8):
      dt-bindings: arm: fsl: Add verdin imx8m[mp] and imx95 zinnia board
      arm64: dts: freescale: imx8mm-verdin: Split UART_2 pinctrl group
      arm64: dts: freescale: imx8mm-verdin: Add Zinnia
      arm64: dts: freescale: imx8mp-verdin: Split UART_2 pinctrl group
      arm64: dts: freescale: imx8mp-verdin: Add Zinnia
      arm64: dts: freescale: imx95-verdin: Split UART_2 pinctrl group
      arm64: dts: freescale: imx95-verdin: Add Zinnia
      arm64: dts: freescale: imx95-verdin-ivy: fix RS485 RTS polarity

Franz Schnyder (4):
      arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
      arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5
      arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for WIFI_UART_EN
      dt-bindings: arm: fsl: add Aquila iMX95

Frieder Schrempf (2):
      arm64: dts: imx8mp-kontron: Reduce EERAM SPI clock frequency
      arm64: dts: imx8mp-kontron: Fix GPIO for display power switch

Guangliu Ding (1):
      arm64: dts: imx952: Describe Mali G310 GPU

Guoniu Zhou (1):
      arm64: dts: imx8ulp: Add CSI and ISI Nodes

Joseph Guo (2):
      dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO board
      arm64: dts: freescale: add i.MX95 19x19 FRDM PRO board dts

Josua Mayer (11):
      arm64: dts: lx2160a-rev2: extend 32-bit and add 64-bit pci regions
      arm64: dts: lx2162a-clearfog: use rev2 SoC dtsi
      arm64: dts: lx2162a-clearfog: cleanup superfluous status properties
      arm64: dts: lx2162a-clearfog: specify sfp ports led colour and function
      dt-bindings: arm: fsl: Add solidrun lx2160a twins board
      arm64: dts: lx2160a-clearfog-itx: remove redundant dts version tag
      arm64: dts: lx2160a-clearfog-itx: move shared includes to dts
      arm64: dts: lx2160a-cex7: add usb hub
      arm64: dts: Add support for LX2160 Twins board in single configuration
      dt-bindings: arm: fsl: Add SolidRun i.MX8DXL SoM and HummingBoard
      arm64: dts: imx8dxl: Add SolidRun SoM and HummingBoard

Joy Zou (10):
      dt-bindings: arm: fsl: add i.MX91 9x9 QSB board
      arm64: dts: imx91-11x11-evk: remove unused property clock-frequency from mdio node
      arm64: dts: imx93-11x11-evk: remove unused property clock-frequency from mdio node
      arm64: dts: imx93-9x9-qsb: remove unused property clock-frequency from mdio node
      arm64: dts: freescale: add i.MX91 9x9 QSB basic support
      arm64: dts: imx91-9x9-qsb: remove unused property clock-frequency from mdio node
      arm64: dts: imx91-9x9-qsb: add pinctrl for wdog3 reset
      arm64: dts: imx91-11x11-evk: add pinctrl for wdog3 reset
      arm64: dts: imx91-11x11-evk: add reset gpios for ethernet PHYs
      arm64: dts: imx91-9x9-qsb: add reset gpios for ethernet PHYs

João Paulo Gonçalves (1):
      arm64: dts: freescale: add Aquila iMX95 support

Khristine Andreea Barbulescu (3):
      arm64: dts: s32g: add PIT support for s32g2 and s32g3
      arm64: dts: s32g: add SAR ADC support for s32g2 and s32g3
      arm64: dts: s32g: add PWM support for s32g2 and s32g3

Krzysztof Kozlowski (5):
      arm64: dts: imx8mn-vhip4-evalboard-v1: Correct interrupt flags
      arm64: dts: imx8mn-vhip4-evalboard-v2: Correct interrupt flags
      arm64: dts: imx8mp-ab2: Correct interrupt flags
      arm64: dts: imx8ulp-evk: Correct Type-C int GPIO flags
      arm64: dts: s32g3: Fix SWT8 watchdog address

Liu Ying (1):
      arm64: dts: imx93-9x9-qsb: Add tianma,tm050rdh03 panel

Marek Vasut (2):
      arm64: dts: imx8mn: Sort ifm VHIP4 EvalBoard Makefile entries
      arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus DHCOM SoM and boards

Maud Spierings (2):
      arm64: dts: freescale: moduline-display-av101hdt-a10: add backlight
      arm64: dts: freescale: moduline-display-av123z7m-n17: add backlight

Nora Schiffer (1):
      arm64: dts: freescale: fsl-ls1028a-tqmls1028a-mbls1028a: switch mmc aliases

Paul Kocialkowski (1):
      arm64: dts: imx8mp-phyboard-pollux: Add HDMI support

Peng Fan (5):
      arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
      Revert "arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal"
      Revert "arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal"
      arm64: dts: imx95: Correct SMMU reg
      arm64: dts: imx95: Add SMMU PMU nodes

Primoz Fiser (2):
      arm64: dts: freescale: imx{91,93}-phycore-som: Set BUCK5 in FPWM mode
      arm64: dts: freescale: imx{91,93}-phycore-som: Adjust PHY RST drive-strength

Richard Zhu (4):
      arm64: dts: imx94: Add pcie0 and pcie0-ep supports
      arm64: dts: imx943: Add pcie1 and pcie1-ep supports
      arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support
      arm64: dts: imx95: Correct PCIe outbound address space configuration

Shengjiu Wang (2):
      dt-bindings: arm: fsl: Add compatible for i.MX95 15x15 audio board (version 2)
      arm64: dts: add support for NXP i.MX95 15x15 audio board (version 2)

Sherry Sun (13):
      arm64: dts: imx8mp-evk: Disable PCIe bus in the default dts
      arm64: dts: imx95-15x15-evk: Disable PCIe bus in the default dts
      arm64: dts: imx: Add common imx-m2-pcie.dtso to enable PCIe on M.2 connector
      arm64: dts: imx8dxl-evk: Remove unnecessary PCIe EP properties
      arm64: dts: imx8qxp-mek: Remove unnecessary PCIe EP vpcie-supply
      arm64: dts: imx95-19x19-evk: Fix PCIe EP vpcie-supply
      arm64: dts: imx8mm: Add Root Port node and PERST property
      arm64: dts: imx8mp: Add Root Port node and PERST property
      arm64: dts: imx8mq: Add Root Port node and PERST property
      arm64: dts: imx8dxl/qm/qxp: Add Root Port node and PERST property
      arm64: dts: imx95: Add Root Port node and PERST property
      arm64: dts: imx943-evk: Fix PCIe EP vpcie-supply
      arm64: dts: imx943-evk-sdwifi: add a new dtso to support SDIW612 WiFi

Stefano Radaelli (15):
      arm64: dts: imx91-var-dart-sonata: add RGB enable supply for PCA6408
      dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
      arm64: dts: freescale: Add support for Variscite DART-MX93
      arm64: dts: imx93-var-dart: Add support for Variscite Sonata board
      dt-bindings: arm: fsl: add Variscite VAR-SOM-MX91 Boards
      arm64: dts: freescale: Add support for Variscite VAR-SOM-MX91
      arm64: dts: imx91-var-som: Add support for Variscite Symphony board
      arm64: dts: imx95-var-dart-sonata: add TPM reset GPIO
      arm64: dts: imx95-var-dart-sonata: add CAN controller
      arm64: dts: imx91-var-som-symphony: fix RGB_SEL handling
      arm64: dts: imx93-var-som-symphony: add TPM support
      arm64: dts: imx93-var-som-symphony: enable UART7
      arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
      arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
      arm64: dts: imx93-var-som-symphony: enable ADC

 Documentation/devicetree/bindings/arm/fsl.yaml     |   37 +
 arch/arm64/boot/dts/freescale/Makefile             |  163 ++-
 .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi          |    4 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |   41 +-
 .../boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts |    2 +
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |    7 +-
 .../boot/dts/freescale/fsl-lx2160a-half-twins.dts  |  830 ++++++++++++++
 .../boot/dts/freescale/fsl-lx2160a-honeycomb.dts   |    2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi |   48 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   24 +-
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    |   37 +-
 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso     |   15 +
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi    |   11 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |    7 +-
 .../freescale/imx8dxl-hummingboard-telematics.dts  |  560 ++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi  |  458 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |    5 +
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts |   10 +-
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |    7 +-
 .../dts/freescale/imx8mm-verdin-nonwifi-zinnia.dts |   21 +
 .../dts/freescale/imx8mm-verdin-wifi-zinnia.dts    |   21 +
 .../boot/dts/freescale/imx8mm-verdin-zinnia.dtsi   |  383 +++++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |   16 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   11 +
 .../dts/freescale/imx8mn-vhip4-evalboard-v1.dts    |    2 +-
 .../dts/freescale/imx8mn-vhip4-evalboard-v2.dts    |    2 +-
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts       |    2 +-
 .../imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi    |   37 +
 .../imx8mp-dhcom-overlay-panel-clock.dtsi          |   33 +
 .../imx8mp-dhcom-overlay-panel-common.dtsi         |   31 +
 .../freescale/imx8mp-dhcom-overlay-panel-dpi.dtsi  |   35 +
 .../imx8mp-dhcom-overlay-panel-etm0700g0edh6.dtsi  |   53 +
 .../freescale/imx8mp-dhcom-overlay-panel-lvds.dtsi |   22 +
 .../imx8mp-dhcom-pdk-overlay-eth2xfast.dtso        |   10 +
 ...dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso |   40 +
 .../imx8mp-dhcom-pdk2-overlay-531-100-x21.dtso     |   32 +
 .../imx8mp-dhcom-pdk2-overlay-531-100-x22.dtso     |   32 +
 .../imx8mp-dhcom-pdk2-overlay-560-300-x12.dtso     |   25 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |    2 +-
 ...dhcom-pdk3-overlay-505-200-x36-ch101olhlwh.dtso |   53 +
 .../imx8mp-dhcom-pdk3-overlay-531-100-x40.dtso     |   32 +
 .../imx8mp-dhcom-pdk3-overlay-531-100-x41.dtso     |   32 +
 .../imx8mp-dhcom-pdk3-overlay-560-300-x36.dtso     |   24 +
 .../imx8mp-dhcom-pdk3-overlay-732-100-x36.dtso     |   36 +
 ...mx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtso |   56 +
 ...m-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29.dtso |   32 +
 ...m-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31.dtso |   32 +
 ...dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640.dtsi |   64 ++
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts |    2 +-
 ...com-picoitx-overlay-626-100-x2-ch101olhlwh.dtso |   77 ++
 .../boot/dts/freescale/imx8mp-dhcom-picoitx.dts    |    3 +
 .../imx8mp-dhcom-som-overlay-eth1xfast.dtso        |   85 ++
 .../imx8mp-dhcom-som-overlay-eth2xfast.dtso        |   29 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |    4 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |    9 +-
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts |   14 +-
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   |    7 +-
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   62 ++
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |    3 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |   24 +
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso |   19 +-
 .../dts/freescale/imx8mp-verdin-nonwifi-zinnia.dts |   21 +
 .../dts/freescale/imx8mp-verdin-wifi-zinnia.dts    |   21 +
 .../boot/dts/freescale/imx8mp-verdin-zinnia.dtsi   |  422 +++++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   14 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   11 +
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   10 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   22 +
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |   10 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |   22 +
 .../boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts    |  871 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi  |  325 ++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |    6 +-
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |    4 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   67 ++
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |    4 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |   15 +-
 .../imx91-93-phyboard-segin-peb-av-18.dtsi         |   93 ++
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |  435 ++++++++
 .../freescale/imx91-phyboard-segin-peb-av-18.dtso  |   57 +
 .../boot/dts/freescale/imx91-phyboard-segin.dts    |   24 +-
 .../boot/dts/freescale/imx91-phycore-som.dtsi      |   39 +-
 .../boot/dts/freescale/imx91-var-dart-sonata.dts   |    9 +
 .../boot/dts/freescale/imx91-var-som-symphony.dts  |  527 +++++++++
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi   |  456 ++++++++
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |    3 +
 .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |    1 -
 .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi       |  110 ++
 .../imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtso       |  106 +-
 .../freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso |   14 +
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |    1 -
 .../boot/dts/freescale/imx93-phyboard-nash.dts     |   39 +-
 .../freescale/imx93-phyboard-segin-peb-av-18.dtso  |   57 +
 .../boot/dts/freescale/imx93-phyboard-segin.dts    |   24 +-
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |   39 +-
 .../boot/dts/freescale/imx93-var-dart-sonata.dts   |  654 +++++++++++
 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi  |  461 ++++++++
 .../boot/dts/freescale/imx93-var-som-symphony.dts  |   61 +
 arch/arm64/boot/dts/freescale/imx94.dtsi           |  102 +-
 .../boot/dts/freescale/imx943-evk-sdwifi.dtso      |   15 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |   85 +-
 arch/arm64/boot/dts/freescale/imx943.dtsi          |   75 ++
 arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dts  |  669 +++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |    9 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   12 +-
 .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1021 +++++++++++++++++
 .../boot/dts/freescale/imx95-aquila-clover.dts     |  285 +++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts |  389 +++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi    | 1160 ++++++++++++++++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts |    5 +
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |   46 +-
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |   29 +-
 .../arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi |    1 -
 .../dts/freescale/imx95-verdin-nonwifi-zinnia.dts  |   21 +
 .../dts/freescale/imx95-verdin-wifi-zinnia.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-zinnia.dtsi    |  429 ++++++++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi    |   18 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  129 ++-
 arch/arm64/boot/dts/freescale/imx952.dtsi          |   47 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |   66 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |   70 +-
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |   78 +-
 122 files changed, 13347 insertions(+), 267 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-telematics.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-clock.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-dpi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-etm0700g0edh6.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk-overlay-eth2xfast.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-531-100-x21.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-531-100-x22.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2-overlay-560-300-x12.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-505-200-x36-ch101olhlwh.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-531-100-x40.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-531-100-x41.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-560-300-x36.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-732-100-x36.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-ea-murata-2ae-x20.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x29.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640-x31.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3-overlay-nxp-spf-29853-c1-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overlay-eth1xfast.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som-overlay-eth2xfast.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-93-phyboard-segin-peb-av-18.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-9x9-qsb-tianma-tm050rdh03.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-ab2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-zinnia.dtsi
