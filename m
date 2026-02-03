Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8D52DE1E0
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 08:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105664; cv=fail; b=GOuVRtwifLjaFW37t91a70WBF4ZIWd+7KiN0/Sq9XHWuxiItV2EzsR7/W+PCwENewEMdlXAocrM0xByyB97OXmiu2LPKXwxbfiK4ncIkt+Tm8TJZ5a13Yg9R281cMGCKtBWJW9QUaaIbnZbPYgOuDmwKXZzJ0gIG+OzUYH3pc2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105664; c=relaxed/simple;
	bh=qCVYMADCLWFuGevzlGk8b5zN4HUvKz/YBzGjXnSy8/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JNKkRemCvaSu9YaOby1LunVw+kldl3g1DuQ9nQTCyAZIB/9pFS1d9PdjWKyFMRiRJN0KuTg6MsdKyPhiJtaik4peuCSM4bxvjlu5TTn1mL98LgbmkCeVtPjV9MoP4SdGdDKqec7LrsOjWIsl/M3uE/s6FbNU+6hAqIChFrlF1uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VSCpkhiL; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VSCpkhiL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkeivhbzg9PZQ6F17afq4FFGXXi/W7iYu7g2rMK644vf+9954Av4j0Y0bwv2hs1ttE6VthgJWWfUZl5ob3RFjRKCWuiguygRMYVcNdprC1VeP3rec5TM7aAWyKZl6OYX4hyaqfSVf/fdJjPJF23CofA669DohBGjrcvj+nGmLO+ALOldkEOJyC0L+b61dJKEpJZoNorSBAbL8Qq/6wBwsPSnuYnqaGovIaEt8GGZdS2t1GWPKztWjiClitBVlWY1BdPU0r84TOngS2Ggr/zKjwtVgT86IfAsVJOSANLXYiTPaoRIIQizTTuMfzSxGSh9zNDtdVKAd3Qz+o2c5tmS1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtZuYBOdvzNNPHoQsFHXhceV/Yl5skaqoqb5vBrKoQI=;
 b=jZZGXZuULGPo+geF9ydKpBXcm3+5H+R0Gho8Qs67IlvnVZ0WIBlFOeN/Beah5Ar+Clsq2xWyvkJmPkiiY4JAP9xj4at9VN8sKFpV/DTJaJBePm8660hvrsojEFEwUiu1SPKozluKvG7Ay3ILAAW9f0BxEwet3XWshnV/2RxmkUELvcOIiFeVjc6+njUt08+yUcCML1bddiYwSy/IWjbsLh1yuGcfWc/JhP85x7fRWLWD3aHu3oaRT9UyZxt5JWACKj44Zxcmj4WaYxPn6WeLe2G3+dVeK0w83Ey4Q56JlHlwW83ZXs3JN+w7CB3nJx97USZu+ye1bOA0NGM0JpTZeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtZuYBOdvzNNPHoQsFHXhceV/Yl5skaqoqb5vBrKoQI=;
 b=VSCpkhiLFzRL+/JVPJv/JgTXjPGbMmXimj23hNQyV6/eWaPfgdKLGy3oSALyWIoNdss1kpRfYVnx69NY/EDDlY+SSxT67JvWzbtA4TJaiPOTlw0q2gYkQM0Pk3qjgi4GlTHQG3QXxACPhyRPIyhSq12jUr5IO4eOFqv/NuQyumgAf5Jx0tjNtux1tO3j6n+t0szqbYN4gsYKw9OuO0fC97d0CJzvXb1Hu2twssu+dv9fP1SklrGWB/dtcaxy1rbecViV1zkNnP6fM5odN8hwnMZ9QlHq1S6mxK+QJaZkGxIMIe5M2xsnEj50oKbxj3drU7BiXjJhdboR0Fb+CGAdvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
 by VI1PR04MB6990.eurprd04.prod.outlook.com (2603:10a6:803:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 08:00:56 +0000
Received: from GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944]) by GV2PR04MB12102.eurprd04.prod.outlook.com
 ([fe80::ba38:9cef:8457:c944%4]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 08:00:56 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V5 3/5] arm64: dts: imx93: Move 11x11 EVK specific parts back to imx93-11x11-evk.dts
