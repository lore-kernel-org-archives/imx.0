Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013008.outbound.protection.outlook.com [52.101.72.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48F04219F1
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770304486; cv=fail; b=tuSv2zdvgazYRr+OYNID4L7N6MkOXSdQ9yUrmvvM2DG0sGkIHRUVoOG2H8ez9BekvaxPDt6QUeEltXjiBcVLCPPfFs6nx2elTfSxqX9Mg6hyz0PX3hgZmBuQyHoNuoght3/COgeB+3Jit+glFUxTHxtS5K9iI3z9js+zxKEEx3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770304486; c=relaxed/simple;
	bh=ef59A/hb+eKXjzF57xXcPNo9ZaNrqDmshDtx7KdEcl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cIoVZFJzPOQakvvJaTanpDsflGcJh2CHwTbPAqhKT7mHIMBYxLG65nYSUsbYxyBFp0R8+iaveVaIYi8aIprkBQhApC2y/E64TU1nR1+EjKDFFFY8klk36ttF+2FW2Bcyb7Q9ZYnXvKVz93zoASIl88XufMKivfsjyYyq2at21gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eM9cCIOn; arc=fail smtp.client-ip=52.101.72.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eM9cCIOn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJkW/yOwQ3NB8kOxLWsDXX0ns5qbhPwJRdeMO+2uQJyqI1DBrB9E0l2drJFoYvcTdWTt6rc5+EOehziVwaHJjNHWDL6y26XYrTPIhyJBEWQvY+CxJYOk5ORLXp46d4umwBX4AgJRGzHFWAY9haFPzYUjV8L8bhh/G1HKJS7D3A0ygfIDd+85ww/+0uPoOy7JT7rMCpw6SuAQqCRlXkbGz8dZa3xFKfrLtHSo6LkE1nN1q/WuIo3OuU5lOzZbgv71GjlUOZ++AGg6SwpwRfyP732vvf/Cd/T0jwcXUhR8GD3pr7Jtf8Yj+5DQEvwhv3i/FOzKecpVeFyymrJz26FyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heRjPA34BLq3ze+qwi+PqOa5gtaLXYa6/EyX/c6tky0=;
 b=VF+IgMIIFzbQHAEUl4meDj5XNEI8IpptcVS//fVeTg4Zpj5kwXDiBPq4lzK2PqJM8YzHzisc8PR0DSkn9c60wS8bMe+EdjJwqLwFbe9Y0AKJIEttWqOZAPeHxWRxjMjKxyLcED73PPG6aYoiqPlfqjDU6iE/O8Yb6JvgaDjenC8sEwYks7uGuCEBi86Mrif1MrJiz5eDv7akn2uOWHC76hcoDvDsDocJ3H42YCflgTVOzbcC6oa8xhRTWR9P4tYwu8DxM8gcT1onp5gaLlvSbSo7L+XtjeYWEVL0ibteQWDfEyMdhhi9KKRmiGjM2o8OwOWWwDd7V0XSkadtawKHfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heRjPA34BLq3ze+qwi+PqOa5gtaLXYa6/EyX/c6tky0=;
 b=eM9cCIOnxT57MMbfsK0vs2sCAvk+i+ClVwGoIbgWaUQYlRxBnScQd7L3TnOYOnph4qrYY95lFMeN7UOV8vuvPoZSBEqBIOK/UWbHSCQNnML4uJ0ZoH+QO+raeoleIXRupo0LolGgw9HI7MV4k/+/Tfq36iyyTL0FstIM3N//rNtQOXz/+m6hHuu7BOjM/XA0B+t9sAbmaUJBwpI3cTp5JShCtrwxiD657mD/ZP7zK8mlej6OphLHeuaHPjA5pPmskunUNELvtTyiOvnD+h30u5t9jTQYdFoNCdVmUOI8KW0BRql27jG+HbQ1CLv2aDU4K4bd2VSivb+5ClEQ2sHHVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9701.eurprd04.prod.outlook.com (2603:10a6:10:300::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 15:14:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 15:14:41 +0000
Date: Thu, 5 Feb 2026 10:14:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 1/2] arm64: dts: imx8mp-evk: Enable pull select bit
 for PCIe regulator GPIO (M.2 W_DISABLE1)
