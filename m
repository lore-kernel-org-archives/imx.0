Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEBE36C0C3
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 13:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336534; cv=fail; b=CKCw4QDb8asefjJCwEOmgnnGNEJGz7K9fL3vWiPSdLmrlL5y1sEjiAbh663RHVq+G7AplM4je/M1FB7UKQSXW9ncgkBUxP2QbB56INJjfFXjsldXPtASsbt1DtTGePAfeqRK6qSLiTP5A/VAShM2YDC8wEu0/xjdmw56j6XZdK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336534; c=relaxed/simple;
	bh=10XhVfIigjpv/D8FCCNmBfXN26ILw9a1M+VyRBPayZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Al3RpCqoEMwUV2sFpZSyYyWOyLWuKGjG/stcOD7WC8LRqcES42sycgP6LesvwvSJonGcKTPCHSZSv4b8yKD9jPOilgmSG2X7zIQlr2DEpC7wrD6LWesZwE72j8V/zfC7dRGA1XF+7Tb9apk6SysM6+V43xF4Z64f4kt+E5IVgF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=cAC0QJ9M; arc=fail smtp.client-ip=40.93.194.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="cAC0QJ9M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8XceRt7Zybi37BbbVRPD2JuHHa1fPXsVMZKVV4VJ/Kvvg/n4+JnUSUH62BgUxqMAAuVrjdCM3DDYSo8HHvchDMXBLReQl9olJtIoA8MtQ/YmdiNswI8HGSKJBlO0tKg81/ZDqmhnw4JWwIQLM8kCfc2W5+8XQtscgMFv+rWIMo6YO23LFSKwKxqjPJYzEott/jlD/DKrSgRPSjZcqHU5jcFBMLooPO9go6JLUz/8RezzOqxpnxj/gy6B3FbWHEgC6dYCfFCJuRgmEGlzrJ+UnV5VYVW7Mhr3GEENFyB9eZPCRs5QYEb1BjOQvxKxuxHvOPtPIbMQui4Fcn6RSE2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMGxqHBenkhXclD0cCA641SdS/zbYThx3ZyEhqar1RQ=;
 b=I+63RVKOEGcPeKT6Jl4yUZVgMYHWvHKz0xOAl/VU2sH29IwM9lvAGAfbqnUQUfMtSnHQTw/Auy7/imyBuwE35fQT+t8lPexhV2seWefS1kQ8R6fV27GY9f9MPZ7Ev7Wj4v7PmQ/6li5mOWk+D4CEIW7k7Mqd9oMuZz8fWkKzr91BjT6loLrmbi6ZhZqoeg33KYr61MwLhR9pcDNzkY2qPzvC931FDxIDZkdHB+oKN2jiHYf/8DGk/Rh8cIcRqH42b+KA02ETqTp7NbMIboRzeqhzl2egpPr/tmS/DFyYqxN90tNW3ETbEWy5UvTeq8eK+kPewRQH7VeHix4mnDE6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMGxqHBenkhXclD0cCA641SdS/zbYThx3ZyEhqar1RQ=;
 b=cAC0QJ9MX05VhRKsLgLu34AxJPgSPFiF34HYirMUkKE8iL6sLiN4ERqbDRUPXkvvUAG/lkQe4P3LXkeiS2U2JyabNGib+VEz8CKSX87+N5humkGjtq1bLES7q1mShEKfjlVpPTmqRaKrLrIPcZAJfZEiMZU1b646Ys/J6QYuX9eXuRwYbNOwR3yUO4P26OOu1RftgS1ls8PLZADh84PdbHxD4L2I/+ZEJJNmU2IYqINczEwQl/U2b7UA3iVGcsAoZw5QDhjOqQEXiLVe8S+EhoUzwqemVRp8o37Oe+A2oz5Tc6+IZ67gCEEFoZeGeAmxkUUib+BAUK2L59xmSAgXlw==
Received: from CH5PR02CA0012.namprd02.prod.outlook.com (2603:10b6:610:1ed::11)
 by EA2PR22MB5214.namprd22.prod.outlook.com (2603:10b6:303:25d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 13:55:29 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::fc) by CH5PR02CA0012.outlook.office365.com
 (2603:10b6:610:1ed::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 13:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 13:55:28 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id AF514FFDA2;
	Tue, 17 Feb 2026 15:55:23 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 5/5] ARM: dts: imx: b850v3: Disable usdhc4
