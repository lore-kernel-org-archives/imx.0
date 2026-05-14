Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020105.outbound.protection.outlook.com [52.101.84.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23A038C42B
	for <imx@lists.linux.dev>; Thu, 14 May 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.105
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753556; cv=fail; b=K7fW8ckVNdGq4iJSAqjfPl4oHQtwVFH17o6Ffjgf4Wa61CpgPRJ6M89gtTN5p6STqte5cpzUrAiqBT15DQEuy1dbTmfVfzwwY+AAf/gm9GL5KfaxzZAVjjnfHiycit733hn/fYZkRGaZ8nms8pIFFwEFL/MZuSYsYelv7SnoRTE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753556; c=relaxed/simple;
	bh=hVMy5cpkZSIh6k2LKTYspqb/SKOXPirh2CSjJGdmj3o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FXhD9UOstw70THSMFVw8JN0a7n3csazbmz/DcoznUNwxqq/83n14dIudQ6dSV+kcN4IExb3GGHwkJklGoIxct8Zvm+SwnppxL0fZaJNtXwiihA8LnbgMkErIr2EVSZYzX01LcEppjttajUxV3ZF3CQRz0PbaNTSCLHOPGiMCELM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=UdJIJwqI; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=UdJIJwqI; arc=fail smtp.client-ip=52.101.84.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="UdJIJwqI";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="UdJIJwqI"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PvcWL+Icc7g4byTNuYmGWjOxpBqjGAwhmMToj6/KVLCqUZJZkZzwkUBUuAyFlNu1+PNxJ79JYvuK1gwuehbP7YI5fxLFWWOs0ccwjJ83UNegmsFvq3J3qb8Tr55jQIMCTG163ncgiB4goEL4d9mxOkxgkxnT5NX1RzWwG4A5W55oHTuLnwD+LP18/s8ZO7cDKGtNXY5rg2GsLj+4CJE1zc3GbidvEQE/8kwmPXeZWQHkyfSM/YGGSDUcmrIri7MqceLexjNraLC2ciCKefS02NquLL58s3nVKKRS+YSznRY24AnKwlVRsy6OajwAjxcgGhsyf7leP7WcNOMDN6QRLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVMy5cpkZSIh6k2LKTYspqb/SKOXPirh2CSjJGdmj3o=;
 b=UpR4QWyJJBgTJbrmnSf7BFGYOeOW54geilrF/VpOeAMEIU2T2lL3qs7t8o5RJELfTR6LpSu9XvwisHSOuGnhxQI/Y6lKGTFjcIddGbYeC88joCK7ZPm99OOfQ+cn+L0cmAA79y5L/jNSLei+X5E5nWp33GgZt7+Nz/Ef0MjFqbF1HHw6WcC6MSQvzXDlD8LgbGAi4oI8OG8a+yMQUmqjeR7BENpdYUf5HE5h9VakKk02NWuvprcjjlN8mmJPKWiJ/LOmCFzUgo0ARmhqOmNsIxaUMc7PI3mHoonqVSw4jl65OWXvnD3LzUzXVvP577BI8JdCn4LMe72RwfOoIFkvVA==
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
 bh=hVMy5cpkZSIh6k2LKTYspqb/SKOXPirh2CSjJGdmj3o=;
 b=UdJIJwqIoFKgbUWEsrpr7W6kQ9Cc2TielwuNOJKoCftmxrZVrCqV+YgIJJDb48F280BkjpU/oaQyBt6M8KF9+NCmp1Y01FWeR75UuZBHgl4rIfyyCZ0kr+vd6mPwwYK8VIRenN5+dktxhHPeIiVC4DiCnvnn3IF7KRDyKCZcG4HCHR9HSQgsuM1XjqeFEyY9W1Avkxd0O3/LFwxOMbIS6fkHXKF48yeEXkmPxTtNznRlLJX5rC37R29D1l/eeNrTjLcTgfJysT4sdiLKP/NpUCXyxfM8cynOelfFr/Y488wXWIuUrz6zw2k2v/Ck+JFddU1ymKGdUkFYXY+zjoVyog==
Received: from DB3PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:8:1::28) by
 DB8PR04MB6921.eurprd04.prod.outlook.com (2603:10a6:10:119::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Thu, 14 May 2026 10:12:30 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::4) by DB3PR06CA0015.outlook.office365.com
 (2603:10a6:8:1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 10:12:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.8
 via Frontend Transport; Thu, 14 May 2026 10:12:30 +0000
Received: from emails-7621445-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 50396804D3;
	Thu, 14 May 2026 10:12:30 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu May 14 10:12:23 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1iK7kbBxYEOazbmx5k0VD7KzI4HPt10HoUM9/rTWrBpca1Q0j9knXBSzbMOHUe8YevQ+5RbBP4znRtdyD65xmoAyX4GrtoCwdVwJZvSLryZRUj3SkoKTue/nc+UudVA8BqqkbGAxNvPp2Rq40h86zrDStCmdmnopOUCij52c2vmG26LzjxLZ3OUCzo8YiyHRZMCTylO5no14tVHZbQVlQVoMg+fQyTAew/J5eIrjXM6XnGYEegGQJNNksdqtkBoMh1aDWbMkzUBDiDmXDUsTEgopkjVJ11gSEsPYTKllpWfzyB+Otqsfeudtnw0TLYeRI+w2FBrEPxGnYHR906X3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVMy5cpkZSIh6k2LKTYspqb/SKOXPirh2CSjJGdmj3o=;
 b=GEH41TlnIsPU+ofq0XiD+HPSCMaQm2cM9PwcIb0kwtrSITwYOSIbkj0dq85jVL6SwswLp+s4VPg970uoSMDUXyjfAd4K3VtsX9vbQmZi+DH5169+rCdwn2X59ZqJtYRuaWydzna4Cyu+AV+KL+pc1J5Es3nGVDadFuLf+So65Ek0HQAn6vliRaBup0Mwuq2KVVkef4if8sAwA1nq6uAE0uQnXOEFQRXeLsTg1FZefPRp1G4bR79Bvglp+mESiRITFgOVOXhHEm08inSwrpHWBc9v/ZVuyVa7rcxi7t9jT8k3/wcOP7Qx/34d4m2TUd8piDUfxgLTy5vFqV1/p7Pveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVMy5cpkZSIh6k2LKTYspqb/SKOXPirh2CSjJGdmj3o=;
 b=UdJIJwqIoFKgbUWEsrpr7W6kQ9Cc2TielwuNOJKoCftmxrZVrCqV+YgIJJDb48F280BkjpU/oaQyBt6M8KF9+NCmp1Y01FWeR75UuZBHgl4rIfyyCZ0kr+vd6mPwwYK8VIRenN5+dktxhHPeIiVC4DiCnvnn3IF7KRDyKCZcG4HCHR9HSQgsuM1XjqeFEyY9W1Avkxd0O3/LFwxOMbIS6fkHXKF48yeEXkmPxTtNznRlLJX5rC37R29D1l/eeNrTjLcTgfJysT4sdiLKP/NpUCXyxfM8cynOelfFr/Y488wXWIuUrz6zw2k2v/Ck+JFddU1ymKGdUkFYXY+zjoVyog==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by VI0PR04MB10255.eurprd04.prod.outlook.com
 (2603:10a6:800:23f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 10:12:19 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 10:12:19 +0000
From: Josua Mayer <josua@solid-run.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH v6 05/10] dt-bindings: arm: fsl: Add solidrun lx2160a
 twins board
Thread-Topic: [PATCH v6 05/10] dt-bindings: arm: fsl: Add solidrun lx2160a
 twins board
Thread-Index: AQHc4h0UQ0rf8ZGz4kS7JqDqOb5g2bYNFdeAgAA6OAA=
Date: Thu, 14 May 2026 10:12:19 +0000
Message-ID: <e26e0b56-a91f-43ff-9268-1b885dafba89@solid-run.com>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
 <20260512-lx2160-pci-v6-5-d0ff72d3c983@solid-run.com>
 <20260514-macho-white-tapir-4f8cf2@quoll>
In-Reply-To: <20260514-macho-white-tapir-4f8cf2@quoll>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|VI0PR04MB10255:EE_|DU2PEPF00028D09:EE_|DB8PR04MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 62d736e7-601b-4f87-a5dc-08deb1a14ee0
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|4143699003|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 V3mhd2TeZvfaLbR3qpO8cxrYi3wElf4CepxseA73EbstDx6n5VABRzRtqyUiCzgREiazoOOgKgPGIBXNAJzPPzm9cl3I5pS4laKIB7x6AffKO4nJ2Qq0UhK04IKzU5jsBcs27wzI0v5AZXMWfLLN2tLnmuwM0He3nu1r19Kx8zalbbeQZGEAEaYzvSLlu8sEgHrIwg3at8a3pAl4kwqyHeiTtjuWsaNnsElk48RCpSn3I2efLKJJTNSQrKNmfBkvxRvMZK1ZW8Rg7RJXkUhzsb8XrGSM1aF93OV1hx7kMN6B2ayzsVhHMm3hd57/7+VqNl1TaS1sBSgM1l1+pFnJvWuWIEJicNlBUeYXaD8qFpLlsjKduYJiEjoqguSUwEHct4iLgORL9MtZvlWqTCmeVhCIheim5jqk/5NDspd1bjtlY9BO35hodkM0qkvLDlXgt7ecMunW1hpGRyOh4Y39228S87MztGL3MNiERCjb39nsEy1BpwhWaiDoYPdES7kgqId7ps5oozITOteNe7JLhhuzgzeQG9ZyVKHFON/5zNnEPjbcrJbyJ3bKHYQgfnIxPcaVJXVJeL74QeGcE6gTceBskSUGC2b+lAb5dCUOxFZK/kYsesNwNil6OC+g+7kba/cHOHH57enOPXvCV/S84kU1MyvlJvkxbW3zrYcZyNbFyPKv8O/Uqou/owdHLss661Su13BN4teiIOhKSSnEYe3x7UwIraY6GYfHoUFq8hGq0CMAvgaZxPkMAw8uDkWp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(4143699003)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3D99991EBD69F042A9CBBD06075030B0@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 n+WfiJOyEkjRxFHFhgU3zk9O63qFFLk9BNK0aNgH5xcdwOS0zk6ns523HocfVcTKkWv10e6MgmmE5ZGie8nvx5dn+dadiFhwJJtN3QcdmODariT6j5erBL3SQivy/lBlTdyW3838QgOgHtPp0vUMe31/uc3T1R7BrIYicuc0Y0z8GfWfZu08o3zxtxkeWSE4LJoSkO2RrsRnNplr+F64wCmqfC9IIMk4ByGW5fY9EOFBrw7Awa9EKPdjXMgj0cjVssWgSnz8r70dXJAAknx8x/BefDtIx8lMDrTPtUjMgrmLelSCXz1iPecGosNPlc++2hMRO+puRIGs3mvRHWS51A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10255
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ca11abdbca0d45faa083ad82ab8a62c3:solidrun,office365_emails,sent,inline:3c9d929d64deb09a853209c2d2827b57
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa50114c-6896-45ae-b31a-08deb1a14828
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|82310400026|36860700016|7416014|14060799003|1800799024|56012099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6QFqR05jbxdUROfaAoHT2WGzeupZU1lKq+NPVKtVbZtEWVmMxUvo/elbTGgpjSVFstozGZ9Ef8LkkNUL46rp/oDLqMv9qBLB4BzysS2SkY/4M8Mtrjdn6d4AxlGhFxv8r7hPMJovg5pbyiQGy2R+qPOn9owMoSRPPDnIQGhVb5u0Rm12GiwX66X2wLhJ47lT6AIgE7nDXe7amCcVsF56MQ9wwDdd8EmWRS11ngastmyLd1IfuY1cxnCipQm3XFjlkx73df5snp0wZfRDMQDzGO5YX4XPJa5fBh09QZWAV5bH3GN0A3bZTfHs6W8eM55tKJIssj3SpJ2RomIiFTPa/L7TSZRteMu80rSnCJRA1lR+z5uDxQLdCniQc8RYYNp2/59Fj2k2Nr7vtdmKDp8tPq7Q6Tb8v+GQ6uo6CBN+izYMc8lDti2/EsnSsx8paFOXkOlhhx8Z0gxYUP95lfA1busKjpa5aVbOrkoGz+oRMu8mUMGdeWHAi88YWaPCtRkwb2I5PR/Mkp/CeXfH0dV+RmKMPdlay8EdzO+RDKyRFv228Maj/q8xlFGxMbICQccAI7LS7RS7RBCGub5YDp5a48YwM8vhPV1/FWgRFVUJoRXaCaKGgNlWP7fTu0P46jrxZ8FuQwYfHcW5wCXk4nZiyZO8R2rvM8VpUeXXSC64qSjo6MsM0Yc0I/6NKNeuHX8NKmvkMeZpIEeW0VU+5OOt4X1FfKcHqgtphcGhjJcBB9Q=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(36860700016)(7416014)(14060799003)(1800799024)(56012099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JdK+YSa371EFsgZZlD7jgn2TVpSjxJcFZmwQYcsjzpYZDKIE2mJZ5B7cW9YuEQk8LqO4fickXWEm1XKANvsWq57bAgJe1xVxln9ZyIA1M9mJ0QSi4zxnYVzfle3CcACU+rVu0f02ehuTdAdSxwidbh/DTdVTS/ipag7lMjtGpx/ZRoPNYnpBhD+vxOwx48eZsEe4QdduhUKRVk35HikXp1CHFL85yDFUQBhp5ITpZDPMxu4BU8It1jXXMFqnkAqyZgrmcEk/xMuqYgAaxYlfeklOxF7kKUzeV6Dj+tzRzDvb3FOjkt7wS9zvIM8Y2mTCOblrQ9ki6W2zoGYRR7lpXYvu+zVCleheI7mZbuOThFm28UQfVS3SpV32q/VZm1bqSPAb0ZjV4OTWOF31ejgoi8WuQZEfDy0U9QxKQPsSum05huE1+9KHdoA+gPWG7LPC
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 10:12:30.3970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d736e7-601b-4f87-a5dc-08deb1a14ee0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6921

SGnCoEtyenlzenRvZiwNCg0KQW0gMTQuMDUuMjYgdW0gMDg6NDMgc2NocmllYiBLcnp5c3p0b2Yg
S296bG93c2tpOg0KPiBPbiBUdWUsIE1heSAxMiwgMjAyNiBhdCAwNDozOTowMFBNICswMjAwLCBK
b3N1YSBNYXllciB3cm90ZToNCj4+IFRoZSBTb2xpZFJ1biBMWDIxNjBBIFR3aW5zIGJvYXJkIHN1
cHBvcnRzIHR3byBjb25maWd1cmF0aW9ucywgb25lIHdpdGgNCj4+IHdpdGggYSBzaW5sZSBDRVgt
NyBtb2R1bGUsIGFuZCBvbmUgd2l0aCB0d28gKGR1YWwpLg0KPj4NCj4+IFRoZSBkdWFsIGNvbmZp
Z3VyYXRpb24gd2FzIG5vdCB5ZXQgdGVzdGVkLg0KPiBBbmQgaG93IGRvIHNlZSBkdWFsIGNvbmZp
Z3VyYXRpb24/IE5ldyBjb21wYXRpYmxlPyBGb3IgdGhlIHNhbWUNCj4gaGFyZHdhcmUgKHRoZSBz
YW1lIGJlY2F1c2UgZnJvbSBTb0MgcG9pbnQgb2YgdmlldyBpdCB3aWxsIGJlIGV4YWN0bHkNCj4g
dGhlIHNhbWUpPw0KDQpGcm9tIFNvQyBwb2ludCBvZiB2aWV3IHRoZSBzaWRlcyBhcmUgZGlmZmVy
ZW50LCBhbmQgdGhlIGhhcmR3YXJlIGxvb2tzIGRpZmZlcmVudA0Kd2hlbiBpdCBpcyBhc3NlbWJs
ZWQgZm9yIGR1YWwgY29uZmlndXJhdGlvbi4gTW9zdCBub3RhYmx5IGVhY2ggY3B1IGluIGR1YWwN
CnZlcnNpb24gb25seSBzZWVzIDEyIFNGUCBjb25uZWN0b3JzIGVhY2gsIHdoaWxlIHRoZSBzaW5n
bGUgc2VlcyAyMC4NCg0KRnVydGhlciB0aGUgcG9ydCBudW1iZXJpbmcgbWlnaHQgYmUgZGlmZmVy
ZW50IGJldHdlZW4gbGVmdCBhbmQgcmlnaHQgc2lkZSBjcHUuDQoNCkZpbmFsbHkgdGhlcmUgYXJl
IHNvbWUgY29tcGxpY2F0aW9ucyBpbiB0aGUgY3VycmVudCBwY2IgdmVyc2lvbiB3aXRoIHJlc291
cmNlDQpkaXN0cmlidXRpb24gKGkuZS4gZmFucywgbGVkcykuDQoNCj4NCj4gWW91IG11c3QgcG9z
dCBjb21wbGV0ZSBiaW5kaW5nLCBvdGhlcndpc2UgdGhpcyBmZWVscyByaXNreSBhbmQgd2hlbiB5
b3UNCj4gYWN0dWFsbHkgdHJ5IHJ1bm5pbmcgZHVhbCBjb25maWd1cmF0aW9uIHlvdSB3aWxsIHNl
ZSB0aGF0IGV4aXN0aW5nDQo+IGJpbmRpbmcgbWFrZXMgbm8gc2Vuc2UuDQoNCkkgdGhvdWdodCBh
Ym91dCB0aGlzIGFuZCBkZWNpZGVkIGFnYWluc3QgaXQuDQoNClRoZSBzaW5nbGUgdmVyc2lvbiBp
cyBzaW1wbGUgdG8gZGVzY3JpYmUsIHRoZSBjcHUgYWx3YXlzIHNpdHMgaW4gdGhlIHJpZ2h0IHNp
ZGUgc29ja2V0LA0Kc2VlcyAyMCBTRlAgY29ubmVjdG9ycyBhbmQgaGFzIGZ1bGwgY29udHJvbCBv
dmVyIGV2ZXJ5IHBlcmlwaGVyYWwuDQoNClRoZSBkdWFsIHZlcnNpb24gd2lsbCByZXF1aXJlIGRp
ZmZlcmVudCBkZXNjcmlwdGlvbiBldmVuIGlmIG9ubHkgb25lIGNwdSBpcyBpbnN0YWxsZWQuDQoN
CkN1cnJlbnRseSBkdWFsIGlzIGhhcmR3YXJlIG9ubHkgd2l0aG91dCBhbnkgc29mdHdhcmUsIGFu
ZCBjaGFuZ2VzIG1heSBvciBtYXkgbm90DQpiZSBtYWRlIHRvIHRoZSBQQ0IgdG8gc2ltcGxpZnkg
dGhpbmdzLiBUaGVyZWZvcmUgSSBhdm9pZGVkIGRyYWZ0aW5nIGFueSBiaW5kaW5ncy4NCg0KDQpz
aW5jZXJlbHkNCkpvc3VhIE1heWVyDQo=