Date: Tue,  3 Feb 2026 16:01:35 +0800
Message-Id: <20260203080137.1492376-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260203080137.1492376-1-sherry.sun@nxp.com>
References: <20260203080137.1492376-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12102:EE_|VI1PR04MB6990:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb4ae2b-fe7a-4fbe-5a31-08de62fa5c5f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?SA+Mfkm/TTO9cmmLPWS0pBSVPsk2Elk0OZE47BXIGw4nsss1iDeEFjUIA4Gy?=
 =?us-ascii?Q?UC+OaJklPNAkRIO8pvWnI54onnYD8TbP+1Xgdj8NSPqPTHf5UPPBWHS72y/m?=
 =?us-ascii?Q?ww4wL6wfgNeSzPbcoHnVNr7mFfdTvPMBQcSnXBN5EnKBGnJ8Pds1683CPxGh?=
 =?us-ascii?Q?vxsXxgzI1TiMEO0MGHrRWkabiNrrpGej0Ndv1QT8dke3fqyfO3BuE4pm98n4?=
 =?us-ascii?Q?MNh7dGDa2/DnoGxddM1QXvVdVOubntwXaeUTO4pk07HAkxe+ruAcF3jBfl9x?=
 =?us-ascii?Q?E+27KODHLtXTcgs2PjCfKYz3Qkc/BU6frnQNAR7DQvS4leWbktKFsIfRY9FM?=
 =?us-ascii?Q?b9jixSSGokGhqf3lpzQmjIKDasETVtic8vJmDPVzBWalirINE3n78c0yvV6r?=
 =?us-ascii?Q?99EpcfElMBys5j6fv7wn79J6cJLWlkzhgVUFpMOgqngLwwm+mC2qCp9ofhCa?=
 =?us-ascii?Q?DSb/rz51bee6v6aj26u10f1ZIHPLo+mul3yIrxNXW9ER1L2TmxBTtaAOeS/M?=
 =?us-ascii?Q?jBQIGsZYpqAbw4cL6ZfeldDkpjD1wj4ng+K4JC9N+L7o8D+Yq8nCbiOnDmTB?=
 =?us-ascii?Q?mFKPpBktHWSfpzWeaXdcLKdrv1PKeaYWHgF3QakyQO7wJuNmPkVeKifVyd2F?=
 =?us-ascii?Q?YFqQqD+q29RXErjyJvjJ5SIh6P7FJyqoMiTxOglzTZYQWIFTI2zFXEZvZj6Q?=
 =?us-ascii?Q?wLoGX/w1zjO5bWif8mpGLESUfy18DwRjT6SyLwYgmyFDv2izBK67Ox86npFI?=
 =?us-ascii?Q?W+OPgjbZ7ITogyULA1a90rj0jX7Pt5QVwm+X9BifMwUsZ1K/q4AlYpPrHfbf?=
 =?us-ascii?Q?F6/8TNtUMgy0REuHe2zBE3/NLtBEJPZ51mwA8CiFe6vSBwziZ1rEnFKfrmPA?=
 =?us-ascii?Q?SBVI0c8ZllnWAnyRYDRl2VQ7kygaB96pmi5rgx7WlumTuRUtli/3BhKRcoFJ?=
 =?us-ascii?Q?tGwr+SG9sqtRt3l8oZtFIFf6YvjV2L4QObZv6IUx3tW2QCUvxfIcj2N+Z/gu?=
 =?us-ascii?Q?Nf6oIsXU7RXOIfqcBf2qeXQJFVts1PPP4/lrkm+yg14oSYMiHxyEgkz58mWD?=
 =?us-ascii?Q?KxlD37LaQ975QA92FtLFzBjnTVfD+ph66SZZws8y1o5Hy0rAwQGDetnJAESE?=
 =?us-ascii?Q?s+L0sxavEEizMFakf2ddWX2HL3byhx5ZbuN2CtKQgAAMGLAYCCyCQwSKA6/k?=
 =?us-ascii?Q?rWmywryoNesx/94szSA3FRFgsBFpFXNqwnDWg+hzeE7CZZV9tyxW/L/3ATmL?=
 =?us-ascii?Q?88POKWxFnjSNrf5JMBmfhcJoxkPDV6+Y6///480k5I794QAFbO1qxGfX4S56?=
 =?us-ascii?Q?2W7kpMLDZ4P73nxaleSoZL7UQSGiYbRJAWRaGtvY7nt0p4aRw0YY//b5LvAT?=
 =?us-ascii?Q?sHX0lsuFFOm//kkVqSfN7z5HBepzF7TZX0B/k0MVKCRrG2w3LSbhcVaykp28?=
 =?us-ascii?Q?AjdzE9ainvaTLTMc1khwLb31DEJ2+b2emhGh6y6QDUoJm4UzxFDBfY6gGt2E?=
 =?us-ascii?Q?P0gGKFombuq0RHCaRFyJ38CWbf0IUU0l+EIkS1I9GmeDNfrEbE1FruRmpCWt?=
 =?us-ascii?Q?CoNp2w2IjCK2QUcsLzW8qkJH3tDX2wtsYT9SNAcga953lmLLdCtq+mpkgpHN?=
 =?us-ascii?Q?8zKSpRlSmJMX8WH7JUtRv/4PgUPzatBxCgAqdOWT/IdS?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12102.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?JF/PJ4f7kAZ92K7rkbyB4r/klUW2jewFmUfpw+wvpdhFSDvaYN96ZYjzbQHz?=
 =?us-ascii?Q?fE+Rb602kKjNv2UXazBbKhRhsTck5rTy0ljQpRX3ejvv2jsTyWuz6inNjSBV?=
 =?us-ascii?Q?NkhAfMEnYKU0gx9IhZRcXmPLvpX2cweK5M95nDsUd1lXKHlDINsjRoP9XS9M?=
 =?us-ascii?Q?VVLMjuO9Kl2SyJyWj6hoTfy4wC8LeNNlRQ0nxBYW6q5D6H0kyoH/qGcvWFoL?=
 =?us-ascii?Q?lMVQE0FzdWfHHU0/csbFvSl2+VkP5za43R+XQpXx6JoTrv17Uf5RDHbHSLS4?=
 =?us-ascii?Q?Lwb9CEcfY3rkYHHm2Tn6H3h3AHJ6Tfy7qUIoWL6yRzPwdCnPOIRve4aaMvT/?=
 =?us-ascii?Q?f3z9/MhBfvb09atiq+vYiYBCZD6fmQlZ7TNBLexVtlosxwlNnmrM/DBeWrJs?=
 =?us-ascii?Q?IOEIFgMfjmEsk3bH72QLnEgsHbulAvcTztgH5Ayly2JiqGrxMHfHDYJ56hXw?=
 =?us-ascii?Q?vjNH/7TJBu9qEBU1KrACPE7aaSdwj8Kv2NbQVFpWVXWRbvm2ptf9wRotwC9Y?=
 =?us-ascii?Q?V7RJykW8V2yOnAVioWliyQQN4tp1RGF1Y6epyrCOWA9n367KJ4elY7KvrbN7?=
 =?us-ascii?Q?qEga8nIdpXNeGIxUPrJwZFvlBSSrStB5jheXpkASR/ra3rUIsuLFl8A323//?=
 =?us-ascii?Q?0eJSON/pI30J9UjO6/BKJf/EL2N3CXZ1LKU67Kb+Wi6jB1/Svh3NZt0CkqLH?=
 =?us-ascii?Q?z80NbRfL9ptgNGXP7rMkPgt0iTrk36zVzDOuy++MQJA64j1vj91JCIOdqve5?=
 =?us-ascii?Q?+kZPySSVdzhDzBd7K+4VajGqaAVoRYqCuVsytdxch9tRBikjsLfzf9O+rjnK?=
 =?us-ascii?Q?CXP1nwe7OBXlsi9PPX/gY74PBmuizLztFT1Cc/aK3ndYv3XbZE4Eo0HvHl8g?=
 =?us-ascii?Q?u3CVHmizEoF7+OMAM+ONewW39AVI0iyEBLugJ2OdqSfMzy+4VQEwP81Mzz2s?=
 =?us-ascii?Q?lfWSmeS0H0/j4cE/boNBHmgzpoR5u0VVP1CaJL9o1PWolQlYA49gIQcVLn/X?=
 =?us-ascii?Q?7LOYtzrpLjYifCzxx82Aq/5C8qM8t9SDH5vd+yZopOtZ0Q5B/6r82K1awgUV?=
 =?us-ascii?Q?cfVEA7HazT1RKu9Zx9PwBFYSrTO6sQwAPbxdAluqwLAzzruJWQ6D+LvGk2qG?=
 =?us-ascii?Q?xu9TXNS/10ExPJjvBsvGUmk0SRVVhv1WvDoAzJqloNnNcJeb8Uq3NglBMG6U?=
 =?us-ascii?Q?evl2XLt7IPHuUmX23cmQowcmkcvxot1ioMN1Q7GkSO06ewAFVwoVfgGRl8vz?=
 =?us-ascii?Q?EeJFw9Y3ueaaYOF07jJe7bFkuh7Q3MFMAwwdei6evubdha8efBXGg19HPV3W?=
 =?us-ascii?Q?UMflw8CpHPj1IXcwEylelsQFwKzFkRmvVEHiV1OiBrU/o3IWzMlLwLULSB+L?=
 =?us-ascii?Q?thc676C7AeKFF1CvC1FmvUQw6jmp6C80mlAmRd53dGFxvEYwcM+LAhC4NbLj?=
 =?us-ascii?Q?L9nbdvbBqqu6zNotBY55jexrL7Z2VboYw7lYs/z0sVbd9ZJb9jxBSQ9zGlMa?=
 =?us-ascii?Q?hUdpWm2BhuOq3DCxNsjxQ1IkzWGU/MU8SXgX1i+OB2G8FE1IOv6uSbtnmyVJ?=
 =?us-ascii?Q?SAnHFEmEdoc676KJeqlNSDaKpWMMBJRCf+Q1fIVmM97k2t9oeXzSpWMQRc+C?=
 =?us-ascii?Q?PH1HoJ7HWsR29rtLUmgt+O7sBHwukXZdN5NXjebAcJ9+XRC2OAZAPLENdfPi?=
 =?us-ascii?Q?GwaMPApFW4bSDbHCT1BvA+gBgP6K/hTf1Q4+67RhSfsS7Zn/2CKKuIVdCO1x?=
 =?us-ascii?Q?dcf2QYhEWQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb4ae2b-fe7a-4fbe-5a31-08de62fa5c5f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12102.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:00:56.5953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tp/B6FrDPI9ojo844Es25wfIzK21169mS2MpWi87OYj1XLWx3ETVQbG80WxYTNZcfJnzodAMEV4AWUmRM6PZDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6990

