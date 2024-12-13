Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A6B1DF736
	for <imx@lists.linux.dev>; Fri, 13 Dec 2024 12:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734094705; cv=fail; b=XjohEGyGuwxVpplADIiXqWglq07XAFJ57wAXVqeWxCbK4axUrPDcv1p2Lco40Sle1KterWtLJlJBLZwOIEkL9foeZ69bo+xV+mCfJmI8zuAlrYkzvFx762un7dqrhIm/aCv1ryATKY8pGZSf0Xg2dnBznntLT+rp8mYCsAQABqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734094705; c=relaxed/simple;
	bh=ep28K75PFWM8rYTFqlbZoFjzyzoUpHEGCd7WIca/x0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QsjU7tQudtFyINPXdj5vMaqGYwrBJCDUd+ih5l8UgPgXciEbxqkqRATP0D6z1FkJOBspqWURKkbi7QnHQu+2sSz6m+5gG1DJpfUMRp/kZ/ATNPDXv3Qduh5B4Q+BYyMrfO8gtju2fNBV1N0PYOWtr0vFe/+6UHllAiPzepCQrXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ARFNtjX4; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ARFNtjX4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMY0dEcqP33s7JrToAR3lpHxALWg3SVnt24f5Sr/wX1ZyU/n/phnjracFDj5jHasdPQZ8EvVe9WF+VoF92Mo7lt0E7CSqQg9zWL50UPHvil7bpfrjQgTK60/n5gO/1kUDwl8+1kBmPwfy7dIg3zveiVA1hXCUXLYwicWJXcO4NaiZZ9XQC4OJMyGWoTmwyk9+jvToAIYPU2oyTsXE5sZ6vn5HVFO6y3e+YTkH/OwZ8M3uhVc4PBXC7R0bsv71LANq5UNXq5yO8EpFA5ixX29hFTQPisJ0UPPMeqkDDAUCTL6k/Fl/OLHVnosADdPbMgMqs7dTXxZMmc5t6UuQmnMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2Ml8YCww2EvKBJNuxFnCfpjdNS5hzD4ZPCVYd4WGnk=;
 b=CVoIUzAE9mcDe5OmiJAebB6AdEktrdFgLHJfsM4qEChs4HKwL7nqYTkhaET4ZX5aeVPhlYMWHWi8MiFaynui1Vj8H0DB51ladYN0uDWYEqOIQMXRnzn+ls6670BI1fCvvlP9+aZfkDeQj4TvYoDshEEEf82f4bdWQ9a0aCV0uO91imG5MCPjvFoX2YufNwrHrx5CGgr4ScpZvm5u1PfHhdngcM93nqsyyPZa9F2Wpu48+s/0sTUFCHLXu5iSkwVGPWekVroTekUpAGyHumcr/YviUP+/MvBe6hrLBlVPcGAQ7s+0vI5CwvwxkMBjxk3zyjYTr2GRVKxvaFrwMvhj4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2Ml8YCww2EvKBJNuxFnCfpjdNS5hzD4ZPCVYd4WGnk=;
 b=ARFNtjX4spaktir5tjX3GmMxDmPU5bE93nEuMaE8VUaTkjGvFHEe0baK+oeh1pqh7KYtlqnTgZtLqhkNzxc0cNSOeeMWujmkgo1vsujgyrludwa2FM8qKSuRibDh3eOcS0kRvAHdkNY3lQBXUuZcqSjq3zXwCnbWsZmODhqRP7muk6Tz+ZFN28peGLX3WtQ43QjySsBebXRx/toUt2Qy/ONgl4PCSn3qTO8ZZsKJ3BWbZ3bI4JAEy1wf5YZGUoCjCmvgeswUNAg1RBmvZjWuoSN/RUzTBecSgl1rw74CYRjvGu9yJV7lCpuM9OsEj8BWSu/ChxdggRlsakZB5zwAWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS4PR04MB9505.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 12:58:19 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 12:58:12 +0000
