Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06F6239595
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744801087; cv=fail; b=KmxyzyGu+9dSl+cAjmIF5RBnEJuFgCmlK0jEnXZdZEHfahRSCzByvbuxRT7SUpQssrgreMj5DktF9qgLbksGTtXUylfE3+otfGg5UQ99xbM35BLwMw8mmcMbUkKBmVHxRJXsiMhopB+lDee5/5MTTumttMy2lJTTcQevZOBmyNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744801087; c=relaxed/simple;
	bh=Ilr5hR0N8h7HoAEEr6XO7OqgvcmZ5fGiHx2TLGY44XY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EgI+OoLdMvKR7M7D8Ip6PRnyUu8cyyJygAdJWEaV+A3GKO0bVSGIuGa5WTllzFG4prBBFMuw8INJfE1PBHE/d7yYZr4qCtfXSr3yLpcnnQgPX9QGT8dZ52itfX2KEiSlZ6ox7x+45ivoCQHfgniROOM/B0p1ecUn6TlgD/w+zOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P5LrZzCd; arc=fail smtp.client-ip=52.101.65.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P5LrZzCd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpY19OuEXZzUyYPZhpjfUGMOyAxNIGuz4eD5l7TMaFr543s0a6w7U/FNZQXFlagHaSF0Ps9tyjeEpw9KliMr9WzaYCvBvDxpMchZGD43oPyg6yP71GzEGAMYhNgxC2G38ILyyzKS48/vt+2K4i598eq0ZXp3282qCOpao5oHsxorS5R6wSUgaM46BWIgp5OlJYzaoJR/2Sfk5VTMbXLNKp6Gl+5WXJAJ24tV747YrYrcQJ3U2gNU4JlSF9yuUmJwETFovZfQJSdgiKEqVjl0vAu2NsCwH4D8NNpKpyJSBw1VF10OfZXNtcjVbIuz/KAps+AOqTyUzPIBf8Mxe+ublA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9B5MMEWWcA/csiKkzT1eYMu+t7H4ydEmBaSIppKAfn4=;
 b=sSAwnFeCGsiBQ9vYoyKl6N1Z04xbEmQdAAObvh6azKadpm13yABFLc4bHOU9eislVXwvfHB3LrUDWTCLIhF5MB+bAcNF/E8atZRK08IYXNrfglPjsqOZEzQ/qwQTMGnuidgtvgMeicWlVGohKRdjut6moxgkSCaBlwCgAhDRSnEYFrMJyAfGanl2ZiqigtUe3baJMLrRcWEVy3lIMTQ/Z9W41WWmToLhwlwNKMd5XOksrV1CS4j/7M2fMFxhAUEDmgFu259787okvsa/E54PpeAt/uyRBjZA67ZF5WDWnK9TP81JMefBKCwIbJUOcmgxBhfLpbmAXdd6XIgU+hJNlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B5MMEWWcA/csiKkzT1eYMu+t7H4ydEmBaSIppKAfn4=;
 b=P5LrZzCd9e4UhBEwHd/iWEwsSNezXRD1EpswhQPT8nXxBS+BxXbT5/TadAjeHrzseHDoA3xyxe4a4nYEX+5OcbUiKzygWSEQ9dTGuVAHRlyXC3LArdksadFWkM0CyWHkTP2ngrZmIPZChgwT1kcVveC8A2We+pYmz0Ksl471jrCRLokCLKhNiuXTe5WLwYVNZDdpPCAyMJIBQeCI+VGXDfhcDdDdJzsXjDtUlHEw6YhJLjDMcO4RCE1iKiThz+58HDFhMnW6nDB3ULpJVrUz0cRIAtj1vmpD1Q2PogkVjPhEq9Wt20JaQ1qOlUf684ZqI/1pHqjtyR9CA3PI6/8cHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 10:58:02 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 10:58:02 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: krzk@kernel.org,
	myungjoo.ham@samsung.com,
	cw00.choi@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH 3/3] extcon: ptn5150: Try to get usb role switch from connector fwnode
