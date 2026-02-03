Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A722DA779
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105636; cv=fail; b=cAD8vGeREaHVP6Q3sqt6R1ygjM0lwEE6l1bIAl76RDqNE5UdDKriJfy+uDoQhr9g9ZVufMHuiSeEP/bz9Tpz2kpVshKKpNF6XOmLdXbBDTCzUzlRkXLc/owi39ZUu2xX5fJdv1nWxxVrHU8TLCSsqftwDlYVWlCifhYkMw09pbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105636; c=relaxed/simple;
	bh=rQNfEl+HuAtC5EHJzzHil91De7npWjdFTuRfjTvtNFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gDfT68dqd2dMp9fPfhpT1TVjyEa3Er0iqLxxb3YYgaquhcAhpMSGI5umAgBYzDrsbWSd2/caiXDIZTEZW7RZnox5xUW/lg53vn0tyG8wyp13t2hz8wazS2vhEI3WB4NnmizztKTvNUswqVwf2wSpDHZThBRF7Pc84Ci3YtGAbj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BKLGFvnj; arc=fail smtp.client-ip=52.101.84.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BKLGFvnj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSFoaJBQCe9pgY2SaM//E0OalC3TT6FRK/EzZe1WQfIC6lAyp5RcxZjNi4QTmj1qMToOv+D1E2BerZrF4V9NVHTWClZx3bC+rmJNOl6mFI5AsPhVLdOUhpR9vgEC+5h2fKuwE1VbgmnRjW2uiWipugrB4XWDayPVUawnBoindaotmaOX9x/iftq9OHPXkJgPaKYpyx8xEoFWShIn+vNo9y7KqdA+9ijhq/t3aMpq5t0EDs0P/2m2bdy/DeTM1BEcVk3vemgHhWP8NvVpoYBzznmSqiauY/h9m2Au5+w0AxpSemkXFMIaq7C0+g+L7QJZZEmiCJHk7Q5oDqJv3z2qsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iFi8SDdHB27/rI4CW6aay78RTJ9oIf3oka9iAITAvc=;
 b=scf8xE8uLGd3/4js4rw2gGvlmQTlDQeo8NAc7GNgzKzbFf5whZsfoAlK20Uz+Tho3Ty8vKdrMWznQ+SGp7gndCaHHgSHGXJY1iLYne5cAOHNnkP3Z8SnKWlg1vOwwUC9RBTHjfWqbHCmwTXHyShiORXgP4SHZZdyDvpZlotnfZnu8nlPSudZVp4YW+giyStcDtbIqBpam3ZtZvTqQNNmLrcE2udaeRprToMo4+b1+C83l94fI8NWf3qglUhFyB/qelbytYB+gYqMvYp1lSZ08zQTFXncI7cEAIrmqIFrieVIAmNJ7ij8RSYpn2VC9vEbQme12UZTRCKA9KHhj86HTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iFi8SDdHB27/rI4CW6aay78RTJ9oIf3oka9iAITAvc=;
 b=BKLGFvnjSRNEIgbWe65oZe8UMQH3oq1zPvUKuIKetHUrImCyrmGuiBlL8Wlhgud5viRbGKU2bt9pOa0kjLcFo9uDLxxNHI4cnh8SPSpbb5HTED7goaFTkmJguyd07fXdN9sIvHsdkm+9pl0YXdgCI9q0tm8OkJ4MV8iGARgILN4FPtow3yFpYj1E6zrxiEpJ5DqaycL98ihAMc7Ai5iQ96tSN4MVwJ+guGrdhixByodOfPKuXDXjS5GmKe6n01XUEl6FuJDkPwFzA1+XberCDnq2xzvDRqfjAiMUj5Ea9+DkrwSfFVrqvV2PU+KC//XX89huPcLEuSuCYNGodmpejA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
 by DU4PR04MB11983.eurprd04.prod.outlook.com (2603:10a6:10:61d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:00:31 +0000
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944]) by GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:00:31 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V5 0/5] arm64: dts: imx93: Add i.MX93 Wireless EVK and refactor common parts
Date: Tue,  3 Feb 2026 16:01:32 +0800
Message-Id: <20260203080137.1492376-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12102:EE_|DU4PR04MB11983:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e65c7ad-92d7-4925-f80e-08de62fa4d51
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?qNLXO33LLs6OPCZn5WoyCLD0a9zFg/mXb8/q6uhTQ1csKC849JBb6k08Ao6n?=
 =?us-ascii?Q?gh8y/A2NQ2k21MDyrDbCQiDK7EYf5+Ne0Q6ysz4PV+JvlZbtU1/ix3egbCF9?=
 =?us-ascii?Q?pUMsiGVLiDtBGcdlgy4P1oFfRx+7cLmwkYjyRA7bwJWjMkVJ4R8BaAWRtJs8?=
 =?us-ascii?Q?m4GyapZgaDcXu+Z3SUcdJ2eaob5Szvy9w6/wIpnClAAjMg9Olz+N6RhvF29m?=
 =?us-ascii?Q?3ayrSyL+UGdiEMx/61MY6MxdY+ol5oqzKEyUKzUW/o0O1BW1pHCUbGTq9R3a?=
 =?us-ascii?Q?XdwahPCQAyMY3EWkAcURoAYtTZbZj0giD31nURBlbMfHm6oXWT2kVAJAYGDi?=
 =?us-ascii?Q?vvT4sZngCxoA4j7t7y1RvHBDMNf/OBdm054RiBSVPdYT+nqF4dY5+avRyw7P?=
 =?us-ascii?Q?u2urG5/FBvTBs6lii95d/OHZRh4MwEzxrR2YI6Q+edEy/7XmZWSdCfUjYX6l?=
 =?us-ascii?Q?4ZKop4P1EZmZLtlVfki1LZju7WTHJMcb/Qs6NqEkap0+r5fzc1oHurjji8iq?=
 =?us-ascii?Q?8OdgMrreOLfX5uVtnOT9RjWcf3HjFIP4TSGhW62pSnHGSzCyDP2uZAM8z288?=
 =?us-ascii?Q?6EHVsDookApTU9sm2alGdF654hyJKI8VnSJ9kvgHg4ijYvQRnYBGioek+L7T?=
 =?us-ascii?Q?lrq+YuOPHMXDBmXUaXASEhOyV+NN2DW+IJ7UPSo1HKoHIOCZ6RqnbquRh8+n?=
 =?us-ascii?Q?jAqS0D93QWWA1aO+Vl0hlQU5XLC9EsKP1Sbtt9UeNXJA7ZitR0QZmFfanaWR?=
 =?us-ascii?Q?/MOLrDxSAQ2r+hOtG39mMs/IIAwl/il8Uzy1DMT+wkoyCSBSJ9OOUWmD7nox?=
 =?us-ascii?Q?B1nwzQ1xNcevxxgLZFVUgm88TsUgjdQ4j1JQFVlHXkPgkf0S9FoF+BBK7JpG?=
 =?us-ascii?Q?MQZo5qLg36oItmlHuCX0flKZJh1NS5/zzo1iwWoDK5WRbs9Ch4gfwpCgIQo4?=
 =?us-ascii?Q?eivs5o09GdaRbYYpy6lqdbe8Pu+JJ56LQ0EFN5DRbgGO8DF6Ds6wteIDPlTM?=
 =?us-ascii?Q?kdiPIAR/mikpkvftn0qMRMKkUlwbbRxW7L+2hMOwuLSlpAOU3i6rx2Ha1FFT?=
 =?us-ascii?Q?sZrQB3UMxgkciFmUuNnLjmu6uBtMsG9jrLiO5tdewUKxAYeWDFajUA2PMAEP?=
 =?us-ascii?Q?PQnDeUU9JYUEPwbxemGkEeghgtLYCbJcFblZiYvKbYJCgFGlsffaw1DkrXge?=
 =?us-ascii?Q?jGp6ZRppt1vpNvEDAE8l5yJabh5MmQh+B/ff5FXzdNhnkOUtewyCOakqxmQ6?=
 =?us-ascii?Q?ujTDBQu5hTMD4SaUnRj0CXvB6FDrS4kOhWIMhtPAbumUmkyvTjwXn7nI56Lv?=
 =?us-ascii?Q?0lqSNRbj+Y3T8PVLhEeXxkx9PE5tTYJ4dEHaWUqLwNWnKIUxE9AOLspmcoi3?=
 =?us-ascii?Q?mWk3VUoLzF0GfffwfEZA9OD563uuwcTSIyEo0zBdrxAvexvh/B8l77ZOUInw?=
 =?us-ascii?Q?BdoCgms2j1VQjV7qJP/ir//jgwS7aPQKCSajjM+woW/fPE08dNPtyzGY9dSX?=
 =?us-ascii?Q?SnvpjfKbVMjz+KKSfaAypeppOoBPU+TBjD9O67yHOw9Z3ipGDC/NNFdaxZHY?=
 =?us-ascii?Q?3F9r0EAwq/dsHaZn30Qq+xo8rIWdXoBkcoWuGBt6y1lXMV0MOFYzvp2rL8zl?=
 =?us-ascii?Q?6ef3tKcqdPC8AZ9pubWF0Aoc+Cst/D79UPlEHnM9yZau?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?0qpf7qfRkuc17uvXholtKJtaTyY/pVX7SSf6ZOxD+tcj5P9+scB/dbnN2aJ4?=
 =?us-ascii?Q?Rgt8LzagzDtGpknwXPcyQdUGF5C7v/drW53qEgt46c4HmYfoiWno3R03BSkp?=
 =?us-ascii?Q?816ECrWf7ci0ciO31mJBg9Tmrs8mwyHW/GXXLt8O0kG4D5YFM+cduLjFzkrV?=
 =?us-ascii?Q?K+FWRHxENvpqnCR9DdN6zbeG6N/Sr/Ij42ctYtDqh+O2HONkhO7KRiFSyA/i?=
 =?us-ascii?Q?2mA1Ez1PdbNmRth7YHnsKHX+AO25SN9YMPf9WG4Bfd7IelIPaeEmgCNPr8tG?=
 =?us-ascii?Q?dNVPjLZokPxWiVvSVvWEtP3yT8WvqGauKktAiPf4tWvxCqRrPsizXBm5gUkV?=
 =?us-ascii?Q?/Uonj+kN6nKY+4lAjouQpRZ1Xt67h36hRb8UXJ6el/KsRBDCV5H5IYVkm81k?=
 =?us-ascii?Q?vokAgz7KkHmAyZN5bToqB7lLfUrqHbTOixyw8R6P4R8CmXuoj0/WRbUkDSvf?=
 =?us-ascii?Q?DbrkiRQ1lUaL5/oA7QO42QoQ3+PFG5snqtvffAMNKGUVur0CcdsXu9Jt0ot4?=
 =?us-ascii?Q?9tNlCfU3anjyx1ESMjPiIrySjTkZr/pFwAfWcq722J2om23EOQYOkWDgDbD/?=
 =?us-ascii?Q?H4HGyFW1/oz/1PGi2OHHrYllx9Nj1qmNV/t94rOitbJuzhvhemgjafSywscR?=
 =?us-ascii?Q?TJwhmduV1UM4gw2+y2zpfPUu70RSM59NxxOgoI+mv45iRYLfmX2Sdi2izEJI?=
 =?us-ascii?Q?zb2IHRsV3Q8Em0j+qRCPtqWPXgQAhEyA9ArnRG+M6F/Y8d4l6jfzisFVnFme?=
 =?us-ascii?Q?0fxbTCoVpOSmC8op2/4eCvPQJZwwvqrrMsu2LhXNbqmV7w6xKWG+LVUhgvQl?=
 =?us-ascii?Q?Rz9VhvRL3Sg65uwCA8gTNE8X9R4xpDmSM1GEg6IL5U9Go8T9Ki1g+yWNVBVb?=
 =?us-ascii?Q?OFP84BUZRqxlrbD2VrlEfRQJYuEwFo2IQh9X+wWJEfLKXOXeB5EL543hEGVO?=
 =?us-ascii?Q?E2BZ7XlV9TKBgmXkOpM39I5C65Cvyq6L2GNhjLassMDEWcEYhS4XSi3ICDmp?=
 =?us-ascii?Q?9JMAxedNyhPS3AOLc2A/+DoLs/pJmIjqlCjDiO/AGCEW9AM8KWw1e4iLC2rr?=
 =?us-ascii?Q?KlKq5FuCYBfoye57RnAs5nhhR+P4FByt/bI4MB/HbZWY+i2aogt+c9MVovRj?=
 =?us-ascii?Q?fRG5Qy6F5wC/aYFFXKqk7XreksRkCHKzl/+7acAx3rcfln51WsjoCUJ1Ntmb?=
 =?us-ascii?Q?mQaX4SkCFOb3LmWKm0iUoV780EMuA9S6PlPectL9oII3mk1VW9c7SS+2wXw0?=
 =?us-ascii?Q?BgxDXJyru3ezSh82mX63KVSHeVY6y91JB3H3K95vujikvHIPfatFwno+TfVm?=
 =?us-ascii?Q?WyW2cLArPyEVncruGaouplrCd1wO22tw8jTiAKui/oJJ0m1Yr+S9efFP/Mvy?=
 =?us-ascii?Q?e11XpyFm0eftMFGgo7rZAg9pMqmsQ433I0S8XObLcAd2q2iHJqX80b0NwZGy?=
 =?us-ascii?Q?rSfT9Ynq1+odaZMOS35aZuE6O1WHdASw4q32q0v5RpaZx90xDya9LWQdq6au?=
 =?us-ascii?Q?AUeJQbaBx42ka6RVMFTg+2swF50ayDCVsf6enUXju4es5iknBEQLFklJ7K0a?=
 =?us-ascii?Q?mOjVxuDAAoC/emC6xk87MExA91Dr5oOQRqi9Us/Cjxu6rOnEOyzyfhbXM9NA?=
 =?us-ascii?Q?GLIjqbTMjh7lUAA40Y3vhYDZrDOy2Zfw6BM/dpMl6Rly2RXRp7JJI0psM+d2?=
 =?us-ascii?Q?kR5UY62cOU3++BaU0NKFFpj4lKhpGnF7GCm2F9/OSHPubz6EiRXp/rVwSDyw?=
 =?us-ascii?Q?pBDH8oc42Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e65c7ad-92d7-4925-f80e-08de62fa4d51
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:00:31.4678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyNkKSg2nz8UHW9T3SVz7Yfjp4r6DpRkRJDl0skvw5mPuxY1riwrw8HyarsBgggD1YWOp79SMRCjpxAXFqksug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11983

