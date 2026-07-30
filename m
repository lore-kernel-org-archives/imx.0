Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011048.outbound.protection.outlook.com [52.101.70.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3572AE76
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429472; cv=fail; b=jpguxY/asrPpYZ0vKsPwkcxyk5FS1aqOeeMnoF8qzzHODx4DVATWPjvHgfDYCe+TYhLUwhM18W7KlQTCjY2MZkttqlZuQPDbaKRjptHjrQxP/Vpbc8EHwwiS+b+sbeRE8lAfMchVXnah73Yln8akkXu8Njd1y0LBGpYUbaA6exI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429472; c=relaxed/simple;
	bh=UUcPG3IxPw3AUmBTqcRnpZaNTIdFTbtgrKvh0Wo5twk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZHCri+P+3n7xi8hpKp/yyQatAX59HqBuPRZnQuUmynHWM2y+iMAxOaTdKAdtzpR0K1OIU2Q66oAK0CXQA8KlE0VdyT5hK3RplfUjNMSWD9M/AwIWvTEKL48w1fjsPWVqBt0lKIm+E6t7UDkRrtlnZbQxhrpjqMd0CpMGWkUleaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=frxtk+mG; arc=fail smtp.client-ip=52.101.70.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="frxtk+mG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DGBpEjcn3vovE4WE5GnPtaH8KjoqrnxxH0jbwuLyZ1RwKQrJM+LhvcciDAM+N9Z2Eegg8/Aspzcf+zX9g8lWYmCTsLlvVANLCq1glOCDR5f0JpZDvWO4E2xAp7OMFdSp6x99gJ9WX0p9sk/64g82aAAXUfcxUqtcMIFoQBBCLnruTi1UaRk2bTcCEGzbqb5ZmVO7XuYgAsE1ZCbu0cIFscXTvhKMivCvMzjjNjPJQ1Svt3BB3kUQWJA3FNaP38lt1oISSF3ZRfZJyPe8By0hxzQFyHif4KQ6YE0F/3OzFhCruWtYXFlja97DbT1F9vz/ofiLCi/MKWl5BZpQOS90nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEWeUeXC6ho9WavcR1xcu6t3WZq+lhnrzjvn8DxL8mA=;
 b=nDYVV4lBShdAWosHseYc66b2wTFDFDw6b9pKllImtchV7yxnNMkVtVlUX8qs1ByK5YJpypuwIpNzQyiOCTpGek3KOjn9PY3RS1Xw+sxf0bgmk5k0D+/6AFpsOa2IPyZOpmrlLYk5mz8Hc445Nnge+hbGG39Aa6fD2Jgt4xVmg4p8N6AkGiPrvVTJbhkHlbr8650XT57UKE8sQZEi14A7cKlOdRFQ/SWihRmEAh2l6TDc8biRSWHArHD3QQrP6BD3AWwR6MPbOfBs8EYqTUCRVxgPMmigRMwbwVPLyt3NzU62MFdIfzyjsOeH3oN/IS500xsIqPfwVu1AyVdp3+Ea8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEWeUeXC6ho9WavcR1xcu6t3WZq+lhnrzjvn8DxL8mA=;
 b=frxtk+mGxwcgvaSxgbSOr1QCYRIPH9Ademp8iMS3hnMy7V7TBmo6qWEsV0C3YIZ6H9HSk5bci8sqVPPr5cJrIhwow3VZLnmOgXhvQ/DMICextc0vMbO2BuX30tFwKAuHTxD+LomeD3Qo3FgwQr+lA2qQdKMIP1xqua/h/fvQgBnlC2QNr4frz3k4qx/b8rP5x63i08GcsExG95vuH5a2NXL9vCtYHgYKYw65BnQFFqEbLdlMr2uMI7w2A1s0uc8iFXkg8B3j0ZrTdsHDABPbRgj7antiUxPfhD4kcxJgKEVCIFpl3YPNsjlWxiX2difdVs4r3SArGjRMJDr5Nx8KEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by OSKPR04MB11365.eurprd04.prod.outlook.com (2603:10a6:e10:95::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 16:37:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 16:37:41 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Alexander.Feilke@ew.tq-group.com,
	alexander.stein@ew.tq-group.com,
	biwen.li@nxp.com,
	chancel.liu@nxp.com,
	ernest.vanhoecke@toradex.com,
	error27@gmail.com,
	esben@geanix.com,
	francesco.dolcini@toradex.com,
	frieder.schrempf@kontron.de,
	haibo.chen@nxp.com,
	han.xu@nxp.com,
	hongxing.zhu@nxp.com,
	ioana.ciornei@nxp.com,
	khristineandreea.barbulescu@oss.nxp.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	Markus.Niebel@ew.tq-group.com,
	Martin.Schmiedel@tq-group.com,
	paul.gerber@tq-group.com,
	peng.fan@nxp.com,
	ping.bai@nxp.com,
	p.zabel@pengutronix.de,
	shengjiu.wang@nxp.com,
	sherry.sun@nxp.com,
	stefano.radaelli21@gmail.com,
	stefano.r@variscite.com,
	victor.liu@nxp.com,
	vladimir.oltean@nxp.com,
	wei.fang@nxp.com,
	xu.yang_2@nxp.com
Subject: arm64: dts: NXP device tree updates for v7.3
Date: Thu, 30 Jul 2026 12:37:33 -0400
Message-ID: <20260730163735.1554523-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0110.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|OSKPR04MB11365:EE_
X-MS-Office365-Filtering-Correlation-Id: 733c564f-bd9b-45a6-295a-08deee58dfa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zmEW5gVPP9wp+rrOIKTKh5PKculH1Kt5KoT2dRgZ7IX9/STII3wyjpzrXDvXC3WcxecmdJErUeuGVFQDnCb34AhmTGen4yR2r5sxDCXoKE8inGlBN+vJsUSxrWS9E2u21aa+TLyIsmfa/DSDd+kpUibRGcaOAo0HKv8FDUdIml/v/65feUJl4Oi5oFrm9R7oIdb5ekZkrKH8Ooz80tO99rBkRTadUZQtveObFD2u0xJuS0FC3DRSqcZtgua8/5DoTdz/wrp2vlMZqhClFtXW1VZxBOzYk0pox3ifzU8IfIK0jZ2s/2aIjskEimxlV+1Yoj82qwJa6F7pG/2nlTAMkGp+XdgiT/+8Bdno11hTY0+seBPm6bFkaFgLyej8uKtW7508WQ5AqyvRIDl62RJVym/zzFS+gfkhIm1lEFSD7LHNmMhyGkILZBcps8QF+mpGZ18zCQf50wEb9erngip9V+OXJvKpwqmHYTSzSl+uAE5di2QktnUOqB6/550z09SwFbaevCL53j0p81y0SkVlvNa+UEsO/jtfitzLPBel+ih6gyToW/CAkBQloxKFn08OMnTuCkrb34Xx5GHt/5vMgMX++ebcMJgpx0+YWAdiWBX4+lYK22SPTPhiNH3Gcr0VJ/JBYo6w1TbexEALj2nIkXwLgL8aqfF5rk/nWd4AINQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cf+77LB9SQHGMMl4nbI9tQHTb6HzB3x9Qy0/JlYkY9L/Pppfyvgt2gfB2qbg?=
 =?us-ascii?Q?zlvyzVjB4W10UCXYzcJm1z2So8ourKUa9d3XajcTrtpjKLt6wejz1Wq1ajaE?=
 =?us-ascii?Q?fDYyLX1EDGD7Z4F+RBFvnO0oLLMWRLExVSJfDDL8ml/lGtYpowhQY7cG63dX?=
 =?us-ascii?Q?JDpvbi2now4vSjxzs99fZGA/mi/KwtmXUAkATMOsE5M3WfTMuPQlLFTUHND3?=
 =?us-ascii?Q?56xYEPA4BSTigVYny8DwulJd5yNbeDBQisDeP6Q3kRVi3cx4R1aFNdrk3u1u?=
 =?us-ascii?Q?NQY0fwCupMcXOtNWd3y/JlC/xwzWV4vPTsdc4EOpr4R99ZaAPTW/A5GOfQc4?=
 =?us-ascii?Q?BtmDa9apC8L/1F7xgGi1Vb4ZRgLeqomMddh7DeIfVgKTm5gEp6n/7qZONR5O?=
 =?us-ascii?Q?uwH84zCfvWpqq0tciRMPC7rvljYYk6wxxD7DMenOm4BEg/c1u2G6tQAKEBJS?=
 =?us-ascii?Q?LP1mfzS5WsZVJWxaeVaYsYz3ZF+cQqIFIVvxQ2wSPwnExJ+f1xT1FNUhh1j/?=
 =?us-ascii?Q?Cm+1kljSY7i258RJzImhAtUHeNUNE30VLRGb9wNC0BDxom4SsCORoQnMCuUI?=
 =?us-ascii?Q?0ky3/Ein3eYRDsaKH88pwgZT4Z8j+9bwM4apOP2UrF4ANEXE2vO313MYBGj5?=
 =?us-ascii?Q?O97qaFdxXTVFrQZX2/FMkOmT4OPlErzG+ArnKgCy35uITNgOxNJ7s4cEG/df?=
 =?us-ascii?Q?7HG3ijWqhdbKdlNj+tqyXgvXZLvL0paLz1g0rv+PKhP0hnay2pHk33OmBojy?=
 =?us-ascii?Q?0stalJE9rzAWG0IgvAiWrYw6LPvbQ5CiaSSYNNhEPLDaSIJzS5bCZCFns+r+?=
 =?us-ascii?Q?M5l63EjVeyaDgfLPF7QoYwSXO7gJwK6zzoWbZztuo6rRXYquXDdsJqYDOl8+?=
 =?us-ascii?Q?2rFJsoNIIwYxqioztIfZIKjlhzNYuOwHzGYAZryLGwsUR9sebcnqCyLS4dJM?=
 =?us-ascii?Q?sFqk0nL6QPZTsuvhqQhHuj6VOFE7r72rMZcbAYo7YP3lfP1hECvjifk1YLJ2?=
 =?us-ascii?Q?yBDidSHbl0ukVpOC/0+yHbytxGilsEjJ7Iuj4v1rp7ColFlqe3uxlRpp+U8E?=
 =?us-ascii?Q?AoxAewXruY+8rZmt7EY1E6VVBFxsfKgKw2OnwceKJ0+UrN0iLWdExqPMhIQO?=
 =?us-ascii?Q?pm8yURqANkveTI+k39zumP43p3tjGi3mDTjNdOlew/NL70KdYLofPYUw+eCw?=
 =?us-ascii?Q?2JqmscrwGj2X7Mh7hehnI/1t19siSP/hyazwAM86194Jw9K6viBkKb6UkORZ?=
 =?us-ascii?Q?ypAeLMMmlDnqR1x+/85AUcm/A42rz0SU8DaFHbqu4jv4CCu0gB46ElCxIUDI?=
 =?us-ascii?Q?vnhabmMVkOMr++T/iwfE7jk9jq3JDav/XdSmDqwgv32Ucbw4KlWWKoVy9dk8?=
 =?us-ascii?Q?j3JAXKqPQrOPI8TJE/w1FrY4hndouKWba8raGKli7KAoVhr2X0irQq8HEW9w?=
 =?us-ascii?Q?S39kKnSJgspHOQMYlrgmVe2djQNzKvVrJXM3zq6NKiZpuYGeb4cp/+5ceayT?=
 =?us-ascii?Q?0dr3qT1Qyu8NT+dXYlxh3mO7AdAfyp1A8Q1pMFoR0MFv5AMZdUHtI3reCmcO?=
 =?us-ascii?Q?qOFX/AzRjQ2rndz4Pry4zLGJJ5a/itemP3mduKnV+jiJXvCJ8azaLwsyjWAo?=
 =?us-ascii?Q?DadAShlQiVjSDS8fGVKhxnPxZ5QfWymNSDXjuyW+swfXQiV9Jm63JpVxhT9h?=
 =?us-ascii?Q?3a9V6jJyxJdcCyXPpI4FWV/ygSCb8+6uPyj/JFeDaGuERKLRJhJdjOaeEPUf?=
 =?us-ascii?Q?nOD2+UnskJ7646NwFl3JVvIDSC6lA+0Wg+e7hdQq0GYIB1lm4u+G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733c564f-bd9b-45a6-295a-08deee58dfa1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 16:37:41.3187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzuhLjrW8q8dvyKK/SEkVukzjSnexlwGBzIdR/peUFkIs4ycf2wYsJ7kc42SinXU7LFYo2cBd/Km/YQEt+AK/eEj7EktMqm1Dx3wHCFTJe5fyfbIonliU7us7HgTkS0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11365

From: Frank.Li@nxp.com

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt64-7.3

for you to fetch changes up to eba4724641990bd9975ca10ababe726b6143f0b6:

  arm64: dts: imx95: Add dma, intr, aer and pme interrupts for PCIe (2026-07-27 15:39:10 -0400)

----------------------------------------------------------------
arm64: dts: NXP device tree updates for v7.3

New boards and SOM support:
- Variscite DART-MX8M-MINI, DART-MX8M-PLUS, VAR-SOM-MX8 QuadMax
  (with Sonata and Symphony carrier boards)
- TQMa8MPxS (i.MX8MP) with LVDS overlays, TQMa9596LA on MBa95xxCA; TQMa91xx
  on MBa93xxCA
- imx8mm-verdin: Toradex DSI displays (7"/10.1"), HDMI adapter, NAU8822 BTL
  audio, Cortex-M4F remoteproc and UART overlay

i.MX8:
- PCIe: add power supply properties to Root Port nodes.
- imx8mp-evk add typec and usb3_phy1 tuning; imx8mq-evk add typec;
- imx8mp-evk add flexcan2 overlay and CAN2/MICFIL board mux; imx8mp-frdm
  fix HDMI DDC pinctrl
- imx8mp-var-som-symphony: add second Ethernet, CAN, PWM1, ECSPI2,
  capacitive touchscreen, HDMI, PCIe, USB, TPM, external RTC, input
  keys, header UARTs
- imx8mq-evk: add DCSS node, uart3/bluetooth node
- imx8qm: add SCU power key, lsio mu8/mu8b, spdif1, lpuart4 nodes;
  fix LPCG clock indices for ASRC0; add Variscite Symphony board support
- imx8ulp: add I3C2, eDMA channel properties, LPUART6 (BT) and LPUART7,
  gpio-keys power button; correct SRAM node address/size; update rpmsg
  resource table address; rename 9x9-evk model string
- imx8mp: enable MU2 for DSP communication (imx8mp-ab2)

i.MX9:
- PCIe: add Root Port nodes with correct outbound address space for
  imx94/imx943/imx95; add dma/intr/aer/pme interrupts for imx95 PCIe;
  remove 'supports-clkreq' from imx943-evk PCIe1
- imx95: switch USB3 controller to flattened model; add CM7/CM33S nodes
  for imx943/imx952/imx95-19x19-evk; add imx94 DMA channels (xspi);
  enable NETC block control and in-band SFP status (imx95-var-dart);
  add wm8904 DMICDAT1; add lpuart5 alias (imx95-toradex-smarc)
- imx93: add LVDS Display Bridge support with DY1212W-4856 panel overlay
  for imx93-11x11-evk; add LVDS overlays for imx93-tqma9352 boards;
  update TMU compatible string; fix memory node for imx93-kontron
- imx91: add WM8524 and PDM microphone sound cards, CAN overlay, audio
  board muxes (imx91-9x9-qsb); move ELE reserved memory into 512MB
  range; USB phy adjustments (imx91-tqma9131)

Layerscape / S32G:
- ls1028a/ls1046a/ls1088a/ls208xa/lx2160a/lx2162a: describe Lynx 10G
  SerDes blocks; refactor lx2160a PCIe and SerDes into separate dtsi
  files; transition to device-specific SerDes compatible strings
- s32g: add GPR syscon region; describe GPIO and EIRQ in SIUL2 pinctrl

Cleanup and warning fixes:
- correct imx8/s32g3 indentation
- imx8mp: add missing #sound-dai-cells to xcvr

----------------------------------------------------------------
Alexander Feilke (1):
      arm64: dts: imx91-tqma9131: move ele-reserved memory into 512MB range

Alexander Stein (4):
      arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8MPxS
      arm64: dts: imx93-tqma9352-mba93xxla: Add LVDS overlay
      arm64: dts: imx93-tqma9352-mba93xxca: Add LVDS overlay
      arm64: dts: imx8mp: add missing #sound-dai-cells to xcvr

Biwen Li (1):
      arm64: dts: imx8ulp-evk: Update rpmsg resource table address

Chancel Liu (3):
      arm64: dts: imx91-9x9-qsb: Add audio-related board muxes
      arm64: dts: imx91-9x9-qsb: Add WM8524 sound card support
      arm64: dts: imx91-9x9-qsb: Add PDM microphone sound card support

Dan Carpenter (1):
      arm64: dts: s32g: Add GPR syscon region

Ernest Van Hoecke (7):
      arm64: dts: freescale: imx8mm-verdin: Add NAU8822 Bridge Tied Load
      arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI adapter overlay
      arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 7" DSI
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
      arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F UART_4 overlay

Esben Haabendal (1):
      arm64: dts: imx8mq: Add DCSS node

Francesco Dolcini (1):
      arm64: dts: freescale: imx95-toradex-smarc: add alias for lpuart5

Frank Li (8):
      arm64: dts: imx8mp-evk: add board-level mux for CAN2 and MICFIL
      arm64: dts: imx8mp-evk: add flexcan2 overlay file
      dt-bindings: input: fsl,scu-key: Add compatible string fsl,imx8qm-sc-key
      arm64: dts: imx8qm: add scu power key support
      arm64: dts: imx8qm-ss-dma: add lpuart4 node
      arm64: dts: imx8qm-ss-audio: add spdif1 node
      arm64: dts: imx8qm-ss-lsio: add lsio mu8 and mu8b
      arm64: dts: imx8-ss-audio: Fix LPCG clock indices for ASRC0

Frieder Schrempf (1):
      arm64: dts: imx93-kontron: set memory node to 0x80000000/1GiB

Haibo Chen (1):
      arm64: dts: imx91-9x9-qsb: add CAN support overlay file

Han Xu (1):
      arm64: dts: imx94-xspi: add the DMA channels

Ioana Ciornei (8):
      arm64: dts: lx2160a: explicitly enable serdes_1 node
      arm64: dts: lx2160a: extract the PCIe nodes into a separate dtsi
      arm64: dts: lx2160a: extract the SerDes nodes into a separate dtsi
      arm64: dts: lx2160a: extract the PCIe from LX2160A Rev2 into a separate file
      arm64: dts: lx2160a: split the dtsi to avoid delete-property
      arm64: dts: lx2160a: transition to device-specific SerDes compatible strings
      arm64: dts: lx2162a: transition to device-specific SerDes compatible strings
      arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks

Jacky Bai (1):
      arm64: dts: imx93: update the tmu compatible string

Khristine Andreea Barbulescu (1):
      arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl node

Krzysztof Kozlowski (2):
      arm64: dts: imx8: Correct indentation and whitespace
      arm64: dts: s32g3: Correct indentation

Liu Ying (3):
      dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl: Allow LVDS Display Bridge child node
      arm64: dts: imx93: Add LVDS Display Bridge support
      arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS panel

Markus Niebel (4):
      arm64: dts: imx91-tqma9131-mba91xxca: USB phy adjustments
      arm64: dts: add tqma9596la-mba95xxca
      dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and TQMa91xxLA SOM
      arm64: dts: add devicetree for TQMa91xx on MBa93xxCA

Martin Schmiedel (1):
      arm64: dts: imx93-tqma9352-mba93xxla-mini: Add LVDS overlay

Paul Gerber (3):
      dt-bindings: arm: fsl: add TQMa8MPxS board
      arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8MP
      arm64: dts: freescale: add LVDS overlays for TQMa8MPxS

Peng Fan (9):
      arm64: dts: imx8ulp: Add DMA channel properties and use eDMA flag macros
      arm64: dts: imx8ulp: Add I3C2 controller node
      arm64: dts: imx8ulp: Correct SRAM node address and size to cover full SSRAM P2
      arm64: dts: imx8ulp: Add assigned clock properties for LPUART nodes
      arm64: dts: imx8ulp-evk: Add gpio-keys node for power button
      arm64: dts: imx8ulp-9x9-evk: Rename model string to reflect die size
      arm64: dts: imx95-19x19-evk: Add CM7 node and related memory nodes
      arm64: dts: imx952-evk: Add CM7 node and related memory nodes
      arm64: dts: imx943-evk: Add CM7 and CM33S nodes

Philipp Zabel (1):
      arm64: dts: imx8mp-frdm: Add missing HDMI DDC pinctrl

Richard Zhu (6):
      arm64: dts: imx94: Correct PCIe outbound address space configuration
      arm64: dts: imx943: Correct PCIe outbound address space configuration
      arm64: dts: imx94: add PCIe Root Port node
      arm64: dts: imx943-evk: add PCIe root port node and according properties
      arm64: dts: imx943-evk: Remove 'supports-clkreq' from PCIe1
      arm64: dts: imx95: Add dma, intr, aer and pme interrupts for PCIe

Shengjiu Wang (1):
      arm64: dts: imx8mp-ab2: Enable MU2 for DSP communication

Sherry Sun (8):
      arm64: dts: imx8mq-evk: add uart3 and bluetooth node
      arm64: dts: imx8mm-evk: Add power supply property to Root Port node
      arm64: dts: imx8mp-evk: Add power supply properties to Root Port node
      arm64: dts: imx8mq-evk: Add power supply properties to Root Port node
      arm64: dts: imx8dxl/qm/qxp: Add power supply properties to Root Port node
      arm64: dts: imx95: Move power supply properties to Root Port node
      arm64: dts: imx8ulp-evk: Enable LPUART6 for Bluetooth
      arm64: dts: imx8ulp-evk: Enable LPUART7

Stefano Radaelli (45):
      arm64: dts: imx8mp-var-som-symphony: add input keys
      arm64: dts: imx8mp-var-som-symphony: enable USB support
      arm64: dts: imx8mp-var-som-symphony: add TPM support
      arm64: dts: imx8mp-var-som-symphony: add external RTC
      arm64: dts: imx8mp-var-som-symphony: enable header UARTs
      arm64: dts: imx8mm-var-som-symphony: add wakeup sources
      arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low
      arm64: dts: imx8mp-var-som-symphony: enable PCIe
      arm64: dts: imx8mp-var-som-symphony: add HDMI support
      arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
      arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
      arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
      arm64: dts: imx8mp-var-som-symphony: enable PWM1
      arm64: dts: imx8mp-var-som-symphony: enable CAN
      arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
      arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
      arm64: dts: freescale: imx95-var-dart: enable NETC block control
      arm64: dts: imx95-var-dart: wm8904: Add INL1 as DMICDAT1
      dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
      arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS
      arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board
      arm64: dts: freescale: imx9-var-dart-sonata: fix Ethernet PHY configuration
      dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
      arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI
      arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board
      arm64: dts: freescale: imx8mn-var-som: Move UART4 description to Symphony
      arm64: dts: freescale: imx8mn-var-som: move uSD support to carrier boards
      arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
      arm64: dts: freescale: imx8mn-var-som: Update FEC support with MaxLinear PHY
      arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
      arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
      arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy dts
      arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
      arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
      arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
      arm64: dts: imx8mn-var-som-symphony: Enable I2C4
      arm64: dts: imx8mn-var-som-symphony: add wakeup sources
      arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
      arm64: dts: imx8mn-var-som-symphony: enable PWM1
      arm64: dts: imx8mn-var-som-symphony: Disable internal RTC
      dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
      arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
      arm64: dts: imx8qm-var-som: Add support for Variscite Symphony board
      arm64: dts: imx8qm-var-som-symphony: enable expansion header UART
      arm64: dts: imx95-var-dart-sonata: enable in-band status for SFP

Vladimir Oltean (3):
      arm64: dts: ls1028a: describe the Lynx 10G SerDes
      arm64: dts: ls1046a: describe the Lynx 10G SerDes blocks
      arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks

Wei Fang (1):
      arm64: dts: imx8ulp-evk: Change the values of some PCRs of ENET

Xu Yang (4):
      arm64: dts: imx8mp-evk: add typec node
      arm64: dts: imx8mp-evk: add usb3_phy1 tuning properties
      arm64: dts: imx95: switch usb3 controller to flattened model
      arm64: dts: imx8mq-evk: add typec node

 Documentation/devicetree/bindings/arm/fsl.yaml     |   36 +-
 .../devicetree/bindings/input/fsl,scu-key.yaml     |    4 +-
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |   39 +
 arch/arm64/boot/dts/freescale/Makefile             |   65 ++
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   29 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   60 +
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   58 +
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |   98 ++
 .../boot/dts/freescale/fsl-lx2160a-bluebox3.dts    |    2 +-
 .../boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts |    2 +-
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |    4 +
 .../boot/dts/freescale/fsl-lx2160a-half-twins.dts  |    4 +
 .../boot/dts/freescale/fsl-lx2160a-honeycomb.dts   |    2 +-
 .../boot/dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi  |  176 +++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |    4 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev1.dtsi |    9 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi |  188 +---
 .../boot/dts/freescale/fsl-lx2160a-serdes.dtsi     |  167 +++
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |    2 +-
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    |    6 +-
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |    2 +-
 .../boot/dts/freescale/fsl-lx2162a-serdes.dtsi     |   86 ++
 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi     |    9 +
 .../{fsl-lx2160a.dtsi => fsl-lx216x.dtsi}          |  181 ---
 .../boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi  |  257 +++++
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |    8 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |    3 +
 .../boot/dts/freescale/imx8mm-emtop-baseboard.dts  |  303 +++--
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |    2 +
 .../boot/dts/freescale/imx8mm-var-dart-sonata.dts  |  516 +++++++++
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi |  558 ++++++++++
 .../boot/dts/freescale/imx8mm-var-som-symphony.dts |   12 +
 .../freescale/imx8mm-verdin-dev-nau8822-btl.dtso   |   14 +
 .../dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso   |   88 ++
 ...-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso |  104 ++
 .../imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso  |  129 +++
 .../imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso   |  129 +++
 .../dts/freescale/imx8mm-verdin-uart4-mcu.dtso     |   14 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |   33 +
 .../boot/dts/freescale/imx8mn-rve-gateway.dts      |   48 +-
 .../freescale/imx8mn-var-som-symphony-legacy.dts   |   19 +
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts |  162 ++-
 .../freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi |   19 +
 .../freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi    |   46 +
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |  366 +++---
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts       |    4 +
 .../boot/dts/freescale/imx8mp-evk-flexcan2.dtso    |   15 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   97 +-
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts      |    2 +
 .../dts/freescale/imx8mp-nitrogen-smarc-som.dtsi   |   82 +-
 ...imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso |   81 ++
 ...8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso |   43 +
 ...8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso |   43 +
 .../dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2.dts  |  380 +++++++
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi | 1178 ++++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-dart-sonata.dts  |  733 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi |  475 ++++++++
 .../boot/dts/freescale/imx8mp-var-som-symphony.dts |  389 ++++++-
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi  |   12 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |    1 +
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   84 ++
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    4 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   23 +
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |    3 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi |   38 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |   15 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-lsio.dtsi  |   21 +
 .../boot/dts/freescale/imx8qm-var-som-symphony.dts |  504 +++++++++
 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi  |  531 +++++++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |    7 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |    3 +
 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts  |   37 +-
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   69 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   70 +-
 .../boot/dts/freescale/imx91-9x9-qsb-can1.dtso     |   48 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    |  160 +++
 .../dts/freescale/imx91-tqma9131-mba91xxca.dts     |    4 +
 .../dts/freescale/imx91-tqma9131-mba93xxca.dts     |  937 ++++++++++++++++
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi  |    4 +-
 .../boot/dts/freescale/imx91-var-dart-sonata.dts   |   14 +-
 .../freescale/imx93-11x11-evk-dy1212w-4856.dtso    |   81 ++
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |    4 +-
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |   21 +
 .../imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso |   38 +
 .../freescale/imx93-tqma9352-mba93xxla-mini.dts    |   45 +
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |   21 +
 .../boot/dts/freescale/imx93-var-dart-sonata.dts   |   14 +-
 arch/arm64/boot/dts/freescale/imx93.dtsi           |   39 +-
 arch/arm64/boot/dts/freescale/imx94.dtsi           |   20 +-
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  150 ++-
 arch/arm64/boot/dts/freescale/imx943.dtsi          |   16 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |    4 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   54 +-
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |    1 +
 .../dts/freescale/imx95-tqma9596la-mba95xxca.dts   |  958 ++++++++++++++++
 .../arm64/boot/dts/freescale/imx95-tqma9596la.dtsi |  278 +++++
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |    4 +-
 arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi  |   10 +
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   64 +-
 arch/arm64/boot/dts/freescale/imx952-evk.dts       |   50 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |   27 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |   59 +-
 103 files changed, 11300 insertions(+), 834 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-pcie-mbvl.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-rev1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-serdes.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a-serdes.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2162a.dtsi
 rename arch/arm64/boot/dts/freescale/{fsl-lx2160a.dtsi => fsl-lx216x.dtsi} (86%)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx216xa-pcie-gen3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dev-nau8822-btl.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-panel-cap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-brcm-legacy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-var-som-wifi-bt-iw61x.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-flexcan2.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds-g133han01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-9x9-qsb-can1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596la.dtsi