Date: Wed, 16 Apr 2025 18:59:40 +0800
Message-Id: <20250416105940.1572672-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416105940.1572672-1-xu.yang_2@nxp.com>
References: <20250416105940.1572672-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:3:18::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c7f714-7cb5-464c-e860-08dd7cd58ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pHBTe0guza3q1QDnlbD5F7kR8+BtDghpO2tgOwJPDpG7hd0yCP2oh9OEP/1C?=
 =?us-ascii?Q?DMxyQ8KtYu3gC27XDHc2vHRPzhvKJWB94cS/e+BQs7I6Ez5mqXhBQirhPZG9?=
 =?us-ascii?Q?4MkEibYxyZUZcSUq19Q6jtdzVvRfCv9Zr6+tZcQQxkyFgySZ6iPuy7xTiYwo?=
 =?us-ascii?Q?6P79TS/oQvO3yUBZVnbHk5ykUUOHsKbQCpiPXOloDQrcRYVoJKk1BZXrBb90?=
 =?us-ascii?Q?xQ8PK+SS22kZeiuImUR+lkgGxM1hzDefHL2BKMasjfmyA5ZltA/ByhIxigLy?=
 =?us-ascii?Q?3xWfTMbIha0yMqU7c27gQbbQfhTljA84TUOzz74G+np8B9+rtXOv3zO0jAXz?=
 =?us-ascii?Q?Wr5X+uVUaraCUnhBBqdmsvLseSheNUkBATQQlf80NZhf0gRDVwuweeBlMhs/?=
 =?us-ascii?Q?540rvQyS1m5768fxXAgL5Fq3rWBJY2R6UuTF01Pp258/DKArndts/kn/zCj2?=
 =?us-ascii?Q?MkGkSHgMOq+6Vyg5E5374GOKtho1BUGMycTH8TpnP4kQ4rne2kf3bo7RSaTK?=
 =?us-ascii?Q?6F5AHVcmj2enhNYGTnR2VCOT+cF6dDro0bEgo07+Zur06yophDF89ENmcCpu?=
 =?us-ascii?Q?HUm3fG2oJ8QEM+srUbUD6ChEb5Ve7zO5bslLETdiICJ1NPuIhwz8UhDwE5vM?=
 =?us-ascii?Q?V5BGaq1lBGBabn+155Jp8qx/8st1+ag3n77cRvlMpJZ9TlpN/WAdqfqwyyGS?=
 =?us-ascii?Q?IvS6SIibQX4I8B2fdzVNU2VYA0Oz45QRvhLSf2wbPW6Yw/W+mM0Ms3dkGZld?=
 =?us-ascii?Q?Gc014rnsQyD2LU+6WfrpxENzNoazgVlo6F2+hI6tkuAUC6PC779slyczkQsd?=
 =?us-ascii?Q?XijHLTP91L/nmz+2p1BjH61og+6KCpeWqbxPPvKGn30IuJcTua+XtgHaHFVm?=
 =?us-ascii?Q?We0yWzTKNzAtybImnO7rJ3JKUStDbOeC2ZFs5Esa2vR2jB2axc0NJwhawI2v?=
 =?us-ascii?Q?X771JTn1C4Ly9kORo3UeKskT0g5pn8TX7o6iFCaL8LaeYp/hxG2ghZ6/jffH?=
 =?us-ascii?Q?GxGd+WOwfYcM/9rdB5BgSm8/+P68aBY8WgX1gGSLWtHKcWwgD/CdgtZS/Ki3?=
 =?us-ascii?Q?ORZ+J7R7y24iq3EqMKj1siqlIPQ18tI+mRxSQp/1xmc5t8Oa5E0/d8x8AgDz?=
 =?us-ascii?Q?/5i/NRCpKNbKspXmxzmoN1MFPd4G1zFcxsbGZhAuf0px/0OZfmMZIi+r6h/t?=
 =?us-ascii?Q?1w4oqPMhU3/NALLTGRCiaN7SS1h+tHMC8Qvu1qtpmP+quHgyuU32lbJpiUwa?=
 =?us-ascii?Q?2ZdgcgTlYtiAY/S018sd2WRjnxUW2X6bhA4hr+Y+pc5anBJ1Vs+1DfXwLSL8?=
 =?us-ascii?Q?kpzoaCHQYNbuzEIzlFancpDQ+ViJTJdlt7sJSq9jXWmCEKVaJxwWE6iV3RRw?=
 =?us-ascii?Q?N/CG05milQcB2HOAfnoD7WnJ3fB1bBcET47NBOmNAbY6E109RPeX1cdFA7sK?=
 =?us-ascii?Q?Ck1KtqcKmZH8sCG61I2M0HoBVXoYP0Qjbne0T4toFfov4HgK8Lzm5g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8lIOzcBgKd5xVgyUAgFO9y1lPPvRQU6cnAqOHK7jO4j5GDP1m6U1j7ehPnX7?=
 =?us-ascii?Q?CcaDgd3xaqEhswEV7xXgcU67eGlKfjdrvva48rN1L4XM6eHiwZJAu/4u8Jct?=
 =?us-ascii?Q?5AtuVbnTCLX28E5j9LKbJU9cU3m8szEyOkV1iZUFhDma+4TIeasi7pgH8aLi?=
 =?us-ascii?Q?KENRiANefhjzHA0VZCWvxgBhR3EKrkXGYrwjvfl6fgW4IX7CiXNk+7pInu4v?=
 =?us-ascii?Q?EHpGg6N/8osb9f3AuGD3nMAA3G/rhgr4JP7Zuh8Ee75D8tdvJAQikF/HTZ1x?=
 =?us-ascii?Q?HLlyG/KNKdUL34sBJiQAQYJsEMyZ2bUnM/i+qTrMrzAx+k8XWqhI4CHWASLc?=
 =?us-ascii?Q?v+zIxaFEWXvK4bC93yLBPI01VxLbju78xHHV0xAveOXqvgt5KGOUOOJDB6me?=
 =?us-ascii?Q?vie04jowXfbj8ChAzwKPYWxELjuXz4+Hx0P+5QGh79WoGNjzG78ZEvH71keF?=
 =?us-ascii?Q?hO+6ap61tAVT78M+pLmWMo+4q4Sj9WpF0dTLoTPWxNxarG2Bf9tzfi68SCXZ?=
 =?us-ascii?Q?hu0ce/Udi/0BiZbzMv+H39iY/o8KkBFcQIhz9ujD9yDDCziDIMjcxJNHrATL?=
 =?us-ascii?Q?BQNcctbubgv4pRBU3H8gNvMsoM0ohE0996tyyCLtJFu65sQ5BQcYvYPKd6Ka?=
 =?us-ascii?Q?WkWMn+EjblOaBN8fx3rvNBKzVpyhwIYfq8JdIwdE4291RyW1oPQdjJmCwUDl?=
 =?us-ascii?Q?TY2haAICmt0jJil2O5i/bUO4zA0AKthEiSwQKPGUsnfmSICeaghQvcm+5Uq8?=
 =?us-ascii?Q?boYYtFmD7ZYTSexIy12wnZmQ0sDcFYp5kW4E2hupEnCxNk3fCA8Ogupv0pOR?=
 =?us-ascii?Q?bJADqLNJMkSQdRUwzD+sbQRdSq86JaRqIQEHRnpdxdNoj9FxlpwA2HSSrNOZ?=
 =?us-ascii?Q?y/RqlwkwRgEw+Zw7/sImjwkzWelBfuuKblwmbKCUlx3wSQCglPSk3IhPuOIw?=
 =?us-ascii?Q?10JaTmTKxz7JJDwXJdfUUDEQRWX2ecbLOqMhrpmr2zw4wsOXT9a/5/Bouk19?=
 =?us-ascii?Q?/5g6zo5h+nlXmcfHOBdLZy+hDXw2dHmxkvTWicMfggB63UrSKZ+XC7zBZc0W?=
 =?us-ascii?Q?POsthpwZeEaX/JyoFEp9memoCqQYpdYvqoCH58kzg0XHpp1Cj2TagPOthPsE?=
 =?us-ascii?Q?7VEBq6rqdvi4iESUC9pFEm9nX1PwBJHAlflBlBNyXVGwm7Odxk6awpPtT+kj?=
 =?us-ascii?Q?Dk8rUKnsnLgZ3UeM3TPasrUGfZUGqPpdKofVyR9DqiJrth1ovM6ntRuzUfCo?=
 =?us-ascii?Q?LQI0lgZ4LNbqkTQfxmkeWLHZmshnV8WkRtWd3BVwFEL8pV3vzc5thrjTlgeE?=
 =?us-ascii?Q?WBdzDYRAffOf6DDxnw5nxnxK8H7kNL57vnKmwgSFjm+6Rd/V01f/p+kWtw02?=
 =?us-ascii?Q?ZVaZoIWOIDcAtkY7H/QVh9z3zx2wwVAbHa/R5ZGbuN6N/jKulsSWgdcTZ9xL?=
 =?us-ascii?Q?6BXUMX1nl6eyhipXDyJ+hXr6387e92BcDymJKFwBgdq+RHdtv2sIvBTFkF0b?=
 =?us-ascii?Q?ayf68dkoaGl6VpqfpzuUPbZdIgZ7m6tQa6w/3Cxw6CPmtImAT45TJ4WGj+PZ?=
 =?us-ascii?Q?6CVwD6FIVvo/rZX/p7Rdui39IU7BMX9B8Agfxl+D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c7f714-7cb5-464c-e860-08dd7cd58ec0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:58:02.4665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eYUiKjfX2yUjSH5126BJOUJ1cZTD2N7wH9L8w5N2aWYbeP/th/8/g9Pdlb2ka/+jjejidu/UKrnprJsBr5mQxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820

Since PTN5150 is a Type-C chip, we normally need to describe some
properties under connector node. Due to this, the port node will
locate at connector node in the future. To support it, we need to
get usb role switch via connector fwnode. For compatibility, this
will not remove usb_role_switch_get() function.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/extcon/extcon-ptn5150.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index b7e05d921c79..160998e163f0 100644
--- a/drivers/extcon/extcon-ptn5150.c
+++ b/drivers/extcon/extcon-ptn5150.c
@@ -352,6 +352,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
 	}
 
 	info->role_sw = usb_role_switch_get(info->dev);
+	if (!info->role_sw && connector)
+		info->role_sw = fwnode_usb_role_switch_get(connector);
 	if (IS_ERR(info->role_sw))
 		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
 				     "failed to get role switch\n");
-- 
2.34.1

