Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197B3FB06E
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318621; cv=fail; b=ZZpS4kwGOLX8LOuirzbi6dwvLuyYakwvocIJP1vfGDdgB0NO04hNDFsv9O5J8RkpfnERW2DJUHCFXSBS5YPe9ID0lMzqLKDw8+jv6S0V7t/a4c4IU8ptZOuMfgdkAZ92UldanOmj1oYDe0pMhQ8++MmXKGY6WLLX5x3YM3hrXaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318621; c=relaxed/simple;
	bh=EI8BaLVOGXDywk24R6Zgm/FOR5wO/musGntVOLb3ux0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=K9DPCJyiWzhLmRQ41blMsShH3Qr2D5SkZaD2O+M5S8824iPxt5esIXB48+/bVX53B2gkRwU0Pbfs3T0gi0eG7gfGJyNBhh8S3rBPynBIzKy+w2kQzd3iop02iJIE/0i0iF7GG4WKrr1z1EbRrL/HzvNUzBPXGP5dPL+xS+ToH6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Igejl67B; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Igejl67B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2BiiDHlTaurTfPs7gL8ueo4MPbcxBeYW1CgcdgUvqsb33biTbWi1TkWWTgnubImVn1gG8I889dQRGpvmUk3vyr/VtveBIaHeF8OqJvyiLYdYuRYh+2LUbJjkF1FkI+O6nAK7SvROhCS4fQRDl91nbw9BtrwlVSDgGZd4zFRLCqaThfqxZlAdKgSK+AGr1S0aEfZ8GLnkxmJ/kwD5myt2tBwCjBDKO1kxwnPuXe0crIVQFKUkdoUll2sW2m+/3TFB2SEIdCewEink5eNjrDg9NzsZ/oh46FgXzhJrN1WNOtOEANTw/SqU9hNL8FBXnU1VskzuakQtgezbK5IcHJmgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxfAApaSB0aKXyF/gvdVfS/PxR9FZ4rNnjPtiI27yCM=;
 b=cv9/OK5sBYf++jF4gQdo6Ka3hFD79ujkBqpgqe3mOC3ttHthWQooQjXgBIBalJR85Pe3ljc304U5fuJOuvnNsLmI0XuV2q0QsSRxO98m/l3BMH/NUQCYuG0FKsNs3Y0SnCcmJZW/B7+Ufqoyz2FRCGpZdJYwRWR89HwKCMR0woiIUS02N693HaL4M90lB04ZrAqrROIVIocEsU0g8IXkkdt96NSDCNrSBcHQHtbqYUyDfz06/QyddDd4YUvz4sXQCIy8dJJrIfEDb5b+QjybbLp6ir9btxbY12f5csvEsBAbogkKW+toRO9dSCm52nzoqkW+/BJ+EU0Bktj9s9REOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VxfAApaSB0aKXyF/gvdVfS/PxR9FZ4rNnjPtiI27yCM=;
 b=Igejl67BH29wSOYWWHmUAW+oguK7gP2msovxNz7UZ/guicj1zy13Rrwp+4zYqccW+E2pAD0cVB8W56TyoLzTfINEz4QqlC1vCepE7gjlxJokQSpmDiojTnEFXD5M5Fj4qplR0breqORmwkTd63nRbBqYZe004NUZT8E9oC0mxdZROF8krfEQrFCq2v0Fme1YSrdqUZyNqheb7ydSjNPuo+vqphkrpMnItlKmpLDy4ey2ERy9lVoPKwUP39hxdbXTcEAq2SzMAGRbcAB4s65ug76nomgkLAJeDBhH2TFCMiKjxVYKOfPWfaBDZmTMgeWUbhl6xXLod3oATk/c1VitZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:50:13 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 09:50:12 +0000
