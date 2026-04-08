Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023109.outbound.protection.outlook.com [40.107.162.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA0F3624B0
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 18:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.109
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775673545; cv=fail; b=O6nGUOL7w8ZFsQMeSr39Ai12E4O7GQ2w+28nsqYrc+5Sc+tozTkQqvO0B3jeBijMBILlf7N0YZEzOSjfNyCR2dv7IglQAdBfANaABgOEcSjhzVFsd5HTivzKDGziyYmX4QYvfgd2DrwCO0CHiv+Rspn29lcc/Sz9mFf0pzlJ2uM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775673545; c=relaxed/simple;
	bh=4ZlAuUYVljUfYd7yFeMdcn4xDb5ezu53tNTCprvLxq4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=KbBrO6My6INHClbKCGBJDPZ5Sbbultc4Xn/TM9X8afx21IQF0+3ZyDQde8muYc4WAGWq9onu/B2xfvT49S4igxINMSkYFqj/xO3PRX+rWuuBNLiu4FFwWakdgDU2DgNUr99enGCrJlLH03vqk21fyNvV/LVEVA3D+FpVUd0qRwo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Jkk8YRTZ; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=Jkk8YRTZ; arc=fail smtp.client-ip=40.107.162.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Jkk8YRTZ";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="Jkk8YRTZ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=f7mmrWCedCqjsohzI+nbDoLUma34F3SypVxnreRIT+1Gjmc+DhGpmH3A/HrbTdPxQFtaZ/xaSyqNxrkze+GcEbgUt3g4XVQOkHXU3fk8Kn1pXDAfAG85ozd894PfUppomT1rlDKSjIYmCOv/Cxrdg5n5UHa1OjR6TlqLHgfGdi0VAMJMX90DyvxT4OaG0rm0M9MxCbrxPBIKE9yvzf2jL4tJzfdlwDlmLomA3SejmXNdhV2D22iib2B+bnwAJ1xiCdmcWGxMkuQnevzdQwu+mZT3T9yceNLedTlQ8AVRUBA6thA/URm8zr+VdDP8Q08mffIjis8Uh7XavlMeGhROkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzG7mzZQjmebJBX3bGEBmybm9vBtW7CViDauEYtyvtw=;
 b=ABSFyPBaED/rXijZb/+Mbj0eoRiYpouXnt3b86+Ef7+StCPuY/870GLIVy63pfhT33+e3kxSFX+Oh+VKjuE3jzvrXowugDoUnKr4jD/6V9NDyaRTgyILg5L/zgGK02+X86FQsQ2eZ19+q7JyJAGXJi6GyWwYfmEn58xF3PypzdMc/9uaClFBRnb76ozxaKXUldLJ+aA58hwMVcU9HWdAPujGQkHJAFYh+Aqc1ZMQ7jtPicNIg0pahzmJ+LFXlpzNN1pbxXAtH9uupJXwN/ZFHUNl4ty0ZKTu6R6XtG3LbnG9+4bl6VVn+rgdH05wF6XvMr9MP2+SdH/fd1Jpy3zcQg==
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
 bh=NzG7mzZQjmebJBX3bGEBmybm9vBtW7CViDauEYtyvtw=;
 b=Jkk8YRTZMM127LlrF13dETXHfLIF2MnGLzrJLd4n4OdnF2MLCu/WXM87+5NO90hSTRktb1KCucDMcZEUsE2FkJSHY77kjd1qucpR3XaGX1wvyjJutO3lHhl/A+upG0fQYBUABhZdLkH/nEe6eptf72EDSqwsFY302DCyyjD9hTonhVqoa0Jsqk+Vr/C/XDItVI6I5+LV0vuhUV2zNGZeHs2T/D27EbaoXvLl/P5CADmEL7tq89782YUeZS5w48UrzmEIhTTuk+Lb/AQhJxRLSzb65qjpyO3vE9k/1aTsUelg/u2AFMYTkzvwncIZGRuWjvl9IHT4ML/JfeJwazQMhw==
Received: from AS8PR04CA0184.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::9)
 by DB9PR04MB11661.eurprd04.prod.outlook.com (2603:10a6:10:60f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 18:38:56 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::74) by AS8PR04CA0184.outlook.office365.com
 (2603:10a6:20b:2f3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 18:38:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 18:38:56 +0000
Received: from emails-8631603-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-209.eu-west-1.compute.internal [10.20.6.209])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 2644480C82;
	Wed,  8 Apr 2026 18:38:56 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Wed Apr  8 18:38:49 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9n556NCF1mn3lAfhiKnyfosT1atTFDhFvWz6D5YoLdL8iMw1NDQ/oL1kO1xdfv0Vose0ZdWXN5+3Jtr5cUrMBsYACYvrDlChQ0OwP2K3LHVjKJAPJCttxh4XUkIdqcGWHqoDgnL6r2aPYx95j2MlA6/RhA4KZ4Acx9NXpxKRPgHB0lirHD+dIfJP6+EogrWH06XOuRcHFxttgc9YY52KwZ/TUa2sRZIzuf9depJcKw9iuhp9LwDa1wX6i+49oBf8BxSNIGhA6hYMfsCxqCojKR0SkyK5GetqC5auYmst2cH63k+2134sYuSuj4M7okksl6eyF2cM7OjCG69BP3j0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzG7mzZQjmebJBX3bGEBmybm9vBtW7CViDauEYtyvtw=;
 b=GCCZR7IAGIm7GvnCDU+ETtdgOkAyVXD7qy2XmBIFtsm0I9HyOX2TwXi2eYMAu73/9H99NU/nGp/2KEsGSV4qYXhvaiUACOhb9BxZMJQVGwcsogJSWA7rGu6BCLsF+4T9Jtgrqq6jNuD8geedq6PIrtW84H7mRwvYaGvjmIFbisViGgmpXRRJW3SJ13J6U391nHGQd1lw/YNz/JGteOxE5uyB+F1racCSjqnTJpqEnNZ6LCIk5mrSJ/eIqLf8HSSmpf9Skus2cGGYwyeE/YeVseXNOuN19LMaNMZcN6x+OKI3U3OhjAeT++0S15LZXSImwUjrTKiuTH9nBUWgrJeAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzG7mzZQjmebJBX3bGEBmybm9vBtW7CViDauEYtyvtw=;
 b=Jkk8YRTZMM127LlrF13dETXHfLIF2MnGLzrJLd4n4OdnF2MLCu/WXM87+5NO90hSTRktb1KCucDMcZEUsE2FkJSHY77kjd1qucpR3XaGX1wvyjJutO3lHhl/A+upG0fQYBUABhZdLkH/nEe6eptf72EDSqwsFY302DCyyjD9hTonhVqoa0Jsqk+Vr/C/XDItVI6I5+LV0vuhUV2zNGZeHs2T/D27EbaoXvLl/P5CADmEL7tq89782YUeZS5w48UrzmEIhTTuk+Lb/AQhJxRLSzb65qjpyO3vE9k/1aTsUelg/u2AFMYTkzvwncIZGRuWjvl9IHT4ML/JfeJwazQMhw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by OSKPR04MB11391.eurprd04.prod.outlook.com
 (2603:10a6:e10:99::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 18:38:46 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 18:38:46 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 08 Apr 2026 20:38:37 +0200
Subject: [PATCH 2/2] arm64: dts: imx8dxl: Add SolidRun SoM and HummingBoard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-imx8dxl-sr-som-v1-2-ce5a39acd713@solid-run.com>
References: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
In-Reply-To: <20260408-imx8dxl-sr-som-v1-0-ce5a39acd713@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0413.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::14) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|OSKPR04MB11391:EE_|AMS1EPF0000004A:EE_|DB9PR04MB11661:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af2aa1d-99eb-43ea-4374-08de959e1782
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 Qvdi6d/eoNo48TE1YY7E8NoWP6Nl3cCUM+YCk7wUWSoc4yvgSGHhJ6LWbZUlAfbrvajJPyYzZWtev5lBn/8uUQ6DA8lb11V4hn2o1DamKWCiR/4cSVBqVkTCAHQLVnOZ6UeyBiJAycO5LzMkZ0cuJGbuyHz9bO/m/xtkZU3gS3oBeZLE3GYd8qq/ysdDg5to/ozxf2CSVv4Fr4nGToiTgznRfNxRyLwM+4GV9K2cM97iH6huadWN6rHcNuSDDp42PwTcwLjK+6L13DNAX7pZcbPi61g7uurNj3RN958+eFSsweQu4f4tdyEVDkhEezPJhpa/GyZdQvS3wwOgJCFiBKYzjLYZKEO9Am6e3dzAg+53UeWHI15w7vSwKE5i0aYgy3YMom9JW1OwrKFRgW9VgxMj6oUns/FTq8q/JYNrjw+Z0DXV6N4rq9A6kyq+BR0NRIcI+EazG5vx8etSciQJCQ0WNXNwck3zeeA8u9f+r5q2Omg0gWqWPAKp23RvKKFsFnshX7E/sbny5utTZHGZHN55y4NPMTUHUFkhbYwvdXgS/EagMytV/iiUkmHQ5WOH6QWO8heg9I5Esx5JzlmYIHH74A1yqfMZ7Aw2+ALSb1AIUxtMa23Q+AGtjp/33S2AxDGshuMIt9KJnfgRKVBoRSg7iQdx5NoUjKXxyaF76imU8kuOIM9kbFZgXm0XFmqZJjtXVFeMdeawIlXi54QHXJlj2HW0VmQcKWAnB7gLXH5CoReD7HKyGu80BBbwsHcU1I0qUulPO7kCCHQ0yydyJ32ntHaUcdnSkGc6fH/L5Bc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 FzFRkIFP0TlxtgIqKylfj7Eu4he3Y8sKeXuy1O8II+0Mm4fHHVG2Kvs17qQs1BFiH66d5kZKsK60+Y9AgWDCX8e7W27VLU+1hiZ5l+/plsKuwCemWGqANJXeRPvIC6v/yrGGCnXzOymhAHmGMvtRNovdHHNBg/+ZZGcTXA+2mxKRqHHbSPEgRXWsAsH4nJzH2nrkSh8MxhDLy2GJzKcR3I5WBzpNp2POyW89fFJRyCn+liD6KenEoMM8SZUDzeRpfkEs5AWyJkmkpqoDlTFeAoP+1EMEBK3AnbNgcmwKEUtZVXhmEuhzhd7XHMk704yUKmDmn+RuliC9FV9GqwjWxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11391
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b7c5289842d4457f975131dbe972e244:solidrun,office365_emails,sent,inline:8816a70946a0cdd47e43465ef0b43aca
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5e111101-d508-4244-9772-08de959e1185
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|35042699022|14060799003|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tsi013I724YrUM0fW+NgLiz+ymBKrCwNzklICtSzKMlV/b7O4UsO1moB3KuWET4aoqQhykXxURm3NJRRCq8ZS7fOKvPAHJwMf55G2tavCU8zIztcEbhuTnwLXOtsSmCLlYlKYIRQrLfM7wE4v0SZXyf+FHyOXZL1EDMeujdUrJuCgFfM3eGnxgUFSinzHrMSQvF4LY3kjFGBDMk4/onqCZlLULcPdYJy7NOok66Y1XPuaAK9ZXGJuBp+VHibZHGyUBvEjsEvngOOFkvStIU+VRe5JoUEd7BB6Ph9Ds8iLEwb6zQTnPEsEcT9lnm/o7IffNagJcBA49l8rUpfEQYwqIyF6Iv0X5oisX4qGU5tXXIJxbhfDKEGu8ixsMf6g2r/+Q1vfNxE/o2dOBhPyboxUdo2a31nq3tDGme38ESBe0MNi61LWiN5WtBfJnhSY+EjbGHt9uv3azfiGeyer6iyVXoIYl/6zgGXWTGMhNa+JAwZFblxFA2hfaMU34sRXBbWe0EXQR/EILDO+6r7VK7nHQPbzWlFhwYRm2orZwwP+YM05vLHfmVPZBhPR6HRrPfNFldwLrlakCCrz3eRlTLoJcBmdC1Vch+qljIHfm5m8KwPmqBoCLPelz6amJ7PgQdfLtb8M+DXm+34iR3E6SdXo7FJE7UVU/6XzhMEAXjYTL3s2GchHJ2W5SVRIZDZf1OdHdT1RdbLlV9JyrRNdA1kipS99r0qT0x6okJnstXCc491XBpQztXqNqIruAumd/SimsqDnDokLc56GtSYSMAkEg==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(35042699022)(14060799003)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dJyN6uLI2DoqnB4N5mZCp+56eVY6+dtUybasw1bsRekn++ikJqneY+6A2D5FSfKq2P6Tf0zlSVgcf5Ut5BTRcU/iiBSnpYx1kOj/59xA3R0L+jZeZ6S2g6dj1XCDUbVAqFzN7GdmftkrsXGFYoqe8ZrUL7HRXLbZIU/N0qIEwuKr8y0d8NL8OudqmlrlIR7a3oX1orjoUNm94iRRm4WcnQUbAh7bIKxTwYvWMX9WDiWcXc4g92hhyUyVzHd/O3XLIiDGHuOUGdgbMLIssvodEqMoXIwj87rF1GI1doHj9gvXF12swVQtm8G7fvoCkwK5mArmJPeM6R61RF3g4C+CJCoDpwvO2ACMGqNBRi6pXAckIRNSiav800n/At0nGIEOrccDIwFlXUqlsIC314PKQ+gp+CxTf8lay68Mlehcm9uPHP+AYOBDnV5Ng/rTlg8j
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 18:38:56.3953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af2aa1d-99eb-43ea-4374-08de959e1782
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11661

