Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021129.outbound.protection.outlook.com [40.107.130.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639592BCF41
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 06:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759214890; cv=fail; b=J68VCA3lBGcgLxFfpXjXshEekWpUDVe7bsLZIaf4NnfmoheVUaq1yilLZ9IENgsgupYAx4k84LB7mJD0n/DgErEMSfnDQlHIKUaip3WY0FvPHTKBxTie4z1cvWKxP1bqQJCUZ6xDPT8R6KSnoQp5+IblhHF76Y5QCpKe8Ptko+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759214890; c=relaxed/simple;
	bh=snHnkXLQo9gpS1Tl9GKlk51ibYJ/eOgiNDluulY9DAA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=i6e7Ep2W4x5LaA2ocdocBARVICzcCWlXBR96wTZ35hPsMwPGJWe1zgST4HjdJREd15AMOJZdGutt4/expSfzIeBth0CNkgJ6GT94OQP+JkmZZuQf6Q+EjidQYHEqO5bG5kUpWCbqTNihPGM8d3l3o3ZpXJIe75MYI5gwiQYeoKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=EnXLBkOS; arc=fail smtp.client-ip=40.107.130.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="EnXLBkOS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEIQg/ibkjM9Umf1jSNFE5J2bzrQCL31V+xg2GCcYSxo50VbG7T7Zk6RQ57RuzJURTD0zdcYXOssvvWqnlG0Eg08VJXAdiQXmvrSB0EwuUufVTQ4rhOpCGrrzDlzwh55tvQZ/dGp5cSBpabkb0aBejh7UPDa+DZT9rf4eYyLbssPOngBE+dGBc5Q3aqVKnnPOKob1oCCvP8tkJu+6elfo6/Auc2rMPMVeFjrHlM+854rGJ+szUiotUob2Rl0FkppZsMUEc1QTvQXYy76e155JjfS+dYSoO9oPCOaeC+MhE28WGSQRXydpm2iJcSPI4WNFFmp5iCPUFugyXSW8TlUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcEHxpMhi7cKgOinEYI7z8NY4BTIS9Uo+mREDPu5ltk=;
 b=EREg+yrZC30Ktnb9SxZXfarYLfbA96h0WZOHP+/vLAK4QIOyFHmDFq3C4xrBHaqWG+0H64KRBpSTk/abY5JJ2f23g7hgdq/dXVP7Wtq1K95AvPfmZ+cXzHKUVqzVju9vkjgrOUUhR01BAp8ngCX2xh7vuu/ZDkPA/pn+mZSsl+5Rd6+FT7vNzwzTwtlpNewVeVNTQvEgO5S05LKOuKl1PgpyFqvNb9KS57bUsoMwrHhLL2QBMcHZP0C/ogmZ7Feeub3GYDX084xvEnWVZg07J6g5WXOvk7eVxcPrKNlqYjLzYBaEHmjjjg5TXwN99uLfZFQySUmv5TPwbvGZ2b90pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcEHxpMhi7cKgOinEYI7z8NY4BTIS9Uo+mREDPu5ltk=;
 b=EnXLBkOS936V6GgvHMV6fSBJ19JnJYEd2yo5WtG3su0gzYHheo4OCg+V9je+hbGwfacG17evnwJGGrNT24Ebi5i5EbVQc5geVnTAYrHLKhdb4oFYtTTgItyaS/MXRns68S+qjN88Ife1MbJGPMmq79yELpuUuvntA/KyWXLnT+89vNz+9i/hzai+ikwp1B0jX4ELxEjD6B36LVB9s3Gn0yuZxwqxeJl2pEmp2ob4aqu5LQ1afhIk+67kCaYmNMoKnP9e76NZVNlLBT45kyA7izz6C+FUL08jjRf2Gep8P4hTPuDxEq6OgfGEZX/AdAtaybs3tt319SbpTBjnZrYlWA==
Received: from AM8P189CA0004.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::9)
 by AMBP195MB3197.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:6f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:48:03 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::1b) by AM8P189CA0004.outlook.office365.com
 (2603:10a6:20b:218::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Tue,
 30 Sep 2025 06:48:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 06:48:03 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 08:48:02 +0200
From: Jan Remmet <j.remmet@phytec.de>
Subject: [PATCH 0/6] arm64: dts: imx8mm-phyboard-polis: cleanup and
 additional display
Date: Tue, 30 Sep 2025 08:47:43 +0200
Message-ID: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABB922gC/x3NQQqDMBBA0avIrDuQjAixVylFYjI2U4gNSVCLe
 PeGLt/m/xMKZ+EC9+6EzJsU+awN+taBC3Z9MYpvBlI0qJEG3CXhGzPHyBVT+FZ26BnnkiQeJmJ
 vlJ4Sz2g31GrapYbJOlIj8qKV0WTJGw+tnzIvcvzfj+d1/QBE5K5AiwAAAA==
X-Change-ID: 20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-ef10812a2d8d
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Jan Remmet <j.remmet@phytec.de>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|AMBP195MB3197:EE_
X-MS-Office365-Filtering-Correlation-Id: c75bdb54-d021-499c-d200-08ddffed4ddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUtTNmhUMWtFQldIUGtpMTY4Szg4ckJ6bzBoOWJESjRPdTZ1SDFoM0F1Z1pv?=
 =?utf-8?B?TlllY1RRT1NYbVBTa3I1V0JKZmVPVWpUSEpOWWxhaWNMWXRpY1NDREd5WFFI?=
 =?utf-8?B?RGFFc0RJbzRQZWUzK0k4ZEV3Y2RvRThLanNnQWV5RXNtalJ2RXBSRklLUjBU?=
 =?utf-8?B?WnVwREM3eFBzeHcwUGp0K2I1VFFYaWJTY3l6SlQzMytzSjlMdE1nTys5VEll?=
 =?utf-8?B?R2swcWdjSnZyYWc1amVwM3dUaHhGdTEzTmtPNnNDV2FIYXN4R25tMSsxY3Rv?=
 =?utf-8?B?QXZpRG51Nko5RFdJbUovTjVQUU1pNHFrbW9jekYwTW5xSFVhdWp3enQvSU5x?=
 =?utf-8?B?VmhlTE1mMlRXclp6SU9aaEFlL3NBY3d2R2FZRlhBODdhV1EwbFlkMGVJQVhL?=
 =?utf-8?B?RmtTcjhqa0JuM3c3SFMzRU9rOXYxS2E5dkZLRVQ1eXNPOHRWMzMwcmUzSkVZ?=
 =?utf-8?B?T0VONlFMK0RGTSt6NW4vQjFpWndtTHByc1pOVktlUlVSWEZtNW5zMVZ6b2Vm?=
 =?utf-8?B?dzlYZEFCUXhNbzc1OGhaQWpJVFFzVklYWXA4dU51Mll0VyttSVpoZ0FxVFdX?=
 =?utf-8?B?cGova0RpdWgrbE4yUE9rMlJXd2pGYjh0cGdsSVl3TUZCVjd6YTNxNEVoZ1BJ?=
 =?utf-8?B?M1lsVzJHWE05UWV3Wit1bTFZNnJ6aVJ1YU01aGtNbWNra1NjRWYxUUNsa29t?=
 =?utf-8?B?Ly9oVEZPcDZtaWhuRERnQldCZVNpbVI1d1dieW5leUM5N3BXY1pUa2tDcmxh?=
 =?utf-8?B?NHpHU1RJM2RPR1U0ODBMdnJnM09TYW9KaGN0VUtWVW1YOFRwaWNSbVdDS2x4?=
 =?utf-8?B?YUZtQlRISmN4UUR5UTVsQ1hJZFVNekJoK2NITTVZTDBsNmpwV1dQc2JDVkNM?=
 =?utf-8?B?Ritsbm8va1hlaHRVMnZKbkhVWEE5NERFd1JNOFdPSWRwcVhKZGtodzZBQ1kz?=
 =?utf-8?B?RCt4SXdIcU94QjlqMDBoSHVDa2VvZ0tIOThMYzhhUk9nbEU3U2JzOHNNOHJ4?=
 =?utf-8?B?b3d0bWxFdzI4d0x5ejBuR3JzLzV5UFVKbzFHNGMzNEhBVWFpV0dRbW9VQVJl?=
 =?utf-8?B?YUkrQmdqWWRTUjF2aDlyclU4cllhbW5ORnRkemFqa1o5NnorT1BMSm1Ta0Rp?=
 =?utf-8?B?M2VVM3JxMWNvbVc4TXh1YkdnQ1RkYWtUNWx3bVNTRTk5VndNRXpldTJMS3lS?=
 =?utf-8?B?c1hIVU95YXBTRkVZaGZ4ZTBPQTFRcytIbEx2WjkzTlVVUXJ1V09JWWI0MjZU?=
 =?utf-8?B?MG90RjJFTVJHTytFck5LL0FXZlB3MDhRKzZReVQ5TDl4bWMyY3ZzVXZ1ejhQ?=
 =?utf-8?B?MGVIVkJnVENqcmpOK0hERi9MK1BuMDN6bjI3V0dQbTBSYldSOUVURS9aZ3pL?=
 =?utf-8?B?UTdTVEZjQWl5cDNvY05XRzFweFNzaHBaVUtWWlRnd2Q0YjdKa3ZYMHlWZ0NZ?=
 =?utf-8?B?dkhVU1pmekVDRGNheWtQSlljVFc4QTU2ZFRGbmk3Y2NIZ0ZwSFhTWVJOWENj?=
 =?utf-8?B?eDJWY1RiclI3dG5ZbFRqQmFINkN0OVRjczYzQWQxaGRscGt5MVowWEJKYksv?=
 =?utf-8?B?NTQ0UkJtODB5YS9SYVptanE4ZStDY2dpaWM0eFJBYStlTGw4SHBkQ29NSE9X?=
 =?utf-8?B?dnhFTjhZSHRXZFZSd2xlQTdPRWVwQlorK0NkMUhvMWE2L3c0VVQ5TjErZVlx?=
 =?utf-8?B?MU9GZ004T3hMd1RuMjlPa2J3VEp5SlFXKzJCdTFpMWZ0YzZPbHFRRUt5RERK?=
 =?utf-8?B?cEtHbnhoOVEzaDhKU2dkYUxiRVgzcjZQbDdZQ0lVSmhuUzNtanZUS2dpZ2gw?=
 =?utf-8?B?eEs2UUQ3NXk5M2txUVF5RWtiTXhRUnUrdFUvOGZFM21UcEFHcjU4bWJxaXBv?=
 =?utf-8?B?NFhsWVJEZVJWajBsZnI3NjZ2NDlTbmcwdU1HUHpYazNuZklzRi8xMFRlWG9y?=
 =?utf-8?B?SHFEa1VMb01jNkNRRUtCZW9qelpJQkVDU0pkbkFiT0VSSjc5c1hMaEVBVEUx?=
 =?utf-8?B?MUduUWJzNTNCZ2FoTU51aURVaUV2V3o0MGxMZ0NrZkpkYytOeGlVZHJRQ1Jq?=
 =?utf-8?B?NGtxY2dOUDFxSGJ1bE9ub1BBeEpaaWVTUit2V3FqeXhqV0pRbFQzQ1VFbTNR?=
 =?utf-8?Q?X/U8=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:48:03.4720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c75bdb54-d021-499c-d200-08ddffed4ddc
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP195MB3197

This patch stacks rework the handling of the peb-av-10 daughterboard.
Update license.
Move mipi bridge configuration to som.
Allow peb-av-10 as audio only overlay.
Add two display overlays for ETML1010G3DRA and PH128800T00.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
Jan Remmet (5):
      arm64: dts: imx8mm-phyboard-polis: Use GPL-2.0-or-later OR MIT
      arm64: dts: imx8mm-phyboard-polis: move mipi bridge to som
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: reorder properties to match dts coding style
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: split display configuration
      arm64: dts: imx8mm-phyboard-polis-peb-av-10-ph128800t006

Teresa Remmet (1):
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix audio codec reset pin ctl

 arch/arm64/boot/dts/freescale/Makefile             |   6 +
 ...8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso |  44 ++++
 ...x8mm-phyboard-polis-peb-av-10-ph128800t006.dtso |  44 ++++
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtsi | 189 +++++++++++++++++
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso | 234 +--------------------
 .../imx8mm-phyboard-polis-peb-eval-01.dtso         |   3 +-
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |   3 +-
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |  28 ++-
 8 files changed, 313 insertions(+), 238 deletions(-)
---
base-commit: 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4
change-id: 20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-ef10812a2d8d

Best regards,
-- 
Jan Remmet <j.remmet@phytec.de>