From: pankaj.gupta@oss.nxp.com
Subject: [PATCH v31 0/7] firmware: imx: driver for NXP secure-enclave
Date: Wed, 29 Jul 2026 16:10:47 +0530
Message-Id: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK/YaWoC/2XVzY4bIQwH8FdZzbmpbGMb6KnvUfXAANOdw34oq
 aJUq333mqjKAFVOGeWHgfnb+Vgu9bzXy/Lt6WM51+t+2d9e7YvDL09Lfk6vv+ppL/ZgISAGAX/
 aX26niz3dTokBRCC6knWx37+f67bf7ov9+Gnfn/fL77fzn/vaV2xP/62C0K1yxROcyGdJ6jmil
 u+vt/ev+e1laWtcqXPkekfmDG0FQ0zi4ujc4RT7XV+dueQLhVKTZE6j48N5kN5xq0cFACqGhNM
 +pXNIvRNzqsnHCC4FT6PTztHg1FytpGbWQPM+/eEicO/8/V62Qmn1TMqjCw+HgMP5grmIwi5YU
 V/c6GLvtHfR3FbCliAD17SODuGAOG7UYgCndQOF4HKOfpvkERkkGiPTMgPZV5XiU/VzzUdoBHC
 SLTVZqpUTFg95ku6Qzqr0suUm5qx21KIFZ8mdpCFw2JJDhJE5REd1eiMoh2QYZctOdS5Qrrkkw
 ElqL+MgW3qsKbjK5hh9naTvJA2vE/39boOgSBIoc81wSMWxZktQjsFFXBPz3MkYDxmnG2oZKlh
 9jQoZMUwz4JEhsdc5DoGWoQScyFqZRKYMEXZybEvCe3/5ojZYSuC5JvUyDLJlCDxjyNbOdphJu
 l4ON0QtQ5LVe2dzxP13zkeG1HI7pI/4nlsiKptgztMUIenleE6513TVPqvGNNfUQyqNu20ZQlZ
 7lRTE85Rb8of04yihlqF19ZklClmHTzL0ckgCtQxBiiqxtXec/w1iJ6cbahmyIDiljbecp3npo
 JfDHHItQ7mG1UKkGqnr7M/Pz7+j5bm3IwcAAA==
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 sashiko-bot <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785321650; l=60124;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=EI8BaLVOGXDywk24R6Zgm/FOR5wO/musGntVOLb3ux0=;
 b=8yY6BDDQ/gyAg3nQuyHIep9EWdDIzKu+HmhYIGrZUWFbQ5/KYhfXkvcxb6RTwMrAyVN9+7F0t
 om3fi+D2Xl9C4XzuyDL9vct/NblNV//wA3HgDBJVODpA7GRrawzKBVv
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0214.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::10) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 415e20d5-0d3b-47d7-5eca-08deed56c814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|23010399003|921020|6133799003|18002099003|3023799007|11063799006|5023799004|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	CxtOTbylfCvo+OWZSgGJ2I6yVoUuWovfNyHq0JaAJ4HR0EftBCqngPNEMQlsNYZuFjlzTJcQlo7YQP4l1Z5vjmjqF23KT4FUslMEbp9I3QJSZUFYDDnZREoKzR0kQ7Q74mB+u6l6fakXMtutX846EM8qPPcnzlwnY913W2E+woioAhlE3RZpP6SC6B5KcC15TuGvSM9HRw99nWkLBEFaR+flF6ZXmyz+VC0NBqPJVGOWgwdGw3PEvzSZ9LzNMDlBXSiDxYpdYjz57Rf9wy9oLawgnJLtTFbGeh5Eh+amUSHs/qcw8EHaZybQVL2WCNgigWZSExl9RJKfcMEfV1WXXiUC4U1Ry2xebs/Wp8vRkObt1UKRyXt3z+vSwUdCS8bxqaayBmcg9Nd+aVhdI7uPLIDpSbd3lNjp7eFUbAgGCn0T3ftr/Zm5w/GEtfCrQ67SjjCu+Cx2+CzlCTUPg92LqHWtV0MIugbpoGLRo5CuK2NrSCA8yAW2yulRhFkgU5GZ3Gj2bv5u9VLSp67YdnoLl10FTvi1jFgwhbptqJ7uFc/YV8ima8gP8TXtShN9/hBszYyLtWmZKKO6mdnzSmy2NafFBp/MA7P8cgsfHaLQUIEF1Et2K7wZkbDd/zpkcdzYrHiBNK5Fozqxa/Qa/wjE4jlQtR/BCW2Jnka/8ScFsXo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(23010399003)(921020)(6133799003)(18002099003)(3023799007)(11063799006)(5023799004)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3pTVHNpd2Y3bUtwSVVRaUdheWRzZUhzTnVWaGF1dHh3cTBYb3BxZTZkUWho?=
 =?utf-8?B?SEpqa3N3eDJoRUdsZ3YxSEtZTnRxTnFTUkt3VjNOUytLbmRham5JRzRYNC9j?=
 =?utf-8?B?Zmx1aFZKR2xLUUU2TEg4QVZIdm5DVStKRVhzaFJVN05wL0F0MXdpOFFMKys0?=
 =?utf-8?B?QnlmeCtJQlFUSHdFMHRMRmtvbWI3Vk9ZSG1ucW9VT2JaODdlUnhmaWloZm9m?=
 =?utf-8?B?R0F0VklGRHMxK0E2ci9Fc0dDUFYwMEhpVmQ3dlozc1ByQW8yMUZ1SlNFYnlK?=
 =?utf-8?B?aTFGZFhtL1BjamU5K0E3aHBNQjBnN1dRS0dIMTZHU1JkM2ttUGRSanB6WXRu?=
 =?utf-8?B?SHZoNWtMRnBCaHRtN2pRZWJtbG1NdEdmRTl0bGRPTjU1QVJpc0hzYlNQOGdY?=
 =?utf-8?B?YnFLKy9ISWJ4WUhQRUpWODgvRjZBUllQaGFKRjhvdjd1MVE0dGp3bFRJeXRH?=
 =?utf-8?B?dmFEWEdULzdWNlRBVDlRcWZPWm9MdjVCVi9aL0pCem5NSCtRakdEdnpadVY2?=
 =?utf-8?B?Q3VnUGxFUmxmS29xb0dKaTloNVRkT3Y2ZmxCU1YyS2NtSlNYV1NsVlFiTCtY?=
 =?utf-8?B?ak01M2dicDdsQUtaWlNjTDluWENIVlNXWkQreGkwalFhcmNQaHJEWUI3elFm?=
 =?utf-8?B?MmlkSXdNM2VmbmVpbThCQ0Q3NmNOd0tTWXEvaHV1NVc0dTUzYVR1M05OTWo5?=
 =?utf-8?B?RHg3MXlKWXcrZTUvSTlNS2lBaWN5VzZadGdWMmhIVWlFWEg0bjVZYThqR2JX?=
 =?utf-8?B?Vzk3VEFrS3ovTXBVajZjQWd1Q2MweGd4d3ViNE84N21BL2Z2b1pzTGczcFJv?=
 =?utf-8?B?a2kwN0dHSE9qNjhWSXVRMDJYK2RULzB6bnExZWxFQUhrcFNQUmRuQ0NMejJJ?=
 =?utf-8?B?SWpJYWFINmI1RDJyTEZLRDhLSGNaNWRxaVlVaGo5NDhoVE9uWmZHTHlqVEhl?=
 =?utf-8?B?M3RWTjkzbklLdFgyOUlGbkJDeHM3eHc1NXpKbG1oZkNIbEdNVGZFaEk0aFFh?=
 =?utf-8?B?RERFek1SNTJMeXJXbEJueHBMUjVqOHpxa0NHK282UmJFcmxWUW1sSGFLWVRB?=
 =?utf-8?B?TFMyM09xeFRwWlVZY0J5WTJiOXZSdVVKQ0NkTU56d3JDWGVJcXVUVHRLa3J5?=
 =?utf-8?B?OUJxdHBiNG9uUGRJTWlCd3hlZ1pUdm1iN1FWNDYyTzZ2WVc5OG9NOVcyZWsz?=
 =?utf-8?B?ZUtYVU5TSmZaN1MySXdERWhBWXJJSFIrVVR3TXFTWFNsdndTamUrRExYS3pJ?=
 =?utf-8?B?cmx3QkQ2TVdoNGUvZVFnZU0xbnBUdkxqdVRoVmlHVEllbUZuc1RBa3BuSk56?=
 =?utf-8?B?ckhMNWxhdFVLbTB6REdzTEZQL3RIa083MHlEOHh6K2F6aGNpaytGSUZPU3pO?=
 =?utf-8?B?SUg0bzN5Q2JvcEVPUkN4MFVLMGlCamoxNmtJTXlsSWdoT1hzb3J4bWhrbW1R?=
 =?utf-8?B?M1JBN3Qwb1lUc0RnY1o1UE1YbGRQMUVVclVNMmhlMW40Q0JFdmlxY09RNEFT?=
 =?utf-8?B?NEc4Y3h5c0pFTXFBYVdnMTl2WjJibkFJekNxdTRpL2huS2JJQWVSRGdnN0F3?=
 =?utf-8?B?eVNGSGpicURHN2Q0QWVKeFBmSzJJQnJ2Nkt2eTk3cDM0WjRsVTY4VDdtNWUx?=
 =?utf-8?B?aG9PRzJCWTkzQTNvbDRiSUptWXp3SUtyQklMZHl3eVpSSzdWRVN0QVY1bGVW?=
 =?utf-8?B?Z3RnWnZnZnBRc0gxbEFrejFIallndDdmQU1vTXFxWDhpWDBBOG4yVnZSbUVu?=
 =?utf-8?B?U1lZS21rSEJwRzRYeWRYb0RyU1o1VmJ3azg1VmV2SERRcDFVWjVsTlRvN05I?=
 =?utf-8?B?Q0lPczFLMWJsUkJTdi9rTXlIdFdSVU5lRmEwM1d6WDF2VTA4amNxSXU1eGIr?=
 =?utf-8?B?S0c1dlBGVVB0Nit2RnJzUTAyblhEYjdXNnJhSk9FZ0MyVHFjM3hCaXFFZit6?=
 =?utf-8?B?WVYycU9JNGRKbnl6WkNYakVjYVgwOERKcHArZ2FmS2NIQ0ErT0NDNWlKLzFn?=
 =?utf-8?B?eG40MXNFd0JrcnpmNlhBc3BSZWFqR3hiY2psWTRSZXBuTndxVG5WWU5xL3h6?=
 =?utf-8?B?ZDNMeUN3aHAzYUdGRWM0UlY4RzRNWjE0TFlmWVBuK0x1Ri8yYlhwdGI0bG44?=
 =?utf-8?B?OXZKNDlTVTk5MzVkMk8wTHZIRjY4S0JTanVBR2ZEUXVKZzVxRlVsMWdoZTY2?=
 =?utf-8?B?RzVSVXdYeE90ZnNjYjRtZkx2eWFUVW5Kd2k5STJuT2s3eG55VmpjSDRuNXRS?=
 =?utf-8?B?alUwdFlrZG1qLzJDcWg3OVBISXlHR0hZanFyUFNhRm5qcWNKeXRVaUJwYUdD?=
 =?utf-8?B?NE55bkdrbEhIa1lPUGVKaHE0OWhmdXFWVHo5dGJqZDZyT3E4c1g4UWMwTnVr?=
 =?utf-8?Q?sV3QIhtvdNDYF/152Kk+veTHQbCMSKvWP9YWG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415e20d5-0d3b-47d7-5eca-08deed56c814
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:50:12.0880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfAbGcew/w0VjVtdiUPI9UH9b11/GvhyLIsnbK4rkqLfUx2vuW5rUlfW5J1dc7VuXG6KlrR6ruPjknWdHVuCvJTogRhtpQswQyDyzgq3c4UPq9rXB8qk0Cc4NNgP6gkD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889

The NXP's i.MX EdgeLock Enclave, a HW IP creating an embedded secure
enclave within the SoC boundary to enable features like
- HSM
- SHE
- V2X

Communicates via message unit with linux kernel. This driver is
enables communication ensuring well defined message sequence protocol
between Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications can communicate on single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

-------
Changes in v31:
7/7
- Kernel is free to choose the exact placement of the 1 MiB block, as long
  as it lands inside the ELE-accessible window. This avoids hardcoding a
  fixed address.
- Adds a new shared imx8ulp-firmware.dtsi that also enables the hsm0
  node and wires up its memory-region, so every i.MX8ULP board can bring up
  the enclave with a single include instead of duplicating the reserved
  memory node. Include it from imx8ulp-evk.

6/7:
- Keep the node disabled in the SoC dtsi so it does not impose a
  reserved-memory requirement on every board. Boards enable the enclave and
  provide its memory-region by including imx8ulp-firmware.dtsi.

5/7:
- [Critical, new] Driver unbind forcefully wakes waiting ioctls and
  clears firmware-busy state, causing DMA use-after-free by hardware:
  FIXED. ele_msg_rcv() detects the teardown-forced wake
  (is_rsp_wait_with_timeout && going_away), clears rx_msg, arms the
  circuit breaker via se_mark_fw_busy() and returns -ENODEV; the woken
  thread no longer treats the forced wake as success and does not free
  the buffer. se_clear_fw_busy() quarantines (does not reclaim) the DMA
  buffer during teardown.
- [High, new] Late mailbox interrupt schedules fw_busy_work after
  cancel_work_sync(), use-after-free of priv: FIXED.
  se_if_probe_cleanup() now frees the rx mailbox channel
  (mbox_free_channel) before cancel_work_sync(&priv->fw_busy_work), so
  no further se_if_rx_callback() can re-arm the work; the cancel is
  final.
- [High, new] Unbind deadlock/hang: a concurrent ioctl blocked on
  se_if_cmd_lock misses complete_all(), re-arms and waits the full
  timeout while unbind blocks on fops_lock: FIXED. going_away is set at
  the very start of teardown before complete_all(); ele_msg_send_rcv()
  checks going_away under se_if_cmd_lock and returns -ENODEV before
  reinit_completion(), so the thread bails out instead of re-arming.
= [Medium, new] 128 KB DMA shared-memory buffer of the internal
  priv_dev_ctx permanently leaked on unbind: FIXED. New
  se_shared_mem_mgmt_info.mem_pool_buf_list plus
  se_get_mem_pool_buf()/se_cleanup_mem_pool_buf() track pool
  allocations; se_if_priv_release() reclaims the internal context
  directly so the buffer is released deterministically (except the
  intentional fw_busy quarantine from the Critical fix above).
