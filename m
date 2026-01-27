Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A3829DB9A
	for <imx@lists.linux.dev>; Tue, 27 Jan 2026 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503097; cv=fail; b=h8UDvItVRDlYz6LvaUEdxq0GT4LU1QY7Ar6tWtsmNcoATKBzDbhcC8YoC53l5hT1qqufdRZ/RXjuT0kGuGhVw1Y/3iAkqq0cN5CetkybcaHULzVvfdzvRTgXmfVJ/r2ZZrShL+KnW+S+wEyQ+jqA3CQIGXPxsvAimtmyO8+nKtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503097; c=relaxed/simple;
	bh=SDMG2OUp68wT/V5y0kxhqPywxUWFyS/8lJIjEI8wnCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WYm7Nm7udoRBs02SLVLeJ1F0g117NtbPgLgruTylHqwA691CX09Nycp2/YRCHq50BzXpma54SuNP5ygx/wq10Bifi3ccDqJhxZhQNWbvzBqNA+UIYDGricQ13FG3TTgo+//ZfJ7krXGA3KAk4qGFE55kuhvqv1fPN9SLEQpCBxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kcSk8Hqz; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kcSk8Hqz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RY6hYTYLRIMopqzIU30QU+b3V+dsTWaE/YmRsklR7bZ8bJa373SSpB6CyfYcd+q2ok4qUYpw0RzB3UxET/JFscLAIRQc416jdEexiMuiJGRfEMmXf22B8JMl/eAfdOD2YSA1IBCvMfgWk/iCY4a1e3F4MPJYKH98QyhvFdx10lZw0bvwgzAyXwZgL0YI31bKavhJ4RSd8W6+tQGVsQ4ZlMOejvxRjFHTdBvbkBEIQL4VDKsug3CPumdQ5IuL2gX3PDfEKHLqlkYEfN3da1uksM/uGY7jmZykgJ8y4j/YR4+HKK3SG/tQ9HkDQQ1Ntrz5sJ3XI15YGMBnSOsyzp7+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mq3yEq86wsuYZVpSw+Hh4JIsficiXQkAuoCFSwnlpcM=;
 b=un1rAql4N861lD91e32wFk8kdE2eytJnEjuiX6hija6Tb88cujw4ZUhPCd4fCerc2C+acCkQZnApXx2rg3nV15iKlYerK1jBjYZELBZqtz6VFYeUlfjVCs9U54Y2m3pJy8777x0xfp9S1zPzNW3OtP+TJYprUO4RoNlr2bgvyXYuuLlPCYqQOLalaoYL6c5x3DXIDaqKytOzQR1ONSQ4aVi0LvESEnli1NQyZfsWkpkHldJnLAZ1+LqIv8hLtX6nxJRh32g0hWkMeMS8ZAaLyxwBum8NbHkgmutQUFsI2NMAPVy/Ls0+X1YNUJ+/6dzY7zoKtBBuE8gUKIiKst7QvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mq3yEq86wsuYZVpSw+Hh4JIsficiXQkAuoCFSwnlpcM=;
 b=kcSk8Hqzw4oJefs/0TpcBjjaCs5XkSrwIeSsctj51JJdKevEClBpzikvYUN3iFm9wD4FprLjlwFHg0NiEQafAwjDY5uVWPt33C3eL8YU83Y2mEv74cYN+CnVS8pHUsfh1HD0voAV4+Y6y8XxgtswQ2/IA+g38K2v4v20PdVlI6WCoIim3r1rVrJ979/N+uYQ5BdV+ysW3GgOHeE1NGjUURPhFsiyLWrQx6JCxKTAxPNRelvRf6rfmKSGQPWUAWzLIrwGuY2SO3hoKHEUBFZk5vXX0pjdfay36+4uRLaisLtDJR8cCXYPgkelkV64F0y2hCd3X0XWOPkaHwlI3VVS/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB9817.eurprd04.prod.outlook.com
 (2603:10a6:10:4f0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 08:38:08 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 08:38:08 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 1/3] dt-bindings: arm: fsl: Add i.MX93 Wireless EVK board
