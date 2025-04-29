Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4A9262FC3
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 03:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745897305; cv=fail; b=YdIVehzOuYHNva1WbxAaFzLoUhffdRKX8YD1QF4gMKBIbWlWsPnu+LjhGdSKCD4RxAeQmuQhQH3tMqoHIfjl3T9+MKJURnj2qAYvV16XJdGlvPH2q9pHU5kgMMS9D06006AJjJn4mGd05HV7/I5jobaGlHz5DJoFSuhy7gNaObU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745897305; c=relaxed/simple;
	bh=PkhYXUe5lszdxgop8z4hDknfLs21401WR7vOEuf+naY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eMKQNiuqu9weeBH4Jl/1oIrBPIaxiEPTWvevg3k2DuX7IFIXFgRFBDcfNZrB9m43wyRcuk6m/3A6to/nDgrdflKjSCNGMgFP5opcJXaMMhRMYBRaqMHcGcaDAEy5b+ZKatpFcBFmcK2P4oOenGFIlIAda7tQ1Wwfmzc//T66qU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lw8Ysxti; arc=fail smtp.client-ip=52.101.72.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lw8Ysxti"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgjVox0FXQnGeRitSE+kp8rmnBb4wipT+yDEMABCzzTQKIH/DkSLjgiqgDYDFigjdO4Uek0WG+tGQSCxsdgpwnhKtn7evlCHNDpSn3UEU6G3DqVCNGv/JTyRJle3pxGrYb8e/K+hSJYhIqIHugwmO7uDmaP3zJnV5KMRWDfupSLD9PrU+yryN2+pJ/sfNXxOAuWFsxkN1HkWbsu3uzVRfGoB6W8pMUbnGGqoPcZznAHR7lX94m4bN//EdWRIDFc2eCFOyNyY0Y4fPUyDzLClX0Z14I2pCBXX5PR5dvx2d2/V1YeLbIJEUA4ER0JacjNRpZCwzbl8jTW2SGbSHoFakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7gdpBkKdVe3F8uYFcc77lK9eStMXo2MqRRbG2e3/rM=;
 b=NduJfxYt17yWywKvACniOtw9Fdlfgj2N89YcAxCqz14xAhEWVtcUoqUT/H98SoeMw1DwzPjtic3H17tKfyzGmfrI7hYBYuY5WQQY0HupLFEM2dD+lscWhsZw/Nk92NMHGrrWANd4Av93CByFJ5vgX4FatJJbh9k6Zo9zIOc6PDk9/ufwEkqzrj9SLRM1cEsxzmJ1tq+aXGt0ZBvnCCzHUat+Ylc5L4/A5lbLcWzIQ8QvGC7VQgwsFK1TAEv47p2xkSaDRgnYFlLp/2iM/05GyJjLG80mroa5pFqME/gAZ8nMXRixp+CQFb0GeJ42AQVjv/fW6Lcne8HMq8Y9J13s1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7gdpBkKdVe3F8uYFcc77lK9eStMXo2MqRRbG2e3/rM=;
 b=lw8YsxtiLz52JcV1ijvXXRAMbjGDg38MayjxafkX1i9k+Q9hNi+7WOB5jsRNoOaAEs5p3+V3OKdaOCPPk4mfPOTEp1r2usnzfi70uKbLoEN5iVunYSTUFUJQ97TRTy0IJWtW5Oaov62EtVJBaW57RMJ5Swm35XM4oZ526Vj0jfTOZEzAlhaqQ6wWiPFKX83nQ8mdaPfKxDSZc+M+3d0OV7Xa7jJ0ncOEeKbO2s2+Lgiuy/sZNcY/vn2O7SXNFfDB1tbdvTx0P8UDmmM81RG+bbeoNxy+F8FQVZATnKVd6vM++u/kj8uGb4WYet111xQ7tAxt7Ctda6hdoRst07LLzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS1PR04MB9698.eurprd04.prod.outlook.com (2603:10a6:20b:481::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 03:28:20 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 03:28:19 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: jun.li@nxp.com,
	alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: phy: imx8mq-usb: improve some tuning properties
Date: Tue, 29 Apr 2025 11:30:07 +0800
Message-Id: <20250429033009.2388291-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS1PR04MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: 558f28df-049a-4465-42af-08dd86cde223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ts9M1aMvF6FTJoJAo9PD6n8aTpcIlj+S0NaOhlgu+QGnKCYCP+13AdphsYsP?=
 =?us-ascii?Q?8CN18Lu61iIG42dc3SeL7T9xZ2Na3j3uCIpHh5fC5kjImcJxKM4ckI8LDD+O?=
 =?us-ascii?Q?S7TH9BmYthpGpdlpZjv2isa0h63rkchHwSdoz9ZvZvStuRhZMGzS6Uu2wpHW?=
 =?us-ascii?Q?PMpI4bjy11y1TbIss7fHzuKkYAk4EV1+CyrU6cixWEW+fkFlCmmmmcamgzrv?=
 =?us-ascii?Q?E06eyewoiciRTkctRjcKBzDimUQnBKZzv2dmYsQL2BNEWlSOpgUcpE769+UR?=
 =?us-ascii?Q?gbbgDVK11dfrIoIh/Zs2U0CFVhWlGHmGDJ1Ab2xQ3EX8RhcBa0wxzuKkpJ6k?=
 =?us-ascii?Q?u69HHAR8wrOpTuWFxbYXUvpy/rTi5XBcA5Eaz+5gQp2t73TSGgjltYmxHCjs?=
 =?us-ascii?Q?Af5f/vcJl35ZkjEilkFIu1CozNMuJ+lpJwSI8G/iEu9X+1eTylNntFxTFI07?=
 =?us-ascii?Q?vXVyz5zy1PZtf1oPki0Ctz5vcODTnCIPUFCOfyxoUVSafoxBgZbW5pfE8Ol/?=
 =?us-ascii?Q?yBhZe/+uNTlEf7fsRo+42UgIaxM/0GKev34Tw3abZwAlsaO5li7xBNstPEwW?=
 =?us-ascii?Q?El5JaIeIMJBDPaYeeOkkSX/mp3VjRxEq5oWATGjziu3v8nqNJrAcSjDcTdCo?=
 =?us-ascii?Q?u7hbPGf6CuPHs8par06NUcCvnatKSIiXO816s1xzwTvW+hPySQF7dNYePacE?=
 =?us-ascii?Q?MH5eIRqWWR7kjrpaXWNRET251+fYm8w5GyJxwUngdehomo8nOnFyH8nbh4WV?=
 =?us-ascii?Q?Zt1/K3CIT5hTlyQpm65uKz8eS/z/xC0HPcBXReluWSLGgEatJm8J1sb0SJCZ?=
 =?us-ascii?Q?Sa446nIxC7hP1Yr37oih6uNXSoqBKVdXz31EcgOMzqeCp+mlsfx9jZxb1oTe?=
 =?us-ascii?Q?6nBwleLnxy4Arf/Bzy3obmSS1bVxMB1tOUu/QYi1rtRhoSU3QpkKOvnA6BSb?=
 =?us-ascii?Q?YZRdvVUmICNFo3XRI1rnNnOZj8zTe0U/6cnFPY9eoM1Loqk8x8UdUuYZB/W5?=
 =?us-ascii?Q?axr9n6oFwj1iD/fZxMnhsXtLhQ2e4eA0JKDxFJT+u0KaqdIUGyOzinfk5IJ+?=
 =?us-ascii?Q?XKdDXAZ0x9OfG+xuQODp24ucNpcmWM1/Ogj8+XMABmuBAgaq8p7l/UZIIJ5B?=
 =?us-ascii?Q?EHZdvw6m5zmllWz5dWvHT8wfefoThhe2keyGwQMBkESFRL0eXrlsqW6VYnBU?=
 =?us-ascii?Q?zyh/WCUIkhFEvX6uTBXuWnRzONk7OQdRvAKQYWXmegoNO9kDXJlXrhiKgrJs?=
 =?us-ascii?Q?hmgqlQFQ51efvo5MzUtAjkG7wHNtloy8aHzWVHI5kaSJZEUEszJx4EG6I2CP?=
 =?us-ascii?Q?IagdCpwhsmCJ0hFjTUIYZJQfvA1hs849WCH+3p2WcN8tdKjTOHFM0Tkd/Zom?=
 =?us-ascii?Q?EBm9jF5C+p8gP6Tw0xi+Zc0J+SDwfPEKfAMMpoA1X8HSShfmePltgItPNXPG?=
 =?us-ascii?Q?sDdBGl+kwQs9FdDUd2tob/e7aYFf+1DgryMuYZ6rSzdbKOPFHI6uDg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s8MrwMdtrpJWgNGhHM1BGv8TCb8AfNrAnGfPunqN4DqJkwDklkJs5cjehaEA?=
 =?us-ascii?Q?DAM3pFXETrzMuKnGM2LHVlJIl+K/TYZ1ty5LodgQiNKPg01SuHyeIFnQ146M?=
 =?us-ascii?Q?sh58Pesm3iEWU9qkRUO4Q9Ax0e2M8gxVJhGuAkVL5u1J89FCoTzqAc2EpyFh?=
 =?us-ascii?Q?b/V/P/liZvfXNdV8qytWSwCAEq0zYKgstN7anfmrpryonMAmyKLxq0ZpN6Ge?=
 =?us-ascii?Q?C04vaB7ACzXzITxnx4PRXTtTHfkQrZo3Nxb2EY14JxOL3veijjvyUR2hoXle?=
 =?us-ascii?Q?rPn7uuYEXSOI179qlW48cP7U/YL3mKoVJ+O4TqX7FlfzY/0dxKdCjMjv4GvV?=
 =?us-ascii?Q?0Jwf6n+g7wblTtBcBMyMF25qsuF7ky2TpcbBvuicYylV5y437aIGV4UW4hgq?=
 =?us-ascii?Q?qFkLCGq2yFwwYGImm8zyW4/L63zc5ooBs69Ixrff8vqyaPJnNCkUE20vnBbG?=
 =?us-ascii?Q?+VXdIQCHQcfgPsHLERrmmuT6VfT37xtCt81vHJGGB1v8oyQxWhbh8AzpXCpq?=
 =?us-ascii?Q?AIqzxHdO/WBUem6em/ROKo387K6aRHNXYOLEKrkjKS5/gjMdMi0eweIpSTDW?=
 =?us-ascii?Q?UhIhuSq3NJKWOufbycJxskUZvB6dxkFbpSBJlOZuWXSbmprVN8ucltnJ60CW?=
 =?us-ascii?Q?+2DMS8TPDFr9u1RQYdRhaa9OuLhzcjTHnSwV5zRCC2NNj+bSzTuzYgjU/nFU?=
 =?us-ascii?Q?OG6y/335NF158zLAsN8351MHG/XcKKH0KxZlZdg4F+gyDjd1fqLaAkLdV3Sf?=
 =?us-ascii?Q?7pboPKVgxbiaFD9PU7RSRMSftQA1Ik/an4Gpwdx7tki/Z45C+oHg/vA0hGw9?=
 =?us-ascii?Q?JfdtgA+VUIL9Z+QN2+wq8R3SNbr3PzqDcOyIxSYiPOLvO4Wex9Tb1IRXjv7e?=
 =?us-ascii?Q?q+Vh1iRZVBKfPf7UBY7ApWejumikeXOyWpZ0HcFxp3preT6e+2jJe31EYJG+?=
 =?us-ascii?Q?Vry8RScTXentFuWg2J9oKVfB8ntfIy7nyKC40eQEJ0NoMa5S1YfL2okAXclu?=
 =?us-ascii?Q?SXRYdeClnUWIJMgtxHXXlk05tEkskicf2TZlAbtsz6Yom+QOu87g5UeLhF/v?=
 =?us-ascii?Q?H7L0n+wF0C5/gu7Rch9X9ms2iBWUn5qF+DDJfRmUPRLtGezphnxNdU4dRCOI?=
 =?us-ascii?Q?aH1Dol4Ea19nXpVCU1zjv7nJyAsRrQYJM6TLv9ZYRoXBcQwa2srtXCSgZA1s?=
 =?us-ascii?Q?OSAJWMqlMh1f1/4Jo4wTrDT6pdChxEbHeLXeWh6U/NEsLkZjm8SnkNRoqlnn?=
 =?us-ascii?Q?1pZwbJwiG+L541ghzTRkxjfaQUPxXW2hLYJ26uGg464U3pSooC3l4A0JwIu+?=
 =?us-ascii?Q?cpEKq7FQ+bKcvu3hUDt1/RaC4FGrwe32BFZ44TrYUEX6nlAiHNX6KyzK9t8g?=
 =?us-ascii?Q?e+QXN4nVWOjnOgFKmziQrSRKbumH3kkVDzH7t4/JjGkmKPwFWz2qcomIWDzt?=
 =?us-ascii?Q?F6DbKDaqfosA/B1YtUybUb0hJBhb8hdJ1QLSudk7zZa9vbZPO5hIMV01QVPI?=
 =?us-ascii?Q?gdtCef6i8wbkAgZi9TQKugmsrKlJgzlg9ZAeAnnVSJslcm+KwI1fNP2E8MZ5?=
 =?us-ascii?Q?fRNjr0MZIMU8bQAE4+Rt0PF7Hkg6VpVPOrmuauu4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 558f28df-049a-4465-42af-08dd86cde223
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 03:28:19.7595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FINOT3nzFvfvO1uwgQ0ca/DIZmzd9UAyUiNm0p3DdMz8m/5JYDwIHM/agZtuAxM2sFW07sDdFGIQfFZhuyghTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9698

Commit b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning
properties") add many tuning properties, but some parameter value doesn't
match the register description. It made some changes based on the original
value: add offset to a negative number so turn it to a non-negative number.
However, it's not easy to find an exact tuning value from register field
with such conversion.

Because device-tree supports negative parameter number, this will improve
some propertie's parameter.

Mainly include below properties:
 - fsl,phy-tx-vref-tune-percent
 - fsl,phy-tx-rise-tune-percent
 - fsl,phy-comp-dis-tune-percent

The parameter value of above 3 properties are USB PHY specific. i.MX8MP
and i.MX95 USB PHY has different meanings. So this add restrictions for
them.

 - fsl,phy-tx-vboost-level-microvolt

For this property, the parameter value is wrong in register description.
This will correct it according to true value.

For detailed info, please refer to i.MX8MP and i.MX95 latest reference
manual.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - keep widest constraints
 - use multipleOf for some properties
---
 .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 60 +++++++++++++++----
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index daee0c0fc915..71e5940ef4b8 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -42,16 +42,17 @@ properties:
 
   fsl,phy-tx-vref-tune-percent:
     description:
-      Tunes the HS DC level relative to the nominal level
-    minimum: 94
-    maximum: 124
+      Tunes the HS DC level relative to the nominal level. It varies
+      between different PHY versions
+    minimum: -1000
+    maximum: 875
 
   fsl,phy-tx-rise-tune-percent:
     description:
       Adjusts the rise/fall time duration of the HS waveform relative to
-      its nominal value
-    minimum: 97
-    maximum: 103
+      its nominal value. It varies between different PHY versions
+    minimum: -10
+    maximum: 20
 
   fsl,phy-tx-preemp-amp-tune-microamp:
     description:
@@ -63,15 +64,14 @@ properties:
   fsl,phy-tx-vboost-level-microvolt:
     description:
       Adjust the boosted transmit launch pk-pk differential amplitude
-    minimum: 880
-    maximum: 1120
+    enum: [844, 1008, 1156]
 
   fsl,phy-comp-dis-tune-percent:
     description:
       Adjust the voltage level used to detect a disconnect event at the host
-      relative to the nominal value
-    minimum: 91
-    maximum: 115
+      relative to the nominal value. It varies between different PHY versions
+    minimum: -60
+    maximum: 45
 
   fsl,phy-pcs-tx-deemph-3p5db-attenuation-db:
     description:
@@ -112,6 +112,44 @@ allOf:
         reg:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - fsl,imx8mq-usb-phy
+            - fsl,imx8mp-usb-phy
+    then:
+      properties:
+        fsl,phy-tx-vref-tune-percent:
+          minimum: -6
+          maximum: 24
+          multipleOf: 2
+        fsl,phy-tx-rise-tune-percent:
+          enum: [-3, -1, 0, 3]
+        fsl,phy-comp-dis-tune-percent:
+          enum: [-9, -6, -3, 0, 4, 7, 11, 15]
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx95-usb-phy
+    then:
+      properties:
+        fsl,phy-tx-vref-tune-percent:
+          description: 100x the original
+          minimum: -1000
+          maximum: 875
+          multipleOf: 125
+        fsl,phy-tx-rise-tune-percent:
+          enum: [-10, 0, 15, 20]
+        fsl,phy-comp-dis-tune-percent:
+          description: 10x the original
+          minimum: -60
+          maximum: 45
+          multipleOf: 15
+
   - if:
       required:
         - orientation-switch
-- 
2.34.1

