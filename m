Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2075.outbound.protection.outlook.com [40.107.103.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453B21A315A
	for <imx@lists.linux.dev>; Mon, 21 Apr 2025 06:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745218198; cv=fail; b=cWNK+HTh2y1w1MuM7Xfajhn9cqyq9KzI2oFuZZf92v3IekJriadMH4OfLJNACgmuxg67gl4+cjl5vdLbOCQcFbaHz8HIpBue6fvLThxx0GWj8mRvjuLD+6urubjbnlHSIkiPk1WeCM/KQvLhFqtczS19BA1DhyKpLgxSulb8U2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745218198; c=relaxed/simple;
	bh=S+XEnmGAPe0NC9O3AeHS6Y9FzcKCWMflz2uGphoIxLs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hOqqBWQVncM3D7wDqacEpR/zKHY6ZVLUFoVu7MNoKUDfzWCwieVZ5zw414ZI47WDZ6U5YPDMu04xmq0aHXk3lDPDuBswb4j4blL3PZTn+u0qh/WlVjjrU9Z9x34CaPYTPxC8XDo/026z6kEiGqJY+e71pLpTFDnyiBLGIxvsEE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XDl0J6X2; arc=fail smtp.client-ip=40.107.103.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XDl0J6X2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgzW22rLl5/2pzVvarE0TEVr/9sCNVaqPmzK3jzomGqmF/55rocAl+PX1bzlr7R/kUm5BdhxQS/FG2oLPhK1VqMyJs5F3ieUIWEc0VD3MCMSEUE1prld+BTh4gJvop/vKSk2hJqQ3jNhTm4BTmGUEuevT42tFtVrxMQ/wHdgf1p/+Rhq/J9gYWip38E46JrPMG2bqDF+I2XHmwKpNgSbNNfwVJ2nm6PbeXqwz2UhJPJnN/JV8YQp1GaaMHqYHGpmxOiJKHCY4UDu5IojVtLJNXBrVmOqU/ovoSpB0owkDkQVTREqGOn24LRfcYasxQMx9gUoywAjfXsWo0IYz47yTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmmtXSNdzvn+VDAG4dYK9COp4UznOAk2DTljkPxmiAc=;
 b=ffkVRbzvuImhS2DT0IQTObjkRk2FwtrldHcVeVCDsHQloO7RPLvIqB5sMGVhf1aeOMMdGZj5CGh/cGKmtBeYrwqQ458n/nLiT9itkc4HzSJGd0OKUbnE5ltCDTPccwsuVtT+PjzoHVMYLwuu2bWhQ0Y67m9K2OQ3E3JBcPv14S6VPFJrL1jdeoiLAgAwQPnH0md8RvZsA2iv6KL551AI+cMftIoXQc6B8EKWZHWb6sj5osDipe72I1ddvu3P78WZiBPGNUA0o8EyU+5Zp7AJzjITuF0o+0hCj7QMkhe9mzWy4fNBVWiWialKoahoDdGk+rSZ6OTdhB1djPv2E4t/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmmtXSNdzvn+VDAG4dYK9COp4UznOAk2DTljkPxmiAc=;
 b=XDl0J6X2JaM0akjZ1QO8FOGCVLxJ11C5VWX+7he/3s6kd8CKktMgCzVNYJFmSWpQpfjQvr1Kpmud0o3UEJPapko046Pt5A2Lb420rgBYX4f2GmER49YuuITY1eFjod+wW8HcsQNUKC8PWLce4AbHA68h0rT0mDSA44qoarg3Nuv74Oddf11EoXblaKEV1KGb6/Ry91tRF4IHNEAPuBXZEKGNr4n4R64/gLUeAulI+N0VPiSB3NnnnPAZVsmJm+HNqsGDe8UmqaLVn/yTDgeBYG747tBIHglQQSxA2g0u95YinQA5nvtRnQmz07zaf6/AnOTIPfXcvDQ1OlMO5ImIiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by DB9PR04MB9723.eurprd04.prod.outlook.com (2603:10a6:10:4ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:49:53 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 06:49:53 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linus.walleij@linaro.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v6 0/3] Add i.MX943 basic dts support
Date: Mon, 21 Apr 2025 14:51:36 +0800
Message-Id: <20250421065139.3073232-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|DB9PR04MB9723:EE_
X-MS-Office365-Filtering-Correlation-Id: cca3f662-20ae-4d2a-4758-08dd80a0b830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?szWgVgTe6rXN21PrrAQXdVflDiZyUtfe00lGk1peqVFdvGvb4iT4yOMmYom2?=
 =?us-ascii?Q?qwZIBqXGnIiuury4AVZLkwL3T8Ek049Xaw/oSCVQVrorllvxOb7sct2STjT1?=
 =?us-ascii?Q?/FPhhTVb2NEIFpU/HUN/5i/Fm+CEA7Z7KgZFW3wnf/xxnBxhhTh7d6OkF1HE?=
 =?us-ascii?Q?z03RBjo/vKy9islepcrYkDXMQy4GW7yP2/xkyl+0n8rpw/2ucLuRND6GgUda?=
 =?us-ascii?Q?vs5vLzcmN89cOeaCpMig+FLOBiOMSEKtPkyGzs2W5mD9sirflQAF7EVZxuu3?=
 =?us-ascii?Q?AgfKjx/RilwzEmEFH+GBvbS6klNHeM79ES8XeA+mYteMp6KuskD3gVPAGVx+?=
 =?us-ascii?Q?qONc1nLOqByPRMLVJHWc6jcdWjDZChXcQ3KnRafXw6yoGNKAAQsAsxoL/y/q?=
 =?us-ascii?Q?VBeXdDBP7h1OqFRUs498H06AIOT9gDfug22ls4UQ+/BvZv7Rxv+pNupZ2K4a?=
 =?us-ascii?Q?W/JhIqsRqSgQSkMNEJv5NJGIjlf9gjg3tkQtPrfXATiwJEeGh2bREXODRhIZ?=
 =?us-ascii?Q?BwyUb+TI7iSzkXlRY9lBegAFfbpc2uf8ku/VCf4ALxIFTHou19tVOkTEKMRH?=
 =?us-ascii?Q?fOmi6uLz7RzYst9Wpv1VCx7wnOG4uujWX9MwG8F6K2aDeR/8VuKA4jKcgVbN?=
 =?us-ascii?Q?bhyxv56vBhHvnNDShbuYoTeSHXCiOfgyk/0yMT++3T0sYNvb2iLjebvmpHql?=
 =?us-ascii?Q?UX/zsZ8nO2NqbcX12iYFr7RpH9Oq90xXwfFFcZXttII9dgio6gjBgoNpzVSd?=
 =?us-ascii?Q?dcTf8O8NVBtZuno13N6TuYV9BFgCV+V+XoAYjLCM0tRIYSzBjE2xKWpFQ6UR?=
 =?us-ascii?Q?F95e/FDc2cMpXADRNMRC3sT3RVRvMyecIZhEfW6XX284QZ8HZzakYXgkw1Fe?=
 =?us-ascii?Q?fFOWvITSG405UzUfgqkLtwIdIyaaLwmvxErXoKkFFYXEs67LOZlxi44LwIEf?=
 =?us-ascii?Q?xx4lHGn/i0H9ZA5PNz7qAnc+rY0dBnkTAEWJKcu/GFaGSIGvQJjzFS07/Axg?=
 =?us-ascii?Q?hdyD1ymRnO33tJ9giTVgpEGRpFWk7Xpl5PGf24hEuwgaQmLvZ9HDnomzV5O3?=
 =?us-ascii?Q?a2mEKLsmnpttF2le27/bPVk+uR9RuvyYovdq6Qo7zpIgFvu5c/SRVPNzIM2v?=
 =?us-ascii?Q?uF8fBEFIWQ7kEFJHdqxCy4YxvjBa1EO5N0cjGDVOxlp7N9mtUHyjNOrk8u1m?=
 =?us-ascii?Q?Fg+u+l9uEETS/l28oX4RIJFLbV1rOpfuoCNEmXzckeKs1kZAAYdz9iRwqGBl?=
 =?us-ascii?Q?rIOpVAgHChDWnPiyYEWV4GHaloW9AmgfZzBa5rSrlE1cfImgoKq11Ra0i162?=
 =?us-ascii?Q?7pboRONJqImxvSxeCk94Sb6Q3FUlhrpSdP4SHTjqVt6qokXklcFKfyVZ8RFq?=
 =?us-ascii?Q?wrol8p4/V/l5RYNfqRUzcIXfnz5907ixdmlBGRTodiuE+Lp+MLX12chVt0w9?=
 =?us-ascii?Q?wJ74w5R61A6wkxssJrNW4r2GBQYasMgOUiSbE7mOFS7varLcbGcHRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oB3U9lq+SL/M27UG6yYJI8zEdqzDAdJsOb8SRFg1ZBt8nR6Xk1tc1ta72Fi8?=
 =?us-ascii?Q?iB/BRge5kkP560UbvK1K4trSatxejPShRWfXHGywV2J2l1MUCpmULEIATPSo?=
 =?us-ascii?Q?vZmPNq4iLdsgjYBtSOHeNhYm5RD4yicLNg/UAoDNa2asvePosnLqg4dxjeHL?=
 =?us-ascii?Q?PhbAa68/kEJaELszwXFoddxp17LZQI9BjwxOOtpZtxvSO9H3nOzw8luTOTn1?=
 =?us-ascii?Q?cz3hRkSEybqdsOc/Dijcz5kk3iJVIYZMvOVO/+S1mrw2TDk1A7zOOspFyNPa?=
 =?us-ascii?Q?tB+Ttd3hsDcUmav94QCt+SBXu33Lo3hcxcm4YSycUIxrDWioOFgkxrb9uof7?=
 =?us-ascii?Q?iDybM7cT86ZN+CIINXhpbtUO5cHCcVszjKsAMUWLhhK0kj6e/g37HSZFlvcs?=
 =?us-ascii?Q?35sYQDik4s94X3mFzhBk+Yv534z11gaQhuR8XlfMoZ5Ey47wp1MnlsL/+Map?=
 =?us-ascii?Q?9kH1i8maqKnWsDNPu39lS26XVobV29EzW6LDZBWUgifMWYytUAkfHC63xmm0?=
 =?us-ascii?Q?uB/5j8hoafYemodTI4TIBGlGhCsB797Lo8g7RxQZDD4hv77WunE/7tmES4Zc?=
 =?us-ascii?Q?jv6rV/oEgceWlYWQn6+RIr2zOLDhzfLCCXt1rGU8yD1Hiq4yM8IqXtpXlz7P?=
 =?us-ascii?Q?s03Pz1Uvr3GinesG87wSzWxpwxl3Ik286TcjhBfmMMU45wnbx63/zt1WlXjO?=
 =?us-ascii?Q?m9EWFgpsh17Fje3yFchmsKpip5SlJKpf7tZsCzKHMqWfD112oFVrYrbcGW2Z?=
 =?us-ascii?Q?b6TL9Fe37esJQTjm7f+yiun6dDvSZtBN8QZm8M06z8L59WFklUzA9Indp5ig?=
 =?us-ascii?Q?gd3pBoMMzZ2OcHCCBQ7gWFO+X5vzGxPLN5eXuB0Nati6VFEI/21BSX7XOFpI?=
 =?us-ascii?Q?NxNC5qSBTKwxxZy4ZMwx7CFcire81N5zp8QLQuXbB2FfFDeInHLZ+rY8IyOK?=
 =?us-ascii?Q?qjv54KK4sHm/kJagYJkRbuyJi0wPoFJJK/2HN4yd5omsdI2xLDBAMt9VcMYE?=
 =?us-ascii?Q?SFWH/GI6GlzbETDtPQBFFR4EX9HkncSdiVnnSZF0QYouDl24bt6cBCP9sov6?=
 =?us-ascii?Q?z3d7km2M70lLzYnhrPbZ4rXyzGdGQzpaLnhZ3DFnSUUUAM5spA4vy/u7lhS3?=
 =?us-ascii?Q?itxUEw/QHtxdF0S7Ed4XsCRfGvKqjXdQWBbsRo5qlw+03FvGVnz9maYkIB0Y?=
 =?us-ascii?Q?Oiapxkt4toxw0s/NYAZCNQ932RMe0n0ZDfnFy1zSSfFBu4jNhrAKQAaGPHmR?=
 =?us-ascii?Q?2sx8mWMZPT+wm/rfsUEpQWFhqEC/DlMq6ZmAESD7/wlCQZih6VMhXO76RVoG?=
 =?us-ascii?Q?cAOnZTv8e/3MLSfVO+C2pjZbyTcGDSCvSYz08Eo872WnRj+6C2Jl/HVd7J5S?=
 =?us-ascii?Q?zW+pI7QBP0VVrom/7lcbaWwvZc0EqkDUuXbqE/hiLUhQY9WjHEhmrxn2VXr5?=
 =?us-ascii?Q?DTbkJDM5AYe+DAC2zDKJzb5UTOAiUQOAJvs/dlHGn9qDGRez8HjuaxFJvIKS?=
 =?us-ascii?Q?v8X26VASv9GD3X1cSwxfSiQ+HpdfOHXyMc+WGySvt1RNZ648oqe/ry8nzHyE?=
 =?us-ascii?Q?cg/LZzFFWxm517oRVECNBxoxfSiFXV6U16jcFhLc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca3f662-20ae-4d2a-4758-08dd80a0b830
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:49:53.2005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBloiVAa7/Gxd8batfWdp+tDxg5UEpGP4jn6unk349XTktHnhERGhPwkX8h7gmy6loGCJrkshlOiH7US0LI0Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9723

i.MX943 is the first SoC of the i.MX94 family, all the SoCs of this family
are pin to pin compatible with only several peripherals differance.

For i.MX943 device tree support, we split the dtsi into two part, one for
the common dtsi that shared for the i.MX94 family, and an i.MX943 specific
part.

Jacky Bai (3):
  dt-bindings: arm: fsl: add i.MX943 EVK board
  arm64: dts: freescale: Add basic dtsi for imx943
  arm64: dts: freescale: Add minimal dts support for imx943 evk

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 arch/arm64/boot/dts/freescale/imx94-clock.h   |  195 ++
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 1570 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx94-power.h   |   41 +
 arch/arm64/boot/dts/freescale/imx94.dtsi      | 1148 ++++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts  |  195 ++
 arch/arm64/boot/dts/freescale/imx943.dtsi     |  148 ++
 8 files changed, 3304 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi

-- 
2.34.1

