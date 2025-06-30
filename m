Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9AB244676
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 18:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751306670; cv=fail; b=qT9bKcBVOSJU/oqVkNXb/ul6z6YE54nwxAkREQV9Cz5FcOo1FEAc+eexUt7ULOSJcszjRuFZSbfbGLmklId69ySmjL+1Qq9EXN3r7Qn1G1Inkx/wol5fvv3Ny+dGNZiraci/ipBeYbagplhdbcE3xdvJ07CTmvxYLaHMqCYzmaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751306670; c=relaxed/simple;
	bh=yUK7fIBiGKyb9bm+q9IAthupq9rC9ix1RhGVmWxtADc=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=ZmSfFky67BcfIOAUkOBvJDsuabvDq6kBzaOzQMgnRbEQpVqTdCF2IxjrUToTB8zY+KHmInFNHwMZ+KJW7Qhkr0aIcm7UvbI1Vlq32egNMqxYGZXWxKZTFKlgwm7B90aRR0UZLyP0druKB1112oqeTF8nFf0swIVutfvjvKmBBu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V4s3lRSd; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V4s3lRSd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgRK+SpvxSSOiIe71n0FogCKwQ4OXFBbDklUoJOkMRygUfoxznYEKKFszJ2sqIHwabwvwiaw3aVKxHD+TpAwKI4weR65NlGp5lZTwaVcZB5TC+eEKO+vnx/7c7bZlfBCI+RxAaXdZtamvlgFKW3oC6pLpFtbyv/45t7Dy3LIyiWypEXJJmgzL7EWyhnu3eWxQ7AePYALGKnea89PvdqiI8KqMyBID9E6cQ2uML3qKSW6sjUikqXMRV75po6Tug8guQXPhQY4RtAxFH1X3nQ88Zdjsjv4Ge+uFzcxWte7075+6kyFa3xPJv26lphgmpcLVbnFECEsLmQOXfhPDWW6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIbCy+IWH+QopGiicAekcQlrWkIwK+L/CMQv6gkLElo=;
 b=y+fXJYcHvNnidEkHkZs4u39EYe63ZTWzJE6iGjPtp7HRtMXTuzHo/3Y7z/bRYeqCeZIMr75M99WIzbNK8sHHUfdLjarw+hTyhxapzGYUqpbkTGLGwljU+zTifUjl1gIkm6Wtt9jvwlFzwUQk1Fx1HO9m7wOqgVfTyiK0DasUckk3Hm0ySchgftQGtGcWOzR8dcDTzcmHRfshLGiB8LaK05yVMgaEsO8F3sW0/342P6vgGfiqNf7Qvg8MqDQofmekXrEzJfqO6LAFHoSw5ZKqXuvA3+tuWMzJIyLLP4NazEKNasRkxe4XMqHDd6kgW6/JizSW6wxX/ZXzFsGsLqe7PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIbCy+IWH+QopGiicAekcQlrWkIwK+L/CMQv6gkLElo=;
 b=V4s3lRSdeUTBcU0/FwDzMMkEaKicedhJyykAie0kcy1Vaz6RycvoGDgXS1/GbKkAN5duPOLmaHLE6YbCPJ2dKWCBuOw5SOCeCte7sl4DkIgHxGfTLk3GqpLwxkJXSKhrzIf7aHV1VUOHBZVnD42ACjdpleXza2Ea32qhFbQax2150LduEEuGrwNdJHyDEPvYEUV1bTn/QiOYZXXdN1sYXmM4ryocfxzHJFVHZQ3mJJyQ8i9A0FjVRb8UDuc7c4/7UOkRfydwIVvkAd2jrMwCAxsqKQqzCpgasvXgAvME+Zb5ZI42czQnJVzmsDKYMR3IIbzRyZgZcqJ6Nh+hPVtf7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6834.eurprd04.prod.outlook.com (2603:10a6:208:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 18:04:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 18:04:25 +0000
Date: Mon, 30 Jun 2025 14:04:21 -0400
From: Frank Li <Frank.li@nxp.com>
To: robh@kernel.org, devicetree@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, inux-media@vger.kernel.org,
	imx@lists.linux.dev
Subject: Compatible vs onnn,model at ap1302 binding
Message-ID: <aGLRbiqT8qVdG40z@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c6ece1-958a-4a80-0f20-08ddb8008c5e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?v3TTDGMsVbSUQX+1SsGgGfRRVGHeiOAQRjGC0I0Sb0KlOU0InAP41gf3dBFC?=
 =?us-ascii?Q?X+um5KjnX+Yi956IIBq7jo3i83E5I+TvOCVyekfXr7xBZDSfdTifMB5LAwTR?=
 =?us-ascii?Q?fwHFxm2Vll+Cz4dh8JI4JYinGPBba1gV6ho9NNcjCkps/0ts/AVP5L6he3qJ?=
 =?us-ascii?Q?xsjCt9JENyL0Qk7y5LmOWl8CzAevyoX1dARqCj91NxZRAIECYlW7GghUq2/F?=
 =?us-ascii?Q?CC+SHXL6hiR8EHkaTqoS1oIPoSFQOE1Gpb0RAhkgf4fbkd7kApYka3FOOfYY?=
 =?us-ascii?Q?fJ2m17L2XdifFBxe33dDASRANMul5Yndmrhvi2TV6UJG0VHtO1ciMupDaPpC?=
 =?us-ascii?Q?Y9Mke6e8aaIBitT0NkqttxAkdYi8upMifaEbwhv6ZoAjr17EUKJnrLlvnyCP?=
 =?us-ascii?Q?AUqbKzD/hejTmxOF80kxO+9x0VnVLB0DDdXCBKJNv7m88iITW9afJS4g4bgO?=
 =?us-ascii?Q?KjSnjO4PkTv2wXMAuu8pzRl1EAZBUunJ8oowaRh8aZevDqPE0koXLHf/Exv4?=
 =?us-ascii?Q?J0idoVSrH2t9v52YDMwYDtbIfiLTw0czyVYgNNtT5qeN0NXmT3hqkJmJxypV?=
 =?us-ascii?Q?TIO6Jen+SX+BeeBw/Y/XWlpcqAc6+YFBt0VEtQnLT7E2LYYhFkfxDRA7Cr5R?=
 =?us-ascii?Q?MxewOcl/TtDPIC8gYJeaF994Fu3QWzDsMjlhu0hTyXYLyo6rM8C7kpoMgEa7?=
 =?us-ascii?Q?360K7tj8wzuUhlt2v1L4EOgj7W/UuK8th3nmsS3Y87a3fPRNwQg/V3h2TdV4?=
 =?us-ascii?Q?gLpWaRHVuV5FzVaztzvF4b7lgl6afVzrGbXRoZotBEfAKzdEuvqR0rUFizik?=
 =?us-ascii?Q?vVtRzPmp0hDNYds9CNWeW55QP5G0TrXBHj6cfYCLcz3hd6X5G5213qwke2E1?=
 =?us-ascii?Q?KnJ/wtaJXFIlk0us1mLUWnseLgSfpBembB0CgJd+c5s6oaMutdi/MJzJHHue?=
 =?us-ascii?Q?8Oz/Net4BC/x5rQ8KhtUH4LcEpJX9kODEz3sFNZezTKA/RyX6LzYrbKsR27H?=
 =?us-ascii?Q?zB94b0Q2KL+cxJSqXicBC0ji3saBgoVKnTivmKp/z6m1nAOYrAGDYkWXEMP4?=
 =?us-ascii?Q?zqrzfSvbnoYOe9j3TW+2o2wyo8+ftS74FvP2Z5iA7iCtSSSIG9qrqFGBXIjC?=
 =?us-ascii?Q?PHRgSrce3tfiLnjVgRAjD7lwUraLZjKD215au/WLg4CcW68nxZE4qqC5u68B?=
 =?us-ascii?Q?rKcofhcEgJKup/fNafn+kMHZ33QTUPXlwoMjqmorlHT06LyL+zCq42THekU1?=
 =?us-ascii?Q?4DY+AVcxoA2SGuaoZhh17rTeGnYB0DRZ/qoW35n/iXI9GrU7+iVJ0tORYpnX?=
 =?us-ascii?Q?oJ64HYwczXCpi1Z2ssXNutnxSeB/cJdDodaGa+9l5y+spVDOOBTbFH1AECA7?=
 =?us-ascii?Q?GuR/AYZe+PDuxckLgXJgSlf6QaheEm6sDuf0XbZa93is7MkEq+F5TZG0Afoa?=
 =?us-ascii?Q?HnXTa+3NqC0A9elwwqn1hiVsPSJj9AX2dU3wakJRj1fm9IdevZDdx6+0NuJH?=
 =?us-ascii?Q?XS+IvvntijUQoQw=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?EqhU7Wd2z3NmVNBf4JJEqGM8z8T/WJtGE6LAzgyZ4DWCywR0J6+deJbZIecZ?=
 =?us-ascii?Q?PnQGWIUF1aWTOzfVDhB0B55TpzLhTR1RvS9cQgGQBi2t+QW8KbqCOvn4MtdR?=
 =?us-ascii?Q?SFjg9KScbGMtVODe7gvYyckF/gbTrHlvAsYd1EIBymV2l95CHqKn627TsVNT?=
 =?us-ascii?Q?yhV//FFqZX/a4AhoGJQ1ZASDja6FdlyygzdlyZcGPdEZqQZTKr4XXbzHNLXf?=
 =?us-ascii?Q?OOa4K0I1Lw2tK+lEFo4QtdFgcxiW4HGp3SXZaWNhSjD7EQtJ0/uhAVQ9biwi?=
 =?us-ascii?Q?4YCZDC5ykR7Q2bepOJZnTwSiTglXLhXmA+5Sp/77jiZ1S2ChRRiH/fQgxOpg?=
 =?us-ascii?Q?s9rzeMEzL0wyymQ/GrcyhA2bXERCFzJslFUwtolkE3xzYk+ldvZil6nFGYek?=
 =?us-ascii?Q?iwx661PP1qMu4cOjgSimg8bwB5ASolXLL2pYdgIjVmWK8S3xgQ04Ou0LfKXv?=
 =?us-ascii?Q?K8xRTM0CCoGDFfq1ly1PaXxVudcvoYGPuJtH4iMRzB1jqR5Yg3HRErsZ9v41?=
 =?us-ascii?Q?mNPvRH2aG2xzMzYkO5vT1edHmDKWXnb6lMt9CbzjcV/6XipCv+ZHgJa7im/W?=
 =?us-ascii?Q?VzFF4XxYQRlziKPa6n5qlAFU4oyuU7nFs+phifgdYMd0NiMiQu3vuB+SYSI5?=
 =?us-ascii?Q?S8UPGMlj/lMcW7kHLfdhc4YzRRLA9j6eNFd22QL68flRlsSxfzqoDx4A2LNm?=
 =?us-ascii?Q?pFCYUE6MfC4ZABPGF7taPq5LbVU3Q7I+yi9IOmuZ6rFW6iGrouXY4V40VMbL?=
 =?us-ascii?Q?cSbfesAOxtEfJhNCzQzT53n4+EZd8OWkOmwduxhOHvCYXyA96wdUNVX+RpwK?=
 =?us-ascii?Q?wZSGFxgaASLByb8pOhxTqk/I5ajhByMAQFnPG4lPaTs2kXizYNeECfDJqBq5?=
 =?us-ascii?Q?w8uDRcA46Jueq9rO9Px3dOO4nfLPKOx4h+qyUveawb9501oo8DUL73v+vIdn?=
 =?us-ascii?Q?7AGM4/WX7loxpsjChrY4zZ5FujsOZmWlKw/3LVIYVRvh+gAluOwDcMfk8s3i?=
 =?us-ascii?Q?4SC+FznhRQqBnnHiS84yPl36zIi6gOzb2ten/iLOzmZkpNJTp2E3hoeOaESa?=
 =?us-ascii?Q?PXn788g/MqzXG7u4L0977OVJKxzAqQlIKdsxX7y6ain6CRrldmaV/5iImPBd?=
 =?us-ascii?Q?BrOEB/g0u4puGqL+DWmMEboOILdFcLe2i6RdmqQOtAnSut5MgBGxJZM4vcHi?=
 =?us-ascii?Q?cE76kwtfcFdX9xX/6Upxs6k0Z647jMcd/lzK3Kt7GbZluNlWLqWvPwZK5gY7?=
 =?us-ascii?Q?W+9xDj+6tSRvqPo7UesURaq5bQnkynwgFp93lgDT+uCWskYoBbvkczijSxrC?=
 =?us-ascii?Q?sYG3l5GeyWwKIYmC7Ia6CrfLsOO9JB/ap6NOQ+O5wcwZeEdTZtqlI4/e944n?=
 =?us-ascii?Q?wIYZ4d8vzsAhMWTntMkmz4dAwugdJ6j/84pi0d8j/rC7XNVKqxsrQUfGSc8z?=
 =?us-ascii?Q?rN4Z6/LMPa0peMsLW8OeWUhpY+yzobGVBcApZhW8+OsC+u89nIqyfRospzdY?=
 =?us-ascii?Q?deG0Tw7LCKXZG+uLSx957j5xt3LqZi1TnEKtKNK47Wcp1kfMJQCnD9KLAmoD?=
 =?us-ascii?Q?msSyZhf5asUfWOYEbyI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c6ece1-958a-4a80-0f20-08ddb8008c5e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 18:04:25.4885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iU/U2AN5kogaTC144Y3NS4myWIR0IGoLiHZUoCqELPB938tpyDNvssqvZxbaBJGakjnmxqxkUIrD0FDbohfSGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6834

Hi Rob:

There are long discussion about AP1302 support.

https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.com/T/#m9ecad9fcbfd1ac1c59b3aa5737e3860a64db2eb4
previous thread
https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-email-anil.mamidala@xilinx.com/

Let me summary the key points.

AP1302 is I2C ISP processor, which can connect to some RAW sensors. such as
AR0144. AR0144 can work alone, a RFC upstreaming at
https://lore.kernel.org/linux-devicetree/20240630141802.15830-2-laurent.pinchart@ideasonboard.com/

When AR0144 connect to AP1302, it is not 100% transparents for software,
It needs power supplies for it.

The basically there are two methods now.

Method 1 ( Laurent Pinchart purposed ):

use a vendor's specific property like model

camera@3c {
        compatible = "onnn,ap1302";
        ...
        sensors {
                onnn,model = "onnn,ar0144";
                ^^^^
                sensor@0 {
                        reg = <0>;
                        vdd-supply = <&mt6358_vcamd_reg>;
                        vaa-supply = <&mt6358_vcama1_reg>;
                        vddio-supply = <&reg_1p8v_ext>;
        ....


Method 2 ( suggested by Rob at 2021 ):

use compatible string:

camera@3c {
        compatible = "onnn,ap1302";
        ...
        ports {
                port@0 {
                        compatible = "onnn,ar0144";
                        ^^^^
                        reg = <0>;
                        vaa-supply = <&vaa_regulator>;

        ...


               Method 2                              Mathod 1
The same hardware should use the         There are not driver to match onnn,ar0144.
same binding regardless connect to       AR0144 is not visilable from host point.
which bus/devices

                                         compatible means software comaptible, but
                                         there are not driver for it at this case.

reg in difference spi/i2c also have      reg is i2c's address, but here is port or
difference means.                        sensor index.

Similar case for spi and i2c devices.    There are difference set of mandatory properties
                                         when connect to ISP or SoC.


Rob and Laurent Pinchart:

        Need a direction to move forwards!

Frank