- [High, pre-existing] Race between se_if_rx_callback() and
  se_if_fops_read() on the shared rx_msg command-receiver buffer, data
  corruption: FIXED. se_if_fops_read() bounces the payload into a local
  u8 rx_msg_snap[MAX_NVM_MSG_LEN] under clbk_rx_lock, then
  copy_to_user() from the private copy after unlocking. copy_len is
  bounded by MAX_NVM_MSG_LEN so the stack buffer cannot overflow.
- [High, pre-existing] Dangling priv->dev passed to
  dma_free_coherent()/dev_warn() if an fd is closed after device unbind:
  FIXED. get_device(priv->dev) in se_if_probe() pins the parent device
  for the lifetime of priv and is balanced by put_device(priv->dev) in
  se_if_priv_release(), so priv->dev stays valid for a late close().

4/7:
-  add the cleanup of priv_dev_ctx->dev_name & priv_dev_ctx, as part of
   se_if_probe_cleanup(). Though it gets replaced in the next patch.

3/7:
- ele_msg_send_rcv(): publish rx_msg/rx_msg_sz under clbk_rx_lock so
  se_if_rx_callback() cannot observe a torn pair. This change is part
  of 5/7, already.
- ele_msg_rcv(): engage the fw_busy breaker on the deadline path, like
  the ret==0 path, so a hung FW is fenced.
- ele_get_info(): zero the gen_pool_dma_alloc() buffer, which is not
  zeroed on allocation.

Two findings need no code change:
- DMA free on timeout: -ETIMEDOUT means FW is fenced by fw_busy, so the
  free is safe.
- -ERESTARTSYS after a completed transaction: the command is not
  re-sent and the ioctl path converts it to -EINTR.

References:
- Link to v30: https://lore.kernel.org/r/20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com

Changes in v30:

3/7
This change dispositions all six findings from the Sashiko AI review:
- Five are code fixes (three in se_ctrl.c, two in ele_common.c);
- One is documented as intentional protocol-synchronization behavior.

Addressed (drivers/firmware/imx/se_ctrl.c):
- [High] Incorrect devres registration order (UAF / NULL pointer deref
  in the mailbox RX callback):
- [Medium] priv structure leak on early probe failure paths:
  The cleanup action is now registered before the channel requests, so
  priv is released even if se_if_request_channel() fails early.
- [Medium] soc_device singleton lifecycle tied to the first probed MU
  interface (data race and premature sysfs deletion):
  Decouple the singleton from the first-probed MU interface. Track it in
  var_se_info.soc_dev_regn and release it once at module unload via an
  explicit module_init()/module_exit() pair instead of a devm action on
  priv->dev. Serialize soc_dev registration state under se_var_info_lock;
  se_soc_device_unregister() now takes the lock via guard(mutex).

Addressed (drivers/firmware/imx/ele_common.c):
- [High] Data race on rx_msg_sz in se_if_rx_callback():
  Move the read of the expected response size (exp_rx_msg_sz =
  se_clbk_hdl->rx_msg_sz) to after clbk_rx_lock is acquired, so it can no
  longer be observed stale relative to a concurrent transaction updating
  rx_msg_sz under the lock. This prevents copying truncated or corrupted
  response data.
- [Medium] ele_msg_rcv() reset the timeout after a signal instead of
  accounting for elapsed time:
  For the response-waiter path, compute an absolute deadline_jiffies once
  and derive remaining_jiffies from it on every iteration. After a signal
  falls back to an uninterruptible wait, the wait no longer restarts the
  full timeout; the deadline is honored and -ETIMEDOUT is returned when it
  elapses.

Documented as intentional, no code change (drivers/firmware/imx/ele_common.c):
- [Medium] "Unsafe syscall restart on completed non-idempotent hardware
  operations" in ele_msg_send_rcv():
  This is intentional protocol-synchronization behavior, not a
  re-execution bug. A signal is deliberately not acted on while a firmware
  message exchange is in progress; ele_msg_rcv() defers it until the
  response path completes and the FW/kernel protocol state is synchronized
  again, so Linux and firmware never diverge on message ownership. Only
  after synchronization is the interrupted wait surfaced to userspace via
  -ERESTARTSYS. The command/response ABI must treat this as an interrupted
  operation after synchronization; it is not permission for the kernel
  driver to re-send the command, so the enclave never receives it twice.
  Clarified with an expanded code comment.

4/7: Sashiko AI issues resolved in this patch; no functional change
     required beyond a cosmetic whitespace cleanup:

- [High][NEW] Accessing se_clbk_hdl->dev_ctx->devname outside
  clbk_rx_lock in the cmd_tag path (UAF / NULL deref):
  Already fixed. In se_if_rx_callback(), the cmd_tag path holds
  clbk_rx_lock across the dev_dbg() that reads dev_ctx->devname and only
  proceeds after the explicit "!se_clbk_hdl->dev_ctx" check. The devname
  used by the post-unlock dev_err() is cached into a local (devname)
  while the lock is still held, so no dev_ctx dereference happens outside
  the lock.
- [High] Incorrect devm registration order frees priv while the RX
  mailbox channel is still active (NULL deref):
  Already fixed in drivers/firmware/imx/se_ctrl.c. se_if_probe()
  registers devm_add_action_or_reset(dev, se_if_probe_cleanup, pdev)
  before requesting the tx/rx mailbox channels, so LIFO teardown frees
  the channels (se_if_probe_cleanup) before priv is released.
- [High] Memory leak of priv when early probe steps fail:
  Already fixed by the same change. priv is allocated, stored via
  dev_set_drvdata(), and its release is tied to se_if_probe_cleanup(),
  which is registered early; any subsequent probe failure unwinds through
  the devres action that frees priv.
- [High] Unprotected read of rx_msg_sz creates a TOCTOU race leading to
  response truncation on late interrupts:
  Already fixed. The rsp_tag path in se_if_rx_callback() reads
  exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz only after acquiring
  clbk_rx_lock (and after confirming rx_msg != NULL), so the size cannot
  change between the check and the memcpy().

5/7:
[High] Overwriting a successful firmware transaction with -ERESTARTSYS
  leads to double execution with zeroed DMA buffers.
  Fixed. se_ioctl_cmd_snd_rcv_rsp_handler() now converts the deferred
  -ERESTARTSYS returned by ele_msg_send_rcv() into -EINTR before returning
  to userspace. -EINTR is not auto-restarted by the VFS, so the ioctl is
  not silently re-run against the already cleaned-up (zeroed) shared input
  buffers. Userspace decides whether to reissue the command.

[High] Unbind deadlock/hang caused by incorrect ordering of complete_all()
  and fops_lock.
  Fixed. In se_if_probe_cleanup(), complete_all() on the response waiter is
  now issued before the dev_ctx_list cleanup loop. The blocked ioctl waiter
  sleeps in ele_msg_rcv() while holding its dev_ctx->fops_lock, and
  cleanup_dev_ctx() takes the same lock; waking the waiter first lets it
  drop fops_lock so teardown can proceed instead of hanging.

[High] NULL pointer dereference in se_if_rx_callback().
  Fixed in 3/7. se_if_rx_callback() now checks priv (dev_get_drvdata()) for
  NULL before use. A late mailbox interrupt can be delivered during tear-
  down; the callback returns early instead of dereferencing a cleared
  drvdata.

[High] Out-of-bounds read/write in se_if_rx_callback() by trusting the
  unvalidated firmware payload length.
  Fixed in 3/7. Both the cmd_tag and rsp_tag paths now clamp the memcpy()
  length to min(firmware-declared size, destination buffer capacity). The
  copy never trusts the firmware size beyond what fits in either buffer; a
  size mismatch is still reported after the lock is dropped.

[High] Premature freeing of the gen_pool DMA buffer on timeout.
  Fixed. ele_get_info_cleanup() now guards the gen_pool_free() path with
  se_is_fw_busy_ctx(), mirroring the existing guard on the shared-memory
  path. If the probe-time transaction timed out and firmware may still
  write the SRAM buffer, the buffer is not returned to the pool (it is
  reclaimed with the device on unbind) to avoid pool corruption.

[Medium] Lockdep false positive "possible recursive locking detected" on
  fops_lock.
  Fixed. The internal priv_dev_ctx fops_lock is given a distinct lockdep
  class via lockdep_set_class(). Taking it while an open context's
  fops_lock is held (e.g. a firmware load triggered from an ioctl) is
  valid hierarchical locking and is no longer misreported.

[Medium] Early device exposure to userspace before probe completes.
  Fixed. misc_register() is deferred out of init_misc_device_context() into
  se_if_misc_register(), called at the very end of se_if_probe() after SoC
  info is fetched and the encrypted-IMEM buffer is allocated. The dev_ctx
  and its shared memory are still set up early because the internal
  probe-time ELE_GET_INFO transaction uses priv->priv_dev_ctx directly. A
  new se_if_open_gate.registered flag ensures se_if_probe_cleanup() only
  calls misc_deregister() when registration actually succeeded.

[Critical] Arbitrary physical memory read/write (Confused Deputy) via
  SE_IOCTL_CMD_SEND_RCV_RSP.
  By design, no code change. The SE messaging-unit protocol legitimately
  carries firmware-owned physical DMA addresses inside command payloads, so
  the kernel cannot treat those addresses as the trust boundary. The node is
  root-only (0600); the ELE firmware and the SoC memory-domain/xRDC hardware
  enforce which physical regions the enclave may access, and
  se_chk_tx_msg_hdr() already restricts the permitted command set (power,
  reset, BBSM, FW re-init, RNG init, CAAM release and SE internal memory
  management are all blocked from user-space).