Add support for the SolidRun i.MX8DXL System-on-Module (revision 2.1)
and its corresponding evaluation carrier board, the HummingBoard
Telematics (revision 2.0).

The SoM features:
- eMMC
- GNSS with 1PPS
- V2X DSRC Radio
- Secure Element for V2X Applications
- Inertial Sensor
- Pressure Sensor
- Compass

The HummingBoard Telematics carrier board features:
- Cellular Modem
- WiFi & Bluetooth
- RTC with backup battery
- CAN
- 100Base-TX Ethernet
- 100Base-T1 Ethernet
- Multi-interface I/O connector
- Multi-interface add-on board connector

The multi-interface I/O connector supplies power and provides basic I/O
(Console UART, 100Base-TX, 100Base-T1, CAN, and power-supply logic level
GPIOs). The SolidRun Evaluation Kit includes a suitable cable and
adapter board that breaks these out into RJ45, USB Type-A, microUSB
Console, and Terminal Block connectors.

The multi-interface add-on board connector provides additional
interfaces (4x 100Base-T1, 2x SGMII, USB 2.0 shared with the cellular
modem, CAN, MDIO, SPI, UART, PCIe, I2C, and GPIO). These add-on
interfaces are disabled by default in the base device tree and are
intended to be enabled and extended via device tree overlays.

