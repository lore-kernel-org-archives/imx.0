Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A8B4C9557
	for <imx@lists.linux.dev>; Mon, 11 May 2026 21:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778533523; cv=fail; b=nZ32ESljU50jdkKI1zA6F0JaSGD6MbzoTis89LtjYlyXD6DVXIqvB+9duMBTS61P9suQCIC7GfaCagg6f6oXPAb2cTEV1ZveYRuZe9WBQ7wo5jwzfXItuWF76Wt5qrInrocpYuefw5uH31G2BdPrJtGc1G7EqWOeTHc5jIvjZy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778533523; c=relaxed/simple;
	bh=7JrEDKX68J5setCXrxVbwENr9/ZXtrr1vxZgPNEyzjc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kpuJAlujd2kFxpnLuVQRnJKz+gmuVih2rP3i3M8NYZqOpeSsvEPYytIO3HHdVYdANKE7hD+U7X+OsxfzCc0sF5HYVY+9FT90/ClDodAylinP9e4dYCdCTekxMpGdWPwn+NJDmudDry6oxSgrOVZTsXIOdAwcVlNVB2Y8lo27z98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g4359tl1; arc=fail smtp.client-ip=40.107.162.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g4359tl1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiEK7tsLDBYd0VvHxtRlKYwypmBwPSw6uHk/0aM78Qey2iM8aRT/XEcgWlX+c4qSggjT3cobfPGJ6TP9MyUrnKlgqDLEiNzZrtTpzN32ninclOkJ2nSJD/blnjX4YAlt+5jaOnKfytHBdaTUPT8cAss+eyLji8nsTMjX6YylNxZp+nOzCRRye1/Ct6Sk9gepTn02YCMLGmk6znvbzu6Hro4uaMhscb51nZO+es93c+6fWp1ZhcfbORFiqJCQizRnJJ7I8WI+xR2/U/p84qCUKyIUASu5k1ZpxjDp6BR90gTtDnFEcF1ZdA/JCZl8yknANcCHd53u1a7skO5l4ynDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCywrE6Jd92+wpSdZxKuH3upZnuVg/CHVqNfu6JEk3M=;
 b=YZIsC61daFQHHkMag0hUmNcHxVsH+HSkxgft3x/2u9K6h0hjZwxBdZA4gns3ahUJ4UdCYvLaIWoSmlGwEjautVCVgGfHItSU40FU5RRkDD3LTKkoj/N4mNe/5tQzk+qmz3Lc52/MnHyxv45ojuFmrlW0RvQmv+k4ZoHHd0vbpwZtb/5G2Vj5RGoTZKa9pXXhSkYGp6tCoXiPoZimA5HdT6rPsUYs8k2r+bwliHdb1bSMNt7oHgbl71jYFjJzQCzbbEJ8UFFoQl4LGv4hbTYzc0mT7sevU0w848d1CLblUKxd5Ee2lfCVgxBK7hqdlozNpuMAJJ67kByKs3qtr+74sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCywrE6Jd92+wpSdZxKuH3upZnuVg/CHVqNfu6JEk3M=;
 b=g4359tl1zaGBA5Y5bpioYlRBkXLnDR0AYKI+ZSPZntG1bjgGs3YWtIBup3/QgX+PxVYX+wSdljTJj4a05CT6tRutGL7t2eBPn9uYRH5evYCCnhQsRD9flUwSjqYgMFsZHpkRNZe3rcPlyGo5Mh5qPkrs8FjfDFulX2Q5mPv9pKj+8m2n/di9jY+Ebh+OJd6HwOfe2BirEByAmR6jRF4IFFvU7PKKBjXKGG7PswesFNV47kk24bLEwyuBD1Vjue1uLx1JmzAafTn/ByqS27T3x8OW3ejKcWL51/wFVNd/wp3ljhu34972eOLts9Xz5xUGbrWCHWTty6cjBW5HaK8x7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:05:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 21:05:18 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 11 May 2026 17:04:57 -0400
