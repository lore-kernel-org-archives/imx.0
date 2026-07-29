Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C4C3B47D3
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 19:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785352840; cv=fail; b=YyJaecnDL/Zv96kQnUe7RaaAMdJ33KA2orNdqk4Lp50wa20avy41LlGbfe/BtZ78kgmqLc0RnPVJ9IwpbQBV20ByMp9thy6z080HMRU9JT9HtloUdwaMkH8vSng6enXyPQcbqdKgUAzA6RJuZsGvWzSrPF2Do9J8SR1Esgk8RrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785352840; c=relaxed/simple;
	bh=3kfWc1zMCnF8nvKxbLRpazYWgUbYXej92hrlkHU5eYA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sLcBPFt9Lze5BVX4hhCdoCzdyFrVBuHnk7lgEwYxBnMQEDXaAOrSyqqP0fViXVzUbFSn/gGAyn/lrPdMgHDgCdBA2OLwaA9sbYjkK9u2e8LP+Y4l5sYkwEqTLbcdwU7DEY+z9UF46cBggLL6cVWLZsZeY9al+a6Fy1SEVX9TRzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kakNgmDo; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kakNgmDo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUOAMJQBVC5BE/5mjtjwQ/Tz4ncsxKnvrJj7b4e/f8dRNQGUPOyXEZilWhTpRuw0Bi9difQu8ftuGNKAbWlUWQzwFQp6/mylmjy1Jka0p/NKjebwtNu8l/gpdvRFQDoKbyoOoOfsVjsUI/uFtxu8fF20gPbSQxkRDW93BU6O8y4xaqONIoNoHr1AVH7MOE8IHbchXYPzZc3Y4NUUm5IjTNZrEE9md92+BUvpGd42DKubFdSx0h8k3YdnLI3D1NqY1luO1nbZbxEZZh01jvM7ByBzoBeAh0B0WZaumq9wmmZnlbT4YMvRq1wuuuepnl7yShF8dxr0NfQp+sikdNtMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWF0TqDK6M8CvlCqxinOE+Ni+PgaeU7TOG2bdcnA8zs=;
 b=wLuhc0ZkQgDiZVJOUxwcL4fOfPRmIZSQ6BP669+krvOYLJu1owGC1q6SFKqCEzlnaktBOfa8krPhydm8A8GhCRFx5X+NHiKwIgPVSvYqywGOohdnhOyKH7U2lEEVH3V275NCKkIQxZlVuAraotcpvDvv2S993NEPELFo8Z7GxMAfUG3WUF9uJDp3/+A3bgPFblgsWstNTs0DyRkcXo5g7eMZwLjgD7t7ASTOYkgxf2NOMWvGNuvutDCNWD3dwqyuwQTjAQ1BYSsP4CidpprmaQFzkkU1VKGUh7LZkcgBdKCw3HWKq4YJ+z9Cisuu8V+Vo+kJC2o4WMeQRFKoytejnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWF0TqDK6M8CvlCqxinOE+Ni+PgaeU7TOG2bdcnA8zs=;
 b=kakNgmDoUWd5uGpyWYe2Y5BrcFHZV+a9rOQiJmvIn4KgheBa2C7g7rHrwzQovwmtTIFmpSAyDFT4BFtgKdpmgTrY/1oyFdPpCfftM+VZREve3cWA9ypFGC1a8NNPulLgwkL0B4t+3PIYbRUE08IMAApOMbiKLF6FbKnzeu3LtTM79XVUSvveuRfW5j2WoUx4XrGL7ChkJwuF95S7iMOUofE00mnv6v3oEnVY3zffzcGrw93coKCi3PmuLlaTKPWAtSeWdJHJvNejWTR9G/wRBlZAbT6zrGNJPzlpAUFqcL2VE9V6liCpGaC3l54AA9G7ggjU6czhn9iShsBWBXCOMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7775.eurprd04.prod.outlook.com (2603:10a6:102:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 19:20:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 19:20:29 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	lech.perczak@gmail.com,
	Max.Merchel@ew.tq-group.com,
	sherry.sun@nxp.com
Subject: ARM: dts: imx device tree updates for v7.3
Date: Wed, 29 Jul 2026 15:20:18 -0400
Message-ID: <20260729192020.523281-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0024.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 98cdd5c9-17a5-485a-42a5-08deeda67391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|23010399003|56012099006|11063799006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	cmO+N4+bl85Hpvg7PQrGDbNPjp3PF140KtlZlU2lYtrLsOJA4biv/tJ7ENEqcKgLjmagP4cRJeUu0d/fxYYS609cwE+lZVbFuG2crGF4saBFIr1fmxSrQ4a+3UQF2vcmL+Op7RPZK/z1GipQ51SNfC2Rfd3ulMoBBUrhOEyUJU51U0TGwajs8B+UpzdaFo4s0D+p+INGjDnu5VqG+8kciCKyD8gLzK55b14Z1a4D7FAkya/2lny6QG4GJLy17v5ipzRSQe/ihIDnbp2eTF2H/V4eBAg139Ia14Lz+PIX0IKAmoSLwA+x7fNkUqaLMEqyKSE2n+JKtMhL1siDX7ujCJhJ8LRN759HnXouUxVqyBe6d4vxwWb5TwqfX8F0XID7usuvAw7e5IfRa1n2ksBxUM7u4wFxACJ8lFt/ZybXGrPuAg6BHAbkxH8tFyWioEy9zyHQ2TLbxVAJZn6qBRdTmTXrFp5IGQSrie7SymQBFPSuDEFOoVr6gbIa14O9PbdpKpUfKYd3ImSHfnvsA+gX8+k/wmNHXcGYI56o0JGaBK6mZSTmHy0D4N/maok5hQnfg5U/1Iq8dljs6/2uxhanMV+0lrTfDy/MbfxNRqh69xR01LeRhTedYwFI6aP2qxIcFGKjtMScgkZkm93I7b4q5WSwFIJqBeZm5vgpu4UUSsQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nLnlohyxE1Kto2rZ8REqCKZttpVvVPx2oFUr9KGmph2OT08mqu2Lp+YQhoHf?=
 =?us-ascii?Q?RkDyhVaiuvgbV/848+lSRpKeuT4WTi40gpNCZzDN+BVKENzu9gpiBODAyeZW?=
 =?us-ascii?Q?f/G3wB7MQAWOvxGJPzCmQgkeRyptS8TBNKMd37PZ/dwg6vrvFddpp7j+hHHJ?=
 =?us-ascii?Q?v1HJffE0nAX194kwGGHWpp8Z5e5alYQ2IrgnQkPvseLJLwEhngiVCFHSwtcM?=
 =?us-ascii?Q?wFC9UthucCPQF75mpqAEui/acpQydFf829C6Fq18qzVHQ1OP+v54w6taWyvH?=
 =?us-ascii?Q?RXN5XkQ/k7E2bvgIlHvBFKZROunuP8OGWMEGXzsYMlfChhBLzj+QLWCeQLJe?=
 =?us-ascii?Q?/QUFqmhBT9lDcm1CSssM9u+zsrArgbxx2rWN/4Va5q6zobaADWlIi6n65/e4?=
 =?us-ascii?Q?Bs18lpQuqBlp9misKdbp8/K9ACZvZq6TOpPOnIP5NsizOOv6h2Zf9jslKn10?=
 =?us-ascii?Q?Sr46paTB5KuoWiEa3sC+UugEbYxDei5tRO+rTt/09IHUyyFWW15xOUnMrZpy?=
 =?us-ascii?Q?ukvKjzhGBe1MNWvkwpdDZx2UvS9ZDfdnri2qJbUlRYv7FlFw+UzADFG41UPo?=
 =?us-ascii?Q?HjQDjvcH1ufpRMtf/0OcnjKucFlo0ExE3uioITpNxyf2dEZYxGt5XHmvc/iN?=
 =?us-ascii?Q?7wjzDDxs4NjjoOVOiNK3IL12k8g8KxHrk8/KCjw0wENXG3A98OoU6TeYIiXe?=
 =?us-ascii?Q?6HnMIE17eXXvoKCTdIcBukmPG1eAWVoJRgPL0EXdejpwndGXU9WmFFjbSxV4?=
 =?us-ascii?Q?VWOUt+bxKG+xan99y109Y1bl27grNdAEgvhpvHxE6q7PagYLir5IqvGY5sJB?=
 =?us-ascii?Q?4qAFNJRTiJo2F1zm+4LMVJIAD1DKyBNnF3MSCGHEm+HV0oLU7f4YVA44tAe2?=
 =?us-ascii?Q?2GTfzWwxolRjP3/ucWXo9GfCs6x+Q7T6ryNOIsuygnX2HDodPpTnvBWNjUUO?=
 =?us-ascii?Q?feKEmO4L4QvqCyHvmuTd+ZkWM4Ya7OXD58FYKxEOS10S20eYFVSsw8szlUdJ?=
 =?us-ascii?Q?gs4IpuY1edpCX2HZ2PD/AWHR3PYVDFYxqHMBe9HXUTgonhP+NeV2kP8bQj+X?=
 =?us-ascii?Q?1uU3xsJx1MthDZWCsTuL5xk8agntUvr92qtj3j57HQNOo0Yyn4nYX6nGz6Gv?=
 =?us-ascii?Q?eGF9fsD72JUcVmRwqqc1Qqpw5UuFpK9fFO+ZxxlMx9C8AY+UjtfTDlojnqIw?=
 =?us-ascii?Q?9KtBq5SNHiF4sJXR4nP+btHZIi3FtQC3oFZrWO1++XgaELA4Ow+d8g2Ub9+H?=
 =?us-ascii?Q?5W+usI77ARN8SMMFSvuSY52N8ILpv8AvyXZ50vNy0oV+v/oozsju5+dU9QUU?=
 =?us-ascii?Q?XdCAp9xl5x1xPoHJLDOr24DuuI60/4JJBq9qeY/t8bjMUMrrqjsuPHwNku9Z?=
 =?us-ascii?Q?l7UzyS+D4t5N/uG3Sz5QaSG2x8zuyMYbNALJhF7c693i5Onrt1z13fVe5m9i?=
 =?us-ascii?Q?VFXiNZfbTJNG/W9qgO++6aN1P6NruRYCXI2OpnoSa5NB0mQ+cNpBIOioAVy0?=
 =?us-ascii?Q?wxGSXYA4fg2zuPHbFasX6ipFwm9hHAc0jvDbrdKwEgY7IBGa5TmKjLclVk7v?=
 =?us-ascii?Q?tSckh9+5mtRmUGSBJjmJHIfCppR1ZFElnc4J6DLsgsMZibzbin6bEc24js3e?=
 =?us-ascii?Q?Ot0K/X7MGEHPd/THrXG59pQxcd3xQ4PlQYDwGcqb3MCKmxKuZIBR7VAmjS0w?=
 =?us-ascii?Q?JDEybtKk9zvOBgwk94zmV3KKojMRbwptk6kPTIhWbauYg8D3YVap9LMrzQX7?=
 =?us-ascii?Q?m6wINFD0ECXVakCj1cLheFGIImzRWslENT8VQkCwNz0k9jDAj7lU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98cdd5c9-17a5-485a-42a5-08deeda67391
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 19:20:29.5048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38Rgth0pLginjPsl2PoQ5KDLvsLHW11AXJI/2PItF9AEMHmUjJh+CQFdkDlC73Nfc9y/xZp1cRDMajh0EvlNaCTkh206Ss6tl2+VfXQz5j/Oss1ABVJdNvlSEmrH38pc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7775

From: Frank.Li@nxp.com

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt-7.3

for you to fetch changes up to 6db9b23f3c0ebda050a4d38fda2b59db146ca161:

  ARM: dts: ls1021a-iot: rename display@0 to display0 (2026-07-24 16:43:00 -0400)

----------------------------------------------------------------
ARM: dts: imx device tree updates for v7.3

Cleanup CHECK_DTBS warnings:
- Remove undocumented properties (nand-ecc-*, clock-names, default-state)
- Rename display@0 to display0 (ls1021a-iot)
- Add led suffix to node names (ls1021a-moxa-uc-8410a)
- Replace spansion,s25fl164k with jedec,spi-nor (ls1021a-moxa-uc-8410a)
- Use ethernet-phy-ieee802.3-c22 compatible string (ls1021a-moxa-uc-8410a)
- Rename eim-cs1 node to eim-cs1-bus (imx53-ard)
- Add power-supply for LCD panel (ls1021a-twr)
- Add fsl,ls1021aqds-fpga compatible string (ls1021a-qds)

Fixes:
- Change #io-channel-cells to 1 for voltage divider (imx6dl-plym2m)

New features:
- Describe Bluetooth controller (imx7d-pico)
- Add power-supply to PCIe Root Port (imx6sx-sdb, imx6qdl-sabresd)

----------------------------------------------------------------
Frank Li (15):
      dt-bindings: fsl,fpga-qixis: Add fsl,ls1021aqds-fpga compatible string
      ARM: dts: ls1021a-qds: add compatible string "fsl,ls1021aqds-fpga" for on boards FPGA chip
      dt-bindings: soc: imx: Add fsl,eim-bus
      ARM: dts: imx53-ard: change node name eim-cs1 to eim-cs1-bus
      ARM: dts: ls1021a-moxa-uc-8410a: add led suffix to fix CHECK_DTBS warnings
      ARM: dts: ls1021a-twr: add power-supply for lcd panel
      ARM: dts: ls1021a-moxa-uc-8410a: use compatible string ethernet-phy-ieee802.3-c22
      ARM: dts: ls1021a-moxa-uc-8410a: replace spansion,s25fl164k with jedec,spi-nor
      ARM: dts: ls1021a-moxa-uc-8410a: remove undocument property default-state of gpio-keys
      ARM: dts: imx6dl-plym2m: change #io-channel-cells to 1 of voltage divider
      ARM: dts: imx53-smd: remove undocument property clock-names of ovti,ov5642
      ARM: dts: imx6ul-isiot: remove undocument property clock-names of fsl,sgtl5000
      ARM: dts: imx6ull-engicam-microgea: remove nand-ecc-strength and nand-ecc-step-size
      dt-bindings: display: imx: Add deprecated property display and display0
      ARM: dts: ls1021a-iot: rename display@0 to display0

Krzysztof Kozlowski (1):
      ARM: dts: nxp: ls: Correct indentation

Lech Perczak (1):
      ARM: dts: imx7d-pico: describe Bluetooth controller

Max Merchel (2):
      ARM: dts: imx6ul-tqma6ul: add nvmem-layout
      ARM: dts: imx6qdl-tqma6: add nvmem-layout

Sherry Sun (2):
      ARM: dts: imx6qdl-sabresd: Add power supply property to Root Port node
      ARM: dts: imx6sx-sdb: Add power supply property to Root Port node

 .../devicetree/bindings/board/fsl,fpga-qixis.yaml  |  1 +
 .../devicetree/bindings/bus/fsl,spba-bus.yaml      |  4 ++-
 .../bindings/display/fsl,ls1021a-dcu.yaml          | 22 ++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx53-ard.dts            |  2 +-
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            |  1 -
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts        |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     |  2 ++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi      | 10 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi      | 10 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |  2 ++
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |  1 -
 .../boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi    | 10 ++++++++
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  2 --
 arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi          | 23 +++++++++++++++++
 arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts           |  4 +--
 arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts | 29 +++++++++++-----------
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts           |  4 +--
 arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts           |  3 ++-
 18 files changed, 105 insertions(+), 29 deletions(-)
