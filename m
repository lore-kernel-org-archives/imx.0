Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B554D22D785
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453678; cv=fail; b=lefYYkZEUsDWCzbZKrfjROoqZUJpcRT78/gZ4OO8UcWsLH469UIi48j9N3dmwv7XQ+uGxdtMOJG04+WiULkZXH4ea/YFRAwqXIrsUoFLVcdb9/lduhdwJAjUb7laCeasCxHH3QhJ5nGx9fFpy4xVuyZCTW2HOhuOCqdq7/pNrXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453678; c=relaxed/simple;
	bh=qJ7NlKnNVbwJXZk7bObi+4xZ65ikigcUrdcq+vz3fXg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=AtOhXBG+n9+jYsrrZSZ7q4+4cka8jDuO1C7blceVLL1aCNniAp3l/5ubDr1ADExWJ4wM0Oxmdn+Xifw+k4veWiU4mDohlAg6myrGQvC/shEE9C+k4eeif0GDGlGcKpsCI7oE3hGGMAov4tU23g4Ahk2mmbYNfBYp3ZpBo/d539g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oWjXA/SS; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oWjXA/SS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCWJbhzzvmWvAJ5tyDBx2+xf/4Bq/fTopxW6SUqnlFM4pMNgLF/V2+YosdX+tfcTPbjaPBUjYkqd/hsSu9SWpXOTrHAJAHRV8421cpl190/GcUqcAGlMlj8D8QNiWESPnceD3ePad5L0LS5LA36cviKMyEqvrYrgJU4w5HjN+mbqUHKocdPVEcrKb9HuzDVq2tM52B7QrWWrYaC++ImWJ37Kg2V+9ZQxdwtJT23qsNMVPSVD/7GQpRYsP6/d28U2qN3ZEgxI3VkiECGbp2haWqqAJOrVk0BmQ3z7f5SbfM5M6+U0FKQn5DA1LHIs1skzlq1RDZppQ84MNPclT/x/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9POnHj/qjrAyZy/ovEj3SRfINvoPhTT3MI6LTayfyeM=;
 b=E12PG3YGrRv2LCrDpjUFxhhowjubPemloxP06P9QuWOcIuaK4SB9oXz7UtOu+ywsiyYl6rzSstqU51nMLaCs+akDSux5R08fMXVgihyLucJDwSoSdlYz1XGYpQv1jUipq9z8eHj5y8EJRMRtlZPXZLTLelqJNd/e7mJ4VOPo+N9EaawW4GyCSqtq0UCHwY/EwHkizSShRIgdu5iBYMToCdhIJC/S6tjd9AhjXryFhBfONWFeah1qYJjAoMDZERz39t/fdPAGoXSu/HFR87WNoAi0jJ8V9K3A/GUcc4oX+VC0k0wnbyHqf0GWIsDUZvOYDObS4fuP/eI/ocVcOKuSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9POnHj/qjrAyZy/ovEj3SRfINvoPhTT3MI6LTayfyeM=;
 b=oWjXA/SSwqYlOW7pAxx4MQSVWUG8X/8LKvkXKUXmn211bKyTbu3wwpwvXMk3LvcCxHjkjBx2mJJD8X8dkbnoMO2elEUHNfAho+Z4ESHfSwoNyyHV/564gzWlQGeHBC/Pe2RY48ss8evMfFMBz3HGXlVHvPLZYYROtu4bqVX1vIlTsjQDdjv45pRLkIG90cJtUvqDb5pFZRXRN5uEG35AISy/DoZtoxDlJQoYQDwbD2rWAZb38ClOgoGEdOywYw804a7Kg5jMYD/8FLE5eE+Ik48I1kjOuGkSICEgJcX2o1Vk5KEzCIO4pFFw/IAWmN1scT37/32ear6OgqzSAlpKYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 15:47:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:47:53 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com
