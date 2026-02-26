Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013046.outbound.protection.outlook.com [52.101.72.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9DF263C9F
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 17:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772126609; cv=fail; b=QPYnywrIyx1+Gy22Bm90U5PRy1GI77TucsYxCkpKur6dFlPIBpu1o1TbSSm3JSPCHtQpYMcgJLMHiMkFemL44FqmfS5SpCx3WFroOR3yxY7+wwwr9tWjllZkZrXaytPUJbNU2RZPMVzuUFrfz6tqr7KjRNvOz15SBdp3R9tc+Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772126609; c=relaxed/simple;
	bh=LkLPcTABbPYePxrbl9Y6sZSwXYSgr9EJoHmeTlEMDYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hX+9VznUGz//q+PIfx+HNIs2plXtAMDBHboUIEdJNgaq/WozPp5N5aF/gZJ2KkPLhhOVattaiNl1ubJtWeyrlBpaqjFZFn53uEO20nr83DJd5HQJ9kb49727x0VV8Zlkf0+62jGpomilAxjhVIRoTfM5yvCDV57isx0oILaJsok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Eas7xDBr; arc=fail smtp.client-ip=52.101.72.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Eas7xDBr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdj/L37CeM3Hg3C4Fw/ck7jpDyeDbEQOL5ejKIEXsSopq4GQjX+l9UEOLLzv7aXxs5yi6wjJv4yFBZnZ4Bu4hbuHTHsNykW55uSbz5/q0lbBF7Vmgt2j0/kcT4fMhwGusmIXHDBdb341lYi7MOSW/W/z9n9/VtWalaYPS8KjTSI/lcYpI1F7ued/QAlqbhQtlAx2L+4HptLOYWaU9NdpXl1sZuyaPkM3WhmUSHKzsCpI/enWwFQe7MOAU4qXRg34OyeQxs72wi+gG7HKoP1ySEQTGcaFzRy1+NwkoZIWbGEL5PY+54OgjamZ3hqrNl6yXoULeE0Nr/FSoob1rQimcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTOGm9+DEl83V/TxyPcwbAlG9wRzXKvkpgO+SPu7UBE=;
 b=bTi7jfV5JFfW5NmrA9yluAvSN/7z7Q58gPcUJvU2XgjBQRiGFOR8k8CpHIb8rPzLhrsH0165mCA5g3ASrNLD25tJgQ3CmiV52+w1kPg4QTDAS4djvdwRZk3VSL9N2DmDyYX5UxM82KNtejyAutaePtnEc+ybpNiACBFEww/lGnfIw1WXY7qd6ErUfOBrZK98KDyWoKOz0Yj/p3xGnhzvpO9RaQPiPSsJ1gR6Uy+O5SlpLbh8rmB+RkIkbjfRlIUR2s7RFDltY2StW2oxsw7uSNsOKamWO7doCA1cguEvBYTCyML41ftPKWcBFM1p56i10SDe88coOMgmEPQaOKJI1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTOGm9+DEl83V/TxyPcwbAlG9wRzXKvkpgO+SPu7UBE=;
 b=Eas7xDBr61xXQ0xvUC5S2O1OHHSfHYJmET6200hBMerf3eN91HSPavJoBruxoW0vgbU9RE2TKwUbbrAsIXWR5Fa81FZbmCLgggWYmFwnEIs1akpSWP7nt6Pl1OMepSzEumOK+ZbB/4nsy4ky1vkzTDpvth/fXlzymivqHaTk2ts/YnkgdXgY+aCX8umxK/BwffAc7AbQZtyNr1gmEuFIaGgAHAFYi9mL/xxSBUzLToIJo4Ycn6fWeIxCqQ+VnWqdJGb1kEEFuuXBjmRkgQTKHMjoIRQ3ZjE1gHvH9KEsPIKHvK2oK1vXaS9sLxvJHe3iV4NFRf1rm8bNeMR5C88BAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9776.eurprd04.prod.outlook.com (2603:10a6:10:4f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 17:23:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 17:23:23 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Robin van der Gracht <robin@protonic.nl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [RESEND V1 1/1] dt-bindings: auxdisplay: change to unevaluatedProperties
Date: Thu, 26 Feb 2026 12:22:57 -0500
Message-ID: <20260226172258.257089-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf0da25-1266-4089-87e6-08de755bbe95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	ElDekEYQgiVP0M4Mh3NEPHUSzQaMARAX/rjrTSfOXj12oMwftuu5yehTkCotMshnQU69dPt+pnXwJT4fPT6ge8WeQn4ZTu6ib5NYIt/sKYVfgICSDuiEC0O46DmhbRokYkpQ61SJzigYXNdponAd30nDNG92Hi+bCc2/wsb5kySbfMjAWVpf5O5CPHtAfhkQ3Tg5Qd7Mk4TWsu8aLfA8s9PH/dGNvs/KNIbmz6UL5sPzFmIvQ3SkV0Y7ZM8mKMQIltCop0wuIC/6EcNecPZpNdMSsd+Gufig6GNbzIGSCJ2y5vJFp1ryja/w2BMCXX4f50DbuI4b9dNtx1g2CRSagUQSWUeDNrG8tupCsdPhOUNSPiSyISIprxMi2BgqGSGJ+GseUql7aW0nyvaP0Rr6m47WfB/prvnen0r7B/iDbmeJokv/A/elo6aJZgswUlvFwFAjHbO8o9F2fnlsg+Bs6ql7i2KwVtBXt9LPbbeMt6g+STy0T/GCpdzBt9Pb1wpQQkxzLN20skNeQ8sqy7AB3+8AdCUn73mxVcWmIujcjmrb+azqHgVF6/+ptgLMUwDR1K18qYa65Rb0C5gNOqJOaoVq7m5nVxOP03fmezfu/lnQxIAtXQnrOF5wf6JSLamSy60HsGCefG1AX/jf0hn4KsCpx4xT+qJj5g4/hlOnU3IgSP2qM4ncIoliASJN0p8lbEs3FljkzPOWjOPKpjARvizyCEr5G6cxzAmcM9jvsz0tqEtCMo2EyPDoPj/Zf3aQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QstxK84dm9Z2iCoHhlZ0mfqBoZfcwrhp6/uMo/Gi/0Rs1X7hHCEYi/hIM1+a?=
 =?us-ascii?Q?UC8A5kwiQ07bqAtph6ANR+pdkvKnwb6O6tI0gfnrofPknqHWHtGywHaz5adl?=
 =?us-ascii?Q?EgbQCwx+of0T3YWAVd9sv6YKgDrIhwqH5SnisU3zUJDa694KtSWtTrjphPtP?=
 =?us-ascii?Q?m2xkmElgq21qB6ISDOLDGGH3OdAlXrh5Lw3fY1HtGdho2LhwPk5fk7j9Fx4c?=
 =?us-ascii?Q?KPkqzm9bpwBl6ZOi6fZseL7YBZ4Ba8G3QeAQkpzilFfPxRBS9vJzi+4l4ZYt?=
 =?us-ascii?Q?3fmRP/KOStPRpavzjNOd/FqGstPhDMoD70zSZjGFRMyC95BO7xY9YXlKcst6?=
 =?us-ascii?Q?NDiABnU2NsqCjDDO1KtVyXxOo+mpoEmLhrPGk6ltHK7HtA77j6sR5n2eQVwo?=
 =?us-ascii?Q?/qDUHRirr6/jvzA/8VwoZbdMfWH07T9e1f1l0EZvB7gf4C2VWUtsxEXGZPZy?=
 =?us-ascii?Q?GvX5C6aw2Pb3YdtLHo29vfKXKiymwzp/T8OGeD1PuA13UwUAbdiN+CeXh04p?=
 =?us-ascii?Q?XG0gWwpeqOytu39OJsvo9dBB+e/SDvHlnqiW2VEbGcI8JZRpU6VdaCml2TCK?=
 =?us-ascii?Q?gBCaZQcd9rNSZwU3S2n6R/mfbb+wVMdAQCd6El8fOzTA+NEtK/DJHs+l+Lrn?=
 =?us-ascii?Q?t3XdxRS4CqnuwRIycDOuR6760Nj22HNJBHQY27gFRaRf1O15cqOJeu36DfQI?=
 =?us-ascii?Q?93mircsOsKbLdWNoUvFHT/1dYctdfEjr7a8G9RlN4CeHHppuc2Op6aYT5U8l?=
 =?us-ascii?Q?zx62bBWKw9opV8ntyxIgAQO/5LvfKT4Q5g4X5fDsrenPPgbBxhiyflxKggsg?=
 =?us-ascii?Q?VAvg6dPWfAXtxUgZM/HV9JjjRBTr8mChUtaJe3T4wbKSLf58dgGyKg8GpUPd?=
 =?us-ascii?Q?/Unb2Y1HsdvVxI6JwNmoxIzaNgEjbUWBf0UKjNWnP8HMw8EtfRCZPEVjheyB?=
 =?us-ascii?Q?K+eTh0Vj8Vb+t1n4xlhT1QBovwBGsjNJxPceVL6SyVal31YLm+K+gCyDezWw?=
 =?us-ascii?Q?YI/vNgXB1nbD1blkqrw6mYVoM5wHKHVDaSPG1YihmOiLdUftZFsEpF8uMIpX?=
 =?us-ascii?Q?g5HYZ7MPcKdN1164TDOEmKX6z9wr+wREzdlAa0QSFc/6LKx77+FZ9zx1Wg7h?=
 =?us-ascii?Q?R+nQ+QOujJuCpNp+PZ8vdL/l+CsqZD25Rst/99Ex0rCJ41PpMTHtDrSOmYHC?=
 =?us-ascii?Q?br4ukdk4WRGDTcauzJWJhgjaiITDj4Mz7srA9pFaOskzSvd1mjXlRJYpm2Ei?=
 =?us-ascii?Q?gUMjT+O9b0PPdYCm2TR5e47F0qfKhJLG7nS9ljixKjb+A6p6f2S8CldY11FV?=
 =?us-ascii?Q?BqLris+XmCwnP47XnT1yQPHYutacUkIdXqS9GAMfTcB7UUucufltOgyjTjIr?=
 =?us-ascii?Q?hvKadSRnJ8nZaZNN5+VANb/zbpplFy9nYyFN0KDOUN3JQT1MKNm+HZkEM2u8?=
 =?us-ascii?Q?EoCsBzTDdI3uERjxDNTuQO5YHgMCoZzUr08NPRDCEt0JSAEp9VC4/163+X5G?=
 =?us-ascii?Q?A1e3pRIRvbhIT77+OvbuPCK3AJh/i6UrYkqLuplyBRNyiA5adxzCvonCk/pD?=
 =?us-ascii?Q?YohwJtBgtyoZTqPDNO/ZBxRqLzFFBb4m7BGg5gq0H19a53/JJMnUQ6fxAIOX?=
 =?us-ascii?Q?BJBC+G47+PSnwUwsXDBMjveRz4AHjHfeGv8iikGqA09OcG14+kPoMAN9iA8K?=
 =?us-ascii?Q?mSv6EvQyiyPPkW5yyYFldnUv6XemITMD1uHVWgKiuGisoaQVe13Sdnwiakc7?=
 =?us-ascii?Q?LhrgxQOfGA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf0da25-1266-4089-87e6-08de755bbe95
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 17:23:23.6271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrV9mOFOfPxILFXbJTwlwQ/7CiX6/Gg+ntbFlzpQh+H8XACkvKCONI6ahs2YmGVrO7O7NBn3yas/Ta43y3PTjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9776

Change additionalProperties to unevaluatedProperties because it refs to
/schemas/input/matrix-keymap.yaml.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33): 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/auxdisplay/holtek,ht16k33.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Resend include Rob's Ack tag:
	Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/auxdisplay/holtek,ht16k33.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
index b90eec2077b4b..fe1272e86467e 100644
--- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
+++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
@@ -66,7 +66,7 @@ then:
   required:
     - refresh-rate-hz
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.43.0

