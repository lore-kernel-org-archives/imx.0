Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C976F386C09
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 15:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367030; cv=fail; b=o6kqqhLYaKm4SR3jUSHSMjnlOHA4nWyatuLIbJYrQYUERQVj05nadKCtWrhesw06T2u5GglkBN9pUHIzylls4U1HSIG02+4WSOL7JzgAAi97TQ8KygIevcA6GiXhLnGRRhCgfGfh3LhgHNqvlkDW5x1zQMMdTJ6z7ZnNvpRyMNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367030; c=relaxed/simple;
	bh=bo63+9Ka3+cl5GlVfppulSwZgkmF2QcdxCncxtTsXhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VF41QMJd+z9NzXgctu4mg785UHcn9EKcbKCEcKQFhlozNFUkG5UMcX0jD4XR4nI/U7ovVJzbrcCJMK5jdblKo3IWJoeOt0RlHwuyHmqEnozzQxIULvrzZJ5j+ogZfiV1Xv4Dj0XQmd0DVanTPRCM9yqCrrsoVI06rDhT1qIoxyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rxvx2HIQ; arc=fail smtp.client-ip=52.101.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rxvx2HIQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lefcu8HHuTfkAATdnvFJzC5HTOCfUclItvthUIBudoPkYra0jfvXDQbdLYL1qTFRSLkj9ZI7znw8yJTzq3V/CBJ9mMuHfAYzkE90LqZAcgTokxzuK4cOJne21cry41e6HE6yl48itRlWmJUVvmMwFeJnusndXrRfFtuaCPs1rxb2JkzT7XNtBwDnzmGaSrl8b0ESMgmFUVNNcOvlN/qPmpmkBGLYqsGu92yQp1qs4PSJf5dgTrO5O/Nu3AoYXF+2Vnmd5YDt1xMGlCTFxXhbh7Dl1f+ihS9/HUNfqB4dYHxcWiRbedebGSTvR8naw6DQUzNC/OndRP+hjdnGEXvNkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQlICMSOFanOhT6EgZj9HBZrBRwMw7JFCn6VEXL06Ds=;
 b=ZXbPQNg02Z213QlDd51eoUm7dSZbqV9XiDcJyRJOiTEaVUAf8wV7/W9xBIqQ8jcgMMW/W8R164ihEHEholcvRX//pkj5JlhPJAwIUfDEixn+RZi6gOWS8jFGTiShyk7ivlNT2Y/7QF8vgiN1QipEmb2l7mPgaDY5sh7jy38AYNc3YLd/TaH5l6tytoVTzieY8nso40x+jRZPjJ/bUpEFoWoR0KYmppWZRQR2SusfwCMQjvHc1h/2yhM5yQ8tjPKx22eS5Xh/34qaVyuBKdKXVCGJg3aDN1ZKo21wtgWZz7Ez2uJN49lLYE7z12kuuAtum3A42ASZ7sdDdgkAkfM4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQlICMSOFanOhT6EgZj9HBZrBRwMw7JFCn6VEXL06Ds=;
 b=Rxvx2HIQP+VR5L8G7xF2x9yeSPgmIFtEBKK73U49sg3KvKNtshs984edxBnKfhIzVTr/hveLy44PUH0SxjZafbygDsGB7/5Mv5emKixXaPonSigIL5JwLL6/yQ+mvG6XEHo47YcvgAeT+Nfx7w80L5qHSSlB/SXQkE1cmHkuhC5I5nRVDK1u9zKzGlB10zPXrB5VpEMp2TlKfLVqSQr3xCAAxYX5kXgyQOz0qAtJtUGE08tTCEnX6+5/h1djkhpEg+Jx0APLZ1u/ln3CHXdRu4ZoJPfpf0AIxkzXYGLtzOYIo0BeUf4X4wQ3vhXSIN3h/ocAGjg0Phc4a8tMvfyeOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB11955.eurprd04.prod.outlook.com (2603:10a6:800:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 15:43:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 15:43:36 +0000
Date: Tue, 24 Mar 2026 11:43:35 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@dh-electronics.com, linux@ew.tq-group.com
Subject: Re: [PATCH v2 11/12] ARM: dts: imx6q: Use undeprecated reset-gpios
 and drop reset-gpio-active-high
Message-ID: <acKxJ7gWk5n6Jk-v@lizhi-Precision-Tower-5810>
References: <20260312-dts-snps-reset-gpios-v2-0-0d5040eb4a1e@oss.qualcomm.com>
 <20260312-dts-snps-reset-gpios-v2-11-0d5040eb4a1e@oss.qualcomm.com>
 <9caf255d-834f-4407-afd8-7eae9c0f3cb6@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9caf255d-834f-4407-afd8-7eae9c0f3cb6@oss.qualcomm.com>
X-ClientProxiedBy: SA1PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB11955:EE_
X-MS-Office365-Filtering-Correlation-Id: fa201e6d-b3e2-4dc2-5f4a-08de89bc1cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|7416014|366016|38350700014|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ITCc2hLou1V/Gy0UpW+PI7TCVuI+ofLE2SF0rJ4d+hyubw4q5cpDX2YO2hrN/ZHFgcRqHEJwzAVn/zUsxk7wold/ak/cdn4QPtzi5seWn3SZF/xwyn3btQAJRZQ+WSXEa4jAuXP97nGj1z8hetBChPEGxm06ubnV0cBqPxolg0AryVlat/oA5lbOcxxf9jvfLE1mR5Sl8MPwGgja3y4e7KbQpjeFmq4NtHcqOkEDKW9AyVRjw6n5aK6yCwZYngI9+y9TCxrz1luaahZL6WT9NtTxclZh5YCgNo5tcP6Gn9zvYCow/IIN0NxojLmkJV/IOVALMpao2I2cGEF4iQCTyrqadS4g58we2cpuRaUyrKv4fY3zKiLku036pW3s5ifBF24AJgIPfIazWmu72kH4grnzUsf657tZ1og8lOSzEEWCdRQRcbj8b2RJaO3JSAkCUtptFGiVckpmcPwh6K/OCsTh8uO0dkK9yrUXN6eeamTwoXoImimms+mKdoPmkMPtfW4bHyV1qTO9dhMz10io9WIrh3bYyvVrgclGwN/WBAA1rccr2LczjQRuq4UdRxGgSEpb6pKiN5XbGc+AL/HDjU2UvGmz7pcI+haXCTld66SjJPHZX5K20jzt6famS4F0i+R8xSymxKDw7I46zQCjphEhaYEx6jny1OJw5qbOa3+MNZRC6YOVIGOqtYzdCAVnSWNdvEsa8R6ggDSJl5RXU/62wkkwtKtzmJEVyMWNB4aKMDUg5n28EDO1/KoBbJgp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(7416014)(366016)(38350700014)(7053199007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yn5IrQfUE8ZLt60EYWj/zWfANuWlEsbAcKYzLe/LtTkqeELvuRthHCFlPoir?=
 =?us-ascii?Q?PawnhmbhUkzk6FU4MqnbzOEIfovTqtnjSQaSN2WsN/sCLcApijLsAG4+6ssZ?=
 =?us-ascii?Q?dAnDebf9SKj+FJDgipsWVR74bDTc9hUSHL8J3ZV8JAyJ3ngc4hqC7T5rYqvo?=
 =?us-ascii?Q?FdvBCCVbtdv96TtJkgAL+BxOuC+zkmhzaRPWMInBqvdZ/FKVlDYZoWaA3ISn?=
 =?us-ascii?Q?fkuRy8EwtltB3BJDEa6J/VyklhPDvgJpx+OHpuG11z5GBXqb6b+opQ4e/hTN?=
 =?us-ascii?Q?tjNlfdVDDMIGoNLC1YU4YUGLKGoTgljw2vfE91Go0TBcCZg+VRkTWjPkmkar?=
 =?us-ascii?Q?sc28zykqdLiIVxM0JVA88GciMXGPKozWfxeYJ2XlmC/rbqoVSGE0Q6/A+TdQ?=
 =?us-ascii?Q?/YdS+JqIHBSrvxTIM+eWXfXbs+YZxi8NXjSfrFrAt2lev4QARtfJoYY+H07E?=
 =?us-ascii?Q?k+2RN+IAW5Yvbz0LsWjr6dXrSND3kWJlep11xdQlkKqWyaMazUMEv1+KBmjw?=
 =?us-ascii?Q?OSDhNsgFeKuLWv7y1oM4BquA/yY/7ny32OAcrL4VjeZXVKq/2tKaQE3vAA9Q?=
 =?us-ascii?Q?axWa3wE3OOxPg9r9eqWLqgW+9FsRFa5vkHHsBUUxe7IY5ueAT1m2r+WtBZxa?=
 =?us-ascii?Q?kr1fCi0pRdbH+TL3HZh/4KnzT9n+ey3poaUnVWbGR0bQCLmIs08KndMSE9XE?=
 =?us-ascii?Q?Us3i6DS7J6z4kKpnPtxRKiWgqcpCuFxf6pgHbdMoQrwW6FcdBl0MgJdk7jpK?=
 =?us-ascii?Q?j7Avfe3T0g4JNeInpUtUeRkEPebjeMLcKw8SR22lvG/kmMm4no2A0HNc6972?=
 =?us-ascii?Q?vqZFfMmIGtTHvMBiSXwXSd4yRxFu/SCSmqInb21kMU+n2i1w+Q2Ot0La85YC?=
 =?us-ascii?Q?/yighC+F13gVRRsQGJxvM47wxE635zfzA0lr2SQQAHX3x6+YNWHQoFEr8nSM?=
 =?us-ascii?Q?9EA6LvvUHmOaYgavHf0D5EFsLszTonnEHtyuBd3AWxrFouAVr5B8wniggFyr?=
 =?us-ascii?Q?Ox3eaP+y2rYOweP/lY5H7EE/dEFjXxOrvrGxNJHqoEkeN0xidPv5laOUEZ5G?=
 =?us-ascii?Q?mPOvD1HWrMHt0iCEcsTpj+3hKRC1tV7vKwZkmqtGJtorbfcr41yjxBJ4TxDj?=
 =?us-ascii?Q?scK8d9rKRdJrg7fDO1li3vyg/YnDAWu00SNThFQhEXYePrPwBeOLl0G9gocb?=
 =?us-ascii?Q?Li3q+3AxGmSe1EBddAkVNsT+ILpQh60dIGT5mqPOGY6j+zeoMeGju2uasgeJ?=
 =?us-ascii?Q?Bk/GJezKyK2PvneUunNJN5FjdQNCGZFDFHnCGQJ0hfnNZU9S1CrUAT0XcAId?=
 =?us-ascii?Q?rR7BALCM+PpM9pHWFJCtnGlSnZke8N0pVedx10gkoGmcliHzmRvUr+RYuXDA?=
 =?us-ascii?Q?AaYDatTDIbsBi7lJ+1tSJMkwJ73+RdserYP9k0HzdbBW0Q22MbZpBkbABU0Z?=
 =?us-ascii?Q?sGI4AeZrZjggriO9kq0KMQmarPFHKa+oUE5FVjk/AAAv5rqTqpY7ncPJ2TlO?=
 =?us-ascii?Q?pkB+X2HYF0JnnLgXSBIO3RVtW4kHixB23fwhjC8G2QtED9wk1fE/YgpQN0zV?=
 =?us-ascii?Q?EUWx5TUVqpIt3/rx38UuheE+VnIcBks+dDI9eEUI9soFhcPscOi9wm8EqIie?=
 =?us-ascii?Q?k1MbFtHOCeUHEXtA3tMWdsl3kunzXPODE6XnHDAvuby+xzkdJbknkqbI1PlU?=
 =?us-ascii?Q?+qeWwOqHDBT8dnAKiFykKDOjlI9Sbcv39TNIFA1U/XvZG+KK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa201e6d-b3e2-4dc2-5f4a-08de89bc1cd9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 15:43:36.7184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/dTsGi5tPXa+xqkk+mhV3jD32cEWCeEDAk8VBBTjkACwXHA6TLWuQUGfb7F+9vb9097V9LwVTBOOHbJScgEvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11955

On Thu, Mar 12, 2026 at 08:27:37PM +0100, Krzysztof Kozlowski wrote:
> On 12/03/2026 20:17, Krzysztof Kozlowski wrote:
> > Freescale i.MX6 PCIe host controller bindings, through referenced
> > snps,dw-pcie-common.yaml schema, already document "reset-gpios", just
> > like Linux kernel did for a long time.  Use the preferred form over
> > "reset-gpio" which is deprecated since commit 42694f9f6407
> > ("dt-bindings: PCI: add snps,dw-pcie.yaml") in 2021.
> >
> > Linux kernel already properly parses GPIO active level from phandle
> > arguments, thus we can also drop "reset-gpio-active-high".
> >
> > However this change will impact U-Boot, because it only parses
> > "reset-gpio" property for imx6q amd imx6sq.  Intention is to update
> > U-Boot to work with newer DTS, but any other out of tree user of this
> > DTS which did not implement undeprecated "reset-gpios" will be affected
> > as well.  There was plenty of time for these projects to switch to
> > undeprecated "reset-gpios", though.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> >
> > ---
>
> U-Boot patch:
> lore.kernel.org/r/20260312192605.131132-1-krzysztof.kozlowski@oss.qualcomm.com

Krzysztof Kozlowski:

	Do I need wait for uboot apply patch before I pick up these?

Frank
>
> Best regards,
> Krzysztof
