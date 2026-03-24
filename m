Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015F37A48B
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 05:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330971; cv=fail; b=uXJQCGROv50Kyw3Wj1AsHr+aeGUFY+c7vd5Rjyj+1LSm9/+KDZXKfjruuBGjwbxZ+KNpIkwseiAlT8S8VGIpspt6uYj9oXc3cbFMyK0zC3df2FnjVNukhBSieCp1WGd7IBsGMzDn2zZCq1QYDxjns3okWX2FpVE7nNAURa19Id4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330971; c=relaxed/simple;
	bh=m7UKMEhrPO1x1VEjOF50uI9SJ5qqGb+xD2fTTDm4AtI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=opjzsdIZcC46N47T8Ayw6v0TWoANka9ZPNYe7WF5sA5MMz96M5P3SCNeVByJTYm8DdyrTKI4h9m+Va9kEm92D49xqVMdPg1dChwGfemoNDKMZZcgSxNOE3Tj9W4nTGCgOnFEVoP9ijadMNLLnpc6t41FNZMVyz4UydnMegOQIYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=PMqL4GvT; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="PMqL4GvT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+KhKo1xOWqBBhjrnir9/Tl+Mws+tS3qpVMlo7U4QzHz8WRQwizlKhylrXONnrDzYUhtj1g9j61uVR+1Flz9/RH0YywIih75qjQDDzGcbMgViO055i4dhUQPsSJkqgetsX+pU2nAShrDbdERBw1VgAqdwYFR/KxgLL5bO/krE/bnD97twACctuRMh1kYISwWbThW5abqX+PVr8H+UL022aHogzGxsTI+5ZgF7aUt786EfeVbFLe5htXGiGN70/4Q4wL6/6ZjDJ57dm5glVvoJallRZlyACxxutCtFWl1Pn/zhYULgeeMjq///13ugnIB1PhvLaXVYjN2FQBMfdNTsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCsPgjtOINv67AOey8s4V47k5BKPvj/Nx55hF+gcEZk=;
 b=L50E6zO9Oog1Gvo67vTaBYK6zo6ph9J00o2FX+ArfO/sUjrHSc96IbhK9y35f3SB+rdQVFszb8tSMAJTZo+Gt6ZQJHsHhpVDJzSxMlB+4pY7N/+2fdp5FeBgFVzMGNfQgSd4RHTKA8XHPbNoJarIj4gPpXmeXox4Ltm/dmcjPwS3l11CMjWWj3JO3xnx1UuHaFuXQPa8hluttN/VJ1Zfk5Uxi1NM6UNBiqSIuB65CqGSbRVeEvUl+jS/+83e8eVpnKGIT/DF3Gw4XQV+agLnUWAM2aVeCNZHMx5gCHzw5QrNLbM51r5l2OkdVxEKjHAC1PP9ypPV6gNCrJrlQk6nDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCsPgjtOINv67AOey8s4V47k5BKPvj/Nx55hF+gcEZk=;
 b=PMqL4GvTplZpGUAP5DI/jSV75JCz8c6OfMipBZbErOvG9Ez0M+s4zTemy2fRSXn058Fi9i7yBTZcft2emyvE4NzgWqLLZNC6vTDRWbdmyD2kOV57yDFNFzG8rjOCwuIBRYz3lv9dpgxY2E9urO3a3f1J6gT2hsiyXM0RotGdSs0m1VdM3tOSgH8Y77SNdWjv4Kei+yb7S5fsk+mMnOztlzNImzjmejGW50KiShTIoDDLn0i5SDLQdmb1QfBEN31qK9voHfRfhUF5lIYkNa4j3odngQJYcyunNZ5AUSQvTTTzGZ8uskeLcPdtsfviN8yXpFbxy7XscG8fC2on8yapqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 05:42:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:42:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 24 Mar 2026 13:44:08 +0800