Date: Tue, 17 Feb 2026 15:55:20 +0200
Message-ID: <20260217135521.65742-6-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217135521.65742-1-ian.ray@gehealthcare.com>
References: <20260217135521.65742-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|EA2PR22MB5214:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db0a00ec-75d6-4f78-509e-08de6e2c3593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z3O5jeRLN71AEdQXYqqXetRn6iPqLygxy6Rho2NrDvgygtRVR0DIs83LjRcs?=
 =?us-ascii?Q?lyLLyWj6H5bkUV1703H5eF72TNiLsQR+eHzVyWHs+e7qvtNu02ManUGyiqGW?=
 =?us-ascii?Q?LT/gXcL6XfVi6ojdWliaYshHI/aEp2dP3CDB47C/fxwCm3Kdnsq/tLfvqiU1?=
 =?us-ascii?Q?ys6e/fjFfFMShaPoEXGwnxNd3wyWe3QUvUYTkh2mrMytg6S23JpGO741pnuf?=
 =?us-ascii?Q?z40+NO31bD+Sf9qlqiC1eeVTsO4u2vxIUpsWUazgbRUMDaMNkyOi9nJYelo7?=
 =?us-ascii?Q?yIX9oVRPJ1UW7Gd/4sUoRre6NxtE9OtgieFZ0nzaD/jc2GSVvg6uVyCFi2aG?=
 =?us-ascii?Q?SBB1BWSAPWObu/3BsVj/2qxNnXpWHggqsfZrXHX9mJt+OWlub6wMOaozN3VA?=
 =?us-ascii?Q?O/E/ulPSINzlTkymbBDhXsKD8JtdHdwLseBCiWzKhEReW7goqXeuRYe56Qab?=
 =?us-ascii?Q?/yHjiqZKOmQ+hyjssFOn3PObO2SqvKI7hT2hXenQxQbAo5+WgIRbL9FXa7K3?=
 =?us-ascii?Q?4jeloL8MBj1GzPmzGs88O6rlCdfWwrFrzkb7if4/LkJTaevzQkZDQepniiEx?=
 =?us-ascii?Q?55hCdorjv6ou2oIMn77kBjy98JDLcNGIgM+MmZ4TRxNEGSNGAKcxBG4W8EOe?=
 =?us-ascii?Q?I7Zn+fBtYyW6AUwAe7X1g56gHEmky4uIsu2uK1/u0d0uP+NtDeiyKBSwEznB?=
 =?us-ascii?Q?yY9hnBa1IwLfdqyjaCbaE+T5/mYifiDSpObE/f0xxibAVx6thei7zA847njR?=
 =?us-ascii?Q?3K+SFe5sBbqagSPPe128vT8zdNd0wM0ffKZpdDwnG2qaRjq9/qS8zvAE9Z82?=
 =?us-ascii?Q?SBmJCuOQ5tanjcnMQwQc7UNJ6ZNVp3oQIMCQoz6O9Fo6E6SodQ66z7tu2m7m?=
 =?us-ascii?Q?cIL5TjKIe8vs8yJQqsD8HEb/NAR5tX957/L7f2NaOZrtndgUesLTak16MH65?=
 =?us-ascii?Q?T3mPQa9v8HcMcHSeCGf55cY3bOkLr/cX+6uYMJ0R7GircytYy0zuyqFddsgg?=
 =?us-ascii?Q?A7ipnBCtyQakLnd6SAnryEqeHYViZZpaiWRvl+YDmps+GkjEEpswFKyO2TpG?=
 =?us-ascii?Q?Y2zFLDf1a0TLoSxQIrWg6w5rePFDubuqclb9wn7QN6fthnhDaZZiY0Oqu6f0?=
 =?us-ascii?Q?JHFEVivUwzJAXesaBKxuEVBWYf7Rf5bO0ChQYzMh3K1BrFoXVwL/tdztcmLB?=
 =?us-ascii?Q?tuJw4Cl+iPt9dMr0/keJcLb0jCBF6qAnFcxLATNrSLC1/yDk8okCzQVpnr29?=
 =?us-ascii?Q?DmoBmJu41PHOopte9NcNN3inroZ2d+Kg6JypgVvs6gIJ37EuOpzptuAerq8c?=
 =?us-ascii?Q?3wLd+lK27zwqxbQM6MkZZTQdHc7cOP88AZx0z6CQfp7s1Nb5R0SdHSd/aPIk?=
 =?us-ascii?Q?EZB6ghIlTPMDgd4i8ky2mxyXNJUv8w0viKm5O9ITo4LCaBwNcYutxyyRlfjC?=
 =?us-ascii?Q?9KOyGBkUcPAvs+9RRq8IhC6HzWj5eKqt3FBrageVASwF7UnOZzShYQR/mZFH?=
 =?us-ascii?Q?HlVKtngfbqTmLOvWZ/mQf4g3mlea2qnttj3aGIY9mPe4C+nAxG4DT0HBo6k9?=
 =?us-ascii?Q?Q2iqdPMKW09zVFnK+2MqFg2xtKaVco0sBTz2c+g4IZVGtW9avfFH9JG+3qdd?=
 =?us-ascii?Q?k13hM9pyD9CS6ejZiKrP8pyA8qz4AvVd39BmrD3C6Q8wu7Va2NG1yMw0RFu4?=
 =?us-ascii?Q?Hj/+rQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LW7D9SdjFx0v8EIwBdrRa9Bf0A+vdvjxUyYEQT0O5ZDEPs7JxikVsZleTWK+GoR7natMoB68DAYVP6bjHDM1hZZ3Tylr47qQPsvVbKEcMhY4+CxzSBCsz3A1vPVkRT4y4PzOJyz5ysJc1667kngZmCfwQQVYf06P0ZLX5bQCaj80OPhkskPwGgPv1bUzpdJ7hjtHEmTQgGUuyhVILUpLOGjQEZ/4C6ASMtuu7891aPEfmLivAXzr9t41PgH4ojSmKsIFGRIGqlJzRuh+a1dZSccxmptKD1NYFA/WbJxJGIPIOt7T5Ju7q8A930vPQF/KzfQKSV4F0rSmaGR7EwL5jlY6JuzlP+OoHpTzdGHi4jzCMHxbaYFIS+1XaUmUGYpHtlWi2LBJaS33PeH0OgZbHZrZwWZAehAmX1VKsZjOhNFNApCdH1Il60ybjlG78vY0
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:55:28.8516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db0a00ec-75d6-4f78-509e-08de6e2c3593
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5214

Disable the unused interface, to fix a log message.

```
mmc3: Failed to initialize a non-removable card
```

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index e5e66d536a2d..d00236a07dc4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -303,3 +303,7 @@ port@4 {
 		phy-handle = <&switchphy4>;
 	};
 };
+
+&usdhc4 {
+	status = "disabled";
+};
-- 
2.49.0

