Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0F1198845
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629744; cv=fail; b=uM5TFVbHupBrO/ieJrNaNsK/hpFrE0vUBkk595MJSHKLpkASAC2c+FrYC5otiFvOhW3w3IXoknLcW/2r0t9pr+Q9CigsHC02lfjtDeUuJaokn6b+QqfO52PGjEjrgHjtt7RQhnayx0xgeGSdIjt0PbhRWCLd8Mh0hp+F7sEkDyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629744; c=relaxed/simple;
	bh=wb1XFbGhZgY0YMPzD7Zmx9+uWZrKVIPnsYUM04cqb1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BsiLAcbPeMK36itS7O6RVEvwXkq8fNbPXej82kMZZqgsFCMCY6wcrBQKHLWWWgM25NUTSljSc9s4II9dj9kwyb1HYGr4RNSEBKV+oc79/jDik3XW/6uLw3d4NzIxiZGGIAb2eyC/6BD81gG/tCxuXh0GPgoOfXikPfg6/j+ijdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SeVBcOgj; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SeVBcOgj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReV75x9X2SrpsbuDJKHVbY9OldbGvobeYJTJtNAoFVFeEnaWEMnCD6Zhkaq6+zI+0pOoH1bjPEac42ZmqTjb5xj3doFhiuMHgcKfB50W5fHJr++yVNqOq6Flw/3zELDgaJVebaVXxKACCflKzkQZRmSuIZrD6pnuJf1pMUOD5a2pkJvD1u+3EVsfWC8LOV2+VfL1VuxySs9K8f1dwLs504sB3+feCQu5Xotu7LEoMhNyQ+qHWlh41lOqQidhnhNDzS3yqZUio0NcOAVnO+4WGVRRIMTnS7mCZ3tXlYGpxvFJ4GTRIQDh4lOfO70s9TEnK7GmKLCS1nyWkcTsnu41pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LGWDX0R84XuAGEi9n7N8xM6kGbIxCeVe3g8ZonOC0kE=;
 b=CREn+s479eQuBBmaLvXVjV/lGoJSINtBGSZlJNuyHVc2SkNCSr1DZuqD7ApI7RX+6/6NrM2NP+Aws7iLQQcPpKc+Rt/plIfNMQD848+peJMXmG1QWcyJA3x7hw22SYiCRTgdwOlIVjPJXVi/AVb04t9iv8dk8P6qpoMlXSRUzK1BNgpSrRBBJQeFz6EIgPeyWoeFAEQWkqOJOyupevzpbpclHYjM3WrV5cZX57gQhs2/E4Q+2ftcz7X1xFZwjvHYvkkYStkTxDmHRlGh+SC75jMoqYDAhRmxGxbJhXkSvDEAHbY3yypYR/a7rivPVwrrqcEqIOv0jGMVSaWtXd7AFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGWDX0R84XuAGEi9n7N8xM6kGbIxCeVe3g8ZonOC0kE=;
 b=SeVBcOgjH5rMgGspZ25ehhS1JdrPNY2UItR4G4tNQsJauvr92uWZBY1+GLNgea6+2VChxDaeDxLKpCsmgtY/nQTBT+BeXLK/Fnmaym/ugkONYyNifabubhmd8dPzuht1thOnFrrtaQ0zqYjT1i/ZI9RPLV38uMbnmKcxTN05fffHVUSG4PacnEBV/YY2HUBXvIN1RwrnUvbln2jSC+Ss7yzhRn98ta7w6CJHmX/mI2NENO816AWhXdgbw1hOJ+lbNuPK+C+VClTJopqpYY66Bovd6WYPl09S74d0EkHXjJ46NI4gcplEtrVCoFNKZXPoFDdU62aBbsyVM497fOw3pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB9194.eurprd04.prod.outlook.com (2603:10a6:10:2f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Thu, 19 Dec
 2024 17:35:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:35:40 +0000
Date: Thu, 19 Dec 2024 12:35:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] arm64: dts: imx8mp-skov: describe HDMI display
 pipeline
