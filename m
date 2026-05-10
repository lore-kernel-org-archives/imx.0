Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022073.outbound.protection.outlook.com [52.101.66.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A9139E6E4
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.73
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425948; cv=fail; b=m43gVERLUOEGkFtb6kQOfC8dWM32GrB/h0Fp59EbTlQVOpCZUNVv0cyNqLDOuxwl1DqJNeEwovlyPMtswyJ11qhtOwKozgHpko5vVVdzj8XZfr+/H9fvhWBWLr1MevTTNcZs2ddmwU3eKg5xocIkmexnltqx0ACB7Cn8cL/MP48=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425948; c=relaxed/simple;
	bh=EiwPVMPlR/6PI3ee4I0nWPL+wLLQXu4YaQtH71uH0Gs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KU7hxnN2ZjatZKrdyGU1UaFGoG/97/eL2BHEw3k1XO2Ql4YwQtVB3Js22jSDHejD18b04pcMzMNkUdo+WuXQfEWKWhitWPYbFTwPNA92ZmD0+2LwVG57O/C8tgS92h7im3p2R2tS4z295VzX24iib0cPmwDNlUhfP4UZ7PlCmt4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=nrV1uLHQ; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=nrV1uLHQ; arc=fail smtp.client-ip=52.101.66.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="nrV1uLHQ";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="nrV1uLHQ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OqG5tHLOPvcKpo4BAcMZ2KsAGBKAl90Ou5neE2WVGdHtwQurgUS/x7YHi5GkEdUm6KeIJCIFLfCkufhAxWditXeviP4AMD+Ja+KPKhMwWt6kyYX7uOuy3WLXhtR4sIgRxRivPcnltKJ4rmIWQfegUo39/qB64a2cNa4Tsbhv3VJIhA8+4aX/V7NJyCJxjdhzlduCHvq0KNTKhglKHg+ui4WRsDecERfmeYchTUfLTnfnUH/hI/XJ4kgxy99fG/8S1atPhbDYN9xKJIghUr8bihFKDy+rrhZhfHhlPeLCDEWiGfkRLFYl0eFqWwRWb4kAg/vg9dUT7XQjzOd+jA65MQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=GnxPGCckZ6fajEhZoKzPyIK2F4YgbecOG5CyExbMwEv8D17RvBtMI1Wq0dt/TGHp30eZqacNCMoB2CvoKnfLmhkfohm5NI/wflZ5p6Lw4nKb9mMe9BQcrWT8BCDqq1WLVUt/lyPii2jGWGxXF/hsUR9clXdzJzi0A+iO6kK4g4heNdGu+Ii3H7Q6Gs7vF6juEk0Z3eVtELHNRXLJjkUXDFNKmjQkuG4cdaM2uGgBaWLQX1NAgp+04NSbtDlN3SA5pZJQtvbigDgGe3kHF0/33xzpbFFaeYarNpZmWNLOe9+Z591Ytkjgp71x4DT1LEPtPRh3tWPKGchGs4QaMkpb4w==
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
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=nrV1uLHQkFfhSbtmXNaLkMiWJ5Zez0Osza4b+5zo2ZrVcA+ZcfBizgHloFlgofc82ldJneWFeLjSRm2fxUh4IOSvnzHGrdbsePAT6eoXwsIXvcZ1/e2NE7HZeF36IAfcoFKp2gxJOXFXNWNz/tmoezuqTgCKiLwx3U+NG3q/XCQ1yih1l5xkGfRT7/WD3XF04Ziu5/jls9fcW5D53B4RIExfNjxbbRd2qrOOEd4wpQ1sADyNgINlGYGdNyowtiDiThedVd7Fi2GOH8/PMaWtJHGk57v+ROvsTUIHqUYz224Pl9Amk4JU0yIvMXJPAhtXEzeFz4wpFsaQl8hY0MI3xw==
Received: from AS4P190CA0022.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::14)
 by AM9PR04MB7524.eurprd04.prod.outlook.com (2603:10a6:20b:286::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:23 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::ae) by AS4P190CA0022.outlook.office365.com
 (2603:10a6:20b:5d0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Sun, 10 May 2026 15:12:22 +0000
Received: from emails-6537907-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 80969805BD;
	Sun, 10 May 2026 15:12:22 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:14 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ju5J+bOJJAFGjAdO4pCoyGuAJid9dKf4hq136GFSzx/iGjdaHFPDS2awPwCgQuxGt89JV2SXFca6jMNx5BdT4osNfxDh/eEp7v1VMfctGoH0GdCm97EYdBEtW5Lhlo4igRa0lBKB4qhtlm3GzpcGa/27kmo/Ybc+kXFItFhOevhrnU5XZAWxpOtRTORVVBqdZjOKEIE2O70QanNaCxmrJpm8r14Z2wvnU+Kgcs84JOApKs74GWALAG8BMK6DqQT1rgz9COWIUyUZ7/S0vsYdChiZs+ssCVWbCRHauCAebCJL2Bd/MfEyXxc/OuKm7b467DR5intdicg/ChNOrC/o/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=G3092wno1QoID8ZJFXTOAEiS4WvwcfiXpriklh8IfJ4fmMb/DfRp/qudxk4QXFWirGgQZWdJ0SmUMcv0SEF9cSmKFSkGh2htwwySmolzip2o2LMTbqQclOVOG8zGwR4NJsD23TfdzRHjLvhcehKoAMRSm8K/XGPhIvkZ8I8domkqJ0TT2xEg8WLQnsPWKqehXVUgZ4m24re1O/yPj6UthP0sXmHApkDiXqZLNTmuLs/dyN6PX2V326cVaz0e02ILBjZA8mvH2k8TRQl89zD80lw2jb3RduxPY5X3PnWO5d4PgMQicz39HtJoyR++FfL8yWzQSoy4BIjujdepJE6Ikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4HrVbb+NNBTV5A+/r6rdocktK/QJngV1vXOyX3L3igk=;
 b=nrV1uLHQkFfhSbtmXNaLkMiWJ5Zez0Osza4b+5zo2ZrVcA+ZcfBizgHloFlgofc82ldJneWFeLjSRm2fxUh4IOSvnzHGrdbsePAT6eoXwsIXvcZ1/e2NE7HZeF36IAfcoFKp2gxJOXFXNWNz/tmoezuqTgCKiLwx3U+NG3q/XCQ1yih1l5xkGfRT7/WD3XF04Ziu5/jls9fcW5D53B4RIExfNjxbbRd2qrOOEd4wpQ1sADyNgINlGYGdNyowtiDiThedVd7Fi2GOH8/PMaWtJHGk57v+ROvsTUIHqUYz224Pl9Amk4JU0yIvMXJPAhtXEzeFz4wpFsaQl8hY0MI3xw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB11055.eurprd04.prod.outlook.com
 (2603:10a6:10:58f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:09 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:09 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 10 May 2026 17:12:05 +0200
Subject: [PATCH v5 03/10] arm64: dts: lx2162a-clearfog: cleanup superfluous
 status properties
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-lx2160-pci-v5-3-540b83852227@solid-run.com>
References: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
In-Reply-To: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
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
	GVXPR04MB12057:EE_|DU4PR04MB11055:EE_|AM3PEPF0000A794:EE_|AM9PR04MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: b744d96e-9e26-4893-8996-08deaea68989
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 KbHnRFPbUyJfpGso17ib6NW8gKhBlptpcb8MSlmSuMwztfvXx0Cip0s5eTGk7CH4KqzxXm/Slmx00iw7y8+DastwRYa32wIgwkV5LdwgtgaXql5EdFrZktJGwQmvlBBOqWn5NFfOlU7CaQLn3MkV8hvbZugy8uuj7shOfPbh9z4vv3q2Nrrd69fkSW6iHEk0XcMgPBwC1gXF3vGPs2XTVWSYNwpufVWvIZKT5DbgHJ8/AeWiW9NX7/M5+QK/922i6vxOurPuC0oWD1fmzluagXqR+6H3dndAuoPa3STBQ3732C/ZDTx/TnEptVBdr60JUGeoc6BxFTPkVs1drnNrBti0cEaRrJIA6elZrDUC6D6QXslKxGYsX1P2aPvrh1FdPn+en1jss5k3d9E4ZUdHRUAEUj5bAdMXC/4me2TRzZbIQXvxGk2pOkRBzsU3sCMoSzM32qbfISdXImMeAihtDQ7hkykF12MQy8nGKp+/Ga/V3LEtMaEOzBM2zGth6Mc9kAdmKqbd5BkFcPp1Ka9ivvtWuw9V3tJ+Lywj7a5Ge2SLCBO4HHMSeZD3qD3atkmstjE9JCNJlXBGUAtuQECUGaV/1ENYUBGXDne13uviidUepGqwQXaPftAfWjN926rLdcYI0iJOafntWIWgF2c644/M6gEEolM5Vmg0FJrY8DSHoKzuO3A/V5Tnx37Vl9aQpaEzqN2jK9PdWU7BnRE8TvI+d3/2y8ygBd5XqgNevPBZLYm1EzVLZvPFoNFn2UeKtmI/dMbxXfckrZe+t9OffQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 fMDb6EFXaJRMp7aK92q2njZocrkMf4aj/B3PhJ1vMM0JQotSvV0yiY9kywbHLDxE4lCTTjs1OLHN4PE54aQYUGP61dGPipTCkOGen2a2T76PMpYF5Ce59UmUDUJ6CBBPwDriwHsXQrkuTTEwodMReJRAviRw7qCmu3i+bZbvU4jOLXptM+um7nGTih3PTM61c3AOnWLRgZJ29cSZdDJ4bDLfrK8UQ2evqkEd/HJPAuJd5gVbWNbrVgQKQ3xrtgs9+ku+7KnQqeSKPuV+pjQved3CPIssWjVjaTpCLL+DbO5pJxti350kSRc5fplCnDEMUl2pYETXo+D5qA9vcg9z7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11055
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 1beb680c0498485cb16e443986f7af85:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	82803cc6-eb19-4050-363c-08deaea681be
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700016|35042699022|82310400026|7416014|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uu3Hkj0AE0AuUyRiRrgCTnk/Kkd7oM+kaXfL838G0t5TIOAfB9NWcF3DIj6HButgPlJfwJv7zl8PNkOJYiaLpglJ+He8xDR9YiMqN5OJYHuI5uWmKEWtlc7HQuqubFqAD3AhCsuQuZyMQAjvi4yMHdrx0gPXEmlL4V2gSoO6cO4ybZkXGjdyu76rFxlE6oL4luO71/efmhd0P48Yomz/KVKwN9+2R+QZElKCWMEr78FhV/TtPUzil5Npjn+RK44gxI9Icby6HX56fLeLrcO7leorBU01IeKsp4eaFkAQtxdZ2AcWaG0SUHrbwpAx6vzaHNwnXYNSggZBSKZJ3ZXXsaO4GPxyfdiAF+5TSHEfmT39WcBsWQaYWxMMzle1XDbFglg/F+PSipCF9OQUb+PT2J/xZOlLgXCmc3E3uhTprV8B/N4pDTTuxwKFfD+FqVKTOvdKOc1nJlItHVH5GVik6wxQ86LxEa5gOYrjukQkWevFMLc31otwuxy9Q1HOblrq6mt5k/v5eAg6ClIA2l/F8PWM2g72bzxl0UaM71aLyA6yRNKj9zjiBLFtB6MTcBZDlhObDYvc5y1qhhPJrFqztrboKWnf0yy7dwWzovfJIrvqMgxOO3ntcEFYodQcl+eJAU0k9gkD6mpws/GsT7yHQt0Ml18mEadSLnDzcWVUsKgLKK7yCaK2+tydPUARY3BseOtkCNnbDXp4PrWfOGP79rpHjtEV3hr2INyfIl063+Aq/S6k0ZAFkf3WGL1ShPpRPpNVHj2wpcBue7m4Ph5Ewg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700016)(35042699022)(82310400026)(7416014)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UpYU6qDyedR++hA2ravIWpNDwqHMz5Nf3SpzYFcUfK9o6du1Sm6hfHCWcMozpwikuX6HOm5ktOGJWThIfr5h5dGWMhc1yeHjK/J4RBmUBehmtTK+yeuiTBaD6H5YXbW3KDty7F1o+0H7gSlGxnB+XGI2G5pnzrD6T5A+RGwtchVjZCx7zi0UlB5GpNFetri5dU3I0J4qkfAFvKweK7SEx8pW5sFMpgUD5EHnpHbuX+4tXAAsPFVA7M/zCG0q/47g3bvfiqcFSteAe/7Pxz3ItCNXqU58kL6q4JnS8nSoev+CcBPlmMdgyv0PEv1362Dg+6WDlevVnaEPYOuKJEQGaZ5S60L2V1tWVu2mwqOp4+InbbJCaYOEiYiza7OU9sqTCjCJev6dAEk6aNs1bkPTSAiylNcGIcc49vHQR4HTlpTV5u47J3cnSaqL3CqUCwBV
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:22.7476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b744d96e-9e26-4893-8996-08deaea68989
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7524

The SoC dtsi has always enabled serdes block 1, enabled dpmac and
disabled pcie nodes.

Drop the superfluous status properties on these nodes.

Further drop crypto alias as SoM dtsi already set it.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts     | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index f95e9c19bfc75..6fd85a5cac94e 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -14,7 +14,6 @@ / {
 	compatible = "solidrun,lx2162a-clearfog", "solidrun,lx2162a-som", "fsl,lx2160a";
 
 	aliases {
-		crypto = &crypto;
 		i2c0 = &i2c0;
 		i2c1 = &i2c2;
 		i2c2 = &i2c4;
@@ -124,42 +123,36 @@ &dpmac11 {
 	phys = <&serdes_2 0>;
 	phy-handle = <&ethernet_phy3>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac12 {
 	phys = <&serdes_2 1>;
 	phy-handle = <&ethernet_phy1>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac13 {
 	phys = <&serdes_2 6>;
 	phy-handle = <&ethernet_phy6>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac14 {
 	phys = <&serdes_2 7>;
 	phy-handle = <&ethernet_phy8>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac15 {
 	phys = <&serdes_2 4>;
 	phy-handle = <&ethernet_phy4>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac16 {
 	phys = <&serdes_2 5>;
 	phy-handle = <&ethernet_phy2>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac17 {
@@ -170,14 +163,12 @@ &dpmac17 {
 	phys = <&serdes_2 2>;
 	phy-handle = <&ethernet_phy5>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &dpmac18 {
 	phys = <&serdes_2 3>;
 	phy-handle = <&ethernet_phy7>;
 	phy-connection-type = "sgmii";
-	status = "okay";
 };
 
 &emdio1 {
@@ -314,14 +305,6 @@ pcieclk_i2c: i2c@2 {
 	};
 };
 
-&pcie3 {
-	status = "disabled";
-};
-
-&pcie4 {
-	status = "disabled";
-};
-
 &pcs_mdio3 {
 	status = "okay";
 };
@@ -370,10 +353,6 @@ &pcs_mdio18 {
 	status = "okay";
 };
 
-&serdes_1 {
-	status = "okay";
-};
-
 &serdes_2 {
 	status = "okay";
 };

-- 
2.51.0

