Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE987313545
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774454903; cv=fail; b=VWu2LdSbX7+W1vHVh079CAQoo0r36QVyP+YgpvpxuIinABAtkrev3w3+BcGdKb1vWZkv45m0b7dsUY8dY0SOJN0cFJgRfh5p+LEc5NP26CmwuAjP8ZCruCaX6XA723E3SJ/NokQpSqKJQmgoRPymIauSh30/tW04UEfwML8XDq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774454903; c=relaxed/simple;
	bh=bRYVKJUSlqEsmSo22u/hBWxwL5ITdI8ohV0UxA1tb1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UiCdTDefuYrOAzSrofPrrFwOqZJZ1nzcIcLqcgZa3W5WAxQbxyYtxxQa248hGxJL5aMOBc/o+pAHsO39kIFpCubdAYjbfSKHT+c6e2fB2d1LrdYOgYcxck+gDqvGV4T65/q+ux0aGt23SpNivpIyg5eRsj+hqTrxXlaJ97VbK9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kp1r+8QQ; arc=fail smtp.client-ip=40.107.130.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kp1r+8QQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYTEpQ8A8lbAGxhVU0Xh1ovG76i3Ex5FgoFoWWvu2IpYNlB/IcgsgszADn5feq1Fn3g/rVqbE3DZKpQfn285c8dpMQ5YCLUbxes1OJ+A/pcDUzzWQRkRpPSSTWoMstsTw1xjeE+GVzPcO7bXefzVyVA+lwJj4/I5/Osn/DM1gH7UJUqo7Z0Ah6ebTUOuKE82re+Jxla8dbYJDSnnC+pQ9Refs+HS7OfsHIwWC0RSgRmMyxZmyC9e5ngy8bhrTCreenHiPD08cx7OfXl+kM3EOIA1M7GwKo7Tr0WgoF+40M+/IDznqSzFW0HH3Mtjtw9uC1girHKSxXOBtXYogKA9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQF70uVbftleTqtQNH2NorMnQP4JyB+uku/Sm9eJm9s=;
 b=SlNP1iC4l6EUbtJuqdwxjBzr6dNy9TO8Y3Ql5/tI4ElB20YAoj5JklZPeMHnP9KC5/CWmNB3NZ1ZTK3Bm4J5Ej3XfOtKLH3Xopwe9hmETlqglqUb9jIGCN8O6LLeZ1uDJY35Iz5sFRHaGqH/ZGAKqwKMo9CU4Vj/AnwVlHFTuJ18PcKtoflLK8oSbo4a4iRQohN6IW1VOckt6XSzwnsbhJI5Ii2NVwRJhCO2hRGj1SwkPSMYKNLV7+0qPrQTVnSA4LpeB+i7vzQ1rp6ruZocfyD0o/bknyvRQVHoV9OeGt4jKOPtnfoEeYqkyMsdAw7oKwlVyeH5Sn6Kt9ucxmiAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQF70uVbftleTqtQNH2NorMnQP4JyB+uku/Sm9eJm9s=;
 b=kp1r+8QQxDmYbkNhTFwSSZ6M4rza+ysrdba79tpjjayrLVDauVjurNOBXgsRJGFN7tzI/gFInTc2xdwBbhmgmeb1B4n4iE/f5AU9LEvaorKFc/jbogbPpoYkonb7UbShkKMN6kDFQXgX4B+Z6RLd12js2441ezQ5blirbotpdLfFY8IUqDv3FTJTT456rON7d7v1IfuKOaZv3FQZqaOm8qqCCwjnSdrLLGAhSbY7SZrRlbBMlPV/l7D0qbpqViv1eI3p6ViHmGRBSg9uRaAXCD8iVktAXpwXFCN6qy3aaSBmEviblGU9zzR5YEj0RBdYBLo/7eaLzur+u60meUayPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by VI0PR04MB10686.eurprd04.prod.outlook.com (2603:10a6:800:25d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 16:07:52 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 16:08:18 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: (subset) [PATCH v2 0/3] TQMa93xx on MBa93xxLA-Mini support
Date: Wed, 25 Mar 2026 12:07:58 -0400
Message-ID: <177445480080.3126492.17097653157201971352.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319125013.2421621-1-alexander.stein@ew.tq-group.com>
References: <20260319125013.2421621-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|VI0PR04MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4b9985-cc54-4e0f-9541-08de8a88ba24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ngwaspKgEiEMdtYk6VS0/KU4cEKOZR21VOLivX5wZl6t17zLup5UBOHUi8Hvi4o7GVWBNM+tNrVjB1T5KDKeQNEpdWalJPhVwRKd50g/A2/fMdZNVwuZMJzJEIc56SRpREVXUo1LNzkSD3LNkM8yY6p3MfWz3e+ZXwPV/D4cAe5tbdvPTzxCt3zHAwpNJ9vwoISUG1uaJgY2zfBsRCGG4SMBu2NX+1kgKGVFT8vb9ZD4ueYsalLQBWcULH1JxPkWXLaH6anziJk/MSmVmvQ8SDDbbER/rSjQAR0RSgeI1K606UUO8WvlGIw17g/ktYnqGB95O7EgNuIOjtMceCrkjKEAcSPKmwIRobh5nCMZEn512e0zsmTMsQEJXfb6eHmm9XMBYntYdyBrYmB5REN8JnGJbkicvjYRCnt0NgPhR3tndR547klVEhTdwrgwzkWjpt4/dnMbvINRNwuhLDRWTGrdMybvYo9SWcs3x+S+LRRMsnezYQbpzW+LYiGYD+BlfLyXVQhVVW3hJmpgZ0Ii+nJEmelbIHI+zjcH3IiFlbfyAxO2uU48uMfasYU2qPRW5eaqAd4nRVuf2Unyldk53vMM2xR1JuGdg0e5tzCxJ07SI4qBXG60IGdT8edrjoIGvdQuxPQYZh8LV4BAa9qY55cbKiyXOWudzmp5vAOBzvr2wOc9WEJCiHfWDxTb0J+ybY6JS9QccFFKVlhOe4duVG9qbGhEY99D2ZYLA+PyqiZ5j7aqJN0O0jrRGlXLG39rBvbd6h24ebsiFQ+3TYC0ErpCNiAIvqzjaB8lXyFfg24=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlFNN2IreDlxTUt4RVpLWE5GSXRPODkzQmg1VkR1SUV4WU02QUpRd294WUEx?=
 =?utf-8?B?SU5zYVlHRHBxNnArM1RpZkZGYmhrMDRQY0NNMXFtZHgwbjVPY0JDTWVPVVBV?=
 =?utf-8?B?L2tLSW1GSmk3SVVMUHl5SC9CVnIwWHVPc0hVcGloNDQ3bTJWTkhaYkJCaGM3?=
 =?utf-8?B?U2lYajNZUThkV09sRVN6aXVUdHR3WVMvamlUb1F4Q25yTWF2bzk1Yys3alB6?=
 =?utf-8?B?ZjNSVlJsZms5SkxaUjcwTW9Dd29XWnNQQ3pXTEJvd0kyZDdNb0NSUzdUSGxT?=
 =?utf-8?B?ang4eHNLeFhPNElyaEdFWlN1UFJpUU0zSnhBN2xCT1FKWmptaE1DY3NkU1Ey?=
 =?utf-8?B?VjJaNm1WNUQxcXlZWHVyL1A4Y0lCdW5BcVY0blZlRDA2bzJFT1JuaWlZY01u?=
 =?utf-8?B?STRtVmUzcG9MWWlFbUQ4RnVXSW1xM3J5RHFsd21HYm1PTjlML0RXSVlsdE9t?=
 =?utf-8?B?SEtON2tWTVVycFB4Mk11Mk9xOUpUcWtTaWxlOUFEcm9XcDJxRDhmanFSY2Fo?=
 =?utf-8?B?b05NVlVGemdyQmZxRHhPVVB0K1BEdEh0Nmg3YVZsYXV1eGZlSWZaSjdVUlVa?=
 =?utf-8?B?Zm5FZlV0ckpYRE5jUnJWbE0xQi93SzlDdU1BazArYm9FVFV2S3JRS1VMNUVs?=
 =?utf-8?B?YVQ3RkR0WlBTUXVaeW1xdzRiczNwVGo4ajB2VHZrekx2aWcxdEVvQkwwNWFy?=
 =?utf-8?B?ZWJFWXNoYWpwaFk0aVBUUTdmRjVYK2dPajhEL0puT251MEVDWG0rcXZSVG8z?=
 =?utf-8?B?K256MEVRdVlkS2RWVXluWlVtMktMaXZXeU1IaE5WRTN6bmdGVVF6VEVpdlVv?=
 =?utf-8?B?KzdBZzlaYlVQZTZuQmlraFZqQ3ZlZ0JPS240TkZHamJhSFlCMjBCcDJ6Wll1?=
 =?utf-8?B?UHc4RC9kKzBGaFl0Y0tHS0tmaGVkMEpOYlBUYzZGSmtaMFZDbWU4SlI0enZU?=
 =?utf-8?B?YVgrMW02L2Z1UC9pUlFmSE54MDFqNnJheTlPUmxSTjQvVmg0MDZ6QmJTMVl4?=
 =?utf-8?B?eVltMnlJNXZ2R2pHeTdtNFFSVlNKcDl3Z3VIUCs5NmFPakVGWXd6WnZQYnNq?=
 =?utf-8?B?K3ovUlNDbWQ1SUdGNFpBM2k2bUNJN2lyWVJFTzBnNE9rcjVtWHh0VmZDcXNW?=
 =?utf-8?B?STVKcTB2WnlZRUlQQkx2K2d2RXRSVGNtNWQzMTZ5QmNteHVwZFRvK2xCVjkr?=
 =?utf-8?B?YmdUZmd4ZkpRVzJCMGk3YXhxTUtodVczTWdUUDQvNGNRNnBsSWs5T3pUR1Jy?=
 =?utf-8?B?SHVXWDJvWGJKNnRGL2ZvNExPeno5NU5JQ2ZybUpPMVRTOVhINXhER2JVaGlW?=
 =?utf-8?B?RVduNDU5L0xUOTVkSmxUaVFrejI3QzdOcEpCajEzME1IcHplRFBaazduUlpS?=
 =?utf-8?B?VG8vN2hNUXhHQjZQVmxaUnE4UVJzNWtsOUhwV2RUS1V4OXVxS3BnVG5kYnFZ?=
 =?utf-8?B?bUE1WXAvbE1UdndPOVc4SnViOHNvTFp0dWxZcE9wUkcrYVNNZWxhWEk0bUdO?=
 =?utf-8?B?U1pjR0VXVi85M3RrbXZVZXBGak16NTNtV3NvYVljZFBMVSs1RWZnRCt6b3pL?=
 =?utf-8?B?alRHVnh4aGxYcmQxenQ4QzlXb1pLMmFvNGxqUTUwQWZZUlZERGhXSjFqcloy?=
 =?utf-8?B?WnR2NnBCRmllaFRuOFY5emhYUUcwaWwxZzljcUlvMzdrSDJPbGcxQjFqK0U0?=
 =?utf-8?B?YlFCZ2VLcWlrMnhVSmRPOGFHS05rRGplTVNBTUlsUlF0U3NrOFQzMEd5WDRz?=
 =?utf-8?B?UEZtc2M2K1d6Y3NGMlpSUDBmQWY3eXFWdW92NHBCbHFXVjk0ZlprUUJTb090?=
 =?utf-8?B?MStYcHRTbjVqTHN4d0FTanZRaEl6WUUzd2pxLzRIL1gveTdlM2RIY0JTaktQ?=
 =?utf-8?B?b1dLR1RxOGFoaStMTm5oTG9FOUdyaUowdDk0Z29lQWxWVWpRZnE3a1NvK2Vo?=
 =?utf-8?B?TEpOZW9xZEhacWxvTGdjcnZVT2FZOE9CWHhFRzdidjYyNkMvNlZhZmJvUDhi?=
 =?utf-8?B?Y24zazYvR1JRZ0RRV0p2VnAxanRhUnBiR2NZNTFmMkJBWGp5SDFsMGVUNVNI?=
 =?utf-8?B?SWFXTFFKSHJiTVQ1K0tncks0UzFla2ViSU0vQzZrSCtIY1RTLzliWXpLZG1W?=
 =?utf-8?B?L3k4RTMvYlZCeXlBd1prSXdiekxFVUdVWTJVZnZPWXN4aUhDaTNYbFQzRnJm?=
 =?utf-8?B?T0hkK3NDNi9KVmcwMXRYTWtiOERLLzQveGdEaWxTVk1xNlBkUGJhU3JmWlVJ?=
 =?utf-8?B?TC9jclhJSWk0bXJ0T2ltOVFEYXcyL254dEk1THoyRVJ3dVZJQzN6elNkV1NO?=
 =?utf-8?B?U1Bzb29UY3p5d3ZhT2piQlNqWjE2VVArK2ZJQkZBT0FzYzYySmluQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4b9985-cc54-4e0f-9541-08de8a88ba24
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 16:08:18.2233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEvAI6+QpAg4BY2+VQgqZRxglFKf45NsFrHFyMgyAmhgHesMnAx2Inhvg8+MJkTeQ+quVl6KJWFq531J3cqh/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10686


On Thu, 19 Mar 2026 13:50:07 +0100, Alexander Stein wrote:
> this series adds support for TQMa93xxLA on MBa93xxLA-Mini [1],
> a single board computer board in small form factor.
> It has a reduced feature set compared to MBa93xxLA, with WiFi/Bluetooth and
> WWAN applicaitons in mind.
> An overlay for Ezurio WiFi module is added as well.
>
> Changes in v2:
> * Collected tags
> * Fixes commit message style
> * Remove unused display related DT nodes
> * Fix Ethernet PHY IRQ types
>
> [...]

Applied, thanks!

[2/3] arm64: dts: freescale: add initial device tree for TQMa93xx/MBa93xxLA-MINI
      commit: 740c700a11e50ba67f7f5cd6df26affe842c68cc
[3/3] arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add WLAN/BT overlay
      commit: c0d0f688b73b42621f1a86c4ad3c418fc06ae2c8

Update Makefile to keep alphabet order.
Update commit message to add extra empty line between paragraph.

Best regards,
--
Frank Li <Frank.Li@nxp.com>