[High] Use-After-Free of gate and miscdev due to a race between unbind and
  VFS open.
  Already safe, documented as defense-in-depth; no code change. misc_open()
  invokes file->f_op->open() while holding misc_mtx, and misc_deregister()
  acquires the same misc_mtx before removing the node, so open() is fully
  serialized against deregistration. The gate is additionally kref-counted
  and se_if_fops_open() takes its reference via kref_get_unless_zero(), so a
  VFS-resolved but not-yet-run open() can never observe a freed gate or
  miscdev.

[Low] Implicit compiler padding in UAPI struct se_ioctl_cmd_snd_rcv_rsp_info.
  WONTFIX, no code change. include/uapi/linux/se_ioctl.h is a stable ABI that
  has shipped to NXP customers for around two years; the member order cannot
  be changed without breaking existing user-space. The 4-byte hole after
  tx_buf_sz is part of the established, frozen layout. The struct uses only
  fixed-width __u64/__u32 members, and the ARM AAPCS aligns 64-bit types to
  8 bytes on both the 32-bit (AArch32) and 64-bit (AArch64) ABIs this i.MX
  driver targets, so the layout (members at offsets 0/8/16/24, sizeof 32) is
  identical for 32-bit and 64-bit user-space and needs no compat-ioctl
  translation.

Reference:
- Link to v29: https://lore.kernel.org/r/20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com

Changes in v29:
5/7:
- Fix ele_get_info() mem_pool path by initializing get_info_len before
  gen_pool_dma_alloc() and checking allocation failure before using the
  returned buffer.

- Add a probe-time comment for ELE_GET_INFO timeout cleanup. The SRAM buffer is
  used only during probe, and a timeout means the secure-enclave interface is
  considered unsynchronized and probe fails.

- Serialize internal priv_dev_ctx shared-memory allocation by taking
  priv_dev_ctx->fops_lock in ele_get_info() and load_firmware().

- Move load_firmware() to use priv_dev_ctx shared memory instead of a temporary
  dma_alloc_coherent() buffer, and skip shared-memory cleanup while priv_dev_ctx
  is marked fw_busy.

- Fix init_misc_device_context() error handling so gate allocation failure sets
  ret = -ENOMEM and releases previously allocated shared memory before freeing
  the device context.

- Release priv_dev_ctx resources through cleanup_dev_ctx() before freeing
  priv_dev_ctx during priv release.

- Guard cleanup_se_shared_mem() against being called before coherent shared
  memory was allocated.

- Fix se_if_fops_read() initialization by assigning priv before first use.

- Avoid modifying command-receiver rx_msg_sz when read() is called from a
  non-command-receiver context.

- Rework se_if_fops_read() to reacquire fops_lock after ele_msg_rcv() returns
  before accessing shared-memory lists or command-receiver state.

- Snapshot the command-receiver rx_msg under clbk_rx_lock and hold modify_lock
  while copying it to userspace, preventing concurrent command-receiver teardown
  from freeing the buffer.

- Clear command-receiver rx_msg_sz under clbk_rx_lock only after consuming the
  message.

- Keep shared-memory cleanup in the read path under fops_lock.

- Mark priv_dev_ctx cleanup_done under fops_lock during probe cleanup so open()

- Register se_if_probe_cleanup after mailbox channel requests so devres LIFO
  ordering runs misc-device cleanup before mailbox channel release.

- Initialize firmware-load state before exposing the misc device to userspace.

4/7:
- priv->waiting_rsp_clbk_hdl.dev_ctx, priv->waiting_rsp_clbk_hdl.rx_msg,
  priv->waiting_rsp_clbk_hdl.rx_msg_sz will be updated after
  acquiring the clbk_rx_lock.
- Create a local variable "const char *devname" and assigned its value
   under the clbk_rx_lock in se_if_rx_callback().

3/7:
- Remove file descriptor, shared-memory setup, and userspace send/receive
  working from the initial Kconfig help text, because the misc-device UAPIs
  added later in the series.

- Replace unaligned u32 pointer access in GET_SERIAL_NUM_FROM_UID() with
  get_unaligned_le32(), avoiding undefined behavior when parsing UID data
  from byte-aligned buffers.

- Add SE_RCV_MSG_DEFAULT_TIMEOUT_MS and set the default response timeout to
  3000 ms.

- Replace MAX_SCHEDULE_TIMEOUT in ele_msg_rcv() with a bounded default response
  timeout using SE_RCV_MS_DEFAULT_TIMEOUT_MS.

- Start handling mailbox messages with IS_ERR_OR_NULL() in se_if_rx_callback()
  before dereferencing msg.

- Fix SoC revision string formatting to print major.minor instead of
  mijor.major.

Fixes for issues reported by Sashiko AI bot on 5/7:
- Move se_if_probe_cleanup devres registration right after mailbox channel
  requests.

- Split the changes into two so that:
  - Initialize load_fw_lock and firmware-load state before the misc device can be
    registered or exposed to userspace in 5/7. Setting load_fw->se_fw_img_nm and
    load_fw->is_fw_tobe_loaded before possible userspace access to the misc device.

  - Keep IMEM management independent from runtime firmware loading metadata.
    Add imem_state_mgmt to struct se_soc_info to separate IMEM save/restore
    buffer management from firmware image availability. Enable IMEM state
    management explicitly for i.MX8ULP by setting imem_state_mgmt = true.
    Allocate encrypted IMEM buffer based on imem_state_mgmt instead of tying it
    to prim_fw_nm_in_rfs.

Reference:
- Link to v28: https://lore.kernel.org/r/20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com

Changes in v28:

5/7: Fix 10 of the 13 issues reported by Sashiko AI review

- [High] se_ctrl.c: se_if_fops_read(): reacquire fops_lock after
ele_msg_rcv() returns before accessing pending lists or rx_msg.
fops_lock is dropped before the blocking wait; a concurrent close could
free the DMA buffers and pending lists while the read is blocked, leading
to UAF and list corruption. Re-check cleanup_done under fops_lock before
touching any shared state.

- [High] ele_common.c: se_val_rsp_hdr_n_status(): guard msg->data[0] read
with if (header->size > SE_MU_HDR_WORD_SZ). A header-only response (1
word) is valid; the unconditional read caused a KASAN slab-out-of-bounds.

- [High] ele_common.h: reduce SE_RCV_MSG_DEFAULT_TIMEOUT from 5000 s to
3000 ms. After a signal interrupts the interruptible wait, ele_msg_rcv()
switches to TASK_UNINTERRUPTIBLE. A 5000-second uninterruptible sleep
reliably triggers the hung-task watchdog. 3000 ms is well below the
default 120 s threshold.

- [High] se_ctrl.c: cleanup_se_shared_mem(): call
se_dev_ctx_shared_mem_cleanup() to free se_buf_desc list entries before
releasing the DMA backing memory, fixing a leak when the fd is closed
with pending I/O buffers.

- [High] se_ctrl.c: se_dev_ctx_shared_mem_cleanup(): skip memset of DMA
buffers when the context is the fw_busy one (command timed out). The
firmware may still be actively accessing the buffer; zeroing it would
corrupt the in-flight DMA transaction.

- [High] se_ctrl.c: cleanup_se_shared_mem(): guard against calling
dma_free_coherent() with a NULL ptr (probe failure before DMA alloc
succeeded).

- [High] The command-receiver rx_msg_sz update is now done under
cmd_receiver_clbk_hdl.clbk_rx_lock. The read path also validates
cmd_receiver_clbk_hdl.dev_ctx, rx_msg, and rx_msg_sz under the same callback
lock before consuming the message.

- [High] se_ctrl.c: se_if_probe_cleanup(): call se_clear_fw_busy() before
cancel_work_sync(). A late mailbox interrupt arriving between the two
calls would see fw_busy still set and schedule work on the already-
cancelled fw_busy_work, causing a use-after-free.

- [Medium] se_ctrl.c: cleanup_dev_ctx(): remove goto from inside a
scoped_guard() block. Use a local already_done flag instead to keep the
cleanup path flat and avoid confusing ownership semantics.

- [Misc] se_ctrl.c: se_ctrl.h: add SE_MU_HDR_WORD_SZ = 1 constant.
Make se_is_fw_busy_ctx(), se_dev_ctx_shared_mem_cleanup() and
get_shared_mem_slot() non-static so they can be called from ele_common.c
and future callers.

4/7: Fix init_misc_device_context() to return 0 on the success path.

- The helper initialized ret to -ENOMEM and returned ret even after
successfully allocating and initializing priv_dev_ctx. This caused
se_if_probe() to treat a successful init_misc_device_context() call as a
failure and abort probe. Return 0 after assigning *new_dev_ctx.

- Avoid a possible NULL pointer dereference in se_if_rx_callback() after
waking the synchronous response waiter. The response callback used
se_clbk_hdl->dev_ctx->devname after calling complete() and dropping
clbk_rx_lock. The awakened ele_msg_send_rcv() cleanup path can clear
waiting_rsp_clbk_hdl.dev_ctx under the same lock before the size-mismatch
dev_err() is emitted. Snapshot devname while clbk_rx_lock is still held and
use the local copy after dropping the lock.

