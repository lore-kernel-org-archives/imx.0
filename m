Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4DF44C50D
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 11:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786014072; cv=fail; b=kyQGaoAx/7wI1zha/vePnPgP1MZnVH5mLUXZZE+FTmnrt41QhYL/H66/dFULJ9Wt9KMO+6XuNf9tcJBnejwgN6AObz3EmfrEXL0/YZZNhN+xEqsu5OL1A5qxmD0DBQzdE1QrwsGOP+zEm0824D+Si/3MkruGnHa4LTFTtYaSDls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786014072; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HQVKNFB8PopTbs6s53Ot39ALUYnUCkKyx7BbPH77Ag27A355wKABvnkBe9wvwnu5Q5rzu4NVs62XushCt+VdgmOQkv0Fl3YAIfCi1pieRyjFdZ41e03pjmj0pNp1LGkazbUbPNdCE5nSntjRcEIHk6vAMvhwA63VPtL40NmkCYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ht2DI8EG; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ht2DI8EG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zh16zIuVV2/cqAnAXb40F6/ulm+GKCLl/WgRIRLi1CARf0jIe1aykgnV9oTqXKdQjgxXSJKVn7LA/bgrKPKMFciJygOThKDIDTh2Y9omY/n+5TVrX326IysleUdoUKQAIlHQUXHukbT6kk//qjJ4ENC67SKozYiLEux+5nOav+Wl/e82saiHWTPhjAKOnAeTgsPNP2UHWMYGLZw2fHV24x8ltkVF+qjsOFSqXTyFveUeo1pBUsF7Yz9FeFZbbX0g/JP7RtVsF+aVgHUVWlH7U/JS0lvMws10C4yUnoP0FZxxfHWm/uivvHyjl8KsfMngJRZUnO37SGTMSbDOY8gH5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=LDjlAP+LZ9wDFhONUj4TYCU5gQRRmig6kVg1ifsq2dkrvSjopTR8FmTGKzJ45PDIuUsfvXVFsUQj74ekj9Fw2hGPrLSt3Fe4LZARdt9AzrtMaXFpY6PB0teOZ/8ms49QhJKTpvYVumvHMx89LgMhYAlTRiv/Y3YfksweM74kBgbnv6w0CPDO8aDTqKuWxxpv3efNxeXB1aZ0dDMqQkRhpBR0ONQlo583d+xsbqEKIrWwWdHGdWfQ6b+TwIAL2P1u5iRzNIXYWu3Ehviz+cPpWRcuf+iT1YdizUUHe/vkoNwlStwGE034qPw+gCJCT6mo4dSkind7yTjQdYzWD3r6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=Ht2DI8EGaz09O8qxOdHY58kBbLjssovL7J852QvcWju6AJ6G1xhX69U5BPjVCuogCnvVfXhn3oQou9KxPsD5rIak/7UfERsTe30zsAWZfGBfUJyeYiN7L2xVp/1RVlYyJXFv/TWYfkzVgZkZ6KEXdn5J3vOb+UPhBMLjKqC0WFxi6uMNql6EFw2ckXmSv5T9BUdJmOv8Tal2Qlwwf1yZhEHJGig/F0HEn+BeKbqv9ppRVsfwhufQeij2sPE17blp7+fNYVhvHsLnVO+PYwe//IgSbgsosaKXbqaQmAc6MLtD+57YsynGKwXyWPfIjU63fy30hfV9JtOad5230RknNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI1PR04MB7007.eurprd04.prod.outlook.com (2603:10a6:803:13e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 11:01:05 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 11:01:05 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 06 Aug 2026 17:21:35 +0530
Subject: [PATCH v35 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-imx-se-if-v35-2-11b25bb308ef@nxp.com>
References: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
In-Reply-To: <20260806-imx-se-if-v35-0-11b25bb308ef@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786017100; l=3245;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=zjVGVSm7Rb4LmrZlJmFYPxNZNGo+eYtOdShnbSjDtmmJgqtwZ4QHzpdTeB6mkv1wdT/ozNleB
 47GZtX2u6AeDX91dm2TIY8wUYYE5xLSNmAx/rb0YYyrdXMCTg9TnzUT
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI1PR04MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 83efc68c-e22a-42e3-f7cc-08def3aa0308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|7416014|376014|11063799006|56012099006|10067099003|6133799003|18002099003|3023799007|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	+spVwdVJoIk3FccZQo+zblv6M3h5wjCLW/j4PyO3FP5o40wHsW04gZsEvt3qNtkgfpCknOhOOz/1JGEUP8TeNfmU1jTp7dCGeJyUlXDVeMrX3fM7DMhPXF4RxzDjcUSICBOm9vMIJMn/o2Lbe2IZPahcAXdUq2IxBmpy0iCCOvRQXbhX9LspjVKvbw2D51VJcK3JkhqMHb1YumPTYdfmHpgxOj4+kEtphPGbhHS819QD8m3VajPuHTo0y0zzbagrct9Nu9N2QXSTky0V6ETkv/ZIbw0MRozJQwiHxPWu8uJK8QhqRI00H83dXDfcYLorHKQPmua2+ZFnkrVKKNsPrZaVDRkSRH+A4Eja/jyjlHfz+5CTqFwkgBO/BWKZBIGr1zb+6U0Bub74UzliKrwFNnEycq+sdbTz3nt366FJUgDUQkSJtEDwyNxMq2DfGBtko4DGhRkGe1zJDE8k9loB7VgnD7sdlBroqEVYSPgS0PRRnwZCr138sGYzBDSZ29EXYKzI51uClX3jo1j7RgLv76f6V7eiNy/tmeYxIUxjCOOBKxfz39pPBOQfhiGkxiRbzJ/vpHS3PrT1BPCI6ZqV/Bxgrx5Ts4JWHZusNcV4k5/pD65IJz5qrtPOwDYh3upTXcSauSkbmj3cD7CVHw2V7O38zxrCWv6y2q843+BFHA5TS04xdKicz8/9F+AsP4PgK1nIN+ggUKmvA0h46Mp0qw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(7416014)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(3023799007)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUR3Y3FHdG5jYndhVThIVGJrV01RaVdRT2ZYOHZBcWgyTVdNdi95V0JYeXVY?=
 =?utf-8?B?cmVTWkN3RHRkZWJvR1IyS01HMWFiVUVpQVpHWHdkVnNROXlWRDl6Rkh6V2RI?=
 =?utf-8?B?MjF3ZlJnajlGZkpkUW9wMzh4djNyOExpMzJNS0ZhTGVSSFJCS3VtNkxIai9R?=
 =?utf-8?B?L2MwY3lPcExxSlV4U28rZHk0eWttbEswRHNmOW55cmxtdU1CNkI1MUdOanZP?=
 =?utf-8?B?VmJtLzEwZmJzdmlzM29aSGRaU1NmUmRodmczUTRPVFovTEY4OUtKdjBUc2JD?=
 =?utf-8?B?RHoxbWpKeDdzbksxakpNY1RzeUtUeTBFZEx0cUs2RDJrQ0xhSTlseDZLRmFq?=
 =?utf-8?B?UVdPK2R0UDhudjA2OUVkZkRxaDVXVzc5K1NoWWZXcGFXWXpUNUpNY2FSZVdm?=
 =?utf-8?B?V3E1enZLbTZFM0hzbHVQYXpLQUdJVmVUc3Q0R3VqSjAvNTkyemlCVnZ5ZHAz?=
 =?utf-8?B?STJ0b0hTd3d5a25NYkFkVEk3ODFxT0dKWEdhRFRyb2lYbndsSlovd1ZMeTZv?=
 =?utf-8?B?NWFWZUJpYVhCTmZYL21lMjNYV0kyY0FVMkxCRjJyM3NuOUdueDlHMEtEVHdB?=
 =?utf-8?B?b2NOamtObnV2REdDZk1oRFUwWFE3MFFmamFpdTlyYXZHUEJ2K0FhZy9UUVBQ?=
 =?utf-8?B?RTlBV0hGU1hITnppOW9lVjZwRllKREkvTlRmTWpSenQ0L1A1dVE5YlNFMXAv?=
 =?utf-8?B?bmkzWHRSaWlBbmFDNHJkd2N0M2R6bVNnTGdrdDd5aG5nQlRONjVMMmdUSFRj?=
 =?utf-8?B?LzNVbEdqS0krY1hEZjVmSkFHLzUrbmtqbUdmdzVmSGJycFBUbEtIZG1KU0pa?=
 =?utf-8?B?TmE0RnlBQk9uY0lRbjFwQ1dJblNXbERKc1Mva21FaHBqQSs2K1d1M0pCcVZj?=
 =?utf-8?B?UytENTRVbm9RY2Jva2NQT3hsNjk4R1RkcFFjWjQrQ3lnUGZhTVF6YlRqTGZo?=
 =?utf-8?B?T2FsUXNZTkNxRmJaNUx0MWplcUJUYWdFMTUyd2JobDd0R29maXNXY2VSYXBu?=
 =?utf-8?B?TmxNeklUMkV0MEJZTTd6RkhzSWtocmgyU1EyampTZUFRSm81Sk8vYkVIbUsw?=
 =?utf-8?B?WkYvS0VpaENDZk1HbXl4aGRkVTV1VXZkcjhST1ZXT0xwTlZ0T3hLUHRnTjFY?=
 =?utf-8?B?ejNURTI1VTVMdm9DdFZlbUVCOUE3S3dISERJcHVOL3FQK0JVUlRxSDdNOGNw?=
 =?utf-8?B?S1g4K2ZNaklPck9XaHF3OXJvRzVzM2d3U3JXbXdmMmlYam9OMmx4L010K0kz?=
 =?utf-8?B?ZGdSV0lxZGxiOUVSRWFSVjQ1VUVWM01zN1c1cTBzdVlSYTR5U2FHMElTdVI2?=
 =?utf-8?B?S1RXU1BtMFlMYzZsRlZ4QWxtTm1LNnVyQjQrQnltSzRNL2FKTEJhZ0NqKzVZ?=
 =?utf-8?B?RHZWRG9PeUJmeVV4VnBQY0xhQ0tUUTRWVmxPdW9lREJaQk00TnUyZGdDNENT?=
 =?utf-8?B?dld3djN0RGZJb3dFbEE4dHVDRnByeVo2YTZpdklQM2RQWU5TZVd2ZTVhYzZI?=
 =?utf-8?B?NHNvL29WMHpqZjlNblgvQTZMdXdOOTR6ajJqQ09yR21yN1diUGtmdzA1MDFs?=
 =?utf-8?B?QU03NGpZcDU4TkR3U3ZHdWU5MUF1UlVJUzlsdkdwc0h5Y2pwM3F2S3R2NjVl?=
 =?utf-8?B?T083ajU1aGdTSDViSmtkK0ZXSURERGs5UnYvd1g5dWdibXN5bXVMc2JoTnRo?=
 =?utf-8?B?aXlTMnZJM2xCTHRHTDYyMzJ6cjBrZHluUTdNL21tUDFHY3Z3ZEx4bzJiOGJE?=
 =?utf-8?B?NE0ydHJvTXk2K2p3VDBFZjZremVWZ09naHBreDJ1TzFsb0drN1F0a3Y3N0s3?=
 =?utf-8?B?WUxCUW14ZW0zcmZTOGoxYXFJSlRrNDdTb1JDQzZ2NlFsV0UyUk4vdTVTUnhP?=
 =?utf-8?B?Ky90S1dEVmdUTTBqUHhuN3VMWTRKdlM2b0Uxanl4djlBRGxjY09uTXFlU1JP?=
 =?utf-8?B?OTFMbjZpR01GQWFMaEJvZSs2V2hxem1xMFhJQlpORHJUTGdSNG1TaStJa1lS?=
 =?utf-8?B?RjVVMTRtcW1BUWFlMzU1bktqVEZrRUxvTWI4U21kVXdqLy9nY0VUUzBsTUxY?=
 =?utf-8?B?T2hGSHYwVE1UaFNGcnRaOUVEcUx0dnIyVGJPMW1pT2ZxY1NWMHlmaEVTMVRv?=
 =?utf-8?B?NGFNTVhvejlFOHhDMk1QTHh5RERobHBoNVN6Z3VBN1RQWTF4NWVNdC9SSGhR?=
 =?utf-8?B?ZWJRSlFMd09VVDgwRnYxNEVSeEFVZFgwZUlkOE9HZlFsbTFqUkVTVENrZHV2?=
 =?utf-8?B?amp0TFdybFRIaVNKWlZlTzltVkprWHN6ZjNJRHQ3MWR2LzlVdjQrZXZtRWda?=
 =?utf-8?B?clBndndGQ0c3V3NLV0NNNktudnJMNEQzQzBZUW1kcE9OTmpHT0I0UDBocis0?=
 =?utf-8?Q?pYXacZuQTQZQOo8Zrge2hVB8fpDATcRHGORe7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83efc68c-e22a-42e3-f7cc-08def3aa0308
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 11:01:05.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lH7I1lKq1hm7Pr4AOcHcwB1IvC/sJfSoSr7RA03jBA2mIzPtjqvkDvwNZXY35ingWTt1p+3AwFI0jNnDt9uAGc9s3V1a0maVG/Jr27XlvwXJfLfMb7MCSx69r3n7KVTZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

