Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A6A33689C
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 16:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813801; cv=fail; b=QDELts8T1gFRQ2iJcObW5T0upqvXcK66R1TjlW1vCkE9y19dvxMuQDsebsU62QJc2Qp5hSCRPNpC6Q7Eqquqk5CjC8v4MF8olgdFgHtYNGZqVN6Qoixxm8eS0Z61ftjwMbv7WbiG16zGyH+2l3EcDwmqx/hIdav2HFihBkKkup0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813801; c=relaxed/simple;
	bh=1nBRVUoJrZOcQZzqzaxWCAFhWGeDGXs0Kvg4eaZRoGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XJlzfhizy56sBuKYMmaeZBhTNz2Hn2cMz2DE0gUnfHL/zmI4VexLKUNA5EDk0n1MGHeJKRklLiQYwSV4M4UUx8M03QeTLf43P/RgZ03D0BJJ8VMmrP6UU+ReXP6ichKBwM6eh2AapReErJ/kkcA9XPu4uCzrWBxhWy55SejhJTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MqIGd1N0; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MqIGd1N0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbF8l8lAgfh5EDbmvs2d9bLaJYPJQeBeThmoVaA0RFsyyYAlaaMu6AAc+uLHU33XXYMPvW7lB2LM/DaN/waqolwW8195nunZB79ss7E+d8O7XUPxXogde2vDT40VAAR8AMQlFqxE+VRGLhpR4RzRRblkbTk9VjhPHIptvaKvTDs6RbhFB5r+HsOP/6BVKCtXahPb1QDfNvGzZx6nErCN8cwFuQ33U7zWcczhlESw+e0hCjj3BVts0VERplWL/RA1KUQhnwpBQ3j0NbyCOrcHJg3YPl0wwlytftD/CDKEkMSXcijYHc77gLmHpsJEfI55o8pIocUmmBwI1ffsGI7dag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCkZ9d0xCKizzrVLXo0hCOFA3KTHKJwFsA6oDI9mix4=;
 b=XvO92TZ7zmNgHgTE2DBPoc9YrGnprQUHD1pBr7phQAnPYTpNkn6EF/Rrfnhlgj0xsLj/n6toqqWIYKHMaGwWzLaL6FJvuC/n4tKRAx/LUH0Vvh25BL6R3DH/1CGDHSTDkMxnhJQ8bjK3n07D80HB9FsBIp2ZY7z+k8U0WNcXxE4i6F0/twN5f0QsfSfi1Me+JWLa5aAW7gTTVgWJEyARjcZEuwOctmFhg+B6Nga9QbwT5ExsmoF3G8kZ2X7ykofsolWZR8QeAsFIkp9ennQM4jABMDG3VOvVDHfZefGj8N/gCqRvmCDJG5CrTGwgIjA2Ct8KyOK44rokH5E32sqoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCkZ9d0xCKizzrVLXo0hCOFA3KTHKJwFsA6oDI9mix4=;
 b=MqIGd1N0p7JrcLRVpa808Wm7KnBSBFgyIHQN+ig3kd1wu1ohb1WLIVPNkB+8PpbklgJplQ7gHWbHzhWbW8lonV5N2f6iHWVtaw6pER7qQJuf2ebNTnc76sxmidEq61VzCE6gAR0J52Z6YOx79BhxZ/4JXiFyyjQNL6FFiZXoZh/6g2fGg9nVdAliIpdpGO1af1j2Gtnyiw4kePanQX7QOIlFt4UjvwCWL492W0fCyeud4/H+Oromo279CCX2y5C47vbYVyJhQ1d5nPPXIuMEvuawZdw0t6f3X+PqPMw965FcYt7wqn2OCR07xIq8VigLaT4ccX8gBkBbaNYmksIzcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7395.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 16:16:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Fri, 6 Mar 2026
 16:16:37 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 0/3] ARM: dts: TQMa7: modify for use in bootloaders