Date: Fri, 13 Dec 2024 20:55:28 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Hui Wang <hui.wang@canonical.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH] ARM: dts: nxp: imx6qdl: add dr_mode to usbotg
Message-ID: <20241213125528.m2skucuhqtrc5f4s@hippo>
References: <20241212043126.73045-1-hui.wang@canonical.com>
 <20241213081729.ohgs7tyyzywd4uyc@hippo>
 <cb6c7f8d-6244-4370-944f-a1a2beac3a79@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb6c7f8d-6244-4370-944f-a1a2beac3a79@canonical.com>
X-ClientProxiedBy: AM4PR07CA0010.eurprd07.prod.outlook.com
 (2603:10a6:205:1::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS4PR04MB9505:EE_
X-MS-Office365-Filtering-Correlation-Id: 512e0b13-55b1-4558-dffa-08dd1b75cd43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h6qBUjrV1Xb5IjPL/6HfpvjOMC3HueuCke/nvO9hZdCwWSiVIFUxR/3vs1eI?=
 =?us-ascii?Q?h4Andnki/ZgMrw0NUzR1v3BW0DA8epMFsl4Z0e5CI8oGYi7oaT9X8WZZem0f?=
 =?us-ascii?Q?0zJCCbkwfjpWSGpaKQGXepSrsohIjqQBKJSubLICmaAp0UOEGxJLtHADLRnl?=
 =?us-ascii?Q?X75cNWTXxhIK5+XQl+qhKMLoYu94NflkRQ6ObOW+BhVXdq7qr/vG1D5YmxCC?=
 =?us-ascii?Q?lK/EiB/j7gbQry5s0axObTB02roK6EbCTyRvqqDKUEXK2HcGA2VKW+iB3IJw?=
 =?us-ascii?Q?0ChIeemeNLaaS4QQq3FPdenLZSRIsC4Y7CObKCKjJ3ej6UaZn6Fgm4rKZEvt?=
 =?us-ascii?Q?hBw5QUvNue2uEh9ZdfAw71yeuIv7fwueEwdlH8WOQq5EmiTZgFkpWqrPmWBE?=
 =?us-ascii?Q?NXoFZlogwqAvBwWTm30sAFN05HSMc2a5y673eMoPbeoBS33l91ob6VlQsb6s?=
 =?us-ascii?Q?BTJqN6GEVgw1ctuDpEE0/FWY77lHIsNdcTrV5W2EVgUlYoY42LedvxC4KZOW?=
 =?us-ascii?Q?RIDwQ/tJz36OjZjwdc7LFpeHptJ+KyOc3UCcHmxIGfoOvRN4/GMZma0i+86h?=
 =?us-ascii?Q?sj217Tp+yGQC+2XR7+EljuQG4BICl0qhf7NKAz5j6kuPYG/6YTbmJ3Gz7rBh?=
 =?us-ascii?Q?DtB8izdgTlyKxqsm2JMyAbKpBiyMKbK4EghQrejPb7JEdhw5rEUsGtUPAbDf?=
 =?us-ascii?Q?Up8FjpVh39zBDMLrCqIK1+9X32G2iU5emUMX9/QaMqvEJ7uIHifReBMKSTZU?=
 =?us-ascii?Q?HklSRruH2LIvw3nykGPwqhL9AJjBcW5DcenLPWmj5cMYe3iJ/PXutYlkhSof?=
 =?us-ascii?Q?MFgIss/fBYJ4nTfyOfu1iPhPqLg8QrpFR5RxyAfNKk2LaD5FCMv3X82IokO8?=
 =?us-ascii?Q?qoYaVh+V3wuyeCec8CaivS87F9gJky6/r98BfhxnBb3W9Ds0FDfDcVMyhFxK?=
 =?us-ascii?Q?yKirXESDNifvylO9FIOQm2xcdJX9mygoMZWbCtv1cokne3KaF6jwRH4AmtSZ?=
 =?us-ascii?Q?AQZyp4V05IIB1PBKrICyiPvalzklCA1qV+05UFaAGr8QFRc5LG2STV2cwxZ5?=
 =?us-ascii?Q?ovuy4BcixQqS/uYTJggSi0eeYUtd/ShCZD/fI/qRm2Gs7cFw2Gk2+1jkRc1s?=
 =?us-ascii?Q?1c6JfUk8LWTnc7My4yL2j9O/2/TtNEUty97oLLtVxtGaOvMFjJVfcVY9SqSF?=
 =?us-ascii?Q?jS9P80RZWzULNPKDGBu+mL3XO+nnxR7t31Ls8IRvDUD1D67ZMlAl2td8oQw0?=
 =?us-ascii?Q?3eoto7m9+bS62GCa8/fLJKyKgyH/QPA8E9XOmw3Kgx1a4YIUfRpBgasLC1WH?=
 =?us-ascii?Q?aI+NWQUM4MeLwwwVwTWB8HQnj6AGw6KY3fMT9RyzKtCDpQ4O6f1bZGJSnhhN?=
 =?us-ascii?Q?1yFFq7KqPZGjZth+ZKTHi2+NhL0XyPCTLDDPj7qG6aDvce2y1A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EP6z3v20W8a+2GxSxC4JL5VwSL4Yo0jJYQzBsQebBhnCwrXj3852mgpLkdUf?=
 =?us-ascii?Q?vYpvks0YgtObyB6ve/nFkgLYlEkkVhYuby9GGevJuKC6c1eagKXh8gk4LQ0Q?=
 =?us-ascii?Q?uV25bNWZap3loKI69eaHOHggHNZh+2P1Yos3QmZMNVHGRoH5ysdAs8CUvseP?=
 =?us-ascii?Q?4PZ53oT0veKWeQRuBC+9QTxp/KtwYLa6Rtc9meUfwjVVhqB1kAjKVOxhRZac?=
 =?us-ascii?Q?I4vJUuE+VYG6rYwBYFuKldX4DBwb0l0YeoZjLOhGztezJyaeVqIAQ8cD4joy?=
 =?us-ascii?Q?TC3dHu3ZBJTSv0zmzKQROjublq4eHu0xvE8ry8iAtkNccP9tYcaPFkLe8JN7?=
 =?us-ascii?Q?GryZDruV+LMZsiL++otY4zx6vh+msajScoOXS8RKYfbRKghcZgkZUbYK1wGX?=
 =?us-ascii?Q?faquEMngOYl/GllHctwmKZXV46TQ3KYzy2s8PvMg4Za/xvM0PDQzXrQWgdhx?=
 =?us-ascii?Q?vv8vmuUoMVRJPzRDf/ng7SS1vBOiyVoEvh0ynx8eBm1b8R3lhexzsXtWWNY3?=
 =?us-ascii?Q?qk8CA+cT9NdFn0u6NIyXhF+UEYjKdK47tmHdOQRip7iebseTfgtXlHSfDAT1?=
 =?us-ascii?Q?6jfagIWRxIa50iArrpCwbBGSZJp+53rvxWvcZl+ps/7C7d+D3DD4uyW7aN1b?=
 =?us-ascii?Q?uM+EmrG190UZRNVV2NUxzFF5ToowuUN0ppvqflg78y49vf5w1BeM3rYy4gk3?=
 =?us-ascii?Q?zVu9fMPgGgNsIno73JRFR24c4L73vEorZdKaa/OiNE2BDZL0Rfn8/bZTkGjW?=
 =?us-ascii?Q?yPm0bky4qpMkvNyktsIB+nvSNP/TcKJdPQ9FwSeKnwHHBozTLfOg0QpIvXiW?=
 =?us-ascii?Q?qbN7BP+XHp+XOYbDuPmdSXg04OSrU05gdLsT0AaYIC1+5AAjV9m70IHQ+Yen?=
 =?us-ascii?Q?MBEIenY4qo398bnDteP+YR2REjxOebScAOkOm1vgrt4Nn8qcw7BVG3xm2Qf5?=
 =?us-ascii?Q?f7wWT6wtRfqaWprL3jbePr1QNcsWygK0hV/ZCnigsGXsKZV/XfHOpNIZsPUt?=
 =?us-ascii?Q?9u2ewPGPbYCYmYKFqEPF2O5AMYusCXkbxZ0+p9XoIFKLm9pXMCA6dAn9JAYh?=
 =?us-ascii?Q?4TiLdRK0qOqRfqYH2SN8KlEPZ48Pu1WZBQpVogtValhS+jfQbza3BT3MUA7P?=
 =?us-ascii?Q?HLkvoxdIkobqaghcvrJcZNCbas1k8Kid0a93/8sKhBCbNiF6VPLdgvJ740L6?=
 =?us-ascii?Q?5M1yfe3oXVAwhsCygVtE3NItSvSu/DpWpLloPYWBhwbRR6R+Fzgip0nVlrBs?=
 =?us-ascii?Q?XscET1rvPO853i9tGuv28YQ56LPoNGY33ZR4GrqtbSYlLo7wPZWkYwgvpz1e?=
 =?us-ascii?Q?MvkuKIBx/WIOThpFuzLG8KVwwQkaRnEBE23KfpGiR8jROSMyRXY+L+CmHESk?=
 =?us-ascii?Q?rXFmkp8gTVwFNVRNMeRcAe445Vn90F8aJqLRrt/CkWiaqgWZN+2t5rvYORJB?=
 =?us-ascii?Q?fv9Ik3NHzeXXrbqHXsANWk7/VWXlimzDh7/435mOke2Aq8vjtmmo8aAE74oY?=
 =?us-ascii?Q?Wj076y6CVayxfunnAxQWDiJD6G4mt5/7KOWvoxmQ662FlkWBzWy/2bpRosiD?=
 =?us-ascii?Q?K6wHvaJdKl2kJekju094PN0FL6qKUlbBZp6k0ahR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512e0b13-55b1-4558-dffa-08dd1b75cd43
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 12:58:12.9262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73BiOBmJOF4wVoGxiO6TtrqmkaQD2wwGqr/b0tsmkeMuuytNga0KOC51cWMntEp5upd0SWYIINXxQoLMuhfSjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9505

On Fri, Dec 13, 2024 at 07:25:32PM +0800, Hui Wang wrote:
> 
> On 12/13/24 16:17, Xu Yang wrote:
> > Hi,
> > 
> > On Thu, Dec 12, 2024 at 12:31:26PM +0800, Hui Wang wrote:
> > > For the chipidea usb driver, if the dr_mode is not set, it will set
> > > the device to otg mode by default, so here the dr_mode has not been
> > > set for a long time. But some testcases need to parse the dr_mode from
> > > DT and decide the follow-up test strategy, here set the dr_mode to otg
> > > explicitly for QA's testcases.
> > The dr_mode is board specific property, so we normally don't put it in
> > dtsi file. Also, imx6qdl.dtsi is a common dtsi, therefore it's not a
> > correct place. I wonder you don't set dr_mode in other dts file which
> > include will imx6qdl.dtsi?
> 
> Yes, our QA reported this issue against the imx6q-sabresd board, I thought
> dr_mode could be overwritten if board dts set the dr_mode, so this change
> will not impact existing boards. But as you said "we normally don't put it
> in dtsi file", I will move it to imx6q-sabresd.dts.

Okay. You can move it to imx6qdl-sabresd.dtsi too. Then you can reuse
&usbotg {}.

Thanks,
Xu Yang

> 
> Thanks,
> 
> Hui.
> 
> > Thanks,
> > Xu Yang
> > 
> > > Signed-off-by: Hui Wang <hui.wang@canonical.com>
> > > ---
> > >   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > > index d2200c9db25a..285fb7314a88 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> > > @@ -982,6 +982,7 @@ usbotg: usb@2184000 {
> > >   				clocks = <&clks IMX6QDL_CLK_USBOH3>;
> > >   				fsl,usbphy = <&usbphy1>;
> > >   				fsl,usbmisc = <&usbmisc 0>;
> > > +				dr_mode = "otg";
> > >   				ahb-burst-config = <0x0>;
> > >   				tx-burst-size-dword = <0x10>;
> > >   				rx-burst-size-dword = <0x10>;
> > > -- 
> > > 2.34.1
> > > 
