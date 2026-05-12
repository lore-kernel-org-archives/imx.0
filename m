Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023082.outbound.protection.outlook.com [52.101.72.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9F63B83E0
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.82
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596761; cv=fail; b=GKuhmCys0Q9Uh6PKbx69dHiYiyBr/uQyerFqxrk3rQbC351x7Vb0ajzo9+vplBgByUqFI0gWLq9KNGovMAEofM/57egFSYwJ3qzZ1xGXljnRCvP5Db+6coVL9Q62uC41Z+Jc9QXBW7SyD9h1hORC4Wumz/fi6WHl65J6uxBGryA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596761; c=relaxed/simple;
	bh=XZ9cMtqKC0cCH0nBEYLHiIx1rDTen4MsUH/MfbJvmAM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=s/wzAkCiHzErpLIQFLXtQAGFDOQsd1AKhnxZdg7DhmoXWThORqmsyOJU2GOQtX+8z/YXNnDVjPtCDPt4SBiBIVUkqS8/Mz0lxLYbfq9UIXUP7ZjQf2/sdZnRtZFUQok24zkp4fsF0trbCAIyyJ+QmxjnmBbD6ITfpZOChCWlL5I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=u/Oyfo2m; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=u/Oyfo2m; arc=fail smtp.client-ip=52.101.72.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="u/Oyfo2m";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="u/Oyfo2m"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jwp5US46knTXfkWBuCvAzz0eLW7r9KFY8X21789MXnSPhmjIh2umsIjt0BLoDz9Z2Fz4n85BTPij7+8po8D+0zJjgq4JChl0eQCOSpUsdeO3kNwvGdiyTRe1Yh5RstG6gYXOjefPeldEPiiS9nsBzMTNuCmXqUqmE3BobmpjEAStB3g4JHghEo6gZy7TVP5RbUXOL/HWKO8AvG2Zd3P0JU/NI/N7vL4pg4yreM2yAJV0f2vBJA6DHVPKzGFRPwKhwaq0+o7w5r/3vJWpoI4f+liEANq19vz3TGsYMch7qJdvvAlbEJCbaceCx/u93vVWM+Gvpn2iea1es7MEVWBVCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=s6TTJkX3zro0uobFQ5sMj9CF5uK/vjTDOPBtf2xswymOC9hAMFk0Yw48zXCHkp94UQxKV0k+n4R/d37bTb/UVfW+Yl87bP4pe3i5xUeFyRiXiQDAoQTtYfDCnkMw/u4glUzunGq9+Sluw5M1o+07uOOpCyYAYShO4j0SZ+OEwKB+LodwXeB1lJdlSSrzq5aF0awS0XC28DsHQqSU3bSktVyaiDVc36wkfiH2y80QEvnnMNbXbEm1gsGD1p09hmIEqUFv0WIFGM/PmjyNGDO/TLLviRvSJVZGwpaSLw5BWrSBKpcmGX/Odv8ar85B9qx9Z0eWv6AHoMcWb8xR8fTYNQ==
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
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=u/Oyfo2maaGBT0rffuU4a77KWjjG4Zk0wghevT4AnOpQcvZqjjw+l2fdlcIVNObH6xeFooSPMbcbMvKu4IpBYU+m9yEhbOCF7k/dF/msXeZw62hJ37avzgnAZBfUozEh61fcUg0CQCXtiWGUuVNHd99BXmn58hbx9Crvp5vi4RiUf7MnM5q8612el9Sq1iQmK1CKK8BGAtKoX4YTe/kT65nWGa58HEVmPYtpqp7EySGcHZCg/0QRsol4j+mIvydwvVABRaK0NEc8hrne1WoiMsUXcd6n6mVqCBFEV0SdZezz/Rt9+EZacy1a0p06KK9jz2lsZYA1Ko+a/RMUh0M+fA==
Received: from DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) by DBBPR04MB8025.eurprd04.prod.outlook.com
 (2603:10a6:10:1e4::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:14 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::c2) by DUZPR01CA0042.outlook.office365.com
 (2603:10a6:10:468::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 14:39:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 14:39:14 +0000
Received: from emails-7167763-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-103.eu-west-1.compute.internal [10.20.6.103])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E37E37FE88;
	Tue, 12 May 2026 14:39:13 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:07 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dm8iN7K8JqopqklavhvQIf/uaHmmIEWkWkSvaNm0eY6yblF3Wjl57C/zWVWV/iaZ/4a7bYeC7ENcqotbA7Ns6DvtxWNAEfisBhNkC7dOD16fZABEk3id4HYwBrEfDzUzvmWss+6OW1HP1KaHlYuMP39V6/H9O+XiC9LeCLT8tG+U+UU16+gQPWXtEH0ZIyxvgf1NGi4qlf2CHiHHAB08hBNDPcj2M6jOkgN8hiZ9RXjKfLxC7wexnZUq2VF9xXYqI4JAXiU8yRebYjQkDYIjl02x4cGfmF9W8266Egtd88DYjRA77q9badYDtI76/Zx0U2z4kAFtg9bXxB8mpnqb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=MRZuKVSXtDU/RkHtFYa32F6lkYOh/C8qzyNLob2AmcMbxP7kQpVTNqofFBoa8LYhT/s9UtB/D8LkO7Z25igAaZd5U9vIVyLvg4ZZzgJrG8x5anICCwDh7AiHitHpx07YuSiRNKf5IMx6neiY4gIHg4WKyTq979NJu6WF0f34Am0Bw3THHpURpzvntedSofh/2nqD/Rc2dFtlPYDt+q0IwYq2wM/40oMpux36cbTQ/hC0C+IL4tmtuV3q72jp2xMebJ6fX61x1Ljty7OWcGbU1QOwa2MpYoXqrVgpMSnrfYkJZs7juElMXelDeL4BmuSfKIVsfp/QNtDff1rGJRpcPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SX/O+SFofz4BEWZIJMZVF3DdkY6xQpjUP7OesUEc+BI=;
 b=u/Oyfo2maaGBT0rffuU4a77KWjjG4Zk0wghevT4AnOpQcvZqjjw+l2fdlcIVNObH6xeFooSPMbcbMvKu4IpBYU+m9yEhbOCF7k/dF/msXeZw62hJ37avzgnAZBfUozEh61fcUg0CQCXtiWGUuVNHd99BXmn58hbx9Crvp5vi4RiUf7MnM5q8612el9Sq1iQmK1CKK8BGAtKoX4YTe/kT65nWGa58HEVmPYtpqp7EySGcHZCg/0QRsol4j+mIvydwvVABRaK0NEc8hrne1WoiMsUXcd6n6mVqCBFEV0SdZezz/Rt9+EZacy1a0p06KK9jz2lsZYA1Ko+a/RMUh0M+fA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DB9PR04MB11693.eurprd04.prod.outlook.com
 (2603:10a6:10:60b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:02 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:02 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 16:38:57 +0200
Subject: [PATCH v6 02/10] arm64: dts: lx2162a-clearfog: use rev2 SoC dtsi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-lx2160-pci-v6-2-d0ff72d3c983@solid-run.com>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
In-Reply-To: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
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
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|DB9PR04MB11693:EE_|DU6PEPF0000B61D:EE_|DBBPR04MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a54f7ae-b470-4e50-7f87-08deb0343cff
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|56012099003|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 S9X55jm+K2rkIjfmCvae8F54nJ/JYqrQD6yVDklMxIpe1c8tLBZKl9jVc+468obYO+PUK1myyjNVWzwF290eXCVZghnM35o2ZqpGWWcjpjzBrMT0ON8LDupeXRgmCGvQmEGJpLjV5U2ZAffx2G8VEBcBXB0d6/E5KvQuOQsELbe8EgY7SpqF+KWy3luLgvzMBRSyyjy3GCv+8S1FDfkuwtqE42gJPBgyWIGFa/XMVTBd0XBSd5rXr1YJp7wJ9p0L5yl4c+Xq1jyL/EUgDc3JjFRK5mnb9kSyIvlRVAwF20RS00pvkUE8eW9izm+uUGSCK6p49GzMtpvizkNYVdtOm6SaF9QK7ujDqySgdrWsWYYNGdOqJ1ucLn/UzQZrrna5fzO+ydiJhrs4ONyCZJ2wgkwn3CcPHKa2GE8c87d3VeL1nCGqq7YngW3pMo+xlceR25rfh9wFBzVFw+kAfLDa31lnfzACPwVs+MVt3iz/EOpknRzZlZa8ctD/cWAhxneWSCakOTnCasnpBHx+Z19gL6JIeaCpZ4eEtkqMVHOIsZkpunXLfPPHOU0XHY6tUyUMlxDplwOBo2cBVIm5kMFSdIYmizs91AQqkB4fnJdv1g0+dQfc5NEZbrYMNGhdxkDhka2kCdUOgcnS1ohgo3nexLuIMYqWwEh217Cp6uaeH0YX5mPDOPIwaS3lRARPVLlNtOZGhRQd8t/MUZGN9QHvQcb3yIM16Y/L+Iv2zPLJbEgpHk6NI6UdUG8TCIOXngpGG8HMeJhDU5747rpC0+e/BQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(56012099003)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 kJcPvZ5GyhIMTrCMV1J6W+Zefw+D8uMomPgP4Z5lNpog/PZJ5L+8Z+FUDSwBtrudzj2v6PWmHbF8KCtFEODKSGBlk7GGMH2SSp8eQr7xRD8dBgB1fAfjJ52jaEQmhdfJHu2iANqK0DXStEnigyBVUHKX7n8OyCS6bUz5XFoi+UrIfg/NWK/fxQ2EM6uzqdfbC3Jgvg+vKTVJEshRU9wN76LonjYI7UfmJGtAMMraVdNEzYhfEkiCDI/TxkRHzkXu0AEFVkDe/5UzFMXaAH9vagS0BPLbiE9dFlzSZfhxaVADxcJhdIZ0LhMOJWVT/Z7JxBVDTQi3QF4RRJBv1+XQzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11693
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 8ce01839d71744c88a0bbbb22a213b0d:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8331a69f-5b3a-42fc-6aa9-08deb03435a7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|14060799003|36860700016|1800799024|82310400026|35042699022|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6nREfUMOdOtprpZtOf0feJtIjteX3l9KzazRhRkKN2WCS6eK5Vuv1zmRK9eiFEjLrED2LV5pZMgKRtoNIM9HQybwu3iyr4aSbHk0ZmAj13H3FQi2SkfRdy04A6n6KlpnkM98p1YiS6Zoxop64PbJqNHhLU0WDQbn19PTn2Ro21Z9ur3dSHc1zHHe3LwW7Cqp1YvmPpZpSuiwzefEBjWWXjjQL73pa8hEbiFSms8z7Z7rSoMVxGdC6J8WTP9K7CeZA9SQlY0Wmk1t4MILncBTxrgclJ/cWtbrv3BgMKFxfNcaPxYR0yNbNTanGEh35zMk8rYQG4LvYRT5rZUDUmkrNksHCggtYzdalCcCau4QhOdOkqpGpN1kthWwU/3A3QYM/NCgTmg8x/kbv/ba4+zrEUwJPW9PuuZmnSp0Tf+B744LuGKmPQxX0qHNcboIZNrCxUQBah/c3RsHm4tFl7bvjokD4zkn7SLlaEW2sQMD3xWU8v30DwAEjli860qaYafa8cwMzXhzuyHo07X2fV2IcwvCA91L+Ig+5EzeWCtRMDC/hMgBPuLyGvkPgdV95kmLn2TyXt73EoLus8cdrIxfMausvo5kiP0hWNwsdJOE6X3zGRquCerqdQYhG4C26rj9T2BmUgjqPWEOGnfr/FrYjcnGv767LbZBKHIapcLkOHqwc1xGXjSPKZ4qpF4Zmviqk+475iIwCQLPMzgKbDyB/9N8s8TYG9a2yn/x6U808bPVMNzGaKbyqaWZpYPhiAwOqSRWQgALWc8vxKV49auM0g==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(14060799003)(36860700016)(1800799024)(82310400026)(35042699022)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0U7PTLDuyNcNuEc5jERjia51i7zUiwTYFkezGOZzF+7z350p37bJBu+6IE9sjHcv8zHicsQ9gbN0u2MXk3k0+4tVzwp7rBKfzkDsD54pYGzs5q6unG+tBg66dinKAQQA6JhEeT2A4JuQNjsYr+yUoErzTTXI5q/H19GAfBe4pinxRGKTP+bzwrTEvq25c0ZB0dcjwbzNWaGl1pbQ1nicsDHjQA8Jws7h2EtycOEYtHXie6QSGx6lRHOyaGTfJzMEMwlERxi8ANMRCFb2tLUBHPPCiiG/pWzXW5GLB0vCo4mnbgaxy7uuMhzfa7PU7F221XnFVsd0RKvR7bBsqO9jvtIAdtdmETMOvTSLJBWmUQmix/EDVZa5t8KI5+u/MedIUB5i04GVCmLVPETaP9qUbJu10+xZlrjiOF8dJR+50dFJ3z5WduswHGHkOCIqVZKh
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:14.0933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a54f7ae-b470-4e50-7f87-08deb0343cff
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8025

LX2160A and LX2162A are different pakages of the same silicon.
While LX2160A had two revisions, LX2162A was released later based on
LX2160A revision 2.

Commit a8fe6c8dfc40 ("arm64: dts: fsl-lx2160a: add rev2 support") has
added a new soc dtsi for revision 2.

Update LX2162A Clearfog description to use revision 2 dtsi.

Fixes: 5093b190f9ce ("arm64: dts: freescale: Add support for LX2162 SoM & Clearfog Board") # no-stable
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 9d50d3e2761da..f95e9c19bfc75 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-rev2.dtsi"
 #include "fsl-lx2162a-sr-som.dtsi"
 
 / {

-- 
2.51.0

