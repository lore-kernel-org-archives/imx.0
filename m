Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020110.outbound.protection.outlook.com [52.101.84.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DECE286D70
	for <imx@lists.linux.dev>; Sun,  4 Jan 2026 13:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.110
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767534433; cv=fail; b=e4afdtejO7znA+bs5TBB15lvpID5INoxEp2Qifj3MbXb0XirXrpPpJvLjN2qskftpQ7GhCvAQ+pIQ6RaBE2W8+f/ONJTXMeGqMzTPiIZ3TV0qlANtsftWIycBElz9vqffmSwu9u5gVqlKemazL91NlLge2mxU9cYsZR9iwyEfcE=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767534433; c=relaxed/simple;
	bh=eC/YyDsQ8fGUfTCvIfV5G4aG6O/7888adDKGom0Y21c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SKXybSlFeLHu9OQWQK8lEO6RVcUaw390LAhxIYlbVq0Eiv1fJPYh2iaKQwaOwg9aQy1TzJsjRj0bGzcZ3mBGV7O12+inUXLkETxhl9v6HNROSfGE/fMhvJrO/KmwLU9+YR8xENFzIP1Lubzn0GdI0x9TLtpxokiSMf9p/0t4Mm4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=lEaEhKVe; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=lEaEhKVe; arc=fail smtp.client-ip=52.101.84.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="lEaEhKVe";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="lEaEhKVe"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hX/tLhbaeU/SdIGVPFL5yYSqlLg+2wbRw5AMMVbiap4kn/+yX6qQOgv5oO8ViNJCWEF7kkJpKWPLmlGYr7cCG0S0qmZ5jwtVwyOgyrh1fAD8HaxXGzULMp31gH6OLYzUAqtX2vvzEExf7g6y4Jda/E8YLYrYWjwiUZT+tw+cVQ1yuahT8f1O7do2dF+UVWfSW5m/qX4YWnzvZg8WdjUoWZ5CnMG++/GZIeXoedgzJeOeCDGGBL/8p1Z1TVFcaeMdGfD1ric/jMLpULEVAuXxz60impMhwB+Ip04uRhhRu228fzz5edj54QfpzBNUoeFiF9EKLfTOFJnoW6HP1GhdEQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udrG95zwlIqpSGyCiv47G9XvJhYC+1Cq7IaREl3SZ1Q=;
 b=te3rvs59OAyuttIBJvTqNS0kvwe/YI9GO7zdfYUmTSW0uWHkDeZSRe6Ug7FmwdzWwct/jm3vpYuS4wCY/kpuE3uWefwDE17gb2sTAV7sev9p9HQ2OLd/ph4oizE/TCp7wmeh9r50kzhH4txv7vSNWwDQx/IrvXFdJ8fIQRlxYz+lQjbKa+szGJLXGda2V1tQSLmgDjwRZMdBXLejVCqDwdYN3EWV1HF90caYtS12/48aWWBq2f1YgWUedBJIdirLh3/6dsAqf8MTzZHDDfRYVt4UxUf62hKI0IxN0z86mwmkT8D8iLDk0DKg4r+9rtEeNBtGPxftONzmLkzMS8zZYA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udrG95zwlIqpSGyCiv47G9XvJhYC+1Cq7IaREl3SZ1Q=;
 b=lEaEhKVene8YvdO/7ig612mxPiOYr1qwxzdiwxAKD/i7F6JfLrnNPzyxyaTZUMW7YV/YWAx7L2kM1ZF1+BszoBtxQWTmfqV89C+owNwi5H6BBEcvKFSaOCNYWAk1lbb4SPJkkyNZ6WN/O2eWuQvIvcnQTPuQNMoNlJmuxWq0J04=
Received: from AS4PR09CA0007.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::8)
 by DU4PR04MB10435.eurprd04.prod.outlook.com (2603:10a6:10:568::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 13:47:04 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::42) by AS4PR09CA0007.outlook.office365.com
 (2603:10a6:20b:5e0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sun, 4
 Jan 2026 13:47:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Sun, 4 Jan 2026 13:47:04 +0000
Received: from emails-7939707-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-114.eu-west-1.compute.internal [10.20.6.114])
	by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 3CDF97FF53;
	Sun,  4 Jan 2026 13:47:04 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767534424; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=udrG95zwlIqpSGyCiv47G9XvJhYC+1Cq7IaREl3SZ1Q=;
 b=SBlqkHy1e1YrrMYlmUjaFIIOjdGUhmoCS2Q0N6PWRvhI8HCw8Pt1LyHPBQf7sV12FX/Xq
 bJJ+94ZyDZPTCGyRu7JEqIe+FeukL7MdMCYj/Ni9Yg48Aa10o6ejB1FJPt428tTjF9guA53
 heyz+8r1M2zgI+96BemEq0k0KT1YRbc=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767534424;
 b=CaU0qj6gj87qFhsA7pybob/BY4YobZp7DGeB5LwUxBOxHetQgCkGrQDSPR8ps3k3IyF/y
 C6ukrgujzWPiEyoEDKLr4WQrhQ267c3P65AS//fwKs8swCyFbDPHUN/RW3SlKRO8FYyUJJ4
 gb7JmHRUgZpcSBznoJ8MziYOiq4lqpo=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBLy7jRrr8aUda+tOGLLXRSk/t6tfEGG5Iyv94d0c/ydrvtF/98LBr8k+kBGWbf0Ir0CoXoCVyDuhthYJ9Wo7O+rvxnVFjX/WKxTFxZ1GcDmTe4yLP7Q74c4bGwxK7Kc/d8vjfiF6DjGexlznvEufQ/OTUYqIs3BJlNRw4wACYFmLz+4QFEoHoQaLXMz7SbNyRXd5jPspJGkBVWlEdQDFM3k6BE+u1+cU7rwwQSyxf4XYAtPOS97DxaaTsWJO+MDZSKasNdbFPXCukwwYWoToQ1c0rwGw4aneKkcOeXk+in6KQebF6YVpy9xBUCxs7gMdm9HbiqSXseV2h6r4ozt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udrG95zwlIqpSGyCiv47G9XvJhYC+1Cq7IaREl3SZ1Q=;
 b=iuIb3Gh+jmivBjf5SMnJ/WEbua6qk1C5ugHnJrsWE4kx6W3agBk19ab9E6XOS0qyVr5A0sFwrnNJEM4XpZ40AYM5Cw1LCSRb6385HbdbEZNi41SmPPhnpO6kLtZubcdClTcvbYcrMrMFpNCSTQH/dtTi5gQi+0P4+pakr0JS27kuOXeEC3eIpZkH4y2Dxrav8X0CKoSfH3FLX4yVrE9ILukQISNinEJmNjcx3qsscROtAFymMzVzu/Fx37CUoDg2cc0HAZqkah+UmRj5CvaVCGWjjdquno8iuYwtbKeVv1uNDFXPNj8gc9+ODUpQbU8u6XU/E7eiK+5vqIjRNaXhnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udrG95zwlIqpSGyCiv47G9XvJhYC+1Cq7IaREl3SZ1Q=;
 b=lEaEhKVene8YvdO/7ig612mxPiOYr1qwxzdiwxAKD/i7F6JfLrnNPzyxyaTZUMW7YV/YWAx7L2kM1ZF1+BszoBtxQWTmfqV89C+owNwi5H6BBEcvKFSaOCNYWAk1lbb4SPJkkyNZ6WN/O2eWuQvIvcnQTPuQNMoNlJmuxWq0J04=
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com (2603:10a6:20b:408::11)
 by PA4PR04MB7536.eurprd04.prod.outlook.com (2603:10a6:102:e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 13:46:54 +0000
Received: from AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::fe8:fd92:aa32:e816]) by AM9PR04MB8747.eurprd04.prod.outlook.com
 ([fe80::fe8:fd92:aa32:e816%3]) with mapi id 15.20.9478.004; Sun, 4 Jan 2026
 13:46:53 +0000