The previous patch renamed imx93-11x11-evk.dts to imx93-evk-common.dtsi
to prepare for adding the i.MX93 Wireless EVK, which shares most of its
design with the 11x11 EVK.

This patch moves the board specific differences out of
imx93-evk-common.dtsi and back into imx93-11x11-evk.dts, ensuring that
the common dtsi only contains the truly shared parts between the two EVK
boards.

No functional changes intended.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 206 ++++++++++++++++++
 .../boot/dts/freescale/imx93-evk-common.dtsi  | 198 -----------------
 2 files changed, 206 insertions(+), 198 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index cca923f4ac7a..6b6d06c70af1 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -11,4 +11,210 @@
 / {
 	model = "NXP i.MX93 11X11 EVK board";
 	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
+
+	aliases {
+		mmc2 = &usdhc3;
+	};
+
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "M.2-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+		/*
+		 * IW612 wifi chip needs more delay than other wifi chips to complete
+		 * the host interface initialization after power up, otherwise the
+		 * internal state of IW612 may be unstable, resulting in the failure of
+		 * the SDIO3.0 switch voltage.
+		 */
+		startup-delay-us = <20000>;
+		enable-active-high;
+	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
+	};
+
+	bt_sco_codec: bt-sco-codec {
+		compatible = "linux,bt-sco";
+		#sound-dai-cells = <1>;
+	};
+
+	sound-bt-sco {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "bt-sco-audio";
+		simple-audio-card,format = "dsp_a";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,frame-master = <&btcpu>;
+		simple-audio-card,bitclock-master = <&btcpu>;
+
+		btcpu: simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <16>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&bt_sco_codec 1>;
+		};
+	};
+
+	sound-micfil {
+		compatible = "fsl,imx-audio-card";
+		model = "micfil-audio";
+
+		pri-dai-link {
+			link-name = "micfil hifi";
+			format = "i2s";
+
+			cpu {
+				sound-dai = <&micfil>;
+			};
+		};
+	};
+};
+
+&micfil {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-1 = <&pinctrl_pdm_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_PDM>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <49152000>;
+	status = "okay";
+};
+
+&pcal6524 {
+	m2-pcm-level-shifter-hog {
+		gpio-hog;
+		gpios = <19 GPIO_ACTIVE_HIGH>;
+		output-high;
+	};
+};
+
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
+			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
+		>;
+	};
+
+	pinctrl_pdm_sleep: pdmsleepgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
+		>;
+	};
+
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
+			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
+			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
index 6279b8eb4ea7..301e9f05122e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
@@ -107,15 +107,6 @@ reg_audio_pwr: regulator-audio-pwr {
 		enable-active-high;
 	};
 
