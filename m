Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013002.outbound.protection.outlook.com [52.101.72.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C764D3B8409
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 18:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783536929; cv=fail; b=RUgIoixUMMIHga09KkXU4jY01+CmJ3xqScP9E8eVSmrnJBuvlVXdPl67EfHZOCmZzWvOdR7CvyRS1FXnZU9SEVK4ypb0Shhhg2DBH9ymHArfTBWDOpXjAgiL5tCFa8Zi/tFQh8cDTzlKYmYA8DaPR7qMmJ1W6gNl24Fw2CdURWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783536929; c=relaxed/simple;
	bh=eit/iu3p8P3u+CUzm/tH21QVONrCmNqMd6GU4vDvgoU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l9QZhH4yTFHufaZRDsmoyWAf811np5QuRiLDkw7sS14QScaIZu75S5zmeR9jMdWTR1cNp7gXk1Gwt62qJojFwPlOFbIILE+KR0TcnYqu1mBPASSWOS4j73LXoUoCO4dVux2jO5omvcj4iYvDT+7cXAbHpK9SxQnHUpnuPCa35uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=U5vwCD1T; arc=fail smtp.client-ip=52.101.72.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="U5vwCD1T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJxKAsoBPdG9S5FT+XWLJOD+/ReQiU5krXADUyjQ3s4vzoT7pONg4DrOiOCg6VjZycOUHvpWCay4PEwQdY8Hn2mFVJWY/hcD9GgbJrirp+DqhCNHJSY9QQw2v6dszrNHSqE9o5VBwlEnqGWS9G+ays+KSsncFr5Q7wM9xx+Js1mw4qYppOxakJKtQeQX1+Iscm5KvM//SGCWQmE20oBdTW6mVPlBSr36zvalTj9o6jc33bMDewNjy+iMrsrhwasr3+sqkNGPFjBHd2pImO7QUAV+mh4FabYNUYv1nDmYZkdHcBz08GrwrAOZsAuv19VLImKZv/4qqMISOcooz9HsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BivLlNh/CgxduDAVTl1R8F4R4toQhfvCLLGoAX6pYow=;
 b=S5tFA82uKuR7WninkXaqICp1HH1Vq01UDxL8Ro5E612JZt8qxWlbBuz2QOFMnQB0gdE0c1uRshQEjcr48Uaah/qal5HeYOJ6U9T0IWFoze1j+mOd3Ph8YWgPRUDx3Wlb0z35qJKvfKHLtK/fFp5DnydPLNIvvgJrwOARbKzSSNu2mgAwtf/i3JeW/X9nfWWR8dnwcsmZk+in8Oh29UndRqxaD2rIAP5KJAUxFXicy87SfbcZcgQzvAdNoVb1p3OgY0eSAsfF8iKwd53cC88OuZJYITpuRMSB6ptTlVRDFDtXcgZ/v5Ud96GVXqR25jKIOECsZD69+HtwLpzlqas97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BivLlNh/CgxduDAVTl1R8F4R4toQhfvCLLGoAX6pYow=;
 b=U5vwCD1T+pY9VvqNq/K2IC1o+uOxkdzL3h8cWiQ9s2utE01ubrNdYqb4/13GO5Gntv+LJQAEM8dLLsdo57S8/Bd3VDQLhin9Fxqfx/27ipLjkOyqpYCgovy/pJLtef9Y7AgpwRdP+UjaTrcJDLEklOuPuE0t2/nyz59hyeF8SbvMj7Hkzjhvo2Ixr7aUVTcJJjzFa4bLaKNisApG6NBMn5VcutLdvoWaZzTCAWj5u/dROzR3EXXrEYgHujGsgcsZnuZ8U3Vy9MtMOpjtO6N2nbDapYgt48CT49an4Wo7qBUVnl9mzpEXukoCWhve7svWMdcU5P7VI8m2xM17u1tXlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB12130.eurprd04.prod.outlook.com (2603:10a6:10:645::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 18:55:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 18:55:25 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 14:55:13 -0400
Subject: [PATCH 1/2] dt-bindings: fsl,fpga-qixis: Add fsl,ls1021aqds-fpga
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls-fpga-v1-1-06c8a099b2a5@nxp.com>
References: <20260708-ls-fpga-v1-0-06c8a099b2a5@nxp.com>
In-Reply-To: <20260708-ls-fpga-v1-0-06c8a099b2a5@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, vladimir.oltean@nxp.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783536915; l=1457;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jPbwIOA8SR6PiE+EtgwmAllO03418/LzZNgrJgNPNYg=;
 b=VaJr0B4YEKlNtBNSPnweV7ECKhZlODtoXq1KldKL6CnMiUUB+SpnGgTsjhv9WlF77OlX9hr/M
 lPj+o1Dr7zHDt/t4nI8Bbc6hD0V7ZAckyKD9/DQDIMs3IMvj72g2j3l
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:510:325::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB12130:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb5e40d-9645-4db1-22df-08dedd227895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|366016|23010399003|376014|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	jYgzXebMX35CKix7blPLDMfzsORawEirAH89t2lfVCQip88Su3u8pi79jx1mo3ff0rSi5mJpGYRgGjw7tXt4iOR+iH1UzV21sdSYlL1FiifrT9Dj1Bc3fQ2DGz37SOPiCF28ymOfQO0uRpcBHAqecxDVVS2JjBQwUK5lcwLq+NLR7rhGJEVhZNckb0mDhj8skODXpuLSr4ygZl3Dk/B5w4wGEa0lxarT9yKMPVtWxS5u5i5DLPA3NKJIdkbWk1W6a16JlmMVwBsaq4Lfa775xexKJ1os7XhekZJg6R3Gy/HHLN4d+PjVkTi/X9G8gr7+/poDBfqQ8DZQK1xStCxTPUyJ84VsOoD04SvVKAYShoaUkXmEe7jKpHgwkd9Vrg6QZ4xVFhfTdLzanrI6BuGlUw+qGww2fkeIztHSdoysKHrg3n6Wyhjt3EL13MsPJ/GLg9ug8p00IgnjJuZLw3tb4AS06HQEGPFrPJsLpI7KevIo21r3y/WYqLl4SVLWBwWvtqNQbMsUuOvoENmBlsDLW6SDHwuUlZCElRewHKBt3mN85e5oow34wo7os+LO6O427L6pI283oKkyhcpL1oFON66D2SrzINkVTn53gXLvEpFXvjeVJ4nz/5Wid0GzQ6nSmYq4PK/EExNN+mh4GZsI98CG9ZKIujeGr2Evj7hChVM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(366016)(23010399003)(376014)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTZrK0h0OEY2blVvTCtoTVR5SlhTMXhzNzdMYWhMeHdVSXNUWU1VSFNDdmIv?=
 =?utf-8?B?ZTFkeFdxa09JUlJuLy9PdEkyeUw0YVQ4YWlCdUwzYjV3ZXpuTUFoN2JrbHZ1?=
 =?utf-8?B?d1dZZC8wYVJ2YUhWMFJrUGY1ZVVFb3pGeGFWTFRCeXFtWHhDSDVkbU9uSmk5?=
 =?utf-8?B?WGJuUUFsQzBRazF5d2FVQ3RiUmpVTnVoLzhqS0JHcHVieXpNZERMNGNqY21Z?=
 =?utf-8?B?UUZGODdEWmZQWENycWVDWURzNUNzTHNGcHlWUjdXMjVrM1A1VjMyc0N6N05L?=
 =?utf-8?B?KytoNXZtOWR5K2F5WkdXWUNrVXZMeG9LNlJrNm92YWF4Q29VVWxUZ1ZzWlBJ?=
 =?utf-8?B?blA3N0thcEVWOG1QQlF1WGRYN3NKZlpDdU1kRHgveDZFaU42d2plc3FYWWpH?=
 =?utf-8?B?NUsxQTlsWTIwYzE0TW8rTmdJYTNkNUlSQVprTzdlcUtMS2V3VkdTY1FUZ1Ba?=
 =?utf-8?B?eUNlbnhEd3d1ajVDaXJRTmtucUdoQ2lwR1V5TFNydGVVeWZNalptYWNjUENT?=
 =?utf-8?B?M2RUdXFsWXlDNXBrc1RUb1dPUlNiZXNRdklxb0w2cm9qK1RkR0lETUE2ci9z?=
 =?utf-8?B?dUtGcnJiMlFIYXQxSEw3Z0kwbTBTNGJYZGc4MUlrMHZOazJpYXlWRWlLNXQy?=
 =?utf-8?B?VllNdDJTY3NIdy9MbEJSM09RTkYwY1dHSTl5Rlc1V2p6RTZzME1lRTEvSVY2?=
 =?utf-8?B?ZGx3ZTgzdjR3WkZYQWt1SytxeTJLSStDUCtTK0d3SDZ5WEFHclNRM3JuTlBJ?=
 =?utf-8?B?OEJQSGV5ZXppL0JENXF1dW42MkRhMDgzZTRYa2xVNWUvQWttL1lyWlpLdmNN?=
 =?utf-8?B?TWlXK29UcjN4NTVyY29OZHAxQ2kzYzFCTkdKbkxrcnhaSklNbmZCZmJiS0lq?=
 =?utf-8?B?a1dyZkRmeFdmTy9CMGw2L3RQaTJpYzlLbjB3RUQ4elV1YkdZc0RHOGNtd245?=
 =?utf-8?B?bzZYdVVTQXR0ZDhHTW9rR1JyU2RyRFFFa2xydkQ2VS9sK0ZwZkcvc1hjZ3Ez?=
 =?utf-8?B?cmI5anVTd1BuU0ZOSFE1bEJ2a3NXampiRGh1cVlkV3lZQjd3UEdzOThkUWpW?=
 =?utf-8?B?d3pDcndxamRhUENUUXBESXhxbUU0S01TM0tESmVrUDVYMXQ4UWk5c1A0UkpP?=
 =?utf-8?B?RDlKUUJhWjdCWkM3SmpreXJJWE1ZRkZEMnE4eTRQMkNBWnpNbEE4a3NZQWVY?=
 =?utf-8?B?TUR4OWIvNklhcHAzelZpOVZMQm5HdFBqTlBSTE45NmFjUEpucFpjZVlId1FW?=
 =?utf-8?B?RldIU1k4VU83UUNCeVc5eC9LN0tJeEFXdE1jRmQ1ejZjRkNIdDlsRW9IKzJ1?=
 =?utf-8?B?L284eU82VHRUUkpRTUVxbldyeTdaMUxJVGloUno1UlprV1JqcmFEbFlDWi8v?=
 =?utf-8?B?eTZ4Tkp2K09NR0pMd1R5bjlYSDVaMkdIUkJuN1hlSkFZMFEydXhucnVpb1Nk?=
 =?utf-8?B?MC9ORDRmZmlscmc3RzlBUGRXOUoyM1g3VlgyTGRXclBKQjduT0EzdnlDV3RE?=
 =?utf-8?B?WEV3T0xhVUdDd2Q3VTZ0Z3p4ck5GTmFERWZIdm5Da1ZaMDBreXorcXFmR3RP?=
 =?utf-8?B?ckN0S2hxRDQ1MFBJQXI4Qm9xeXQrMjI3OW14eDR4N2FLelZCQnN0TWwyRk5V?=
 =?utf-8?B?MW92ellscHRiTEJRNkF2SFEvaEQ2c3c1TkliZDFDa2hkWE0wb0pramF2UmN4?=
 =?utf-8?B?dGZKTEV0Vit4OW9wTGptNk00VWdzS2d4ZTJMSmtSczE1U3h4Y0lYM01kNEF1?=
 =?utf-8?B?ak9PdUlMN0JJbUlXUmVmblVLMzFCU2NuY2pWcVhoMVl1RzJ5TU9uUG9NK1BL?=
 =?utf-8?B?TEZtdUF6ejYxVzZRcTJSaWVKZWtuMFB5VXk2c2pLNWg2RVhNcXBFU0VFYUs0?=
 =?utf-8?B?bWUwSnkyR0l6dllXWWNHRDJ0MWRTeGtIQ1gzWEFmeXhzNzhjZGU5YUFsQU1E?=
 =?utf-8?B?eXpvbDR3RU5vbGM5K1A1MHNzWTdiSTJYYmUrQ25VNjlwU21Pb2lFZk5IVjU1?=
 =?utf-8?B?cGk5V2phMG1aMHY4WnlKUllUTUhkSVZUQW9DZGk2bmtWcDF1M3NBRVdScjBm?=
 =?utf-8?B?aEhQUUgwbUh4aU9mYzRRYndkcENNckMzSEVhUXV5SHRpc0NRRVY4c1hOZkoy?=
 =?utf-8?B?aUFoUjhNaU1mVFFNU0FTNlRUVElwTXIxRXJWSi9MZzhMRHBZSEZtNUJnZzV6?=
 =?utf-8?B?VGxMYm40em9XLzBTSytNd3RiTzU2R1cwN1BsNG8zaVkyUHhnU2JXbWF2UWg3?=
 =?utf-8?B?VlVoN0tudG83d1YwUGpPNWZuMFZvZHh5SHg3ZTJ1NVlmTnVHbjNpa0FFenFO?=
 =?utf-8?B?ZTRkZVExOVBvSFdieWo2MkY5ck9GUCs4YmI2TTBkTzlydFhpS0g3UGdKeUxU?=
 =?utf-8?Q?82X2XUqLzCcyuN3oepIHt7Q1RZVDBNMiydX6Q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb5e40d-9645-4db1-22df-08dedd227895
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 18:55:25.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzNU6QwxVvjXWnl8LCm5Y1p1Yd5PXF2ilv3UkbpOKQyheb4QumU99k1wSvnXjRhJW0yH6cthBYMPRG1abxOqrT6x7qtK/OowFvwc4gt9Tn3aI1zytiHBAy8GoQtDcKxE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12130

From: Frank Li <Frank.Li@nxp.com>

Add fsl,ls1021aqds-fpga compatible string for ls1021a qds's FPGA on board
controller chips, which connect CFI interface.

With following patches to fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
        'bank-width', 'device-width' do not match any of the regexes: '^gpio@[0-9a-f]+$', '^mdio-mux@[a-f0-9,]+$', '^pinctrl-[0-9]+$'
        /home/lizhi/source/linux-upstream-pci-ep-arm/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0:compatible: 'oneOf' conditional failed, one must be fixed:
                ['simple-mfd'] is too short

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml b/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
index 2eacb581b9fdd..ea1e3fbca2026 100644
--- a/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
+++ b/Documentation/devicetree/bindings/board/fsl,fpga-qixis.yaml
@@ -24,6 +24,7 @@ properties:
           - const: fsl,fpga-qixis
       - items:
           - enum:
+              - fsl,ls1021aqds-fpga
               - fsl,ls1043aqds-fpga
               - fsl,ls1043ardb-fpga
               - fsl,ls1046aqds-fpga

-- 
2.43.0