Note that a few components physically present on the SoM were omitted
from this description due to a lack of upstream bindings and drivers:
- Pressure Sensor
- V2X DSRC Radio
- Secure Element

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../freescale/imx8dxl-hummingboard-telematics.dts  | 536 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi  | 460 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi   |   1 -
 4 files changed, 998 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 700bab4d3e600..12b946c08400b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -111,6 +111,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk.dtb
 
 imx8dxl-evk-pcie-ep-dtbs += imx8dxl-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8dxl-evk-pcie-ep.dtb
+DTC_FLAGS_imx8dxl-hummingboard-telematics := -@
+dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-telematics.dts b/arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-telematics.dts
new file mode 100644
index 0000000000000..ad2371f3c2632
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-hummingboard-telematics.dts
@@ -0,0 +1,536 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include "imx8dxl-sr-som.dtsi"
+
+/ {
+	compatible = "solidrun,imx8dxl-hummingboard-telematics",
+		     "solidrun,imx8dxl-sr-som", "fsl,imx8dxl";
+	model = "SolidRun i.MX8DXL HummingBoard Telematics";
+
+	aliases {
+		/* override ethernat aliases from imx8dxl.dtsi */
+		ethernet0 = &eqos;
+		/delete-property/ ethernet1;
+		gpio8 = &tca6408_u2;
+		mmc2 = &usdhc3;
+		rtc0 = &carrier_rtc;
+		rtc1 = &rtc;
+		serial1 = &lpuart1;
+	};
+
+	v_1_1: regulator-1-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v1";
+		pinctrl-0 = <&regulator_1v1_pins>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <1100000>;
+		regulator-min-microvolt = <1100000>;
+		vin-supply = <&v_5_0>;
+		gpio = <&lsio_gpio4 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	v_5_0: regulator-5-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "5v0";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+	};
+
+	/* can transceiver builtin regulator (STBN1 pin) */
+	reg_flexcan1_stby: regulator-flexcan1-standby {
+		compatible = "regulator-fixed";
+		regulator-name = "flexcan1-standby";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&tca6408_u2 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	/* can transceiver builtin regulator (STBN2 pin) */
+	reg_flexcan2_stby: regulator-flexcan2-standby {
+		compatible = "regulator-fixed";
+		regulator-name = "flexcan2-standby";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&tca6408_u2 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	modem_vbat: regulator-modem-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat";
+		pinctrl-0 = <&regulator_modem_vbat_pins>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3600000>;
+		regulator-min-microvolt = <3600000>;
+		vin-supply = <&v_5_0>;
+		gpio = <&lsio_gpio0 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		pinctrl-0 = <&regulator_usb1_vbus_pins>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		gpio = <&lsio_gpio0 16 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usdhc3_pwrseq: usdhc3-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&lsio_gpio0 15 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&dma_apbh {
+	status = "disabled";
+};
+
+&eqos {
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&eqos_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	fixed-link {
+		full-duplex;
+		speed = <1000>;
+	};
+};
+
+&flexcan1 {
+	pinctrl-0 = <&flexcan1_pins>;
+	pinctrl-names = "default";
+	xceiver-supply = <&reg_flexcan1_stby>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <5000000>;
+	};
+};
+
+&flexcan2 {
+	pinctrl-0 = <&flexcan2_pins>;
+	pinctrl-names = "default";
+	xceiver-supply = <&reg_flexcan2_stby>;
+	status = "okay";
+
+	can-transceiver {
+		max-bitrate = <5000000>;
+	};
+};
+
+&i2c2 {
+	/* routed to J14: SDA(51), SCL(53) */
+
+	/* regulator@18 */
+
+	tca6408_u2: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		#gpio-cells = <2>;
+		gpio-controller;
+		gpio-line-names = "DIG_IN1", "DIG_IN2", "CAN_STNB1", "CAN_STNB2",
+				  "DIG_OUT1", "DIG_OUT2", "", "";
+		interrupts-extended = <&lsio_gpio0 20 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&tca6408_u2_int_pins>;
+		pinctrl-names = "default";
+	};
+
+	carrier_rtc: rtc@32 {
+		compatible = "epson,rx8111";
+		reg = <0x32>;
+	};
+};
+
+&iomuxc {
+	bluetooth_pins: pinctrl-bluetooth-grp {
+		fsl,pins = <
+			/* BT_REG_ON: io without pull (module integrates pd) */
+			IMX8DXL_SPI3_SCK_LSIO_GPIO0_IO13			0x0000061
+		>;
+	};
+
+	eqos_pins: pinctrl-eqos-grp {
+		fsl,pins = <
+			/* MDIO to Switch */
+			/* enet0 mdio pads supplied with 3.3v */
+			/* IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIOCT */
+			IMX8DXL_ENET0_MDC_CONN_EQOS_MDC				0x06000020
+			IMX8DXL_ENET0_MDIO_CONN_EQOS_MDIO			0x06000020
+			/* RGMII to Switch */
+			IMX8DXL_ENET1_RGMII_TX_CTL_CONN_EQOS_RGMII_TX_CTL	0x06000020
+			IMX8DXL_ENET1_RGMII_TXC_CONN_EQOS_RGMII_TXC		0x06000020
+			IMX8DXL_ENET1_RGMII_TXD0_CONN_EQOS_RGMII_TXD0		0x06000020
+			IMX8DXL_ENET1_RGMII_TXD1_CONN_EQOS_RGMII_TXD1		0x06000020
+			IMX8DXL_ENET1_RGMII_TXD2_CONN_EQOS_RGMII_TXD2		0x06000020
+			IMX8DXL_ENET1_RGMII_TXD3_CONN_EQOS_RGMII_TXD3		0x06000020
+			IMX8DXL_ENET1_RGMII_RXC_CONN_EQOS_RGMII_RXC		0x06000020
+			IMX8DXL_ENET1_RGMII_RX_CTL_CONN_EQOS_RGMII_RX_CTL	0x06000020
+			IMX8DXL_ENET1_RGMII_RXD0_CONN_EQOS_RGMII_RXD0		0x06000020
+			IMX8DXL_ENET1_RGMII_RXD1_CONN_EQOS_RGMII_RXD1		0x06000020
+			IMX8DXL_ENET1_RGMII_RXD2_CONN_EQOS_RGMII_RXD2		0x06000020
+			IMX8DXL_ENET1_RGMII_RXD3_CONN_EQOS_RGMII_RXD3		0x06000020
+		>;
+	};
+
+	flexcan1_pins: pinctrl-flexcan1-grp {
+		fsl,pins = <
+			IMX8DXL_FLEXCAN0_TX_ADMA_FLEXCAN0_TX			0x00000021
+			IMX8DXL_FLEXCAN0_RX_ADMA_FLEXCAN0_RX			0x00000021
+		>;
+	};
+
+	flexcan2_pins: pinctrl-flexcan2-grp {
+		fsl,pins = <
+			IMX8DXL_FLEXCAN1_TX_ADMA_FLEXCAN1_TX			0x00000021
+			IMX8DXL_FLEXCAN1_RX_ADMA_FLEXCAN1_RX			0x00000021
+		>;
+	};
+
+	lpspi0_pins: pinctrl-lpspi0-grp {
+		fsl,pins = <
+			IMX8DXL_SPI0_SCK_ADMA_SPI0_SCK				0x600004c
+			IMX8DXL_SPI0_SDO_ADMA_SPI0_SDO				0x600004c
+			IMX8DXL_SPI0_SDI_ADMA_SPI0_SDI				0x600004c
+			IMX8DXL_SPI0_CS0_LSIO_GPIO1_IO08			0x0000021
+			IMX8DXL_SPI0_CS1_LSIO_GPIO1_IO07			0x0000021
+		>;
+	};
+
+	lpuart1_pins: pinctrl-lpuart1-grp {
+		fsl,pins = <
+			IMX8DXL_UART1_RX_ADMA_UART1_RX				0x06000020
+			IMX8DXL_UART1_TX_ADMA_UART1_TX				0x06000020
+			IMX8DXL_UART1_CTS_B_ADMA_UART1_CTS_B			0x06000020
+			IMX8DXL_UART1_RTS_B_ADMA_UART1_RTS_B			0x06000020
+		>;
+	};
+
+	modem_pins: pinctrl-lte-grp {
+		fsl,pins = <
+			/* modem RESET_N: io open drain drive 2mA */
+			IMX8DXL_ADC_IN3_LSIO_GPIO1_IO11	0x2000061
+
+			/* modem PWRKEY: io open drain with pull-up, drive 2mA */
+			IMX8DXL_ADC_IN2_LSIO_GPIO1_IO12	0x2000021
+		>;
+	};
+
+	regulator_1v1_pins: pinctrl-regulator-1-1-grp {
+		fsl,pins = <
+			/* SW_PE: io without pull-up */
+			IMX8DXL_USB_SS3_TC2_LSIO_GPIO4_IO05			0x0000061
+		>;
+	};
+
+	regulator_modem_vbat_pins: pinctrl-regulator-modem-vbat-grp {
+		fsl,pins = <
+			/*
+			 * RF_PWR: io without pull-up,
+			 * has either external pull-up (R1117) or pull-down (R1118).
+			 * With pull-up Modem will boot at system power-up,
+			 * with pull-down modem will enter power-down mode once
+			 * vbat is enabled -> toggle pwrkey to boot modem.
+			 * Hence pull-up (R1117) is preferred.
+			 */
+			IMX8DXL_SPI3_SDO_LSIO_GPIO0_IO14			0x0000061
+		>;
+	};
+
+	regulator_usb1_vbus_pins: pinctrl-regulator-usb1-vbus-grp {
+		fsl,pins = <
+			/* regulator enable: open-drain with pull-up & low drive strength */
+			IMX8DXL_SPI3_CS0_LSIO_GPIO0_IO16			0x2000021
+		>;
+	};
+
+	switch_pins: pinctrl-switch-grp {
+		fsl,pins = <
+			/* SW_RSTn: io without pull-up */
+			IMX8DXL_USB_SS3_TC0_LSIO_GPIO4_IO03			0x0000021
+
+			/* SW_CORE_RSTn: io without pull-up */
+			IMX8DXL_USB_SS3_TC1_LSIO_GPIO4_IO04			0x0000021
+
+			/* INT_N: io without pull-up */
+			IMX8DXL_USB_SS3_TC3_LSIO_GPIO4_IO06			0x0000021
+		>;
+	};
+
+	tca6408_u2_int_pins: pinctrl-tca6408-u2-int-grp {
+		fsl,pins = <
+			/* gpio-expander interrupt: io with pull-up */
+			IMX8DXL_MCLK_OUT0_LSIO_GPIO0_IO20			0x0000021
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			IMX8DXL_ENET0_RGMII_TXC_CONN_USDHC2_CLK			0x06000040
+			IMX8DXL_ENET0_RGMII_TX_CTL_CONN_USDHC2_CMD		0x00000021
+			IMX8DXL_ENET0_RGMII_TXD0_CONN_USDHC2_DATA0		0x00000021
+			IMX8DXL_ENET0_RGMII_TXD1_CONN_USDHC2_DATA1		0x00000021
+			IMX8DXL_ENET0_RGMII_TXD2_CONN_USDHC2_DATA2		0x00000021
+			IMX8DXL_ENET0_RGMII_TXD3_CONN_USDHC2_DATA3		0x00000021
+		>;
+	};
+
+	wifi_pins: pinctrl-wifi-grp {
+		fsl,pins = <
+			/* WL_REG_ON: io without pull (module integrates pd) */
+			IMX8DXL_SPI3_SDI_LSIO_GPIO0_IO15			0x0000061
+		>;
+	};
+};
+
+&lpspi0 {
+	cs-gpios = <&lsio_gpio1 8 GPIO_ACTIVE_LOW>, <&lsio_gpio1 7 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&lpspi0_pins>, <&switch_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ethernet-switch@0 {
+		compatible = "nxp,sja1110a";
+		reg = <0>;
+		reset-gpios = <&lsio_gpio4 3 GPIO_ACTIVE_LOW>;
+		spi-cpol;
+		spi-max-frequency = <4000000>;
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* to 100Base-TX on connector J26 */
+			port@1 {
+				reg = <0x1>;
+				label = "lan1";
+				phy-handle = <&switch_port1_base_tx_phy>;
+				phy-mode = "internal";
+				status = "okay";
+			};
+
+			/* to CPU */
+			port@2 {
+				reg = <0x2>;
+				ethernet = <&eqos>;
+				label = "cpu";
+				phy-mode = "rgmii-id";
+				rx-internal-delay-ps = <2000>;
+				tx-internal-delay-ps = <2000>;
+				status = "okay";
+
+				fixed-link {
+					full-duplex;
+					speed = <1000>;
+				};
+			};
+
+			/* sgmii on addon board connector J21 */
+			port@3 {
+				reg = <0x3>;
+				label = "lan3";
+				status = "disabled";
+			};
+
+			/* sgmii on addon board connector J21 */
+			port@4 {
+				reg = <0x4>;
+				label = "lan4";
+				status = "disabled";
+			};
+
+			/* 100base-t1 on addon board connector J21 */
+			port@5 {
+				reg = <0x5>;
+				label = "trx1";
+				phy-handle = <&switch_port5_base_t1_phy>;
+				phy-mode = "internal";
+				status = "disabled";
+			};
+
+			/* 100base-t1 on addon board connector J21 */
+			port@6 {
+				reg = <0x6>;
+				label = "trx2";
+				phy-handle = <&switch_port6_base_t1_phy>;
+				phy-mode = "internal";
+				status = "disabled";
+			};
+
+			/* 100base-t1 on addon board connector J21 */
+			port@7 {
+				reg = <0x7>;
+				label = "trx3";
+				phy-handle = <&switch_port7_base_t1_phy>;
+				phy-mode = "internal";
+				status = "disabled";
+			};
+
+			/* 100base-t1 on addon board connector J21 */
+			port@8 {
+				reg = <0x8>;
+				label = "trx4";
+				phy-handle = <&switch_port8_base_t1_phy>;
+				phy-mode = "internal";
+				status = "disabled";
+			};
+
+			/* 100base-t1 on addon board connector J21 */
+			port@9 {
+				reg = <0x9>;
+				label = "trx5";
+				phy-handle = <&switch_port9_base_t1_phy>;
+				phy-mode = "internal";
+				status = "disabled";
+			};
+
+			/* 100Base-T1 on connector J26 */
+			port@a {
+				reg = <0xa>;
+				label = "trx6";
+				phy-handle = <&switch_port10_base_t1_phy>;
+				phy-mode = "internal";
+				status = "okay";
+			};
+		};
+
+		mdios {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			mdio@0 {
+				compatible = "nxp,sja1110-base-t1-mdio";
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* 100base-t1 on addon board connector J21 */
+				switch_port5_base_t1_phy: ethernet-phy@1 {
+					compatible = "ethernet-phy-ieee802.3-c45";
+					reg = <0x1>;
+					status = "disabled";
+				};
+
+				/* 100base-t1 on addon board connector J21 */
+				switch_port6_base_t1_phy: ethernet-phy@2 {
+					compatible = "ethernet-phy-ieee802.3-c45";
+					reg = <0x2>;
+					status = "disabled";
+				};
+
+				/* 100base-t1 on addon board connector J21 */
+				switch_port7_base_t1_phy: ethernet-phy@3 {
+					compatible = "ethernet-phy-ieee802.3-c45";
+					reg = <0x3>;
+					status = "disabled";
+				};
+
+				/* 100base-t1 on addon board connector J21 */
+				switch_port8_base_t1_phy: ethernet-phy@4 {
+					compatible = "ethernet-phy-ieee802.3-c45";
+					reg = <0x4>;
+					status = "disabled";
+				};
+
+				/* 100base-t1 on addon board connector J21 */
+				switch_port9_base_t1_phy: ethernet-phy@5 {
+					compatible = "ethernet-phy-ieee802.3-c45";
+					reg = <0x5>;
+					status = "disabled";
+				};
+
+				/* 100Base-T1 on connector J26 */
+				switch_port10_base_t1_phy: ethernet-phy@6 {
+					compatible = "ethernet-phy-ieee802.3-c45";
+					reg = <0x6>;
+				};
+			};
+
+			mdio@1 {
+				compatible = "nxp,sja1110-base-tx-mdio";
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* to 100Base-TX on connector J26 */
+				switch_port1_base_tx_phy: ethernet-phy@1 {
+					reg = <0x1>;
+				};
+			};
+		};
+	};
+};
+
+/* bluetooth */
+&lpuart1 {
+	pinctrl-0 = <&lpuart1_pins>, <&bluetooth_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		/* Murata 1MW module supports max. 3M baud */
+		max-speed = <3000000>;
+		shutdown-gpios = <&lsio_gpio0 13 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&usbotg1 {
+	vbus-supply = <&vbus1>;
+};
+
+/* cellular modem */
+&usbotg2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	adp-disable;
+	disable-over-current;
+	dr_mode = "host";
+	hnp-disable;
+	pinctrl-0 = <&modem_pins>;
+	pinctrl-names = "default";
+	power-active-high;
+	srp-disable;
+	vbus-supply = <&v_5_0>;
+	status = "okay";
+
+	usb-device@1 {
+		compatible = "usb2c7c,125";
+		reg = <1>;
+		reset-duration-us = <150000>;
+		reset-gpios = <&lsio_gpio1 11 GPIO_ACTIVE_LOW>;
+		vbus-supply = <&v_3_3>;
+		vdd-supply = <&modem_vbat>;
+	};
+};
+
+&usbphy2 {
+	status = "okay";
+};
+
+/* WiFi */
+&usdhc3 {
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	non-removable;
+	no-sd;
+	pinctrl-0 = <&usdhc3_pins>, <&wifi_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi
new file mode 100644
index 0000000000000..d72e960c3e5e3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-sr-som.dtsi
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Josua Mayer <josua@solid-run.com>
+ */
+
+#include "imx8dxl.dtsi"
+/ {
+	compatible = "solidrun,imx8dxl-sr-som", "fsl,imx8dxl";
+	model = "SolidRun i.MX8DXL SoM";
+
+	aliases {
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart0;
+		serial2 = &lpuart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	imx8dxl-cm4 {
+		compatible = "fsl,imx8qxp-cm4";
+		clocks = <&clk_dummy>;
+		mboxes = <&lsio_mu5 0 1 &lsio_mu5 1 1 &lsio_mu5 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+		power-domains = <&pd IMX_SC_R_M4_0_PID0>, <&pd IMX_SC_R_M4_0_MU_1A>;
+		fsl,entry-address = <0x34fe0000>;
+		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
+	};
+
+	pps {
+		compatible = "pps-gpio";
+		gpios = <&lsio_gpio2 6 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&gnss_pps_pins>;
+		pinctrl-names = "default";
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		pinctrl-0 = <&regulator_1_2_pins>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <1200000>;
+		regulator-min-microvolt = <1200000>;
+		gpio = <&lsio_gpio1 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	v_1_6: regulator-1-6 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v6";
+		pinctrl-0 = <&regulator_1_6_pins>;
+		pinctrl-names = "default";
+		regulator-always-on;
+		regulator-max-microvolt = <1600000>;
+		regulator-min-microvolt = <1600000>;
+		vin-supply = <&v_1_8>;
+		gpio = <&lsio_gpio1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	v_1_8: regulator-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+	};
+
+	v_1_8_se: regulator-1-8-secure-element {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8-se";
+		pinctrl-0 = <&regulator_1_8_se_pins>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		vin-supply = <&v_1_8>;
+		gpio = <&lsio_gpio3 18 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x98000000 0 0x14000000>;
+			reusable;
+			size = <0 0x14000000>;
+			linux,cma-default;
+		};
+
+		vdev0vring0: memory0@90000000 {
+			reg = <0 0x90000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@90008000 {
+			reg = <0 0x90008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@90010000 {
+			reg = <0 0x90010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@90018000 {
+			reg = <0 0x90018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: memory-rsc-table@900ff000 {
+			reg = <0 0x900ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: memory-vdevbuffer@90400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90400000 0 0x100000>;
+			no-map;
+		};
+
+		/*
+		 * Memory reserved for optee usage. Please do not use.
+		 * This will be automatically added to dtb if OP-TEE is installed.
+		 * optee@96000000 {
+		 *     reg = <0 0x96000000 0 0x2000000>;
+		 *     no-map;
+		 * };
+		 */
+	};
+
+	memory@80000000 {
+		reg = <0x00000000 0x80000000 0 0x40000000>;
+		device_type = "memory";
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-1 = <&i2c2_gpio_pins>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&lsio_gpio3 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&lsio_gpio3 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-1 = <&i2c3_gpio_pins>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&lsio_gpio3 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&lsio_gpio3 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	magnetometer@1e {
+		compatible = "st,iis2mdc";
+		reg = <0x1e>;
+		interrupt-parent = <&lsio_gpio2>;
+		interrupts = <10 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&magnetometer_pins>;
+		pinctrl-names = "default";
+		st,drdy-int-pin = <1>;
+	};
+
+	/* pressure-sensor@5c */
+
+	inertial-sensor@6b {
+		compatible = "st,ism330dhcx";
+		reg = <0x6b>;
+		interrupt-parent = <&lsio_gpio2>;
+		interrupts = <11 IRQ_TYPE_EDGE_RISING>;
+		pinctrl-0 = <&imu_pins>;
+		pinctrl-names = "default";
+		st,drdy-int-pin = <1>;
+	};
+};
+
+&iomuxc {
+	pinctrl-0 = <&pinctrl_hog>;
+	pinctrl-names = "default";
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIORHB_PAD	0x000514a0
+			IMX8DXL_COMP_CTL_GPIO_1V8_3V3_GPIORHK_PAD	0x000014a0
+		>;
+	};
+
+	dsrc_pins: pinctrl-dsrc-grp {
+		fsl,pins = <
+			/* reset: io without pull */
+			IMX8DXL_ADC_IN0_LSIO_GPIO1_IO10			0x0000060
+
+			/*
+			 * boot0: io without pull
+			 * After reset, this pin selects radio boot media:
+			 * - 0: flash spi
+			 * - 1: slave sdio
+			 * Once the firmware boots however, the radio controls
+			 * this pin for flow-control to signal readiness.
+			 */
+			IMX8DXL_ADC_IN1_LSIO_GPIO1_IO09			0x0000060
+		>;
+	};
+
+	gnss_pins: pinctrl-gnss-grp {
+		fsl,pins = <
+			/* gps reset: input with pull-up */
+			IMX8DXL_SNVS_TAMPER_OUT4_LSIO_GPIO2_IO08_IN	0x0000021
+			/* gps interrupt: io without pull-up */
+			IMX8DXL_SNVS_TAMPER_IN0_LSIO_GPIO2_IO09_IN	0x0000061
+		>;
+	};
+
+	gnss_pps_pins: pinctrl-gnss-pps-grp {
+		fsl,pins = <
+			/* gps timepulse: input without pull-up */
+			IMX8DXL_SNVS_TAMPER_OUT2_LSIO_GPIO2_IO06_IN	0x0000061
+		>;
+	};
+
+	i2c2_gpio_pins: pinctrl-i2c2-gpio-grp {
+		fsl,pins = <
+			/* io with pull-up and weak drive */
+			IMX8DXL_SPI1_SCK_LSIO_GPIO3_IO00		0x00000021
+			/* io with pull-up, weak drive, open-drain */
+			IMX8DXL_SPI1_SDO_LSIO_GPIO3_IO01		0x02000021
+		>;
+	};
+
+	i2c2_pins: pinctrl-i2c2-grp {
+		fsl,pins = <
+			/* io with pull-up and weak drive */
+			IMX8DXL_SPI1_SCK_ADMA_I2C2_SDA			0x06000021
+			IMX8DXL_SPI1_SDO_ADMA_I2C2_SCL			0x06000021
+		>;
+	};
+
+	i2c3_gpio_pins: pinctrl-i2c3-gpio-grp {
+		fsl,pins = <
+			/* io with pull-up and weak drive */
+			IMX8DXL_SPI1_CS0_LSIO_GPIO3_IO03		0x00000021
+			/* io with pull-up, weak drive, open-drain */
+			IMX8DXL_SPI1_SDI_LSIO_GPIO3_IO02		0x02000021
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			/* io with pull-up and weak drive */
+			IMX8DXL_SPI1_CS0_ADMA_I2C3_SDA			0x06000021
+			IMX8DXL_SPI1_SDI_ADMA_I2C3_SCL			0x06000021
+		>;
+	};
+
+	imu_pins: pinctrl-imu-grp {
+		fsl,pins = <
+			/* interrupt: io with pull-down */
+			IMX8DXL_SNVS_TAMPER_IN2_LSIO_GPIO2_IO11_IN	0x0000041
+		>;
+	};
+
+	lpspi2_pins: pinctrl-lpspi2-grp {
+		fsl,pins = <
+			IMX8DXL_USDHC1_RESET_B_ADMA_SPI2_SCK		0x600004c
+			IMX8DXL_USDHC1_VSELECT_ADMA_SPI2_SDO		0x600004c
+			IMX8DXL_USDHC1_WP_ADMA_SPI2_SDI			0x600004c
+			IMX8DXL_USDHC1_CD_B_LSIO_GPIO4_IO22		0x6000021
+		>;
+	};
+
+	lpuart0_pins: pinctrl-lpuart0-grp {
+		fsl,pins = <
+			IMX8DXL_UART0_RX_ADMA_UART0_RX			0x06000020
+			IMX8DXL_UART0_TX_ADMA_UART0_TX			0x06000020
+		>;
+	};
+
+	lpuart2_pins: pinctrl-lpuart2-grp {
+		fsl,pins = <
+			IMX8DXL_UART2_TX_ADMA_UART2_TX			0x06000020
+			IMX8DXL_UART2_RX_ADMA_UART2_RX			0x06000020
+		>;
+	};
+
+	magnetometer_pins: pinctrl-magnetometer-grp {
+		fsl,pins = <
+			/* interrupt: io with pull-down */
+			IMX8DXL_SNVS_TAMPER_IN1_LSIO_GPIO2_IO10_IN	0x0000041
+		>;
+	};
+
+	regulator_1_2_pins: pinctrl-regulator-1-2-grp {
+		fsl,pins = <
+			/* io without pull-up */
+			/* has etxernal pull-down */
+			IMX8DXL_ADC_IN5_LSIO_GPIO1_IO13			0x0000061
+		>;
+	};
+
+	regulator_1_6_pins: pinctrl-regulator-1-6-grp {
+		fsl,pins = <
+			/* io without pull-up */
+			/* has etxernal pull-down */
+			IMX8DXL_ADC_IN4_LSIO_GPIO1_IO14			0x0000061
+		>;
+	};
+
+	regulator_1_8_se_pins: pinctrl-regulator-1-8-secure-element-grp {
+		fsl,pins = <
+			/* v2x-secure-element power switch: io with pull-down */
+			IMX8DXL_QSPI0B_DATA0_LSIO_GPIO3_IO18		0x0000041
+		>;
+	};
+
+	se_pins: pinctrl-secure-element-grp {
+		fsl,pins = <
+			/* v2x-secure-element reset: io with pull-up */
+			IMX8DXL_QSPI0B_DATA1_LSIO_GPIO3_IO19		0x0000021
+
+			/*
+			 * v2x-secure-element gpio0: io with pull-up
+			 * pulled low by sxf after boot indicating ready for commands
+			 */
+			IMX8DXL_QSPI0B_DATA2_LSIO_GPIO3_IO20		0x0000021
+
+			/* v2x-secure-element gpio1: io with pull-up */
+			IMX8DXL_QSPI0B_DATA3_LSIO_GPIO3_IO21		0x0000021
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			IMX8DXL_EMMC0_CLK_CONN_EMMC0_CLK		0x06000041
+			IMX8DXL_EMMC0_CMD_CONN_EMMC0_CMD		0x00000021
+			IMX8DXL_EMMC0_DATA0_CONN_EMMC0_DATA0		0x00000021
+			IMX8DXL_EMMC0_DATA1_CONN_EMMC0_DATA1		0x00000021
+			IMX8DXL_EMMC0_DATA2_CONN_EMMC0_DATA2		0x00000021
+			IMX8DXL_EMMC0_DATA3_CONN_EMMC0_DATA3		0x00000021
+			IMX8DXL_EMMC0_DATA4_CONN_EMMC0_DATA4		0x00000021
+			IMX8DXL_EMMC0_DATA5_CONN_EMMC0_DATA5		0x00000021
+			IMX8DXL_EMMC0_DATA6_CONN_EMMC0_DATA6		0x00000021
+			IMX8DXL_EMMC0_DATA7_CONN_EMMC0_DATA7		0x00000021
+			IMX8DXL_EMMC0_STROBE_CONN_EMMC0_STROBE		0x00000041
+			IMX8DXL_EMMC0_RESET_B_CONN_EMMC0_RESET_B	0x00000061
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			IMX8DXL_ENET0_RGMII_RXC_CONN_USDHC1_CLK		0x06000040
+			IMX8DXL_ENET0_RGMII_RX_CTL_CONN_USDHC1_CMD	0x00000021
+			IMX8DXL_ENET0_RGMII_RXD0_CONN_USDHC1_DATA0	0x00000021
+			IMX8DXL_ENET0_RGMII_RXD1_CONN_USDHC1_DATA1	0x00000021
+			IMX8DXL_ENET0_RGMII_RXD2_CONN_USDHC1_DATA2	0x00000021
+			IMX8DXL_ENET0_RGMII_RXD3_CONN_USDHC1_DATA3	0x00000021
+		>;
+	};
+};
+
+&lpspi2 {
+	cs-gpios = <&lsio_gpio4 22 GPIO_ACTIVE_LOW>;
+	num-cs = <1>;
+	pinctrl-0 = <&lpspi2_pins>, <&se_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* console */
+&lpuart0 {
+	pinctrl-0 = <&lpuart0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+/* gnss */
+&lpuart2 {
+	pinctrl-0 = <&lpuart2_pins>, <&gnss_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&lsio_gpio3 {
+	gpio-line-names = "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "",
+			  "", "", "", "SXF_RST", "SXF_GPIO0", "SXF_GPIO1", "", "",
+			  "", "", "", "", "", "", "", "";
+};
+
+&lsio_mu5 {
+	status = "okay";
+};
+
+/* OTG port for boot */
+&usbotg1 {
+	adp-disable;
+	disable-over-current;
+	dr_mode = "peripheral";
+	hnp-disable;
+	power-active-high;
+	srp-disable;
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
+/* eMMC */
+&usdhc1 {
+	bus-width = <8>;
+	cap-mmc-hw-reset;
+	non-removable;
+	no-sd;
+	no-sdio;
+	pinctrl-0 = <&usdhc1_pins>;
+	pinctrl-1 = <&usdhc1_pins>;
+	pinctrl-2 = <&usdhc1_pins>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	status = "okay";
+};
+
+/* DSRC Radio */
+&usdhc2 {
+	bus-width = <4>;
+	keep-power-in-suspend;
+	max-frequency = <40000000>;
+	non-removable;
+	no-sd;
+	pinctrl-0 = <&usdhc2_pins>, <&dsrc_pins>;
+	pinctrl-names = "default";
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
index 3cdb0bc0ab721..16d4280a1ae65 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
@@ -10,7 +10,6 @@ / {
 	compatible = "solidrun,imx8mp-sr-som", "fsl,imx8mp";
 
 	chosen {
-		bootargs = "earlycon=ec_imx6q,0x30890000,115200";
 		stdout-path = &uart2;
 	};
 

-- 
2.51.0

