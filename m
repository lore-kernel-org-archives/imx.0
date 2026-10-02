Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AC742E424
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950118; cv=fail; b=pngI5QLK4qgFpcYXC5m2wcdrV4sS+rVmkTThPKindLYmj72xvBcOxN/5uPQVxW+l0K+pcmM5WruMfEnkwAyvFDkHyMJ2EnwvxAg7ky+cbAmmddAMvXqMgWGz8tp+KqNAOgQG5pLek21BjtlMjAR1Xqz0yZoSQHe+gKuIRIa2t2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950118; c=relaxed/simple;
	bh=i1D3X8QUcI92ugrYgb9vxHDuM01421b4TEJNkUs01l0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sZHEST0FjR97wWBOFrh1BTIrhogqbZCjt0Mvs+7BQYy5a/mrSwM9F1urOcwzMdWisf2D0CDTNV0FbHTiMowW1ab2Qu6iHgjQq3Zv60BHuUKL0rYpYV/c4cZKyyG7Cft5oEicbAKTwgZ10yiLxoWpCZOU2y48rchT2ueDXizECfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dAJsw3um; arc=fail smtp.client-ip=52.101.65.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dAJsw3um"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFBE+phnu5jkikgZW3H+geoLWFoC842rA21kiOK/1EN1qGJUsp1X6GAZ/S/5RbV0HqnyXpAI1RfHZwFLers7P8QxtJ0ft32AlndrzOoZraUcJIalg9rIGCMYsgzINL1nKjl8hj1ImGfLPVV0wBR9+SX5pffJNjStW9tz0aOgNaqzjJnsfLf6Hgko8DqowipaBydkSfMsKPSffUg1vF+DhtbbS+bTDH29K5odbmzBBWSXZ65GkRFZwIeoU60FV5ZqxtC3hJcePPxtotfV7SMQRdo8TerzZ3N22AalBTcpk9AZHyQnhusvQxgTVX7iFi4wGC7gjKl27gUJpEAc+nH+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ve7VB+tMulDcN/DBYp4fI3nisHsfeD0PVMfwmCylPI=;
 b=yz4Z+2A0Frg2pfnTCPvpDGgVIV7qhOU+8qj5qkOX5IqjrnqsW7aKlNDdA1VRFerc9kAD7gWFaTcLEEpj8UdYr78qVkYZny63Ff7yDy1LOYjDHriTku5zDulllW5mqbt0xb8xcZYOj5/RJURdJlDqj5Ovu1JgmHBN0H14kEDQFNAvRLE0g89EMQK2m2b2AEU1+asFyj0mcQmsgQ7SOL2PVJeb4rn6jDUfvVoLufiwR59FLCOvhcYC+rfN+beYOQZq2NgLar3V/2mEKIdth1Bod+kuzc8HmuuILij+PSJZuKgr3tkxt4e8R5PrltkLSe0dzNpyefk8A8m2GCdwXt+X2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ve7VB+tMulDcN/DBYp4fI3nisHsfeD0PVMfwmCylPI=;
 b=dAJsw3umJUFKLg58b66rPbV32hJWzjYxTJP+y0qIFNzawlPxiHlr2BF53zzab0WYteuiGo0hwTGHyQ7WYyoy4ux/FYBUzdx9cNtaei9LbKt9Y+lHhuQA8Ai9vun3W8RJnOUf2+WRsKOLhyKYq2Y5tsA1KihWja48F2t9clV4YRgmI86zBuAEv6n0PW/L/AOa8WDJRjTvDwwYGwLIl1dgGnK9m72vBNHfTcUtE8C0zUEa3//INZ31x98Fu1eDkfU0E571qZxBbQIZZTYvOSfmUnJxmOBJcCk3f/e35No3iKgV0HfdQF1G9ywakPYsOzS6u9a0WW9Qs8EZna1gnWYrMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11849.eurprd04.prod.outlook.com (2603:10a6:150:2de::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 14:08:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 14:08:32 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	alexander.stein@ew.tq-group.com,
	andrijsalivon@plajta.eu,
	eberhard.stoll@kontron.de,
	francesco.dolcini@toradex.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	laurent.pinchart@ideasonboard.com,
	mehmet.fide@screeningeagle.com,
	nora.schiffer@ew.tq-group.com,
	oualid.derouiche@kontron.de,
	primoz.fiser@norik.com,
	stefano.r@variscite.com,
	y.bas@phytec.de
