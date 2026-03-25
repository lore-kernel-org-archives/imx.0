Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011027.outbound.protection.outlook.com [52.101.65.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E43E3171
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 16:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455285; cv=fail; b=hORZBYHucCGOobUi+AnIiVNvQSsleC/+ZOCVzsqPvBd/Zmia0vike0yJUcTkfgrTrqg712a6aQfQjZcztkDRqxmGMIMuTce/hkCvAMGlERwY6lR++LGWTp+2BKBEi51js5JevRmzbgezOZ6I7QYeKoRiq6+Kpr/j2q+VhTuDHWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455285; c=relaxed/simple;
	bh=LeRjIXYm6DRu3Yb8dseAf4MLqpiP83RyrdiRki+Zvwo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=XPnKLGombsO1vqtxbxZ9xWlZuKpGFoQLnXUEvMvZvzcrj9WlzoBFyZfblUFiAVp58mikO7rF3Wq2NpwK5GBhYZdrZuurmYluznclGDk2ObrNCtYfp7FBq7WwtlVai/0eX+ZGFIEllnTW/9UzGrKBt2nFMWjJ3vgdIC6/QrOhrrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=muVvIYLa; arc=fail smtp.client-ip=52.101.65.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="muVvIYLa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDRIK5iqAqRa0EoV5weuwrjC/Dqov8fDez1P+hT6raQPlz5nENGMbrsyzYdCplCXTHx7amwN6uKt+CzG3oZb8t3ycBotRkW95gSI7OOUruNTqllij3LfRatLdsfiwx5B7aINYv5cGg9b1vajWqrzyTo8D8YpAjc7Naazmw+ItCfXx7uEwaUfTIcXxiY/YMVtr2fnMNw48mg3iSMaVLCFFqpeHtkqp5iuZTCqdqmnYXZ0x7/jmOxVJAhlfqVmvvpL5SC4bTN87FJu0kaUmFHQx9K8ostOWmed05h+KCTiFYqYWGTA0EJEmYSCNo+tHqFwMW5n+whn6CaaXY7g866sLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=983ksqaaRUi9+/vpI+LkvqACTvAIecDbmQMNARxhFtM=;
 b=bokjwzaXC0PtJC7wPQoPi54PrMutXggRQF+1FmXKJDR2/mnN64rtO2r29xkl60pR74iJ+PZdMugnU7I/9lNEIxy8770eH4p7vIx0qhUjkGBma3mD436M6d2UOtHfFaZRug90mlkbwJWTjpwuG8ne+N0OXlAmnPyVU0UohxOgLgTppGvd7EMiYqR03I/HpDnJOot/bjMkAqjgorkgQKH8aHQZNEJuFYUM9e1slkeni5ZLVhlvFpGFZ8u/eUVElfRFl/8KBZJJiIdQYXOM9YSx5OWpfW0M5VDXyeyJ86tMoe8Qlr7btCF9V2QEAIEwOiMwalytN9vVvafQfNsSqV/lsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=983ksqaaRUi9+/vpI+LkvqACTvAIecDbmQMNARxhFtM=;
 b=muVvIYLabyWc94t1FfK5OqoLCWK7fyDNKBvCiKA1muwOj3hwgj6EKLoglLPERN5P1IyLGZ1Ay22xcp8xM+ymSwhJJ2CTU1C8k/uWbvHA7lDP+EM07u74ETQ96/7ss68rPgtSWZU5ERrQ9eyu3hT0rUNczWZ8oLv1flsK6xu38XDDadc9Gw2SOsfSsCbUF3virPSes0bZTSG2i6hwmFLuqsGjL+W+3kjk85a3wfElnanVHmAMHVnMNJg8E0hXNdyrIPhdDc4/Muu1FT9PY0w2GnUjNBfVJJmYFwKtWleGA0dWD7qheymXWir2ueE7MUbX5LbMPkU4ojXOhlojtcgtsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by VI2PR04MB10785.eurprd04.prod.outlook.com (2603:10a6:800:26e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 16:14:35 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 16:14:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260323125951.611042-1-alexander.stein@ew.tq-group.com>
References: <20260323125951.611042-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: add
 vcc supply for BT device
Message-Id: <177445527262.3132158.3937750397400305706.b4-ty@nxp.com>
Date: Wed, 25 Mar 2026 12:14:32 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA1P222CA0050.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|VI2PR04MB10785:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c259f42-1dd6-49a3-1822-08de8a899aca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|1800799024|366016|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	L/0TihIbAcpSOvVvTpvJxytpPjdfQRtWmpmR0WgSeYinuavjOI5V1WBAukYyrU8h+0Dli7hYyw+UU3vCYvXHlHHTiOey6WBhx8WnEK/W4mCav3FugvI1sTLHenWA+QM+iqCY2MvoK7h39NKKotPzZ1RYSEx7xWsFKWADjnKH9kx//VqnSITiHWdOVxO7tObqZNVXuO2tIEY9BBd5AUnDihfjHxNhyCVXLzFrSUzE9XnAf2rCoguzazp4corzUll6ad5dcF/GpNjkq4Mwk9NG6I5ZFtE7s2s6KKcUzzMPknImFCr51OkKXzw+J+as7TAiuJZ7a5AiSDXtpZBcIdlQc8q0Rg+1htv1hLnwyKgD4rJoYaxDiZlfhBMiSseA5fLShSA00ssZvVb1RkNx+zw/v++cFbK0sKbfocZsVS0Q56wprKL6u5nQq8cZwE0I9jgzwdeiBpLnfF7gbjDVuDHkYMu7Zh5rpPX9lgA/nrxdHDaI3c9fD14y2IPleymN05okpMDRNlC+Qzw9L2r5Wls/GgUZvK64fc5p38LJvYFdBk9WMZHR8gFr5mSK3zSmXuiw1sHrqqrOgFjHZ1SKrow/vxqI1KTUieDzwlBRkvuXHaGgX2fZoN1mHloCRZ0/5aPitCYfqH2RG8LLCWOyVqjqu+2H/3dkZhbgE4C6gIl0/CcchqOSlk+aOWBMBSsHlx85pfnl7Oo6NxlLaBfjrjHkQLx5foj3qu3aZhwPTzRp0bQvM8duFORLxllmcAbtoTIrW5uJY1qfvMLWt2K69o8snbFG5r53abn1aBiWKGoCxDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGJUcmFjUi9wMjRnWjZXQU9MN2NGeEtJeWJMUlVIeVRienhSMjliRTJSd0k0?=
 =?utf-8?B?c2NWTXFHUnZ3UlkvYUNKM3l6NzJVeXJQMFczQ2ovaGdyU1FTcEdMTUhmMzVL?=
 =?utf-8?B?cWVURCtaMEFNQUFmcEVPTU45eklxR001cUs0cithT3hFbWJZbXF6bEc4MFcw?=
 =?utf-8?B?QkN2cjBiKzkxRUorT2d1cHJjNjg0USsxYWtPVEJsMWJGOFZBczh0Skk5bE43?=
 =?utf-8?B?YjgrclNtaGtUOFNxU0E1OXpjamtGU2E4UXhVSDNpZmUrMXJEbEdHOVc3VjYz?=
 =?utf-8?B?NE1aMUI1SmZjOFZHL0lNWDZQb2xUa0VzemZGMlJ6eVZsazIzSWViaGRiYytj?=
 =?utf-8?B?NDFDN2tnbnhqdjZHMEExanlvOG5uUzhlekZwQUpsTjMvUUM0aDlRNUJ5cE9u?=
 =?utf-8?B?VE9lMHdUZWtydXdoWU5SSHlmQUVHcEF1VFVkRVBVTXlCbDBBSFQxcjI3bjlv?=
 =?utf-8?B?djhxbWNjQ3hGUnhXZ0Q5TGRtdXE4YmJyYUNuWVJ2Nnd1ZGEyZ1N6VDd0ZldV?=
 =?utf-8?B?K3lIUVV0bTdhZEZtbk1TTG5GUThRdHh4SHhqS2dHcitzcXZTRXJsM21mWmxq?=
 =?utf-8?B?UFdOYmdaRWVEby9iVGpCQmk0QnNzNllrQUprcVVsK3lHS0dkWG5GVkl1U1Zo?=
 =?utf-8?B?TEhHOEN2ZmhiTTEwaDBFSHRObHR2S1J5Si95UWJBenNaNWFHQ3R5RnhpamN6?=
 =?utf-8?B?RXc5NmYzOW9ZZmhEcjVldlE0SXlUUGtYSFVCSmU3WWh1aHN5NnhvK2FiZ2NZ?=
 =?utf-8?B?VWRRNVdzaHcwZnFwQWNQb3VCMUNGMHQ1QmJyd0l4aTlOWlBRWG5ITlU2QUEw?=
 =?utf-8?B?amU1RFNTNXVmejNNNmNlUjhWSzNZeVBTY1gvTXhPZWo5cElRZmFiOVc1cG4z?=
 =?utf-8?B?RDlYZ2ZHbnRORW1WRmtFU2l5N1g0czY5ajRVY0pwaEdjdTc0SW1WNVJlOUNr?=
 =?utf-8?B?bnRlRjF6bGVQZG45MTR2bkhWRFNwbW50c3NDV1kzdkVPNVJMc1hBanJFVkhQ?=
 =?utf-8?B?RFR1WGg2dlVpdG9MMVBNcW9MakxGM0p5T0ZtcDZnditQdVlYazdOdlk3cldY?=
 =?utf-8?B?cVJTcnNEYXYyWkRUVm90K2lqaUdMSWltaUU1M3ZFcTQvRkU2MTI4VlNpTWla?=
 =?utf-8?B?M0RzWjEwM0lkci9kWnEzK3RyVU55V2JmSzRyZk5Lb0E5ejRXaGFMY3RIdlFV?=
 =?utf-8?B?Rm9weVRVeG52N3VyY3JwK1dBK2xVL1NueVl2WXZyVjNqUFpucTRyTGhhWVA3?=
 =?utf-8?B?SjluUlBPcndJM1c0a1NEMFFJM0Nsc2dtNVk1YlNTZnI2WDFOUk9QUXd2TjRO?=
 =?utf-8?B?TTNIY3JPeVZMUStzTzhHZzdVTHVKYmlTZkNHTTR0VERRcTJqZ1Z5c21uK0ZB?=
 =?utf-8?B?aUNtaTZOYjRQUDJ5MWM1djR5RmJ2TmgyOVRZNlUxeisvdXdqZTNJblZlNDVP?=
 =?utf-8?B?VFVPL3h3ZmttRU93OVUwY05kK0ZldUhsSnNkSVV5NEZwODFiU0VJWFhaMUYy?=
 =?utf-8?B?YkRDRkRWSk9yZ1d5aGV1dnZjelh6Y0JscnFjdGUxamlPaUpZL1RTS1psZ0cz?=
 =?utf-8?B?Qkt0ZDVST0ZGd0pVS1dWTGtLVFR1S21sTDVsU1J2UEk5Vi9ZYmE3a21ScXQ4?=
 =?utf-8?B?bERRWFZkOWE1bll5MDRMR3NOM1VCQTB3SWVxTnZuMmsvRTE4NXJtT01zOUlW?=
 =?utf-8?B?RVBwcE1SdGpBajZqL0dhZEl1QzN4VlNVaGlKclhVd2twd0ZnU3BLc1YxSzFR?=
 =?utf-8?B?elBmbVZjaTZHTFc5dVBMQnhhYlo3S0pmRE9EdGFSaGhqbitVWTlFNjNaSEF2?=
 =?utf-8?B?NFprSzA2eVJwalhISlg1SVUxMDg0UDIrWk5ZWG5VRHFrcmxNQmdMSExNQkVz?=
 =?utf-8?B?ak9IZnp6TTFFTS8vTCtCdXRhNlpQWUc2QlZmd2RwZytxTDJldHBmK29reDJD?=
 =?utf-8?B?MjNEdWVaMklzOVpyYlVrN3JzblB6ZVRFYTdubEdvSFZjRGcwWldhYUQ0ekVY?=
 =?utf-8?B?b0FMcEwwYTNlMzA2eVA2NjJ1TW1aZkwremE2WjA4SXN2SmJuRGxBWEJOS0xy?=
 =?utf-8?B?dUZlb3R0cGJveWl5d0dIYnpGWUJOeHdrN3NmUXFmUlNZVUdrQk5jQ1F2MnpB?=
 =?utf-8?B?bnhFSVFheUZHR0diYkxiRUlGYTNzakpNN1ZBeG1HSDJ5RTRoWWQyN0pxZlVv?=
 =?utf-8?B?M3lsOFZmSlJ6ZGRmVnlaUGhJZDNqK2Z4QkcrSXFBbmtrWTRqNjc5VHNxTjEr?=
 =?utf-8?B?NGZWT1p0NzY5R1BNSHZxZ2JLYXRuVmhtdlZVV09SU3BIVkVGN3NneVQ4UUxk?=
 =?utf-8?Q?lxcK4wy+VhCEtmjRgM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c259f42-1dd6-49a3-1822-08de8a899aca
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 16:14:35.0670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pP/8Izt/vZrC3AJcIWGC9g/niHBRfkbX/svRxOlnNgh4Iij426WSeyFA5WeXiDJk+8ePVu+YExpTrtcWm9jqQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10785


On Mon, 23 Mar 2026 13:59:50 +0100, Alexander Stein wrote:
> Add the vcc power supply for the BT device. Fixes the warning:
> btnxpuart serial0-0: supply vcc not found, using dummy regulator
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: add vcc supply for BT device
      commit: fb205d7e0181c924d62cfd437caed1278990a8c7

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

