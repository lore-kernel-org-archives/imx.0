Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8151320D4E9
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 07:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772177748; cv=fail; b=YjEhUdA2xfL+2GRO9qySxZEYGnN9S9KWmXH03bECOjtrsXNgt7kEJez9nKmmC93G2mv1j4rd7lflA3JmTaBZyZjM1yYSFTik4xDGyTWYFHrX+JGENl9ktYnNrmTDVJ0O0ZiQ50e6oUCxbeWMJyXqKsMYPsOemnXDGSVCqaoBlhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772177748; c=relaxed/simple;
	bh=N+5eX8jXAEzJayTzyjO+45UpnGxSVVnAxgUaNDbMGRc=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=OX2vsMnBuiRTSbs4lOAHZkJrRBlt4YpJ3txBSPY1Z/rH4JG7zyrEJMqnx23GVvICrHKmXSW1lL5tWllaKhkLdYus5VHHsfLTG4irmgBw2m9Msxa6ppLntnarNZKMzde2aE445cnM+nwkNrIPqZyiH1/VS2DvyHAT5XDLSUpwPIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h30ZQaMz; arc=fail smtp.client-ip=40.107.159.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h30ZQaMz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usROWmhFrwj59lDxdrzXHEBamPJec5hIRoe5UNp5VOnRib+2hSu+FnCnli+bzNnzn0Aq+dolo6tPhCV+B2kQ2P0Ne5XU5Ic+WN9iw9B8OYEfKeXSJlcPj1H0FjHxL6w7nDYF5603EtMB9hH7uhGtZ8RInBlkag9mR/Hu15NknN9BZRfoZVe/7n6vqE7CeVf13hyGWUVSuAFZkdU43gGE2okhvPomIN1PCSJmXk6kwI/aiAOmO6Smw28pgcnpwUthu/pcmVN/2peQmp5WyfVQxehbaKyzjBTzb3Dl5yQPJfDMby4wOodxqV9a8vS5qbIBXo26Uj5IpmzLNDIhtk/OmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoHJ4ImvXmU0plrueOPM+Le42l3mps+PmtM/z9jCD2o=;
 b=XLP+Ip8BAOpdU5RxI0mSc8d/GcHTX1DSp+xyC9qpoBdFjtzBI2S/cfR0e+ru1ILIUXzdS/6Cp/5zZy4XlVtHXQLhlrGIVy7aTo098nAEpoYCnASqKl/3PRl94j9Dp4EH4Q/C9Ck8D/uHGyaUSgEZcT0Wa4Q+xqWsIJLgEGdks8Tsay2hap4CYv7z2u32KoY+t6aYYplWsaL0UkH0HT5LPHA9CHM4KWxw6tUUL6pvbie8Ji8Zkeqwez3UtJGK08BJJBfQGdNtMqDyACbhYB0K7myvGxT0YNM2uCdDRwKUjYtCsEDuvKq4MiGXz4Oz1eZ2uWwpl0aAyUiv7oWEwFWi9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoHJ4ImvXmU0plrueOPM+Le42l3mps+PmtM/z9jCD2o=;
 b=h30ZQaMzptQ+uZbWKeuDOKr+Wa4RXFsdRQdHgf7SrYr1HQes7zak5zmScc+p8vjnqC64ZQ6uNCRGi+3D/x0uMdhNq5UQ5pvXZSQBcEUv3GnGaaoF5X1OVUeXlS67ho7Lh18BgSSCUqUWYUpk9d0B/3B8BI3MmXHl9TddpfqlS1q5RJOmVT5Q5z4aet9fjM2wgqbE66gilhdQegzFe6VFXqxP44chjvtPy1NTKI5t16DEVDuqK2MaWWE9FcjvK+APfTP6Jn1QG6T+LPTnnBKwT1QDpR/27/n4F5Bocrhs7I0v4ztx3R3sWQ2dUuG1MuUZU8rOziUIMfbbe2LRlcu6+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8837.eurprd04.prod.outlook.com (2603:10a6:10:2e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 07:35:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 07:35:43 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Fri, 27 Feb 2026 15:36:41 +0800
Subject: [PATCH] drm/bridge: imx93-mipi-dsi: Fix mode validation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-imx93-mipi-dsi-fix-mode-validation-v1-1-a9cd67991280@nxp.com>
X-B4-Tracking: v=1; b=H4sIAIhJoWkC/x2NSwqDQBAFryK9ToNpfzFXCVkMTmseZFRmRAbEu
 9u4LHj16qCkEZroXRwUdUfCMhs8HwUNPzdPyvDGJKW0pUjHCLmvOGAF+wQekTksXnl3f3i3mc6
 1NMOrEyd1X5EdrVFtdkc+3/O8AM7h5g50AAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: SG2P153CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096::21) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: f6611806-291f-4222-04ed-08de75d2d04b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 genGjR797er6088o0YRUQouaCkeGc2sYVcNQHNhiV8cUduKuWsqYPwqBrjRl81aEH0/AhiSu4bV82e5zWV5kWf+3ROAxENmSV7++gxxnO1LoypB4S3eNs7+x/YvOcl12g7UWFtkIO2HDaX3Ty7RzIXhRboOX5R936mHvv8oiO4m6o/iNzRdi2XbL6EyxIvVYxaEfrU+PdoogcHlnkIcDVPODRQ3xauz7/oBCQi+ZaQQzRoWWPHC5aKuPbo5Ho0kqKow91sAhplxWgGPnL/nuMMDpVhZpPWDF96QbC4LUSNhUMz4ffxQo+u0l679QBhfzIC7su8i9pysEPpxWb4RPxPYtOGxqo8cLtzhpQqfvUIqceSw8Nmi09l932OnZDuaVReknfykJsxDO2vQWRRDK9QgTl+h/QrG8522zJqZRh6VA6UY3Ao9RyfsZ4FUkqCB75tL7sBSEb8ZEwDPIbag9uMoftduxufUxe5pgSE1PEzy7m8b9OMqr8MYD91fhJ1HQXv4xrZNBjJGs/NIKaaOyqkHHm6rU9flbgIXiCcX8JZHDZMVbNbitvyJFdh8ulPPVpMTJgkiEAOG+1EtaGERZb58Fc75CTwWusyuECfogU/FXu0IiGZwiXDbpj1/3a3/PJOQDHFOEkmujehaA5EaYOzkuhtYog9rXQbGb+HCADdvOUb9k+4y8jJusOEgK6MpAEsfKxdyXc7iVQzVK1eNfIsqsyr0qb4usFg3lvoy9hErPGtF8TgjUq4P1lpNyIX1bELEenA/8yQc4pMLZClXy4cTzW5a7C69JvC6VHn6IbC+pRitFnkPKcBPR3krz34UH
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TmdiSjlRT3R4cnVGNFlNenVvQlFJQngzQ09qZlJxSE1vbUF3SlNaSUJQeVJ0?=
 =?utf-8?B?ZEZucy9kRVNWTlhrVndsUzVSZjNETktiRzkyRHNCSmgxMzhoazdOOVVlaXYz?=
 =?utf-8?B?U3FzbGpaR0tkaUcrRmJPemZCLzhTZXBTR2NCS1M1MXBNcTY3ZE9Xa1dxVW52?=
 =?utf-8?B?VDF3Zy9wMEgyTnlFTFl2RjkzRXVRY2xiV1ZaamdCNHA3Sk9KeTZlV1RNWXRM?=
 =?utf-8?B?VUtKUVRkZEtyNnRIK3NBazhtTXd2WWgzV3gvUTJCZCs2VU9kRTF6c2tJbnhn?=
 =?utf-8?B?dGFhRlgzckFwSzdoZDJid1k3UlNNRUw5T1dtN1dHWjZPWG41bzZhb1Zic1VO?=
 =?utf-8?B?cmZrZjhtWUpBMzZFeHYzM013RThxdjF5SDZmbEVoeTZTcThyRFgrMnJhWW9u?=
 =?utf-8?B?SGVyRGtZQ3J4ckxLSFJlejFnb0I1Wk0yanlCV280TXl1QkhqRGd1c1ZvVWFL?=
 =?utf-8?B?K2RaMlRpM3Nsek9oY0RLcDhsQVQrRHFFbzZTR3VsRlJUZlllVTRDMEowNFlK?=
 =?utf-8?B?K292TFJOdEZUZVlQeUYzOGNTem1zYm50SGE4QWN0SVg4QmRoRG1RalVHUmwv?=
 =?utf-8?B?VjZ1b09TdHd1ZlpvNUM5d2wrY0lScTFVS01HZVQ4S2t3d21wcWFoa2Y5M0pr?=
 =?utf-8?B?eHoxNlhaay94bHZ5Y21JbzlzUW04U2RWRjlDUGxRZW92YnVHZ2t1anJoYnkv?=
 =?utf-8?B?cFEzSHc4S05zeGdkNUNRYWllUUNvNHVDSmNLTXVQSDlDTXRUWTZuK3AwS09k?=
 =?utf-8?B?QjZjbTh6QmlSbHNzVG1oRTY5TVg3WGN0MVdyZ0dTTlNyTFdOOFZnbWFidE5a?=
 =?utf-8?B?RzMrTHRqUlRBQng4MjVNVWJMa2ZMUFBkYlRSdkF1L0wycGRaTGhTUnVOVkxL?=
 =?utf-8?B?S2lxMythQjRoM2dXWE5oSnNnQzFPWDBTWTlaQXBhSjJqVlF0KzdKdnBSSGJs?=
 =?utf-8?B?QlZIVnZPc0E0QWFkbVdvOHJ1MXp1bzJ4RjA5eDVoRTZ3OU56a1RZYjlWME5s?=
 =?utf-8?B?dm9IMkFXMEc5ZzE2UmZMRkVTS1JkRlFaRVhtWVUzV1h5RGRmUWtlNC9EL0wx?=
 =?utf-8?B?amZ1dVYyZk1QUGw2dEVIUGVSKzNkbERYQ3pzdHMvK3hZbVltTGNrSTNQbitq?=
 =?utf-8?B?SFlXNFRncWhYenY5VytrMW1vUVN2OW4vaDFrektXTFNNMk1mZzh2YmxtcXFu?=
 =?utf-8?B?ZFFvbVl0OVdMbWN2R3pGSzF1OXREQlFtQ2V1OG5LTk1vQmZVOUVWeEw0OHBs?=
 =?utf-8?B?RmIwYXk2V3FwbmQ2NVBDemt6cnhva1VMNVRPL0RIeExMdE1xUEV6SDFQajA1?=
 =?utf-8?B?c3dHUDk2WjVoQ3YydGRpbVd3bit0YXlQa2ZCYVpnRHFsVEpaQnVqZ2hTNDh4?=
 =?utf-8?B?QXNnZmJLeW1HcWNWeW1INFYxUjc3RTg3RnNXWGdDSmpTaVhwTFVDTlE4ZFE4?=
 =?utf-8?B?aHFjNHZ4NDEvNFNmYmRGUm5DV1YwYjhWdlR3dG5DelpDWmx6NFVFeElqR0FJ?=
 =?utf-8?B?Z3ZpSE1USlpJNVJRb3VMRjMxM1hGTi9pSjN0WWFXOFNXdklGRU80d0NKd1p5?=
 =?utf-8?B?K05sZFpxYllQVkhTSHlKeDdMcERnV0RHVWhSUHNsWVdBMUgvbS9ZWjh0Tzhm?=
 =?utf-8?B?OGRNK3p4SU0xeUlIRUFlcVpxb29KTWR2NERUN215K3hyM0RTN1RLZnlsdGRK?=
 =?utf-8?B?RC82OWIzRml0dWZ4aERTajgxQXgyTGVoLy8zSFZ3V1B1blo4aWVSU1B5azE4?=
 =?utf-8?B?R0Y1SElRVFUyTmFTN3dGOTVpcW5CUWtmek9VV2lRUTEzS1hTckNDRzZtTERT?=
 =?utf-8?B?K3BjOFJWMjNLaHhyRmczd2puVUk3NHNMUGp4aTN6QzA4czF0SUFlcUtCS1U4?=
 =?utf-8?B?UDI4eWJRUy9uU01jRkF3a0hpM3lTSzJXNnFSemNhY0lUWjc4U2Y3blRFU0Rr?=
 =?utf-8?B?WUVOR04xK3RCZjVtdW1yL3dGaVBDSmlQelYxQnZtNzhyT0dDRTJEdzdWZUpB?=
 =?utf-8?B?Q0dlZEp4TGx5UWs1STBQem1LSGoxQlZaM2hyY3NDZm5OTG5lM3huMjBHMjRs?=
 =?utf-8?B?dVo5aFVCOWF4L0JUbFgrVnpzNkFiL213Nk5hVHVERDQ0NDlvT1pQalcrYUtY?=
 =?utf-8?B?VzBydHJrVmFMQnlWczAvRUhqNDRiaC8yWDMvSHQ5bUtlSWxiRU5jWjFSRjFF?=
 =?utf-8?B?YjRHWm05M2djNTNEV0NkUVRqMktycCswZDV1YWY2SVdnZlBnTVRqOU9rU2Y2?=
 =?utf-8?B?d09RejVvSFVxWmIvQnNkU1dhU3hUaE43UmFPSjhkQ0VuVm1CcFZDdTFIaGU0?=
 =?utf-8?B?RHBqeHNqWS9CRG9OQnNXWnpZZUYxU1lXMVZtZGpkMjFQbGMrcXZEdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6611806-291f-4222-04ed-08de75d2d04b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 07:35:43.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Lh1gwW584msFfvbDnBOkd+8GhV31+UXVqLlOzwgfx15GxGr8k6QPNpSfG5QRu841BOCuVOSHtqs/7cxpBOjjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8837