In-Reply-To: <20260316135820.760073-1-alexander.stein@ew.tq-group.com>
References: <20260316135820.760073-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mba8mx: Add DSI->LVDS bridge IRQ
Message-Id: <177445366869.3112674.8068883726474387447.b4-ty@nxp.com>
Date: Wed, 25 Mar 2026 11:47:48 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: 28698b61-bb10-48d4-3804-08de8a85df7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4iQnlVg7eYdxlSbvG37rguCL/uShUCvsjSN3TmRMR6hTCEIXU7Ds6yTX2oX8C/cJlbGB3ioTQOMvAD3TQs0kjrSS5b47jhGhTlqy9+PL0E3dqKABOGQZxp2USt72Stn9G67tstRzmOEvb1+KBGJmQ9yMSPRMEf1HOwpn1qqewkq03tIwHWOXyTyhiKIwxP4F+7EUvZedEBVG1W7/lgrU/J2U5vVz8J4uZxlWkuYsfuX2u8p0Q5S6vX/iKvjkT+DlPfp3sSAB9Y+RXopy8yUu7zm38zH24kCByWgsMvPXUsiVpJkIAjgOt5phn7/R97+yBmaAm2TnzQ+Y6PZqSJ9yl74Y1JWYmoi9bibW3bfRm+OxqXcgdP9uvu/G7f51e4VTE165GRBHw4L9ZGR8ne901VwBi0xZyj0wtXEdNT4kCaga8WwA8w04CCrh/Ql7mKh6t6CqKVcZtsire3coDbR0CL64Kleift4YAehBXixthq//9itzJZfVMoypGEHSXWO99e2Sn5OsQsTBkNnC3ERdOzK/zSDPpLnAMexSPZUaghXk7CLr0v+UjkgE5OdTSf1OaZQjdGuE7H9vPzhe+rBWTZBm609EdkECp6jFPZWUSKWKvVsvlHtdO97ZdilnmtXL6skyJ3CKkrRGNHuCdg/Cq4D622EgHuj8MaHRSkgAwkUZET/0ijouyLWs6MqGzEM3rBX8EG0aR81PawRBzm2OrCpsvaVAXwwhTavXDEdpAmWtcmKd7dnIgWAk9VMyil4UH6ZEIaXexx7NiIPOD3qUjdI4uHqtJ/+HqTOKdwAIS2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGRwcE1SS1I4SitwU29Qb2JvN01UZGpENTIrWVFPYnhZZnZUV3IxekVkckR2?=
 =?utf-8?B?YTg1aWhCSmh4dU1DRDVENXpBWjBuUjBOK0tSSUpqdUJSNXFOZEF3eDhTbkFD?=
 =?utf-8?B?bTREUWdiZnZuTnJXNmNsbEl0d0FvUDJQcDEwbzVlTm5JZGZtVmEyVDc0SjBN?=
 =?utf-8?B?a0d1NTdkSEVtUVYvL2V1SlEvdE1RT3RtQm80emJaYXprTXJKSjcxTEdKMUpZ?=
 =?utf-8?B?M3NMMU4yTGpoV3dURXJtdEJCRk1sdHRicW5WU3NNN25DM0d2bWRYRHNRaFVH?=
 =?utf-8?B?YWliMlppNmI4VFFBQS9UaXFSSWdPWGttRVpMK24rRWVjMWlKa1RLNncvZzRz?=
 =?utf-8?B?ajlyOWlUdGxpMXY5cjJJQWg3eVUxdmhCZ3FMblp5VDB0MEl3VjBXTlRaeXpq?=
 =?utf-8?B?MDArcmN1dVhDNE85cVZVbnB2TkV2clNuK2hDSHcrR3R4QTkxNHdUdmFkdW0z?=
 =?utf-8?B?RnhGTTdyeVR6Sm9LNVRxdEwzTlAzRmpiV0h0VzgyMmpOVGFEODI2T3JCdlJL?=
 =?utf-8?B?MWx2ZkRJaXBtUUt2cy8xZHlMNjVJRGxZZkVqOEkrUVdsYVM5eU9ZdUNIMDF0?=
 =?utf-8?B?MWJnVkdad3M4aCtYbzFENm9SMmlKUGpvdFo3RzQvKzBIakJZYVhsWEhwcm5W?=
 =?utf-8?B?RnIyU0hyMWNLRU55SjJ2UGdrQUFOWGg3TzgyRVUrK3dYejJiYWVVMDBjaGlB?=
 =?utf-8?B?K3U4Q3RjVUlidmo2YTQ0aGNtaWtwelRKVDZxRUJqc3lMalp0VEl3YzRJTFU2?=
 =?utf-8?B?dmlsbUJiV29hNzVuVTEvR2RqdEdzUXJoYW9kSHVidytudSs1UkRiKzdobFRu?=
 =?utf-8?B?akpGSzJlQVpOWS9meUMwTE0rQmJ3eStMZzhlY0FTcjFIT3BxVFhuZUpwaXhW?=
 =?utf-8?B?cGdJY2wwVjBpakI3S2tIRHJxUVZyVUZzQXZ0Y0EzL0tPaU5UenhmbW1QNjRE?=
 =?utf-8?B?Z3N6LzBMQTUyQlp3YjBJbTRkZmRDVlJTR3FodkNIMnZhZFBMU3Z1ZGxONkEw?=
 =?utf-8?B?QXBqa2VybVJ2UC9MUDA3ZGJ2YkxjUTE0b2Exd0xQeUlYVkhSTXhkQlpmUnpD?=
 =?utf-8?B?Nzl1MlpoZlFyNko4VzM3MTRNVlVoSkZFSnhVdWVRZDlVOVQwS3hBU2k1R09m?=
 =?utf-8?B?emZuWFdBcVJqbVlRMnZaZkdTQlZLQVZWQXVHc3VCblJvalljZDI0SUVUblZa?=
 =?utf-8?B?djlWRUZ5V1dnZGlBTkNDQVZVaVJEVHRTY2l4bCtmOEF4dEhFRkMvdm9HNkNx?=
 =?utf-8?B?SnMvaWNmZkZrNkt1Q3BJVG5oakp5KzFNQVRWejVJbWZmZWw5SXVLZWwwRkFt?=
 =?utf-8?B?c0ZKM29EL09pWmNoRVAzb2ZILzBlVnp2UEFjSHRCRHhTSFlWMUdaK0R2T1hp?=
 =?utf-8?B?dXFsdmYrSVNtdStra3kzcm1uNjE0SElqb1oxOXVucVl4TGtSS0RsU1lVdnJR?=
 =?utf-8?B?RGhIczlOOUYwV1RHUzMwclRMbWs1WG5sbWdUOUVrWUJBNGEya1FJSEdoKzJP?=
 =?utf-8?B?NjhjYlo1ZmgwRkNjUUQ0eURNdS9nK2VNR1B3cFB4cVhjRExEOGw1RHh1VEhs?=
 =?utf-8?B?aUFMMEc3Wm5tdGU1cUFzZkNTWTBIajhvakViS0JjRGhuZDArYzZRM2NpY0hl?=
 =?utf-8?B?OGlWRC9EWFp4NjViZEkvWVpDaUIyeFlxRUs0SHlGOHhJcUVkQXVVQ2QrVzdP?=
 =?utf-8?B?UlZDTEh0dFdWS3VmYUd6d1RVa0VZeGRJVWFVSzNKKzdCRUFwdEZSUEZZQjBa?=
 =?utf-8?B?cXRUNGVZTm0weUZHYWZvSmg2dzVUM2ZUYlhUUmJ6bHlLM2k2eTFlNXQ5Mldm?=
 =?utf-8?B?anlFeTRtcDZnbnlVc1FGSmZ4TSs4OEd6R3UrdUZ6Zi9tMkdtNTBnakdjWmRk?=
 =?utf-8?B?bWlGeFpOMFlxc3VCWHFRS0liNjNqQlMyYms0VlE2b3kzdEhFOGp0S0hnZDBn?=
 =?utf-8?B?NkZtdGNTekpTV2dxY3hScFZ1NHN1REU5ZWt3SEg4aW5BTkxsNXFtU0dmOVcx?=
 =?utf-8?B?MlBmY2FpRzNwSGNCMkx1TWY2NjRGaDdzaWpQbytna0dQNzZEeUt5ck5jZ0pL?=
 =?utf-8?B?SDBzd3g4TElmNXcrczRuTWJ5dGg1cVpvMHQvQjE5cmZJOWpkMmtQZVg5Rm1n?=
 =?utf-8?B?MENTZ1VDZkxrK1owdWNOK1ErakVQRlFBRVh6UW9JUWhRMndWK01ZVkp5N0JV?=
 =?utf-8?B?ckswUUdDSWlvWWswNnNmTUs0MXM1NU53VmwrYUtCeDR0c1VyTlErQWp0ZVJw?=
 =?utf-8?B?QTBxeTVpeVRrd3JWVUJXM01DWm4xQ0dUVnVFcjI4WnpJWXh1VUV1Z2E3WVBp?=
 =?utf-8?B?OVRZK2xaeklWekYxRjcxU29URmhzZzV2cDZBUEdIMlVoSVdLaVhSZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28698b61-bb10-48d4-3804-08de8a85df7a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:47:52.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2w3iAd5lgGndVbLYmAbSWuVMTuWEVm+GHrogpcHCOwjely6gXdpcIpnUNbnBTGr5la4XHKkn3MDUB77cptT9Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984


On Mon, 16 Mar 2026 14:58:18 +0100, Alexander Stein wrote:
> Now that the bindings supports IRQ, add the IRQ line. Add a GPIO label
> as well.
> 
> 

Applied, thanks!

[1/2] arm64: dts: mba8mx: Add DSI->LVDS bridge IRQ
      commit: cca9457d5461202a08470a6c778e195ac7c7c775
[2/2] arm64: dts: freescale: tqma8mqml/tqma8mxnl-mba8mx: Add dual-channel LVDS overlay
      commit: e186e92cc785949b180710af8d9da826e45d57a2

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

