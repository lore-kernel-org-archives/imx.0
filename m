Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023134.outbound.protection.outlook.com [40.107.159.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFA639F184
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.134
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425951; cv=fail; b=AbMaXI9rtW2Bq8ieIEzB9XSVSvXe2YjPn33yI0PBiLADdkLbBR0IaO+FNRIp8L1oCgOOhb4UwBdoavDOjBi0CEgnLVKecwV8udaYYuLbdifsFz2/aDyoMRQgJKjqpuKIKaJjs6GmMxj0u6KeVri+aKN+xe278OYzKQzdzzxbSUY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425951; c=relaxed/simple;
	bh=8Li+c4xVQPNlJZfWcSCplSPzGEbgJZaR1KkIav3u/O8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PQv5dJvgaHtOl3WM5dRFfKkTk98VQehsBfAmj1OdKLsD67ThapgfOgJs5T6rRdDcglqHhJvwcy008HCubt6IdrqBhxcW39EUCxcrSOP7LZFFn1o4qs5+VBYyNGxa2FHK9ksHBMI/1DlYcK42UnQ9p3R08v/yUdD1TW/gW4tdFZQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=VB6mAGIp; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=VB6mAGIp; arc=fail smtp.client-ip=40.107.159.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="VB6mAGIp";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="VB6mAGIp"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ALiqrUKtP7tqgZ9R0t5ad59Eykllht/viLlOBWxPjAKF4/LMqIs8gYZ/vCzd2Mco+4VWI2QAbIeIMTz1soLRMyNMQuVNYkQK9Wb+RZmAcMLhFW3wPqcKl16WblGUYN8s7ap3lY6XlV5U2l/mY25uF+KVXj7Hrj7uD/jpKoTrcEeZROdnLF3nSV5bAuFdExEE1p21axlhpB/p5OBUYUe6cBFz7P/OSV7S15VKm60q6Az6Xkld/lJ1CJ3ZU5AUY6byWCqeGlTQL9kLEB8qgO60+6MAgAYNybxPH/FbI34+h/XGqRc3LtyeZ/6Vyt9b0iAOtOsDVZfRlf9ISGSl84jNgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=DaNRloVxR7lfb3eS/SXza3UtxGF10nYhAkYpr+Ui20urM1AcCvljLHXhQjgdbQwfCWY8NtRlH4ryk7GJe/N9JGhNqL1DNYKLarAYlM4llsnxyWp6SejMiMppLN42tffcfoeHR2fTj2GfQ3hGNH0PX0xG0oYEcGQnP2JehDU2ls1DBNQmJAr17uLNEbNZr40SwuxD+8yiPa3qQ5styDLFUJ2PzdNhvCt4/K2EI3Qum5UyaSeJkOKvR7YlHk+Cu4ghM3Xe0XeyubDhik4juvge7PJyU+tW+vLbKfpkUlxdpSbFSYndCI0Hgvg1+l7rH5GVemksPykl3s6OkpXj0N+3JQ==
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
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=VB6mAGIpTuoiYsg9VosE3/Tp9lxApNZ6j/VEdDHZ3zmeVQPHnimYE8zUf/2YWL5CDzt3UPQYYeZW2aeptv4VrOAdvmRVXbw0x41HaWZoELxxxHlbHEq8iSi25+ziukLY1A+yLcPnxfCWLasXdFs+qS+FvT3DyPfkA00MW0cibD0fz9JH612uPGhpBpOKG1pdNpfm1mGsk8AjqHUG0Sf7u3PDlnPAHMbatLcIIE4+9GjtUTNxX7BdUmaVrRYLfIeAWiG825lROnZneWjnsU0hsxA1AfBHjG4KwNSVfzUfOp7Ovt5RHpqUyRcIZGU22yNF5FZircn3qDwAH92iFUs+sQ==
Received: from AS4P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::10)
 by GVXPR04MB10111.eurprd04.prod.outlook.com (2603:10a6:150:1b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:22 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::8a) by AS4P190CA0034.outlook.office365.com
 (2603:10a6:20b:5d1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Sun, 10 May 2026 15:12:21 +0000
Received: from emails-404593-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6A8AC7FF1D;
	Sun, 10 May 2026 15:12:21 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:14 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SE5zZ/arWzLfxj1Og/BX5L3mDNCCfkJy60ptLn75Oglwq7WGpcTMAPHC5+GQDIy0J2jKfMzmlw3RnLZddc7+7Z6iRHz7g9/MceLmILgmUgTLc6VdIvrmR81DWaTx7vTSNticJEx370kdADOeNJ0ro3AE2uBso+9ThOvfsqHb38OQaTqgCfgSHJ8NRuB5HrMcDwQ2IBsn+9ZGtYzoCpZ+5hKPGzFhhrwIFJhzGBV9Hf2LTm4GgP1IOxT5UMX0stTYaiHiU0q/FbhFs3k6cwBOXm9xFfvZHiKMliUPW1AESyWASfZpjZVNZdrODEC3al4Wbd4wys21EPmNuxQfi0hGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=QnFF7jfu1AaNxBH8qym7xVkc4WlCKXMIE69boJih71FilVfqCXVxkjzNsRyrs6keQtb7YQ9dddzT+pAHi3ldDuYxzWIrYyuZLyX5f9W5dCEgG+P9bSUsHUkYit6T3WKqgYHWgYQ5L+S0bTyCcQQT30glwZ5K2YFWHeHx34unvnCKwjcMSdTv0AHIFlXQmfP0+A5tSMT+ZkWRJqBMMCubGYEreZIbDXEAkq7nUjFOPe1qwrJWtWIuSU+8EH/RVAHZHaTI3iw/5WhwLlIjFCF9ohMrwKMlUpuTVYl7/+Llt8zxQDifxyIuZlv65ahDUDT9FWYil1TZtukHAyLNbHV0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7+RSZhNz8e3gJy6QxMr4STk12KQbbsSn07GRemjuLY=;
 b=VB6mAGIpTuoiYsg9VosE3/Tp9lxApNZ6j/VEdDHZ3zmeVQPHnimYE8zUf/2YWL5CDzt3UPQYYeZW2aeptv4VrOAdvmRVXbw0x41HaWZoELxxxHlbHEq8iSi25+ziukLY1A+yLcPnxfCWLasXdFs+qS+FvT3DyPfkA00MW0cibD0fz9JH612uPGhpBpOKG1pdNpfm1mGsk8AjqHUG0Sf7u3PDlnPAHMbatLcIIE4+9GjtUTNxX7BdUmaVrRYLfIeAWiG825lROnZneWjnsU0hsxA1AfBHjG4KwNSVfzUfOp7Ovt5RHpqUyRcIZGU22yNF5FZircn3qDwAH92iFUs+sQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AM0PR04MB12004.eurprd04.prod.outlook.com
 (2603:10a6:20b:746::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:13 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:12 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 10 May 2026 17:12:09 +0200
Subject: [PATCH v5 07/10] arm64: dts: lx2160a-clearfog-itx: move shared
 includes to dts
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-lx2160-pci-v5-7-540b83852227@solid-run.com>
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
	GVXPR04MB12057:EE_|AM0PR04MB12004:EE_|AM3PEPF0000A793:EE_|GVXPR04MB10111:EE_
X-MS-Office365-Filtering-Correlation-Id: 719fb248-279b-489a-cfe6-08deaea688e2
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 AGtu8q0Qi28ogyZu+np+Wb1TKWA5fAJOTkvmYoUOd34jVwrYN8PTHrKU8cu21zcM3OIyGotxFUnRBJSQyCrq3SmBldGiL+L/6KIqVaROyYQ9SCMvrA8GKEJPjRu5gGCMbuvY+YGSQ7kdbUdrEKYN3+rOOZRtiYjn50i2VUAnC8t0Vq6en/bUVin6YJPkDpsFQpRa2izTI7Lotu9iKsK3xPVGFBDPLvRy7/C7FySGdQwB/gI2UpEo0MexuhwCCL1mnX1CoysZ6pRYONpbq4QElRXT5i3XLtUljYR9W3Xs7jylJXWeiGmjPr/ETQjf2JoUUHj6STpCl7Oo00d7Bn7ywZtQXu2zDC+0HjVDePpsjJJZbP5QffBFKOb2Fca+fqX2euqwM4SU/YZ2qsBFwsPhseH07PotxzAT16V4yngc/t5dVwceMyRkXOzJqZuTSEYWyTvlB/ifao6i/wUZ5F9cLmxTSSWYMkXkY6KclqmrAK+Yz/jbZh2nDrYJ+wGp4iHzC4Mb56d9Kn+Ba2a9664M4akx3VZmfyRy8M9eXmB/uLUifqfk61GbcnxhGgAfuPvPCibMu81NHMumaXO0Vf+TA7Qs3bJT5PHfHMLwTWrTKqDquBEXf8E1C35QikQFRwRl4pU3mujQ7CC0i6LYDXtZ12mcaGJppT9MVxxJxBDY/qFAufW58DhYS+WOBrNf9RTt2W6AYnA/I2sVpX/spqLGD2d4F52S29XHI4njGNT2JyA77KvqSoKZAnyzgBYB8YLU5M+sHgggf+BJP5aIhqF3rA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 eo2rka+HltqWyOBk7RRyjX6n4qO3eOwPSuqaNyHqG3fQo5Ge6+ZNysAXmbBRVJKVk5aY9e+T2Z3kDiniR+axCJ+7jnrgR5hCfQEDsZrKAMvKAlsGFCtpSwGFZRogCGFnAsxfUJLkOXf8g9d0GZRiwq/N9XJ+Mw0ei3YnUAPHjd7qX+j4/5m3tToo+uC0qRU0g9WwB9HZNCDIeMu0nrLbpQYYyfKuH1U8E4/S+dck9EPqNlxhrqKkJf+yxylKgevoev/fIv5G9XKSpJMLjlrhiugTe/deP6oeadoz+sfAKvjxedPR0khkCxBlLY1g4ox5t75SkmPUWtfxiSqP+MmBoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12004
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 52a119eb18a546b48f562e3903f16855:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37fe5b74-eb08-45f0-1f32-08deaea68396
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|7416014|376014|36860700016|82310400026|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PjqZX1We2J1i/vhAp6l5HrOF5Hpk/riLENm415/LtBSTp56hTDE/MmVjWQ9xQL/TVOS+oPYTYWGB1Szd5lRkPQHMANIe+tg8QPYZ4hcnMZ1/8STvOKodi+Vy0uRS4XioR2Xox6bXGV6WuEbVnmTWuKyGaxxssdH0jdLm5xz4/MPAm7dFxPmub7FMn2llxL29biGaKKmiuOckCYwqWXQqO+3JIC8wFm/+N62jLz4ufKim+UThJmjXbZuFrQk5oIj/mFVS+KTsEIuCVqZjxxBk+DHNjwnCaN4SwQUasHISvY6PP2fgwpuFf4iwpSA/CgGS39eQTHeiUxDtZ8+5ef96/OqCHmZ13jEuEMwIIuaameIyTSylfF5iLWkJ0eIQ6MofopzkjBGNqwki+fwrgylBAIfW4KLZeq2QKMtXcp7UOuMm5tjVTa+7JNNVcp8aAHL66wYLVLwZ/gvkF2FOCPMHmFJWDrdjSI+JO05YS/Nm0G77Xz0SM3VDg3XURrhVypDYD1QoXSlrzTdcvQbA7dp9B5OXNfYM4rXmYwuB/UAxvbdecYuStHEc+gUg2nGyjZYTLspP/wdiPoyEfe0A2tc4bnNB2JhiXw4rBrGUWte3MXaQFuGd0UOxDDW3mBJbXafBZBVb6V4u7D+Ll1z4Lby3p2sYODpw0c4Jcv4CXWUennSNpUHnITIxhsI7w5ymdkfonkroxJQtrVwG42OGzm+dI/JZMf0DY0GRd20NTW8WMQAP+A/2yTD1ypvMFDYbeu2nLk7i/QyxGSp4Ew3MG/avhw==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(7416014)(376014)(36860700016)(82310400026)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PihyXtStrxHFT165rulFwbTwFXvAyba8HNKUrNhiAl4NZxgThUXH2c450kbxEz3LvZnxODLi8O0EKiae0ctM2pOcbw7P8unTU3Wn4rTTpxfb+mwucVvqWawo7cZ4oqJsjTH6aKB7nsRPd8uONwrJAXzpqgIJH/ys2nRSakpjv10a4cfrcaF/pCK4LYwNs6EO6uXSMouyCfcdXI/90yPauVvoJQO4qykrGvBDW4Dd9sMswhiCysuBqibMzMeFQ3W0eTG43ju3va5OgTKhz/aCjJTrJk4CcrfoO8pXjANTeeCfZ20OY2dq5jqAihzi3/5s/7fPdCiiIsSlinqyT7Xt4Yd6kpCfHaJNqwMLarpKEI/JhrzLTmXS/jjC3FBPYcIDYrdyCCAJiWeOw5PPkxPTNc3vh/6b72IQfl1fn74aYEVKuvhN5FyRviUnIofy3ut2
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:21.6536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 719fb248-279b-489a-cfe6-08deaea688e2
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10111

Originally includes were defined hierarchically:
- CEX-7 Module includes SoC
- Clearfog-CX & Honeycomb common parts include CEX-7 Module
- Boards include common parts

This makes it difficult to modify the includes on a per-board level,
e.g. when adding a new board based on CEX-7 module but revision 2 SoC
(which now has its own soc dtsi).

Move includes of both SoC and CEX-7 module out of common parts and into
each board dts.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi         | 2 --
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts   | 2 ++
 arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi | 1 -
 arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts     | 2 ++
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 56b74837ddd48..7df93bb37d13c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -4,8 +4,6 @@
 //
 // Copyright 2019 SolidRun Ltd.
 
-#include "fsl-lx2160a.dtsi"
-
 / {
 	model = "SolidRun LX2160A COM Express Type 7 module";
 	compatible = "solidrun,lx2160a-cex7", "fsl,lx2160a";
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
index 86a9b771428dc..802d7611c6479 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-cex7.dtsi"
 #include "fsl-lx2160a-clearfog-itx.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
index 6388bd60ffdf5..170e5b0034f19 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-itx.dtsi
@@ -5,7 +5,6 @@
 //
 // Copyright 2019 SolidRun Ltd.
 
-#include "fsl-lx2160a-cex7.dtsi"
 #include <dt-bindings/input/linux-event-codes.h>
 
 / {
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
index fe19f3009ea58..2b1e13053422b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-honeycomb.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include "fsl-lx2160a.dtsi"
+#include "fsl-lx2160a-cex7.dtsi"
 #include "fsl-lx2160a-clearfog-itx.dtsi"
 
 / {

-- 
2.51.0