3/7: Fix several issues reported by Sashiko in the ELE driver:

- Add cleanup helper for ele_get_info() and remove the goto-based cleanup path
  that mixed manual cleanup with scoped __free(kfree) objects.

- Document the mailbox TX buffer lifetime assumption in ele_msg_send().
  The i.MX MU mailbox controller copies message payload words into MU
  registers synchronously and does not retain the caller-provided tx_msg
  pointer after mbox_send_message() returns.

- Replace se_get_msg_chksum() with se_update_msg_chksum(), which validates
  the message pointer and size, calculates the checksum, and updates the
  checksum word directly.

- Remove the stale ret check after se_fill_cmd_msg_hdr(), since
  se_fill_cmd_msg_hdr() now returns void.

- Validate the encrypted IMEM export size returned by firmware against
  ELE_IMEM_SIZE before storing it in imem->size for later resume-time import.

- Add a mutex to serialize population of common SoC-level information stored
  in var_se_info.

- Add NULL checks for devm_kasprintf() results before passing revision and
  serial-number strings to soc_device_register().

- Set a 32-bit DMA/coherent mask to make the ELE 32-bit firmware address
  constraint explicit, while still relying on the reserved memory region for
  ELE-accessible DMA memory.

- Keep mutable firmware-load and IMEM state per device in struct se_if_priv,
  while var_se_info only caches immutable SoC-level revision data.

- Keep the SoC device unregister devres action and devm-managed IMEM coherent
  memory handling from v27.

Reference:
- Link to v27: https://lore.kernel.org/r/20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com

Changes in v27:

Address Sashiko findings around:
Changes in v27:

Address Sashiko findings around:
- Encrypted IMEM DMA address handling, response waiter cleanup,
  service-swap address validation, SoC device unregister,
  devm-managed IMEM cleanup, timeout classification, signal
  handling, firmware-load serialization, UAPI compatibility, and
  timed-out firmware transaction cleanup.

- Use dma_addr_t for ELE firmware authentication and IMEM service-swap
  buffers, store the encrypted IMEM DMA handle in the IMEM state, and pass
  imem->daddr to IMEM save/restore.

- Reject ELE service-swap addresses whose upper 32 bits are set before
  placing the address into the 32-bit firmware message field.

- Clear waiting_rsp_clbk_hdl state under clbk_rx_lock on all send/receive
  exit paths, including ele_msg_send() failure.

- Keep mailbox TX completion handled by the mailbox controller/core with
  knows_txdone set to false. The i.MX MU controller copies the message
  payload into hardware registers synchronously.

- Move mutable firmware-load and IMEM state to per-device storage in
  struct se_if_priv.

- Register a devres cleanup action to unregister the SoC device returned by
  soc_device_register().

- Remove manual freeing of the devm-managed encrypted IMEM coherent buffer
  from probe cleanup.

- Fix response-wait timeout classification by basing timeout handling on
  the callback handle being waited on, not on command-receiver file context
  identity.

- Use fixed-width UAPI fields and u64_to_user_ptr() to support 32-bit
  userspace compatibility.

- Add compat_ioctl support for the misc-device UAPI.

- Bound userspace-provided message sizes before memdup_user().

- Track timed-out firmware transactions with the corresponding dev_ctx so
  coherent DMA memory is not freed while firmware may still access it.

- Serialize firmware loading state with load_fw_lock to avoid concurrent
  firmware authentication requests.

- Fix get_se_soc_id() to use the correct match-data type.

- Fix command-receiver lifecycle handling by clearing command-receiver
  callback state under clbk_rx_lock and freeing rx_msg only after dropping
  the lock.

- Avoid unbind/remove deadlock by not holding dev_ctx->fops_lock across the
  blocking command-receiver read wait.

- Initialize dev_ctx reference counting with kref_init().

- Add ELE FW API command filtering through ele_uapi_allowed_fw_cmd().

- Move FW API command IDs and FW API-specific state transitions into
  ele_fw_api.c/ele_fw_api.h.

- Allow command-receiver registration/unregistration through the supported
  storage open/close FW API flow.

- Refactor shared-memory slot allocation and rollback in
  se_ioctl_setup_iobuf_handler().

- Fix hsm0 device tree indentation reported by Sashiko.

- Address Lothar Waßmann's review comments:
  - make se_fill_cmd_msg_hdr() return void and remove dead error checks;
  - remove the trailing comma after the final empty of_device_id sentinel.

- Validate the series with checkpatch, sparse, W=1/W=2 builds, coccicheck,
  dt_binding_check for fsl,imx-se.yaml, CHECK_DTBS=y for imx8ulp-evk.dtb,
  and headers_install for include/uapi/linux/se_ioctl.h.

Reference:
- Link to v26: https://lore.kernel.org/r/20260629-imx-se-if-v26-0-146446285744@nxp.com

Changes in v26:
- Folded kernel test robot and Sashiko-bot fixes into the series.
- Added MAILBOX dependency for COMPILE_TEST builds.
- Hardened response waiter timeout handling and late-response processing.
- Serialized command receiver registration and callback-visible receiver state.
- Added iobuf round_up() overflow detection.
- Rolled back iobuf shared-memory reservation on setup failures.
- Bounded userspace-controlled response buffer size.
- Preserved ioctl operation errors across cleanup.
- Added explicit priv/dev_ctx lifetime handling and teardown/open serialization.

Testing:
- checkpatch.pl --strict: no warnings
- sparse: no warnings
- coccicheck on drivers/firmware/imx/: no driver-specific warnings

Reference:
- Link to v25: https://lore.kernel.org/r/20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com

Changes in v25:
5/7
- removes kernel bot reported warning errors.

3/7
- fix checkpatch --strict error.

1/2, 2/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v24: https://lore.kernel.org/r/20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com

Changes in v24:
5/7 & 3/7
- removes kernel bot reported warning errors.

1/2, 2/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v23: https://lore.kernel.org/r/20251219-imx-se-if-v23-0-5c6773d00318@nxp.com

Changes in v23:
5/7
- removed un-neccessary 'kfree' from the func se_ioctl_cmd_snd_rcv_rsp_handler().

1/2, 2/7, 3/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v22: https://lore.kernel.org/r/20251218-imx-se-if-v22-0-07418c872509@nxp.com

Changes in v22:
3/7 & 5/7
- reverted to previous change of using "__free(kfree)", by declare-and-initialize __free() vars next to their allocations.

1/7
- rename the se_fw.c to se_ctrl.c

2/7, 4/7, 5/7 & 7/7
- No changes.

Reference:
- Link to v21: https://lore.kernel.org/r/20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com

Changes in v21:
3/7
- smatch warning fixes.
- Added "COMPILE_TEST" into "depends on IMX_MBOX && ARCH_MXC && ARM64"
- removed "__free(kfree)" & added kfree();

5/7
- removed "__free(kfree)" & added kfree();

1/2, 2/7, 4/7, & 7/7
- No changes

Reference:
- Link to v20: https://lore.kernel.org/r/20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com

Changes in v20:
5/7:
- adds a func "se_chk_tx_msg_hdr", to check the validity of the in-coming message from usersapce.

1/2, 2/7, 3/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v19: https://lore.kernel.org/r/20250927-imx-se-if-v19-0-d1e7e960c118@nxp.com

Changes in v19:

1/7
- Added 9 lines to the Introduction from line 73-82.

3/7
-  Update the commit message for " For i.MX9x SoC(s) there is at least one
dedicated ELE MU(s) for each world - Linux(one or more) and OP-TEE OS (one or
more), that needs to be shared between them.."

Reference:
- Link to v18: https://lore.kernel.org/r/20250619-imx-se-if-v18-0-c98391ba446d@nxp.com

Changes in v18:

1/7
- Wrap both diagrams above in literal code block by using double-colon

3/7 & 5/7
- Collected Frank's R-b tag.

2/7, 4/7, 6/7 & 7/7
- No changes

Reference:
- Link to v17: https://lore.kernel.org/r/20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com

Changes in v17:
- Changes to 3/7 & 5/7: to wrap code text at 80 character whereever possible.

Reference:
- Link to v16: https://lore.kernel.org/r/20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com

Changes in v16:
- commit 3/7 and 4/7 are moved to end commits making them as 6/7 and 7/7 respectively.
- No change in 1/7 & 2/7.

7/7
- Collected Frank's R-b tag.

6/7
- commit message is updated to wrap at 75 characters.

5/7
- func add_b_desc_to_pending_list, removed the initialization of b_desc to
  NULL.
- variable timeout in func ele_msg_rcv(), is renamed to timeout_ms.
- struct se_if_priv, member variable se_rcv_msg_timeout, is renamed to
  se_rcv_msg_timeout_ms.
- in func load_firmware, move the label exit after dma_free_coherent.

4/7
- commit message is updated to wrap at 75 characters.

3/7
- ele_debug_dump, updated the assignment of keep_logging.
- ele_fw_authenticate function definition is updated to take two address
  as arguments.

Reference:
- Link to v15: https://lore.kernel.org/r/20250407-imx-se-if-v15-0-e3382cecda01@nxp.com