-	reg_m2_pwr: regulator-m2-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "M.2-power";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -128,28 +119,6 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		enable-active-high;
 	};
 
-	reg_usdhc3_vmmc: regulator-usdhc3 {
-		compatible = "regulator-fixed";
-		regulator-name = "WLAN_EN";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		vin-supply = <&reg_m2_pwr>;
-		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
-		/*
-		 * IW612 wifi chip needs more delay than other wifi chips to complete
-		 * the host interface initialization after power up, otherwise the
-		 * internal state of IW612 may be unstable, resulting in the failure of
-		 * the SDIO3.0 switch voltage.
-		 */
-		startup-delay-us = <20000>;
-		enable-active-high;
-	};
-
-	usdhc3_pwrseq: usdhc3_pwrseq {
-		compatible = "mmc-pwrseq-simple";
-		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
-	};
-
 	backlight_lvds: backlight-lvds {
 		compatible = "pwm-backlight";
 		pwms = <&adp5585 0 100000 0>;
@@ -161,44 +130,6 @@ backlight_lvds: backlight-lvds {
 		status = "disabled";
 	};
 
-	bt_sco_codec: bt-sco-codec {
-		compatible = "linux,bt-sco";
-		#sound-dai-cells = <1>;
-	};
-
-	sound-bt-sco {
-		compatible = "simple-audio-card";
-		simple-audio-card,name = "bt-sco-audio";
-		simple-audio-card,format = "dsp_a";
-		simple-audio-card,bitclock-inversion;
-		simple-audio-card,frame-master = <&btcpu>;
-		simple-audio-card,bitclock-master = <&btcpu>;
-
-		btcpu: simple-audio-card,cpu {
-			sound-dai = <&sai1>;
-			dai-tdm-slot-num = <2>;
-			dai-tdm-slot-width = <16>;
-		};
-
-		simple-audio-card,codec {
-			sound-dai = <&bt_sco_codec 1>;
-		};
-	};
-
-	sound-micfil {
-		compatible = "fsl,imx-audio-card";
-		model = "micfil-audio";
-
-		pri-dai-link {
-			link-name = "micfil hifi";
-			format = "i2s";
-
-			cpu {
-				sound-dai = <&micfil>;
-			};
-		};
-	};
-
 	sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		model = "wm8962-audio";
@@ -350,12 +281,6 @@ pcal6524: gpio@22 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
-
-		m2-pcm-level-shifter-hog {
-			gpio-hog;
-			gpios = <19 GPIO_ACTIVE_HIGH>;
-			output-high;
-		};
 	};
 
 	pmic@25 {
@@ -548,16 +473,6 @@ bluetooth {
 	};
 };
 
