Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5E12E1C63
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470066; cv=fail; b=D8GsOKihkAbOA5HM5Bs8HrKKa7FvBvQ0zYgtQ6afI8oqZet24ntvrN8eRvBf7Y6FgSu6jftveMLzJeS1hmg8uaGeb42Wzh9i4UE6Ui1ERB5+UsqtKuLLWX7EI0gayQMVixHL1z6jxNSUEjTKuu7kxkkFJqJ2hL61gFFzbtoTs7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470066; c=relaxed/simple;
	bh=DBvoCxydvYkw5UZ+fZyJ3dEPqzaPFOkGM38F0eG+tSY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=NlAjBJuhkitszMpVoU6+0ypX0B79v0T6uxFpsmApHPAqSvu1514f96+B0siA2ZRoMIJP+g+mBI+kTwLHDUTLsfkG7MqR9tYcQ7nSaSXZMv++d1XHdCVeZNUG9/ZvDCKC2tUpFPBjSjX8z/0sFrc3t42AVMMX5RAsSgEfHX9yBpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Pz7YY9Y5; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Pz7YY9Y5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUqa+C4IW5f7BdOge7ZiN5cSdb5TaI+GgHskIoahbcYAnxt6j5eZEmQDYxAoC+Kx6SZJVl5r09nNn6KY21szPgqahWa0uTdcq8FktzYVW+CDH+7cTfLnLZ/JJaAlvfSXfblIb4e/iRoYTgPZw/U2jUASfVNG9aIfd66vd8sRw7Xtkc4oxQ3+dNdQyBaLtiIvAYEu9HeNluxmLvEL98C86Ppw9zgTJnHy5w4OBVT2pgxUeuue5Y+Qdd+hWKNI7jiyf7T7Spect1z0vpXFT3CW+AssY9NhSRRnC2um+Rd8ZcmRhv3axbqlJ83/2zyZUpZVlL+tcE++XlYZdR9wll0vog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REs8os8Q9hJQNxPL6/DqDw1OUks2ZGyaD9oCun8RGQE=;
 b=BFL7MLTph/cvO4fONedH64wDL7opcEyLtOYt05hsSZYpF382mibcCljrq9kiIb0zibDbt8zimRqTosa+KWPJkpPpCwXNOOIs/n4gO8Zvk2IJzcAtZODTFw8NHHdgS3ppDRFrPkz5D56m/p/LaiJpskcLlW58fhifoEnnG+TI59shoy8KUThttpowAPe9BpwtiK9odTT8wDE126o6L9u+EGDvMn15jm7fXeAqXnrp11AwALSYg9XYwF49XhQZxgeSMav5TQXKPKcTNZVK1ON9muKF0PjFAzKB4HP81spUmEKV7N5e3/rRM9FmeP3NryP1QuUYYQhQCe9ZzJcGfplOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REs8os8Q9hJQNxPL6/DqDw1OUks2ZGyaD9oCun8RGQE=;
 b=Pz7YY9Y5ksrwfDCrXfI4giJbCXIwXthdkuHSEsIazj354y1bl7CqWxfevlZlRsaBlPljs5zECiCiWHZojWQvJr656YiTtuT9AYSIYAv7VvuYzkr0V2ifaoT/dTNaOZ5kmejOzI+Le5mXbTqV6NnkT0YZmyaMkGxLDjfCxV0YlaoH0ZdYROjGuc6SUvbjx4Hsp6LkLuPQVPtu5RA4jCm2MfbDY8adBwXdNC/iA9AebrcQMHGrAQYnVWporyc02K/KnFGefuMqgmQHd9JlLIGIZkNFSZMw655sk7YBARXynnb2mvkf3aVOc7N4MmTlMHC0drEVA70lpLBrinGpXzNdUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6801.eurprd04.prod.outlook.com (2603:10a6:208:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 16:47:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:47:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, 
 Shawn Guo <shawn.guo@freescale.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com>
References: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com>
Subject: Re: [PATCH 0/3] ARM: dts: imx: collect some simple fix for imx2*
Message-Id: <177247005471.2102932.2171453781907076912.b4-ty@nxp.com>
Date: Mon, 02 Mar 2026 11:47:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR03CA0198.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be2d32f-3fbe-4d93-acbf-08de787b69cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	u5m31JqVeY5AyW3oq53pu0DZg5c5v6+DBP09M8+A8R36OglrgIRX2i5TnlttvFs40Ne+OmU1VeoKPBbMfJ2gPiuMO4RkjYVgaCfmT7jaVh5mcIfr7YAfpIQnrucAGEKhEx6x3VodAzIezQRzxt+MWPuOvtTwMT9k8LM+dRkX9wuwffeY8xsjtwnTLCb8quw7JLE56utiuLjN4cLftOBul+av46L2epQLCo2xtKbVO+bMxKlTy/Zeglg4yp2F9R0fG9ATpJgtsrN9FV8PD6oJ+Jl51wgmMF9SW3qHvnh8g7xUjzadYIXD/AMYNwchpZRorUaFeCZ1CzI3XWeMH6dMKxJ10KGnaCHTmDw35oW7vagTfF99Lg419nHScXGKshoOOb5xaCiNmI/xL2cQmQQ5Hv1V0DyvnG7n7sJwCLVkKgAgsiGYhzvC7x9WOFYc0XEe97ak1VegF7xJzmlGIN+RcM3e9d1YiNNFUf2IJOVVSoWxjrxV0fTyo0BKXyBixhwXE8ODHw1t9PCfoYh3VDeSh+gZiv/l41aphkCjkhQORLOFmLVrmCmlzcxf9UgHHTXsaUx7X65L70UJeku7tWTDIzHYVx0/X7m4e+4oEL/OnVu5BUwv65d8zTbMXdgV707+KVvNu22NsgPPisJhpnFyV171yP6rNzFGicL57cbI+G01vYBkcyK/b0aJWGhgm1i1Ychv88bS2wCc3jN6jHNp1w8XJAC97STN92PqrGgWvy0U8q7tyuAjOWL6pN/mNNHTRJSAoWJQwn5wSoChldkJ8irzI1n/+tdCAo6oqEfEQmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1RTMXUzRlFlVVFuWE1aQlZzN2RZTUM0TGZsSGcwREd2Nzl1dU9reGpzS0o0?=
 =?utf-8?B?V29ITUJUN0luclkyTS95WmlVYjFSQ3hQRDN6N3lRNk13dGtLaE9Ka2tuNWha?=
 =?utf-8?B?Vmw4MWpoOFZuQUM3Z1JKa3ZKUEp3dlBiNlhTb09uQ2NKQnNqT0pzd3Q5MzU4?=
 =?utf-8?B?ZDlQV0MzZ0txWC9VUEdsR2VvRHA0WnVCZ2YxaC81ZVA0S0NhWEF5M0VzTTdy?=
 =?utf-8?B?Q2NQN2h2NWs1MHV6cXllaHhpdWVxa1VPVDF4cWFNTU5lYmhYdURtQnh0ZDdr?=
 =?utf-8?B?NzRybFh4aGtnY042bE1SQjR4SnZ5blJTNW1lYlFBTDlhN0VhSUhyL0NlcVVx?=
 =?utf-8?B?elFadCtacHJqdHh0ekxoWjNFcXNrYU5xdmFCWFRpKzhIMEdLb2tzdU85V09G?=
 =?utf-8?B?NHhCajRMV3Zwc0RyMktJOEx4TnRKZnNadGZVU1FUaG9waGxuNXRuUS9oQkhs?=
 =?utf-8?B?dk5iUnE0Q3RxYWdKWVdwVzZHRFVSZkt1RUhmZkZLRUFaVk1LQTcxYTY0azVC?=
 =?utf-8?B?aGR4b1RVMlJFYjNTcXV5aHIzdm9ydTk0Mm82ZWZIZXlLaDZXWm1YQkUvVEto?=
 =?utf-8?B?SHFSRTZHTWdOOHQ3SFNrUHBjejlQOThLRHh3TEE3cHRWWkxXQ1M5VVRacE05?=
 =?utf-8?B?UHB2NUN0RHUxZHBDVHFBVUJtYnVwQWxHejR5M0NUWkFQSlNUa29ieEdtQU9a?=
 =?utf-8?B?V284YzRNTUhwVTlvdWwvZFB5MlU0VHNpR0xCQkpGcHUzT25rcGJQNUM5clFt?=
 =?utf-8?B?N1N4UTlKbGx4SG15TnhCNUE2VWhnT3BrdlRvNUtVbEsyNkNSN2dpMnovWS9s?=
 =?utf-8?B?VWFOVVZlM0dzYjR4elpQelVMMUJHTllJMmg2d3pHdWVYUVNRbkdyTm1jQkdz?=
 =?utf-8?B?dzQ0WnJZeWNmT3d5Z2tPZkR4YjNPbmxRRWxwamI0M25vMlhTU0Z6SkRSbGxq?=
 =?utf-8?B?T005MUJjL2FwVU9hdEF3WUVKRFhtM2Yvd045UGMxN25QSDVxZEk3MmdQMjQ4?=
 =?utf-8?B?S0pDM1kwMmJHZ01nOWZMWXJZdytFZnl1VEJKVmd1ZC8zWUlZUjV1N0U3S2pE?=
 =?utf-8?B?NG1kU1F6Z1N5MGlQMFVrSlJzdG1FVkIzM2Z1c3NvT2VIdmRUQnpXeEt4Rkk0?=
 =?utf-8?B?WE9UcXRGczBkTWkyazBOc2ZUQmc2TnY1Q0FhZHJPRGJmbjBFRVUyTGRFRFhi?=
 =?utf-8?B?Qld5ODR3NnJtem1TNnNRL3puankrSjU0M2JWalA3dUFDcDE3UjJTYVp6cVBm?=
 =?utf-8?B?MUhEZEI3WGs0SEJRbHpraXU5Uk5RaE9aNDhyaGowQjVkUCtOcHRUOVFqc05t?=
 =?utf-8?B?aU4xQ1pFRFh2SFpFVjRrZjRpUEZERlhhU2tWK0p5U2FPUW01LzZjZEx6UUhQ?=
 =?utf-8?B?Z1pmYUlQMU04QkxyMnpvOGdWOVREcW1LVkZRU2dCaWdTYThGTzk0QURrT1lk?=
 =?utf-8?B?KzdaZ2FFaWRnUEJUb3BHd0ZpOXUvekdjMEI4VWErYkdwMG9kdXE1QmhnZ0pV?=
 =?utf-8?B?N1I5eHA3bjV2TkNVb1p2R3FZNmEvSXNRTVZ3Mk4vbnpDM2dXUFdOOHl2RnBv?=
 =?utf-8?B?NHp6N0FRejhZUTZBVE1xTUJCZjEydGpvSWJwMzRFQWtNaTlsNnNIZ3loZjFk?=
 =?utf-8?B?TkNpREVjQTY0ZFA1VmxXYWVIZ2R3dkZEcE5MemJIaVFjV05sYVBJUmdBditm?=
 =?utf-8?B?QkVPV2oxSjVRelJzVTdsTGkvdUpBZk1QVTFqRURaQlRzSWJiZlowNytJb3ZY?=
 =?utf-8?B?L3RGbGdhaFhZUHo2Y2V6RWVONFVWWGNySDk4cXN3REFoZ1k1Q1I4cFJwTzRW?=
 =?utf-8?B?OGRRUHFpQzlNWHdDZTk1M3puSzZXMUsxZjRLcmpzWC9oUWI4eUdMQnA2eWdx?=
 =?utf-8?B?SjM2Vm93MjhLMk5pR0pheGFGRUpYamZUYmpocWdTdklwNE85eFdMcmZDVWdm?=
 =?utf-8?B?N2trazlsdUd2MFdkN3ExU3ZNMEZ5MEMzQXFSNXRYMmJKTDBJUkx2b0d3R3BJ?=
 =?utf-8?B?MHZkV3V5NU5VbHVBRFhxRTBYR0gwbGVYVFRCUFYrYXFWQVBDUFZHdzExUVN3?=
 =?utf-8?B?L2FndWRCVkFaSStKNmNKVmZLbWZ4b3ZkbTcvL2xkTElSTFAyWHNGT0NNRjA5?=
 =?utf-8?B?QXp3SUtjMHorL1JIRlNXYXFTVUNNN2JFOWR0T05RSFlHM1pLTVlxTTVCZXBQ?=
 =?utf-8?B?V0xzN1dRSjduVUJySmxCTERRbmd6R1JXWExHbThUQ0srSDM2NjBsUGY0UEhB?=
 =?utf-8?B?MjZtSjZObzdaZHZJU2cwTGpaclc3MCtERWk1cXYxbnYxVkVkQ3p5NXM1MDlP?=
 =?utf-8?Q?YWAN8wNOWHT1Hxtwoi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be2d32f-3fbe-4d93-acbf-08de787b69cc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:47:38.5937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VDNUR11Z+/EmXyAiZlGRHYSafX7FQRFiuIyPeajInpkzLflDmbTrkNRXcwk7fa7ierscJoQx7mdwoAKxeTENA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6801


On Wed, 11 Feb 2026 18:12:54 -0500, Frank Li wrote:
> fix gpio irq issue. (review code)
> fix check_dtbs warnings.
> 
> This is last around patch serise to cleanup all warning for imx2* dtb.
> 
> 

Applied, thanks!

[1/3] ARM: dts: imx27-eukrea: replace interrupts with interrupts-extended
      (no commit info)
[2/3] ARM: dts: imx27-eukrea-cpuimx27: rename uart8250 to serial
      (no commit info)
[3/3] ARM: dts: imx27: remove fsl,imx-osc26m from fixed-clock node
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

