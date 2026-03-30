Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013045.outbound.protection.outlook.com [52.101.83.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D77B3CA4BD
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880116; cv=fail; b=e0NswqkCdqw25Ed9JO4xBoPf6J4af5r/c3MMSXHRUi+m97fF3o7PjE/Vw2BW1WlO4KYQyBPeXdFolRTImmw/ScjVaiAhN7dCgVrRSjCpGgEHA+l8rbdhZ3B9HSdRTQojjscaUHOiuuKlCIWbhQP441MxOZs8DlGWNbt3F7OPn5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880116; c=relaxed/simple;
	bh=V1LS8fYdk7inEtplrgD8N0V5mbQdENnzLO/9budaaak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k+1VhUWVUCza4OeBrnXu9Rv6EotRqWAaMpNOmh3loULnPXiYumIfzJd37YCTk2yvHzxlcCxpTwENWRu5W3N5h/BBqgCVWUBRrxWDa/VmKXTndt8kjspLBSflfJxrcindwjZa4VigsgVE4U9s37/ANOa6lYDPsmQz5Sy4Jyfl844=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wkh92PRu; arc=fail smtp.client-ip=52.101.83.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wkh92PRu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQGhyCNnJTsiUWQrHJKnX1UzYLZ91KViB/zE4Mzz6Fatrt7Lu8xNh5MwbZh7JvgxKnKa9Nl9WeSBDhkwTtIcq13Sci58Q4zod6/lbYFRXgTGXbSLHA68GD4DuR7EyQk6fesrhAnKb3hWW8XRIxnc1iUOFvX+nNnUV9janp9tULOOUSuXOh/YXxT/cybVjHK8ACEbfKnOL7QoU4erxHatlwppdl4EVEatnGEZZDygqgO/3MTNqzsy2SKvvztyONbWmPRI4BUAwxyeQ3INvKnHrYusH7CU69ymsuqIPNxXEfLdWwbMaEdjJjVV6hzaRGcEqQtxyKuqhf4V63ifz7SRCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTfHatggwkT4IlwVfxP8zSBvP9F+tmZR3OJCIVwQ3QU=;
 b=vjnfeW3bgSbr1gNihnMhkt+N/afnbIoCac8tGjobXwfaTxiFBpx4e5QGIsFy+5Y7wXrCCsgG6M4kWLcShOLmfu5b0KCOv2HVJbvnpOqqiO2rUaf8h/ECLo7NyyAdrfdIPtImQRrQ8S5ZNCfDAGBtoDWk3GvEzwo3jBkZ9wI0SZeJM+Gt9WW1EpxmxmaopMcRi9yeDd568qZaGC/DdLfRv8P7KhNJ8i7Q/u/G4Co7yoEUDzphWXsTEYKyQP42FfFy0ZwVxRbx16NEDr8u+3F5apO2A3DAqtNbLZbmqOL7mJ6Zr4vrKmmdYKlENJAJqoXF58PGQMP7NOqXcZu9bd8/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTfHatggwkT4IlwVfxP8zSBvP9F+tmZR3OJCIVwQ3QU=;
 b=Wkh92PRuqwaiXM00lX1sFmNrzPDzuoYqBcIoIEgWk/+jJ1LKUVDGUDhyEpLS4qGVujIU5hnpI/m138QEPf7loNX+fvw2Ql+5FfopWf241aoTJgIJbCHdBY8/h9+J6O4pSYhUYa9+Gr8H09Ss/z/OA+D4wdvVftmwf2G1LRh5qT0bWp32vvKvJ2wcGyNS+weN+3eFSFxAZEit0bX1qbeQeNjd4i9xxZ9C0fu53evCMz8FeG/DQy3UjO6WCJIb63FhFCWtMHPjwVVDFjKJZurVxKrbvE3rz6Xx+9c3wu34YvvKDLgENxxowreOx5xi2BwVIYqQPZqyBAmiLKw+u/t3iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB12223.eurprd04.prod.outlook.com (2603:10a6:102:55f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Mon, 30 Mar
 2026 14:15:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 14:15:09 +0000
From: Frank Li <Frank.Li@nxp.com>
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] i.MX arm dts changes for v7.1
Date: Mon, 30 Mar 2026 10:14:38 -0400
Message-ID: <20260330141444.3789193-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330141444.3789193-1-Frank.Li@nxp.com>
References: <20260330141444.3789193-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR22CA0023.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB12223:EE_
X-MS-Office365-Filtering-Correlation-Id: aabb7c73-2be8-4d79-93e4-08de8e66bfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Br5BjYgcxTYi4c7mQ0X2dgS8tO4TjbfLSJ3J2wEzfFS/Dua/sNKDe3i+6kyB6JqD9kzOeQSGvN2KOYV9PM2q5Vp3YWxABNeLCdEhlBqgHaQnnsSGtCuOSB6P2eo8zd1NprTe5bRmnUB2IH4ZhOHIvpE4zLSctdaX4hLyHmT0A0zcckyFX7fE8jbBCncK2oKyuZEqlShXJG/pQWbPESoh+Gc3bgvSaP1ge+PmjYSpSSg87zSCJ80a9/J7Lbo3OqiFELvxcrIrj0zjXnNzM7rhtzEDYB1/KfxQ768I14MMo9wWZCN+yn1vGO4Wk2eAQbrBz4TVun8dQJdI/u7EKyAz1wgKiQHF61xziJdbX3ge5a6oHTf4ZONBDk7ajVFrFvzD3HskJ6R1NK0K1vTczdtNu4uvaPN2jyEsyKcgYbmn/Usreb/jNVp4RobBoZsRc+Xz4nEGlJBkL+RrtZwv5v4RSAvNr2XpxoCJvrM6k4zTTbdgd2t03s7tMrptpicuSulg7ZGw6AsvW6At26FtliwJJNCr8YISdzGsjSqzmtzwZeVcCkk4t7x7O5qo/4gVveOWKqEMFSSeJZNTya5RArx4HM6Ce1ObZGx5fn/E+BBQ/myF0EBVA1vOpHBE6DOa2EczoYqXy6/7sNnePuo+ssXXIeofpx0iggplX4gZUFI8DJQPmXHxJLTtUSDiew1SSuEVce8Eh9zlBfItAYmam4Fw51+VRIXTp7V6D5349YNpek8LJEahEFns3ENvxbb5HjlBNThWvmi8SqQIJodJGPwLrBTvJTox1cdG8lt8AXKKdLQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzZ5dEhrWnZQejI4YnZaMm50cTczMkVCRUt3WVJiNGlvbGE3bXlpU1ZheTRu?=
 =?utf-8?B?Z3NxdksvU1J4Wng5ZUJXWnRaVCswUTJkREQ1endQelpWcWxiQ0t2NG9IdUhW?=
 =?utf-8?B?cSt0U1NQajZLaTI5WmlPYVh6Nk03ZFdvaExhbHNMd25LOTdicFJDbHlMTjcx?=
 =?utf-8?B?UFN1RVEySDRFVkpvUkxXdThEMDFSMDI5Nmo5dU5abmZrVUlWZUhQZU5CT1ZC?=
 =?utf-8?B?L1VOdUl4MDc4WmJBUGhiNDJUa0VIRVhzOGxQSEtPQS94YlNPVlF2NVFHUXM2?=
 =?utf-8?B?eUZoMjMzOXlreHVBV0d0ZDZhT2R6RTA3Y25QNHZNcW9mMkRpaWRCTWtuWTZi?=
 =?utf-8?B?MjI5UFpYcEV3NjhCbzFGSXJ4VjB5OXVnbE9nQVg5d0thbGtFNXRHTW9rNW9h?=
 =?utf-8?B?ZFFSblpuQlN1YlEwVC82T3pIcTZ1aXN1NGZMODN4dTdJVFM4QWE1QUJ3d0xs?=
 =?utf-8?B?aytDd0w1MHE2Q01DT0pkZWkzUjNaZDFjajlKQzVLWWJqV1d4d1pvcGVxNEps?=
 =?utf-8?B?ZGdIcHU5aTFWWUw4Qnl6U2hyaURnUEMrZkVOdFhJcEZJMkkvcHhPV0hWWG0w?=
 =?utf-8?B?ZjBIUzAvQktqZEVYeTZnZ3pUU3dlNEZSbEN5V2QwTXY2U09OSHBpSWdWWUxU?=
 =?utf-8?B?WlNpQ1V6MWFJUjZkSnlrbysvK294aHNlSHpMN09HZVdQU3RNUzUybVdBRkZr?=
 =?utf-8?B?cGYxMUNUaHRYTk1wVVJVZ3hzQnREN3VYRC9OTVB5QTFGZUlGaWt6Y3RWTDFl?=
 =?utf-8?B?MFAyN3d0cVRTcmQ4Smp4L3ZGL1hCcHlzUDFxbFB6UHZDS0g3eHpJWUhDUUhh?=
 =?utf-8?B?a0FIc3ZhZmI0M2ZQL2U3aHlURkxXTEdZS2ZXZngxdWpPdGloSmVUeldoUW45?=
 =?utf-8?B?MWlHQ0RmQWcrcUtlMlkyeG5WSGVUUXpDWGpuS0xyUDJEQnBRcVcyNE8xeXN0?=
 =?utf-8?B?V2dpeUdPZ0tBNUR6L08zWDh3OGF3enZhNG14bTVwTXN0ZSs1WWluY0pXb1E3?=
 =?utf-8?B?MkZsdjJublFDdEd1NGVVdGkydXgvSGZQOU9kL3FYOEc1cTdLMVV0MUdyVFU5?=
 =?utf-8?B?dnVKUkpuWEpOMDN3V1lpMEFjbXhwclIwNDJKNFVCRGFadWlCRGgwQ00rUEdE?=
 =?utf-8?B?MVhuVlk0YWg1TVJ5QlBNN0FEdFJLcnp2MkFIamVJb0ZKNWtMSWM1aC8rYno5?=
 =?utf-8?B?RVFGRWtEd3RKRWM5dHdXdGo0QnFLQUtRUkp4NnlqTWdBK25aeFFSdGgrNmpN?=
 =?utf-8?B?WXN4SlFNQ0l1dnk2M0YxNTNFN1JSSVpjNGgvMy9vSWdoTTRMZzlTdWlMQlE0?=
 =?utf-8?B?djJOdE9XSG5GMnF1TDJWMjlEY0JNMlJ3cjd5WlNyczhyVE5NRDBBc04rdjlt?=
 =?utf-8?B?WWw5a2RZaXZXeWQ2YWF0MGhWK2xjeHJBcUpFVkwyMytub1FncEYyUG52ZEJr?=
 =?utf-8?B?MnBtZStIVHUzdXJQVjV6djRQanZ0THZPalJEczNGY0h4eTN1UEZ5djZ6azVi?=
 =?utf-8?B?ZVhiamlueHZNS1RiRXpxM1JXOTVCc0RJSnRrTGgzTGYyZ2Q1aFNYYW5UcW00?=
 =?utf-8?B?RW9FR0lqc3VWTTBQdW4xdi8vL2VPL1ZsUHdJaHBPMExqL1VoRmIvNGtvVnA2?=
 =?utf-8?B?WWFqVFd6TzcvMk1xc2hqUWdRL3YxdUZSbDhXaWV2Z2FXenhxaVlySTRwU2xE?=
 =?utf-8?B?azNPZXVtTVBGVithNGJFTVMxU3U0eFVtbHlibHJQeFlmNjBkRVJycXF4bit1?=
 =?utf-8?B?amx1aWlLaW1NUFh1WHhHMjg0eDRVVmZZdGJKcEFXUlB1VVltSDZHUEY1aDE2?=
 =?utf-8?B?OW50NHZlc04rdFNIWVVvK1ZxODIxQkxnUXRtZitVUk40dk5iTVhWWUNLSllE?=
 =?utf-8?B?OGx2WmY3VGJBSjZmcUFMU0ZmcCtKc2RSbDQrL2ltcHNoS0xsNjU2SXUzZ3ZV?=
 =?utf-8?B?RnRDU09iRTIrakpYVzZQeGorVUdXZ0IvOUpObktjWCtsNnRNVjBtNk5sZytF?=
 =?utf-8?B?dGhGSUZrMk5tUWl6N0tGeWxpTjlDK2wrZlp2eFdhdDRrNzNsdXRUT1BwSkdr?=
 =?utf-8?B?ZUxhWlcvQklQeFFWT0ZxbHZYSmVmVHAyT24veDFLUXdEaGdhcHAxNWUwcndn?=
 =?utf-8?B?MTZpSTRUVzgxLzl6WGZUY3c1bzYvU3lsaEtjck5RczRhWlBKQ3V4dzc1azBr?=
 =?utf-8?B?RHBncTFkYURxTjdwR0dEOXBoUHVQRFFPWXJ0cVRyZC9lZnhYYTdzN0IzRjc4?=
 =?utf-8?B?aUU1REtyWDFVWjRNaTVIL29vWjA0MXhUMEp2YnFFanVIYWREenBzODFnN2wz?=
 =?utf-8?B?ZGVSbE44UnhrTXhYOHB6aVJ2Vm0zbGYrWmNKa0o4c2YyTlFEU0Y5UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabb7c73-2be8-4d79-93e4-08de8e66bfe7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:15:09.2526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtgQgm1YSor6py+ckU3AHbV7lPB/vt4dxUwfohJCDYmja0rZEeg8mJSox7RT+A4cfiOnQInu/TpgPZtQy4Kf6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12223

From: Frank.Li@nxp.com

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt-7.1

for you to fetch changes up to 7bc76d413dbe6631a207b38aa67b2d00fdc27b2c:

  ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM and boards (2026-03-25 13:00:22 -0400)

----------------------------------------------------------------
i.MX ARM device tree changes for 7.1:

- Device Tree Schema Compliance Fixes

  Fixed numerous CHECK_DTBS warnings across multiple i.MX SoC families
  Renamed nodes to match schema requirements (tcq→touchscreen,
  uart8250→serial, iomuxc→pinmux, etc.). Fixed node naming conventions
  (added "led-" prefix, proper addressing formats).

  Corrected compatible strings and removed undocumented fallbacks. Added
  required properties (clocks, clock-names, power supplies,
  #sound-dai-cells).

- New Hardware Support

  Added DT overlays for various expansion modules (i.MX6 DHCOM PDK2,
  PicoITX display boards). Added support for muRata 1YN WiFi chip
  (replacement for 1DX) on i.MX6ULL DHCOR board.

  i.MX7ULP: Added CPU clock and OPP table support for frequency scaling.

- Boot Phase Properties
  Added bootph.yaml properties to multiple TQ-Systems boards and SoCs:
  imx7s, tqma7, mba7 imx6ul/ull, tqma6ul/ull, mba6ulx imx6qdl, tqma6, mba6.

- Bug Fixes & Corrections

  Fixed interrupt property usage (interrupts→interrupts-extended where
  needed). Corrected spelling ("TQ-Systems" with hyphen). Removed redundant
  intermediate nodes in pinmux hierarchy. Fixed clock references and
  naming.

----------------------------------------------------------------
Alexander Feilke (3):
      ARM: dts: imx7s: add boot phase properties
      ARM: dts: tqma7: add boot phase properties
      ARM: dts: imx7-mba7: Deassert BOOT_EN after boot

Dario Binacchi (1):
      ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold

Frank Li (24):
      ARM: dts: imx35: rename emi to emi-bus to fix CHECK_DTBS warning
      ARM: dts: imx35: rename i2c clock-names to ipg
      ARM: dts: imx35: remove simple-bus 'usbphy'
      ARM: dts: imx51-ts4800: rename fpga@0 to fpga@0,0
      ARM: dts: imx51-babbage: rename at45db321d@1 to flash@1
      ARM: dts: imx53: drop fallback compatible "dlg,da9052"
      ARM: dts: imx6qdl-sr-som-ti: use fixed-clock instead of clock-frequency
      ARM: dts: imx53-smd: Add power supply node for fsl,sgtl5000
      ARM: dts: imx7s-warp: Remove data-lanes and clock-lanes for ov2680
      ARM: dts: imx: rename iomuxc to pinmux
      ARM: dts: imx: remove redundant intermediate node in pinmux hierarchy
      ARM: dts: imx27-eukrea: replace interrupts with interrupts-extended
      ARM: dts: imx27-eukrea-cpuimx27: rename uart8250 to serial
      ARM: dts: imx27: remove fsl,imx-osc26m from fixed-clock node
      ARM: dts: imx23: fix interrupt names for dma-controller@80024000
      ARM: dts: imx23/28: add "led-" prefix to LED subnodes
      ARM: dts: imx28: rename gpios-reset to reset-gpios of hx8357
      ARM: dts: imx28-sps1: remove undocumented fallback compatible "mr25h256"
      ARM: dts: imx28-tx28: rename compatible to "edt,edt-ft5206"
      ARM: dts: imx28-tx28: remove undocumented aliases
      ARM: dts: imx6qdl: add label for system clocks
      ARM: dts: imx: add required clocks and clock-names for ccm
      ARM: dts: imx25: rename node name tcq to touchscreen
      ARM: dts: imx6sx: remove fallback compatible string fsl,imx28-lcdif

Ian Ray (5):
      ARM: dts: imx: bx50v3: Configure switch PHY max-speed to 100Mbps
      ARM: dts: imx: bx50v3: Configure phy-mode to eliminate a warning
      ARM: dts: imx: b850v3: Use alphabetical sorting
      ARM: dts: imx: b850v3: Define GPIO line names
      ARM: dts: imx: b850v3: Disable unused usdhc4

Marek Vasut (2):
      ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi on i.MX6ULL DHCOR
      ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM and boards

Max Merchel (8):
      ARM: dts: imx6qdl-tqma6: add missing labels
      ARM: dts: imx6qdl: add boot phase properties
      ARM: dts: imx6qdl-tqma6: add boot phase properties
      ARM: dts: imx6qdl-mba6: add boot phase properties
      ARM: dts: imx6ul/imx6ull: add boot phase properties
      ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
      ARM: dts: mba6ulx: add boot phase properties
      ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems

Peng Fan (1):
      ARM: dts: imx7ulp: Add CPU clock and OPP table support

 arch/arm/boot/dts/nxp/imx/Makefile                 |  37 ++++
 arch/arm/boot/dts/nxp/imx/imx1-ads.dts             | 108 +++++----
 arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts         |  92 ++++----
 arch/arm/boot/dts/nxp/imx/imx1.dtsi                |   2 +-
 .../boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi    |  38 ++--
 .../imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dts  |   6 +-
 .../nxp/imx/imx25-eukrea-mbimxsd25-baseboard.dts   | 134 ++++++-----
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            | 190 ++++++++--------
 arch/arm/boot/dts/nxp/imx/imx25.dtsi               |   4 +-
 arch/arm/boot/dts/nxp/imx/imx27-apf27.dts          |  58 +++--
 arch/arm/boot/dts/nxp/imx/imx27-apf27dev.dts       | 194 ++++++++--------
 .../boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi    | 244 ++++++++++-----------
 .../nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts   | 196 ++++++++---------
 arch/arm/boot/dts/nxp/imx/imx27-pdk.dts            | 132 ++++++-----
 .../dts/nxp/imx/imx27-phytec-phycard-s-rdk.dts     |  92 ++++----
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    | 174 ++++++++-------
 .../boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dts  | 206 +++++++++--------
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 154 +++++++------
 arch/arm/boot/dts/nxp/imx/imx27.dtsi               |   4 +-
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               |  30 +--
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts         |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-qsb.dts            |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            |  18 ++
 .../arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts        |   4 +-
 .../boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts   |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-plybas.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi         |   5 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts         |   1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts         |   1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts         |  53 +++--
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi        |   4 +
 arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts         |   4 +-
 ...mx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi |  75 +++++++
 .../nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi   |  61 ++++++
 .../imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso    |  28 +++
 ...dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso |  26 +++
 .../imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso    |  32 +++
 .../imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso    |  32 +++
 .../imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso    |  39 ++++
 ...com-picoitx-overlay-626-100-x2-ch101olhlwh.dtso |   8 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi   |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi        |  12 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi   |   8 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi       |  11 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi      |   5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi      |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |  24 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |   4 +-
 .../boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi    |  10 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi     |   1 +
 .../boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts  |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi    |   1 +
 .../boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi   |   1 +
 .../boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi  |   1 +
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              |   7 +
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi   |   4 +-
 .../dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts   |   1 +
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi   |   1 +
 .../dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts     |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi  |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi             |   1 +
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi           |  13 ++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |   5 +
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |   2 -
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |   5 +
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             |  28 +++
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |   6 +
 arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts      |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx23.dtsi               |   6 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apf28dev.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts     |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10036.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10049.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10055.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10056.dts       |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2-485.dts |   4 +-
 .../boot/dts/nxp/mxs/imx28-duckbill-2-enocean.dts  |   6 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill-2.dts     |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-duckbill.dts       |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-evk.dts            |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts         |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts           |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts           |   9 +-
 91 files changed, 1609 insertions(+), 1142 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