Message-ID: <aYSz269HKKCDCMA7@lizhi-Precision-Tower-5810>
References: <20260205073454.3709673-1-sherry.sun@nxp.com>
 <20260205073454.3709673-2-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205073454.3709673-2-sherry.sun@nxp.com>
X-ClientProxiedBy: SA0PR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:806:d0::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: cd11b698-4f86-4aad-08a6-08de64c9494c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WUmQJpTltx9PHlfA6wo2OC2wTA7sXRhNjppdruDHt8n4bCXqlwLIsS0UwLno?=
 =?us-ascii?Q?qqCI63eUwWOxDaQvEbFt9AFZrCsCkok5/lVGK80yK/HE+1C3Byt4Sllo9QZL?=
 =?us-ascii?Q?BS7w9DYUQKVYodAosyL1U9INTDw9RGzVA31fvDx+9aWtkOmKrdaFzdB5tPDq?=
 =?us-ascii?Q?UGAmzvS8Ekia1J4adTOeP/dXEzE5Gm+rvx1gK/qraHEly3OgnILXXti2EHU3?=
 =?us-ascii?Q?b8ZgJewBYzQPl1LxoQy+aGQ5nJFZJtfCw4k7ZLsdLJGLLaleT08gHTRkvNoG?=
 =?us-ascii?Q?Tx9R1nudJF02Q79ZHwVC7BxrI8sRrQijV0DCESb1+5rXUrjc1eIv24rq74NK?=
 =?us-ascii?Q?MUfEavcQ66+fWVr2Nv2GVqyFE4DXCKoG56oymNepVJk0X1SBYS6ulfmBUDMi?=
 =?us-ascii?Q?qo6+737Ka+nXDO+eTw8oYpcgh5XZLWx7wYi7y5aQ9epOwTePKhGlmv+Tp8l/?=
 =?us-ascii?Q?RUbdlE0kkXg82du+PBRkAN7bmsu5nwmpkNr9TrGNCxv3Sc5lPu3ZgKyIWpiM?=
 =?us-ascii?Q?tcz6ViDehsfAw2V0dOPdJKPelOm5j0r28MIx+ZfpgryNcs0kJpcHasj6mhzc?=
 =?us-ascii?Q?54ajiTqEboHyEiLF7t+/oFlqoUogLY8dQWeblULydlw/456UCrU2igwzoEE2?=
 =?us-ascii?Q?5gG83tTKNwxLODJvY0Vy//PDNrHhOAyC1tm7+f89roVqVO3ztejI/2WUNRKE?=
 =?us-ascii?Q?aaIQzvczOXfsUXgFAD7Ebf3rkTu7QXdj4kG/Pzrf1klfVcwg/nfdmORNZqvy?=
 =?us-ascii?Q?ejWZzhYy0T9xdTGmElrbC3Mk9hBX7aZCSaUzDYcVtUGqXZ61u3vrZz1XKZFp?=
 =?us-ascii?Q?NvHfZ3+FcPcHbkxxn1ICr+e/CaCwp6hL7cWfPxDkvZDsOcd17e0euHildveW?=
 =?us-ascii?Q?ZPHCnXGAIMZRkjQOXK54rwYLxJoy53qkkj46kmuBaydiqKLtOQj1ObyLFokD?=
 =?us-ascii?Q?IhA2CPpeo056+wMzsiO6UCCUntFnot97hgSrP+pQNzbe5gDc5Nc9sfyRqv0s?=
 =?us-ascii?Q?p26Y/DyM2cK+nEKhFoGAAFkl8iKLHqwVnHK/WA8tel2ja5tJVhq/G59npEbN?=
 =?us-ascii?Q?k8t3ixpwG3Nc+UFXwlGhGxRVyPV64706bHg4fYKn53byWlbovoJW0geVCttN?=
 =?us-ascii?Q?II737DVhs1zcasNIIrPOFMOvh/Vj7tJjhbvLYuYK129H47cym6gSVt+/DELz?=
 =?us-ascii?Q?xF5j3KUgMy85FhRWmjyGo81Xts7x+/A0e7fIeYpbzYJ6IQCblCKUr3R61xrg?=
 =?us-ascii?Q?RDAYbNNqz+KWLxNjB/iM7VOdohf4TTiH4ve+IX7prr4nQhUe7zF5YwOMRy3f?=
 =?us-ascii?Q?cLYmo8mJh8iBYNRB+mpIogQ1K/Ya4v6bcAu+UKXKjlwE0oekCPQAJDeWXQrN?=
 =?us-ascii?Q?ZPWUZ9iGgaA7EE3SA0clhFZv3syoT4ot4AdBfsV+ilRrHmYpJPRpd97wDIsO?=
 =?us-ascii?Q?9E6EdxaM2An/74R22UhdD2qjby+HoIXn4Il+pMxKSDAz+QqIXfgxAuaRZDCM?=
 =?us-ascii?Q?XKfpq37lchisX2GaXQVXA8G39aXsmzYaIBWPKE1wqPTfUAMhd5pCiyoRgVbv?=
 =?us-ascii?Q?Q4ESdzwrBjwicLWkRclrrQCNnAwHlzOrSUR7m7UmWRpGwpdQwbt3AW2GWwqK?=
 =?us-ascii?Q?NgpyFPMo3+220MO/DnL/1bQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9vTGmsvQjOBQRev0mxFO1ATSNOjaHUI0imXne+T403uc1slj6MiK1v953OmX?=
 =?us-ascii?Q?qcWhnB9fbiNX5qpLNOLrxsmoJGjVnufdmavLaHPJcUJT88o7lrAvvLd6cOlc?=
 =?us-ascii?Q?hLNlTBclx1wB6HtDBFp/8xHqdbq9Ar4V7z3kaXLLqWdgZoIObb353sTud02W?=
 =?us-ascii?Q?015cJxfWDhdmwP5s5Gl1ORdR72XlLnd9faDgGs3flfWkUYa5OKoAKRPW1779?=
 =?us-ascii?Q?bcWoHHxWTN0WS6stWyuMahYdkfLVG+L7vADd2UJIDnbwlbxFT7A3mcHK1b0T?=
 =?us-ascii?Q?6RRMZL1jF+tSPXNSgqtNvVl5jP+d9DRT3vW30PZkU2hr688XAZ8TENqRHG1H?=
 =?us-ascii?Q?WKuMOgx6d+4FoPwhBgjNMpbNO/SjvfexecprtjMfokRrzitHP6TRY0daoyjt?=
 =?us-ascii?Q?ItuGKAocrZcQA3emMASrUZhKRBpLy8sF6QoihBHpjnjB20ab+Rgqj2ub0mRE?=
 =?us-ascii?Q?pz+4NTNESERExB6sNJ6pI3dUrWQFC3hdUTBEkqWfuwMW6UAA/W+miA0PSMkB?=
 =?us-ascii?Q?aynoLhHjwYThVuFxcEjQEM4jUg05z4XZByPSctCScEjZkUS105lhHl1CNcsS?=
 =?us-ascii?Q?uA6CxNF7vMqXgyUZuN8nK8IXGoIb9955ex6lZCYQgqjdbNCb62yiSifghLQS?=
 =?us-ascii?Q?wVsrampR9SMvIRCQpYST1KQRWM5okS0eQjPiUpiTAF1BWw9roPmqCPx5juzE?=
 =?us-ascii?Q?93f7ScXRmEKoFIbZU6oQJb32a1D0UWEO5Ls8RQ6vesjArkFa4fptJymX1TAu?=
 =?us-ascii?Q?JuHyQlU7nxLiOv1MxBD808uizRbhiFT4H+TLSLgeGRPlM3Fybb0tM6liBCvL?=
 =?us-ascii?Q?PiMIbYRPSCuKkYPeCh4KWlgc+9Wo7scS2baJ6QkTle3YshR8Xk/QfA0Z/d4h?=
 =?us-ascii?Q?44HUBvnpPNMY95kvCDTDMGrhxWaSm50Od5rDt8TlOKnwUi7LFwQHMHgal+aR?=
 =?us-ascii?Q?Zu0v0dkFeNCVJjW5nk32UXhlE6kZqB5I0SZRCTJSJJ4Mw+M9toX048dSm69N?=
 =?us-ascii?Q?MUwef/d2pN6Z/j5vxoheMmWAhzoXwYQoP9JNXUz5EczDR2tst5LKZRQS3Syp?=
 =?us-ascii?Q?RLaicIdmh97aBmRwZq8oO4GafaCAjepAIvq5OSOrMrQtUnoNN5h5de9sHoOb?=
 =?us-ascii?Q?mloO4WKKnfZ9eYMgL0Pky4OOqy8DBVTLgbNm7Sai4KFlZ5VeAR0GTarAu7eC?=
 =?us-ascii?Q?IMfP23Tkxak411k3fIvD9famlk4ZDAkyc2Li+tUaeJPwTmNcjnStAbxXJfKb?=
 =?us-ascii?Q?+X2dnX9Zfe7t0Je40z28cCAh01CJKkaQR2BrnzSKv8Clo3ABB7h4WdLgkEm0?=
 =?us-ascii?Q?yHvYRMccdeYs0IQu0AUUYOSXFmxdBD/LqFmVdTMd4ZlgxEhI8kLEhe3xQx5P?=
 =?us-ascii?Q?Z4ZBlles8LwfYlLHxZgRECYvmKJGc3FF4CTDCaLdmHbkzx6sr2gwKBX/GDIM?=
 =?us-ascii?Q?X+B9skekiXFje+aXUvXjC7RyC2svG3Rdr/XSciDoBjweaBgfPNbdu41GUnF7?=
 =?us-ascii?Q?KAMS38CttHc0UuoYMCeDy4pWhRF9CkPM11OVhbfoCG6X6EphNfZ/Jt2g5yR7?=
 =?us-ascii?Q?+GgZHmXzsKlPY+kETREI2Xi+z24C5M6yMFzPii/6yFLd83qzev4vkcA8rJxR?=
 =?us-ascii?Q?0oaKGm6WNuY4oQNO6ro8fr4uuvu4ecnjy90mW9UEZ6NaZmemHeKrknRvN3WU?=
 =?us-ascii?Q?QMGHrAikt7u2VJcBSULc5ko9ByDuddFfI2mQNXh1KFMYq2P1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd11b698-4f86-4aad-08a6-08de64c9494c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:14:41.6186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejxmTgFu+keb+Rcvsx8wrGf9v2K3yX8uHOYpbucvFPHWal4mlIZN7cO4XhJNywxslpIz19stqNptvqn02n2r5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9701

On Thu, Feb 05, 2026 at 03:34:53PM +0800, Sherry Sun wrote:
> The current pin configuration for MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06
> sets the weak pull-up but does not enable the pull select field.
> Bit 8 in the IOMUX register must be set in order for the weak pull-up
> to actually take effect.
>
> Update the pinctrl setting from 0x40 to 0x140 to enable both the pull
> select and the weak pull-up, ensuring the line behaves as expected.
>
> Fixes: d50650500064 ("arm64: dts: imx8mp-evk: Add PCIe support")
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 3f9b3fab8ac3..a1269c7a6cc2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -1069,7 +1069,7 @@ MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07	0x40
>
>  	pinctrl_pcie0_reg: pcie0reggrp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40
> +			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x140
>  		>;
>  	};
>
> --
> 2.37.1
>
