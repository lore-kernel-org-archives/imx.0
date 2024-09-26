Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B9318DF92
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727336365; cv=fail; b=CSaMukxcJwcIf0xhVDIVF143rxBTvDbBcgw4ujsSNMMStnxZQ8aLTmkg+Tah8Yvo8y8ejVKkMFxGBPwVrqG8LcujeR/X82dIwnXkbHPWxyIKx7w6AQUzHOgfD1Scif256kCxQ3Zrvt0aucnKNm83H7I2I2YrQ2qLUuHT1Bo7/SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727336365; c=relaxed/simple;
	bh=kdz0J3EqFTOx/d9oFH4Fv1H8AcT/8AE5WrKwT1WlmCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nbYe6JWZK1yukdNBuGg0NdKm2iD7OiPuDz3pcMyB8BS4YyHAhQmOeZpHRpzemUQ7E35TGt5CjZ/X4g5A9eC4HZZ9kh7D1TxuTM69MdSrlPIPKibE1QYGc+AEctW8RaN+G23ovN3dj6PSCeoRwZys8wbTwBzOSw6zsWCMh7g41gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bgEoY8HG; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bgEoY8HG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2RHBIhbu0dtgD0OTUiQi624XTHTUmDVKybRsxgNkYR9UuDV5JikmGFJz0phblb0Qz4R2C8xoWDBNIdSXjbmsajlZ0nvTZvDyRQtHNDhCRydc8dAs1b83PA32boqbPRGUTbwGuLQif2Yc66q4eF3ck2w3ebyY6cjKp/IuSweaei7sQ3B3WHT8zTK6m6goohctEP2hgG3PnzExsVrBO4Jo1XNM+I274bwMoJx2WuIcbG7rXeu0895n3jDtIsStNGTbWlIHQG209mA/TIRwnXyTbJeVN30JVX57nXgKUDCD4fC3nJdJLN/g2t+pDxyUFNxDvMr86SKGhFYY0ljPe6BvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4r6qrC77jfLD8bNbScIs9eLDAgjic3ZgxhTz+SvPhs=;
 b=vihn15jMzS/C2nNHNc6Ha3Z+xhuSX9TNTK5xnKd2OqZLi88Jum08VIfOL1cn9OVl8zHuYesarP5lx2oqt77/KmGaB3tgmkTmywTih8wCLINfPJuBBuMTradpXenGkCVWGmmnt64UwOWkTwsyCruuIhrYBdwcr3mWv8EFRYX+vjpp+aa+oHHlk8e0rtBQm0zPTnGMT+uLUxaH0ihJAdQDeWI36d/25P7gnhka0su072r6X4ZYsLJzh+ijZJYemF6EHYNU5V+UdV3bJpzpxWQazSZ99KBY4MkffK4ZRL8LPyNfew25xE74fJawjLSwvQa+oTjz2DmDQalsc1y1Wc6kfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4r6qrC77jfLD8bNbScIs9eLDAgjic3ZgxhTz+SvPhs=;
 b=bgEoY8HG4/xaKbCHoIbIQYYKCEJN7GPQwTphRy3FuiCkaHSZaEXHe7AFFd4he/d/kvUox32NaIvOrW2O7H8jRWgwgPUW42YQotyPlsbiYznBjyvk/N7QlMJdsGkmnfB5nFHiE/bWD7HCJKeie3m0T43QPp2lmJJ0MalvqPAbC6aZruVu/LUWM5ooRWpJ2V4rhuLbZ9cxvDwqmyYYLSiot1ug8LixtRzaMyM4kUrKTOWJhSpaK+f4EUWBZ70rnLx9y4uVXgc38K/+CXOIWqm155h5Om4Xc3JvDQBEZ9VkASAPRyMXKeqTO8PTTBGGfS/oFsxxkY84mmjfBh28lQc76g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV1PR04MB10893.eurprd04.prod.outlook.com (2603:10a6:150:209::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.20; Thu, 26 Sep
 2024 07:39:17 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%3]) with mapi id 15.20.7918.024; Thu, 26 Sep 2024
 07:39:11 +0000
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
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] ARM: dts: imx6qdl: convert fsl,tx-d-cal to correct value
Date: Thu, 26 Sep 2024 15:39:51 +0800
Message-Id: <20240926073951.783869-6-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926073951.783869-1-xu.yang_2@nxp.com>
References: <20240926073951.783869-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV1PR04MB10893:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7a9277-08bd-4df3-3a04-08dcddfe4e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q2OU6WLJTeDh23DDn5jxS4YEHRZCO3dEmZEZvnmm8q+y6CLf0qgU99IlrVRP?=
 =?us-ascii?Q?6ZwRNNJUIQ1ETURafeVEgEMSQ8++oYdQNE5U0j9yQv45AnXFzw883bmxlDwt?=
 =?us-ascii?Q?6HZ3B79jnrnsh6/z5kMIjtvvb0yp7Vi1Li7lnpZ11rf1VeaTR3+qxpUi5qDg?=
 =?us-ascii?Q?KgwAVgaBCowNh9bB4BS+qtvp2BhN6VOXkuIWGe9UXhaJPtP0+nrQ5LY4CnKt?=
 =?us-ascii?Q?PKEeUm97GM6X7fjPmsvEA+fxCjhOXbq+avvPRwu6VzpcF3yAT3CqigJ3V94H?=
 =?us-ascii?Q?6zp3v5kGRd7pDBMlf9UZSmxJZG1cscIgRC8ON/JcTVLNzyzty21TLC0Hq7MI?=
 =?us-ascii?Q?uGvIv0jJali4rOAjL8QWhjo7e//f1vp5+O28tuN+LWqK/OLeuag4MOlzHkp8?=
 =?us-ascii?Q?Kqvvc/g0XsP6i/LbK/cCr03c49bJ8jdrO5nfelf+Hk2JGRH3PXUvPezVkDxi?=
 =?us-ascii?Q?WzTtOxn0gBEnI4ZXbhZ7I24wEDThS9/br85BELU2CznRMT53JN68RYJ8zL6L?=
 =?us-ascii?Q?r1Uux8il6QXcbyZ6m/fqkfltBG9F4v41YuhjII+l/Fb45To1BR2Et7ae33XJ?=
 =?us-ascii?Q?MP5KihnxvDcUbqhDePLRKX2FN1ret5O82G3L9j/3LubDRY0dXEcEJf9HJfsB?=
 =?us-ascii?Q?R+sMAjcFmXb7jxdqSOHs47FzF/TntMXOwY89USc/y/oLipq2jw5oszRJSWoL?=
 =?us-ascii?Q?ute3QlJl3NVs4t1BOFc7TdRDXsgFkBP61Lyr/Wq92qPP9pLcqu7jSmUCxzXo?=
 =?us-ascii?Q?GJVbi77+pEeoulEoTiadKcHJf3OKVtDwI7pNlnNnpSOD1fNlEPJ1UqcV+ouz?=
 =?us-ascii?Q?dh6NLrQThzp+vh/w8AHijoAod8etJV3Olfg43XcAB1EgTCMnCbl0jhwY26Z9?=
 =?us-ascii?Q?9jMdBaS4OnbjyxLBB5pYrsxnqRampqpl3E0om1GA34JqytsNbeqN8m7Anw0O?=
 =?us-ascii?Q?qC9NXt6IekPkhu9JqxoV/2FQ9O1jBusDCbP3vVEDtnypJR1dweanVcfXbNH7?=
 =?us-ascii?Q?nSELPMtCml8E/tTTg2+KykVXAyPpMJ91K4GeZ4ooyzP1OM7KKEAvq/4i/2IV?=
 =?us-ascii?Q?mifaHzRgIdDpUWmvLgX236vtK2ZitveSnGEGATei4Y+rupWuZScjgSiUIso9?=
 =?us-ascii?Q?Azpdaz0etwmpzkkbvkg6PU8Wo0FqmyUyLnNE5fiUi6k/V3tTABSNyjF9ySla?=
 =?us-ascii?Q?ATCqmcIv0K70mE3d4mCJgPTEkZCy3EiteVjlkIO4hfu2YdBYplQTuPOutMoK?=
 =?us-ascii?Q?cnHJOHZGkaSvH9ntbUVvV3nAgC73BT7qrtI3PrgbVApPftTpo+zJ/astEeLF?=
 =?us-ascii?Q?9W8m0bXpSTe5UD5klKquoLyyknSoF8O4C1fyEc8uuZYRBAmGAIRgRiwqQMCa?=
 =?us-ascii?Q?axSHTIaaHDMAfkFQMeGJSP0OgJGHVdkR8NY0iVhu6aLOMldq8A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gCkpsY9VU9Ljc3v/uaIy4gngUttA6rONj2FW73yThL3Ko5lDnxFbEBHvYVVI?=
 =?us-ascii?Q?6w+zUdqKidtqtXB8HPHkPWx+EZd+wL9p26733GoYtBoMpevnXCrZIE0HW6me?=
 =?us-ascii?Q?Ja0M5tSGgwnQdJylhlRUaoU/pnAyHn3Tj/5dgjfTP+pRytnGuNQls3dd1oM4?=
 =?us-ascii?Q?j62zmjmxB9k7WmfWyZCMC/t2O1/94DRRFBVoUkmchgU6PkK3upgDH8zM6e+A?=
 =?us-ascii?Q?r7PbFk2QLYgjYjlX6UaYlW1MLhrAGnVLef4p0gxjI3OEqXHDHiF4TgoyC3YS?=
 =?us-ascii?Q?7gKHXEzV/sCKDeeVsQlzzr0Jw3XiuImgMu65Ye4J9YGJbmrg6DhKESI6UbPI?=
 =?us-ascii?Q?W221I21GVyVxkZfJZZ0mQusr2wS7VPPWy7hXhCnA3n0flZM8VeGuYd+x5clh?=
 =?us-ascii?Q?JQeN84uJyFH4OQpEVBwLqZ5+4C0blhE9rTJiERlij5/0bL6c346MuG2JVJEu?=
 =?us-ascii?Q?nf9Qangyd4Enx2HYiNifRBO8jB5J71dbFQJd7CBJi+hnZdqoEX7qELAtpEo1?=
 =?us-ascii?Q?X+wv91SGS8mvNOW6PhRR0vVwh+OUu4m3izzezAghAlatFMU6r9dpBmNESkVA?=
 =?us-ascii?Q?0uXdcjYkmSiXAzBUHO4sar3Xiw2sD3NmcWczdgdKlgq5EmHzvNMTKJtASJ35?=
 =?us-ascii?Q?x+HdnHKrcZ/n4xc3WiRj8QwXABePOK6eWJEFinsK0wNaq9fKLxzAaW2KdK3/?=
 =?us-ascii?Q?XoW8EtF3HepclkH2Q/DFcmQ1j0Msg4k1CHMzoZz/pS4TCaK+wXWEnKcIBuqQ?=
 =?us-ascii?Q?JyBtEZJQVozvnfkYr9TtfFv5++7Z3MJSr7kgXxZ4uJtOtSMWTrxBH9GhpXLa?=
 =?us-ascii?Q?z0PN820JoQxhFqRq4sdlUQOIPUvSujM3AOncDssLV13dlof+mKYksVYV12pc?=
 =?us-ascii?Q?6QteCceC9BIzeaWF3CnZLM+jWJzUVERqT9k7qcq5hoapr+jxb5rq2/MWL6xA?=
 =?us-ascii?Q?4jlrLeillxTuVB/33HVbdBk+mNuGb078jLYt7TQsL9uZzkAxjfaDVUmUk0/3?=
 =?us-ascii?Q?oJRHe1uD4i8ExCUtC6PMRaL+Gfc0aM4pWQ5cDDWAwHUPCZtlGpLNB5oOVY5v?=
 =?us-ascii?Q?DBJns0EuTH4F28TO5zFx5A5XFmy+R/5skEikrE8vSnVCKqlrwvh4Sgw47tHw?=
 =?us-ascii?Q?7WBTZzaGeuhzZJL/bA58XZ8BiCwvoyG8IXEIHTalw+mSPwOg0ZKiwJ3S7BAa?=
 =?us-ascii?Q?106tlLde0/QXWzMWhyBaXSDVK4XrvJyMPFIe5w1D1VZ3z+maYEhsqdtyJBzs?=
 =?us-ascii?Q?Cf8P74uoDwOo3XA8Dk/igTm0RUiovsJplE9krLPu3LaBqbIoWjQw7OwPneMl?=
 =?us-ascii?Q?7lLR1Ag8OdTLPaXKFvnjpNYe48SyzqLXkcRCrYqOVqADmY/alhdkjMpd5Yko?=
 =?us-ascii?Q?NIsX7Htno6P9/RZWxUqZk1Vl69BIfHGhElwbPPjhNKgVWfhyrWoO4pt9TT2B?=
 =?us-ascii?Q?supF47tOhXfLWnM75eJd66jYc/qYlt6Im03YW9ORKIsCjUt2AC0Srti++q5P?=
 =?us-ascii?Q?L7AZOaREeNbJ48zh5TCRgce1X0x6RCRMSsffW9FCTCf391Q5abppgutVfPUr?=
 =?us-ascii?Q?DPj5NRPckTY03cSUwCCJ3MCIsW4B1/YxkOTUDrWh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7a9277-08bd-4df3-3a04-08dcddfe4e7e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 07:39:09.1290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZlKF10v8A1gvpfEElruQLhFqB95mxQxO/K8NtW+JxG9Xfuqfkz/pUAluZ7WgQlfxJE2334AzAIlgc+Kwf0Q1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10893

make dtbs_check has below warning:

/home/nxf75279/work/usb/arch/arm/boot/dts/nxp/imx/imx6q-var-mx6customboard.dtb: usbphy@20c9000: fsl,tx-d-cal: 5 is less than the minimum of 79
        from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#

According to schema, valid value of fsl,tx-d-cal is from 79 to 119. This
will convert register raw value <0x5> to corresponding <106>.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
index a1ea33c4eeb7..d3396cb81912 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi
@@ -529,11 +529,11 @@ &usbotg {
 };
 
 &usbphy1 {
-	fsl,tx-d-cal = <0x5>;
+	fsl,tx-d-cal = <106>;
 };
 
 &usbphy2 {
-	fsl,tx-d-cal = <0x5>;
+	fsl,tx-d-cal = <106>;
 };
 
 &usdhc1 {
-- 
2.34.1

