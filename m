Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC58A262FD0
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771926255; cv=fail; b=JuNlooEUiHdN/dztiMtPzhz5hyUcklVVER5L1lwksP1ov81wT3AGH8iFgTRdejoqwgUUebgkTr2dKXS2zbewSkykvFtn449U3o/YSa+b9AzpEquCFRxLClaUg05/+tyhyRDvl2eIP2abAb2ZoX1BWkaTcBT7m/XwgthGcSil0uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771926255; c=relaxed/simple;
	bh=L25fBHlaacfZ1X0TDDQcg4CbYrdEAHq0Y3MtZiPjv9I=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fBXCBnJhk13EgaycZUdtO+ElmVveV2s5OCBpnA2wQygvcev0Y+mpHWHtnZw6pZEF9wl2UUQz7awVD9NDzOq/VrnSmWs8arvttSeZ2V+snosI/gS/rHK/3gISMHiCX+TJIWOVhN9AlCuhEXOD8b5cx4QOJB7NV4W+w8BiEFUJU6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SQ5DSBoe; arc=fail smtp.client-ip=52.101.69.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SQ5DSBoe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSjhmOp+SSwnzLHhSLnixkDEZSkM3xd5QuB02v+ajKDXcrEixMfD5HY7hssDUMv/f8SEDEcp37t8Jd/DFaOUKsZQyfDfvuNbh/PujeGrb0wS/uj0Y4Hs1xOKJRb97av8lyv7gW4KWwE87RnRHRX4IFsOr7yWGU07dPLuew3BB6oA6mGieXFQdur9hSebTIxdV21KG/18Sz1GMqFO3Nf0m8AnVxmiRIB/DSDxljiR68n1XUhREt1NBfQww+rEiOGeY+aJrysvovE/6HqDLgFAGenQwVsSeMNzu+JsumKO5xz5XmYl+AL4UBoZgY1sMJkohDkE0C4/ziUmIzIOGFQUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mps1OziilbTJqVEWGh9YuII5jUi/gabdHM+KFSyzCpw=;
 b=njpxL4bRM1oAXsiRDGBGVi8mE2cmSrZ+m1hZGHCQj1GZudrtgM1w17kqsHWbB1UN0bRbKxYINClatanYa4wev4k0GifQct8ApIXK9xTle0tYivT/Q8mO67sQcOD2kR2NLxRK9XEPdyoC9+ioPUjHpEGZuSEd5w9gpHi6aHucn29VLUscvzvlNoTSuMwgOUcT4RXeXGCCXnxNa1G0W4Nz+rEwAJegWgG3bzMMqJB7yLYXJ6vNwULOC521Re5R8V7koKnB+02eERzEXSaITmP4L4hMDQbi5EumNV+rPT3FNWYN9/I8TFwOMTEyPkHgqwJ/ZGCNaaXffk35vQEDR2dw7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mps1OziilbTJqVEWGh9YuII5jUi/gabdHM+KFSyzCpw=;
 b=SQ5DSBoej0sk8Bet6TB1t0EdmrxwS+5lR6SN379bjBE/SMDT6+x2UI5U88JfHcy0/ObI7GyfRsJdlkq7A/kYE0hRIG1tgHu+1cQ6gFVkGUxo6/QCa/bzFAaAvSHhz9RLj0nVhYELWEupztQwr0QMt4OiZqcCm1zZz4IttEpgsJMqEQ3+Iv8ib3J03wIFwZfz0ocZmiF2MHTe2k+wuV3eLSU8pLYA+5zkh4A9/7D4C0R7mRhE27MMyoB3Vuge2hkJ7Zhsgdu+pWtQpiEvgwa//zslSmjlhErywe38ycELPyqrmQ8/3eSh0Ek5ch6cmfVI/3xG7Vhq6SJwxMFUsqTh3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV2PR04MB11325.eurprd04.prod.outlook.com (2603:10a6:150:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:44:08 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:44:08 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH  0/2] arm64: dts: Add NXP i.MX8MP audio board support
Date: Tue, 24 Feb 2026 17:45:25 +0800
Message-Id: <20260224094527.169215-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0067.apcprd02.prod.outlook.com
 (2603:1096:4:54::31) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV2PR04MB11325:EE_