Changes in v15:
- Patch 3/6 is split into two:
  - 3/7: arm64: dts: imx8ulp-evk: add reserved memory property
  - 4/7: arm64: dts: imx8ulp: add nxp secure enclave firmware
- No change in 1/7 & 2/7.

7/7
- removed the se_intance_id structure member variable.
- replace variable name from wait to timeout.
- used 'goto' to follow the common exit path calling "release_firmware(fw);" in case of error path.
- removed TBD string.
- Used ARRAY_SIZE(pending_lists).
- moved init_device_context after init_misc_device_context.
- defined err as long to avoid force convert in func
- added se_rcv_msg_timeout to priv, to control probe/suspend/resume per interface.

6/7
- removed the se_intance_id structure member variable.
- Added dev_ctx to the structure se_clbk_handle, too.
- Collected Frank's R-b tag.

5/7
- removed the se_intance_id structure member variable.
- since added se_if_probe_cleanup to devm, se_if_remove() is redundant. hence removed it.
- rename se_add_msg_chksum to se_get_msg_chksum
- added check if msg-size is 4 byte aligned.
- Fixed multiline comments.
- ele_debug_dump api is updated as part of comment disposition like single setting of flag "keep_logging" & adding if (ret).
- moved dev_err to dev_dbg, for imem save/restore functions.
- moved func get_se_if_name, from 7/7 to here.

3/7
- Updated the commit message.
- split the current patch into two:
  -- 3/7 for board dts, and
  -- 4/7 for chip dts

Reference:
- Link to v14: https://lore.kernel.org/r/20250327-imx-se-if-v14-0-2219448932e4@nxp.com

Changes in v14:

- Patch 5/5 is split into two:
  - firmware: drivers: imx: adds miscdev
  - Introduce dev-ctx dedicated to private.
    -- Base patch before enabling misc-device context, to have the send-receive path, based on device context.
- No change in 1/6 & 2/6.
- Copied change logs from individual commits.

6/6
- moved definition of func se_load_firmware, from 4/6 patch to this patch.
- split init_device_context to init_misc_device_context.
- Different value of se_rcv_msg_timeout is required to be set. Receiving the response of 4K RSA operation can to take upto 3 minutes.
  This long value cannot be set during Linux: boot-up and suspend-resume.
  Hence, it will be set to default small-value during Linux: boot-up and suspend-resume.
- func se_dev_ctx_cpy_out_data(), in either case: do_cpy true or false, the clean-up needs to be done and it is implemented like wise.
  Once do_cpy is false, no need to continue copy to user buffer. But continue to do clean-up. hence cannot return.
  And every dev-ctx operation is done after taking the lock. Hence, two operations with same dev-ctx is not possible in parallel.
- func "init_device_context", for 0th misc dev_ctx, which is created at the time of probe, the device memory management is required. hence there is a difference.
- func "init_device_context", dev_er is replaced with return dev_err_probe.
- func "init_device_context", devm_add_action is replaced by devm_add_action_reset.
- removed type-cast from func se_ioctl_get_se_soc_info_handler().
- used scoped_cond_guard(mutex, _intr, return -EBUSY, &<mutex_lock>)
- combined dev_err & dev_dbg to one dev_err in se_if_fops_read().
- removed the structure member "se_shared_mem_mgmt->secure_mem".

4/6
- trimmed the ele_fetch_soc_info.
- removed the function ptr "se_info->se_fetch_soc_info" and replaced with ele_fetch_soc_info.
- moved definition of func se_load_firmware, to 6/6 patch.
- Different SoC, different ways to fetch soc_info. Generic function declaration for ele_fetch_soc_info() is needed. Hence wrapping ele_get_info() in it.
- Updated Kconfig help text for assertive tone.
- func ele_debug_dump is updated, to remove constructing the format string.
- removed the macro usage for SOC_ID_MASK.
- used low case hex number.
- Condition will never occur, where msg_len satisfy the following condition "msg_len % 4 != 0". Err msg is added if it occurs.
- Function description is added to se_add_msg_crc.
- timeout is added to function ele_msg_rcv, in 5/5 patch.
- local variable "header" is initialized with "tx_msg" and replaced "return err" with "return tx_msg_sz" in func ele_msg_send().
- replace function name from "exception_for_size" to "check_hdr_exception_for_sz"
- replaced "return ret > 0 ? 0 : -1;" with "return ret > 0 ? 0 : ret;" in func "se_save_imem_state".
- func "se_restore_imem_state", to return if the condition is false to proceed.
- removed casting by (void *).
- removed devm_kasprintf and done direct allocatiion for attr->soc_id = "i.MX8ULP" & attr->soc_id = "i.MX8ULP", & attr->family.
- Followed Reverse christmas tree order, whereever missing.
- There is no return if ele_fw_authenticate fails. Execution flow continue forward and execute the fucn dma_free_coherent().
- The loop is not for retry. The loop is needed to load secondary fw followed by loading primary fw, first. This is the case when ELE also got reset.
- dev_err_probe is corrected in func "se_if_request_channel".

3/6
-

Reference:
- Link to v13: https://lore.kernel.org/r/20250311-imx-se-if-v13-0-9cc6d8fd6d1c@nxp.com

Changes in v13:

5/5
- Updated the commit message for imperative mood.
- Remove the usage of macros- NODE_NAME, GET_ASCII_TO_U8, GET_IDX_FROM_DEV_NODE_NAME.
- Clean-up the return path by replacing "ret = -<err>; return ret;" with "return -<err>;"
- Clean-up the return path by replacing "ret = -<err>; goto exit;" with "return -<err>;"
- Removed goto statements from the entire driver, where there is no common code at function's exit.
- Fixes the check-patch erros reported with flag "--strict"
- Replaced devm_add_action, with devm_add_action_or_reset
- Removed the un-necesary and obvious code comments.
- Removed dev_probe_err at the exit of function se_if_probe().

4/5
- Clean-up the return path by replacing "ret = -<err>; return ret;" with "return -<err>;"
- Clean-up the return path by replacing "ret = -<err>; goto exit;" with "return -<err>;"
- Removed goto statements from the entire driver, where there is no common code at function's exit.
- fixes the check-patch erros reported with flag "--strict"
- removed the un-necesary and obvious code comments.
- variable received msg timeout to be different at boot-up & suspend/resume and send/recv ioctlis.

3/5
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- updated the alias name.

2/5
- compatible string is modified from "fsl,imx8ulp-se" to "fsl,imx8ulp-se-ele-hsm".
- compatible string is modified from "fsl,imx93-se" to "fsl,imx93-se-ele-hsm".
- compatible string is modified from "fsl,imx95-se" to "fsl,imx95-se-ele-hsm".
- Mis-understood the +1 from Conor. Hence dropped the Reviewed-by tag.
- Collected Rob's R-b tag on v7 (https://lore.kernel.org/all/172589152997.4184616.5889493628960272898.robh@kernel.org/)

1/5
- No change

Reference:
- Link to v12: https://lore.kernel.org/r/20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com

Changes in v12:

5/5
- increased the wait-timeout.

4/5
- rename flag "handle_susp_resm" to "imem_mgmt"
- moved the buffer allocation ot load_fw->imem.buf, to se_probe_if.
- setting imem state at initialization.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v11: https://lore.kernel.org/r/20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com

Changes in v11:

5/5
- devname is constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- ele_rcv_msg(), is updated to add the wait_interruptible_timeout for the non-NVM-Daemon message exchanges, such that in case of no response from FW,
  Linux donot hangs.
- added a new helper function get_se_if_name(), to return the secure-enclave interface owner's name string.
- added a new helper function get_se_soc_id(), to return the secure-enclave's SoC id.

4/5
- moved the se_if_node_info member "soc_register", to the struct "se_if_node_info_list"; as soc registration done once, not per interface.
- moved the se_if_node_info member "se_fetch_soc_info", to the struct "se_if_node_info_list"; as soc info fetching is done once, not per interface.
- Added two member variable se_if_id and se_if_instance_id to struct se_if_defines.
- removed the member "se_name" from struct "se_if_node_info". Rather, it will constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- moved the static global variable "se_version", to the newly created structure "struct se_var_info".
- moved the member "struct se_fw_load_info load_fw" of "se_if_node_info_list", to the newly created structure "struct se_var_info".
- Replaced RUNTIME_PM_OPS with SET_SYSTEM_SLEEP_PM_OPS, in power-managment ops.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v10: https://lore.kernel.org/r/20241104-imx-se-if-v10-0-bf06083cc97f@nxp.com

v10: firmware: imx: driver for NXP secure-enclave

Changes in v10:
5/5
- replaced the u8, u16, u32, u64, with __u8, __u16, __u32, __u64 in
  'include/uapi/linux/se_ioctl.h'.

4/5
- No change

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v9: https://lore.kernel.org/r/20241016-imx-se-if-v9-0-fd8fa0c04eab@nxp.com

Changes in v9:

4/5
- change se_if_remove function signature, required after rebase to v6.12-rc1.
- move the info->macros to a structure "struct se_if_defines if_defs".
- Removed "info" from "struct se_if_defines if_defs".
- Moved "mem_pool" from "struct se_if_defines if_defs" to "priv".
- Fetching "info" using container-of.

5/5
- Fetching "info" using container-of.
- Fixed issue reported by sparse.

