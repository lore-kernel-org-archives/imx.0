Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023076.outbound.protection.outlook.com [52.101.83.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A3393DEB
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.76
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425948; cv=fail; b=nhupvZAsF9WVLt2ifEfSP26sJLHJ+wNkWdLIDmawXaOZ1sqjrhKW+dE5kA5tcReasYeDgcNaqcRz6bxn/QeiUaGZxzvjAmCr3O6MPRXxL0s29ESuUhDjuXR8QXKsb84Ndt+lAg7ENyXOHN1z3DXTQSzAGXrXrRsu1lz39tlZeSs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425948; c=relaxed/simple;
	bh=QQvzSJ8k723ppN3EDYV3ktKJbReXPzzOVx+BRnhM7Ro=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=j7o5+a/AM/hghnB18N6K3UIS0T5y6P1feXp6AySte8rVVsAVJbLO7cpPNEHzmwzfiV3M/Y18Qj+bn6QCb4KoBOi/vcLJ+pSo2OSu94cc6Qy88hQE8RYJQGpnXNdOvTfwZRjOEjRan0wrdodAGcD2DXN6dNpnrf3T34+K8kQiK30=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=myap2Djy; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=myap2Djy; arc=fail smtp.client-ip=52.101.83.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="myap2Djy";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="myap2Djy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QKKVIwHU2WkX7DirJD4W387/u1Wt95a9+1aNAKRMi9rJ5hgZkb/0cdbO0wRJ24X2wghcGa8Eq86qsoUwhUfpmnQ5muwX/AU5tCayqYfoSLzwiung0He4etO9zGLIntTJUhA/LNobyMDURq/m6Oiab3xDyk0O/fQtWYBCFgNu+WsxKe4DCZ5Wz9X6ZYS4f2GT4nEzB5Tw7ByYEnD2b7Eehjya4vYEx0+H30YIsr7TNO0J1s9oPZ+JCT76ebBktj2RYQbpfRtgoxQFC2xA4HdMFrf+OZviH7uTykkHEPKWjfziXWURjUSI+LzpvMZvTuV4r8d7sYUXEKfyfKx9XBUeOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzbB3HKgpnqEJZluNF5w3i7ehpfzdioc60+c5iInIT8=;
 b=lYo58V5zHTp+vB0s8GJtlcBCRhS+tjuIiV+8Exkq6y6K0VuwYf1cyT2Jt6fOeVRgoYZR2Smeds6fFVruE7KEZNsIgq0QdV8IevjgiiXUSsgYDO0/E0l5pdPbbEaLMYjXq8jdvbmlUrE7Vzl/QVbEFTN7/E7u9StUPAlb0XcRZmoKTuyLjLvtSk9O8b2V3UeJ8bUcyjiLiBfPfAy7WDmCO+VLYcimoTqSbDgH5pFhiDZVWSJhv8Uz0ZemYLUPWq/+PV01hQ2sR5CyIWJi6++8qimkL5BOPtEWUhC/UR/WoNX4LzUDRA3wqt4KNOxwpECk+AT6IdedOslBWPutjr/0Qw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzbB3HKgpnqEJZluNF5w3i7ehpfzdioc60+c5iInIT8=;
 b=myap2DjyvlKKj5KpPOcbgAe9oXcWETb1ZR/SKDPGkyAMzJuxbyRy1r/EQafmv7qkYAgyWEXyzp1Ezscgn/XNsoqZpIpLGZViePMACBTPL9/04aiVO6nnXCR3i3Ue2f2JK3TrodJo9HUFI1h45Srx4cxh8SatKCdJvTAgiJS7mceXwIzCVQ4RV1lG1nQ9UBI8BWzIyI/kzu9P+NTd7gb6swLsr0MnTUhJ8acJfP+Vf4hipBOp6D60Hq2vOZ3m/d/1xzWEiZZcm2ZdX9omEwYz/JnCjP0g+8ooSarJ5FuNkoo6fQ25OOAg7UIlKX7/gKvuKpN/uI1fmUIrvv4x09yvAA==
Received: from CWLP265CA0475.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18a::19)
 by DB8PR04MB6907.eurprd04.prod.outlook.com (2603:10a6:10:119::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:20 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:400:18a:cafe::3b) by CWLP265CA0475.outlook.office365.com
 (2603:10a6:400:18a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Sun, 10 May 2026 15:12:20 +0000
Received: from emails-6537907-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 4E41B805BC;
	Sun, 10 May 2026 15:12:20 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:11 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZ5klUBITVHGEHX7YKr8qgDwy4SJFaSkJk7qBHIJX1ys8F6Lc28vc/wLvvtLqy3VawhLKnuKKtcBFFhLnSJ/e13ClwuhuzBbS57QODFiQx74O8FBnVeX0m9+mZJ4lrxxj9wDVdsqC2l7Rtkzx1G6GpnxSz5uV09z+eBKX3OlVBwOt6N7coSZpAscITjN2e81eGN3ePVHpOQ8+pbIxs2R1oc/Z6AFvzI/wSwaEMfjJ4Q7191A/0aelEGWAUReGcMFzttFYlsdSaBv06d4tjObsIExGPeE5pe8w6m+r8OWoJ0WM7/gxzVn0mFJSG+qb82KoADMgwKIHmTtlOdp6zXXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzbB3HKgpnqEJZluNF5w3i7ehpfzdioc60+c5iInIT8=;
 b=MqNoMfVUH6aWiotIIhtITI2TmBK344Rn840ncOOf30eYuOuuT78WAxmfG3phTf9nLdMwy4iJFTddXn+ZXJ3g2tfuJKp8CRcSPqeuQxI7MyHwfxsg50fSyph2CSI09KmBE25VCJ7qBH+YrcLkyCj1X0JUQLmOGF3M0AWXk1+V2chX5Uv2ee8K1t/HBY1IYE/kIgagF2Jgoa+8B429YfbKOqWSZMP4YJ8c1bqdGradCWnIv/3BEYz1fsJZMzx6H6IQngq+5KmQ+YUTkMMl9WOs5NpV/qDcBamhtTrCbxOhFLJA8rFPtjr8waOng/S1GDr64YPyC5FzpCJPl9OK85P6kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzbB3HKgpnqEJZluNF5w3i7ehpfzdioc60+c5iInIT8=;
 b=myap2DjyvlKKj5KpPOcbgAe9oXcWETb1ZR/SKDPGkyAMzJuxbyRy1r/EQafmv7qkYAgyWEXyzp1Ezscgn/XNsoqZpIpLGZViePMACBTPL9/04aiVO6nnXCR3i3Ue2f2JK3TrodJo9HUFI1h45Srx4cxh8SatKCdJvTAgiJS7mceXwIzCVQ4RV1lG1nQ9UBI8BWzIyI/kzu9P+NTd7gb6swLsr0MnTUhJ8acJfP+Vf4hipBOp6D60Hq2vOZ3m/d/1xzWEiZZcm2ZdX9omEwYz/JnCjP0g+8ooSarJ5FuNkoo6fQ25OOAg7UIlKX7/gKvuKpN/uI1fmUIrvv4x09yvAA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB11055.eurprd04.prod.outlook.com
 (2603:10a6:10:58f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:08 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:07 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v5 00/10] arm64: dts: lx2160a: cleanups, add new board,
 large pci bars
Date: Sun, 10 May 2026 17:12:02 +0200
Message-Id: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEKgAGoC/23OPU8DMQwG4L9SZSbIdnLOpROIhZGBDTE0H0cjl
 bsqgVNRdf+dEKmCEx1t63n9nkWJOcUitpuzyHFOJU1jHbqbjfD73fgWZQp1FgSkAbGXhxMhgzz
 6JLULDi3Hrh+UqOCY45BOLexFPN0/PzyK17rep/Ix5a/2YsZ2bGmK8G/ajBKlYqMM9IOJju/Kd
 EhB5s/x1k/vLWqmX67JrjhVjs7qznBgYnWNqwvvwIJZcVW5c8zea3T9YK9xfeEMCmjF9U952Ck
 IXpvo/5VfluUbBYcEVmwBAAA=
X-Change-ID: 20240118-lx2160-pci-4bdb196e58f3
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|DU4PR04MB11055:EE_|AMS0EPF000001B4:EE_|DB8PR04MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 250e7bb0-9dd5-4889-d2a5-08deaea68838
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Mv4Qvh2YGl2qXX5apI+UutF/ANswZaA+UVMXJlDgAiF/3PMj5AbG9XNK71Kj68+pZ2dlSHjwRjufppnfO9qFKgZ3WsphGgp0teTvPWa3LstQUwtc/mFaYbUV+nh6/HpNZLQKmlyt8Jdivkw0xwm8oU0hLjmw7xDOxDP3UNaJ0b4EDZbY1T3OCU99qghl4Qy3oaikjLNxl9h5iU5W/+o87kDeVMzI8rtdUzs0YWglIhxVYb/Fzi8G8nPsHcSqQjNgfxU0nb3v8mMRlKRHQ2GFgPoiEapZtDD3fFRnhkBIhZotS87DHCBxLbkYx+TbAZl4UTtixw7+q09rNvM5bMVsHKIEK67Z3v8bTWeBLRMd5nbx2sH3VpzcKEk3/fbLoAAm0u4TwVo279wook4Bj1SxrCccfG4jgfkOKe5Lx5mmfqFZM6xxtVowz3FzwCjsawvFNnmw2LXnfuw1NdA/sT7wHZbsBoAlSpwPpt39sOdKO9jqG4nxke2AdxuiiYQiZdJ6JbU/qqcaqQT2XZXUKBQuEgbJVTIjpFFpI4BPZo2ld4Sk5ylrMj/qxoRaaFnGbIhsHiOD5rTjteEAKUd9LJbeEyw2hSl9mjih3vyaHenHiaMU7TNNKcFPf+3lUyS0emADJZycoYCaas2CpH/k325UAX+O8klw6LNmnDZxv2hrtQZAoTe3rwCkCCNaigur8oCa4J7puU7ajHoH0QAmtT6S8JyTwxNJBuraIEyZQUf+L7uWppyYwITzFRxDEcBUJeAPswKDU8HXmdpTusSTziG51A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 Ch+13w3yHZMuZDmK8fUJy7/aAt5b7fPohNpoyKyf5+QwKAe2IwttRQaUvC+s+04A20k6Tn4xBKyTk2WkT2Vp/EMfa556I068mimllmGEJku6iy+rduQM/xbeN34hmoyPNzSPqdm0KE9sq5iyTjBrvH3IQtBIArhKB8WvvgefvH89xdSDsRyjzrZcF0zeFJRrOp6C5cGAcp3eAUCXN+VZ3P6KnXNCWnn471S71t4OLlZfiq9XvUW9+aSXcrJiNm2Q1gVoDNglxe8c6yHBFri2IzmTwS1HbhGc0NdNn4gMWOOR+t8+n/6LSEnqH5Zx43oXw9EBMU9wpgK237vCRbiulQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11055
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0025c91afb2f48488502966738e054d8:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	11f17e7a-f2d3-4210-a808-08deaea68044
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|1800799024|14060799003|35042699022|18002099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	XuZATfDB9IlcN5qLjsWOftsreZAsM8EzJjtEZGmD9AgN7Q7qqWIWIDMLpfuliRGNTql7dBj48mi/LAs/ChVbYTP8wk/8pEcYvrKeJVfcIt0f8mRJL3/2dj721x9dIVPQYWGJgD7zS9oOiR/9Un8oR037zrSQwm6NCGmAXI6oyjq3FW0erH6jAcR8tHfzznhzl152mvZ9n+OerVext/J6pdOlJfBv2E6pdrwUZCiWVJGOAUp/OAOC4paYukr9xN4tttDD8wkOwrUPowAku5w5i+8QK/dLuDJSCpdugm+0R1s6O7AlIgn/1ZyMJv5Y8iXUk3358cELHP/2XpWV3TD3Uk4X8AJoksVfG7FmMhbLkofIuNI6lQtXz2wl3s+gYfe8l3bFNMFcAQ68FRwAl6AW8lOxq4CQxh8g4ybzcpNWRCpilurumF7vRqgrhiKQa0lzrS+x/wpCpjz6UHI5sEYEE5b/BYiNIMVLjBvQ44PJDy5ydUToITM9udQ4FvLPPj7CA6jWqK8fGYEyOY27fg84vcGkEJhk3rUnm9zCM68Mv1cAM2wTjqdwoUVgtFaGRBKPecpmd0Vh/te0bpYmQPAWAc0q/L5Am9yKrpMXJ5i6XzonCe4Lkjq9vDsK+zF+WqAi1N8HuSoLcghSoiMv5mhlwQkM2es03AIPOl2Llx4RFCSGKluMw1YoUVSo5KHJpK6hotn369z+W0LiINcM39dyLkAJvLNVdXtGSsr/dFyzivpmCQNizXlSys0nD9Xfzbtr+WGPagpQQuWl2t6h5dzFkPyR4NLSRhT2OwCvC/cSF0k=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(1800799024)(14060799003)(35042699022)(18002099003)(921020)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XqFn3WLx0PHZUMaYlTBfREamnOMsEpKZ4QQt3rv0kWqe+gSq7Qesrl+Cjix8hBdr4a1yNM6eRS536YtiHS8TO+h+O4w0t92oui8SwRnFvY3xVyo5OU6cObUEaQnRkSTsKYB6I/rkQP5FF39F5L1Xwxjz3gnoZFoOJSJ+Yr1eoBS7oR9e2lS8SQ5Y9BY3ij33VUUh1r7nVDGL2TtwTAAU5nqBJ3dhvPk/sOmV9lhj6Tox/JW5fYdZHpzR1/IounYio8x/HqXYLm3glblX0SrP4M3q4wThU0G8tGMPFGjxBfZVlVbDl01KKlA+J8dI2aGHNtxQbPJiGs3qoYveXQnT7QAHCZ8iCeC3P7bC6KLYVx4wTnIS6ndZB0893DP5cRl9PJsR/bOriGm0hIxlewS1WRqxrTHc/NU0G0zkaHPUJhb60IAeRrOv/or83o8Ex863
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:20.5612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 250e7bb0-9dd5-4889-d2a5-08deaea68838
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6907

This patch-set is made of 3 parts:

1. Extend lx2160 pci node ranges to support 16-bit, and large 64-bit
   bars. LX2160A SoC has always supported this, and SolidRun carried it
   in vendor fork for several years now.

2. Cleanup some status properties in LX2162A Clearfog dts.

3. Add description for solidrun twins baord with single LX2160A CEX-7
   module.

There are no inter-dependencies between the parts and they may apply
individually if necessary.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v5:
- add new board
- add cleanups to existing solidrun boards
- pci: extend to lx2160a-rev2 dtsi
- pci: remove non-standard flags to pass dtbs_check
- Link to v4: https://lore.kernel.org/r/20260302-lx2160-pci-v4-1-30a30dc47ec6@solid-run.com

Changes in v4
- dropped accidentally added empty line at top of file:
- actually drop RFC prefix
- rebased on v7.0-rc1 and re-tested on v7.0-rc2
- Link to v3: https://lore.kernel.org/r/20250907-lx2160-pci-v3-1-bb66cc41b8f9@solid-run.com

Changes in v3:
- dropped rfc label
- adjusted flags
- split 16GB area into 4x4GB sections.
- enhance commit description with details explanation
- Link to v2: https://lore.kernel.org/r/20240429-lx2160-pci-v2-1-1b94576d6263@solid-run.com

Changes in v2:
- adjusted flags to fix several errors during probe and bar allocation
- explicitly tested with 2 pci cards on Debian (Linux 6.1)
- still rfc because a limitation in designware pci driver
- Link to v1: https://lore.kernel.org/r/20240321-lx2160-pci-v1-1-3673708f7eb6@solid-run.com

---
Josua Mayer (10):
      arm64: dts: lx2160a: extend 32-bit, and add 64-bit pci regions
      arm64: dts: lx2162a-clearfog: use rev2 SoC dtsi
      arm64: dts: lx2162a-clearfog: cleanup superfluous status properties
      arm64: dts: lx2162a-clearfog: specify sfp ports led colour and function
      dt-bindings: arm: fsl: Add solidrun lx2160a twins board
      arm64: dts: lx2160a-clearfog-itx: remove redundant dts version tag
      arm64: dts: lx2160a-clearfog-itx: move shared includes to dts
      arm64: dts: lx2160a: add labels to thermal trip-point nodes
      arm64: dts: lx2160a-cex7: add labels to i2c buses behind mux
      arm64: dts: Add support for LX2160 Twins board in single configuration

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |  12 +-
 .../boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts |   2 +
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |   3 -
 .../boot/dts/freescale/fsl-lx2160a-half-twins.dts  | 822 +++++++++++++++++++++
 .../boot/dts/freescale/fsl-lx2160a-honeycomb.dts   |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi |  30 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  61 +-
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    |  37 +-
 10 files changed, 909 insertions(+), 63 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20240118-lx2160-pci-4bdb196e58f3

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