Instead of checking the last bridge's operation bit masks against
DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_EDID to determine if allowing
+/-0.5% pixel clock rate deviation, check any bridge after this bridge,
because the last bridge is usually a display connector bridge without
any operation bit mask when the clock rate deviation is allowed.

Fixes: ce62f8ea7e3f ("drm/bridge: imx: Add i.MX93 MIPI DSI support")
Fixes: 5849eff7f067 ("drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_get_last_bridge()")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c | 33 ++++++++++++++++-------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
index 8f312f9edf97..6d65df9ed970 100644
--- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
@@ -493,21 +493,24 @@ static enum drm_mode_status
 imx93_dsi_validate_mode(struct imx93_dsi *dsi, const struct drm_display_mode *mode)
 {
 	struct drm_bridge *dmd_bridge = dw_mipi_dsi_get_bridge(dsi->dmd);
-	struct drm_bridge *last_bridge __free(drm_bridge_put) =
-		drm_bridge_chain_get_last_bridge(dmd_bridge->encoder);
-
-	if ((last_bridge->ops & DRM_BRIDGE_OP_DETECT) &&
-	    (last_bridge->ops & DRM_BRIDGE_OP_EDID)) {
-		unsigned long pixel_clock_rate = mode->clock * 1000;
-		unsigned long rounded_rate;
-
-		/* Allow +/-0.5% pixel clock rate deviation */
-		rounded_rate = clk_round_rate(dsi->clk_pixel, pixel_clock_rate);
-		if (rounded_rate < pixel_clock_rate * 995 / 1000 ||
-		    rounded_rate > pixel_clock_rate * 1005 / 1000) {
-			dev_dbg(dsi->dev, "failed to round clock for mode " DRM_MODE_FMT "\n",
-				DRM_MODE_ARG(mode));
-			return MODE_NOCLOCK;
+
+	drm_for_each_bridge_in_chain_from(dmd_bridge, bridge) {
+		if ((bridge->ops & DRM_BRIDGE_OP_DETECT) &&
+		    (bridge->ops & DRM_BRIDGE_OP_EDID)) {
+			unsigned long pixel_clock_rate = mode->clock * 1000;
+			unsigned long rounded_rate;
+
+			/* Allow +/-0.5% pixel clock rate deviation */
+			rounded_rate = clk_round_rate(dsi->clk_pixel, pixel_clock_rate);
+			if (rounded_rate < pixel_clock_rate * 995 / 1000 ||
+			    rounded_rate > pixel_clock_rate * 1005 / 1000) {
+				dev_dbg(dsi->dev,
+					"failed to round clock for mode " DRM_MODE_FMT "\n",
+					DRM_MODE_ARG(mode));
+				return MODE_NOCLOCK;
+			}
+
+			break;
 		}
 	}
 

---
base-commit: 877552aa875839314afad7154b5a561889e87ea9
change-id: 20260227-imx93-mipi-dsi-fix-mode-validation-425c872a2493

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