Reference:
- Link to v8: https://lore.kernel.org/r/20241015-imx-se-if-v8-0-915438e267d3@nxp.com

Changes in v8:

5/5
- Remove the check for SE_IF_CTX_OPENED.
- replaced dev_ctx->priv-dev, priv->dev, whereever possible.
- func "if_misc_deregister" moved before func "init_device_context".
- func "init_device_context" before func "se_ioctl_cmd_snd_rcv_rsp_handler".
- func "se_if_fops_write" and "se_if_fops_read", are moved after func "se_ioctl_get_mu_info".
- non static functions "se_dev_ctx_cpy_out_data, se_dev_ctx_shared_mem_cleanup & init_device_context" are moved static and local scope.
- Removed back & forth between the two structs "struct se_if_device_ctx *dev_ctx" and "struct se_shared_mem_mgmt_info *se_shared_mem_mgmt"
- removed the NULL check for bdesc.
- fops_open, is corrected for acquiring the fops_lock.
- Fops_close, mutex unlock is removed. Infact check for waiting_rsp_clbk_hdl.dev_ctx, is removed.
- sema_init(&dev_ctx->fops_lock, 1);, replaced with Mutex.
- structure member se_notify, is removed.

4/5
- removed initializing err to zero in func ele_fetch_soc_info(),
- replaced 'return 0', with 'goto exit', if the condition (!priv->mem_pool) is true.
- replaced "struct *dev" with "struct se_if_priv *priv", in base_message API(s) and others.
- Created a separate structure "struct se_if_defines" to maintain interface's fixed values like cmd_tag, rsp_tag, success_tag etc.
- removed the macros "WORD_SZ", "SOC_VER_MASK", "DEFAULT_IMX_SOC_VER", "RESERVED_DMA_POOL".
- Added handling for "ctrl+c", by postponing the interrupt, till the response to the "command in flight" is received.
- Removed the mutext lock "se_if_lock".
- furnction prototype for "se_save_imem_state" and "se_restore_imem_state", is changed to pass "imem" by reference.
- Added a new structure "struct se_fw_load_info", dedicated to contain FW loading relevant info. It is a member of struct info_list.
- split "imem_mgmt_file_in_rfs" into two "prim_fw_nm_in_rfs" and "seco_fw_nm_in_rfs", to be part of "struct se_fw_load_info".
- moved the function "se_load_firmware" prior to func "if_mbox_free_channel".
- function "se_load_firmware" is updated to use "request_firmware", instead of "request_firmware_no_wait".
- function "se_load_firmware" is updated to load "primary" fw image, if the imem_state is not BAD. Then load the "secondary FW" image.
- Added a new mutex_lock in the function "se_load_firmware", for ensuring FW loading done once, when there are multiple application are in play.
- instead of "wait_queue_head_t wq", used "sruct completion".
- add devm_add_action with action as se_if_probe_cleanup.

Reference:
- Link to v7: https://lore.kernel.org/r/20240904-imx-se-if-v7-0-5afd2ab74264@nxp.com

Changes in v7:

5/5
- struct se_clbk_handle, is added with a member struct se_if_device_ctx *dev_ctx.
- func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send(), are removed.
- func se_ioctl_cmd_snd_rcv_rsp_handler(), is modified to remove the func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send()
- func se_ioctl_cmd_snd_rcv_rsp_handler is callig func ele_msg_send_rcv(), instead.
- Mutext "se_cmd_if_lock", handling is removed from this patch.
- func ele_miscdev_msg_send() is replaced with func ele_msg_send(), in fops_write.
- func ele_miscdev_msg_rcv() is replaced with func ele_msg_rcv(), in fops_read.
- fops_open is modified to create the new dev_ctx instance (using func init_device_context()), which is not registered as miscdev.
- Only one dev_ctx is registered as miscdev and its reference is stored in the struct se_if_priv, as priv_dev_ctx.
- Separate func cleanup_se_shared_mem() & func init_se_shared_mem(), for shared memory handling part of struct dev_ctx.
- Input param for func(s) ele_msg_rcv(), ele_msg_send() & ele_msg_send_rcv(), is replaced from struct se_if_priv to struct se_if_device_ctx.

4/5
- A new structure is defined name struct "se_clbk_handle", to contain members processed in mailbox call-back function.
- "struct se_if_priv" is modified to contain the two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- func ele_msg_rcv() is modified to take a new additional input reference param "struct se_clbk_handle *se_clbk_hdl".
- func ele_msg_send() is modified to take a new additional input tx_msg_sz.
- func ele_msg_send_rcv(), is modified to take 2 more inputs - tx_msg_sz & exp_rx_msg_sz.
- func se_val_rsp_hdr_n_status(), is modified to take input of rx_msg buffer, instead of header value, as input param.
- each caller of the func ele_msg_send_rcv(), is sending these two additional input params.
- func se_if_callback(), is modified to work on two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- Variable "max_dev_ctx", is removed from info & priv struture, as well its usage.
- New member variable "se_img_file_to_load", is added to structure "priv".
- Other member variables - rx_msg(ptr), rx_msg_sz, completion done & list of dev_ctxs, is removed from priv struture, along with their usage.
- func se_resume(), updated to wakeup the two "wq", part of "struct se_clbk_handle": priv->waiting_rsp_clbk_hdl & priv->cmd_receiver_clbk_hdl.

3/5
- Node name is changed from senclave-firmware@0 to "secure-enclave"

2/5
- Node name is changed to "secure-enclave".

Reference:
- Link to v6: https://lore.kernel.org/r/20240722-imx-se-if-v6-0-ee26a87b824a@nxp.com

Changes in v6:

5/5
- replaced scope_gaurd with gaurd.

4/5
- replaced scope_gaurd with gaurd.
- remove reading the regs property from dtb.
- Added NULL check for priv data fetched from device, as a sanity check, for ele_base_msg apis)

3/5
- replace firmware with senclave-firmware.

2/5
- replace firmware with senclave-firmware.
- drop description for mbox
- Replaced "items:" with maxItems:1 for "memory-region"
- Replaced "items:" with maxItems:1 for "sram"
- remove regs property.
- remove "$nodename"

Reference:
- Link to v5: https://lore.kernel.org/r/20240712-imx-se-if-v5-0-66a79903a872@nxp.com

Changes in v5:

2/5
- updated the description of mboxes
- updated the description & items for mbox-names.
- updated the description of memory-region
- move "additional properties: false" after allOf block.
- removed other example except one.

4/5
- Corrected the indentation in Kconfig.
- info members:mbox_tx_name & mbox_rx_name, are replaced with macros.

5/5
- Replaced "for  secure enclaves", with "for secure enclaves"
- Replaced "user space" with "userspace".
- End the line "[include]<linux/firmware/imx/ele_mu_ioctl.h>" with a period.

Reference:
- Link to v4: https://lore.kernel.org/r/20240705-imx-se-if-v4-0-52d000e18a1d@nxp.com

Changes in v4:

1/5
a. Removed - from EdgeLock Enclave.

b. Removed , after "Each of the above feature,"

c. replace "can exists" with "can exist".

d.
-messaging units(MU) per SE. Each co-existing 'se' can have one or multiple exclusive
-MU(s), dedicated to itself. None of the MU is shared between two SEs.
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
 Communication of the MU is realized using the Linux mailbox driver.

e.
-All those SE interfaces 'se-if' that is/are dedicated to a particular SE, will be
-enumerated and provisioned under the very single 'SE' node.
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").

f. Removed ",". Replaced for "Each 'se-if'," with "Each se-if'.

g. removed ","
-  This layer is responsible for ensuring the communication protocol, that is defined
+  This layer is responsible for ensuring the communication protocol that is defined

h. removed "-"
-  - FW can handle one command-message at a time.
+  - FW can handle one command message at a time.

i.
-  Using these multiple device contexts, that are getting multiplexed over a single MU,
-  user-space application(s) can call fops like write/read to send the command-message,
-  and read back the command-response-message to/from Firmware.
-  fops like read & write uses the above defined service layer API(s) to communicate with
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
   Firmware.

j. Uppercase for word "Linux".

2/5
a. Rephrased the description to remove list of phandles.

b. Moved required before allOf:
+required:
+  - compatible
+  - reg
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
 allOf:

c. replaced not: required: with properties: <property-name>: false.
   # memory-region
-      not:
-        required:
-          - memory-region
+      properties:
+        memory-region: false

   # sram
-    else:
-      not:
-        required:
-          - sram

d. Reduced examples. keeping example of i.MX95.
e. node-name is changed to "firmware@<hex>"

3/5
- node name changed to "firmware@<hex>".

4/5
- used sizeof(*s_info)
- return early, rather than doing goto exit, in ele_get_info().
- Use upper_32_bits() and lower_32_bits()
- use rx_msg here instead of priv->rx_msg
- Moved the status check to validate_rsp_hdr. Rename the function to "se_val_rsp_hdr_n_status"
- typecasting removed header = (struct se_msg_hdr *) msg;
- Converted the API name with prefix imx_ele_* or imx_se_*, to ele_* and se_*, respectively.
- Removed the functions definition & declaration for: free_phybuf_mem_pool() & get_phybuf_mem_pool()
- removed the mbox_free_channel() calls from clean-up.
- Flag "priv->flags" is removed.
- Converted the int se_if_probe_cleanup() to void se_if_probe_cleanup().
- Replaced NULL initialization of structure members: priv->cmd_receiver_dev & priv->waiting_rsp_dev , with comments.
- Removed the function's declaration get_phy_buf_mem_pool1