-&micfil {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_pdm>;
-	pinctrl-1 = <&pinctrl_pdm_sleep>;
-	assigned-clocks = <&clk IMX93_CLK_PDM>;
-	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-	assigned-clock-rates = <49152000>;
-	status = "okay";
-};
-
 &mu1 {
 	status = "okay";
 };
@@ -566,17 +481,6 @@ &mu2 {
 	status = "okay";
 };
 
-&sai1 {
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_sai1>;
-	pinctrl-1 = <&pinctrl_sai1_sleep>;
-	assigned-clocks = <&clk IMX93_CLK_SAI1>;
-	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-	assigned-clock-rates = <12288000>;
-	fsl,sai-mclk-direction-output;
-	status = "okay";
-};
-
 &sai3 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_sai3>;
@@ -647,21 +551,6 @@ &usdhc2 {
 	no-mmc;
 };
 
-&usdhc3 {
-	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
-	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
-	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
-	mmc-pwrseq = <&usdhc3_pwrseq>;
-	vmmc-supply = <&reg_usdhc3_vmmc>;
-	bus-width = <4>;
-	keep-power-in-suspend;
-	non-removable;
-	wakeup-source;
-	status = "okay";
-};
-
 &wdog3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_wdog>;
@@ -808,40 +697,6 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
 		>;
 	};
 
-	pinctrl_pdm: pdmgrp {
-		fsl,pins = <
-			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
-			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
-			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
-		>;
-	};
-
-	pinctrl_pdm_sleep: pdmsleepgrp {
-		fsl,pins = <
-			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
-			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
-			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
-		>;
-	};
-
-	pinctrl_sai1: sai1grp {
-		fsl,pins = <
-			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
-			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
-			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
-			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
-		>;
-	};
-
-	pinctrl_sai1_sleep: sai1sleepgrp {
-		fsl,pins = <
-			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
-			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
-			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
-			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
-		>;
-	};
-
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
@@ -996,59 +851,6 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
 		>;
 	};
 
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3: usdhc3grp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
-		>;
-	};
-
-	/* need to config the SION for data and cmd pad, refer to ERR052021 */
-	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
-			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
-			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
-			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
-			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
-			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
-		>;
-	};
-
-	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
-		fsl,pins = <
-			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
-			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
-			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
-			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
-			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
-			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
-		>;
-	};
-
-	pinctrl_usdhc3_wlan: usdhc3wlangrp {
-		fsl,pins = <
-			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
-		>;
-	};
-
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
 			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
-- 
2.37.1