This patch set adds support for the NXP i.MX93 Wireless EVK and refactors
the existing i.MX93 11x11 EVK DTS to share the common parts via a new
imx93-evk-common.dtsi. The Wireless EVK integrates i.MX93 with an IW610
(WiFi + BLE + 802.15.4) SiP and reuses most of the 11x11 EVK design with
minor functional and pin connection differences.

Also introduce imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP so
that can be reused by multiple boards adopting the i.MX93 Wireless SiP.

---
Changes in V4:
1. Add patch#2 that rename the imx93-11x11-evk.dts to imx93-evk-common.dtsi
   and patch#3 move 11x11 EVK specific parts back to imx93-11x11-evk.dts for
   easy review.
2. Add Reviewed-by for patch#4.
3. Move the usdhc3 aliases to two EVK DTS files.
4. Keep imx93w-evk.dtb alphabet order in Makefile in patch#5.
5. Enable open drain for IW610 PDn pin to allow the IW610 JTAG connector to
   control the PDn status in patch#4.

Changes in V4:
1. Add imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP in patch#3 as
Frank suggested.
2. Modify imx93w-evk.dts to include the imx93w.dtsi in patch#4.

Changes in V3:
1. Delete unnecessary parts in patch#1 commit message as Krzysztof suggested.
2. Add Acked-by tag.
3. Add patch#2 to extract the common parts of 11x11 EVK into
   imx93-evk-common.dtsi.

Changes in V2:
1. Rename the compatible string to fsl,imx93-wireless-evk which is more
   clearer and better aligned with the naming convention used on previous
   NXP boards.
2. Impreove the patch#1 commit message to add more info. 
---

Sherry Sun (5):
  dt-bindings: arm: fsl: Add i.MX93 Wireless EVK board
  arm64: dts: imx93: Rename imx93-11x11-evk.dts to imx93-evk-common.dtsi
  arm64: dts: imx93: Move 11x11 EVK specific parts back to
    imx93-11x11-evk.dts
  arm64: dts: imx93: Add imx93w.dtsi for i.MX93 Wireless SiP
  arm64: dts: imx93: Add i.MX93 Wireless EVK board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 861 +-----------------
 ...93-11x11-evk.dts => imx93-evk-common.dtsi} | 206 +----
 arch/arm64/boot/dts/freescale/imx93w-evk.dts  |  23 +
 arch/arm64/boot/dts/freescale/imx93w.dtsi     | 110 +++
 6 files changed, 145 insertions(+), 1057 deletions(-)
 copy arch/arm64/boot/dts/freescale/{imx93-11x11-evk.dts => imx93-evk-common.dtsi} (79%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w.dtsi

-- 
2.37.1

