Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013009.outbound.protection.outlook.com [52.101.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF3E13DDAE
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 19:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773082865; cv=fail; b=dlCJaI3O4cTjVCXUNAKeXMh0HmtyhZ6JUQ6fv60hzRhmHJE15exJ2hIyTN8XbSWo3+6dSB4Z719mofAN7qqhpqZAjNPdxdF0yq6cMj5D16LFoAi38vViDsxEGPAjV+UQ/rwMpYyIp4TI7S+Ethmguz0GeNI3FgBK+NagbkwBggY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773082865; c=relaxed/simple;
	bh=aWBlCKG1ArDO8NUIcevnKmw/r7+Arqn+wusKP7FaZc8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=oOloOz/pXBvzCYGgb9Yby64WhckXLCs5flsYoOmSBpF3rAghfR5HmHFNGTtRR9Ok8fxl37pqayxdDCutJrZflNvj3H8KDoWu2fNzM4m3zB+FfVHRLYkiq69E0xo+pb0MKY5lcd8D8cjYZ/DggscL1Faeqx5PO48fx5yTwxNCCBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YMmCQZN+; arc=fail smtp.client-ip=52.101.83.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YMmCQZN+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zL8Uycb1vOdjsxX68kZEjZAZxMjuDO7vhDvwMpl5c8msepI3BrzzYtq9KTAW08Uww+6MDGd/+vgZJarj2/4U0V4esaHkdJlobnXL+eKyEnF+td6X9+wO7J1j8jMiaQxit1+csUpfcC6pzpk6R2ztYLo7L5ZIr5CK1iyD8rGdT2Wun/hwGHOxFx/48HomFPFV4Tlhk5dJJaasOYoo2i+/R93m/BZIHsjeiGx+twFbFdyNP8y2j9QcY596eCnk+sWcGCxxWbAYKh9/2dADFcn4AWhlrkPuA0177o8oxXY03f0GpNInff4oFNMZKTHn/eDk5pGo+F3Kzih1x9x23BZRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzsZ3Axvaa25SJcjGpoe6ffdQwfYXdbIGW6VdLJtqHI=;
 b=QUrpQR4c2T1DmJuftaKhwRTY0FWxStjpV82i3wE4tdJBl9l1TnXJ80q3bD2CFZg9usag39seLLI9wW2zgJ5L2RFr0H9S68jVfm9z760WVqYWvEkO+DYn2nxGlqMzwZIB7qqlS43uI1DMWNgNr1SRgVIpTfRdi9f0f1AGg3od0naAiwRcefz0MQmWPw0ARyey6LxDnBrslkjV0opWk5m/ncpGq0RflfIu3nd4FEErSE4sqb3YL26sG+75Nrd4cyz37c5tIZQnOz6tPVyvL+gqMENL8DAu4kbcpu66vA7A8D7br9mZsl1PEW+8nKahvSLMCq4FbAWHWE/iQTt3239qIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzsZ3Axvaa25SJcjGpoe6ffdQwfYXdbIGW6VdLJtqHI=;
 b=YMmCQZN+SmiCkuhQXsZMeFgUEK/vTaNrt+e49KNV1gFZynb5nibxPzOXGVQt8tj62YCQNqX1XI6tSXKPLWWzkAKa8Hi43sS06pFiWR+eHi4qKEr2Ksokzpt6OHM5GUB84Qi7XLmNJadja9CSuATS1p/1STBAbRsMY3azNp8tajVkMi5DZttR/c7lxDtOf9c5b6W8e1IrMO8ffvdvYG5htIPvcEEevAEriz3qnmSPE+Pu5WbZvyHzwS62bZUFfqHnHqoQRUQJBWpwa/ZYcMG3msv1uKf0eJlW3MZnDQD7ikLffzwJ+JL/ZJPzoEiMnpy8DyYYTxB+Z69Eq3q8NlN6Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV4PR04MB11427.eurprd04.prod.outlook.com (2603:10a6:150:295::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 19:00:59 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 19:00:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 maudspierings@gocontroll.com
In-Reply-To: <20260302133806.76191-1-daniel.baluta@nxp.com>
References: <20260302133806.76191-1-daniel.baluta@nxp.com>
Subject: Re: [PATCH v2 0/2] imx8mp-frdm: Enhance code readability
Message-Id: <177308285667.1765466.2495315865477357218.b4-ty@nxp.com>
Date: Mon, 09 Mar 2026 15:00:56 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV4PR04MB11427:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f524b7e-3244-4679-2384-08de7e0e3194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|19092799006|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	kyJNA4uWreIAFktfY95A/a6bQwE7OAI2UyIwhuABx6gGiMWf4HUxhc/zeRFIEZ4K30SPHcZYJ0YYSkwv0J34POnKmmATzVw8MoFDSm/Tkyo0ki/d4LMUexk8DW1NUXP/0UjkRhcQ1Gf3f2i/35Fi2RAVNEE7LQ0VTVGA1XJzXrVln353daCGPBJVlohPvMEw96GHLbeSulJEqYPkHfv2nXgDYoVBo7gjWGgxq6Qxl2hb6tDkhJUNG9RzgR83DNHwoRPmay/Bp6nM1lW07uoxSKi9vR9dbHgPIp8hJdARoor4h3AXJzj121JT6gsfjbbK7CdxalbL79bB0Dut3YO5OoY4GqBOsGvlrbOVd1u3vlODaICnDOxSmZbu5hJDmHLmcL8F2e2Dzv4Ak3KOhgKQOdImEQD+OKtv0yQO52nmOp03Hy/luT3LN9n/9ZQE9XPTVa7s1OR8PgbCnAGNrJ54LaWR2ALe/kRnToRxWw5LUNCPCOvjAjjTB/WNpLRhqXtzeKgyOfVvl1WSsCy1tnWz+DLUoC9rNZo2jZhQl0keD5R0ovgkr6z5iFdifkUctqMZWfkh4+c1zfcHFzVhH8zLDgQNQVd7ipAueUkenLsbTNsZQkjvrJvk3WfJwHWejAaXbDkbqJEH6ABm/mUo+ehahyxJW8bRVQGfoSAgX7KtOl+Ru4jTN8/E2mBWt+3ZnW9tWSJfW5D/5vbj5T9DdXdx63LxT78erWOz9IIWz8YUCqJQAM4nnQw/OFxWAsXcwbKzuzfSgkvadRjVJvBN9Q2IpIB+DHHhiobMbGuTnEpR4eQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(19092799006)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm5iZ09JM1NDdXNjMGxXNzFPb2llRmZwSkZuZDRJVXZRTWxDRi8xcUt3eCtT?=
 =?utf-8?B?WXNFWkNMM2o0aUZNMndNbWNqaWFNV2lDZDNrY2hvaHlySXNCWXZpbG15dWp5?=
 =?utf-8?B?Y2htamRFOHhIbllxM1VvLzRyM2pLT0lIV21ZUllwOThlL1k2WmhtMWd0VHZw?=
 =?utf-8?B?b3A2QURrTytPWHhIenJVRVlOeVJueVZkUzV0ZC9IOUlZRWZGNDFxbEFZYnNS?=
 =?utf-8?B?ZklGT09mR1lQUnBMazVxK0IxNERIZjhRcGh5TlNjZUtKcUJsdkpjV3ZxUzYz?=
 =?utf-8?B?bzQybTJSWk5nTVo0akNObkZ6a0crRDhnenJ3L00zUXczeEN6V015M0ZLMkRl?=
 =?utf-8?B?NVQ0eGRNUmxFY2ZidWZ6TVc3M3dlaXVuYUJJNUpXSXU1NWZacDNYdHQzM29W?=
 =?utf-8?B?RzMzM2s3cU85R2NKejdwQXE3Mjg5bFZOaEhHTUZ0RWdWTHphUnJVWmVqeTEw?=
 =?utf-8?B?LzhNTjkzSlVadmg3L0hwZWZiNnREOVZNcE1pTUJTRnNaT3JrQXJ6WDdJcFJk?=
 =?utf-8?B?ZDRyWm9DQWtjeTM5ZFNoKzc4TnFBa0FzaHgyd0pibVlZMG9pS3hSQ2RKNURI?=
 =?utf-8?B?TlBmcktBckdqaGJCUVBSa0pZcUw2NDc5cWtLRTlCV3lQcTVxY3NMazZBSU9V?=
 =?utf-8?B?WjFINHRlRWk3bmZoQTR5SExNRWJZQTFFRUtadjE1Zm00S1Z5WmFPU2sxWFlY?=
 =?utf-8?B?Z3VTT3BEREZ0MWphNWU3YS9RMU9DUEdGQmF1UXNwZk0wSnJMYzV3eXpmcHQ5?=
 =?utf-8?B?RlJPak5Wbk50UmcyT0RIRWZtQVRLV3ZpQWpxQlJTOW4vM0VXWkhmRmJoMGJQ?=
 =?utf-8?B?dUNVS2FCaWpCakNpcXZRWlhHS1BLN2tPWnlGSlZ0R2VuSCtJbGo1R2NacWR6?=
 =?utf-8?B?ajZKSGFPUitRMFNzV2syTEZIcEoyQVMxZXlneVhuN3RCOU1xcWVmc29qTWp0?=
 =?utf-8?B?cElRUVdTS05pcXZEeHl3KzkvRnUzSkJTWWxITWxtMnl1SGtESG53bUJ3MjRj?=
 =?utf-8?B?T0Uxb3ZOSkVmc0pJUTQwbHVQT25sUExzM2FoYkZMVkp6V2lDU2F2d3E5azRO?=
 =?utf-8?B?a0ZHU0I0V1ZtQlRuVUZJSHRlbW9Pbk44OW9kWElIbzZQc3ZrMlkwcEtwWTU5?=
 =?utf-8?B?VGxSdmFJUEM0SjVxcEpkbFlMaVRpNkk3eEViVWQzdUFwbEhnZVVOVmtEUU81?=
 =?utf-8?B?K2M4bnBsVXhCdjlPMkRCMmI5dkRaWS9GT1NWYVdOTlcvMjBndTJPenF4NHJo?=
 =?utf-8?B?ZjJ3NHRNRDV5dmV0WVdSeUZHdGlPTjVwbzB4TjJQRlptSFhZYWVtUnpuaVlW?=
 =?utf-8?B?OVMzdTFiZTNPa2wxYWE5amlCdUladVd0VVZEb0xCeFFSdUlQL1RZNnJaUC85?=
 =?utf-8?B?blFMbUUrUlNSQXhKcTF5Y21FRmRSeDlMcWlHOTNjdStjOTh1VkE5K3lJMzls?=
 =?utf-8?B?bE92RENmRnlLQzBIcnNIWTlJZW5NM0YxQlZNZnlTSS9VckVnN0lXOG9GVUF0?=
 =?utf-8?B?cGkyWjZNYXgvNlZzaTF2NENRM2JsSjB0MGJXZ1pzd2Zkb3d4SFZQanRvc3hZ?=
 =?utf-8?B?TmZ3bEFXMll4SEt3MGNUeG1tSGJoTExJYmFVdC9sUkhTaExVMjhlcEdIUURI?=
 =?utf-8?B?VUI4SDgrYlFDa29XQURDV09Fcjg3bXV4TDdPTWQ3VDhZbkJYWmlUN0I1SDUy?=
 =?utf-8?B?REltNTRRbktNb0pPN0xDclVLWHdNTEYwOStERGFlZlRVSVJVL0xEdWlUaTNW?=
 =?utf-8?B?UGNlMFV5T081ejJ0QWt6bnMyVVdYR3BjeXUxc3k4elJZTGh5dUQvNzZhWXB1?=
 =?utf-8?B?UEx6K1hjWFhab2NJZXd0Mm1WeUF4QWkwYWRveitoV0J3WFh4R2o0RWZFS21J?=
 =?utf-8?B?NXdNcFB1UjRoSDZVa0l5d1lreDl6ZVArYXlQWVJHUFdlS3R0TWpJK3NXeHph?=
 =?utf-8?B?bXJjUXlpOUZPRi9JZEcxTVB5TzZFb1V0cmtjeFE1V1NRZjBrKzk5MzVneEVT?=
 =?utf-8?B?b3RRaWc2VHJnaUF6VXhnaE1tT3F1U0VBOWdtRStNaGdUYTNaOHlwaUxUbHAz?=
 =?utf-8?B?TCszeE5xeUdDNldEUmlob1doRERKTEUwZGlpb1k2c0VITTlpeDN3VFlKTTVS?=
 =?utf-8?B?WklMQXBRaW9HWVNhOFkvOEFIY3d0aWI0bnZIaGRtVklBTjl1Ukh1VG1CR3RZ?=
 =?utf-8?B?aWNrK2FwQ2F5OGI0Y0RmN05sTXJMY2NnS0N6RlhyWSt2NWNUbVR2NG05czEw?=
 =?utf-8?B?RzlPRkJqTW45eHZNeTJnQzNwdDVpN1g1RHY4b0pINHFncVNkSkl2bmdyenE0?=
 =?utf-8?B?RGFZUmVQV21zQUdaREhvOHNYQVVvck01RnFEZW85VmpOVm9ONEFYUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f524b7e-3244-4679-2384-08de7e0e3194
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:00:56.1641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9yvwsrJywVglSG+G97gae3sDsGTGC2eCaq8NLYPigHlQlSPFJqN/bds1IGkxTmcfbKVAp/JZxEiBgnxH3D3nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11427


On Mon, 02 Mar 2026 15:38:03 +0200, Daniel Baluta wrote:
> Enhance the readability of IOMUXC_SW_PAD_CTL_PAD configuration by using
> symbolic macros instead of magic values.
> 
> First patch makes MX8MP_I2C_DEFAULT independent of DS so it can be
> re-used in multiple places.
> 
> Second patch makes uses on the macros introduce with:
> 31ff1060175c458 ("arm64: dts: imx8mp: Add pinctrl config definitions")
> in order to make code easier to read and understand.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx8mp: Make MX8MP_I2C_DEFAULT independent on drive strength
      commit: 2a3b7d972b79f0536b62a645189d339ae3ec9e0a
[2/2] arm64: dts: imx8mp-frdm: Use symbolic macros for IOMUXC_SW_PAD_CTL_PAD
      commit: 4b74ad53a8e16d676969befd9ca2210bb7bc2917

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