From: Josua Mayer <josua@solid-run.com>
To: Rob Herring <robh@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer
	<s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v5 0/7] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Topic: [PATCH v5 0/7] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Index: AQHcezAdo1YChS2uyEq5UXzwrg6V+LU+9fiAgAMU0QA=
Date: Sun, 4 Jan 2026 13:46:53 +0000
Message-ID: <9369989.DvuYhMxLoT@josua-pc>
References: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
 <176736452823.3671482.4196945570874126466.robh@kernel.org>
In-Reply-To: <176736452823.3671482.4196945570874126466.robh@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	AM9PR04MB8747:EE_|PA4PR04MB7536:EE_|AM3PEPF0000A790:EE_|DU4PR04MB10435:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b4a85d-5f0b-4219-dbc0-08de4b97bec7
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?sFiS1+dGud7TOPwNgUQFl7BntZCRMpjbvFdy7iwDP5a8tB6W89FM2c043cCe?=
 =?us-ascii?Q?bIbYntVyVS+Wh4r3LZgEWaJBerlk+CoquDx1zUz5WCyNOYqntUolUnukmoY4?=
 =?us-ascii?Q?Wfw6K1HxL5KjXNpCaRBH1BkvvEwWW2r+tTSDmLr7Hw4W5MzTemkd9A7mF0nQ?=
 =?us-ascii?Q?t9LypOYSa6E8sQ38LKqzIBA6XuMm5DuHBmQ2YpxxzyawDTh1WH6tkNLHinFB?=
 =?us-ascii?Q?h2tKNiiMmeUJGcnJHJRiIaVH3QfdQyRZQc43c5mjCmWXqVGg/acVcME0x1+2?=
 =?us-ascii?Q?nzAwC9nL0SSH/ruwaBcze08C7y/p622yM9t+4Fcaj9sXUfhdMOAndN6qRonB?=
 =?us-ascii?Q?lvWqHayShmbsgYR/6RvDpyiieVDPSKJ2Bz3vRe4O0Y6fC/fPl60BR5GXfBqT?=
 =?us-ascii?Q?vkUxUDm0I7i9lLUKJtOBVRjRd5GEnmuDsKDoCPxSsos7uow1Yi4Wd00O7ghq?=
 =?us-ascii?Q?lJMASIat3e1S08lq9bceuIZGmJ5tccUaYNAoowaQwAWvXKOWdo5N/cas8Fq7?=
 =?us-ascii?Q?w29Fv9MQzHtt3q60bbbgR7ds7jcW/2NeY7idDUetdqG1+mN6OOt1gOOBhWkx?=
 =?us-ascii?Q?7vk0Fk+X19ayAr+eYIGsoJnyh9Ys76PbgC+4v61T428SB9ZmPAR230Bs1F+R?=
 =?us-ascii?Q?zt1Yi3yutR5e9TnY4yaRZ/DXMUhA8HU0S22W0KzKzp0LcdSe1xJva1gAMVnO?=
 =?us-ascii?Q?CqD6miaO6WdqZR1wiTbV584Wjf4zoNGkX2NntBdBRHFzhR3DiCytxxGeU9qm?=
 =?us-ascii?Q?DKAUHVfSt89cr7tRBCCRnL++H+es+m1nBskR3rnTu3qWtFeWL2TdTc/5KHxe?=
 =?us-ascii?Q?/CRLN16EG8EhiggmiBAwyEF2jqz6xR4ZdRKzROMW2RZw0gnUJQNaYaFmolTJ?=
 =?us-ascii?Q?d9Zv3/eECPVvjm5Q0KACkjCPF1vLOetkPsA25ZwZpJrOh3GIam0t6JQP7rz4?=
 =?us-ascii?Q?XnfG/QsTJcUjDaJuGu1a2p8Ju1tSZpPOc6xSrLuxJAAkQByEAdvqsuNguNJo?=
 =?us-ascii?Q?OnvQOT8xdkb7t9pVNOtjKs/qLGtCmQ6NnEUTWTeYqeukd4UWpzd6WTpcs0rw?=
 =?us-ascii?Q?Hjn9BTiKsMKrjhvr8GrHI6xekMde/dR6JLnY423eCdFnZoOhNu2BXOoiEcRP?=
 =?us-ascii?Q?IK8YF8ITW8Ea5GlItJ89sAgO+W3GiyveetJRaWHhYbaFRHxxQk9kp3VW9ovt?=
 =?us-ascii?Q?1BAFOGYvYXko7/CeJDVU43YrW8zfmqqhd72JB0G9oFUIOAHz2EmWPU1xk3Rl?=
 =?us-ascii?Q?b5LAWE50aTJ95x6+93pC/HIRKfiP58GaTkOjsTtW0Lqdqm7ujx7D3Vh3diVa?=
 =?us-ascii?Q?tjNDPzTBPZuji4sRkpSO7DVyfsf0OUpXyt86Iw5YdppOzPyunm9vZenmnf/m?=
 =?us-ascii?Q?sobqhfK5vTh6yuziDN/hAIpG+NCRpTtzJ02tJ+dF1ngeLG3PxjDtGAXdfnXD?=
 =?us-ascii?Q?8bwUymlQ/JgD9rLzjI0tadc5ObL0akjPJp+AVYjqystVO6+4ZO/ONzGBqOHE?=
 =?us-ascii?Q?oHyM/eqLWEebYlRc537xd3v0iqI4hHwC/tx/?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8747.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A22F1D2FEF114148AFE9EF0510CD75AD@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7536
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c2b9c14041f648e3a6339dd8d174f99b:solidrun,office365_emails,sent,inline:dadc4302bf77a73f8eec166e86794f33
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a7d389f-fde5-44c2-e00e-08de4b97b86a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|7416014|376014|82310400026|36860700013|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zMwI/WyTqWR4wDnfUfozUIvipdhjCizc0Kow9PGbGK9fi+/gNvsCjRlGLGjM?=
 =?us-ascii?Q?9ZsjDTD98WjTM74iUTdQ3cbUl917YksCIs+9NHuKKsbfeEgJu1HKs1EjGDoG?=
 =?us-ascii?Q?O29jwPKgi0wfWVo4lnuAlX6GPYzYP/I5NbRujYN/juzyGmqOsTnA4XRL2qfx?=
 =?us-ascii?Q?8Q9vQGWaP0pZSrraG9y0YAKbo0z8kp9Am0qEixi+4FZFp5Iw+Af0bf30bveq?=
 =?us-ascii?Q?9dzgEwneFrQE1z6XPJOBZ5T12p/QF2OpLPadSWWF9PzRM5Pyb/KBCCmu35Lp?=
 =?us-ascii?Q?FuM+d/69y4ZFmxBOwzn/RUCqbjL1bSIQQI31ahOP+LKExRMUd7/SVN+K24MN?=
 =?us-ascii?Q?V2n6nz9R3pmtzwOOQDo2/TnEIMn6Ztzdky2YWN3kvGCRh+iR2xII6J5KMYMU?=
 =?us-ascii?Q?0r9dMO7+5yxf37WdzmV9nlipueMG3BEg7KnZk/68EAj7lU0+6Ul7+ivRmb4S?=
 =?us-ascii?Q?81Xf5E6l+7ubIVZEmaPOXy5EAOkvS5a/vOScFeji/xD888ynSkWVgVJwI9rp?=
 =?us-ascii?Q?zC4euUcOyXSa5xcMqttFGV9I1U42iAC1ADUo8p5iTy9rBe2/1SojvXiI/vzq?=
 =?us-ascii?Q?AgMorpigEeja+eD9mgaCWikbWw9/KQJh80aEcHFgU6Ktq6r32AIKZgyevZR2?=
 =?us-ascii?Q?gZQPJIiMR/4TAB8gw8pAvZaRY456vhpf9YR0ETmU/oettM+TM2mxdppeu8wV?=
 =?us-ascii?Q?yXL+twMFGf29JI2W8DdvmN2AOnCRXpU+wGgPAZeNW8GXCgUrcrXaF6PR0rcj?=
 =?us-ascii?Q?Jwkxc5yvvUUUsFJmwO5GJQecv3mPfjya0Zztx/1TVThAFkrTu2apX9tpsIzc?=
 =?us-ascii?Q?aVyioOKpODVbkE3KM6iVaA6A/rxfpznTspuLr2Q1yZBkQI+PYtIU9d5O5HWU?=
 =?us-ascii?Q?Y38JcrA7dO51Ffnu9zuEi5tRCtQM5c8ksWL7WZ/yKwVgHCdUpbE79PiyUjQP?=
 =?us-ascii?Q?yBisA4z7Yc19pgnvy+K5HlzySJN76pGl3WI43NYGOkzJZVeM2lGMZm+vtCG0?=
 =?us-ascii?Q?TjIEk2qaOJ/vsxeASl8qaHbogaWl/PxwRn502KZ8Ewfryc6FexKZ2rYlysH4?=
 =?us-ascii?Q?I7FLuFCWXRhd97UifGT+Kj8JfABdCmPm6CBZB3tm/PyohSA0IGikpfs9u4iB?=
 =?us-ascii?Q?I9v7upsy5ltXInERXK9AqCcJZsMUHseJG3XSQniaUVf1EFY02NU5oIfZ7xqd?=
 =?us-ascii?Q?H791N1IYNSYcyMbDk8biFtENDi/pmC24Rv+n9Qaj4fIcv4GBT96jSwAtKm0u?=
 =?us-ascii?Q?bhSJTk2xqur8JVfCoGha9645B4VmHB/D4w+BbbgSTyAdNWsAa1etdBk2/e8j?=
 =?us-ascii?Q?4jCcz02pQBsgjRbCIB1B3YLJIl0OGe31RBQmC9TKE3uQwLqHcD207YGnKk8f?=
 =?us-ascii?Q?PjgemQfsoO919W2MAGl+aZY6ZTgIil55/oKbhywh8hrruYH0BEAEKgZIo8AK?=
 =?us-ascii?Q?Ll7cS4uWIJTJ5K62mVOWQCKX9hsALUoZ0vdbE5ln9jtO075K44KzsMMkoZfQ?=
 =?us-ascii?Q?evnRa17JArEqZN03Wkfwvlj2zE25RXbojYojGOtvB4r0DVBQnRwEJS1/BISG?=
 =?us-ascii?Q?45aJ+L1BvSTeu6RTiWo=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(7416014)(376014)(82310400026)(36860700013)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 13:47:04.5111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b4a85d-5f0b-4219-dbc0-08de4b97bec7
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10435

