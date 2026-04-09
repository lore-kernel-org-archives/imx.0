Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021135.outbound.protection.outlook.com [52.101.65.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206D348453
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.135
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775733275; cv=fail; b=EcNdOwpEEenu1GSZf/Ed7NtO5YMODR9w9QfXfDy8d8//POSqYuhdXNtm9pu/EiNWhCDTyajT3+h5luv2wwjai7B9i6uge5yafgvb6cKu+xpDu7RYGACoGZVWhO6bavbcy/Mj1UEc6kISxhcAx7HXwwCIrl0nUcCoQpeG0X9MRJw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775733275; c=relaxed/simple;
	bh=Ifd3oONxEGpxUs86hIjjnYPkO3eG1zKHYS0rn7YL9S4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ISxakfmLV4+umoUV3dWjWIE8O58MTWA0abL+4l/55kyPbYgr+45hJe7vR1bKZS3wyheoODzVFsJjKsLA+XVgIFbEYiDP1H7lrgDLhRGyBUZk8JPulNmh7g9M6k9HSXiISaKVFOsL6gUrrwGTC+8yn/on2Wm9brBVtS3ZfUn8zP0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=LTXg/PD9; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=LTXg/PD9; arc=fail smtp.client-ip=52.101.65.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="LTXg/PD9";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="LTXg/PD9"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=p5EyloIIWfnvVe7FyufeFMcA6XKPIWi0z2G3mqAo6hZseJoZzIT9CLxpL1TT+Tywmslw4pltFi5v1cp1+9ZNStKOKMbsUhdexx7/gE3u8A0jJqCv29Syxfh8M/zxWA7CE3tDE3cI7ERSKB+en7FUGTDCM6n4ez9yBlm2sT1M8dNthR2M9CUb6y4nW1YKHlIutUxfYzeMI1JiTWBHG/beCtWJuxAChRgj8a+kOpHTrIMm8+qDXOuPbcAg/Z027bRDP9o4vM1211S9aQYPnp+/jq8BGkIdmpOetl4QtM7fCltmevDuQlIp2KWkwSI4WUOXiXEr869nlO3H/pwEDPbbfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ifd3oONxEGpxUs86hIjjnYPkO3eG1zKHYS0rn7YL9S4=;
 b=cp42OFX/8eNwzD3udbNG2g8ZMOdhJTUD0O4HNriY+MFYJTyhzdiw8sVO4fyFcmTmbCf6u658X165IMn6XISeaA47L5YpkOaK+0XizuSz4GxuV+Lyxi1x8J5aQwmXhWcv77/y1MGc8tMYj3DZEKumPTAf300HKz5SRWbB3BBc9XcmI/cnUktXn7f5cQCj6wEFpC9GDxtjT5UqgGj9pUx8lH1J5LKsbAbrYnA1jHm+tSX0sspIoxejnG8eLzHAChFWwgTO2H/diuOjQKXHRn2tBYiTOb4509NMmtQQ3BFeS+qPXTOEOHZ822UELuNNxpnrDhXx9iZBntHJYFlptg9S3w==
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
 bh=Ifd3oONxEGpxUs86hIjjnYPkO3eG1zKHYS0rn7YL9S4=;
 b=LTXg/PD9dRiLmDIeIwp32dWRh7hPoeh88f6JcZkv4HifIlnvccCTBsy3nrAOrq54sGTjwJczw+DKazbP7tAs3y9SzY2TLCve6xVRqicAIwnaeXsbpfgbKY/U6+LTtteoMpA/+jLQnumS8FX8FcBVOPPlK8h4ihSK4cMiiFwmPFUdg056wj6DYsIiUuXFe1MaXSK7QjKosKFZULleKamxFRoIVAY5HE6O9azgDJ6cZSiGs7PJqi7drlPFRISWy5YyN+FdMcXNY4Z/DPgXFEtI7/a1TaPXhCITzOYUaJyK4isf8Df1bJKEmmdcVvS6fCBHL6Tc3ByPba2TLWwivTRbBA==
Received: from DU7P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::11)
 by DU2PR04MB8998.eurprd04.prod.outlook.com (2603:10a6:10:2e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 9 Apr
 2026 11:14:29 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:550:cafe::75) by DU7P190CA0012.outlook.office365.com
 (2603:10a6:10:550::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Thu,
 9 Apr 2026 11:14:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17 via
 Frontend Transport; Thu, 9 Apr 2026 11:14:29 +0000
Received: from emails-1707770-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-16.eu-west-1.compute.internal [10.20.5.16])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 91FB080E58;
	Thu,  9 Apr 2026 11:14:29 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Thu Apr  9 11:14:21 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mnLNsL4hKkPiXURq0DL5S/xkHZTbJCeSwgfnEH4jwtNaevdnd7bDWfP6LOKwXVF/YM5QsYvJV9omatcGfPGHzFl9hryoiovcw2LE02Mj18p9ATwt8ofY1C66qVl7u+6+BNmsJG8ul+CJ9Z+mjE/UnDwXNQZeL5OGv75qPF5Rk9ka0wXCJHZCKdljPFG2SD+EXJfB1RQj21y8cCbVxirdd6RmTXueInqmM2cGVgm8i5eFYg9ulUSXfSSZCzOYa8kluQe+r8rqW+j/94fOh0OAyU5zVSCkWqQ1i/pwny90L8nZ202BOxZmLy6k/MBoSGvQN3SMTYQIVgBrq6/+DUu/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ifd3oONxEGpxUs86hIjjnYPkO3eG1zKHYS0rn7YL9S4=;
 b=StAFjFlwjBVsBU7JUJ6v565Xcm5LIMxKxr2HyuMLyeN7fQhAQZ6Omv22n88c5mo6zFZ1feuV/BD9bghuZSWFWZJsvq+hpMm0xy7DRvg3kOZQpMpq7jOuJsXx5xgmc7VhpNautX3liyx36nH3Lk6zCmHjhyhfaOONM8W8TC2luhE9gpEJBsdSA0NR3Uuj5dDcRWK5MX9FO/ndif0FL+MtYy+iGlMApGMixkWlRPmhSbWrTRw6XS4F96gkPlJxVUm60oMS7PnsccPbogyECX6o94N6cvCdcMEfAzNJ3+lvFGyNfKI8WpAhdffry3dc1n19mBP2+hE5lk39MxGo4XCPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ifd3oONxEGpxUs86hIjjnYPkO3eG1zKHYS0rn7YL9S4=;
 b=LTXg/PD9dRiLmDIeIwp32dWRh7hPoeh88f6JcZkv4HifIlnvccCTBsy3nrAOrq54sGTjwJczw+DKazbP7tAs3y9SzY2TLCve6xVRqicAIwnaeXsbpfgbKY/U6+LTtteoMpA/+jLQnumS8FX8FcBVOPPlK8h4ihSK4cMiiFwmPFUdg056wj6DYsIiUuXFe1MaXSK7QjKosKFZULleKamxFRoIVAY5HE6O9azgDJ6cZSiGs7PJqi7drlPFRISWy5YyN+FdMcXNY4Z/DPgXFEtI7/a1TaPXhCITzOYUaJyK4isf8Df1bJKEmmdcVvS6fCBHL6Tc3ByPba2TLWwivTRbBA==
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by VI0PR04MB10493.eurprd04.prod.outlook.com
 (2603:10a6:800:21c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 11:14:15 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%6]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 11:14:15 +0000
