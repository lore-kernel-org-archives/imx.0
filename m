Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023100.outbound.protection.outlook.com [52.101.72.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B832E3B840F
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.100
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596763; cv=fail; b=ASxDUij8E6YdJE2nifr3qtQMkPRtCJonUP6QV26wY7YKhn2Pq+yvTVHsgMkVug8rWu7SP5MQZ/HCqU3Bz6Voly4dyJR+SQa06NEPIelCjHESwTCBlmvjyp8WStpjHDbwQjtt/A5pVVudw/5tdEvAOytx/TKr1SYAJBROcjHOQ20=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596763; c=relaxed/simple;
	bh=BU/qCGOsYEr0Tk85vpuA4WpPSPuP8bFuhyqABQIR2N0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=MOpJDQ4EOhF5qvR4SFXwi2NUUI9GcT0n8cPd/UoON2ZoOu026pdm8fQTQwhVEpWl7dysGkTJCyqORjtdWiVPlR9BcPRO6GW0ArqJpHGmhEZ40mcqIf9/TmiNoAWDcrVjrXPxMh+7CHHamXSMzqSLyccKafzoTG9/EdYJSekgiMQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=boGRs0zd; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=boGRs0zd; arc=fail smtp.client-ip=52.101.72.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="boGRs0zd";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="boGRs0zd"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oHiV/SJJcRwErwcu6GqmsnC9HBAoTboukssEO/aepxqi2JRLx5ScM8uRcFyA5oWjKXxL7klq4OHXkwc+kGs0UmlP4JN0jJ9mxaFkEA+UvFftY/2d1J3PrTnvd9i7E2d5sVNPbNCWjyHylL57lWQDKEJ1NY/1jQWZ0tnhxquoRThvQNmGWoGJecbvkzMcpJvu+cq5Lama82JJF1b07axo4WdXfcV2IlHmmiYl8Gnwa2gPcq0JiodhGp2eyBdqgc7x3UUthLvr6BYOmkRNuK6nZlu0FiKt4+lvXUKxh98LbKnB2jxRn7ZbeP2vtRVZLqGGvOgqhNbdWRxPiTebQvTB9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaJO9Q9EEBlMUBngx+2woLtn9T0OWjefgGr2QrgiuEk=;
 b=Ow+/vHO9lIyWFEpCbbI+liInaScxZAUElC13mif19buKlcgYOOmzED4oeMoM7CUfRNlYzH+GaOZLHmuxwc4awPbja8j/a5z2hkdkDV7ceOBTCWSd2Jj1im5r5daJLNxDOZSggOWz5Dm3Oc/bhmiQD1XQuumMAhDrhhCdUIkxLVrBuO0SsnrNiPMVP4KY6ojfRn6bpG7hm7qdJZGOUMgLZrWZ62MGiJC1eqguKUJHmcRaR856SQrgdrVbMfW781dL2/fIklDuh89l/x1MhEKoE5UWmQUSgppC3VlXE/ckd4986BEYgw3wjcmSZHUEgc9G6/j4QjrhUihSqtEmarqhLA==
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
 bh=vaJO9Q9EEBlMUBngx+2woLtn9T0OWjefgGr2QrgiuEk=;
 b=boGRs0zdE+c+YmBsH/QEFVHqLzBxF4Tsq+EuI/SulTqg9VXP3dpP8eWs03sqOoZK5wWoYTl0kS9rf19lSDC6y1qEcC/AT94ihp098c+dwtLsRZy6l5x/1tzoQcxjN4E2zZypeJ6zWMrK89E/07Cmfcgg0embh42C+XTO+5wdeMo9mf4oakl0GkvxTSAUCezU6fxVe2W9eH00cZ2b5C9Iw57AdIgvyZbIdfFc8oP4CczRUs6uZ9LMshQ5lR/GIwM9UIFp+uLMsTLlnDjLPZNCPMQ21LQM1+snOkoS0h8NvYM/6u/+zwP2MiI7bY96snIL/9VeB+LTo4hXph7YkBtqsw==
Received: from DU7PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::20) by AM9PR04MB7682.eurprd04.prod.outlook.com
 (2603:10a6:20b:2db::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 14:39:17 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:50e:cafe::e) by DU7PR01CA0038.outlook.office365.com
 (2603:10a6:10:50e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 14:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 14:39:17 +0000
Received: from emails-9597773-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 02E047FE88;
	Tue, 12 May 2026 14:39:17 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:03 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gixuc2B2JMZFPxCLDwkA5ek68upicIoAO5Wz0CKXzaeCy17qbG+GOQcdYZRtQb2N+DXdqywiF/CPDT/Ts/LO0AG0VwmsYAHcgDBCp+iHxvGDuQEMc9T6Dt6Fjwm+y5XoViro9cfabh9wkPdjeghUOofs739bzo7O/D5MWmhbBooKfagt6FOzBpe4u3OE7UquIaK72401nc3kRb0ZaEvX9Nu0Yz2O/TFPC3dKsjKnYRl1MSPi4KL4Lo8xP7SIjtnisIVeecCprxj7EHQTZz8v4hGBvIRrTji9w//DU9KTLzcQ0mK8l3v6ot5i7qdeGwkfoWbRpTpewkKxtkViML029A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaJO9Q9EEBlMUBngx+2woLtn9T0OWjefgGr2QrgiuEk=;
 b=cjW4Zca8M3HrwMsW2Y/avI2ZRoruA0q549FnXtopyEhEYGzx/dFoRsRAAG1ah44emW+2tARdt8cXEXoDWk9Qc7EqaBZHUm8RjVKM9+ZOaNo6MY3H61Fnet+GUtUbA8os2stPOIB3ICaqQfsMPmZ1PT9gycubzTojdmpwhX5tuIY1FG59DhANdoTqfY3ay2qQIUl9CpZ8VCgKuLNHqvdtTvTVmocN84PAQ/ESZpsFc0NbENEvw9PLKMh1ZX/ciTqzR9WoIPwryiZutg3uDlbsSm7ddn625ExSZhWrdomR1lTpqR7MIeJ08zQtcZo1dHL3HI0uKFVJG420EQF2dM7tzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaJO9Q9EEBlMUBngx+2woLtn9T0OWjefgGr2QrgiuEk=;
 b=boGRs0zdE+c+YmBsH/QEFVHqLzBxF4Tsq+EuI/SulTqg9VXP3dpP8eWs03sqOoZK5wWoYTl0kS9rf19lSDC6y1qEcC/AT94ihp098c+dwtLsRZy6l5x/1tzoQcxjN4E2zZypeJ6zWMrK89E/07Cmfcgg0embh42C+XTO+5wdeMo9mf4oakl0GkvxTSAUCezU6fxVe2W9eH00cZ2b5C9Iw57AdIgvyZbIdfFc8oP4CczRUs6uZ9LMshQ5lR/GIwM9UIFp+uLMsTLlnDjLPZNCPMQ21LQM1+snOkoS0h8NvYM/6u/+zwP2MiI7bY96snIL/9VeB+LTo4hXph7YkBtqsw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA4PR04MB7629.eurprd04.prod.outlook.com
 (2603:10a6:102:f2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:00 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:00 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v6 00/10] arm64: dts: lx2160a: cleanups, add new board,
 large pci bars
Date: Tue, 12 May 2026 16:38:55 +0200
Message-Id: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH87A2oC/23OwU7DMAwG4FeZcibIdhIn5QTahSMHbojDkqYs0
 minZFRDU9+dUGkaRT3a1vf7v4gSc4pFPGwuIscxlTT0deC7jQj7Xf8RZWrrLAhIA6KThzMhgzy
 GJLVvPTYcjeuUqOCYY5fOc9ibeHl63T6L97rep3Ia8vf8YsT5OKcpwr9pI0qUiq2y4DobPT+W4
 ZBamb/6+zB8zlEj3bimZsGpcvSNNpZbJlZrXF25gQbsgqvKvWcOQaN3XbPG9ZUzKKAF17/lYae
 gDdrGsFre3LhBWHAjQRoN3ilniMj+59M0/QAbzdp2qwEAAA==
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
	GVXPR04MB12057:EE_|PA4PR04MB7629:EE_|DU6PEPF0000B622:EE_|AM9PR04MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: f51782ae-004f-49d8-b7ef-08deb0343ece
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 PUxGQX7sA9gfjM45rrUkVCo8DAQDN9ScPYOYE1i1jppu9v+s4Sv4ICWzuJZPFUyGE+6tkBCgz5nTvIX4wxbn+hXVMuMRHnFJTnmjTS1y3aymCCqfPhflv27ViWNvfiFcxXABsfeRQ8Q3KkK3DpuwAoQjEPmTSyQahtZcR0aqacaVadf8OYMtYEQ/TvC8x60FGmnwL2l6cZIPkTCVgNH3JqI99Xs9F/lX6zJT6jSh6QhpWJySs1xeDERUBRqv8Z3VFFJHzRduUhl0MdU7zyf/L2ZXQJJ+RRrG98IF3bCpXwK94vhnMXZII15quloBaxo3Krb9soZ8vHMRcbLFT+XHCZbb5lX7CepyfzDj2Xxiy9KTbl5KB4mnEvXeqeBiZmtcaUmLuKDifTF+w4Z0O3VV/D7z3jGrkm6ivPmEr9+3ZdS+kFgyc3+lPc10NryP/Z9sWLPtfci2XVnXuWMFoacmPUnuKVnwKNSBxkSkzrxjgBfFcRNofwN24Z6mAAy1pGkAQ00hvzKved8L8q4jlyb10LOxO58u8HIs7JAqo1nfnsSzak/SlCNwjiPa6Kee4ZlqYe7JQikRcLfOFxJDuBCG0xYqfF00n3tOso6T+abr7g1lCqx6+4j4VJNGOKRRuXHpHi/g2tG48I1H+9IOrX45Ku2sUGBqUmvxmJv+BOnLePmRniSmoQF4o6Jk2k/iwgKWDaBHayl0U57atfxGPQpmEIUfUGl0twPpBUXK7LxrAsJ2k7y3Utpr4Ktp5/EpMlrZ7a627CQN2kCMEv4iFqPXMQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 M33NOuR6BvFIi79A3vg7PIFF6wTk8RXHBmz2x7mkeupGyVzJ4Fd98+iDtJkOLiumKnQU5UZWKNFRDNe+sjGHVhlRXcAN0H9XCKJrGwf06Jk6R+VEU1A8k03uJezmkA5ps4Ky1mJnHSUi9wVNYjqy9+xpWLJEg9LF+JbD3zp+4YPkSEZmryBd8StI+JU3sfcweRdNfpd77aPkTp3QXFtrRYtweDweo1qEr7gQsqZkn36zByELfl3XwYcH6DQgpnTTCpgEH2YX5I2AUQ4kIE9iJPQ/nDF1KfcN4ZGWTsC2KBUVDSMQMXl2uxPb05aM/9TIYdpSzHq3hq5qOEdbPHzx5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7629
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 60dfe33edf454433a5dfc0906f7503d8:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	254114bf-774d-4288-8ba1-08deb03434b1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|14060799003|82310400026|35042699022|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	gkh/rJww0AvN+Xh0sHyF7JPV/ZgIz6VczBfm70hGJW4MPqYNdLHUnlYxAl8Rd5CZYhayQ9jLEN+iCaPFZtMPtgeKgBB/8GjzCOC6cZHmkbsyk5FriAgJjvn2mRRQrWz+R5hEafPySn9vivYO+MTFFLQcGmY0tedGp44tKMz1mI2xqml3cmNT4WDggo+xKwF5jQEMgH3V/VRXQhh4k7qImn8E1+zLpOy0tleyC3zVNdnJkFBHhPiOaSKyRHEOIWlkfsrdyiJzW87euo5rLmb7Qzq5v4z/zyDlmfJ3eqFqASXZ1UYiH7mf61paDvIvUcoHOjEj7Uv3BkOicKJ1/MLKWxG4H3qUlspGp4QfeKEmcAQ6z7hq6dvfzHZ5IPp0yKDBIJFr8tGwaeTxPgqn/nxba0tUROpgz0nvhhj46ER7y9lf6X6+yC/lUEfKxxwGX9lrwuCFA8fZzMjxk+5jZLRi4y/CsHypekm6RRqMEomrE9owbe/KljkUr5LinL4dOmyxbOY8DNWgPIzF60EBRNp8dnzdvXd8kjJiky0YIYSbLyJICYXKNabfaail5r/U8CzFjRsvPGOmCPgZ0RrOBxZbZX1FcNg0rGVKoEuJwhERZCCAte6p9wJ1aZDowe+U6HN3AXrn8orxCICdZqwV7u3BIFfNPjdPVWYaeKvNYOH7IsOp/plmEqouYmQpkQGneRcNm2Q89nBdrc1EGcGfPqmUenIuG2yVD4xePDsVEfjbHFO2tooipfQEFHoXaehoqYX6C+0tMBIlUuo5HLN9f8MTl6+Z7vQJIIY7UB5u706uq7M=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hBe6ZOTq4jj1ZnSbp4dibRFJeuUaRnYPt6PlzZdIAoVOqpjSMfREGsD/WH1OpiuIYLi9tx0XGI11y9/MRNtpJbC9NSvWVw6O1VbLQFmWxpE192MeLeAkCo5uq0SCkfdaCFlCf9/GAlPGccV+ydBxu8fnLBr4lO8y29uexWPRsSyC5HQDs6mNL8OtinzEhOUo8iInQTRIIqR35ZAyBe2BhFobsRq0kw0sZQEhZ9q/VhhiiVWhHaHkVOtf5sxd/RXTchjJVdy964Y2/+AkFKrtYqFpCFFo40Bkx1Blysb9v4M27xLp7gC4rmAL2KN6T2pijcLgsFI59k0vB0XRkS6mBTJJOoDQsqI2B0Fb+KSLxj5jMjx8vNyu/p1mMTZT69bLai6UCs09Bqu6tSpcVz4S/mvIJSs65J9pI7dwjam1G2qEMLpEnzLytWq0PMV7NLdC
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:17.1280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f51782ae-004f-49d8-b7ef-08deb0343ece
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7682

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
Changes in v6:
- Add explanation why IORESOURCE_MEM_64 flag is not set.
- Fixed pci bar size 1GB/4GB typo in pcie4 node.
- Enable twins board pcie controller node.
- Fixed function-enumerator value for led-sfp-3.
- Reverted accidental change of clearfog-cx soc revision.
- Link to v5: https://lore.kernel.org/r/20260510-lx2160-pci-v5-0-540b83852227@solid-run.com

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
 .../boot/dts/freescale/fsl-lx2160a-half-twins.dts  | 826 +++++++++++++++++++++
 .../boot/dts/freescale/fsl-lx2160a-honeycomb.dts   |   2 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi |  30 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  61 +-
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    |  37 +-
 10 files changed, 913 insertions(+), 63 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20240118-lx2160-pci-4bdb196e58f3

Best regards,
-- 
Josua Mayer <josua@solid-run.com>