Subject: [PATCH 2/4] ARM: dts: imx: add ti,deskew = <0> for ti,tfp410
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-b4-imx25_dts_simple_warning-v1-2-01b855a5ce25@nxp.com>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
In-Reply-To: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778533510; l=1918;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7JrEDKX68J5setCXrxVbwENr9/ZXtrr1vxZgPNEyzjc=;
 b=uqlf0gnEdkQZf69x3weWTyX/nBWhXyd+EuaX78WaIpjAmkvOyKkvF8XXZupZ/PkKwQf3SPa9O
 bC/AeBqpa8RAxkjGhT1hjzqDxy6HBXestVhgsKrLgB7VggxW6QSKFKF
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f959532-f49e-4d2e-7310-08deafa10166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|56012099003|22082099003|18002099003|38350700014|9063799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	W9Wo49UI/RSu4WkN0xiFQzOadaqoDH6VipeMsNWUSuOfrVKpOeZQUv8yCTABa1R3s5RbpBZ8HTyIHwpmyeOgJ1dhAcMvyasFW7bo5pqz4r+CXEnRE0xjnFuQzaUV8M8jmxdh9WDKSZ7lrO97P0EY31tnL8/hCNJK1KkuxHyFR6ZtrOdhtBo5JswbE+WNX9Qj8sMPGOc3HJzfRBRb5ajYoNrHyHUA3bb/9HhFEhhKb9OXF/mkTicJsYqqZqlBMOzhCg9tfFHMhjuJ+XtePIf99fgTN5yLqHx/sdwXHQxa/4QaaAyJny4Dme297HtdikjSrOtTCycXPPziJxsb/PurpVqbI+KR78Frq5BAwZ2lLHDE5eAh7/3OB1LGJV+K2YlfQ0o/Ai8k2uq7qoZCEOpNZ1u5kb20SGQrAnp54h3HGrbv790hMLgPELe+3rqF3sCFRTYSF2Kjt3vbGNXFb4/3F5nfyODL/BbcYmMFkDzD8geHR/lIxpAVD0TodDB0zQSHXzRRL448vTxnhfxUDVceIcpOyiuOhkeq8pVH8N8dRIvSKWYyEHIYaYBjWzsSB9p+ECZPsGyKiIkkdRgUdqsOyoe8noz0k0U8UdQYZ3E7agl+RaBJ+uviZjxPL6XuQXJEfJTMNAPkwLlT13eKNub3SFPy0kRj6gy0tf7il6ifi2CtkAP2n3jwAtcenmLlKQsa4noq3AAAT/BPLVANBEtuWyTaxkss2q1djq2WTqfSnJel981+C0cs8S8AgtJcdooM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(9063799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cElMTDFieEZ2UEJBL2pyWVhqeHZIRFBKQytraFVOTGlMRmlPTVNGZVVKc2tW?=
 =?utf-8?B?Y2pVM1FMcG5xWnMyWVVOWHRxZFBMUnFPUlB3MDVhYWs1TWluS202U2g0YmlU?=
 =?utf-8?B?czJYR0V4SXdXVU44bmxXTW1PTTVhMUpUZmdobmxaQlVLRXFqSzRmVkNRRVBn?=
 =?utf-8?B?STVlWFI5N3BWU2hCWHdkcVo5WW51QllOYkVWQklTdkZ6U3FKYlk5TW9wQnhG?=
 =?utf-8?B?a2tibnFLUngrZlNxSStpTmdTUENzUGt3aThWT0xoMTNEMVFwV3FQRkUyUE9z?=
 =?utf-8?B?SlNXaC9BRFZxOWJaZkZ0YmtjWHV3SzFLODdKblduOENSbDIzZGc3N05wU3B4?=
 =?utf-8?B?Z1pnZHdqTmxFczBEY0hNdzlmNUsvWUhRNTFvek90NVNqQnhoUDhyV0xDVkJ3?=
 =?utf-8?B?YVhsWHBCRjNiekIxMmFRTG5hR1pJQkV5ZXhCTEZLcC82ek5qRDJGTkh2bmhW?=
 =?utf-8?B?dUdHL3BFSllMUDRaaFFmc3JISzArMDFiTHFMZC8rSWJlWnlodU5NZEZLNW95?=
 =?utf-8?B?UUMwemJ3RThiUERKdDMvQ2EvRkY0eGtWcTlaSUZNbTc2WkRWbW41VEErbVNB?=
 =?utf-8?B?WVYwVEpoOE4wZllUZGR5MUF4WnJNNDhmeW9JWmlZazRXY2hQcm9GQU02Y3pN?=
 =?utf-8?B?RzQ4UFNQVCt1bUZ5L2twY01wQ0Zoc0FrN2RIT3V5OWcrVTV2a2lidzIyM2Nu?=
 =?utf-8?B?SGxjSzlzanFwekZtNmxuTUlqclNmckJINHNwQXZvMjZtMjZMU21oRWFLRUVl?=
 =?utf-8?B?M3U2SW1KRDh4UWY1c1o1aVM1SFM4WkR0VE5UNVFyRm40UUhLK2VLeUw1TEFm?=
 =?utf-8?B?SVl4aG0zSFFkN1VhSUxIYmc4bEZTUHZCRUk3Y0J3ZEVqb0I4NU9XMkVqQXhq?=
 =?utf-8?B?MVozUW9rRkZZTjhNQnZPV0ZxdE5vYWE1NmFsTWJqWW5FY2ZSS0g5cGR6ak5B?=
 =?utf-8?B?SC9hVmJuSHhlRFg1RHVvOGU5YXpBVlJwcFpPQkpYRkwwWk9TWTJYdm9BNUtX?=
 =?utf-8?B?QTVQWjV5T1RMMXlZb3VHcVM5a1JIZE9DNTZSdXduL0N5RWo2V1lvUC9kRXA4?=
 =?utf-8?B?WEt1Q24xZ01SNUYvRVBIbU9hTDcwWUNQTGRBcG5yK0szUTlEdjFiMWR2ZnFT?=
 =?utf-8?B?S1UwalhUTFNPTnp3ZkFLTUk2emFRNkppSDhiTy8vYlVZR0lUVkU3S1lTSGl1?=
 =?utf-8?B?NENNY1p3VEJPTTFDaEFHSVpaaCsxdjFWMzQxd2V6TTdVNy9Qa0tGZzBnc25v?=
 =?utf-8?B?NEhMVUF1VVBtaDNoQjh6WDNpeG1GcHhLeVA3cThBczhhdlVJNUxHOHJiMVFM?=
 =?utf-8?B?Umppcmx1MjNMWmd1akhDZjVxZUtkeGU1Uys1UFdKdmpQOEM4UFdFWlhkYnNR?=
 =?utf-8?B?c1hDZ3AyTmJOQ0I3OU9kTW9ZOGhDWmd4V0k1UTFyUmFYTWxDMHc1dDlVRG40?=
 =?utf-8?B?SjNrcjZDQVgzZGF4L3lsVXYwZ0NxN2Z2QitQY1NrL1RKcFR2UGdxbERJcFBu?=
 =?utf-8?B?R1dyUmRWMGxPM1V6UmRzZnlzMlU0Y2FYTXV0empLVWdDTFVrdElJNHBQMGRv?=
 =?utf-8?B?bGVpVFF0RVNZMzFYd2FJcWlGM2tnVTZMNUxWcjFOMU5qK2NoR2lXNzg3Sjd6?=
 =?utf-8?B?NnBud2NFTzQreFpCUUpVUzdqTTVTNllZV2hoL0F5TVFtNlREM0NzQ2kxaFNK?=
 =?utf-8?B?alVkRFl6ZTVmUWU2MUNDU2ZDN3VrTGVSZFlFamMySHM3Z3hNZkVHS0NsenVD?=
 =?utf-8?B?VVRHZFJFK2ppeWtJMU42R3NvOGp0QjRzbUQ4RVVCOEpMOTY1V0JFTGR5dGpZ?=
 =?utf-8?B?NjBlYjJkallyZmdKVWtjdnlKWEg0bzJRS285WlhZcjI3OFVQQWMySllHbURj?=
 =?utf-8?B?NWo4ZWJqcGNqeGg4dm04cEJRN3ZXK2ZHd3R6ZWJNNnp4aTQrNCsvSmRKUmV2?=
 =?utf-8?B?NVlaUDJTNE42Njd5Mlg3ODZzOU9ydThKN1k5N2hlZlRqZlRrOXdWeTZ2Qm41?=
 =?utf-8?B?dzFIakE4QThhUkNLREY2cmpuZFNRREVCa3ZvR0FIZWt4RGJXOFdkbkRwOHhX?=
 =?utf-8?B?UUs0TWthY3hPMTc3eHJZS2M4VVFmWWNwTEw1R01BNVlZbmYrNkw4YjlDTWh4?=
 =?utf-8?B?V2N2bnEyRUlUbU9HRDZMTzA2clZNNVVDL1BzelFINDBBaWhObS8yTFlkSWtu?=
 =?utf-8?B?Y0ZScUtibVBHbE1jV2JkODRaZHNTWFpFTnkrbm11d09keklEWHJqNys1blZt?=
 =?utf-8?B?K2VQWEVEeUE2aG9PWVdReUhCdVJoZThlU3ZYUnkvdk9td2Z1UC92cTNDOUo2?=
 =?utf-8?Q?1hOC0sxUyeDzO7Y8EB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f959532-f49e-4d2e-7310-08deafa10166
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:05:18.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUZ4I3hyuV6wd1gTXSs05rEq3oWf1gz/nR7iJXG2NbkeO1tEkqWMCmvvKY80OjM2VInGljhlo1tdEQO0wiXCFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155

Add required proprety ti,deskew for ti,tfp410, which have not defined
default value in yaml. 0 is default value according to
drivers/gpu/drm/bridge/ti-tfp410.c.

Fix below check_dtbs warning:
    dvi-encoder (ti,tfp410): 'ti,deskew' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts     | 1 +
 arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts      | 1 +
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts b/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
index b17264e06e6916057c426179e4207c4a28acf1ab..a02e9cd0b3fa04efc4df49f8ad990515d5e81671 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
@@ -126,6 +126,7 @@ dvi_connector_in: endpoint {
 
 	dvi-encoder {
 		compatible = "ti,tfp410";
+		ti,deskew = <0>;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts b/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts
index 0814f5665a59c3a64c6023714a3b58230ac80dda..02be8b6da69619a5d33a7b1e964e951addefa676 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts
@@ -60,6 +60,7 @@ dvi_connector_in: endpoint {
 
 	dvi-converter {
 		compatible = "ti,tfp410";
+		ti,deskew = <0>;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts b/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
index c78f101c3cc122f418b708b1c274ca11b586b65c..6a6ef4a25d8dca7363a527aeea4ddcd81acd58bc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
@@ -61,6 +61,7 @@ aliases {
 
 	encoder {
 		compatible = "ti,tfp410";
+		ti,deskew = <0>;
 
 		ports {
 			#address-cells = <1>;

-- 
2.43.0