From: Josua Mayer <josua@solid-run.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Yazan
 Shhady <yazan.shhady@solid-run.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Alexander Dahl <ada@thorsis.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Thread-Topic: [PATCH 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and
 HummingBoard
Thread-Index: AQHcx4bvr9BLL5JY8kGqWpBHUUp00bXVmRmAgAD72AA=
Date: Thu, 9 Apr 2026 11:14:15 +0000
Message-ID: <db41d119-2469-4107-94b5-b09e9bbbe9ec@solid-run.com>
References: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
 <20260408-imx8dxl-sr-som-v1-2-ce5a39acd713@solid-run.com>
 <3024c143-520e-49ea-af17-33344ebf7149@lunn.ch>
In-Reply-To: <3024c143-520e-49ea-af17-33344ebf7149@lunn.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	GVXPR04MB12057:EE_|VI0PR04MB10493:EE_|DU6PEPF00009527:EE_|DU2PR04MB8998:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6a1c37-6b36-4a6b-6112-08de96292b43
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 Kb44LtXs52Dwxk4fSncywGcxPGoAwM9d0cjy0Hu2QJR/BxhRJ1mQmkBcqEcE+KFPaM2kIIjt5+GBj1L2U2EdZQvpzadAQoesKxGvkAPhs/+lfAzA4+p+iPaa8H2dyEMNt+82X2aF6F+e+KPc+dOUZWi1R3+QhXqiM/3j3uzFDrzwo0A+KnTYABVCCXxEOPV86YJqqVoT88AMRYYtk1ohjrRKZktLZpdlUt3ebhqEiW6FTudfL56Va/z5cwKUF0RPxqQtamVlm6Tm7ioOaRM0HlIRaj7nRXCfM51KbI06RHlvOaFR6RvVKCDeAVmDKk8D619ZsJsJX2q2YddGpfzSmZyQZAyIbR9McaC+L3A6UJWGf02g8b4Tip1IagwCHBICHHKcbqN7c4MZIRYoTMgAImJgfwv+SWaJ/2GpltrtR/tLpvPdcbnAyvljN82XuIef8iYj/pGscSNvE87bvknLy16ojkAnGvLN4cLztEUSsQbEcuHpuHvDwCXXPpexcsMY0NC367dEjZq0vEGtEtFqc0/bIvQLQQsYtX+64eBOcaBvi+7De8lzSZWX+47J3uUzq5dDAG8HCu17Zj0RP8JbVXlCj2exMVlQdhgiQS1C5ZsyOvywQGhcPHTmN8m9Q11OTmjOHAjuXmh/jLNWSwU6m7otK3s6SoQa6+LLcaZF4mbsbysvupGtd6HpPo2oHQ2dEysMSpMaghYgDqBJQjFFEr6/Oid2+lf3MkCZsDsPSQNGwzDJeSoFTHJHwnRHAXORW359BuqG88twBtHSR79DJwRR/+poXfKGxXmTOkbNpeY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <91C359512E8FAD4EA5D7C82DF72A7646@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 qgC5gQ6UMont4vcRx+KmdIlniSoqcdbG1pPk4WDNX3uGP8BRE98ufBo/vX8xIjQ1ImiBZfunU9xbsDgatH2mRdZbzpRhp9C7GXUR+/D/YbpIOlyXcEYygOYMBuspcwLixRTgAuUFFRvnFM0JlJ2blAPPqI+zcx+7T7cUmQyTH5+ku7PZgPcdGFBrbnBSBDnXMg3V7GwnWVnxPGSVPwWcfkcb78KcD0MES3FUc3LfRMRQ6W3yKFPTLalrffmIlhA2mwe5Qlv6w7NySwP5+7BG47VGoyQv95wXDqSmVmYzs44/hVGkT8J6SQYbL+jf/lALNMts4GvYNezI9ozz2OvsFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10493
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ac7e2740eb8d44a2a83bf1077b4a3347:solidrun,office365_emails,sent,inline:2285a98fcd56ade5fc8fbf84c7fc6173
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c517bbb-dfc3-4141-e817-08de96292293
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|14060799003|36860700016|35042699022|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	q66JdtcuSE/oYgU2ewJwZn/7eKRh2Y1rHfDXOPu6WECjM8UiZtWSWJh5CV/+OAl8Ph+N+jZH0D7s7AlNtDj4HdWj074S6vunJVqsigjRfj7lDK/XK2/Qo5tbzcUD+wLB7Z6p6cdHGH442bs1DFKPjkfj4eUW2+n5XBx5HAUjCFPNbkq/085VzFKxbdJo3r2YpwqNKBd9/xhTOu/KMqZnTNqy4JLNhXFwfE7lH8MkrMaPBgZCkY1IO+0j3gGKqlUUuoxswzjLOEEa0ZcBgHPpq3uV6g3x/U2DdJTtzrBWPIHOnBAdI9YsO8ZmpTi45zX3NnDqptoD9dxGF38e9jFBpJKAsNar5WkmbOxc5Od1WrKO8I5Kiuw5YaEAcYp8vPMuL+5NEoUFK1ESxd8w7mFXVty5W2VS/o+tzu7QTe7fNY02vD5HwO+kVB4GmFaC1ULKQkKvYNVY1lxXGeZQgbWqekQh3h1gzK3rYatudx+6JcVppMf9qsSUbzWlHYdGYlAywVZEQln4xiL9VDsWinPK0Z5KPF+i5TaPjJrYaTjflBd89ZTC+Y/3tBWbfWhvRFHQybmkWtOlUjldRe4M8iw+pAd9saxkUt+2i18+uk7K7LA39AfY2Q3Q5/2viq3AAp5i9z17IWu9u2x8c8yZgl2Sq8WbZNlEvtI0qUtT0plPCvQntQxq0cqpGL14HLLnkrefYW6w9YNQRDkKeeL639bSFr4XTunWH2QzQQYE9P4QE2Ddg25t1ndthn5II48DHLpjysnI/S13rFYpcTVJC4xw6g==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(14060799003)(36860700016)(35042699022)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kf6lCp7niHAAid6EixFpFrbogl3tcGHwVpgRBU4QiG9P0rO9Ff1xeIrjtegGEo22/qaAx3zOdQBa5CXboo/+dzH33q9FySPOX6MnmrccEaFGr8LG0rZlzGNFvszD04+EJpW6Q86tUlSBF57mDsaFWvMwQU0VXaim8UYS8srFukPZWj15zIxmWUNvsUog0Etantd4ThSK+3LBq1zIywLsJKl2dfoieGptqEPFCwPWAzbPrFyU7HiOnK2sAxZa1qwvX1rC3QQaF0xneQddTSvDvMSUWKY4p7dgcC8Yj2iVvnYcoGDeEYTpVbN8hReR18vov0obnsktOiV+LyowW2XfYqb1ouuh6LTzBDsSGT4VhpkhqSnqzVtYeniAxo+FqxBpJlmDNFIvVVH5rM/zEp/33EqEMEAW8nligV8cZ7ZAJW6U8rfTc98B3fFbV5RSqGQe
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:14:29.6418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6a1c37-6b36-4a6b-6112-08de96292b43
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8998

SGkgQW5kcmV3LA0KDQpBbSAwOC4wNC4yNiB1bSAyMjoxMiBzY2hyaWViIEFuZHJldyBMdW5uOg0K
Pj4gKyZlcW9zIHsNCj4+ICsJcGh5LW1vZGUgPSAicmdtaWktaWQiOw0KPj4gKwlwaW5jdHJsLTAg
PSA8JmVxb3NfcGlucz47DQo+PiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+PiArCXN0
YXR1cyA9ICJva2F5IjsNCj4+ICsNCj4+ICsJZml4ZWQtbGluayB7DQo+PiArCQlmdWxsLWR1cGxl
eDsNCj4+ICsJCXNwZWVkID0gPDEwMDA+Ow0KPj4gKwl9Ow0KPj4gK307DQo+PiArCWV0aGVybmV0
LXN3aXRjaEAwIHsNCj4+ICsJCWNvbXBhdGlibGUgPSAibnhwLHNqYTExMTBhIjsNCj4gLi4uLg0K
Pg0KPj4gKw0KPj4gKwkJCS8qIHRvIENQVSAqLw0KPj4gKwkJCXBvcnRAMiB7DQo+PiArCQkJCXJl
ZyA9IDwweDI+Ow0KPj4gKwkJCQlldGhlcm5ldCA9IDwmZXFvcz47DQo+PiArCQkJCWxhYmVsID0g
ImNwdSI7DQo+PiArCQkJCXBoeS1tb2RlID0gInJnbWlpLWlkIjsNCj4+ICsJCQkJcngtaW50ZXJu
YWwtZGVsYXktcHMgPSA8MjAwMD47DQo+PiArCQkJCXR4LWludGVybmFsLWRlbGF5LXBzID0gPDIw
MDA+Ow0KPiBUaGUgZXFvcyBpcyB1c2luZyByZ21paS1pZCwgdGhpcyBwb3J0IGlzIHVzaW5nIHJt
Z2lpLWlkLCBhbmQgeW91IHNldA0KPiB0aGUgZGVsYXlzIHRvIDIwMDBucy4gSG93IGlzIHRoaXMg
bm90IHJlc3VsdGluZyBpbiA0MDAwbnMgZGVsYXlzPw0KSXQgYXBwZWFycyB0aGF0IGR3bWFjLWlt
eCBkcml2ZXIgd2hpY2ggYmluZHMgdG8gaW14OGR4bCBlcW9zIGRvZXMgbm90DQpldmFsdWF0ZSBw
aHktbW9kZSwgdW5saWtlIHNldmVyYWwgb3RoZXIgZHdtYWMtKiBkcml2ZXJzLg0KDQpUaGlzIGxp
a2VseSBtZWFucyB0aGF0IGVpdGhlciBpbXg4ZHhsIGVxb3MgbWFjIGNhbid0IGFkZCBkZWxheXMs
DQpvciB0aGV5IGFyZSBmaXhlZC4NCg0KVGhlIGV0aGVybmV0IHN3aXRjaCBkcml2ZXIgaG93ZXZl
ciBhZGRzIGRlbGF5cyBhcyBzcGVjaWZpZWQuDQoNClNvIHdlIGVuZGVkIHVwIHdpdGggMm5zIGVh
Y2ggZGlyZWN0aW9uIGFzIGludGVuZGVkLCBhbmQgdGhlIG5ldHdvcmsNCmNvbm5lY3Rpb24gd29y
a3Mgd2VsbCAodGVzdGVkKS4NCg0KV291bGQgaXQgYmUgY29ycmVjdCB0byBjaGFuZ2UgcGh5LW1v
ZGUgb24gdGhlIG1hYyB0byAicmdtaWkiLA0KYW5kIGxlYXZlIHN3aXRjaCBwb3J0IGFzIGlzPw0K
DQoNCnNpbmNlcmVseQ0KSm9zdWEgTWF5ZXINCg==
