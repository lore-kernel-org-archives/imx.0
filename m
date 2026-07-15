Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898F740EBAB
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135964; cv=fail; b=PusWpTZ8sV9xEKlLLvFPDUo8qy3+e1iDzD8DyVtS/OqpRY4JymHRNAlZkS/bybIPN1c3UT+hgkzVLOzkfgunikWSdw3u41dPpqkKaRL2HhKccPAD+bDOa384lRkoArqcwNGcKt2pxPwbL6hyKifBID4QBBkqHzZWTRtNmBMcIvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135964; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cci05GAl4eXYGQikiF/GXlP1PhfrS3tDcSjvvXXhRhyJazGG06BHOYZBDMxu+FbGrvK55XONDuAKD7zaYZFHU+8BgZEyxNEY3PnK7DlDM79PM/1/9gp8Zi3mIDikTokDHyJmdeejvOC1VSDfsD+/ytqEVZumG975YilyA2JBlKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Wk7RS5Ty; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Wk7RS5Ty"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1zLreZpxuonjaW2VYu5R3FArPTgzsXzeYO2HLlmYCDX3XNEyprPofI5SCuzIjOYHo+qfe8U//hxuvSJRa8y7/gyjkkIGlA6IPzX5otshNXTWbRIRg9VhfMZCJNsV55iiSuEtbWzvFDhRTi+mQsETHM1y5LnyHzSNio2WSF19b2ew63atDE4t35opIb+kL8IwITHNT7basrTvGQK15aOYUAOmay+4JcTuWqJuUYhkVxqaDk42JiaXULlJyBW2r8zToJe7N+SuEJamfjqwImTlCI/mNu4T3evv5cAkBXGlm+7AtemP6kVcEBlaewEXBchVJzr+KxasOmJRmAcXaVP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=DpeEfz3A5boo/iMg/17PlL8b64yM1gaTatKR9Gj8SE57KQ2j1LE5WLSj0nhzwPFHhDE3k9CPONrQ5E63Sg2cHDrVGgj3v1pbJfLb7wuMX/rDGDQm/4iPxKu4UJjEcbhX3YjAG6Q9kPEvyisKO9rBj6B+PRyn1/yZP1gNWenF2Pk9OR8M+yJxGoAmole4ibzGgmTkdscOWtW1aEbEBZBpG0LsofuN/ySH1IovHOjlHPPsvyddSxf9c7XCDLnWNYXGxSLGBTJAzRac+a5eERzctTMa7YLGbUwySAqSj61DRaEgYUnBPf3vpUEsiuK3q30QCldr5soB8eV05mFNuHDjxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=Wk7RS5Ty1AtH/RB/tGfB0AWSq3vdAuIHuy7vxwcx0JnzLxL3/Vx1fMoOjYbjAbDwysIugswzn5XmhBuxOEon6Xyj9pGgMijXoOEE/e5+ZN6fTunqfIuM2m4Kj/PFsE21qisJbsoKIk+uKxazv4HuC5HB7j6zsqAU+qEuviFqoIAeQBlVARzoxeLBsRB66+D6h5UPFktx1C7ex1vATmz+4UW5Fp75zhPMMaVpYA4RBbRYMa5+AQx2uuz24dTITK8oac5kxiFd67hCAJ6nd+x9A82vgjlTygISOqGhIDvwMj7z4oxOMB7yhym4X+SYU5AT+xWuyB/4SULAsy5uckbl1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI0PR04MB10509.eurprd04.prod.outlook.com (2603:10a6:800:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 17:19:19 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 17:19:19 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 15 Jul 2026 23:39:08 +0530
Subject: [PATCH v27 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx-se-if-v27-2-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
In-Reply-To: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784138954; l=3245;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=3R5r5kUZ+Ge9Ar2GYtPz4eITzyArXQmNAhBiNhosLXkOtL3EIzXcihg6DdpMIYFBOTObcSsGG
 +IZw8bGB8Z8D/mQ/f8yruDWfeXT2XPzRH/84BMZAnhN9wO88rzPgnQ7
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::14) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI0PR04MB10509:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fd717d-224c-4350-b283-08dee295348a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|10067099003|921020|3023799007|11063799006|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RT5EDOD77m05luJF2Y1mn9BYR8mb2DlX1OouNnN47puI7wYx/zcHX+jBiou2aZsUCHvNsQ6+QNN8FKyKc8Y3A6U5zbx3CZ2934BsxsYW90tnipAr6aHZ4/WhvkpwtZx8o4PJDtMB8/W2g0k9L7FeecrDm3hiZjPX3UNchCkt8MGBd30bUyRYdbFdamsi4r0Cp/KcY3ET7VpnvXVi3QvR2tC7UB48babOD5zODIM0Q8jE2ahkaF2HC1VMEzQdJnWrsO6CZRMpMyImTQDYQewqQXo+gYDj9Nbq1BaI+m1o6yrXEaEiL93ZdgS2HdT7YzT+oCZW/Hss3QLJeezOACCb8v7v7ANU2MzPSxW4pux74H+qCxQIbSrITXNpPzQz3JfGK8BuSzU64YjWRrU4uUoOHy0TxcRQSHANOayuKkhkWiGEs5eIrFMrnRI7/sEeZsTSZEkHSo3Bmwdj0qxyCMZw9MGYXkdYSl2u100zmgkP792mCSoBgEBl9TPVmLxrRBcYkLp9erm61/V6VNi2R2OPhHnQBi7uBzgYEpgMYunR1qDrw4MDEmfxG57kp5Wp3R0ZkAba70ptQ+4YBZU51i08QCvV56Egb/d874ppNVd2aq5/m55DY6ii99R4RAJCjoX12+MI0ibypk+7eZ05gjbGa1GKAfG/YjEWbAG85/e+Hlw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(921020)(3023799007)(11063799006)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2ZDaHRnc0s5bXNqVHVtUDc4c1I2UUNOL2lYY0JxRTEzZ1JZcUJmT1ZLWWhM?=
 =?utf-8?B?QktOVzF2MDYvc1J0eVg3QmFSUjNtSW1XRUkzYlhoNTZLdkNhTm1WVlh5M3RU?=
 =?utf-8?B?dk1kWlR1L0U0RFlaOXE5MzJrODk2YkFKcFNwYkplTDUrdFFmdG1valprUmFt?=
 =?utf-8?B?Ukc2d1BzZ3N6bWRXd3ZTcVhrTnNBNlhtSS9BMDRmVnVob0pVa1ZyTDBXSmdB?=
 =?utf-8?B?RUpES3M5K01oQ3g4YWtFeFRvQVJtV3RIYTVzSFk3S1pBZm5oOCtVUkZrUUUx?=
 =?utf-8?B?Qi85RGdDbERZNThrUWtxb0pWM2xrTGovY0M0UktrTVNBTnQ2Q3BkbWIyczV6?=
 =?utf-8?B?eHRJS0dmcnJjYjhBcWhobUpZalVvVnRGSzJ3ak92a1dja24zU3V3N1U4UFY5?=
 =?utf-8?B?TmhkWVhLYS9GQ01HSEJVbGVraEsxZG9TdWo4ZWl5WC9VMFZiYldzcXlKMHJZ?=
 =?utf-8?B?Wk1wYUpBanpST2xmdTlSdGlxVllsRU8zOHR6OUI2TVAvUVVYTXRMVVdnYnpw?=
 =?utf-8?B?a1dpbmxoM28xRnlkUzBMM0lSK2J4ZzRpejdzd2FLbHBEcFFibUViRGM2VkRU?=
 =?utf-8?B?dG1ZUGFhL01FNCtKZmE0b3Z5WHRMSnZNczJUVGVoeWtqMFdQdUJlRjZjVEZN?=
 =?utf-8?B?SlRnZ0JIWXdRTEhVWXNHZzE4TnV6U3FnOEQzWmR3OVcyUUNuYm92TERzdDYw?=
 =?utf-8?B?NHMxQVg0R3F5Qm13YzhmTmthZmRLRTNvL0pSdW9YalFWa1ZIUEwvZHJPNzVJ?=
 =?utf-8?B?YjIxUHhFNWRTNTgxT3g1T1BVMldaK040NytWanN3cVRWU0tudGNwVWlTbE9I?=
 =?utf-8?B?eE4zVWRpWWdNSm0rWTJkUEFHZm80azJpOVZhTGRCQ3dNZ1Z6dDk3UkExZjJO?=
 =?utf-8?B?WTJSWUxTTjliNTBvNytyZFNGWFVMbFMzNmpJUzZlTkszSDBHY2w1dnlaK1Y1?=
 =?utf-8?B?dFBHSnR1ek80ZXZQZ0I5VHFVZ1JxYTd0YjVGZ1ltTGNDM2lSWTkxWHZQMEVx?=
 =?utf-8?B?TW43czV0Y3RjbFZrdDQvTWgzdERqOFVDREQ0UjRCOURpQndocDFhblZkU1BU?=
 =?utf-8?B?ZGxSVmJzRldGZHo4ZnMzcnozQ0pkNGo3OFNwMGlGQmlVRVlaUW9va1p3TFRR?=
 =?utf-8?B?VXhWRTBqVDV0VFQ4Y2NzRmJFY2VEeDhpeW15ZHZtMHFXaUdLWFFEY1pPTkpH?=
 =?utf-8?B?OHNqWEE1RTBJSHdCc2lDNVRsdWNrNzVaQXpBSWh4dDdSb2tBaHY0YlY2N3FQ?=
 =?utf-8?B?VkVsZG9MK0dJTjJWc3FJRDJNTVNJUkhPKzVtcUowVEo3TEl4L2VzekFDc29U?=
 =?utf-8?B?ZjZZbmFRNmVLV0wweDk3blRNUnRyVkJ2clFXQk0zYUxtNVY0Y2RiWDdWMlV3?=
 =?utf-8?B?YzNPNDkxSCtDaGdZbU5ha2g1R0YyczEzM24rakd0aGJGY29wT204K01VRDhI?=
 =?utf-8?B?ZHJyMGxGajIwMlpWaWtGR0Y1Sy9NZGt2NXdtSzZCWjJ0U1pZUWdtYytKV2Jt?=
 =?utf-8?B?Qkxmem9temovWjVoY2VTd0lkTzZ1LzV1ZXhOSVNKSzNIWGtHQkZTblZYbCtV?=
 =?utf-8?B?TVl3SWQ5U2Q2anZmUUZFZ2w0b0RQVGUvWnJ2ck9mdDRsay9lemM2czRaTEhi?=
 =?utf-8?B?WkllbGxWT0EzZUZCK2NQMktndG9GNzQ2eGNyZEdCWUhnVFZNUjFpeGxiVEEz?=
 =?utf-8?B?VDlRczJwS1l5REpXT3dVVklaMEh2RkxsdENQM1c4czlWcWFxeERPNS9TbGNj?=
 =?utf-8?B?Rmk1aGpxZ3dlYnFaTkJMdnRPalQyUE5YWXlYcDIrNXpUTTJhaWtPMzJmY3k2?=
 =?utf-8?B?R1NFa0JWQThmdHNScjRYOVJ2L2U2ejFkdU1QT1RZa2pPTmcxZkRkRURyNGVi?=
 =?utf-8?B?MHZBc210dnhGK1llNWoyR1NPYVUwSjcrM1B4Y3hyYnlLeHpKWFdtQU9nUjlZ?=
 =?utf-8?B?NUFZemtvYWdQay9jSFdHYm1ISEtIWU9leFJIR3o3UHlVK004MURraHFQMHpO?=
 =?utf-8?B?VHVuRWRoOFk0UlErMXRWTEpoV3JtWXlNdG42bDFmWGxSdm0wWXVreTNHb045?=
 =?utf-8?B?cmgzajhJVlpRK203a01NMFlsc2JZcXhiZ3BCOCtjRXptaTdCbWlad2F4Nmd6?=
 =?utf-8?B?ZUk1OU9lVWtOTXFiS3VMSUFkdTN1eUVxTC9XRkw3ZWVaL2NXM2E0VHVGcmxL?=
 =?utf-8?B?LzhWVDhSMGVmM1FvakUrOHIzdG9PaHRiaG0xdkY0U1FQNU9yWkZScVAzV2Iz?=
 =?utf-8?B?S1ltVmdpSGVjc0thcEFFa3dDZC9iL05hZGhEMVR6ZkM0MTh6SGExOXhBSzhm?=
 =?utf-8?B?VldjKzVTMlJ0N3dSU3hrNTZ0NEsxM1BvRzRRRlN5SzkwdFRveEFpQnVDazE2?=
 =?utf-8?Q?TlfcwNGRMTUe2aMkjI2QRfrPx9DUB8TQXpvKi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fd717d-224c-4350-b283-08dee295348a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:19:19.3697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdx3SjvrpZEZBc7QPt96N5JTx3/mFSCWw8vd57FMi4RhYjXZZomooGZDw7BJnJEtQnamSXQgK3KwkmvwaZGLV6mEbte36+hwys7P4iM1tiXR1wa7rmOUOHRF4K9XpLbl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10509

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

