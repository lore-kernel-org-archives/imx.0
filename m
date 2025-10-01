Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020114.outbound.protection.outlook.com [52.101.69.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3152EB867
	for <imx@lists.linux.dev>; Wed,  1 Oct 2025 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759322651; cv=fail; b=TK4hk65ebin4YLrhdxA8EBgbIhiLOA22MnulDamA9yGcRABt76mrHS4aJI32Gr/5K+Om9IwhCvJtd8fV8sk9c99HSDpk93N31fiuZsTBeFby8eJCR8JefJakdz51zP9Ep3QbYqEB2ihETRjNlK8POomdNvlforUU5opynqJR/xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759322651; c=relaxed/simple;
	bh=lxNCYMXljVIwJtd+pNAB2vHb6Y1U5IWnC3JptCOXDxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cJRNXA0X31aMIjUhtJktUvTISh2sPHWlUy0qhBqcN1G2pXRXXWjoa8mVmBRgXczbK1BjeS4d1BIt5aBiVA/P9LMNjPgJhSI7dHetwGKOirqdq4ttiLVwViU+KfrWSE4DeNWr+wdmxgV57+VWI81J1icr3QI6joV5nyD/sY71ddg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=TIyGFwje; arc=fail smtp.client-ip=52.101.69.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="TIyGFwje"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOxcAyHMAehGJsW0jBpnAspRbR3gzb/bmGiHAiOjQC4n/kMkImZaNcn614CEvqo3hivsaL0UvXlc7M2f6LKqbUTbNIhXcQ0SmiBoRFWqT8I2N1hbnP/IwHqXeqKHGk8xcpcofeSZKN+PkNjw6hcEjIWOqwMR3ZhuOSn26yJY1lXxb4j5Bthz70lK3ziod/CeXrJPTkEn4lZofd9erDZzLj9Ha7LacJ0ZlkQ5oJ3RqSh9rqGcZIRZkahGKUMKQbTeFFgwVVbO/dwxl6TNeDSEO6ygyGmLe0zj7ceWffLZa2GFCeP551ct3m060CgQBl97sYcxxOsMEDBWeg0RdYFl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kN1WcvI0Igckqy/G2cQPZm1/8qTYtmqCz2kJEO1rjGw=;
 b=HOyiOeTRYm/fT+Gsgq2wNy2txoxbnMv4W97kpaVAun100ZfGBjsnRGtFQIk2G5VQpX43p6ljhEA/+r+s51tfaVRblSi7a6HkPfxB5SWXh7i9fBFdR2W6AnOg7Utv3Yp1xAowv1Dy9djIc2u7PnuvuoSuSN17xhvq1dPGJ167efLczSIs9+GKZhpVRto1zPL9D7DmRXe5p8LS5xgiss9nkXB24Cw1ITlEoFaGFH4LZ5YQDoJ67l/u2iF+FWAgHSIBvzUCDl6uTog76gYsIVH1yzVuje4Ys7VOKyXMcO8+e0JOKZuwLVNJKmjgZK0G6QeXyuhH4e7fMY3ox+4nE6rsAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kN1WcvI0Igckqy/G2cQPZm1/8qTYtmqCz2kJEO1rjGw=;
 b=TIyGFwjeHp5L1VO70C3a672FnQKXmJvOT4vBLmjdWeGfbDrwzuq9JCANF9MCxOOuaItwGxc7PxZrReVe4PGOo0Tb5GmfBguFJCn7keBgNwbtkchu4WU8YH++xstC7EfPymfjEtRqhZSJIlqDmAA0YC9Hr8HX5Mu/gqeAv3ngEUo2+XW4sXAM0moqmOMXA5gOc1szpkmOwevMxVGOrD6gkjOfPuwFNjYvSNwJ9do3gVr/+868uf92BZDzHVEHqY3+xrqnkjdAxgkui4EgA1aTEuc20o2l7XblJY97ARLPF1gbMXIfQoNJHqax8STX6/bjBibS3tifIxVvAna8SLr8lA==
Received: from DB9PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:10:1da::27)
 by GV2PPFA6AF62A30.EURP195.PROD.OUTLOOK.COM (2603:10a6:158:401::8dd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 1 Oct
 2025 12:44:03 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::71) by DB9PR05CA0022.outlook.office365.com
 (2603:10a6:10:1da::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Wed,
 1 Oct 2025 12:44:03 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 12:44:03 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 14:44:01 +0200
From: Teresa Remmet <t.remmet@phytec.de>
Date: Wed, 1 Oct 2025 14:43:28 +0200
Subject: [PATCH 2/2] arm64: dts: imx8mm-phygate-tauri-l: Update pad ctl for
 USB OC pin
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251001-wip-t-remmet-phytec-de-upstream-v1-2-845d71bb1e1e@phytec.de>
References: <20251001-wip-t-remmet-phytec-de-upstream-v1-0-845d71bb1e1e@phytec.de>
In-Reply-To: <20251001-wip-t-remmet-phytec-de-upstream-v1-0-845d71bb1e1e@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Yannic Moog <y.moog@phytec.de>, Benjamin Hahn <b.hahn@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>, Jan Remmet <j.remmet@phytec.de>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Teresa Remmet <t.remmet@phytec.de>
X-Mailer: b4 0.15-dev
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|GV2PPFA6AF62A30:EE_
X-MS-Office365-Filtering-Correlation-Id: f464c8e7-67ee-4bbd-598d-08de00e833c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2E1TFdoOXA5N0lLdkNhSXc3bzRiWUN3UHBFdmljN0J2RTF2bGlJTFk4NSts?=
 =?utf-8?B?YUZEMk1OcTBzMytHM1FsV2ZMNVhNZkNmdCt3dkg2cG0wRHpGbTdMTjF1S21Y?=
 =?utf-8?B?TGxVWGZ0Y1BBb1FoY0xhWU5TclYyWnNxcjkwcG52TWxaS0FWSGQ1M0hXeXo4?=
 =?utf-8?B?MEFqWGQxRmN3S3pWTkpFbTVvOUQyMnRJQkdsOVc4a1k3TTJFa0xUamxmQW41?=
 =?utf-8?B?RGhCVVdXNURoeDNnQXVDSDFoMDZIN2FCK0cvb3EyeGlUeUREa3dSRWIra1RZ?=
 =?utf-8?B?SE5heUkzYWordUlGOUNkNWVoc0NTSEs1K1dtOUk1cWNUVCswRHh6TU1tTCta?=
 =?utf-8?B?NlgvaVMyb1MyTE5Fb0t6RWZ3YXdKYlRrRTRvaTc3SG5WU0NiSlR1UXR2djBu?=
 =?utf-8?B?VWdKTU1BTlNjN282Sk1ZcXlZdFlTOWFkck9XdkJhbjhrcGU3SXF4QitUSHVQ?=
 =?utf-8?B?SVh2T3N5TUxRT3Q3YUVaS1ltdkFYZjkxa0dld0lsYjlsSVZQN3YyUmxDN1h1?=
 =?utf-8?B?Mi9ja1AySWhscUhHNis1TkRuaklGMkpKMVJ5RWI1SW9GVkRFZlRXNERnUzhG?=
 =?utf-8?B?UFY2eHd5SSs2bnhXQXpsRU53VWVlZzBWMFJUeTlPTTFaOXdmVnpnRlR0a3Zy?=
 =?utf-8?B?dlI0WXhBL0lLUXFvTURrS1VkUnVBeG1iNUUveGd0Y1l2VXFOSDJoMzVTbE5h?=
 =?utf-8?B?eE8ydHh6QWhsNTcxa2xHa1QrOTFnTzM2M3dmZjBMM2dGc3BnNHp3dWhZdWRT?=
 =?utf-8?B?QnZFVTIyQ0VHNjNvNjQ1WmdUVWl4b0tTNk9UaElaOTFFZnkxSGg0cml0bCs3?=
 =?utf-8?B?MVFZWm1yeEVUVnBraHJ3empBNEM3TlcvamluelBLUUI1T1J6c0M5SU9PQm14?=
 =?utf-8?B?ZXR1Vmc0Qm1HMjJZbFFlaGJxRzQ2NUZrN2ZNdmFhUU9IUVJDM2RweVNJYTJB?=
 =?utf-8?B?TUs0Wnk4NTZ6THBSMGl2akF1aEcrNngyZEM4a3ZQRHJRc25MdWR0UW5rT3I4?=
 =?utf-8?B?RTBGSkp3YnJNMEpoS2dWNUZJZ1YvNlVQbWtSeS9UalAxcTI2L2JBSkJYTVRv?=
 =?utf-8?B?dDJ4UGRYQ1N4OUpwRVB3UnN5UkNReXl2R0FJdGs0SFM2MWpmN0ZFOW8zZFNW?=
 =?utf-8?B?WGJMZlhycklabWZXeEdTNXVrQWN1clQ4NjNHNUpIZUlEeHk1SWNDY1paMmxK?=
 =?utf-8?B?TXBDZU9aRUtkM0luM3NUTHRHc3NRTC8vYmhRWjVCM0t5MHB3ZTBzNnp0TVY2?=
 =?utf-8?B?ZTJ0SUE3Yk51L2lOSjROUUZ6VTJybXJsZGZ2Z2x6SWY4cXRZVDZHRWEwbUVl?=
 =?utf-8?B?NnNCdWlwODU0cHdzdDZPOUpkTURBKzRHL3VlZEpmK1E3cGVIOFBvN3ZaZGhm?=
 =?utf-8?B?UkJwNXFyTDcvdFJPYTNwcTZaRklDcUwxMElBeVpmalR6OVAraU41Mm01WHdx?=
 =?utf-8?B?MDJTV1k5R3hRNEJmK2pwcmZZcUxLYTVmRzNOUDI4VldTVEh1SGd5cmliVks2?=
 =?utf-8?B?VVl6RUpaeExuV0VUak5VU3hTSmk4cDBsNXRyZGZYb3lRVzY4UVVaRllPL0pj?=
 =?utf-8?B?b1RFWW91VDZsb3VGbUhPS1lBMlFtNFp5R3hucTBUSFVNK0pJenY3ZnZLNDNm?=
 =?utf-8?B?aVdrQW4rZ21VaVNNaTNNZUxObUxPanBxV0hZa2x1Zll4cFZpZS81RitCaFVD?=
 =?utf-8?B?YTNkbS9OYW5GTDdjQW9sY2pTbEZWa3dLU3JXMlI5blUvenc1cG5GeExxcHVN?=
 =?utf-8?B?UExMS1JHOEg0OERVdFZMSHVXTUpKSjF6aTFPNlB5WVVmcnlnSUFuYUtraVU0?=
 =?utf-8?B?TlJ3NG9HYkU1TmIzRmJNQ3NVbTBzbnpJTDFTVzFuanlpaktIZHBMN0t2SGtH?=
 =?utf-8?B?WnVqeDhHUUpyMkNCanBXS3J1Zmw2VWxsM1BkUW1HSEttcTF1aS84MkhTM0p2?=
 =?utf-8?B?STYwT1FGZFdTcVBGRjdqN0hubW5LNVF0QUZWRzd2aVNnK1czbnJ6dWsxcDdM?=
 =?utf-8?B?VmQ2Mmp1MzRHQS9RV0tISWEvYXV0bDhHUTQ2QzJkMU0zUG14Vm1BL25Bck9a?=
 =?utf-8?B?c0szY1VSUVZKcG9PZk95c2dQR053eXFyaHRSWFdlZXIzN3dwWDJQbGJjOWxt?=
 =?utf-8?Q?YeQE=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 12:44:03.3358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f464c8e7-67ee-4bbd-598d-08de00e833c3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PPFA6AF62A30

Disable Hysteresis Enable Field in pad ctl register for USB OC pin
as this is more appropriate for the signal form in our case.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
index 755cf9cacd22..2ecc8b3c67da 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts
@@ -452,7 +452,7 @@ MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12	0x00
 
 	pinctrl_usbotg1: usbotg1grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO13_USB1_OTG_OC	0x80
+			MX8MM_IOMUXC_GPIO1_IO13_USB1_OTG_OC	0x00
 		>;
 	};
 

-- 
2.25.1

