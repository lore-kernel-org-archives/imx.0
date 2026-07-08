Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E825D37DEB7
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540865; cv=fail; b=WDa7qJ+2D5E8Dp5qZTtRLVh5JmTJmIhGtAXBo0RWS/I636SiTel6mlMhqiEz/AKFWeaWfeAPSdbusF/96a2wutSTMAo2EyA+xPwotTM5ix7NrAQwsQXECq8xhXBIA+v2Rn3DVrZ8fFp0bdepNmk7VI9kRFEGh+pzGh+p//+hZFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540865; c=relaxed/simple;
	bh=8UFeQ0ph/h28y6OxnU0ijLAWt0ZlpJk9FsvkkBshDD8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=T+dRjb6lqpI73wpfoaZq96P+47qEJEQu/Fsu9UnHXy6Sxe+cRhs5ZKS8lVgEU0XwGjrIG88KAaQIqBvQIAgGf1xMuTmG/28nd0ITmoetsGYmfdI9GpreHr96szXI9xFxkSBe2ubdV6q5p30MbpjBdu54+m3Ox8dl9F+rUCXYPkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bWiaA0ab; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bWiaA0ab"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppQxEgkkoc+UuWL3hcYcdD53GaYwE8N6lETTZxLo3KEDzFWA6iJEY+k1Gkk52VoakT59kEJx2YX1JC4JdojtOJKD9kqrLxK8hC8wdHFH8BEtUYPDSTtRDZV2KmsWbxSLmLSOlhOSzcLE/CJg4dmnmTM6jDnpBtJ95DKFB5e8RTHo4LAeCy+tkBqwdNiD91H83+DoSn9aXEqlNyBo9f/koR+qq+gA2g1T9kMGQ74ZHGvQQOuXFronduxWTH09Cmow8ZDYL5XjdyfHMUCTiIw60MCWZEtpLar5+xhvTdCBY7krNWhWaNnXHfzNGO8iUmf7rLEOtQCFlzJLrUpaZiWJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHAX4zOUhuV0aLn5HqNp/1N4mbw06F202BKxXsFx62s=;
 b=kdluGs0LuPJQSnTV0kQK7FnfM65igRv5eNvkaRzzS4ev38OC0Smmyy1hguJdzk0gjEV0A/WPqyYVIGWeBu5EfInEGqWywBiAAjgIU3DQSq/YWGTI6t/gWJTPys9mbv+DBV51nuG/itXhCzLv2/4XvBrT64gFeGhvzJAADkl51a7e6mjuYh0NcssxgHJOzdc/CWn+1ewzekaXA+bAhTtR0kD5avJ7rVIYisVmmFCmjsssZj+LEfvzFiM/mW7QVzyaaHovKiBsOztopnbl50r+gWgYqejplHEGoixwGvIxiLvdauLj50tszNyG9zrkj2V4KUHIcFax8hJHum2gMnAzYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHAX4zOUhuV0aLn5HqNp/1N4mbw06F202BKxXsFx62s=;
 b=bWiaA0abPSVHacQ34sQdb/q3RHdpA0owuWzXfh0xEe/iK26c0twQpNU+L8Ood3P9aWpdYKfF7FB9dnv04xsbODa65hs9svn7xPVwBZobeJPC4wHmDdvMoSzCZt1sobj/bhdXf6AQqQvP39gjpZIIKdCWTafQT4dKLTAl5xadcg1v8xVgXcQSOfPWvcWHhR6q9nCJNN+xGvYjNuaqxpav3rg0pnxf+9oTCgWsFzNGOezZSp1wk9EOITK611GCn2w7XtyoCnFGzUXd7Eq6y+Fr23683wKw0ntjZn/J2kTs6ttMCfPcKdpa0QIfwjwz8e3k04Ijpzks3tZTyo4iO8rxYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9966.eurprd04.prod.outlook.com (2603:10a6:10:4d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 20:01:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:01:00 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 16:00:45 -0400
Subject: [PATCH 2/2] ARM: dts: imx53-ard: change node name eim-cs1 to
 eim-cs1-bus
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-imx53-eim-v1-2-913b4559e5b5@nxp.com>
References: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
In-Reply-To: <20260708-imx53-eim-v1-0-913b4559e5b5@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783540845; l=950;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jF/kEQOn9sMpW+US/uWEUBooZEG2IGNef6F5jb13eG8=;
 b=iua9RKCGalJqhCU3oYkdde3FF9s9/JOn7/oNhCK5DRp8VEVc+lM0z0Vzf8EKVtMUiHJh8PKps
 hcFvsc6K8m+CMGI5q0EXpbqtdOH0PjBXfjWXKT6J6Q/goHCJ2LsxBdi
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH2PEPF0000385C.namprd17.prod.outlook.com
 (2603:10b6:518:1::6a) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9966:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c3f245b-7d08-4f75-0871-08dedd2ba1e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|19092799006|376014|22082099003|18002099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	HpsICrNWzUuS66K7NAD0L5xOCwJ0uwUUVLBgFJW/u4dDbv8l1qM9O3PbAfy972RaV02KxhCmenzoIP94X0ykxwxlbidILgXdWxx2/K0wQCt+v7loJYpVFxCU09HaDJzbbY+qPXFDPSjU7X20tt+jhdz/bo3rMtinrIuHaPI9AUDeVGqmoUHlQASUKud8i6b8VKbnpTWKJ0aLG8l4/hIP7cEOnqhy0QBOzVftuaDDmuZP7QBF8LO5dxJFtcmbIwvMheKOF2am3qJuFVBmtUnW+6jQHnBUJDJYag9FyLYnigkdKNw4nWj3ZOXQRCAZs2ABBtIFzQld6aDVduORb/culAuY9/NMq43QHK/w6GzFyUmkiLMNa0+dOrbHL+HaFPfBkcPBMdCgYQoQ1zGGNQwsqKtbyvkbbQ3E6ofX2RqHwC52bEuUvgDX5lnPk4niG1H5MSoq4tPrKGDx/FfB1YCrvBTjZUJgPIord6orDU42J5IGzbuqQKRwSP+YYibEeXLcItXxtzVTkqDayAQh4ov7l4HUar8VSRIte5WfBLCVFeV2IIZXJz+7nOVGRsWOATkLQ21FeopqJwiaryTw4G/pOfuePKzcszcSYZaJvNVB6TpGd/u5A9zPCwIgb8eqlDP8Q8bjk/3f7l1xvhb+HE1zUUn9x1SfmdIlg9yIiqeJQdw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(19092799006)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVQzTkljT1RuV214SDc1aGtUQlVnTnhwN3cvL3h2d2wwWjZmWHo1elFnOWxs?=
 =?utf-8?B?VHRKZ2pLdERkeTNGbGZFTXlwRkpVZXVmMGlzOU01VGxQRDhkSW95WFpJdUhk?=
 =?utf-8?B?cnRXK3RWYnNZOXZadUF1OXd2azEzalUzUkRtSHFxNG4vcXN2OExBQ1l1MmZm?=
 =?utf-8?B?bEpZVk1hcUZnbU5wb0JBUEFpMFBwRUZ1dy9udi9jNGRhYTJjQ1phSzZMb1pY?=
 =?utf-8?B?aE15REZHVTl6SUVZeFhRR08xM1NXRWNVT3lmUHhMYys2UDA0Q1FweSt2WFhi?=
 =?utf-8?B?WWh0YzRNaXM0OE1qZS9uN0V1cDJwazBQQitIYi85VzFzM1JJbFkvY0VWazFx?=
 =?utf-8?B?aXBLRTBLbE5XblIzRGtuZ3dWTkx2OEJSN2xRcEdSR2NVbkVHdDlSSjNzWDV5?=
 =?utf-8?B?VmtpQ2F5Y3oxL0NXTDVBVnc2Y3h5UEYzZ1lBeCthNi9abkRObm4ya3E0SExP?=
 =?utf-8?B?ZWVPV3lub2E0dmc5ZXNzZVB6dUZXNFowWUJnQllRWGFKMjQrOC9VV3g3dE14?=
 =?utf-8?B?aG1QZGN0WFZMSzFNT1dDcnhvY0xHTEZ3YmhPUVRFWUlMRTdKM2dNaFN6QXFC?=
 =?utf-8?B?WDArM1FZazJ3amRDNGNxOU9HUDFHWW5tUU1ZRkhBL2F0ZVNCWk1kalZmbzk5?=
 =?utf-8?B?MElFWC9ZaTlyaDBNVG1lNkhGQWRidkxWWk96STVURFZDR1FPQkw3c3VVTHJL?=
 =?utf-8?B?R1NNVm9qc3VVR2tDM012N0tsYnZ3Q05jNHhVTGgwSjROcUN6eG1MK2JDNGxo?=
 =?utf-8?B?OVFOS01lZnJ4MFJyZ0NvUWo0Qyt0Sm5xNE04RkRsdGpuNGxEQzhxS1dUVXV0?=
 =?utf-8?B?M1FNQmZwelhZaTZscENqdzlzOGFUZWs0MFMwdGFpem1NVmV5Z21qZGl3WVN3?=
 =?utf-8?B?ZVh3dmIrUEhGa0o5QmoybkVBbi9kNmhLeXFtNVNoT0x2ODhZTHhQNVcwSEFE?=
 =?utf-8?B?TWhjcFlkb1dFNklXN3lOSlQvRGk3R0E1THFHNE5oZDFjbGFtWFIzS3hTTjBN?=
 =?utf-8?B?OW9PWmpBWlFGRzZyR2tvaEx0OWtEYmNaZEtMOFh1Unc0U0o4VzRYVTRKcUVL?=
 =?utf-8?B?ZnhvNjU1b3RIZzJ3Wmx0Ris0R2hoeWY3NHM5ajM3Z1JlN1FiZDVWU2xvT2J2?=
 =?utf-8?B?WmRuL3EzUWEwUEN0eDdQaVRHaFVyVitMNEtpam5EQ2IrSHVPdXlKckR2eitJ?=
 =?utf-8?B?U0haaE0rZ2k3MEVVb09RcDhmRzEwNlNLbElEYXhaUGhMbmw4SFNKam5yYXRX?=
 =?utf-8?B?bUdCVmhGaXNYZUxaZHAveDdRc3Z0eGlnUzhQSlBRang1UkxacWNyL0RYeCtx?=
 =?utf-8?B?dFozRWI1elR4d1VLaGJrU1pOaituRnNuWGRjaWh6WWlYb0VYdmVOVTlCanF6?=
 =?utf-8?B?enVjemVnclhMVFpPaEVnQXFjUmVXa3p6TXZZVFBxWEQrU2hYb21PdW5uZkhL?=
 =?utf-8?B?ajJGVjZuRUlyUVVMMWk5czJyeTQzbjZwd0lIdURXN3pEeUdiYzBqL0pNdkNv?=
 =?utf-8?B?K0ZhQm5CbFVpdVozazdUQnVZYzl0K0V4WVNSMUpsbVpxTng0L081djA5bXlr?=
 =?utf-8?B?bFJ0bXpucGJBRCtGbHRKYmx4eFZ6c3VuQ21BUnlMNzRTNTIzVXo5ai9NOEhI?=
 =?utf-8?B?TVRvNGdWUEszQ2x6bU9RTFdPZDRTa3puZzlrdk9XZ0pFWVN4dGV1M3A4THhv?=
 =?utf-8?B?aHFJQzFaZFlwRWQzc2YrUDFodWxzQis0ZkJzMFpXOWxhU0ZYM0pYM0U2dVpr?=
 =?utf-8?B?TkpZbUo4UW1PSUcvWEtEQlhXbm0ySWVhN2RXYmFLSzdtaUpDMXRYK2JTQWh1?=
 =?utf-8?B?SFBBTnJkTk13VjJWazZwTnlyaDN4bEd2TzBONTBEaGUvSmtYV1UzcEl4bjhI?=
 =?utf-8?B?WXc4TklONEtHakFGdGhERGJVY2FJTC91Qkt1WUFFZUwzL2Y1ZmtlbS9XSUlC?=
 =?utf-8?B?c3pyakNLZWEyVm9NN3MzNHAxWGNCVmZkanM0MDBqZVJlOGtMRGtDbE1qNkxj?=
 =?utf-8?B?Ymlzbjl6TDdPVEh6TjZMNFY3OGZTMlZ2RXF6NTRTSi9lbG1WZTVuV1h5QXFI?=
 =?utf-8?B?UXNDdDlSaXAwbDArcnF0dXpncjJVRW5KVDB4R3dTclpwcmQvaGc4bzZMa0Y0?=
 =?utf-8?B?TGJCS1ZGK0xubGJrNGVoZVRpNGozYmhmTGd6REVidFNmemVQUmpTaW5KMmJz?=
 =?utf-8?B?ZVZJN0doM2ZZMTZYd1gvUTBlT0ZLQ0VyaGlpaVc3djNVMzJHNXlWY0JTQTRq?=
 =?utf-8?B?K0pzT3Y4QTlaSUZRU0F5OG5VSEJYd2FBM1Q5ZkF3ZUVKUGZYKzhFTmJPUElZ?=
 =?utf-8?B?ZVNxSWtxVzFmS0loVXBYRTlNbWpycjlqeUNLWlRrMERtSWpHQjlESkxKTC81?=
 =?utf-8?Q?wWfxugqjuy6fRpClV9iYqN6Jt4SwsvRWkryE8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c3f245b-7d08-4f75-0871-08dedd2ba1e0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:01:00.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqI1nrumpYkp5XUbMhj3alSoYPlmli3+Oq91LEQXDXJPY/pg9ZjKxCSDiK4gDVUeFTS6LgEkq56gi8umOhc5WtHi8z0N5jHscLKaVFBD8TsB/aItEVPJlePaGCMLtKzV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9966

From: Frank Li <Frank.Li@nxp.com>

Change node name eim-cs1 to eim-cs1-bus to fix below CHECK_DTS warnings:

arch/arm/boot/dts/nxp/imx/imx53-ard.dtb: eim-cs1@f4000000 (fsl,eim-bus): $nodename:0: 'eim-cs1@f4000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
        from schema $id: http://devicetree.org/schemas/simple-bus.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-ard.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-ard.dts b/arch/arm/boot/dts/nxp/imx/imx53-ard.dts
index e580427660b1d..c19ac3bb0a197 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-ard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-ard.dts
@@ -17,7 +17,7 @@ memory@70000000 {
 		reg = <0x70000000 0x40000000>;
 	};
 
-	eim-cs1@f4000000 {
+	eim-bus@f4000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "fsl,eim-bus", "simple-bus";

-- 
2.43.0