Date: Fri,  6 Mar 2026 11:16:20 -0500
Message-ID: <177281375042.273002.1809997522931760211.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
References: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:806:127::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7395:EE_
X-MS-Office365-Filtering-Correlation-Id: ad14bcbe-0356-4ab3-fe98-08de7b9bbdb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	vLKV99GKS7bYFYMBK3hQEmQ2AjvjArQMHOY9QNwqq1pnvqBITPsl8/uI1d3LGyQT+6qgWRDFIIIP3n3gvdxi3XF9TcHxzrQ4ma/Z8c895b2fuixu4tcKBCtpCK5JmgWwLWhgmwYq8fye4cXQLk467BDKMnpGeNfU047Gjd4h9FXSDCq70FENFrZyAreh19a2rylGEUX+6QgIxDYm+wkMQq4otRqg0hFOoaUwppXcuR2eLV0XRDZ5hEIrvvEM07e85fsSTPwkxOMJYnsUkTh6ITmb76rAGHLcaafQcJmiY22yV5iucLKl3brr4LgjjY3URhIj99BK1T90wfzvmJwr7NBK4GLee1sCm4x5e1Hoe4VMGMLUy/2dfg1b4drWe1SFnyRdDFQlja8T11tFn4dSINLNHz7LVpSUvpY+UwY60vDSIWYfICTAi02QwCkHHrUNj0yzH5zspmeC8vwnNMEXlDgsmdJ97D6BtdXlzbKhf0qGq/LCES56tBVXL4SyWYL4YjNOX7KT/PRvlCsN9zIhjDC0gieMOwvUcKSY/po2tD1v7PuGKUb7L4nrcnw89xundDGW9Yk7TBUbyBtKQLV5DjYG1QMbdUCm+cPM+JcghNKSEL+FYdgVo1Bl5ZzmBGRJdVheYvtIU791eXw6b9ywpy12qgn6ILCzxKyDO37VauvOSI19bFrdl1SmTSZ839rpTjom5aemaqsFk6OdGckQXvlUmMQXXHLKv9lSztdMyzWg0PWakjHijL8w70aVovN2CjeoQSMmQgJ0H0AdN2iZm1xlqVSJTP4pM8U62KIkLNQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGkrYTNYRlVRS2VwL0U2TFVKOHBTMmVIYUs2dHFlRXJVUTcwQWVRaC95MFBB?=
 =?utf-8?B?NU53WXVSWktoMHFZWm5WZGppWTkrTGZUaStJRjN0Z2EzKysyOHJpeXNPSFFP?=
 =?utf-8?B?dE9Edko5SkdkTnhlMWk4YWVBMGw0ZkVMWkJaMkZZd0hpdmsrRnNycWdGUXNj?=
 =?utf-8?B?emZZMVlOcjJ6bkJVTFAxbUNNbDlwV1RTS3hENTdrRUtGWDM1RTEwZkNMay9M?=
 =?utf-8?B?TnptUzk4UXRxc0Eyckx0N1Q3ODR2bnpZRGI5d3dLa0hMaE5EbFlrT0ZNS1Fx?=
 =?utf-8?B?bUZqZHJXaTJ2cGhEdlZGNEFoT0wrMzBOUjdKdk5UanpRbmJkQWpvTWhKeVF4?=
 =?utf-8?B?eCtVQnRtOG1PdUJiYzBFcWVpMjIwSWNoaE41U1orb0FmOUZxZ0JxaW51bEVp?=
 =?utf-8?B?K2diY1VaQ2NyeUJHY0dWQUh5Uld2NkwxYkFQUjVkYkd0ejkzSENMaVRGbzlq?=
 =?utf-8?B?bHNBU0hGcS9GTFlnRGdMdHVvSW9LMXFyaUZtYVVXWEJMcnZIYWlGTG9VWjJ3?=
 =?utf-8?B?RElXaHRlZWxGU0hGTlhzOWlrbHNVdkRmcWE5Zkd1OEN4STNpMGVPSWlkWmwx?=
 =?utf-8?B?aTljd0xTMFQ3VlE5akxiQTVnNEVRZzY2UWpXREFFd3c4aU9Fd0ErYnJUdWph?=
 =?utf-8?B?NUpOYjIwTlUyTkJiRDZpcitJUlM3d3ZUTDB1VHFlS2tPNXQySUhRbDVML2hW?=
 =?utf-8?B?VVU1K3l4ampqa2IzUmcvcVd2RCtzaWIrK0VMdFAwN2xPYk1iYU0zdUdpY3B0?=
 =?utf-8?B?R3pZT1hXOFowSSt4ZnA4L2wvL1lUTzh6SlJ4cG5IM1FMazIzeE5GVjdWcU9m?=
 =?utf-8?B?cllHQUhtVDlON0l1YVdxNUlHclE2UGlqcGJIaGNKT3VWenY4cFRoM2IxbFBl?=
 =?utf-8?B?ZmtCMGVvVCs4bDdTamxLY0VlbkxCRVgvcmFIekVUbU9jcE83MmpaNnpiM0FD?=
 =?utf-8?B?VG16L0h4cnliMm1QQ2FGZWVDSjdldXBwL2ZnSE1iMVllMnU1RFJLbEJBZ3Z2?=
 =?utf-8?B?UWQwREM2eXM0YXd2UURtZTdYaWxBWTB6SjA4WkNUYmtOUE84bzY2elF2aFRo?=
 =?utf-8?B?ZWtvcTlqV21GYWl6bXp1UitWRjhYQU9WU0pkWmxzL3pPVVZrakI2OENwVDQ5?=
 =?utf-8?B?ZW9oYUMzcG9HLysrNE5pNG1TQTFGdm1BMkMySWpZTEJESE1GUytiaTNheC9P?=
 =?utf-8?B?cnd2K2pjV0ZKYVdoUW5heFJVRkhwbWp2aGRzUC9mT2doNjQzNll3VFpJT3Bt?=
 =?utf-8?B?dWdTNTVsVjFTSDFyM2dxZlByNjl6M1I2UDNVdjlmd1hVZHF6eGNuNlVKMUw2?=
 =?utf-8?B?QU5Pc1Z6ZXh6WlpGaHdKbkVQbWN1ejk2QU90V2VSbTVIaU1ld3J2MThyckRL?=
 =?utf-8?B?SHZvVEpLV01DOEdyMDhyMWtnUndNelFURkFEZFRuVWlFRG9IbmhOeDBYSzFl?=
 =?utf-8?B?bXR2c2lUTkYraFpMR1M5UEgyY1Y5aUJqVGNjYTU0aXA5R2V1cEVvQ3ppZUww?=
 =?utf-8?B?cmpreUFDSVdPU05lYm5BdllDWDhDSnVuckVDdVMxazVOQ3VjN1RJQ21saVJi?=
 =?utf-8?B?dENraytIYThsNk5URlhLVUUxaXpVQnIvTDhScXdmbFpqSUhWZ2UvTlY2d0du?=
 =?utf-8?B?WjFuTXo3Tnd4dWVOek9ub2cvc1ZQU1FDZFN5SjNkSHlBNFlEKzBHYmRLTmEz?=
 =?utf-8?B?V3ZRMGtXK01jMHNSZ3cyRWg3Y0h6R0h3RjY2bHUxV3Z5SSsrVEN2WlE4dnFE?=
 =?utf-8?B?MWVvSHhSbURvbGxGdjVOK1ZGS0xBV3RrNExiZW43ZGk4dzB2Y0N2VzZqU3pQ?=
 =?utf-8?B?YkhzUHUzYlZ2NkJaWFFIZGpmaVo5dUUvell6NUFxMmRBZDZ3QzJZWTZXVWJj?=
 =?utf-8?B?dVFPSy9LdE43aVMrZmlVWUM0d3MyQVNEWnRxazNqYkRmb3ZQQ2I5dWZvWnFI?=
 =?utf-8?B?Q0pNNlcvMDllWmpGK1I1ZGx6aTZJRkdNQncrZjRqZ1NnRjJRUG1qU1p1MWJ4?=
 =?utf-8?B?SDBDU2dlK0E5NWNYTEdFMUg1MFBtajlLVGpKeVRidWlQLzJHaW5lRGFtem5V?=
 =?utf-8?B?Q2hWeTROb2ZGTnMxbXZ5YmVXck9ZMTVyU2ZYT2lkRmJVemNSMkxwdDE3VC96?=
 =?utf-8?B?UlJKNStyNDBkL2YyZHB4LzFyMW81RzFWUGIyWlRTczR3QzkyZEx1U3o2QzVF?=
 =?utf-8?B?cno1Rk1aZCtLNHcxMUNObmhJTk8yQjY0UHF2bWgyM1p5d3QrMXBaL041bGxy?=
 =?utf-8?B?UFg2WnVhWnE2c1ZOTmZ3MVVWeVNsWk5vU0YrcUhaRWs2dnRNdS94ZGQ0U3dv?=
 =?utf-8?Q?lD4fb3PQ9w+DmwEWmy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad14bcbe-0356-4ab3-fe98-08de7b9bbdb6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:16:36.9906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJhgMicyXtv6JsiDqJk7peidEOfBiA5H1dbKgyfz9poyMRDjPvr+QMWed9VRjnF9PicZth+UmFcfLMPLfJyX+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7395


On Fri, 20 Feb 2026 15:59:06 +0100, Alexander Feilke wrote:
> This series contains modifications for using Linux device trees
> in bootloaders. Changes from U-Boot bootloader are incorporated
> directly into the Linux device trees.
> 
> V2:
> - Updated commit messages
> - Added missing QSPI bootph properties to imx7-tqma7.dtsi
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: imx7s: add boot phase properties
      commit: 712a12cd673eedd23d75cd0c3b5496b37bbf3143
[2/3] ARM: dts: tqma7: add boot phase properties
      commit: fc0b92c272e6f47c1b6846e64a3d36e9af4e3b0f
[3/3] ARM: dts: imx7-mba7: Deassert BOOT_EN after boot
      commit: 1c1f7c337f928b1a3f82b6efda9ed21dcfe79490

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
