Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A5318ECD
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 06:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773124576; cv=fail; b=UBJBXBBgjmbB1CjGzbrQg0Vg6Z7RvhAnFk4+3Eg3xRBAVp74oubR22alVaemPgyIGxLDcX7GDzmJwPPoXrl+2Wj18LJ0+vVVyvijzFIaXeV8xun81AjVjOMs+ZEL+gD7GjYFpnQjHL9TQAFBbcZk3Wk/5o+JJR2qYhsAJtEEyBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773124576; c=relaxed/simple;
	bh=d8p23k3PeIC/JynBL86atwVD001GRyqvJUoCsruB78g=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qgSI8YIKnMhR10iPiC4AXHckZI8ixXjHyOXBWYWYonKo4Qr/hduZoenBiJPgSCNl98+7og9OcBIlQjQy8X6mO6JfI7uO1zJGMhum4OS/8TeEPay1eXrc3FqCYOC6ncqkHusawrQS5CmF3V+W0NczsRiIIJRfYV9/KY+rQs3fyHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pz+nta1l; arc=fail smtp.client-ip=52.101.69.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pz+nta1l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFb9lxZPGb2JTs54mFphX6qkgtJg8LtySB3k1hpOEgSNKlC4sgPyHm75Z5JUMjKBIkvVReZ6cPa4q8ruXXmzB6ySBMjaECorxiI3gMZnQXAu3OdDZAuFoOB3+frB7vwjlVwfkZAQbxnQspYD2ABeqN05+lSM+u/aATW2ZRswrbrxK267ycPexF6CWDmBLOvRMUpZYfz7vC53BiL8MnvXN3qEG6SiEzOwmjBB2I4kGIqnTGSsW8A+ioCwIYzUcRB4ZrUQtecNFoNlZKDQq3/XYeEDgAvNYR2zw3/CIai9Dq2uO8MKoMPPFpmKtwjyvYdR98eBHen9IHJSvENd/g8Sog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iu8tuieL+YcqCVAFd6v7OJyvfbJXGGSAlxXf5sH7Ucs=;
 b=mZ7tIMyd7JhwGQr/YI1x5tJph0rVJxf/4wSlZZZvRq005EZkzZ0eTu4JX0SwHqTWzphmbKzOxUJkT16PQTElvkrNfToONrpmPzhdmdlJF0YwBcGJAzS41xmcCIAxfFUMTGhjhbJIRHAHVAW0+nIUZG3pFLfhoHojVj6kUpZiWl3iY6sEsZCMByRNMByWNu1yyE49LfP3klvXW19D22WFO47l+jNlU8Tbz4LjVBo3lu9AAFw2ivcTkSOBxJRBXGOdTrzAYpKV5KHYqTQSQ8N4ekNyIJXnqjeYc7FI9DViWfDmiqGrYw2km+bPqdtndB87ZytBqX3TWFu6g8IHNU/TGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu8tuieL+YcqCVAFd6v7OJyvfbJXGGSAlxXf5sH7Ucs=;
 b=Pz+nta1lj2RIdl4yaOwnjie14fe4FRLTPPakVfQK60IAR5HWVOxoB+Zg9+0RtZHzWQsPkI8CJ7HrMoSsoqwjajWPa/BCThWNsUB9fricLKj4YQdlyT2O2/6tDIDjFXaz0IGDh24nDcdlTMklsxUhCA8AQJ9csvAMNNbGHeC0OJeCBWqHYELn+pWg4mIKotMyApbZXC+RTGdc2x3c8UorKv7uOnzxvsgVPOw8WeCg8fWVbv3lYl3W+ay54me1MAQxMiQ64o6XulRjCfQ5ZnAbJG00Tg8Jsyt4PXPb+RWcoR0vce3k2YSiFGZjTzK8h+U+Frdf/yCjY6SDS1dqKZ/UrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by GV2PR04MB11759.eurprd04.prod.outlook.com (2603:10a6:150:2d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 06:36:08 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 06:36:08 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	shengjiu.wang@gmail.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Date: Tue, 10 Mar 2026 15:35:22 +0900
Message-ID: <20260310063522.362545-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0116.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::10) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|GV2PR04MB11759:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2a3dbd-9652-4c39-9fa8-08de7e6f5005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	QibCumfdMbCIYbl3jDOc2IAJ5YbsgnzchrvSVjPj6lnXsrM4M+OARz2u2BCPMHTkIW9tJQkGT24L6M/96NkW4XELbwvy14/cp/KdzXxsy7cuCAxiIBwy5YZ7yRhdDIqOM5LaoWORyCKfIPiSVzuW1NzBuEvkP429YGH+GWlWISGKPjjuUPYfwdRkqwq/HgZw97ZLTmTAZPU7OgVQpW5aNAag7mttYhHYbV4uqnxcdIkcaCd0z7XHbKDNGAj8ygsQv89hI8d0nfJHKhRELdklpyhO0uuulkUL5Vusgcwn7INv0WZGxqOiuNPYNp5jCA9VMoeFrsWYkIOiJBiSaTON1+T8odbbFzL3xXl1UBuAlZ+yK6MxO0U8UMwWItynLORfaBRJfYJgP3DWTURSiQ8dZEkRLsuGM7bNHyzKBCHQ/v1Cl7LST3Gur+ldP51saQmtVhWcS9G0Lax13YZOCt6k+n+LkBnDitgNtP0z7IodRk9Rzsr5HMgtv37/gTuj3FMnRonQD5zALAM7aX2ansq6dTJZxwlYHgwtPDAa3+TWLXmLSPImVWlE4fYVMuJ8INJJ4Vq9rC/0Ef+MoShy/xb61wm48N1VDnW/Z46jGWbPFCD8Gtd5QD3gT8OXvVw/szsC4u4YTHtf8qI6ULdwM6MwgKSQmV0bfWwSjvsuZojyrd/PBCePJFobFr3P92t5fUbKxsroi6oKURah5fUtalZ4N4BuAAs/Hc9FfWUIYxC2erVxJcTHjHaH8CYIdyglKgqpNPq//SzDn0vH5e7HhHXWQdks0FkYj5bvMG599U0dtg2sy4XDHxJ2nXLmwt6SLxvM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NMWf1c0CjaSecA8OKQ4Cm6j97qSC/CVwZQR8sGKnSm9FPXRttgPsRsWZbjBA?=
 =?us-ascii?Q?BYgzEMmYMJNrAL7JzkFhPdAyWRhNAuqtI2Dzz8VZTjDaG6SDufU4IJrANzNV?=
 =?us-ascii?Q?6VBmE6r/DvtOcQSmKa7GqfRNKkBE5iuz81B21cOafe4cV4wPwLNl7tGaKOpB?=
 =?us-ascii?Q?AFOOSr3YB1+jeOlr4dldXagWdjtyHTz0qysJcGlGbKlaacELlwXBawmpgUaZ?=
 =?us-ascii?Q?ZioQHOCk+BmnyJq19HijgoOv/bit9T6IqcvH1LRG8Bued/mG18PfQPmzVJQZ?=
 =?us-ascii?Q?h7tm0BqofPMg5yQNx6FQPPSddPqesLk8U2yuOTAKEOW1PpRtcxFcEZM4yLM6?=
 =?us-ascii?Q?tQDdeZPxLkj1IT/Lsv8UKNvvXgtk8l0Bah7zhVDCi2pjLNOWGg/jZz4RCu+D?=
 =?us-ascii?Q?G6WeWBf+wAQHXb31dqnCWqBReoH7IC7xfLXQTo6WLy9MF6DYFtUw32oF2JZp?=
 =?us-ascii?Q?YEY2K9KYxSFTizG+Hiy7s6mwD0mDyWxq7F3uo9OfuP+UPhWdHR1mlL5i6PI6?=
 =?us-ascii?Q?BkTeeNoRKtqXjwt57XrIR+dhh2wUOEzu2pf528j0Cg39kvvMlLDiDkt8uBx6?=
 =?us-ascii?Q?JjxiZk83RJd68c9lw4woEglYz2GswzWNy+iV/bKMrJ3rabdcX5IEVzDY3Fzq?=
 =?us-ascii?Q?8QDLdF98FhiiODmb4VBOobWzGp4V+AWoBFSN5AMhe05B39lfFDmvNiyFek1D?=
 =?us-ascii?Q?3RrmpLHGdx3STFSqzT/eFidHsK8HPb+rNQ+YrsrfJFayXSvtKmC1Qot1yYUx?=
 =?us-ascii?Q?3NPY9MLAVXjIKTGohL7Pr9W4CLMhecxJE8vnfXLwZv8sEyNPLEUO25t1zIqC?=
 =?us-ascii?Q?WZYu5bQLZxTHPxlS2lBC8eLlsVQZAo92cjnBIq4+7s1Cs81k8tt75dTWn8/l?=
 =?us-ascii?Q?7wgwNNojVUmBuOAHc0YETGjTHf3wCKnq13ttUX9uaPlQ9YWuAqleXrygkm1E?=
 =?us-ascii?Q?bXLHHU3Dc7CYg9tvULrRaYjzzvHR5acZU5fTXupfmSb6gb/O2czNTCekJitp?=
 =?us-ascii?Q?LsTc0hSb9Pkud8YjKdQxV5aopf+8rKwQ9FvxVTQ2qMrkdCJsxw9bQFDcfbIk?=
 =?us-ascii?Q?dAKuLtV+oKHjE6xHToVeO3yTnBj4nfHicL1WvCdZT75Uj1tgwVo4SwKg+FFN?=
 =?us-ascii?Q?n9g0LFArholPwTGMMKDBIlwp7RzAeVofkqWXFVCKtLOqUXRlmukag3E1kKqh?=
 =?us-ascii?Q?GA2g/NMxpKJWXca0o5LtNq0Fgun8UZLG8PVT2ua3DY7/yd+fl0ZDjAEyPYyX?=
 =?us-ascii?Q?Ab6+i2j+QUPlMsOElcG5y8J6SH4JIcIc+pGO24i6+4x8wl1zjdO9MoDcakFf?=
 =?us-ascii?Q?Q+80XNX1/Ix7flTTbF2WL5Z2r8J/QrH3DO4OSuxwvjgbvZS1jhXgfl1qHjVr?=
 =?us-ascii?Q?oMx0hrIkg0A8BWuFUqxF3JhLyBsnoSf8oM66sjFMZvUPjxAlB59z/OZ7UODE?=
 =?us-ascii?Q?W7BdOBtMdlYTKtYTvmMV2Eq2t4yXxwmJTUTQRfzqguPnm7+lAq+NvaXF2OWd?=
 =?us-ascii?Q?VEHop4wdKFeQgAIigzvzB3NpgAJMoffh0+kSwhnDc9A+ht5UNHnHYvFpwfJ2?=
 =?us-ascii?Q?9zlwx8SbeezJ/oAJ92elH9AT0NFi/N7ZN/s2pfKND0T/aRNjDcROxe+BucM3?=
 =?us-ascii?Q?LLfswLgZA/yXO5iDzv/4R97y6G1pwv5vNGVwjXfUqVvbkEcbJVIiZlyQgRxb?=
 =?us-ascii?Q?XdniAH2YIHo2gshv3z6zFeQRgy7WoBOeN4TLUIAwV1lscJZ6D30eDT8DrPz8?=
 =?us-ascii?Q?VSArZo11zg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2a3dbd-9652-4c39-9fa8-08de7e6f5005
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 06:36:08.6392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBb13ZTIm3aDBEzz8GPOVaKKM6cODlelmQCqiMJUDxo63ktTg87G+OQgqnvCu0+5XyawK2tpSDCn1VfFcaYsJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11759

The imx-card machine driver originally supported only codecs operating
in i2s or dsp_b formats. This machine driver can support CS42448 codec
and this codec typically uses dsp_a for its TDM interface. Therefore,
dsp_a format support is required for describing such sound cards in DT.

Update DT bindings to include "dsp_a" in the list of supported DAI
formats.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 3c75c8c78987..5c08289346c0 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -36,6 +36,7 @@ patternProperties:
         items:
           enum:
             - i2s
+            - dsp_a
             - dsp_b
 
       dai-tdm-slot-num:
-- 
2.50.1

