Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC50B3BF698
	for <imx@lists.linux.dev>; Thu, 14 May 2026 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742376; cv=fail; b=lBTbtp9pwjTsHpC+KRWkycKgWTZVOJtIvVyBLnk1uG0vg5Gv2oBoWRr7yaK1q87yW7HC45rdidxrQCjT4C4cWk7OYiOoh/Akxm3v2zmritDtXlqXj+gZDA6ACGc3iBWDq68KTjTIDbrhmdMAOX2vlhAYsVdtaxDNgLPP9JBQmfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742376; c=relaxed/simple;
	bh=r3zwDuZFHWdbPOV5voEshqFjw5E8v3kNY5Gid2nkMvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gqFu+DKC9NOPX258aPv+VwN3CjCUKRVDsk2McL6MvInYuFMGgIBvi9Rb/T+CiRhN+EE81cTRI7HwpoV89+ZHIc/soOTQlWgYvcR7ul59u8M0qD896PgLW4iHRk7doJHfKZNwxttOO9Vht2iL8BlBNXroSIaLfx+VuOti0FFFlCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R0H+B8ZY; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R0H+B8ZY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSquLowv2ca0fxYVNrD1edZ6GU49Bygu3Bx9NP0SlVZoQ/ANfs/c3SNFkGI5WBlMiWYJ4DgOptG0+aw0MVIVK8qSJuo7UUFfNRJVX0KHQDZbnrTUamOjrF+AERQKyGCtyKi5exJlFHK0ZhXRYKx1epp5t81N6Wapg3TrTJl3rCEF1kodqpiG6+IZPa9Zyb6ENxWkIuFdLOldB07DQbLcDeaiCaV5F0GvbdjywGNwWqeYZRvAcwnfRsEDZU94WL/4eT2KmnAdMpiP7D4x7d1cR0J8Xnkro2IFiGDmC2QnclG0WONmWqDHw7JX6WdhypRJOEeyip9JmmAcltHsFOuNjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMbOlGLNGkCSfrhniKeEHnmYQGV5FJoUChL9k5tEV/o=;
 b=pe0BY13wqZs8NGg0mZXSRp+vGX4diCae2ohWf0Dy/yYMmXjERSFzIgjgyiOVWcQriwghLpPIwe7mw5Tb2I47Obcuei9mARGEQD9ndS+TWzuEOTMWvntAabXoqqKmtU4mdVcPd1f0DyIxTChc3X6AurzZ2IsGxhypS/wA2mV3KQk2E+I6bpkqoAedhjg5DM0jOvZtU9eluu7WnudRuBCZLLQ466CVISU/YySIpF3zkogNVbCmk1wiJyl8pOVXMb7rCO75PL/V6cZjPiRIeGASNRSVP4/fCH4TWjr8q0S2YYCYWppMKLJQyGfBh42SxcAa0igFliu8jCrIhRqWxeV/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMbOlGLNGkCSfrhniKeEHnmYQGV5FJoUChL9k5tEV/o=;
 b=R0H+B8ZYnPEu9ULifB+U2FXEewjV670jK9kywdQOOBARXkKORqvs4I1FygdCJvs7AITPTjRMpzzBW7T0px1ZcysZb2fR9+kHLnND0xiQLk5+ceJnYtBH+4G4Rxy0XTcDQcHtTEyZ9DsOnOFtmxrcNZV+7gfWozTe+4AEeEAkrWL0ND5EmujppRYBZGlOdLpEEcbJuK4Eiaw84aBTCB+ztPujJ+YCyjoQ/WV78UJsVueoh/3VILX8BhnnAIS8XRJsiSTzU21tLhgqMxS99lG4rNFYXkDw9sa1Xv60rF10PTmXRq1JrDda4g6OdsFRV1QW2uJrVOAlzDzpsXdj9h7cTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 07:06:11 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 07:06:11 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH 2/2] dt-bindings: timer: pit: add PIT node example for s32g2/3 platforms
