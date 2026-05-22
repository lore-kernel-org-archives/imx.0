Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9A12D0606
	for <imx@lists.linux.dev>; Fri, 22 May 2026 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779482306; cv=fail; b=djT4dZbHt2RCcEiYbLDNJcqHwCp598jOFEjqcw4IWkRzI8KYPPJyHdqtmECa5fU7TmvyuttqxYixPBOO586UZRZpxNzcAIex5cxwjHkGuj9L31In4q71ZsH+5AiBUZhhTID98qyoS2mHJCc/2bJGxXH9wX2Xpw7g2cvkVJ9/kPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779482306; c=relaxed/simple;
	bh=vqr2YL/NeeilUq5hyURdMVVPJwqlYF5Zgzr26qlSSOo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=deB/KoV4XPUOvBNyetWxgWZIlrZXhx5CaN5iWQVPqiCuBqgkCJUXVECtADsbgStXVkFYIVnuTCMV8SfAK+Ag7V2RvGH+8WZsHO31aNzC+PoTykV3j1BcqLhCjMjJj+ubqRlknG9IPMxBW9e0n+GVYwRwoVGtoj1K+asRqLNFeM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZjYsX4vO; arc=fail smtp.client-ip=52.101.65.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZjYsX4vO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNqKs8fW4tS6CDVj1rNwGEZL9nyg4vG43MVqcfthJw2dIRl2TuzY+LehOxvm1LfmT9YcBsPmd83TYVSzRN9x4YKEvsqgSahyuaJKl8x0bLEGrqFYgPpDc++mbMD9sv7pKsx8CkPrQqoa9PyCyx9BZQBBFaMJKKJknxVdX4oTbxwRn6Ko8CYHqmKSaM0l+0mcRPyeOsbZGns2arAJmCdtD3I+RTAhSKMCQPe3mLfH/GA1XB2IYYvf7Lk7eqSI30bUqY+pgZCa7dZJPI3OrYwVWcAIbzFZBfUVBNa465yZw1JEsEXqGh09X1TlV084klWdDRgOYxkMPb/r+cakUP1mJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXAkH3yDncDBTYhAELG8lH9/swgpQz12jTF6MfCs8l4=;
 b=Me7tgH+G7SEjOKc+jb+/DmV/e4LRkNbCdw5F833nEODaqyZ3QuKUOr11hI0xAKKnD2R6p91kNhTgmPhZGnciqd6hWMlM+NmlRrBa1YXU1vLv9cq3kA5uEqkgxHEJKy32boadAle9G6H2DUDcIax2tbwOexNDG6z1tCiBpBwCCO1Z08gXafdepR5PQ4lucZUUOdcw4qhyojyn8NezBZ2qghhj9z4yrpSYzpYDXTjm0yWud/THc+7sgeTre4U/PBiFn3A7+6XNle6a96Yb8e9gX4BWKaon8wh69OrBXqsUMcaFFLYjH5ieEU24IBu1zvLxdMk8zCGnFRJRv/Gar3u5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXAkH3yDncDBTYhAELG8lH9/swgpQz12jTF6MfCs8l4=;
 b=ZjYsX4vOb7qGPvG1Y9OqDzn5EgEiCo/eoyUKzslr1nduoJ/E5NQHlKEZW/3vSokkaoJwaW8Z9HOplrQv1DLXWj8qubBGzA1glU4+fzvMoq2uk+UHin9XD82QleBWnjYyHyCXR2HTAWj/Fz8jxN5bck261Rrao38LtaihPmFmEVCM16FnUmcfRRPakHr2TSYhjVjwqtaxPp0yX9qQiC9dQpvkIRW28/W4T3Lc8gt2iIqXEe8KxHvA+/d8P+LGuj/7x5N3pRhMZuU0jb39yZpS4oZ37xYc/uCbhRQ3y5cdp6dNq12jNyyqfbzKS4ETPB2W8+nVobDSlQ34sueUcbBCMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8285.eurprd04.prod.outlook.com (2603:10a6:102:1ca::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 22 May
 2026 20:38:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 20:38:20 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Brian Chiang <chiang.brian@inventec.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] dt-bindings: trivial-devices: add fsl,mc1323
