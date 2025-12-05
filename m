Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023106.outbound.protection.outlook.com [40.107.159.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E1B343D76
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764958986; cv=fail; b=P1WBcmatvzfb2C+R72RDIt+wJxppAUj6a9C7q6qwAISHVlosoGAZTSrDwElpmmQ9htbVAZyQilSsCC4dh4D7HgQBR0y9FhOWFB98cDeGfY9a2W7+HZ3jQUmQMtKmifrZr3RPfiFS/CSxjW4kUlGPCwVkkJH18QQvx8gUuiJ8Br8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764958986; c=relaxed/simple;
	bh=CAImKVcC4NZB9iKHpUfbM4CBXb4siefRXOdkIOeKJJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZYLae5mcZf7OX7wV1U/tumRLtwBOfcFHzzxW4AqXK8ff6heh1GHNufmNbjHb+lNXfHStPivbRuNL49j/E5xy5bt+7pq+KiSiDTzI1zm9l54+WgAHbI6j6KJEPJfLXGLQv3H0AsXMry3qXBcNbpWZUfMsTgbeuQ/Q+6dpQzHqP74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=FeYKuEx8; arc=fail smtp.client-ip=40.107.159.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="FeYKuEx8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W88D4K9q9j1XfuHu54j8FGcSEGNa5eax1G0EjysXCxPZuxdEqygPNcBC1LB2fqTlFAam3zo80bTtFlv0a15DqjkCC7a04ISmNNAxZFClcL1IPfTf8nX1DkKhsBXpjArwrAd+P8MBNUDdRZhGZHYeH5ssfz2X7pcwDKAIcZEfa4f3aB3DMIO0tVqWdkrbNlNZ42S6WZr+IutCaMFMh/w+DbSxSc0B3cFmyFOaELia9N7zb3jAKOFGLi9BHMkzcKUpIR2w08sDv+fs6SMd0L71+AUPZaMkoENazGdVe90/tvLes4W1psnVxu7/ILUQRoWZ3HmT079sPNNzsC9Ceb8Vcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtRyMhd192tjFxo/FVBBqoBGUuenCqrITOLvYQZk23c=;
 b=EjSqvPu8DjGeo+Byj/RMvICzbiO16u5rwLa3z2j4sY0WVhExZjDFxJv9+gZhwtQUyKd8ekvgbXB0MnmHJYmHPXtGIRa77gxjRy6Xcs+yRkZzidSTE07hKVAyQjC7G+w+KaaM/8SDdubwac9+dJkInXkm4OxsfUog6H5v61rkNnHd+cs/ZVTRT7q/hbmVxxT7aSOoYwsnaOgr3eh21trY0d3MI1pxqxy2v6Mgu8NU38zHyo85ByH1aBG7JBICJV0MlCKE/CuY4iJmMkqZEispaXnxHxFlo5GyPLSMmXbPVREGigrtucXM+1rVDr4kYT0sgmWEm0TsgXwtY1oD8rGTcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtRyMhd192tjFxo/FVBBqoBGUuenCqrITOLvYQZk23c=;
 b=FeYKuEx84CJDUkAEK1m09o3XumdvkbrFxLQJ7hYpZNfps3HRbvejxZCF/xCQ4TlSU/phHBE6VmIVdRf5zkS5gJaCGL/XjlU0VvM4RQ22T4WzOFBHdROSjwBtWvrmbUWPeVJc/VnSMnP5L6JaP7S3Q6cl1o5LOK8H3x5nNZ0nKcT0mTXwnhQTQ9T9LW1FTgHcS9hLQSiWuYnYwp2WKn5XUTWAcTtcw2oIFqcTvIVUkXDbPxoatKgYw6xts2NnCBuoW5eOR1w+3LBXgTjXNaqaJLNE4wMEWgc8ga+xs1uZPXWZubIEgbCUf/AG3vaxj8O5Ti0UX/R7vpf9/9a4uybisw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:23:01 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 18:23:01 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/4] arm64: dts: imx93-var-som-symphony: Update gpio aliases