X-MS-Office365-Filtering-Correlation-Id: e0754f60-9ccc-4af3-a8df-08de73894161
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?10hPHHQdIu4L6wFkHD5jqJL7K1nS5QMjwmsxMT/BFnYOGIysXs5Ap3ftrbjg?=
 =?us-ascii?Q?Wbt5XuQ+4Qa9OdYEli21FexK7EfCvLUxj7Tj70WoOK3OV3qE/oXZxYZ4nztk?=
 =?us-ascii?Q?W22Yr0QTFS1epaAvj5NIVWEGtkfjVFMP67KKr7/iApF65XhLLJ93y6Lz/5W+?=
 =?us-ascii?Q?hz2V/+7sPG2/e6LiGWC+D4UNKUoGIy5xUyKX0tbJEkUb7N16j0anSiheN+go?=
 =?us-ascii?Q?uXB2lYxbi3Tn2uI2BfQNB/Y1pS4JkZGlrN9Fxz0PfRTLxOvG5iHHst9B186s?=
 =?us-ascii?Q?6+26ptoWuW+qTWc/q26gyCN5mhRWYMRdqD3Z1PpooNi8etaVngUKZFCQPoto?=
 =?us-ascii?Q?UBqRsO7GL/2rDfgE3BywckCEJPy1zI4j3qvGG5jSH1rlkIxPFcrpt9hb5wwq?=
 =?us-ascii?Q?e+LmHGaqIkZrMNDOGF928t1zRBThB44Ml1cAX9m5kzV388/iEN/3fpCI5M3L?=
 =?us-ascii?Q?VkhhO5X52gxD7FczsqvdznzSiA+NkHP/uCp86FuiA6jTE/KRFwEUq9Ik9bKV?=
 =?us-ascii?Q?y1wacRoE+gvA2luSSJF4EZXZdrY49bPtJ5nqWjiNcejkFDa/GyofvoEs0UyM?=
 =?us-ascii?Q?204enbJcaeoOdNCfrV9a9mnK85AQ/yjYR1/JubviFO2UzDZ+KgdaHH/aViP6?=
 =?us-ascii?Q?VkbXZeIV0ST1AgS3kUVt4giVGsL4vhIGYIEoxPuKs9ZVbDY+4ol/2+Kb/enB?=
 =?us-ascii?Q?H7vqrTg4h4qh7BuJ96itOLxyFJxpFEr8nACcoqHO7jNNEJNFPFsqFy14kxPW?=
 =?us-ascii?Q?Hn6Vrj05MAZfsXGFbbbU8uJ5oDhgrzYGQurZdsH8KGKBFaAVumCPHPVAcSkH?=
 =?us-ascii?Q?M4XkzgsM4F1sCo0cT70KV7gMuDw/6/valKCUp+2aceY8IsY3XXBKio+RmyQ2?=
 =?us-ascii?Q?uwsI30Ca79KKtB0+mkuyPNWzGDwpI+9L8Fpt+utp6VVzbW7nFBe5wL+B3JY4?=
 =?us-ascii?Q?UEeOzbxDVveq06o6teXNY/uH8/LCcTy4Rw8PF2XgDxcGTxWLOWgBTXWibqSm?=
 =?us-ascii?Q?gyYnPdWzcTnx7dxz1yDokgWBH8E/MT8ozaun6HDC2yyPc62JReYikiattCS4?=
 =?us-ascii?Q?cbNVIqBIwH1DuCtxc0UQM2oTYCUcSPCLKl6dv/DBFkZvq+QTDQKQjdJVpeBv?=
 =?us-ascii?Q?a7zZhLx+Gw2/svSnsovA9ORcHkbXaAfnG89DSpQ3wkFMCRoZEOFTpCRvRTDj?=
 =?us-ascii?Q?GqDxajKxOgAhUP5Kwzta2vvpw4qdryRct/DX9+B5WeBsIUiPQKpcuJqaQ3uS?=
 =?us-ascii?Q?3DDZ9A5riYrCCxLddPf/S5jUOKpDN6/H70Jya/ris3E+ieVmV3LIaPPbFtY1?=
 =?us-ascii?Q?m/pKbyLIzwaRt9N0gxRHDQqLmKqjIdMpG7KavGDOdTrudHug/BYC6yutDoi1?=
 =?us-ascii?Q?+h4a3JfvtDldvj/K8tYK/N6Hd/7XjUpyabF82aHDgqRIoFZfpZ5S5QK9Y/e6?=
 =?us-ascii?Q?dOoy9/jGDG9M/XLeAE7gwlbC17c7wKHtIlJqVTVCE8C8mCa2Jkf4q3ZL87za?=
 =?us-ascii?Q?AhImqB4IDMWV6LRELflTbW6G0PCDpNjZ9VsnFiRwYfNSIxYQuNU+087SC4+z?=
 =?us-ascii?Q?uZD+cQVceNO8CG8pWd6aoxU68+U3Lrju5iwDf9zvnps6LgJq1C3RB9lrWtAw?=
 =?us-ascii?Q?/a/oqdcce6VTzqMEszLpNmdXCY4L0nhvRRbsH8DMNS0v?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ozqD2YzQAQAXjVfFBzjrQQI83GEHAOn0Rjf78QzOcm2IZt6XrQ9d+EY70dBV?=
 =?us-ascii?Q?yvhGGrR6zT20P3Ry0c50firoyFp9FAw7qvs99cM0kHdpQGNrpylgFTLF5dBH?=
 =?us-ascii?Q?NqA9Ad40asuyGgyNgsd7Q+4CGgc+9QKRTLalPqCIcgyXAnA3eUiK5fCBFOE0?=
 =?us-ascii?Q?HIDg5swyU7ZM8NuhcN/+4vifAI6heJSM0QUOSqpnkGqOCLTPPKMHmcdnEzDm?=
 =?us-ascii?Q?2kg/ekz2C/mV7gaWvTcypnWIqZ03npphu8aJ0n6dKJyzK7hEK51DYJ2B26QM?=
 =?us-ascii?Q?CI5ezerAANkvJAbrppqYzLuwW1IcAMG71jHuUwFoUMZjVKWx4siPWMOt/FO9?=
 =?us-ascii?Q?UuHQIi8RwRngwtSt/c+EeiDlr5xk4Y/YNlE5ndv5XCNodj5wHzjAm6cLxQhY?=
 =?us-ascii?Q?M8au8aPYsUrTyelI8BS6/taUut1yuXf/iA721zPa7yhwlE0rrRPZme2K58a8?=
 =?us-ascii?Q?rHT+gjG3YOG++lc/jgF2SbDQDwDQSvDCc7v486xexYvuVn9iK+LrHRXC4GG3?=
 =?us-ascii?Q?FRb1/TaeA38TyiztxhTW5shAWuSpgJn9LGxfQaLoMP0VWNKUGpgKAhqcJJpO?=
 =?us-ascii?Q?CvKdvGvIUiJ0K3Orjd6aUeU8oAoA8Qzm4hkZPRBNedoQq1+K0MLqQFu0e1IJ?=
 =?us-ascii?Q?dhcPiSBSsDHo8Ks49lLR+61IdTLjYBKtABMHy3Ptd4n6GeVMMqa6QnHxh4iw?=
 =?us-ascii?Q?T3ODpwxPSirtzdIke5vDYZPU8wTglmJMAttAo/MiL0+ULW+9uZDAfE/u5y0R?=
 =?us-ascii?Q?ml90iWr5D9z6lrQ8hOmIVKTLEoPV9UISCT8U8PAaaCJhHi5t4Zoch58I9wn4?=
 =?us-ascii?Q?1NB/bOfcU/mMaGahNPiWGWN499BU8FNesRPtodCmPzLKZa9eKDGOvpgbG9Ck?=
 =?us-ascii?Q?VsG3Sb+AF6y8OKNRhNrs0MjtdJuFsZ+FANlR7oo4vO7IHBciSSQMXB8EkEdV?=
 =?us-ascii?Q?iM/ewcF2KqMrv/76WlW78IEX/L2Oy8NeHN4TaPozOxYjaMemZxYeWCqli/SE?=
 =?us-ascii?Q?nK33CqhUNVA+iqKnt/a7PuCeqTw38JLML96QfU/yAerUenBaHfTnUi8Im5sc?=
 =?us-ascii?Q?HwuZBvoDK4JqhL61D1Fk4nZ3VPk7tOI8iKn6O6Ud4q1f2hEXL4ma2bSKsKnY?=
 =?us-ascii?Q?fJupKb5l4pjJhsKVQwUG4WQb0dQO4ubjhruvEQ9Cv8YaKp17LfxlQmPfjRuZ?=
 =?us-ascii?Q?zfHrfM+7FnSEmzoCj+kUCO6Mm/vuj233mXS8JxHRmG7S80abYj5Ca+gHlHG/?=
 =?us-ascii?Q?6i6XOHxJT4a6/ArcoDCM8S3P9+xBpqxtcDubc+RjBMeC5Dy3vkEpIfAW5Gok?=
 =?us-ascii?Q?xq5PxlBGYA9QgB9IBqCNgSEVzZYx9egRfahQ80vVZA7eaejY8AkSbuf6E+Bm?=
 =?us-ascii?Q?mH/3ErESHXSTfx0WbbRr3Pbr81bgMcoyrjMmzA36hmqetYOhEfuAwScwfQob?=
 =?us-ascii?Q?GzVHG3SwfLxizDd5bBoYUVlZhvKmKvyd2TCxf+WQrbqdCM2Dk1svKCviQRnZ?=
 =?us-ascii?Q?qRbZPjujNeHFW5bCeiee60LQUlWunwKsVzi0Mn887pfb7NfkXc/097Kc819q?=
 =?us-ascii?Q?4KfldWliIW2sJ03DMZmajJSfemaxteW3SA8CdjE5O/Y4ikKWk1qV2xuHBmN6?=
 =?us-ascii?Q?OwJ2tMr5uwYNHdL8zhm6uo73YHCHhADGSu+2r33oWNVOlWeiOozAStFX1GUw?=
 =?us-ascii?Q?9oXOP7HVjKo+jxm9TiWrSCV8yH/m3h5/sKwdLBEjjH1ktByhV9LvwG1MxJ4t?=
 =?us-ascii?Q?fH5n1fzXDQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0754f60-9ccc-4af3-a8df-08de73894161
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:44:08.1005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8kN/ZriPdcuZYgzCIrRrJlzHXWpY/cAcCXa4yDRVrBrkiZTPmp8yi1zmvU0tuVbZhAi5qOKNbK5sCS6t/cZCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11325

Add NXP i.MX8MP audio board (version 2) compatible string and device
tree file.

Shengjiu Wang (2):
  dt-bindings: arm: fsl: Add compatible for i.MX8MP audio board (version
    2)
  arm64: dts: add support for NXP i.MX8MP audio board (version 2)

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts  | 941 ++++++++++++++++++
 3 files changed, 943 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts

-- 
2.34.1