Subject: [GIT PULL] i.MX ARM dt changes for 7.4:
Date: Fri,  2 Oct 2026 10:08:25 -0400
Message-ID: <20261002140826.3947315-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0083.namprd07.prod.outlook.com
 (2603:10b6:510:f::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11849:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbcdcc2-14e3-4ba3-c84f-08df208ea47d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|19092799006|1800799024|10067099003|56012099006|6133799003|3023799007|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	hYxf9oacNdhNRr8ZHIVYaqjJfIe7unNpMCgjgGboxnk+1RRBTJLfzDS0VtZ7q3Y8jAjAkGFDGIlQH/mI81y/+puQUaVIB6l61DZ4lx9isVHgcvGd0fK71F42ot0maZlw5BVHdvkHpLd52+MZIg9SklLxINZ0zSJ6lmHT4kQMa0Bsyg0NbpqIK3C7lmXsji0AI5AhxjfTrJlsYXEFxgwbGsIauBW0Y/zbD6GxrworGN5FApEtqIaiCHuBbtZ01/uJTpfDdo8W0ZC9M05BSv3sygoX2GptLL4u5rfh/aSVLko0rkXBDT9QbBqKanMBnwQuedSs8RmzHwjLNit3WsrBpfK9Itd091E/dhpmD49DozG3kOOuEzQ0n/VgpfdgWkMm/Zhj4mb6l26dZSk/hgyRbDHLJzUQOsVH0bGEYxzqWskZquFsJo2ueATi/yIYGvZFguFmcOFBQisYhTulQdNxEyHp+oyBJctH/FzWF3Z0IE4kUgbuTwmc4EKqmClxuOV7hw9K5G2xhG6a2yky9Zks1bOzZTOPS0JqQFze7vvc6RZIWqkfbrFeElnQj2k1OrwZVevgz+tt5lVWhpPAmKo+8DdpCWpTeK94hFNS6BBDPfh04N8MRAbQrDDbTcK3CGv0h6KYTEmRbJp9EQbnbU5ABAcHBPa/jUjuUqdQtAXx9Po=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(56012099006)(6133799003)(3023799007)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DNBYKleQVACoIAVXQHq1kbToP+rvzKEgPI34UEGh+pClbZZg6qnDPZMEzXpH?=
 =?us-ascii?Q?Ql/MjuXRwEzEL5yj/DBvNUlcBZvGR5Fj0dsp5XUKqzqJbu8PmnvuyZrGWo3T?=
 =?us-ascii?Q?f4TH6Hgun9/7jSwUG0vmkJDhV1JSEe/GDp3MUQpoC4K8Z0OgzMTgKFHtBKPg?=
 =?us-ascii?Q?GGDwBiu4PZW+XmlE0DCkKjHntIpjh69DpMcOSVrIUlIuFo4G2lraa0JNczXu?=
 =?us-ascii?Q?z1l7FCOwq5x2fbyTsxvEny764t8BudUKUc7VdnYzifx//M3efOu5SD3yLqLf?=
 =?us-ascii?Q?n9BweNol7tcxXspKRD4wV+ZlRRLnADVL8B3P+rVnGU9NqX8tjQaZmVn+YKWh?=
 =?us-ascii?Q?aft4RCIjb2y6XnS6hMcoWIIQU4VIB/filfunjMedDFBgksOJA3UDavAtEHy8?=
 =?us-ascii?Q?HZKQNT3Ib46FrBRWcYxeIX4dXDHxMp2eOExuOPaeHiCibni51m0rp7itJghB?=
 =?us-ascii?Q?UE4Y/CYJV+4u+/JPUDJgMJ/fLfNZ/pXl5Y5s7zTaP3j5t0lxC5efomKURERc?=
 =?us-ascii?Q?CSSpTwm14rAtKXGPaKSpI6Tm39UBx2DvCciDmgGFDHpHwpkEQ0HTv+H9ei/M?=
 =?us-ascii?Q?ue4VGJNAvNVH7dOsiA0fEd2o5FOhFkp3c2pN++379CnFZjC9WeMhJ00RP5RP?=
 =?us-ascii?Q?4UWqDG4fh8anViIgFWjUBw2RvYhKAgeK8pprfdg2uAVYCBYvYkpN52dQBy7s?=
 =?us-ascii?Q?T4sUs1wCZMX0zqcaUOGdOEor6OQGdqZM3YaIfYd2W0Rp3UCJAStw4vocshCa?=
 =?us-ascii?Q?UJIDdeOvgR2sD5VCe82H4PbeW6W7Uv7VXyKBhy6yDHDLivuAuwobVWlkYkQq?=
 =?us-ascii?Q?/q8Ahg63lWpnd7pu8LbpUAVmpLE1P/az8P7MCLvzePivJWIpcKUQpTTnxjUA?=
 =?us-ascii?Q?Qk9NAWXMmP4k6zGo9kT+j6pLAlsTG6/xKxfLGsek60qy0pj3WMCskP0Pu+lK?=
 =?us-ascii?Q?5JvGon8CZR/1RFyG4qLbrYqVT8/yQr1yRW60AWpVkROp0sgbsnN6tUjdym1Y?=
 =?us-ascii?Q?esGlY0uiFHvpzlvF+PwAjuj2QWWTpwGQto9KjRXEtP4z0RQMIJxFvxGiDEi5?=
 =?us-ascii?Q?24bBYldNNZxYJYY1JlR5JkFYxGSNE5sdGkWT5HcqwZJ7pe4YNXEUYlA/PbIa?=
 =?us-ascii?Q?i0VYnOQIKAqrrfRsmxsNOHneeO3/gQmUysIEufXgOclBq0DMwK58gBi80wJt?=
 =?us-ascii?Q?2ewqXn0VCweYjjiV5A606Tpq7uHatpiE5w5n1qEYFuhLu5S2cWaDg7a07APl?=
 =?us-ascii?Q?te5HZAQkfSQwPxPeGAC5JFGlybUAuixcYbGiIrVjauSOM2ZxTdPqnzCaULkA?=
 =?us-ascii?Q?F1m+gTxHGDJpRQU1giyiIGpWqyYOVmoNpi15UNQlYWVGct9KI5LYE8BkZtor?=
 =?us-ascii?Q?oNmlvaUN5rWRIa5zxtGXM5ubMJ5IF4ux7po1b8zvhETso1Hush26FdpqxWvc?=
 =?us-ascii?Q?gKoYCKfj40XNOCqkYervYp2WAu7uQoUCWldP/WTqGJi9o6fM/HrzkoVGi3az?=
 =?us-ascii?Q?OHwY2GLvWCPGy7c09rEYYcHehyfwbMvXvn6+ihYctgKA8Fu9eqExKd3yZoPQ?=
 =?us-ascii?Q?6kkEUpPPSiQzNHPo31eR75K4Fx5ix8h70Na7s/MIEN6JhWyeDtzQoXtwAnMt?=
 =?us-ascii?Q?QkzN4s+5km0q0FOI+I5+/VUThgp76CcLYMJIrx/DbKQ42HBsuaBO4mv0tH+l?=
 =?us-ascii?Q?3IgT3i+jCmJ5z6xe1e4Ql/P9nxipxES01/M11b5DYw3kD8iGdu3vpBXkjKs4?=
 =?us-ascii?Q?h3iINfImcG1gvzTolMJS6PKar80hje+Qptb4I1kZLXBl8CtrrEFv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbcdcc2-14e3-4ba3-c84f-08df208ea47d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 14:08:32.8479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yfo7EGAkM+XOeXPp1xSpoFJ/0KP1uFb9hmcbjYnDtU29y/SIN1VDT0JyCHwXA2/vDWxfJhS+oocRYSrL1it+edAo4QujG8+P/EfWAnn90jW0Gjh1+daSPjiHTszvUfoH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11849

From: Frank.Li@nxp.com

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt-7.4

for you to fetch changes up to ec7b37c768d34107d06bd629d05cde0e2218ee9a:

  ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL with eMMC (2026-10-01 11:05:32 -0400)

----------------------------------------------------------------
i.MX ARM dt changes for 7.4:

- dt-bindings fixes and cleanups: allow single reg for fsl,imx6sx-ldb,
  allow bridge@18 child in imx-iomuxc-gpr, allow display0 child for i.MX6UL
  lcdif, add deprecated/optional properties for st,stmpe MFD.

- ARM dts cleanups: whitespace/indentation fixes, drop undocumented
  st,stmpe properties, drop fallback "dlg,da9052" compatible, remove unused
  CSI nodes, fix/remove unrecognized PCIe/wakeup properties

- ARM dts board updates:
  - Add Variscite VAR-SOM-MX7, Colibri VF50/VF61, Amazon Kindle 4 (Yoshi)
    board.
  - imx7d Colibri eMMC: add Toradex Capacitive/Resistive 7" Parallel
    displays and VGA overlay.
  - imx7-colibri/imx6ull-colibri: set LCDIF bus width.
  - imx7d: add Variscite VAR-SOM-MX7 and MX7CustomBoard support.
  - imx7-tqma7: fix PMIC voltage constraints, sort I2C nodes by address.
  - imx6ul-kontron-bl: add GPIO labels, fix USB OTG1 ID pin, replace UART3
    with DIP switch GPIOs.
  - imx6qdl-pico/wandboard: replace clock-frequency in camera sensor.
  - mba6ulx: add Ethernet PHY interrupt and USB hub nodes.
  - imx6dl-phytec-mira: add phyBOARD-Mira-i.MX6DL with eMMC.
  - imx6qdl phycore-som: add custom volt/freq OPP table.

----------------------------------------------------------------
Alexander Stein (2):
      ARM: dts: mba6ulx: Add Ethernet PHY interrupt support
      ARM: dts: mba6ulx: Add USB hub node

Andrii Salivon (2):
      dt-bindings: arm: fsl: add Amazon Kindle 4 (Yoshi)
      ARM: dts: imx50: add support for Amazon Kindle 4 (Yoshi)

Eberhard Stoll (1):
      ARM: dts: imx6ul-kontron-bl-common: Replace UART3 with DIP switch GPIOs

Francesco Dolcini (7):
      ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel
      ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter
      ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7" Parallel
      ARM: dts: imx7d-colibri-emmc: Add VGA overlay
      ARM: dts: imx7-colibri-iris-v2: drop no-op delete-property
      ARM: dts: imx6ull-colibri: Set LCDIF bus width
      ARM: dts: imx7-colibri: Set LCDIF bus width

Frank Li (16):
      dt-bindings: display: bridge: ldb: allow a single reg for fsl,imx6sx-ldb
      dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18 as child node
      dt-bindings: display: lcdif: Allow display0 child node for i.MX6UL
      ARM: dts: imx6ul-tx6ul: rename disp0 to display0
      ARM: dts: imx51-zii-rdu1: rename node name i2c-gpio to i2c-0
      ARM: dts: imx6qdl-emcon: Remove unrecognized disable-gpio PCIe property
      ARM: dts: imx7d-nitrogen7: drop unsupported wakeup-gpios from tsc2004
      ARM: dts: imx7d-meerkat96: disable lcdif node
      ARM: dts: imx50-kobo-aura: convert sd2_vmmc to regulator-fixed
      ARM: dts: imx6dl-b125v2: add touchscreen-size-x/y to exc80h60 node
      ARM: dts: imx6sll: remove unused node csi@20e8000
      ARM: dts: imx6ul-14x14-evk: remove reduntant bus-type under csi node
      ARM: dts: imx53: drop fallback compatible "dlg,da9052"
      dt-bindings: mfd: st,stmpe: add deprecated properties
      dt-bindings: mfd: st,stmpe: let interrupt property optional
      ARM: dts: imx: remove undocument properties of st,stmpe*

Krzysztof Kozlowski (2):
      ARM: dts: nxp: Correct white-space style
      ARM: dts: nxp: imx: Replace spaces indentation with tabs

Laurent Pinchart (2):
      ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor node
      ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera sensor node

Mehmet Fide (4):
      ARM: dts: vf-colibri: apply the EXT_IO pin group
      ARM: dts: vf-colibri: name the SODIMM gpio lines
      dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
      ARM: dts: vf: add Iris carrier board support for Colibri VF50 and VF61

Nora Schiffer (2):
      ARM: dts: imx7-tqma7: correctly specify PMIC voltage constraints
      ARM: dts: imx7-tqma7: sort I2C device nodes by address

Oualid Derouiche (2):
      ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
      ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID pin configuration

Primoz Fiser (1):
      ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL with eMMC

Stefano Radaelli (3):
      dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
      ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
      ARM: dts: imx7d: add Variscite MX7CustomBoard support

Yunus Bas (2):
      ARM: dts: imx6dl: Add a label to cpu1 node
      ARM: dts: imx6qdl: phycore-som: Add custom volt/freq table

 Documentation/devicetree/bindings/arm/fsl.yaml     |  30 +-
 .../bindings/display/bridge/fsl,ldb.yaml           |  23 +-
 .../devicetree/bindings/display/fsl,lcdif.yaml     |   1 +
 .../devicetree/bindings/mfd/st,stmpe.yaml          |  25 +-
 .../bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml       |  62 +++
 arch/arm/boot/dts/nxp/imx/Makefile                 |  51 ++
 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              |   8 +-
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              |   8 +-
 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts   |  59 +++
 arch/arm/boot/dts/nxp/imx/imx50-kobo-aura.dts      |   7 +-
 arch/arm/boot/dts/nxp/imx/imx51-zii-rdu1.dts       |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi           |   3 -
 arch/arm/boot/dts/nxp/imx/imx53-qsb.dts            |   2 +-
 .../arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-b125pv2.dts       |   2 +
 arch/arm/boot/dts/nxp/imx/imx6dl-b125v2.dts        |   2 +
 arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts         |   2 +-
 .../dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts    |  75 +++
 .../dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts    |   2 +-
 .../dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi     |  23 +
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl.dtsi              |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         |   3 -
 .../dts/nxp/imx/imx6q-phytec-mira-rdk-emmc.dts     |   2 +-
 .../dts/nxp/imx/imx6q-phytec-mira-rdk-nand.dts     |   2 +-
 .../boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi |  75 +++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |   3 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |   3 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi       |   1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      |  20 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi   |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-zii-rdu2.dtsi    |  10 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |  10 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts    |   8 +-
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    |   8 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts          |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi             |  11 -
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |   1 -
 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |  38 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi     |   1 +
 .../arm/boot/dts/nxp/imx/imx7-colibri-iris-v2.dtsi |   1 -
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |   1 +
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |  52 +-
 ...nel-cap-touch-7inch-parallel-touch-adapter.dtso |  58 +++
 ...olibri-emmc-panel-cap-touch-7inch-parallel.dtso |  43 ++
 ...olibri-emmc-panel-res-touch-7inch-parallel.dtso |  32 ++
 .../boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso   |  59 +++
 arch/arm/boot/dts/nxp/imx/imx7d-meerkat96.dts      |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts      |   1 -
 .../nxp/imx/imx7d-var-som-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-emmc-wm8731-mx7customboard.dts   |  23 +
 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  56 +++
 .../dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi  | 358 ++++++++++++++
 .../nxp/imx/imx7d-var-som-nand-mx7customboard.dts  |  23 +
 .../imx7d-var-som-nand-wm8731-mx7customboard.dts   |  23 +
 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 +++
 .../imx/imx7d-var-som-v2-emmc-mx7customboard.dts   |  24 +
 .../imx/imx7d-var-som-v2-nand-mx7customboard.dts   |  24 +
 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 +++
 .../arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi | 102 ++++
 .../arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi | 118 +++++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi       | 533 +++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |   2 +-
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |  36 +-
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi              |  10 +-
 arch/arm/boot/dts/nxp/vf/Makefile                  |   2 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi      | 126 +++++
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi           |  56 +++
 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts    |  14 +
 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts    |  14 +
 76 files changed, 2398 insertions(+), 168 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx50-amazon-yoshi.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-vga.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf500-colibri-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/vf/vf610-colibri-iris.dts
