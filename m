Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010020.outbound.protection.outlook.com [52.101.69.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6127279DC8
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 05:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770874274; cv=fail; b=Cm6My4rIozeNJNosm1sHAowA78NAtkEY082UCxocjyY+OUnKj1BnKicP773fr5scLdB5y9YjX462urTqtY/Q0evlUNGL82szyzme/+e+QXQkEa8belbMuylp2ejSoUE3IEoHGlqy74gJwc3FL64WJuYrGCAdaWuCsAVQtUz/6gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770874274; c=relaxed/simple;
	bh=DDgPdRb0gtj047Jm54Ni1cUUE7SSjonyjB1/DkpsEq8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=R9YybpofFjqGnKtarfoRXp9bfngFAYffZOPU5Utgjnb+j1XplLZ3Hyxqlq8kHD1vr1Sxbf6rwS2VZBm87TrSKWMaAoocTsBnJI1VdqIRx0IAhTlo0+OaIt/6k5Qf69LRtACWPTydj2pxOLergomyl5Eooy2tegjrOeLfuEpN5A4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Fs8yJquk; arc=fail smtp.client-ip=52.101.69.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Fs8yJquk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVaoWdsQWA8kNBI93WvSEKkxWf9zbsmWg8+U3CTJnN5K3OKEmLFUHQJtcuHV1RExfdAlwTtVNUVn/bKMUkOjFJLYmAKa9ECtTre8sZOXowaWPLnDCISaqEeHoXbQHvRAtizK9zIP+8XDIe0b2BAYaGk7IDOpJxV2ynuIoOiglYTOxd7V0XbiU5nSxry5wl/rSQ+UN678CG18B7q43q80nC8Mm4rUWP1XQW31zNKXvXh5QIcFM4DsrQfOt6g4jB2tL+riIgR4EJXZPIDJJlltb8RfjpT08RvswwJpdQLnFxU+AuBx/QyJ6jl8bJUCfZu8OrJa1rJrb8ABdhcnWNVG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/f7aFuY4ShJpJtCH+a+kBjnW2G3oM3+Vvibi+YwHKH4=;
 b=E9RJ2nbBSk658v7f9w2s5Btj2UO26BaI78LL0ZM55x9vIcJ6XIzPYZqfw3YtRShvCKbKBIz8Gn3bZINSNEyvrY+kCtIx9i66Z7Tq0P7twxJsIDcy3HRt/37lFWnRlb9QLvYdmBifp+b1T0UEF7nEYFX1yzJwva/ZAeAIiVjNfY4v/bKsUpDsLTKd5r8m5V7MP/h3WGSLlMrBT2g2PSF+eIGQ+U3NhF1J7bhn5FcrDQg5EW6BSy/5JOO2gXJegWBv/ITXO/XcScjIR2CfEl9N1UNxNXieqEzQSUTdVybyidihSojpq2LV13br3k0cG8zf/d95Iz4n9eBXr0LVv+E7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f7aFuY4ShJpJtCH+a+kBjnW2G3oM3+Vvibi+YwHKH4=;
 b=Fs8yJqukHB7GTPA1C0rDHI2zX6LkYreLW6n4scR+EuxTnZJLJSfMwvG1na7dy5/FUetdfXkHxuzbLdU40dA149tHh0Npb0kmz2ex0OhDeOs/deHRXwnK2mN6PLOz+2i1e7BpD58+Gb+nflHSPYpnAlt5d5SHLGmjezokXno70InHa43LtuEaq50Wv8YXA+AgdWty3CEQqQd+2eLUSJWCnAkwEEpEWJYaQ25nkBX8wDf+8imF/58uUhWtKCkQGNAkFz4IIDoyrFKBvOcyQ+wpmM/lq4vx3eIqNhPXsanHSwtl1nn5HJjkM/G+C021EHeFIU2G824k6WC6PxGL5p37ZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS1PR04MB9406.eurprd04.prod.outlook.com (2603:10a6:20b:4da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 05:31:09 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 05:31:09 +0000
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
Subject: [PATCH] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Date: Thu, 12 Feb 2026 14:30:36 +0900
Message-ID: <20260212053036.2581083-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0018.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::17) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS1PR04MB9406:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c66868-f32c-45ff-4e1a-08de69f7ed2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hoYfvqCFxTYEsF26JBSuhn/hoosSrdrieSqB/9qoRl02tTmL5wHMK2Nl2JFD?=
 =?us-ascii?Q?fjgRHFaqV0VAXb5nFSpsUclip0eBxa5H+oER4Y5/tkHxladT/mjVuMe1nMRk?=
 =?us-ascii?Q?TwAc8Nu8MnEUj5sla2ZsPzT19dRmHBz7/V3p1kHAm6XC+u/68iAM4HKMSyOe?=
 =?us-ascii?Q?gGdqaSiBoiSKbazssAi8nWkKg0riAnP1KELfjimQcdK/khIkittO1tPRS+/t?=
 =?us-ascii?Q?3BkqHSgH27F9Ib4bqwYoMq1Wm+nsNIXROdce4yXXhx7uxu2LIu2s0sNHL682?=
 =?us-ascii?Q?1cRn5RzWJY2OLP4cv7lPhiiQ9YuOrno44kjUnci4iS+VZL4EWa6PtzTWeYlU?=
 =?us-ascii?Q?gQPoCM2VqVUUdQpYsQ8bdkHnxSD1Lx5/5Kb9WQyM1sMTWsKBAR978yPYSO3q?=
 =?us-ascii?Q?xXVzvel33CBqndzrLWBiNEBCfkV6DzcArOuj/wLFclUWmG20f2z06sJe6lDz?=
 =?us-ascii?Q?5tjM48kXKjLy0jhgXJL6MhPZuGEuYfD/a0I5Ocyp9LjhVJlABWLc5aad33wn?=
 =?us-ascii?Q?Uemz2XzQrUr3EJdMWMkNeWH4B+bygs8wDv7BC64wePRwYp8KnWRf6v6gF6X+?=
 =?us-ascii?Q?4pCLp+usOu1ojjz1WxB2H8LwbDagFQ0RJQXJ0s7WeIhD6m/x1hScaq/WnCGy?=
 =?us-ascii?Q?uSSF1LZ6ogSLwbZk1RkB7RSN8cLgvw+9CivELG9hR2dB/yQVFpjDQ8eGGBjw?=
 =?us-ascii?Q?YdldZJJ9/0K42Wlrh8aoYIwJB7tl2QTgW3vG0gdlUIpesBqhR48jTMrCMqK7?=
 =?us-ascii?Q?vMGdB0xbnad754CcWj442fiQUIWl59Ef5ZQoxnjQ5OR+OqoCROXfarwLZvIr?=
 =?us-ascii?Q?TsNY4ybS6t2+YLnIU0/K5fJLC8bU/N9NYLIxVP2O6x8/wcW9WOqb3mGgwory?=
 =?us-ascii?Q?2yh6ojAWWWVj7I1nG1IP2SN/duK2tTSMD7rY/C7xQWfp+iK0VNXa7XqE9xjB?=
 =?us-ascii?Q?nRJG/SxtZ2jNRHkRD1Eja/MfG7vQKPcY8ZOTAQurj0AtNoT2wwMB7ioTlmBT?=
 =?us-ascii?Q?FuOkEMA3m2+1RcOaWd8VqocaGZLxUKjogtn4UQct1udeo8QDKYKA0Z0bMPY5?=
 =?us-ascii?Q?IBt8NVOqivVySELCwB2EIuaRTb/MLuqXviu5dcElwoLOBW8aM0QK9/35KBmb?=
 =?us-ascii?Q?D06seTf1X/bLEWwtRRuyt63G5IP6fOJ/tYyDuVzwCq4zeg3t+6g60un/vJPO?=
 =?us-ascii?Q?3pElkAMR2YZ2ReI9rdJScnjkIHr2uOoRmfrsadvHoYQLaQKAMWjDMTp2uC2J?=
 =?us-ascii?Q?xTBNk0mz5w0kZ4FZZelZq8kbK8B7iqRRik0nO2uvnDUK4OCNKaVxmPKc+1Js?=
 =?us-ascii?Q?T3EF82r99H7sHKIj4SIw0uQWK9UyTXFfW7kEhBdzvmgcp2fVsVvb59wTsTas?=
 =?us-ascii?Q?zuCmM1h9Ue5zwQHo/zWN+Np01VdVAcYmUzznFB4YRaRXx7NkweR/ijpENuM8?=
 =?us-ascii?Q?I7d+0niUzYptbFC31KFlSIiwrXCJos6Wf16JOicxkj0fIttBXxjmdrJolIAc?=
 =?us-ascii?Q?pYPck5dP085TAaHP5nrtgGCs6bJt2IV5LNl2cbYX9dLTE5/URYp5ZHa5QMLt?=
 =?us-ascii?Q?ZOjv8LYoFA3zoSnBlgsH2LGdrR2jYogc5ITEL+d5xre8+rSuX1ZagINxQ+Zh?=
 =?us-ascii?Q?m630VrJV1tKT2fUGdhv1ioPpUfTDf1Ala9kO4msi3Bpy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vendHZ6lKBfIyizi6G2D1UW5MQ/Dd6Ql77yGNC6edcnyaSxen3zf8mRIseG2?=
 =?us-ascii?Q?IpgJ1zuH1+zntexg7JDkiGGI9xNu2MNahR/sU8ZjjD+4090CAe0hg9rqSPTQ?=
 =?us-ascii?Q?7nlUIMSBn9CLtaiIzhjjhXnWhsZkkj4DscaoMKr75ewuEo1hdVh6YfhWxL6z?=
 =?us-ascii?Q?jfCttWMglLqIf6PM8UcPkq6PruXUlFpHfsEatmq2GJ4FwET9yCc6nMWXEiLM?=
 =?us-ascii?Q?LH0TM9gmbc6yvUxD5GZ5n4+jCa/Ak6SPFIkYAt3mIoI6lAMC8vkPGcHGPSff?=
 =?us-ascii?Q?qS0aK4Pp7VqrToW0G0RQ++RWMKDNAOvJgm37DT2Xo1MwvaKFywGhzBjPCUkg?=
 =?us-ascii?Q?9XrDNwW7y46kAQhov+1kA9iZE5J5LV6eExnGvRHgmfxLXJOlzZc94ndgiC8o?=
 =?us-ascii?Q?VXuz9i+x8Su93xnVO7ZEAtZZyApLkMVE6wfuJBX5BNh352moBrzU2WMgFuWA?=
 =?us-ascii?Q?Yur+zi+TY9MnjOVazCXvSQVf72pvQhLd1Pb1Vpb5+tDt/sekijEkFAYwRvla?=
 =?us-ascii?Q?ZGlmzUzMQX2n8sANuhyoUomWY0c3tP4LQa9yxZ5KiK6B3NvNDWiqXTHUn5R0?=
 =?us-ascii?Q?KXnko3RT5kEK5xUxeXSXlNCMCDwEHjpmUM9DujIPEirBh6MWsVDNHDh/QFPl?=
 =?us-ascii?Q?iC3HNZIk0VajxQT6SdUkvTNrHw+wTdVLvoTaWdu5qSql/Uq9z7q9ry19KONf?=
 =?us-ascii?Q?ydqoq7G7rGhA4hDxlvPWUvGlhDfLoTwCofdJqAFyeV4wRPhLo7l5IcuKHv9+?=
 =?us-ascii?Q?ZtMyr3ErEHODlIl0JqdgDsCIR8UW2SnfHlJRiQC2Bpt831Ces9azCU3yP8ed?=
 =?us-ascii?Q?bWqXhLOkYGIZxEglJMl4dA4lt2YzCJLSVb09swz9dH68uJdQb+hYdCFpsByp?=
 =?us-ascii?Q?2MNu3A2dw95IBdWggTb6BxMNaxcb5/WA1xAAK3C/oFUO3L25iQyQdVx3NNeL?=
 =?us-ascii?Q?fvG8qzw8dQatVI+NHevyGcW9zJeM78cAfRkjcmFwHcqL9uhAVkj8+dNYv8+5?=
 =?us-ascii?Q?JF5+uneeYXbJvSnC+sQuL3tuw3OSCNwy8MuxBsU338ikTkRY4Ls2dZwUd1a1?=
 =?us-ascii?Q?KzEBRmevv1ijB41nmELO3Wkol1FKSBOmRdx4EJIkvj+rxIJL1+zjjkzvfGhz?=
 =?us-ascii?Q?NW4IfzwjW5bVZuMzPj+cUd2gO7KpyAqo1y8er0MkUwZekJ4LgKiAzQ6t0xfN?=
 =?us-ascii?Q?KAUEWD/pn411VWaWv9ViaSI1tXOm7tLCYJTMmzMtLi1ME6TWBCi12Va08BVS?=
 =?us-ascii?Q?kiQlspCmGBiqdWdB1sv4tMTKitaZI5hlvhKvoIZCAz0jgxE8aPibi63Z5lAB?=
 =?us-ascii?Q?60+/FTGd21/ReclEJHhHW+VDRqE7R8FdfpO+seetnVcaivL5rPMpipwV05y/?=
 =?us-ascii?Q?LYE85IeuRn1YP0LjEQpLOaSX8ykxsqR9Z6spNtlQOKDJ+QFaGwarvRxY/Qpi?=
 =?us-ascii?Q?WtXfPMQOaSJ3xHW1kbYIDndxn9t5JkUByMxeo96zo2y6jMMENHgL0f6wTQGC?=
 =?us-ascii?Q?w3OsFcB0rYz63M5jXGO2ntQV2ZRlN9xvOYtxwEMKS42PGRvXwBiGsKpsidQe?=
 =?us-ascii?Q?Yanhh4DIph9mBTJgOpoExYkb/EkIagvKr3Wm1Pd9CvWYxF0m6gmPIlCuisAb?=
 =?us-ascii?Q?Ddq7zZ0acY2oL4p1Fe6nA120CVgsaTgS6MeheYp9L7nCDqbpAbdyQkZjuwBT?=
 =?us-ascii?Q?OfC5IlKLsTWnTDwcGISRWxiSPqa+oRl6SXPqN6cmrpQfX/+ZT1NiGHVTgt6j?=
 =?us-ascii?Q?dXMYJ21rfw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c66868-f32c-45ff-4e1a-08de69f7ed2b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 05:31:09.6694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BIGc8Aq0ehG0bkpwpO8vyXLVZ6U2AjcIQ7rSvPtVXaUgvGUdKW++37smoNaMHsmlycoag1TKFlky5jKuJF0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9406

This machine driver can parse DAI format from format property. Add
"dsp_a" because it's one of the DAI formats this driver can support.

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