Date: Thu, 14 May 2026 09:06:05 +0200
Message-Id: <20260514070605.996462-3-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514070605.996462-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260514070605.996462-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::18) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b46c878-01eb-43da-339a-08deb187477c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
 Lp6qmYAEE5TZ0JF5ya6qqSRQa5OwU+voDhv57ecnk96KTU9x5CAUDxxShAA+Wtmo/vQcsRDmMHx3C/GjBr1WhOuQ2uDqkQYHNJb4562qLJDAvGTlTaqs07OwjNcSvQ/aGQeKm60Zpk5p5lp5ikeArLTiAP8VwJ4H8wd2Cjx0z61nRrXfnDoQuUSM0nbgEzOHHqfOqGuldUngjC4kF7fCX/kAFr6q8Yr46bGbcR04MhaPIJQbw85i0eqRd4JyGCh6c97fREVREHvAs/eELeR1YQ6gV+kUSBkpHV6utsdWwVEoqpt0HetqA9wmQc3Na6fWxlGITrfzyZoA7U3pAs2aNfoYCsnIMFUiar4oSdZoPYRyTC7j4Ag1XGYahc8AGv98B0gKNG/XSsx5WN5qkLD1l+fx/Q+Lm/CKPeyGu67ExNfkMbdJ2ZvbBmc1Z9aBPAjqKSefLav+NXRaDjVYuGEIVVJFDpmXEGOsbDfHnEBaog7YZ/Ak4EjLbNPM7kKTwwh9WFopX3sbjLLJb678/q3cRGFzPZQwuKXb1O4OVb7QOuXHV39nrwGVYJzzTBGoo390xJtzAhAghzaVy36Zya7nb9i9jswsN/lx1ae7+FVTKUTKtR9OXfpkJNtIstb2Yf6W+cpJnkCeOCheNLkOmM4e+tH1Ms2UGnX2Wlk6ihJ61CghsXnAbLqFfPJSZQEgnbs1
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TUJEd3Y2dlV5SVYvKzZFVnVueVpyWlNDNWVIUlNUdnR0dit3TzZUeC9ZUmE4?=
 =?utf-8?B?d01Kc1drRTMrdG5pMStYMGFwcVBpUmZEcUlJQmtKTTFKbzlhUzB2ZWxrMXJ6?=
 =?utf-8?B?d1dYcitKeXlUMUF4dVlabTRxeW1oaE9CTWF5L0UwTHNNQWlxTXZYNmhGbHU3?=
 =?utf-8?B?NU9tOTVFRFRwWFdpUjJXQjJqUGhxQnEvRy9XS0JPV2RaYXlDa3I3Si9BTms1?=
 =?utf-8?B?b1BUQUl0VUc1amJpK3J6cjloQ2cvVnhYdkhhTXdKdHFUZmF0alRKYUFzM0p0?=
 =?utf-8?B?d3RwU3lrNUpVZFNFTldwRmRjTDM4SHRTR0dQSHBrTEtJdEV5eml6SDJOOSt0?=
 =?utf-8?B?b295REpiUTl5TXpTOVhQa3FsZjZCK2NwdTJjT2cvVG5CVHltaGprS0VGTWhU?=
 =?utf-8?B?a2tGOXN6bHBTVXpwNWZqVXFCVmthL041UE85ZVF0YUxZWk1PeG5tYytOSm40?=
 =?utf-8?B?aVRKNkZ2QmJHSGNlRXNlQkE5MmNDWHZKdXFQMmUyaXVsRzVEZlc1dkNTbXFK?=
 =?utf-8?B?UFl1M0pBWG1COURWZ2ltK21NdFdBbkg3eTNxTE5WSUE4UkhBWldVU3lNNmVT?=
 =?utf-8?B?aHhYYlYzNGEzQ3pGUERsTm9YTjBiUDhvS3Zmdy90YnlBZXI2NDVZK0M1WG5p?=
 =?utf-8?B?eGYxTGRCbnhNRTR0YmR4Z3I0NHgrS1pGWGp4YUtlMCtTOExGTW53Y1hFaThP?=
 =?utf-8?B?Q1RKbUxWVld5Rk4zeGNtWXJFaUgvbVg0b0pUVmJ1MTdkdFQ2LytJMkIxYnVM?=
 =?utf-8?B?SUdQbnlVbUhFRFB4WG5uanB5N1ZKMTg0Z1lGY0owWlllVkFTRFNqQU1BZUd6?=
 =?utf-8?B?aVpyd2pxbUVzR2hCcS9zZThEV20rcFZETVFZOGtpQkZ1c0VSTVh5S09QeDky?=
 =?utf-8?B?YU9vVmQ3SlBLSU5vTXJabjlDWmJWMlVNd0xnTWRUOUEyUWw3ZDZqVkdlRTc1?=
 =?utf-8?B?eFVOQ2UyOGlBa3pBbkQ2ZkwyWXRza2tvbUo2L0pZMGp5TitRd0R4TEx6bFA3?=
 =?utf-8?B?bUhKY2ZqMjkvK0R1OFJjaUl3RmdVWkpZeU1oZnU4TWhuOXlndDFWSHZDUUMy?=
 =?utf-8?B?VnVEOTFPTDkrNHFlZlBSQUplclVwQmxEdEZtdnZOZXBxODJNcnNNc29aaWxs?=
 =?utf-8?B?TlNnSUJtZW5pZUkxNTVjcWl2UStSNWR2OVluRjl2UHQxTW42TGQ5M1FkZUp6?=
 =?utf-8?B?NXhpTWR5ZHZWb216TE53MGVIaDc1NzBrdUxpVEd3Yy83U1U0UGZFL05ST1lR?=
 =?utf-8?B?cnJ4VGFPUzdYVFNpQVp3T3ZuRnRrTlJiVDhCMVU5WGF1NERCTzcxRnEzMFhl?=
 =?utf-8?B?dEpkOU90ay9xdEFiTTNXNC9kNnlIVldpUlV6d1Fqbkd1Vm92QzJlN3k5TEE1?=
 =?utf-8?B?Y01qTys1L250T0xQNnNyaDcwSDVKMnVrVXZBRE1sN3lIVW5Od0VJQ042VVFu?=
 =?utf-8?B?YXE5QW4rSnNKd1Bwb3F1WXRPN1krZTY0WWxwUER4UDIwNTNOdUUveDA3cWl2?=
 =?utf-8?B?Q2JlWWxsLzlIanJjLzNVMjd0UENCa3hmYXpmeXJiTTU1NGZWcmp2YUxoOFJo?=
 =?utf-8?B?ZEQrclBkczJYaEJsd05SK3EzS25TN3JZSGVtTGNDZ1RSSkgzdEVZS2tKWkdL?=
 =?utf-8?B?Y2FZTVJwSE5LcklHUmlzbDN4eUFUY3RaeHozR0Vhckk0SGo3eThZZnJYV3V2?=
 =?utf-8?B?V2JxYjBWNys1VlQzVVA1MHNiUnRGZ3lsSnRnZ0sreTQ2dUEzaHVTNElwRmlZ?=
 =?utf-8?B?QWQ3NTMwTkZLcjdSWGp3UnNNSHZlYTY0NFhybXQrNEhMc1VKSi9LME90Zkt5?=
 =?utf-8?B?TjdlQmo1QzdrWVRuWjU2NDVVaWMwajlRV3poelAxZGVFNjdZWm1WT3pZQkh2?=
 =?utf-8?B?WFZLUFNsdCtEMVZDUnRqbVh3WFh2aGpDMFh5c2w5UXc0aGFSQjUrMy9aaEx5?=
 =?utf-8?B?MGFNVmExOFF1V2R6d2dpZytjaHAvUXNmU0UzUXFETEJ5L2JFVHg4SzdDQUZQ?=
 =?utf-8?B?ZXVkMXV2dWRjWWhMdHJsaE5TVzllK0F5RUErOExnR1ExdnFEQnZ2STBFYzh4?=
 =?utf-8?B?eWVBVVFZUzlxeXM1S2FwQVlCSlVNUHhiOE9JZFU3azNYVzlJWFBXSkZtNGNK?=
 =?utf-8?B?WkJuVlBxOW1SYUNRMWo3cm11dnc5UjV0citIRTVma2l6cDl1dVZybm1HbHZE?=
 =?utf-8?B?YlRwazZZc2dIYzFZb2dGWU0xR3J3NndHNHVzMDZOd0NkYmdmeE55YzEzQy9l?=
 =?utf-8?B?eGtJd1JRN0tEQ214SnNvNEdnQmJyeU1Odk5ybVZ0YVVYcHphR2RxVU5ZMjdi?=
 =?utf-8?B?MGFma085cFdIUy9LSHAzdE5aWmxEbXl1S3N2ckRRNDdaQ1pGdTlUb2lrQXh6?=
 =?utf-8?Q?IUItsZ3bhOScF38OGWEXntWKCv5k2XDgTqkez?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b46c878-01eb-43da-339a-08deb187477c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 07:06:11.2375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gWcNqCyrM0jJs+8fNXD7MD5RURIJz1zDtgykWTbP7wTDyt4tCJ2qtWgslniGrWNu4ik9EYZGgeQRLlAG5D5Gq+INh/PoHjaLB4oRzaeqpE5/X+immlTYWwRCCHYt8tH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272

Add devicetree binding example for the PIT timer as used on
NXP S32G2 and S32G3 platforms.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 .../devicetree/bindings/timer/fsl,vf610-pit.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
index 42e130654d58..8696696776b3 100644
--- a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
@@ -57,3 +57,11 @@ examples:
         clocks = <&clks VF610_CLK_PIT>;
         clock-names = "pit";
     };
+
+    pit@40188000 {
+        compatible = "nxp,s32g2-pit";
+        reg = <0x40188000 0x3000>;
+        interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 61>;
+        clock-names = "pit";
+    };
-- 
2.34.1