Date: Tue, 27 Jan 2026 16:37:25 +0800
Message-Id: <20260127083727.1839605-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260127083727.1839605-1-sherry.sun@nxp.com>
References: <20260127083727.1839605-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0088.apcprd02.prod.outlook.com
 (2603:1096:4:90::28) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB9PR04MB9817:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4a3de4-8128-4c32-590f-08de5d7f657e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?/dCbif7w+inJan21sZ57UEdDlQ57hr/+QyUXYDLwcB6+GSetqzxp2EDrLroo?=
 =?us-ascii?Q?Xx8Qvm4dTGeCOI+TnZ5ZLC/vFlAL9MAJBKyIgOWyYQgz8eg14u0ZUS5MWV8n?=
 =?us-ascii?Q?Tmg+hdmJ0C2VnrWHsm3dXMTRTL5wBtCrqXX/Eq29y2QsEbPRUk7drrb/+awe?=
 =?us-ascii?Q?kw/gFXkA/D5AFYog4ATHC4UzfszAZ2AUJH7CqBCTBlilI1Dw7EaSIEObBbFL?=
 =?us-ascii?Q?0AMruX/LK83wJgvgwpcpfOq/NL2T1DZRSzA225BBhfoS1/57EDyXJC21x99D?=
 =?us-ascii?Q?9s4oUSSHDzNwL0K3log+QXLEALmRtmxJ6UTbmS344JXcREIrRpJ7Pfhm9UZB?=
 =?us-ascii?Q?uqwpLW5g5qmRCIIsC9TqYYzAriDUVlc2NVXMXkZXiuE9DmXj0S4OakbVmTq2?=
 =?us-ascii?Q?A45WNecoQzG7+WjRGiHyqnG7uq6lMUUD5+hMzVruBxPUbpSXQomgX+ZbFa6c?=
 =?us-ascii?Q?sObK4WvWfEHPjEL/qPEajWFxhjtxVNkCT4465ZRvKZaFjXD1tIBtAz9uTesK?=
 =?us-ascii?Q?M4j+IhN0aUgi2eHNFbMJ+qDxeJ4xUizmsk1tVxC/dXKodfQCs8m13iga91NV?=
 =?us-ascii?Q?VWYz592gti2WEVvnxyWh7HrYBXpH3DgRIBu7FJBPY56agJwBuh1TuAySm6G8?=
 =?us-ascii?Q?dT+UoLlwT9WQOZUgG3OBNTM1/kHbqpKF63PFhm8bcFnouBLNUK5c1Zgg64uD?=
 =?us-ascii?Q?+8g3ngRLVRjBgkMF1dJEfVUQTt9qviYKCWDJZ5Mv4jMI6tQpGjXHKpzpZL0e?=
 =?us-ascii?Q?OxkyMp6qOx+K7gMMYcbnQILXnns7P0g8MSVMm4reiH5yOQ2j/ZMRm9QW9ot0?=
 =?us-ascii?Q?kEXim54vE1bEwKyMLHuyufXPzb+i2fWd/2bNKN0NtzvEatw64AAYiTx1W/63?=
 =?us-ascii?Q?adDZEFgi8qr7QxPGbUXwkkqAjzO2/Z9dYZacJf3LIF0HwqDrUhE44B5N8hF8?=
 =?us-ascii?Q?cXkF1FHacAE6DihcEClWdKzrhl2IZQKkWrr+sFp210tJBzz6Tmt9R8xKByl1?=
 =?us-ascii?Q?FjaJeZ8ApidYGCSmLWLrPnu1/toojvzGAkOUxFrqwO2y9750XbJ3LP4ZDWE2?=
 =?us-ascii?Q?iesErHDjDexnvo3AstKAVqYtKWtr+VxrKboJZ/kr7ouQjJ2CZF5tmP2cKmTC?=
 =?us-ascii?Q?zKUxMtvaYfd677lloi7qQjP3Sj/oUDuUbfPxg1SlSRvVuyQ7aPYuiQLdi61g?=
 =?us-ascii?Q?oaEwOnGBL6GRQft4y6Nus0eaMaAhpza1cyz5eymSKLfwoV0tgJXzcUlDVOY2?=
 =?us-ascii?Q?rhOlWXJfS+ll4YNEgFWYI8V/MQEETrv+UEABPoIloa3AeTei61TLnHVvS8Qh?=
 =?us-ascii?Q?bflYW5Yfhcxu0aYeL635bcizr3T2vFtMAWireelQuAK7vfQTrtJZtrmlXSv7?=
 =?us-ascii?Q?nZ4Zm93DSmwYmsPSyhfPE/zoHzfoxbhXKs5x9GDa5C8NOK+zm2XtC37eb3sF?=
 =?us-ascii?Q?UWlFmp6FX4Ab98cONl4bLwpr4wDd3QXigWTEfHL81tlrPhZRNjsvnsVjaYYh?=
 =?us-ascii?Q?L4D9kfkGMPDXc17EbZoiV53f7a0w1bc44Qt1kXehNBxEU10aiptQmBQNtK2S?=
 =?us-ascii?Q?gD6IQl/FeNW/E3U62Vfh5bjd8IHBQDZs4XEdWYtosA6c+dOf4bmhNyjKbko8?=
 =?us-ascii?Q?YOnEvAV1c70S1+2+7SooY0O8Ob/tZVXAvxL9PQUMPJVi?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?HpC79xkWMMjOJGe6hfwESUN/mvOAed0lmQJd96U2/ToAP1Ky2LwDqio06HM3?=
 =?us-ascii?Q?tlARDbzBxIpzwStZLXZ59XEROXf7O2zMLv+CCl8Gw421OV6Wz/CRhyO4QVbp?=
 =?us-ascii?Q?BDE5ttGNcIo82IEAbEw2k/vycEsAO5lpk6eIrtnzfvaJ0DyLXoaoEHrbzhyH?=
 =?us-ascii?Q?engKfSoDeESzMwejcKZihWYUD9Th9rHoZg9TDPuQ8udB6+XHFt0HrZX6UrSB?=
 =?us-ascii?Q?UY6dhBqHUEYp3bDvh4DuXdjE6RvxjngzPf0bvSvUd9mn0ua3X4kaf1zdUv52?=
 =?us-ascii?Q?k6Wad+7GqgeGD8LYSYLRhwGw0H0hQWfTeuNTvkoWsXK4MTkQM7lWXnPoXNeu?=
 =?us-ascii?Q?Jli0rqDKQ3cLtwF8xbwA41vKaQSIqLSxjJtiIHMy9ikEeNS6M7aoFMhjOumU?=
 =?us-ascii?Q?JOJpwLTWrPlAJZbKVDXO6Zce9EF3QD88tJpz6T7WV+KSgSnlemy7+QkanAFt?=
 =?us-ascii?Q?e5yaHnukQTJvlupYT1B01rep6opJZNGTsbEPWK5W9ZXTKMirnoDHnAIOzSwZ?=
 =?us-ascii?Q?eyZbWwGQa4ETcCVA1EiaAqGKJGSwtdoByjmBPm4mu/uEHgHR3b2S70niZXtz?=
 =?us-ascii?Q?851oX9LLhApY+B938vKXMrna5f8Q+qnrBgJD0pTyOTRz/wxX4qlYWIRFYgjw?=
 =?us-ascii?Q?GxKdY/7VD6RWu+YVG5/7DgU0MC5AyujnPKNIfeu36d4AWMvzW1EMdYGAsu+R?=
 =?us-ascii?Q?SxsXA41Ss26IsPxZeAdo1BfM5JJqnxK3xVCOYBnqBKXpDihIBKYIeqvAUz9U?=
 =?us-ascii?Q?tB+o2M0aEVIYzqEcUYfQYYCHtR819DWkIHRYYTlJdncrZ6/YNjxGSAKBkuMn?=
 =?us-ascii?Q?ZNlGzekoLO9jbJ0NI0w8wdVoFZDwpOvV5rfQcIGrkyKAR2K2ckyE14koUEOA?=
 =?us-ascii?Q?mqrhLccgSHRlPxDPilEQDe5xQH90dx3TjQBeNUj6f/9hIjTs5gWOaRX8wf2a?=
 =?us-ascii?Q?NcaNdK0hWby0gftNS6c90ruZpUoyPrtcvjGbtu+zSkpAtVsO7cBICFKtcyaq?=
 =?us-ascii?Q?Z141KIlwRyTwoJwd1oUiRRklvSfX0imP/T2FN/tfKsTFXG8K3e8Pdo1XQQoi?=
 =?us-ascii?Q?t0mfgg3y2TbAK1FSWQo8zLiS3R5fcXs4zaS/LwG1FIiXz7ez0wPVftOTDpfb?=
 =?us-ascii?Q?aN2I3DWlFK7w4ne38aXtz7QbYUS8GN30TlXxoADzvlnvyXciYyFx55uevlF4?=
 =?us-ascii?Q?umhelAQ59TnpGMDPqlpliQAzLs4dR3vYnzIu5iVdfHaSyTJ397b7klD0M8nb?=
 =?us-ascii?Q?vYtDkCw2QPrErbS1nPjkuioDUlwSN/Sw7OeDd4zUXX/ejVJxjxrjAo7DJ3ki?=
 =?us-ascii?Q?dyyx9t/IQDBaxOsrF4+Di9bKwXeZG7u87Bjevq0UgsWPNRDpD2HDsBk/5Wcz?=
 =?us-ascii?Q?Nzf0TGfTQ66nIoqsJ+2RdZZ/IImf1D1A8pqSP86mHrmA9D4uUuqPAx4t+ZwY?=
 =?us-ascii?Q?BorMPlYqmWFrxJhGQhgML7/L4z+eFCqaDzGVG8AeArO5OO+dcgF70uZ4kDWS?=
 =?us-ascii?Q?Z20pGRPMQG5zZNrLm8QEId1EV9wBkDzCPleAx9onqbv+IIMRnHXeoAEvcoVC?=
 =?us-ascii?Q?KAZe3qmKXvKG4PHPJq0i9UYssn/sAaeo3DvGagL1UNhl8DD+mpxbIjq7p1uU?=
 =?us-ascii?Q?ser0FJO35WdfdWpuSNhS3iQWas2QTDKLhKU/E8sadWOHElhLCLI7TGkY40CP?=
 =?us-ascii?Q?DYSYny4pB9H0TqrEww4xFMB8ncS+Rq0AXT/2jGsASBuJxCjhmpr7h5p61+s3?=
 =?us-ascii?Q?SJINIdhXWw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4a3de4-8128-4c32-590f-08de5d7f657e
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 08:38:08.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNzhhRvo1F2zVRcw8AfEa2dtpsExfnAnsY6HgSMCoi0rcRBCqxcU0Lthu9v8Wd7k3ubvudie9u7FwKOTuD5eMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9817

Add DT compatible string for NXP i.MX93 Wireless EVK board.

i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
(Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
functional and pin connection differences.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..df01b928c6c5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1441,6 +1441,7 @@ properties:
               - fsl,imx93-11x11-evk       # i.MX93 11x11 EVK Board
               - fsl,imx93-11x11-frdm      # i.MX93 11x11 FRDM Board
               - fsl,imx93-14x14-evk       # i.MX93 14x14 EVK Board
+              - fsl,imx93-wireless-evk    # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP EVK Board
           - const: fsl,imx93
 
       - description: i.MX94 based Boards
-- 
2.37.1