Message-ID: <Z2RZY/gvQ0qqDjqv@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-4-38bf80dc22df@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-skov-dt-updates-v1-4-38bf80dc22df@pengutronix.de>
X-ClientProxiedBy: BYAPR21CA0019.namprd21.prod.outlook.com
 (2603:10b6:a03:114::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: b63cefb1-3b01-456e-76d9-08dd20538e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sf0WD/i4iLBF9Qn6h59ZkuwWxQV6BjPObNzHoLmLDXcvVvFPN+2f+roBpHeP?=
 =?us-ascii?Q?0EFhPNqN+Pmd/RIoNmwRVtM3B6t1shfLQgTHmHMv0wPXBUn8SZuIcxa2+bm9?=
 =?us-ascii?Q?gwKl1APDna36awpcwQt1IIaksA7fDb/7kWrsqiwxT3c/J6ndZ11zMVngqPIX?=
 =?us-ascii?Q?VtQTb8nDKqq4nix+RGmAi5z+KyWpIR0EnsGOzdKT9u36Mrqg6iycdZMjoo3U?=
 =?us-ascii?Q?xp47g9O6VUBzu74vAVrLfPYHj/n96YzLNSsJuS9qFcImK0/d0aL+ne9AqFaV?=
 =?us-ascii?Q?3BDwqop3CUMc5Gt77EFeL41c/zNog6Xg3rUdBO3q1FHgrMEhzWK3K1pHKRU9?=
 =?us-ascii?Q?e2Iq7kbc8NZxpVYBEYGn8fbmivuOCPuy3RIzlCb/9VfggoaxVlC4BTYiJnHK?=
 =?us-ascii?Q?DZCVPreMtQvwXhAn2Mc0r5yo9gIoQcryVGNve/2dQmtBLNMGpMAsBAAt67yE?=
 =?us-ascii?Q?0cAsqgvUIqoEuWOdFw3DBoXKTXU5+DqWLYimcgTFaFlCHls9v+lB0eFjQ8Ki?=
 =?us-ascii?Q?Z/KXBhxRIlEzuVBunsd+H4aRprP3CpvV65sa5/7qiSTTBHONlKzNTiuUFemM?=
 =?us-ascii?Q?y+xExJS/0N3NVOHzStZ9r1Un9xV5gGNtYScXyfbpBMs1aEwoG8Hn4fvCEZXg?=
 =?us-ascii?Q?zXO3zowb8fJ2dcIZ0zrIZ93MnAzloaeoOew95kqxflH9w1TbcupPOOLjlZNC?=
 =?us-ascii?Q?2leBQoEb4bJHJ32NRUt01+838KoTJBhm1a7HXBV7tWN2sedAL1gy297vvpeh?=
 =?us-ascii?Q?RapTHvon0a/w1QrzLayoPX0o2V0mUuLlTb/Iyvj0TZxy/ZYafg63+7QX377p?=
 =?us-ascii?Q?redhIIXXOM9Mi9RPgbHWjJqIkEMI4tcUQ5NrotZR7SIzYg5Etj7T92l/6PW3?=
 =?us-ascii?Q?Jxi7bL2oJUrOiTPNXnqJRCDG47HVIZMZA8vYEqCFX0ZSV0MlAl6i/6FHj/Q8?=
 =?us-ascii?Q?93v05pdF2SaBrBFhnwup2lAg2wpYBlwPqKqcX9CNXs3xnBH5L1yP+1YqQPQr?=
 =?us-ascii?Q?QZU+gBBevFdaEA4E/kEb2wGwQXwI8VgrCs+MafZVrioskkwt6OVjsjcXx73F?=
 =?us-ascii?Q?Jxflch+OXVHHalvuRekf/Ph8MfZDD6AQBXxjsMOmgcZKLb2ra/nuB3XO3AdX?=
 =?us-ascii?Q?cMUrScKw2989iWoVum7yrW2D/E7ta5tg8gwGkjRNU9Kou4u6LmH/Ain9E1bN?=
 =?us-ascii?Q?GM41HtHPB5iWqO/sszBbf0X8SfroEydwaOwPVg3lMMs+3/3MHZLedTzCajyz?=
 =?us-ascii?Q?mDNyk7PnSxLrrIaKslFpco1ohYMTAVzB6BgQMG2lH5V30iquYpAYmhEhlGbQ?=
 =?us-ascii?Q?ii4aZlK36rJE4mhSrByl4P4S+FjQvQE83CwyqfDIKnEG4RAMnGWvgHipyuCd?=
 =?us-ascii?Q?hI1F612A+oNkZx6Uq3nLOoJwlMwo6CE3dcLovTL8QX9gENKlIh8bWiv1nT1w?=
 =?us-ascii?Q?7lEVc4SPTerp7OCKacfOt4Dqd8uyR5p8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oXO+RJJ5dUZAqcOzFfoJyjaOiUIzI7m8452cIgK1j+zx/OdzmOVNpcy0eGFH?=
 =?us-ascii?Q?IhF4gExVwlqFuXKCj7gMI/X0BGm5Z+jznBtx0tcNP4MEPeGiWpptXh6qA8Jn?=
 =?us-ascii?Q?areqoJEMdSidNgx8zamLjnupH9mLhc76o1HtC+G/55QYj3lURIHZ1WPoCzNt?=
 =?us-ascii?Q?qPLGmkbyArAaAapvs+05f2Lr42YHd1vdpcwQ9VzWCJmX3zqzOP8TzLl6cgUS?=
 =?us-ascii?Q?cUHM6jayl/yb+uWVhsxfKfGCizAf8m5ULoCBzxJQ34kSD59TMKYAfLMkjgKo?=
 =?us-ascii?Q?3JlcyjKFgikpWvwRpylz5lShGdggU8n7mufFvfxIW+o9P+4CdhNhI6qIY2QX?=
 =?us-ascii?Q?lzxuKF3OrjVD/okEtXQPClbjmYmEBjFD5V5XP4o37BJtaW+4JLGC898+LXwj?=
 =?us-ascii?Q?WYWVopybzW0jRmJXluMkOgXdmUMvMkQpI+TJTaycFsX7YcRKbx9/X5hAxOqF?=
 =?us-ascii?Q?0ZXlkW2xsz3TFTT/Vy7Rrtbufbr/qCMMvVzqxOF1eLigy90anXn3taJGKrKy?=
 =?us-ascii?Q?qvu/SoGfcnPG7Y0OitJ6Z2pmReBET/ufdX63w/Moj64spVKeT8TaNRuq2i9k?=
 =?us-ascii?Q?AeoOvARFcBrTW3e8WNSUZNrc0VdQphtp9hJLsm7szdLQSZYZckUXfX6PvUd5?=
 =?us-ascii?Q?Q2U4Q3mJzwUUxBoZ3LfAp7SxC4u95zVtK5YAbTGfXcQxW/WGI+7HBe9//Pb/?=
 =?us-ascii?Q?ALcrz54xvDhxLO+GjUgPfFJRp0tgdzF7TPJ7RlcxgPTP8diIKCv6nUmitOX7?=
 =?us-ascii?Q?aHG9MOfyVmF2NPqYxZZyZAtK3spqGPm1GTYWq34AGpmGAyYWMQIAed9HIEb6?=
 =?us-ascii?Q?Y1AJ6xPin6Hvmn91hZ5Qh47kTzOYjGUk8ZGIzb41pHaR9TmLOf4HX/nbIqcU?=
 =?us-ascii?Q?kJrA5ItyrcdISB5BctqkgaHzq7TOKJ8cMMcyKQMEzbUpLgu+H5LMPyUMmnTG?=
 =?us-ascii?Q?8KlFsMgZdHvEx2FCpHW3sC4svcyRlnJW7e/o/MY3eJuQ5GNBplRPWcltn/Z+?=
 =?us-ascii?Q?j7T1+gFoOshyevnWB3rDHeMzlZGCoHR2plpgMPMYKD9kc46+0ngpTrJ85RQ4?=
 =?us-ascii?Q?60i8lJDycDz4ftH734JpxC+anjx1dIWsYFQLhopeSNZpRSTbwunbQ5VYE1jI?=
 =?us-ascii?Q?mG3OHmUpseC8uc/rn8oks4tNPmt5EJAwU1qSIm62Z23wRLrXzFnek++TsjiI?=
 =?us-ascii?Q?ts0WgwVn+frbFmAEMtOmftuMLv7z5u4PHA6Azln/jwFvyUY8Hk0JpPzinAsw?=
 =?us-ascii?Q?JRtEqI7SSQBNJeQbJzHenxLlbUA30OzkTMnPQWeLSiPJTW6kMyibNQHAVZvS?=
 =?us-ascii?Q?h8MYAHZlrReDmjFz1jlt68cnanuVTb12G8PSo7HsggnNpwwk2UNN4/AZaRxg?=
 =?us-ascii?Q?WUgcy6EIs7jEkbKoopXiRrEWhSngPGHTJBHA37utQu2z5NO1kwWYZKxiqejX?=
 =?us-ascii?Q?z4RzLps0f/SWoLkQvloSRjXFHhJDMN5oO1oyRbbzYxfTFQi8KcbL8kd+nuwQ?=
 =?us-ascii?Q?ukfpvZw6aivVMgrwZL4fZiivutMYxze9O92ztPrRemXHpdOsz3QwHEBrO0Ir?=
 =?us-ascii?Q?SMsNiIAtJxyykDNWeo3tpe1QtOTJCyOvLhO5iEUP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63cefb1-3b01-456e-76d9-08dd20538e43
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:35:40.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEAsK5KG2yfHQQ80RgkdKPZYBP+QtuCSCSfBePuwto1ogMLJGkZj8iE8y8ksl/BspIBBjx5DffXrnhG/Exsi9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9194

On Thu, Dec 19, 2024 at 08:25:28AM +0100, Ahmad Fatoum wrote:
> From: Oleksij Rempel <o.rempel@pengutronix.de>
>
> Back when this device tree was first added, there were no i.MX8MP
> HDMI bindings upstream yet. This has changed now, so let's use them
> to describe the HDMI on the imx8mp-skov-revb-hdmi board.

Skip your story.
Just said

Add HDMI display pipeline for imx8mp-skov-revb-hdmi board.

Frank
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts      | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> index 206116be8166..32a429437cbd 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> @@ -9,6 +9,21 @@ / {
>  	compatible = "skov,imx8mp-skov-revb-hdmi", "fsl,imx8mp";
>  };
>
> +&hdmi_pvi {
> +	status = "okay";
> +};
> +
> +&hdmi_tx {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hdmi>;
> +	ddc-i2c-bus = <&i2c5>;
> +	status = "okay";
> +};
> +
> +&hdmi_tx_phy {
> +	status = "okay";
> +};
> +
>  &i2c5 {
>  	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_i2c5>;
> @@ -19,6 +34,10 @@ &i2c5 {
>  	status = "okay";
>  };
>
> +&lcdif3 {
> +	status = "okay";
> +};
> +
>  &iomuxc {
>  	pinctrl_hdmi: hdmigrp {
>  		fsl,pins = <
>
> --
> 2.39.5
>
