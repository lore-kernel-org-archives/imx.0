Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012005.outbound.protection.outlook.com [40.107.200.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD7549B203
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 13:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354084; cv=fail; b=X1tQqy4maQb059r9zcGPhBsrCDME2bcuDOZAAuTNdnYWZpiW4Y/JypuLW8uM8DvfLWqxILRyhyBUtHlc4sRlee926AV8PuenWT478opsqmjBTwXkFPYOhKH6CBVO9RTqqtRj/Xw2CRwXJ4M4o9delc4n4oBehn7VeSDW3kKHKhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354084; c=relaxed/simple;
	bh=z1wd+19NTVuhwI1qhb9NqRcjqMBq/4d4PtcA6xIqsXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O8CysP0UqKwG+VxlNssSgej06tyHDFYm8s6ReyQjyVhlpiy4uoCIukdj/ka7JTNkJH0bxAxaYICAKVcSFAqERqsmwllblv88Am28J5oMKp3mEPYecnFA68vlSAP0vokoXFoObP8nGsOaRvpQr3SJ5CKL4BUCDW8EvaLg4ErbrIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=ZjUxId66; arc=fail smtp.client-ip=40.107.200.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="ZjUxId66"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIGKQSm3+oDwSpH1U1EIb7ml6pqCAgIeDwqTdPhu4CsVqhPkRzw0qdKp8CKgzN/LssvpUthjYErWit1fgkGSdBN14hhoDbW4IB9YLPsS4utf8r9JzvCm1ILEQzsmasfnz1wK4P4FSJbd2DUMtwF8C+T/RigBMiBCHjY3FjNGvauboKqj2hTkEvff3BWU+quQl6fJdfaCkJXm52A9I6iuEPkSDLmb6O9gOQgkbi+wP9VMGX1d/v3yRQREbLytgy4iaJfyQ7BXtq5Evg7IGCEC3n3CzFjlEM64L4VAca7OG2/Nf6KqRz7NhEFMoCwKAYRZkd49up+BjKsiet9NgP1HTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLRU7fz/a4AmTksGXjPumynJ36B37oe4U/DOZBzei24=;
 b=MHEX1VYalhL/HF1rxIsp+dLT92/ywh0ea+dlMFQlFaiRmYQOL4wk6wbY3Isbec9I3h6I4/S7rz+Ngr6pAyRwkTjeQHKG7XKP7jW8mUm1Sdt/EreM0PCJZXajiZLvYuUI8Hnrgo66KCFlXsUiWBWwF5hkWY9DI6pLhXNOFkTB7WPG34zzRSx6HqldKViPHX1t/tPMZY3ykP6vo+v7T8f/W9yw90L1/Zd92sFZ5gKRFqHhrTv4un6B8FfXDMop0x+IrJiRkjQyhYOdgiYmMJPJ5rmNqwoMLje8wQJ5s2YucwiJG6r4oD6L7AeAxKCrg6GSbyq3nwX6mTuMr3fjJDZoqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLRU7fz/a4AmTksGXjPumynJ36B37oe4U/DOZBzei24=;
 b=ZjUxId66AgV8rDnyPhsPlNW81ee8W2SK5JksQo1dbaUd/qAuHPBktwgqUM+LwG4BCrP9KVviAQdmdtjuGj28GgWoG8P2EY2ABdS0J9oSEUVLPI2a4HD5nnXh3heiSkbG6haHY2DEOkPuy8DxO5SE5lVSHz6r937Fxu6cUVicInWgNKGqmlgTG+eSkNyKK99ONmjHuA5NCUFAUt8UweZRaBSGr64CyEcD5uzZpOjYgorLzzbnr8D7he0nAHe0taPAXp0ngxPtoqREeR6x4w5a+WoS72h1qfVaTd0G9uHmsRxdYCyov8g6BTitUJOpuWH+xYpV9qI2TTeYvVn8xs8mpw==
Received: from BN9PR03CA0354.namprd03.prod.outlook.com (2603:10b6:408:f6::29)
 by BL1PPFBF0EF9425.namprd22.prod.outlook.com (2603:10b6:20f:fc04::f49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 13:01:20 +0000
Received: from BN7PEPF00000091.namprd03.prod.outlook.com
 (2603:10b6:408:f6:cafe::87) by BN9PR03CA0354.outlook.office365.com
 (2603:10b6:408:f6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.12 via Frontend Transport; Wed, 2
 Sep 2026 13:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN7PEPF00000091.mail.protection.outlook.com (10.167.245.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 13:01:19 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 62D81E4DB;
	Wed,  2 Sep 2026 16:01:15 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ian Ray <ian.ray@gehealthcare.com>
Subject: [PATCH v1 0/3] drm/bridge: dw-hdmi: allow ignoring rxsense for hotplug
Date: Wed,  2 Sep 2026 16:01:13 +0300
Message-ID: <20260902130113.2720-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000091:EE_|BL1PPFBF0EF9425:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: daf36e62-3d19-4ef0-f3a3-08df08f2485b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|6133799003|10067099003|56012099006|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	gP8PcQda4Dm8OkvoZMS/Dnry8oAlh6q9D+iDzT9gJz8o6UR1Wfw1sZqL8+/vvIcnHiJBxUMVHH7jdH+IjvjvNECUZ1WaD/v0HSaCY3WX0f8G7r0lSRr1EsJQFl+Tuz6rGpInbYvHuNpbec7Gv8xhRA0W5WpoRIYyV1U6HOwDoXyQa1PIfh9pyJ/qH9xQz6HNB6VIgxAGeoCn7DkyYyk0+lKD2Q1HqajVXQPeJHYccCVm7o/4GTb9iTnkI5SkK5DukM885WQ8azsPakJb1GJr250wkb6GbM75Auum73jv0Ijs4Z4ef+2IwnaWaA3c0O7zgb2vrHdeRySmObok5cHs2oh+XGsFBdvcS2aO7m4Ou9cg8fp72CtstqsW7olFkXinLRPJ/9yIaRizWNYV5hd90L2Ej2u4UE/zoEob8mKJdRuP0zy7uUTlbY1gEAY3ASWbNo8nM+c69LHCGVXZdJaR2wiVJXsaBIbyaU8CCZ7Vo75DNJBhcNLzN/p8lXxgX/hUwJg43eAQrCmQ5jYlMxrtZTx/FwuuuUg4IvqGYEOcQObuDMlc+WuUOb/S7pyxWTD6/gjAIGwfUtiIduvHRNoJ328astN7DritPLPMatARbW8cINZB0wAMM/6TkoM3bbRT5rwNqT7lbl5i2IcrrVj3xUZlqLTggbTryk0qjRJaqKybGrxk20Y/AbElcnqD05TQSFpm6aMg5C+uFMz9dQmg1A==
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jF445ZDP4n8kzjwC6v3pC9dnqXD8LPgmPc4mRzQUdEbn2iH2El9qDw9BTJyu8pfywWxX651RvkunHQusmonA33oYWpGgpGfc+coye7c8Mo0Au/WKATFF9tsgOG5UD3n/3Ew9JvnRSejLmJnK4NR0l/K23FZxz3ue6v/co1MycwIF3taULXTkC4VupVq2S8H2DItqcg1LVR+AjeEV8nfQguJc4sz2BAKvJzZZpzH6DNsUBAd65n2FtC4tr6lPNDQ8Ei/SHueRCOCoH60xCBcc7O4R4UH5NlVbwXJ+Gh77HFT8op9XyrbonGWEwrqc9JY44VClZNj7t6wQAYNYzfa06xTx9/i2/QrOuPrS13aQEUSK/YvFgMdNf6B9LXTKA8QFvlkf5kMO/j7o/iPYn0Kq8au9y44GzZwbC8OHVlDeM6VQOfk6/oOWBqXXnzDDobok
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 13:01:19.6587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daf36e62-3d19-4ef0-f3a3-08df08f2485b
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN7PEPF00000091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFBF0EF9425

Commit da09daf88108 ("drm: bridge: dw_hdmi: only trigger hotplug event
on link change") made hotplug detection also consider rxsense: a
disconnect is now reported only when both HPD and rxsense are low.

This is a problem for boards that route the HDMI output through a
downstream device which keeps the TMDS lines permanently loaded. On the
GE B450/B650/B850 (bx50v3) boards an STDP2600 HDMI-to-DP converter is
used, so rxsense is always asserted and a disconnect is never reported,
even though the HPD signal works correctly. The connector is stuck in
the "connected" state.

This series adds an optional 'ignore-rxsense' device tree property that
restores HPD-only detection for such boards, and enables it on the
bx50v3 boards. The change is backward compatible: without the property
the existing behaviour is unchanged, so old device trees are unaffected.

  Patch 1 adds the device tree binding.
  Patch 2 adds the driver support in the common dw-hdmi layer.
  Patch 3 enables the property on the imx6q bx50v3 boards.

  `make dt_binding_check' is clean for the schema.
  `make CHECK_DTBS=y' is clean for the device trees.

Note: The series touches two subsystems. Patches 1-2 target drm-misc;
patch 3 (ARM dts). Sent together for context, but driver support must
land first.

Ian Ray (3):
  dt-bindings: display: synopsys,dw-hdmi: add ignore-rxsense
  drm/bridge: dw-hdmi: optionally ignore rxsense when detecting hotplug
  ARM: dts: imx: bx50v3: ignore HDMI rxsense

 .../bindings/display/bridge/synopsys,dw-hdmi.yaml         | 8 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi               | 5 +++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c                 | 6 ++++++
 3 files changed, 19 insertions(+)

-- 
2.47.3