On Friday, 2 January 2026 16:43:35 IST Rob Herring wrote:
> On Thu, 01 Jan 2026 17:05:40 +0200, Josua Mayer wrote:
> > This patchset mainly adds description for 3 SolidRun boards:
> > - i.MX8MP Hummingboard IIoT
> > - SolidSense N8 Compact
> > - i.MX8MM Hummingboard Ripple
> >=20
> > This includes dt bindings and a range of bug-fixes:
> >=20
> > - dt bindings for the boards
> > - fix to dsi panel bindings referncing panel-common and adding port
> >=20
> >   property
> >=20
> > - cosmetic fix to some  solidrun imx8mp boards for regulator gpio
> >=20
> >    polarity
> >=20
> > - fix dsi hdmi bridge on hummingboard pulse
> > - compile dtbs with symbols to support overlays
> > - gpiod_set_value _can_sleep conversion for panel and touchscreen
> >=20
> >    drivers
> >=20
> > Open Questions:
> >=20
> > - How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
> >=20
> >   (affects imx8mm-hummingboard-ripple.dts)
> >=20
> > - Is "description for" implied not only on dt-bindings patches, but als=
o
> >=20
> >   dts? E.g. is this commit subject acceptable?:
> >   "arm64: dts: add solidrun solidsense-n8 board"
> >=20
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Shawn Guo <shawnguo@kernel.org>
> > To: Sascha Hauer <s.hauer@pengutronix.de>
> > To: Pengutronix Kernel Team <kernel@pengutronix.de>
> > To: Fabio Estevam <festevam@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Cc: linux-arm-kernel@lists.infradead.org
> > Signed-off-by: Josua Mayer <josua@solid-run.com>
> >=20
> > Changes in v6:
> > - imx8mm-hb-ripple: sorted i2c devices by address;
> >=20
> >   removed unnecessary newline.
> >   (Reported-by: Shawn Guo <shawnguo@kernel.org>)
> >=20
> > - hb-iiot dts: sorted aliases alphabetically;
> >=20
> >   fixed gpio flags for vmmc regulator;
> >   specified led@3 reg field in hexadecimal.
> >   (Reported-by: Shawn Guo <shawnguo@kernel.org>)
> >=20
> > Changes in v5:
> > - rebased on v6.19-rc1
> > - dropped ilitek-ts patch already picked into input-next
> > - solidsense-n8 / imx8mm-sr-som: drop untested wake-on-lan support
> > - hb-iiot: disable software unsupported rtc timer irq
> > - hb-iiot: fix wrong pins selected for uart4
> > - Link to v4:
> > https://lore.kernel.org/r/20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@sol=
id
> > -run.com
> >=20
> > Changes in v4:
> > - dropped patches already picked into drm-misc-next
> > - ronbo panel: picked up reviewed-by tag
> >=20
> >   (Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>)
> >=20
> > - ilitek-ts: changed mdelay calls on reset path to fsleep
> >=20
> >   (Note Dmitry requested msleep/usleep_range)
> >   (Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>)
> >=20
> > - changed hummingboard-iiot tpm irq type to level
> > - Link to v3:
> > https://lore.kernel.org/r/20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@sol=
id
> > -run.com
> >=20
> > Changes in v3:
> > - sinmplified language in gpiod_can_sleep patches.
> >=20
> >   (Reported-By: Frank Li <Frank.li@nxp.com>)
> >=20
> > - collected ack on winstar lvds panel binding
> >=20
> >   (Acked-by: Conor Dooley <conor.dooley@microchip.com>)
> >=20
> > - Link to v2:
> > https://lore.kernel.org/r/20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@sol=
id
> > -run.com
> >=20
> > Changes in v2:
> > - fix spelling mistakes in commit descriptions.
> >=20
> > - remove redundant "binding for" from subject:
> >   https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devic=
etr
> >   ee/bindings/submitting-patches.rst (Reported-by: Krzysztof Kozlowski
> >   <krzk@kernel.org>)
> >=20
> > - remove one useless comment from imx8mm-sr-som.dtsi to fix long line
> >=20
> >   warning.
> >=20
> > - change ronbo panel binding to inherit panel-common and switch
> >=20
> >   additionalProperties to unevaluatedProperties.
> >   (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
> >=20
> > - add dt binding for winstar lvds panel
> > - fix dtbs_check for dsi & lvds panel addons
> > - change n8 board dts comment-style in header
> > - collected ack on solidrun boards bindings patch (patch 1 in the serie=
s)
> >=20
> >   (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
> >=20
> > - added standard led label property to hb-iiot multi-purpose leds
> >=20
> >   ensuring consistent names in case lp5562 driver starts using it.
> >=20
> > - Link to v1:
> > https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@sol=
id
> > -run.com
> >=20
> > ---
> >=20
> > Josua Mayer (7):
> >       dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
> >       arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio
> >       polarity
> >       arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port
> >       reference
> >       arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay
> >       support
> >       arm64: dts: add description for solidrun imx8mp hummingboard-iiot
> >       arm64: dts: add description for solidrun solidsense-n8 board
> >       arm64: dts: add description for solidrun i.mx8mm som and evb
> > =20
> >  Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
> >  arch/arm64/boot/dts/freescale/Makefile             |  15 +
> >  .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
> >  arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 ++++++++++
> >  .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 851
> >  +++++++++++++++++++++ arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts=
 =20
> >  |   2 +-
> >  ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
> >  ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
> >  .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
> >  .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
> >  .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 719
> >  +++++++++++++++++
> >  .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
> >  .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
> >  13 files changed, 2538 insertions(+), 9 deletions(-)
> >=20
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20251026-imx8mp-hb-iiot-525b03beea62
> >=20
> > Best regards,
> > --
> > Josua Mayer <josua@solid-run.com>
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: 8f0b4cce4481fb22653697cced8d0d04027cb1e8 (use --merge-base to
> override)
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/freesca=
le/'
> for 20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com:
>=20
> scripts/Makefile.dtbs:20: .dtbo is not applied to any base:
> imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
> imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
> imx8mp-hummingboard-iiot-rs485-a.dtbo imx8mp-hummingboard-iiot-rs485-b.dt=
bo

These overlays are not applied to anything on purpose,
as we don't want to create a dtb for each possible combination.

Is there any advice what to do in this case?