Date: Fri,  5 Dec 2025 19:22:54 +0100
Message-ID: <20251205182258.50397-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205182258.50397-1-stefano.r@variscite.com>
References: <20251205182258.50397-1-stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0073.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::16) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|AS8PR08MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 829f4404-e6ec-43db-ef31-08de342b52e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n8an0B7WROSf27wFtxKAliu15VEAjgUsXuWK8NrVgzQCjkJvx+a9J1H2C9mg?=
 =?us-ascii?Q?T2P5RBWJpCfQ0OqyppFR7wpcEy052E2iRSF1GVK+NxsYjrU890eJyj6MUCz5?=
 =?us-ascii?Q?Zs0o/THFeaPPW377m9gwNAWGQPl1TdSDBpB74o+THButMCz3DJ7Qfa8LljBb?=
 =?us-ascii?Q?W3t+cw7DKUwIib6qxfyZtKEhUfRZiZS8u/rtkzJf84Iwvlp0SJx0JuZSnVy5?=
 =?us-ascii?Q?2LaHBUoa+KEHxSF3QEvyiazVzKOhjYqKaNeZLhO9aOBrx2zJwV9FqiOeFTZ/?=
 =?us-ascii?Q?SkrDV/HOqqF4ulH1EBnIvn1L2o544EI6DiuUQg/jiNPBmNVuPg3xyeWoUSPA?=
 =?us-ascii?Q?Q0TnDkmke+YKi15tgO5Vqu2lzSjA0rqHNoOq19NSyGvwF8CL7Egv1OYZtLfU?=
 =?us-ascii?Q?dlSxawtTXKkxjCjAPhGUBAaJ3M6hBQZofKL7LT5xIurHNHVK4YF5javrFWM7?=
 =?us-ascii?Q?1S+hRG8sYjGN2CbldrQwfS7HTH1JcqUs830loGFhTAQgr31tRTYA9kPW3SH6?=
 =?us-ascii?Q?zsFo8TM2Bsqi09iV2qnXtZda76PVAy9MTOqZNWKHnCXbPCL8FzoPQ34ugpv+?=
 =?us-ascii?Q?VJbxiMaFAF+4LYHMuHvBeD+sfAMfS+fpfi5HtRfB9CC9i1JGnds/iT4b9O63?=
 =?us-ascii?Q?xIABwR6jxpQ5vlsgnHjbGVrR3Zqz76C04/uySNsb307Ut2shKxtlGqZ1MLDV?=
 =?us-ascii?Q?QtM1ctHa9j/GHEnWwoWovDHV0haI7ETnfEt6CJECZmU115CLsGBlhgQCu0LR?=
 =?us-ascii?Q?2vFHWWkY16zNdDtImvgvdEkdh4qYTuXK+G4G/rjyecD7nm8J9s+3mr2f4imD?=
 =?us-ascii?Q?+nY04DGvAntKBgqg7itLE42cuazus2RVrlM0Q0nSVu3k19EGBl577VQa0e2N?=
 =?us-ascii?Q?Pp/ynArfQAHHFDUDHnQOTtz2eGBrzvj+jB1D5szSvUe9JcxZp2EC6tHsSgGf?=
 =?us-ascii?Q?bWK4uPz2MN5CjF3JyU9bKbOuS0jQIafCGoDjAxDvtWj+6ROYQbAP4uBoV1ja?=
 =?us-ascii?Q?VyeY/LrRlgT+FZTpMXmi4hygxXhLjvsfBqMmx8aiVJN2+qpfyRCxxKccHZTK?=
 =?us-ascii?Q?TVimu0RxhQsQa5sn4MOlQLrel+4+0szyQFJjUCKoiZmFI1cIcKx5CbwISolF?=
 =?us-ascii?Q?f+zktUF6wuzN4ULf+4p+fV1G/HaRvL9LM0nW5NHRgxAYWrpweLp7Z+zlDRp1?=
 =?us-ascii?Q?HvSfbm3IJA5P311QqOGIsWZx5kAa+07AEEUODDBJIRIW3OjhiVgsk/DE8VAx?=
 =?us-ascii?Q?a46KsgmkjJpnhpCLwd06mkLKNSuuyJ/BVCchzCO6kT0kOyWjYbPICkLliuFM?=
 =?us-ascii?Q?gMGWQ84oL4rnhoWwRcMyoiQrRWiUHMNLDjrld7HexppDSVcTtRnTXvjMziFf?=
 =?us-ascii?Q?doJXKuXo6UscEyct+K/1vUwFrJPLt/vMaKe9q5OVqJJPkWA+ivMkpNaNvE/w?=
 =?us-ascii?Q?DogUWTiuZc1IPeCU33C185l+LOz5Y3Lg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AIF9Q6qSROBElhgkvS6WxFdWnLfxzqi8tX6p4Zs9yQSz4LkelWbsSJvGZmT9?=
 =?us-ascii?Q?HnvwZUsbdmBjYJwyaSIliKnvJ2nl5Sj8Ml63gZt0lNXY7RofDsTYSMNfhncl?=
 =?us-ascii?Q?lj4KJdc5VMOrUYdugFTHrq8kp6HpzkOZmhyq/v+CKLJ9eW5h8A0ms+vU7Cty?=
 =?us-ascii?Q?vOPRZqIOLcWn7HVlczOvPGTjB/tdxdCTFnkXCweCarQ/K7qi+eGQN3ibrkR/?=
 =?us-ascii?Q?sHV++hOYZTPoJt6BfCDiDPhEdowk/Nwk+NC8hrzALGGyj1qmlY1UdZ7qh/oI?=
 =?us-ascii?Q?ZHj80bKWrdogh+h99g7ETdHoIi4ZLc0SXha7ht7hbM3SyGzSsp2Ew3nG8Xcp?=
 =?us-ascii?Q?VNiI9fMkJp9IsbEg3ekuCgRzdfjXOh/Ae/wymRJrUCdofAT53vVI/fZznRL4?=
 =?us-ascii?Q?FKE6jUPbyT6JIYdlN4jHm9dAbe1tb68ulVVaO7zKKsMf2PutfkjMx+hZkc0K?=
 =?us-ascii?Q?JoGoI5jEd+C+ZRHVBdBv8CCM025EMyY2MxogauYbPeuKGowhXcrouxwhJeHi?=
 =?us-ascii?Q?js0n2g/iJk1mfZ9w887rHxC2sGIM5r8TtUV0oMNR06+O0aCxelWq8BGHRkvg?=
 =?us-ascii?Q?DOpVrb4NbqxcWBAeFe+E5NSzYW3lcnqKIrq/Eawy6lOP2nu9ITRTsHSM46A/?=
 =?us-ascii?Q?bSTmHMktFtBsOEstzfeweDglLdOxE2RFAwpqfdWYDbE0rVrHbF4mpnDunT8p?=
 =?us-ascii?Q?XRhXCrpp0jxIxGgjckgW8NrZvLMJu6sN23Vcyz57ePGxqBdiUX+3opMUTyr/?=
 =?us-ascii?Q?6So55S8pxE09FuaatX9OtnVEpljqJbpKyGDRULHRc/wVfNNwni+y22wezG6r?=
 =?us-ascii?Q?Y2sSOKPyJD/a0ruGckBvjC5AciU7+/cXPjZFxnhUffrTnoYa+BC6xCW5Mp5Y?=
 =?us-ascii?Q?mJmwIAcvKbEQ60H6sd8N8JBDtixztLCLvibd2vOwQ8/ViWyId4Eqtr3O2ESG?=
 =?us-ascii?Q?J2vDE7f4P7gJe7AIHqhi/ADcxCVcr+LmLLsDzzVmztfSrt1AZwWZMTfaQqeO?=
 =?us-ascii?Q?EX9Cc2uBKvJm4lAxcK9UFHvQdjfw5hq1YTuQoC2ZYmGNiaqgfYChx3ZiMbgZ?=
 =?us-ascii?Q?OTMjrhF5MWFWHFwtUSd+2yQ2cVtv1xxgGlpSKlGgKHEl02G97rNX0mW30zbQ?=
 =?us-ascii?Q?VRfMAPxWWhON8SHCc7lMBQtgYjS6bgDFZ3H4h99CILkkA+XRY0jOH71VJc1F?=
 =?us-ascii?Q?XQ/ErqStVTh3ldI+9kNOfOvrBv8wkuhypTofUmXrjodyFRBRycEUGl+SBmNY?=
 =?us-ascii?Q?FqBbYE7Ap0qGqUAuJshZXfZZno37Q1v2pZwNxwpgRKmDZaDExafOFUIInP7V?=
 =?us-ascii?Q?C0y4VG87CD/ITA9gDPkVyXH0YLCMoohOoy83SZa/Jf2QF2MMtiNulLba2Xi+?=
 =?us-ascii?Q?ppmH//Oznik3g1eYwfId6n72atxK2DcRs1Xr/m29mR53U6pGCdt/Hr8USxYE?=
 =?us-ascii?Q?RsJj2PT6YNzrN3z/urG+U6fu5hJhvrX0KtohRGOBWjTgkCPc5IEP5sRhL5Tq?=
 =?us-ascii?Q?BR5hYoDgZJyG4BzMy6efpOIolic3v5C3bn2DzxHgAGyBVF79N/5R5upxV/XT?=
 =?us-ascii?Q?zlkGpgxN+Defaqck3foYTENXx2TSiQn8eWrB1g3aSFyNWc0T5Xd1tN5r5zNw?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 829f4404-e6ec-43db-ef31-08de342b52e8
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 18:23:01.3459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcZu8Lvh9pdcl3CZghCshWq6rm499Nwvh4EjgrjUXfcsjBbgvqMtMwzuPqRZNjCAi+dglCuD8UYPIcsNpbcskA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712

This patch introduces 2 simple aliases:

Add a gpio3->gpio4 alias to allow flexible access to these GPIOs

Add a gpio4 alias for the PCA9534 GPIO expander.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c789c1f24bdc..00bdd3b91fdc 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -20,6 +20,8 @@ aliases {
 		gpio0 = &gpio1;
 		gpio1 = &gpio2;
 		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+		gpio4 = &pca9534;
 		i2c0 = &lpi2c1;
 		i2c1 = &lpi2c2;
 		i2c2 = &lpi2c3;
-- 
2.47.3