Subject: [PATCH v3 2/7] arm64: dts: imx94: Add V2X/ELE mailbox nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-imx943-dts-v1-v3-2-b33bf1f1c254@nxp.com>
References: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
In-Reply-To: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: f09417f1-7dae-4bf5-5391-08de896820e0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	CKonz/33lZUrx7yJnfrEO3Jc48jl/ljw7qJVnRC6q4cp79+8TQmmIM53txsTET9U5R2cyxdH9JXaF3kQ5aLbiC+GVW6sf2QJofBd0gWYRmEEJOqMpphOHfABme71ita2Qgf1eeDp0eKdajmPhIJWmIldXy4zkmmcKN2ofNsWMy9XNXikW0GzHnSG4VAwMCieo65Z99jKvT6/wVzz+z84cqUG7YbcYnVzw/9GwWgicVpIEo8tnu/8f8w4okcx0YA6k8ALnI0pnH5pmr77rH+TpHnsRNj9lV3vSo3QKllOsvYX+hgXxD6QiBZ0FjC2UssWXMDmSbkd0pwV6IAivCDRaK2vjzoyoTVEtFIMY9BUURfqQJaYbaY4H7B8wnXQo1tlCyZPhjWJ94XPHKRWiT7Wa29dyD/kqtVDyLg/HbgVGP/xcHvJbmMAw+U1t4cpRTKFKDwTQuA+6k2WWXbz7OWRKRX5F2jaoJrj72yXu5Q3nMZQDKsTPyJH3poV5tcBsI5Vl13EbeDCQUXTyYdk7EGvcOTvDi1WTtBsSi2yVr8iApFFdUTw/byu3S4Rz8RmKV7OiAo0OwZzmaYfQRkVKWMh5Rr1Eogavc78KkZAuUvq6movLDTYu55Q70IdPiEoG4jvg0tuKhTZ9W7DN9Bx/3k/nTLbpo9Wl85zKb/kBEKjnaZm5bAe3H8gtWB3gUlNGst5yHLxVq66F6kyOnVHZ7LhOai25JJIXM+QRioJkzH7gfIYjGlCig+9Q4/RVeyKAEnzqm64ySPMFQejt5/k+Ou9aRxpvYWSeP8SfAFiPxaiV2E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGxSbERiZHUza0gwSFNCaWd5a09GZjJWVVN6cHBBSFdJQ3JQK05qM28rcUYz?=
 =?utf-8?B?WGVLb3cwOUlJYktJWkV6U3NyK0U4ZEh5R1pHMEIwbDBDcDV3eEthVGpVNStD?=
 =?utf-8?B?OXgxZ1R6TTlWMUl2Q3pEdjlxUVBzRXlNNHMrUlBFcFhWOFlJWEZOQWRpRVhQ?=
 =?utf-8?B?ZnAycDNKK0w4bktIMHNBUjkxNlpvQkw5ZGVXQmZJWVMrRU9QeG5xdm54eGsw?=
 =?utf-8?B?eFhSd0ZYeWE2NnM3SGY4eUo2ckpLeDdrZ2h4MFc5ZkV6a3pxRUZFODN2NCtj?=
 =?utf-8?B?dUVSb3NydmkwZEszZzlZUWEyR2cyZWpwNkxuTThTSnNhWVR5bTBCN0VLLzNI?=
 =?utf-8?B?Sm1UVlQ2dWRheTFiSmVYaFJENFpJb2RDWTJhdmlHcEU1cmlhcG45eTFFM2Vn?=
 =?utf-8?B?bGVNaWJWUzNaKzFTYjZ1c3JFNUtMM3RqeDZEaFhicWRic1dtSWkxKzgwcENw?=
 =?utf-8?B?RmJ1YU1nY1NZUUNZeVh2UUxid0xpa2hCZDM4bm1XYXV6TkIwTk9UZ2VOREpS?=
 =?utf-8?B?bGUrOUQ1cHhwYWJKMGhRZHF1LzRLdzFiT1RpMDZ5cFFudXhuR1VVMkR5d1VX?=
 =?utf-8?B?RDc4OVJUN29lZ1ZKcm1CV2dBblI3bFhiRHVmaGhTZndJTVRRVzl3UDdxbzE0?=
 =?utf-8?B?UjVhbEZWV2hKOU43aExaS0NoR1FpYUhoY2Q1YlUwQW83cWJqUzRZSjE4RGZz?=
 =?utf-8?B?b3ZxNHBYTjJ0ZUlsQ3NBSXBFWmFtOUV6ZWwyS3kwY0pVMnd4T2o5Q2xla1h2?=
 =?utf-8?B?QWdHSlNvUVN3WEFZNHFKUWVsWWRING9WWEs0OEltUmovajAvajFHamVNQkJR?=
 =?utf-8?B?ZktGMDMwaExBWjVQcEhoK254Q09sbTBmNUc5cEhQT1V6YmlKcy9mckY2dEF6?=
 =?utf-8?B?SUNNRm9sZlhqRHR6TTlQNkVJNmdHYXduam40ajUxcUg4VEh4Mjc2S2FGdWpK?=
 =?utf-8?B?UDNBOG1aanJyWGkzVFlNRUNNN2MyUWh0WTFCUHdISDdlbDFGK1R5bDc2RWZ4?=
 =?utf-8?B?UXMxbHk4bEQ0UURRb09ORmZUcEVLanRmcldDZW5adDlXV2tYMFl4dUkxdGU4?=
 =?utf-8?B?c2gxZVAxUkFPZWV6Zm8yOTRrOEVYMURTSTF1L3BtWWxjQ1BINFpLdE5ZVFlq?=
 =?utf-8?B?R25UV1pGSTM2emNrQkVLWXI1SGV0QngyR0tvaHpvdXhjMXkrNnNlNVdYQitC?=
 =?utf-8?B?ZVBJRVQ0TWhaUWRNdmpJOGg1T0djYko0dDBIa3lOODRYMzhoZlR4ditjc2dE?=
 =?utf-8?B?VHFBNG5iN2UxRmRPMzhzMXZVeldHOXFyU29IdkFNMVNMQnM0aFZ5NXlUdHNl?=
 =?utf-8?B?TzUwbURaTS91cGkrL2ExRVhRbGthc2UyRVVyZzFDZUJVSlZxV0d5dXlwb3Uv?=
 =?utf-8?B?c3lVNy9hcFBsK0o5QzRxdGUweE1JYmlvRkl5UkFPbnBnSkI5dEUxL0Z4M0JB?=
 =?utf-8?B?YTFyMUtxL2V6T1JtTEp6NWFLYnFNa3EvZGVrVWdtaTZHUVhyN1lEdlFZd0VU?=
 =?utf-8?B?UEhKOXZ0Sm9kME1KQU4zeGFka0plSDd0d1cyWE95anh1NVdYdG5QMDZGWUQx?=
 =?utf-8?B?M09VbERmNmtqdlp2V01CcEIzdlZlWWFOaXl3NlFVR2E0aE9FVmwwaWdKQ2V6?=
 =?utf-8?B?RWtNdkdhM3I4MWJ1c1cxVGgzam1lWVNNUmNCb2lua2tDUlFLamMzaGttQy9Z?=
 =?utf-8?B?K3VHS2N1RnRld3pFTTV5dWIzakIzSmtIbzh6Zlcxb0RwaUlaem04RFpuZm9Z?=
 =?utf-8?B?b1R3dm50YUpZQlM5NnFGZEV0U2Z4VnFXL09LbjhUMWt5QnQxei9VQ0RoOTM1?=
 =?utf-8?B?SU5zZGhycy9Pd3E5cloxMXg3MUg0ejljMjI2YUp5bCtiRHkvaHk4alMzUldN?=
 =?utf-8?B?ZXZNWWx3Ui9jRit6b2dZTGdITXdsSXI4bWpLeUZDUEw0ei83eFdEclMwdUZT?=
 =?utf-8?B?ajlhYXJRcXcxaXQxWmh6Q3YzVkJqUzhWVVVLZ1JFWjdwUEpvTjh6R3kvN1pw?=
 =?utf-8?B?VTZmS0w3UXY5MUFPOE5obDVHTjZQYnFzblZ2K3JSL0NxM2xLMWd3NEVmVk1j?=
 =?utf-8?B?RU83b1pJV0NqQ3NQcWRhN2JBdEJzK2RXd0xDSHlGSEZSUkpzRXlsVGhFZjIz?=
 =?utf-8?B?aUJyMnhxR2tqMjVKeW5Eemp5Q1NJWTYveFdEeDJrd3kxTDJUNmNtTzloVlha?=
 =?utf-8?B?MUdBREE5T0VYcVQ3RVRYZ3dOUVRNSHNwTndYL1BVdjE2bzRvYjk2Q0ZXSTNH?=
 =?utf-8?B?eitRaThLZ2s2NWZpMFU2aG5SZWs3Vlp4NWlMS0JnNlFTMnIwcFA4ZTlCNzJl?=
 =?utf-8?B?YWxOd3ljbC9ZU3hJZjdCZkI0ZHdmVnVnd1F6bXYwWjlUT2lLNFZlUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09417f1-7dae-4bf5-5391-08de896820e0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:42:25.5723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHAz/7zAaTH01sJnxLvw9ew7wlUXl8m6eZb29KOcnrzypPMc2KihtzYKnwJ9hAR77k+lSSWAQPO3jhH6u+nf6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

From: Peng Fan <peng.fan@nxp.com>

Add V2X and ELE Message Unit nodes for i.MX94.

One extra V2X MU which is dedicated for V2X fast crypto engine is not
included, because it requires a new compatible string.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 38488147a3ef2f3e9c19e0ad14de2b98d85639d2..69ede676fc04ede23faceb8f24cf740697e40d7e 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1212,6 +1212,48 @@ a55_irqsteer: interrupt-controller@446a0000 {
 			};
 		};
 
+		mailbox@47300000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47300000 0x0 0x10000>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47310000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47310000 0x0 0x10000>;
+			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47330000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47330000 0x0 0x10000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47340000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47340000 0x0 0x10000>;
+			interrupts = <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47350000 {
+			compatible = "fsl,imx95-mu-v2x";
+			reg = <0x0 0x47350000 0x0 0x10000>;
+			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
+		mailbox@47550000 {
+			compatible = "fsl,imx95-mu-ele";
+			reg = <0x0 0x47550000 0x0 0x10000>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			#mbox-cells = <2>;
+		};
+
 		aips4: bus@49000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			reg = <0x0 0x49000000 0x0 0x800000>;

-- 
2.37.1