Date: Fri, 22 May 2026 16:38:08 -0400
Message-ID: <20260522203810.832631-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0142.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: acd07a21-2402-40ed-5538-08deb8420fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|7416014|366016|3023799007|18002099003|56012099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	rzO9zT/UG2aTTzDww/x3UA5yfHtq1jYhK7ZK9f3SDsqwPimhBa992CrEO/U/108ybW9WdLb3sr/YL/PCb6uMTIvzXDxeF1YmlEeJiUWAnB+27KbwodwKJCdQmtOtBmHl1nu4fb1Q0zlNOC/r9bt5YQWgjNGwLGwd1BW3jdPedmCSSQO2r+/m12uOcss1ubp8UYiVTBDNvJeP1lsQXIeaOIWnVc8TuXicSWwbTNdY8FxCpcx3flP/aqI9HTrP0ZdpLlVubxMIre4mudpGwJQ6RI2Di9/dhbAq7IpMDkb2cuq4akHec25x+TsPfSy3WfcqfkfPCAXo8c8W90T6pP20WFxmA5uz3//iEZTTapxs8BtQUGmmW7cqHnJ8hQl5wjO33QXPAIgdC2iGOkltTiDmP+I7naE30xaAC0dxGv7K9rX8jTN5Rk4CaXY64Zeu5vv1XAYHwW/M28//Wmvmr2Do4e+A0G7V0K1/mSAOIxpcNXVD9zholNvJfwzOYCmNFEYCHgyVWwfjZXMJ7OTL7vIItWilxbZv7k9IG+I60RCwfwzYgeRo2Fw5ULnc82+y1NUXzM9zkeaAISRoK7haX/R+6wuTPiHgDAJsxYRYUmyYFG4Ehz9AeAv7wr91m1guEB9DY+4VNKzfn+eb6rW423XrhFWivIHhIIX0DLCznBtztYYHnqYPacBBP92jmZo390lpV448ehqWyV79YuLH0oiW7Wa5ygq56oz0D6VUblXUoNg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(7416014)(366016)(3023799007)(18002099003)(56012099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWxnSVNJbXhmYXZnMEZKelI3NnFtYVZHU0xQUGhCeURQTmpXVW9Fd2JpQk9l?=
 =?utf-8?B?N3FVTTQ1NkJ3ajRrY01vNWlDMlZnbjdscnNGbnZUK2x3dWNvMmd2MC9xRUtl?=
 =?utf-8?B?UTNxUXBiSTNFa2dxM3l6NEpUV29UR2xRdFNJZ3ZjeUM4LzNmdUtod210SjFh?=
 =?utf-8?B?SXJGRnVJdFFXQU85VFA4WU9XUmxUWXd2Rkh1SG13SEdIUWZsWlczOFo0RjMr?=
 =?utf-8?B?K3A0V1lIWVRXMG1kNDJEcmp2WDRaWm1WRTd0NysrSnYzSTljUWtBZHVUcm85?=
 =?utf-8?B?U0pUbjZNcyt4T1FCVk9iRU1naC94TG9ROUgvMllKTXhmclN4Nm1uNERjQVh1?=
 =?utf-8?B?MmJMNFpaMUQ1TEM4bW5uc3JBMTIzam41U2d2UENOUTBWbzk5ZnJHUDdDemFL?=
 =?utf-8?B?b3d0ckIwRE44ZjRRbnl2cGlYSDdxajZSU25GUEM5OE9hd3lmK250bDhXcEZW?=
 =?utf-8?B?emoxVCtMK1dyVHJYNXAzT2h3amx5UkNhdlRDTCtJVVFuRU5BZ29GNGluYjNI?=
 =?utf-8?B?aUVGRlBOTURWYVBySGZBcEw3ZVJZemZNTFBIWVVoTm4rVlYwc3lTNTZxR1E4?=
 =?utf-8?B?MkdHN2h6NDhDV3c0akpxSW1TQXNkbWpmZy9KRWt1b0tvOW1sVDNLTllpVHkr?=
 =?utf-8?B?UndjQXdOclR2N3Y0cjgwMm5MdjMxcWNBT3J5YVBNOUFSbzlQYUhSTzAzdXFm?=
 =?utf-8?B?dlQzcDllRGdWYklDMWF3TURKUXJIUlFCbmt4cFBiT1RZRlVhTHFhZVJGdEtp?=
 =?utf-8?B?YWVNOUNPcDFabGp3dXZKaDVDRG5MMEN3NzlHalgvdjVLYU1kR245TjJaRkt2?=
 =?utf-8?B?dVFnQUVETXZEaWF1UmNEbUp5ZEdITy9vb3VZTytwaTEyVkJrM3ZhN1dwdlp6?=
 =?utf-8?B?V0hSeEtjTHU3TmMrV0YrMEFqMWVRTkJSN0EwcDNqbExVamwrc3ZjY09DMks2?=
 =?utf-8?B?NkZjaE85eEZ5QytoTmgraHN3UzRhU2RkbEs3Yml6Z05NeDMzcE45cmc3ekQz?=
 =?utf-8?B?MWQ0bHlldWhMdG9DOGpVWEZvak5pZXZENDFieE9YY3RVMTd1cmZCWnpEcE90?=
 =?utf-8?B?NFdNaU1POGpwMVIrdUgvQVZ4ZnBNQm5wcVFGUjNiV2gyTGVmYWVhVG40dU1p?=
 =?utf-8?B?QU5KcnU5eXlSRFJmQkdhdWlZQ1ZKenF5dEdMYVc2ZWx4dVRPczE0Tmc1b29w?=
 =?utf-8?B?czRZeHg4YW0wcC9YS25QdkJQNElLbVVmWm92YkEvUENLMGtheFVjeDcyU2hQ?=
 =?utf-8?B?WTZJdE1iOWliWWlKWWRjTGF5V3h6d0ZYY0UxM0R4WXZ4TWZ3RHFaOWIyWTdj?=
 =?utf-8?B?NDVHYnR4a2h5TTNzMGhZTGVVdklsWmNONDBvRFJoVHNHNXVUeFpoWGpST1Ja?=
 =?utf-8?B?c01kbEFKVnEvUU93bnVrbmgwYTJBVFRTUVF4cElQZG53bGxQUWUwS3kwSE1a?=
 =?utf-8?B?cExCWk1EcXpZMUdpVmdvQnVkWiswVCs5M3ozUTRSYWNib0I4R0hoeXhUSWtX?=
 =?utf-8?B?UkxFTkRaQ0tFZ0FwczhkbTMydTI1NXJqcGZoQXFMbGYzU3pOT1FzL0Iyd1hy?=
 =?utf-8?B?NURRcWNIclF5eENuOWZ0azU1SDF0NlJJNVBrcUplZzIyNUIyVmZ1a01yanht?=
 =?utf-8?B?clVyK1JHelNOV25jNXlYVFg0K3pqcThlRTFUcVpzTExyeFFYbFQ5YXk3NEZa?=
 =?utf-8?B?WlVXNXU0ak9pWTI5N2Z2VS83YjZ3RGM5REt4NU1mcS9wendBNDlvSEo4UjFm?=
 =?utf-8?B?Qm14M2xwelB1OHM5M2pCZExUckR0VjlQN1Bscm94MEkxbmFNeWhuZEJ6akZV?=
 =?utf-8?B?b24ycHBiL0QrNCs5R2V3dmlvNUNpaS9rUTJ4Z3JVZjIxQ3paYWhDT2FQNlNC?=
 =?utf-8?B?OGdmUkw0YzJxUHY5QzBUQU5GeERmM0lLT2IxZ1lyaFBnQXgxMThNT0g1Q2lm?=
 =?utf-8?B?Tk50NXFFaDV3VG9sM20xVjVpc2hIa282ellteW4zSUtmTHd2OXdYMVpOZU00?=
 =?utf-8?B?MVhrNXZZRHdJYS80V2JQbTBpejI3T2tCQVYvRi9pOEI2bVpCOXVIS0hDVGhz?=
 =?utf-8?B?dy81OVJVZVZ2NGlsWlRKWjN1WjIxRDdkbytRd3BaTzR5ajNGWW4yZFBNVUFH?=
 =?utf-8?B?UnJPQlZKbU82aS9sRmxkbHE4NUlEdHN4b0dOWUFnRXdNWkF6eTZNY3VvbXgw?=
 =?utf-8?B?bWZFSlgxclZZdmhrUnFuMkJQU0doSWs2bC9ESnp5Z0xSOTFjaGFNSVNRRE9o?=
 =?utf-8?B?QldYUlo5YVNLN2ZFVTlicTc0UGdod1Q5enQ0aGh0akJ3L2dKbDNuclVCaVhO?=
 =?utf-8?B?UzlyaTllbzU3Y2RuK3NINTkyUUpKRXExYnFIcVE1bzQ4bE5IaUVhcm9UZjRt?=
 =?utf-8?Q?wf3xA4Ngkx7CTiYE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acd07a21-2402-40ed-5538-08deb8420fb5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 20:38:20.5717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/kotf24CdlhSNEIpeqcCBcgua/m31InH5I9RwqfRZ+S04uGYzVI3po8oV8KQbO9vr7fbAzxrvZ2Ap+Gc5yQAHl65WskDMZ5VBgBxJeQKjJutsgaJyxt9p4tHBtLjXvI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8285

From: Frank Li <Frank.Li@nxp.com>

Add freescale 2.4 GHz IEEE® 802.15.4/ZigBee mc1323 to fix the below
CHECK_DTBS warnings.
  arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: /soc/bus@50000000/spba-bus@50000000/spi@50010000/mc1323@0: failed to match any schema with compatible: ['fsl,mc1323']

Since the i.MX53 platform is more than 20 years old, it is difficult to
find detailed information about how the MC1323 was used on the i.MX53 SMD
board, as the functionality depended on firmware.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
chagne in v3
- fix warning message
change in v2
- add descript about reason in commit message
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 46a4dca50c485..6ff96e10d0785 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -127,6 +127,8 @@ properties:
           - domintech,dmard09
             # DMARD10: 3-axis Accelerometer
           - domintech,dmard10
+            # Freescale 2.4 GHz IEEE® 802.15.4/ZigBee
+          - fsl,mc1323
             # MMA7660FC: 3-Axis Orientation/Motion Detection Sensor
           - fsl,mma7660
             # MMA8450Q: Xtrinsic Low-power, 3-axis Xtrinsic Accelerometer
-- 
2.43.0

