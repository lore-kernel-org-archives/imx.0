Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021090.outbound.protection.outlook.com [52.101.70.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B672E2DC76C
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 09:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642046; cv=fail; b=L2oR8s2Ec1N99wn5+XT4YDxP0RLj8vx47oe+badzsILusVyr3HZrg3GY9NR8jGTRzXPFYL72ETTJhraFm4qZcCEaMPv4mThrBTCK+fGgaCz9rMYMlLM5CvbzUZVxl1oijJKcKnOu114vsijilXNUFRIPCj85QBFxaX4uh04mqzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642046; c=relaxed/simple;
	bh=IaxlvJrf7N5MwkrvL3UOqaSYMMkcVZBjJI8Ew0L1GTc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=tYVUg8klIMtTVZZVDrLcgQwGRNbu6b/tys9yZ94GEPMJIuEAjLRcpAjfrpHC90NxEqLQx9qxtPXXSMyy2D8N2OgMfBe6nmWXSj6dx9PFHobOJCf+a90d7pDPad/vDmV8WgcJUk6+z3ukmsTlFo0w+g/YOhA4lx4MMWYrgKVmKzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=InrVh9lM; arc=fail smtp.client-ip=52.101.70.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="InrVh9lM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IppVN0gtu6+0VzdgMKK27aCgQbLNuCP6Qpq/c1wnAkju4NcxWT2BqRJvFtpZkOIoFLxzz6pqo4lBYh0UHS2fpR9DjwZZc5kpkYz+IusdMof9/Vcqcf54tpWZxs4uEL9LjFOkpDojthhbhbuK4N3q9QaxKChPaZTF+mg39HjMyZUBq8JobpoGJDItep7mRA0UyyAcMjbycdo7pSWuU/WLit4uEHt3hpydO2uCapyoyTfQ7+/dTRH2X+2P9ezRs4ijp45XWpFtK8B8qaBvHrmM8aS58M51cokz2RbEe0Hi7UhbmT7oYavYo5nkK0kCpkU6ReeD28soJ86V1jsz5SbGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKcfdeINY6QRlfbHPF9aiUkgGzwG+7Yb2sscJT8dYOc=;
 b=chbn5zHItk2rjTcnERME8jAYB+n++PJ9AC6NItyE86ZrKL+r+zfXMykYcyEgOppLrUZZT/zZKhW7iiWnXV77l3E9pLkzqRC8hVtuizQ1hwN1/z0BM8eJMkwBIkC/lXAZqLAGpq+pywibhzoH97ND6sqz/yGpPQgVIFJ0UY8PGSXb7E2WtVM2r2bvxNFgvRkN1R5KgPmaC9Ptq5VEcm8iuhgdFWdMfXAKIcIY9CjK6MQtkRIOGsa+AtlIfZj5nxG5FB1VIWtTlU6ih9Og3wagT90cRpwxgTmJX9HZIbTK/Yro7gLge5+YrakvEFioRzat79yy1kQlZwoIGnKnpJLx5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKcfdeINY6QRlfbHPF9aiUkgGzwG+7Yb2sscJT8dYOc=;
 b=InrVh9lMKfj7C7ErRoEV5nBytnPUzm9Xog7leAVemHdmPTrVPX5VRHnnR6ugwz95ieXKjkpR14Swb9DTzM5VWM5Gu05hJC1x1xuydH2qH7VMpRu7SXjd1j+BSCFBVqdCJlGsj4n+E32w3bZaMIfRLo2nzmduO1DENLjnPOseLt/xsYI5UEP3E23JO72/gusStjf81LQCJ/nThg8VBFtERmBBORgKii5Pj5whiVK/aThGDW+b10cK9i0Ww495ZottELRfmDwYmLOiRN8tbZfm1aULVD4TvYhPPEh7Obzuq4ShbSNHfK/D9W8EaVP66i2s6lQJtICJ6JjI1ptuPirDDQ==
Received: from DB8P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::14)
 by GVX0PFA76EE0505.EURP195.PROD.OUTLOOK.COM (2603:10a6:158:401::7dc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 09:00:38 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::ae) by DB8P191CA0004.outlook.office365.com
 (2603:10a6:10:130::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Tue,
 28 Oct 2025 09:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 28 Oct 2025 09:00:37 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 28 Oct
 2025 10:00:37 +0100
From: Jan Remmet <j.remmet@phytec.de>
Subject: [PATCH v3 0/6] arm64: dts: imx8mm-phyboard-polis: cleanup and
 additional display
Date: Tue, 28 Oct 2025 09:58:07 +0100
Message-ID: <20251028-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v3-0-9b98f29a6bb9@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+FAGkC/6XOzQrCMAzA8VeRno2kGXObJ99DZHRt5iJMSzuqI
 nt36wfi3eM/kPxyV5GDcFSbxV0FThLlfMpRLBfKDuZ0YBCXWxFSiQ2VcBEPRwg8jjyBH24TW3A
 MXfQyXusRihp167kDk0Bje5FpaI0lbIB7jbUmQ652Kt/3gXu5vuzdPvcgcTqH2+uVpJ/Tj1rgH
 2rSgOBKh4W1XW+N3r7XV47VU030lTRi9Y9EWaq4dLwmWzVd/yvN8/wAVInTBmwBAAA=
X-Change-ID: 20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-ef10812a2d8d
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|GVX0PFA76EE0505:EE_
X-MS-Office365-Filtering-Correlation-Id: 41891cf1-71dc-4743-9c34-08de16007681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWU5WWRodnV0ZXdKNXFKY1UycDM2RjUwS2p0N3U4RitSWjUrVy9hMy9Cd1I1?=
 =?utf-8?B?ZEJOTnY2THZkSlBGTHVTbVppS0R3S3llS3pkQ2tuZXM3ZmQyU253bDliL3B5?=
 =?utf-8?B?QTU4SE5rK0tOQjhJT1VOdCs0NThmakNwNWZ0dXAyZDVSN2M2dVNZa0JpN2Ft?=
 =?utf-8?B?d3RLVnBud3F6dHpsMVN2UnNWYVNlNGdEcWZ6TGxnUXNERE9Nb2xZZ0NVK0Yr?=
 =?utf-8?B?QlZqa0dudDVvdlE5cERGcWlyeWw1d3ljQ0lRYUxtVDE3bk45V09hVDM0MjRT?=
 =?utf-8?B?RnJkTVk5ZTYrSVFib2U5TDZ1dG9ZVmlsZkhSeW5mT1BBK2hlZkNDSklJc01C?=
 =?utf-8?B?UHVHOFZIL0hOTXBlcHJFUVB1RUJlODE1WW00Ni9nSzZncmJKMnBFQVRaSnlv?=
 =?utf-8?B?QUdldzN1clB5VHhtTURMb2d1bkppY21VT09CM1MrS0tYWWl4TkxRam5NTElV?=
 =?utf-8?B?R0MrM0xSdW5BbGJyTndmTC82bUFucHVHQlZuUkxIenI3KzF0NTRBd1UzNFF0?=
 =?utf-8?B?SUZUcjRWOURZd1orSkU5WXZKOHBSM1pYNFVTSGs3ZnNibm1TS0UzWFBlb1VD?=
 =?utf-8?B?OVR4bitJL1Q4Z2Q2VVlodmtlZU5DRmdlcm12QTk2MG8zZUhGRzFSa0NQaFc3?=
 =?utf-8?B?b0hJeHhEcXVaSmFHdjh4dlRBR3NFcWlRT3Vvb3RZZjh1Mm93T3Z4VVJKTTJ1?=
 =?utf-8?B?YVFpMzQ3OE1BQitzNWhnQlBnRHpPR01kcmtjaml6WURHOVcwNU51ZTVsQ004?=
 =?utf-8?B?TXdRNHlRbVcvazNoZjF5Tm9BRFBtallkcDExL09QNFViSVYzSVA1UklzL0Vj?=
 =?utf-8?B?andqSXZOREliZDFpR050UFY0Ujh2ajBPSmlrcjJjcjg1czhoRWhpZ2hoUTdL?=
 =?utf-8?B?K0dyeWl3bHJXcFQwMzFHSlEvTitDTllJOGNoWU9YLzFUWUZqTlIrYWp6NDZ0?=
 =?utf-8?B?WE1aSEpEWFVTVHlnLytIUGVhYWthK2FQNXZNVFZPNXY2c3l6WXF3dVpKVjFW?=
 =?utf-8?B?ejNBM0I1enpKM3FOanNUK1BFcDc1NTR4cTJMNXJGRkptQkFaa2kxemVNTytX?=
 =?utf-8?B?NTM1cTR5cFJVS2lnaWxHcWswMWtjWVpZM3hWdnlDSkp1WmdqMS9Pd2RURmhi?=
 =?utf-8?B?SVB6cEZhZkxTUlYxV05ZdGlXWWpjNFhkVzdDRkNVTkZ5V3B1Wkw4TEk0QXdp?=
 =?utf-8?B?ZVg2VHhOUHhFeDFoN3ZIUDd2UFFyOWsyeGg0aUM1WUwrSWFNWmxIYldOVzFr?=
 =?utf-8?B?eEFQUVNYK2tva01lbEZTc29pYTViL2plaTUvdFhTZVhwVXhtTExuMWhsQ0RS?=
 =?utf-8?B?bmw4RWVyK0N3a2dNUUlHZ3JncGVNYlZiQUFyRWtTVm9Zc3V0VlZLcXFlYmJV?=
 =?utf-8?B?Mmx0bVJLaG96Yi9xQXRURHlwKzgwM043WnFxTGFnZk1HalBpYWhaT0ZvNnNO?=
 =?utf-8?B?VU04TTZTWDFEK0VPbHhtMTh6Z29MbkRkOEZTd25Da0ZGWHNya1MzaVVpWXlq?=
 =?utf-8?B?YUlhQjJnUW5TRnpEZk52NGliVWhaNHI2Qkh1OXI5WkRJM1dXSDAyTS9KRmM2?=
 =?utf-8?B?N1VXa2NXVHYyREdaUnh2dnN2OS9qVWcvYzVjWkdjQzN1RFk2alpYdDc3b2FZ?=
 =?utf-8?B?VUc0V3Y0eGRWWUlZcVU4ZXVMR1EyM1Zmbkd4eEZTRXY5eHFnOEZEblJxMDRi?=
 =?utf-8?B?eW8rTVk0Vk5oN1NXSUl3NEo0U2pYNkRRMGIxaFdXY0U5RnVyeFN2NkRtOTNX?=
 =?utf-8?B?cXZyeEl0QVZ3QnJLSWZrcWh6aEUyQWlnZVJrUXRvZWhRTUJJWVNGbEh6dnhC?=
 =?utf-8?B?bmJVbmNSTStjcG5FamZubEl6dmZydEtMNjhsRDdIK0JXRTA0aHh2emRNakRV?=
 =?utf-8?B?aXJIenZCcHUyNWpJcHdINDdwNUI5WExJeFpHT29lYmhGUEF0WVFXcmYwK245?=
 =?utf-8?B?M2dsREl2REFiZ2luUVkwcEtyV1dpTXFhditmVElNcS9SSEVtcjNVVDZweDBY?=
 =?utf-8?B?bExrbE9Xc29UcmNWZ2JnaHBTaThXRyttQzBhVW5iT3EvTnFBZlE3cUZONG54?=
 =?utf-8?B?Z2hpSmJDSWdydVIrYnRQYUNVZEgvWU4rVDFJcWxybzVjQ0owNlZxM05NQnpM?=
 =?utf-8?Q?yuZTnCnirqdM98NpaKj2i7pLX?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:00:37.6481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41891cf1-71dc-4743-9c34-08de16007681
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVX0PFA76EE0505

This patch stacks rework the handling of the peb-av-10 daughterboard.
Update license.
Move mipi bridge configuration to som.
Allow peb-av-10 as audio only overlay.
Add two display overlays for ETML1010G3DRA and PH128800T00.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
Changes in v3:
- rebased onto shawnguo/for-next
- add Acked-by
- Link to v2: https://lore.kernel.org/r/20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de

Changes in v2:
- add Signed-off-by to patch6
- Link to v1: https://lore.kernel.org/r/20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de

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
base-commit: b61938e8910c5dc0eecaf319ff12d67a35e39d9f
change-id: 20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-ef10812a2d8d

Best regards,
-- 
Jan Remmet <j.remmet@phytec.de>

