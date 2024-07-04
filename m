Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403051ACE9C
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 11:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720091856; cv=fail; b=mwh27q+aqWLH1CU65yysXsUtMunN/Z6eMyYir96pJGhT/yaVFLhNzUuwNmHPWkkkuhn6wSg6JiOt+OrGDC3WQxdFPUSpE+vo06CrGKKY5ffFp2ENr9MdsPWWBztwngKI97DYwMPnpUo43oUC+BGg0DN14vxSWdQ3dPPyMXYH1sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720091856; c=relaxed/simple;
	bh=cTtwCnWQWdCcsbmwo7zMXxAxjwjHNzcGPGJwxqqxamE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iVHTlk/s8wPbbGrbijbX/JLdJTkgFmsStzj6knNTYuQ1e9vWb0XptEHI09xb1xWirWZ4JMnqyTDYCizpuaZFaAd3ga/xzBm8nUOzg76+54Xt+7A1qUr03veQzPWfHeUcfm/DZB+zyCZmDt41BlROXzjMR0R74wqrDnaOQPbsvKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=auNq7MdW; arc=fail smtp.client-ip=40.107.22.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="auNq7MdW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSbJlZG3tljgWlDsnoMDfIPX0Pyi7fRIlJrFVBopLep25M3XA63dOEcXTjHTXPy4mEp9ZDZ5P2rY9YW/ZhaqNofaGahrUdaWCTOSb5m4uf1LaFpZa0mJxIcrSF42FhjZ8NZgHIOEJRWbHIDk8iaRq+PZSoRtTpPAfvMY8APWW3HDrrbWBA/I75zD2EFRZpstZMV2O4G3/p5YXWD/36LqBJXShDdoWV24C+doF8bp+paZ2go+kSwY09GJSnYr+Le2vcJ006mzZE85BFphT4xPz35FIAmmfCYhUSX3SybVVHiX1WfLTOlyoILNU81fP25bagnzRmx0hbp9GmpBvUhFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsbzSTvlUiqLd5MWyQtHIvO6e7yX67uof0EURIs7SRo=;
 b=M5JtBCU1d92KmQH5aPPit2CmItOdx96WlJQRg/1r2FLriEatFT2cF3ewjPaqrCdfhplTSo8gheU1dv/HF3hs9NhATZxma6i8pjr/hoYhiXqylG0nFhBup5dMq4LXMU/lrTOt0/Nvtoa/b/Xq8vNPQcjRL/6qKFzchtP7HSwskKIN7ByBbgxp07tq+acEkh4RdchwGBSOP7OfmXtMFuCiCCRnik5JmKI+IMp92CU1WFXLqqid4RV9nCyRqB9NGs6+7+tVVSLcrRt1vmOppz4LI/fTTEyYdKL+gTnn4GdfY29w6whOqwxJFe47WvN+TxnekCos6E1YTXvYT22Ii6/zlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsbzSTvlUiqLd5MWyQtHIvO6e7yX67uof0EURIs7SRo=;
 b=auNq7MdWCksbdHKP8RFeulpjQ9+H42FPGCm2mHclSPf7Ffu31A4Xki1ksAZqjnId7t4eEVrpvTaxeknXZb+6eFfL0FIXYXRA2ZteiBFgmAkjNEcYY/F4L080e19Nbbi9CODlzXGDIPILA0Me6dfJhyAKFRJ2LPC51VJeCf26Uy4=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by GV1PR04MB9215.eurprd04.prod.outlook.com (2603:10a6:150:2a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Thu, 4 Jul
 2024 11:17:30 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 11:17:30 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: i.MX8M SNVS ONOFF key handling (secure system)
Thread-Topic: i.MX8M SNVS ONOFF key handling (secure system)
Thread-Index: AQHazTb8hN5ltMoiJE+1y2PO1t9wurHmGjYA
Date: Thu, 4 Jul 2024 11:17:30 +0000
Message-ID:
 <AM6PR04MB5941D70C5EE91BC83E2DF4FA88DE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240703105137.fpjollqvtpysktqa@pengutronix.de>
In-Reply-To: <20240703105137.fpjollqvtpysktqa@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|GV1PR04MB9215:EE_
x-ms-office365-filtering-correlation-id: 22693cdc-d9c5-4e20-0401-08dc9c1ae4ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/NRoAr4KyrH8ivowBURdpzD7V6lf6OVUg/lZAKSHPYvgf5RjGt0salNPhRQi?=
 =?us-ascii?Q?H7Tppzlib43WOY6PfhbQZrszoxZatX2rtGoaRW/eVm2VKfm06OqgAWq8+cul?=
 =?us-ascii?Q?kJTyBWIjQ4kbSC4xn4h0HufJvNlfP0MtxFFLRpaZbQqB5ctyIT/oVH/PJ6qr?=
 =?us-ascii?Q?0iRPgh86cbgkEbcc30O47t1QlFN1fM4A8vT4GQr/KHVWeU3AS7h6XQ4ZuDjV?=
 =?us-ascii?Q?0oTwxjK4OJynazNZipOvRlsslSU0LaeRobBMvtwmCrndj5iQBqf66oq1QsiH?=
 =?us-ascii?Q?w2+YeTf4cNRMb/1V6Gz/aJ9jdo6EyZYAFOjL50gpM/Uu1rr3/PijIHrJhiCb?=
 =?us-ascii?Q?2LoE5GDCJk0iYCX9JoDD/FSHvWqV+LIgsb0zSXs4RhjN2Rmpka5gulJxUl/u?=
 =?us-ascii?Q?QpABpYelxXJrLCgMtOiJjynXY2vnk3gZarzUfiAxBroL7h7I7fnPPeVTWD9c?=
 =?us-ascii?Q?d4PeFh60wrip7N1zdjOwfcAnIv62bhPRBlrVXTWXv9x+BKXZEgph/6ATTCoF?=
 =?us-ascii?Q?36Pnpt8yAaSv6xhaWPu9V78CGC8Wh5/BtAWlsk4v3ksVfullk+EsQtlGXeAy?=
 =?us-ascii?Q?+LlQKhcZpfL0PlhjBz2xJjarwywrUoZq6zNjdPJTsyWQp3NIEmpZlJE94oCB?=
 =?us-ascii?Q?3Uj4Bk7nUxASrI281zUcSj6O1Ye0IX6XLOd/lA1Ngnqg+gcn3/FN/d6uDzYD?=
 =?us-ascii?Q?26ix133HvfaiIUv/O/QSN5HMBgHVzAUWNtGmYXG/JN/DPLO4p8R7Fm0/ndQ1?=
 =?us-ascii?Q?sEAzxlezNuN/MWgaloEvpM/Pl1Ydhvkcld5DDWTsCh6Poq6iQXLZ+3UG6gIJ?=
 =?us-ascii?Q?gdWdPgIumq1wNMgVOrHojE9v0shd2RLnUBgoH8gGOMT5/hxVGoeOJH3RNQnd?=
 =?us-ascii?Q?tKF3W6sRtKKozyIgRWifrkmJzU+TOOJ5UUMLT5AE7dieOd5s+ah7p/cB5jQ3?=
 =?us-ascii?Q?wszuErzTTOBMAGbV1vpaZmnRqzLXCUivarI4v6C9LPzvtRSV0X1mtIYwx95+?=
 =?us-ascii?Q?5+m+6lBICCxnXRxhhvh5QD+soBnvDOZvuaFF3lRzhbQt+e80/VW4Fco5UfAj?=
 =?us-ascii?Q?zfo1+LFraRkMgvjaLHNezAUPOHrF1tzmjWe0kv3E0zGijjuOo+FSNml7OA5Z?=
 =?us-ascii?Q?U0A1G2p5KC9Skro03QvmSl54O0G8aQEOkO7R4ZmL8I8P8GD6Rcc5xrFuYWVM?=
 =?us-ascii?Q?Den2xZqoS7mTMf7fgmiFtWWK0RuUxVP7TaZMj+Y6Z/RQO4UgxDna7Z63SyKb?=
 =?us-ascii?Q?YWr3gNVZ8PHfN478OqfaRi+X4QDzGTTLvmymwFVXy4C3CMqn1Ea5aw/bstpd?=
 =?us-ascii?Q?axY2pkSLJjU/WqeJtXhcIqbfcaq1WrSlXTnkIRAFH+lEK5wWq6FTkC4Kpl1f?=
 =?us-ascii?Q?QpmsdDWFfc/mdLvfmWOvKECfe5ezRXRrsCqbTff4uwUUTUSfuw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Aegc48tpSXHKiMXECwvp8LOnEhQkSE9de0rcwr5Fe+Oph1TW5Zw8tO4x5mvr?=
 =?us-ascii?Q?T3tWxxNN0bspg0owGa4KmCU1WA0xONT5I0ZpYob4IcCjbCIrr4VgGqrFSZiX?=
 =?us-ascii?Q?1BRZPlE21AaS9yywOuf4nRpgYFIzdllklSnuQ9GDVhNW6Mk2EK7vilqTrpPG?=
 =?us-ascii?Q?iKNMGtXk2wOwH8f1Pt2hRPDak5Tr9yNgT3d1wxo+dVk1wRsSsIAc3Fsm6c/J?=
 =?us-ascii?Q?5nOrKQQa1wqBKLAsv9o8w1B7a6Xzwq3KZPcP/pFlyJso9vW/u8thBiRL+7Ds?=
 =?us-ascii?Q?eoQLzq9IKvfP0kSqDfG6fIyFbAffCYBNc3thXVRurYbwPZLwSnToFPJK301m?=
 =?us-ascii?Q?2d3iREykGCph16Eyfdeqi2Jwuqbbtc4EHqUvLlrSqVvSYXNB+JBW4c9fVO3p?=
 =?us-ascii?Q?sKLfwmbn5mCXa1Y/d5OUclssfW9DNND8awFbBZGB/4bgOzR0uLgkIEg67LkZ?=
 =?us-ascii?Q?tdSfnv7dDPKoxJ/7fpZo7VIAgjyoMWXnlAjs7xbLZ5exNMBrM3e3Uv4TxoOn?=
 =?us-ascii?Q?1xSVe7ZKk0+obRj+PAWx0oUEXskYvQdv5tjTzXc4J0BMbKbA0srzRCYKgFva?=
 =?us-ascii?Q?wZ/fAf/lgDlFH692YvMHS3jxWa4SIgx6U/8/E9IxZm5LvgsqSO2HMVyLaZvr?=
 =?us-ascii?Q?XtgIrKnzk3VKtyy0x1PF9/YxbekTcUamh05QTav1G4aIzQUMva2ZpWeHx/E/?=
 =?us-ascii?Q?efY+kmJitJpRtbN6PyEqTXHGehS0M7RuAdvlcS/YVQY8JH/baiVu7fK62Tm2?=
 =?us-ascii?Q?4e2d1GKJmNw62nWIpC+AEOkcKv+dOAIjFhZqheFbeYStefFK6jFMuuE3wTZc?=
 =?us-ascii?Q?y7SKzyZ/BnyIkt/UbFPQQOsXA+rIzvAaph9x0TA1tkQHRme3Wis+R/y0zY8e?=
 =?us-ascii?Q?e5nY1RX6g9DxgwPw2XeWQBkb27WNXPrU5VFNujTbttvBGw8/pPuJo+Grzw37?=
 =?us-ascii?Q?QCr1Ywt7Jd2oRFb6YqcOfkHe1MIWxci/RwSOMkbuLvlXZkcQB1QaLWW+K/Fq?=
 =?us-ascii?Q?DFKagTXhz7KBizKxIMM/JyUUJ6WBGLYv1bPBcGCTixTDG9P3Fw1YIe2SoUKe?=
 =?us-ascii?Q?wuaMngTppY2XLgW3kfbHT5uDNGbhIO6KsN+nCfWiRvyUAqxktkH1cZKInlSv?=
 =?us-ascii?Q?u/ILWhdf2MQYqzNeZ+sDKNwVnhuHWg1dcVVjckY0ewLiG0tWGvYnNeci2FCh?=
 =?us-ascii?Q?gq+gnMfN4o5qrDCtj+qxbgVIKQHS5zth3acwf9R7nt7kuJYk1/uF+EJO60WJ?=
 =?us-ascii?Q?QME+QSS0p08qp43RXfv46WkskyrcfTBSMwh7pSRYwg7T7ILM2IfgrZEkwrEh?=
 =?us-ascii?Q?TSkLdGJkZYPx+f194OlrdirP29HFRJqZG4X9waFHjb/obly6EJKMOGFiyRvX?=
 =?us-ascii?Q?2wfVY2wMQdOF7ulFWksdLjWltFRD9tfsVbAGZNH91Uco2jmjXCm/mfrp6aO+?=
 =?us-ascii?Q?YyIjPER+tVWq1EhzdQxiVd/O8IRxvgqP3NTUahAh95u1Khci5DeYfIEO7Hdp?=
 =?us-ascii?Q?SkGwp4R7KpPtB2zHp/HikuJMyvtYm1yzzyKUrNb07gXvKPC8JGtcoOiBvQix?=
 =?us-ascii?Q?HNYqs9yY4hBal5ibUoY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22693cdc-d9c5-4e20-0401-08dc9c1ae4ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 11:17:30.3222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 56YDnfuTtMoxp45qHlha0BqjYfZTnHTwDBueRkNTCmtkI07auyGzGaNn3Ow4IA7zcgIdmfJylYEl5ppu24X4gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9215

Hi Marco

> Subject: i.MX8M SNVS ONOFF key handling (secure system)
>=20
> Dear NXP team,
>=20
> we do have the following situation:
>  - A verified boot (locked-down) system based on i.MX8MM and
> i.MX8MP
>  - The ONOFF pin is connected to an ext. MCU to initiate a shutdown
>  - The NPSWA_EN bit in HPCOMR is _not_ set
>=20
> According the datasheet NXP introduced a new interrupt called
> "ipi_snvs_btn_int_b (button) interrupt" which can be enabled via HPCR
> register BTN_MASK bit. The interrupt level/edge trigger can be
> configured via the HPCR register BTN_CONFIG bit field. This interrupt
> can be cleared by _non_ privileged software e.g. Linux by writting an
> '1' to the BI bit (HPSR register).
>=20
> Unfortunately I don't see how this interrupt is connected to the GIC. I
> can only see the snvs_lp_wrapper and snvs_hp_wrapper which do
> share the same IRQ number 4. According "Table 7-1. ARM Domain
> Interrupt Summary"
> IRQ 4 is triggered if: "ON-OFF button press shorter than 5 secs (pulse
> event)". It seems like this IRQ is controlled by the set_pwr_off_irq
> (SPOF) but to clear this IRQ from Linux we need to set the NPSWA_EN
> bit.
>=20
> Now my question is how the ipi_snvs_btn_int_b irq is supposed to
> work?

My understanding is (set_pwr_off_irq | ipi_snvs_btn_int_b) connects
to IRQ 4.

For more details, I need check with our Design team. Will update if
I have more information.

Regards,
Peng.

>=20
> Regards,
>   Marco