5/5
Changes to Documentation/ABI/testing/se-cdev.
a. Removed "-" from "secure-enclave" and "file-descriptor".

b. Removed "-" from "shared-library"

c. Replaced "get" with "getting".

d. Added description for the new IOCTL "send command and receive command response"

e. Replaced "wakeup_intruptible" with "wait_event_interruptible"

f. Removed ";"

g. Removd "," from "mailbox_lock,"

h. Replaced "free" with "frees"

i. In mailbox callback function, checking the buffer size before
copying.

Reference:
- Link to v3: https://lore.kernel.org/r/20240617-imx-se-if-v3-0-a7d28dea5c4a@nxp.com

Changes in v3:
5/5:
- Initialize tx_msg with NULL.
- memdup_user() returns an error pointer, not NULL. correct it by adding check for err_ptr.
- new IOCTL is added to send & recieve the message.
- replaced the while loop till list is empty, with list_for_each_entry.
- replaced __list_del_entry, with list_del.
- Removed the dev_err message from copy to user.
- Removed the casting of void *.
- corrected the typcasting in copy to user.
- removed un-necessary goto statement.
- Removed dead code for clean-up of memory.
- Removed un-mapping of secured memory
- Passing se_if_priv structure to init_device_context.
- Updated the below check to replace io.length with round_up(io.length).
	if (shared_mem->size < shared_mem->pos|| io.length >= shared_mem->size - shared_mem->pos)
- Created a function to cleanup the list of shared memory buffers.
- Used list_for_each_entry_safe(). created a separate functions: se_dev_ctx_cpy_out_data() & se_dev_ctx_shared_mem_cleanup()

4/5
- Changed the compatible string to replace "-ele", to "-se".
- Declaration of imx_se_node_info, is done as const in the whole file
- Remove the unused macros from ele_base_msg.h
- Remove the function declaration get_phy_buf_mem_pool1, from the header file.
- Replace the use of dmam_alloc_coherent to dma_alloc_coherent
- Check for function pointer, before calling the fucntion pointer in imx_fetch_se_soc_info
- Removed the unused flag for SE_MU_IO_FLAGS_USE_SEC_MEM.
-  Removed the unused macros WORD_SZ
- instead of struct device *dev, struct se_if_priv *priv, is used as argument to the funtions:se_save_imem_state, se_restore_imem_state, imx_fetch_se_soc_info
- Removed ret from validate_rsp_hdr.
- changed the prefix of the funtion: plat_add_msg_crc and plat_fill_cmd_msg_hdr.
- indentation correction for info structures.
- remove the check for priv not null from se_if_probe_cleanup
- Removed the casting of void *.
- se_load_firmware function is corrected for not freeing the buffer when allocation fails.
- Checking if get_imx_se_node_info() can return NULL, in se_if_probe()
- imem.size has type u32. return value from se_save_imem_state() will be assigned to imem.size in case of success only.
- removed the flag un-setting in case of failure. priv->flags &= (~RESERVED_DMA_POOL);
- removed the function call for devm_of_platform_populate(dev);
- Checking for not-NULL,  before calling the funtion pointer se_fetch_soc_info.
- Removed the checking for reserved memory flag, before freeing up the reserved memory, in se_probe_if_cleanup.

3/5
- Changed the compatible string to replace "-ele", to "-se".

2/5
- to fix the warning error, replaced the "-ele" & "-v2x" in compatible string, to "-se".
- Added an example for ele@0 for compatible string "fsl,imx95-se"

Reference
- Link to v2: https://lore.kernel.org/r/20240523-imx-se-if-v2-0-5a6fd189a539@nxp.com

Changes in v2:

4/4
- Split this patch into two: 1. base driver & 2. Miscdev
- Initialize the return variable "err" as 0, before calling 'return err', in the file ele_common.c
- Fix the usage of un-iniitialized pointer variable, by initializing them with NULL, in ele_base_msg.c.
- Fix initializing the ret variable, to return the correct error code in case of issue.
- replaced dmam_alloc_coherent with dma_alloc_coherent.
- Replace the use of ELE_GET_INFO_READ_SZ, with sizeof(soc_info).
- Replaced -1 with -EPERM
- Removed the safety check on func-input param, in ele_get_info().
- fix the assigning data[1] with lower 32 address, rather than zero, for ele_fw_authenticate API.
- Correctly initializing the function's return error code, for file  ele_base_msg.c.
- replaced 'return' with 'goto'.
- Use length in bytes.
- Corrected the structure se_msg_hdr.
- Moved setting of rx_msg  to priv, into the function imx_ele_msg_send_rcv
- Will add lockdep_assert_held, to receive path, in v2.
- corrected the spacing at "ret  = validate_rsp_hdr"
- FIELD_GET() used for RES_STATUS
- Re-write the structure soc_info, matching the information provided in response to this api.
- The "|" goes to the end of the previous line.
- Moved the locking and unlocking of the command lock to the caller of the function.
- removed the safety check for device private data.
- Structure memory reference, used to read message header.
- In the interrupt call back function, remove assigning waiting_rsp_dev to NULL, in case of response message rcv from FW.
- do while removed.
- replaced BIT(1) for RESERVED_DMA_POOL, to BIT(0)
- The backslash is removed while assigning the file name with absolute path to structure variable.fw_name_in_rfs =.
- Update the 'if' condition by removing "idx < 0".
- mbox_request_channel_byname() uses a "char" for the name not a u8. Corrected.
- devm managed resources, are not cleaned now, in function se_probe_if_cleanup
- Used dev_err_probe().
- Used %pe to print error string.
- remove "__maybe_unused" for "struct platform_device *enum_plat_dev __maybe_unused;"
- used FIELD_GET(), for  RES_STATUS. Removed the use of MSG_TAG, MSG_COMMAND, MSG_SIZE, MSG_VER.
- Depricated the used of member of struct se_if_priv, bool no_dev_ctx_used;
- Moved the text explaing the synchronization logic via mutexes, from patch 1/4 to se_ctrl.h.
- removed the type casting of info_list = (struct imx_se_node_info_list *) device_get_match_data(dev->parent);
- Used static variable priv->soc_rev in the se_ctrl.c, replaced the following condition: if (info_list->soc_rev) to if (priv->soc_rev) for checking if this flow is already executed or not.
- imx_fetch_soc_info will return failure if the get_info function fails.
- Removed devm_free from imx_fetch_soc_info too.

3/3
- Made changes to move all the properties to parent node, without any child node.

2/4
- Use Hex pattern string.
- Move the properties to parent node, with no child node.
- Add i.MX95-ele to compatible nodes to fix the warning "/example-2/v2x: failed to match any schema with compatible: ['fsl,imx95-v2x']"

1/1
- Corrected the spelling from creats to creates.
- drop the braces around the plural 's' for interfaces
- written se in upper case SE.
- Replace "multiple message(s)" with messages.
- Removed too much details about locks.

Testing
- make CHECK_DTBS=y freescale/imx8ulp-evk.dtb;
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-se.yaml
- make C=1 CHECK=scripts/coccicheck drivers/firmware/imx/*.* W=1 > r.txt
- ./scripts/checkpatch.pl --git <>..HEAD
- Tested the Image and .dtb, on the i.MX8ULP.

Reference
- Link to v1: https://lore.kernel.org/r/20240510-imx-se-if-v1-0-27c5a674916d@nxp.com

---
Pankaj Gupta (7):
      Documentation/firmware: add imx/se to other_interfaces
      dt-bindings: arm: fsl: add imx-se-fw binding doc
      firmware: imx: add driver for NXP EdgeLock Enclave
      firmware: imx: device context dedicated to priv
      firmware: imx: adds miscdev
      arm64: dts: imx8ulp: add secure enclave node
      arm64: dts: imx8ulp: add reserved memory for EdgeLock Enclave

 Documentation/ABI/testing/se-cdev                  |   44 +
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   |   91 +
 .../driver-api/firmware/other_interfaces.rst       |  133 ++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |    3 +-
 .../arm64/boot/dts/freescale/imx8ulp-firmware.dtsi |   31 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   12 +-
 drivers/firmware/imx/Kconfig                       |   12 +
 drivers/firmware/imx/Makefile                      |    2 +
 drivers/firmware/imx/ele_base_msg.c                |  327 ++++
 drivers/firmware/imx/ele_base_msg.h                |  119 ++
 drivers/firmware/imx/ele_common.c                  |  575 ++++++
 drivers/firmware/imx/ele_common.h                  |   50 +
 drivers/firmware/imx/ele_fw_api.c                  |   57 +
 drivers/firmware/imx/ele_fw_api.h                  |   18 +
 drivers/firmware/imx/se_ctrl.c                     | 2044 ++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h                     |  202 ++
 include/linux/firmware/imx/se_api.h                |   14 +
 include/uapi/linux/se_ioctl.h                      |   97 +
 18 files changed, 3828 insertions(+), 3 deletions(-)
---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20240507-imx-se-if-a40055093dc6

Best regards,
-- 
Pankaj Gupta <pankaj.gupta@nxp.com>

