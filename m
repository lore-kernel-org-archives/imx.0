Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2040.outbound.protection.outlook.com [40.107.20.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E205A1A8F91
	for <imx@lists.linux.dev>; Fri, 13 Dec 2024 08:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734078018; cv=fail; b=mi2Dq0fr1Ilm/W3ZHCoO1K1/noFdSx/8kLoT6+KLgQ6lq2bZ5988VNsfgbjO6Jjif0Vd7R2pXuWeb2sw45Sk/fqKGbxsD990mMhsv//mS3PS5kJSxUQ0Th4hMiJ5i79tQor8OnITkT6zoBLoAB2/U/26tJEwS5CEtFW3dgNgVcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734078018; c=relaxed/simple;
	bh=lKUpybeqUlH02zMbUlEPqSrT9ilgCbhZRrBVVwQAhiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a2HVwHiQjn+prWqJeeXcpeuu8UXU5hLCp9HZXMU+U9wPskRYTksjjS9YMJxeODkdleKLV0rfliwnVrEryl93udiVuhUkGUpCCHfdVyb3G0vW12KrlUrTSAslKPviowiAYfNcZbKsmEtQR4TXP+8ELw8gsJBYhIFRIsN/DuiCQYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZR+cqAM+; arc=fail smtp.client-ip=40.107.20.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZR+cqAM+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yI6bFss1edKikZhs+a0AkiHV2RytV8DHmjfabUoDeXd6gj8NkjtQYif5umrRhwbE9s7WqpXG34Sa6XBJC2+Tvgk0VoTgDX+2S+zibBmYclfcMMXWNEUrr0EhTLfK+BQIsLoHTby9QIPI9/PpCSFVVHcaO0uFnuBwdtCe7KEZg3oqMx8vk15eDtuyrlFQmiFjD65FbR8Hn6jWzWGWUU+9njIVV7XH5L8zWE5WsxvSgU+8dzJD9lnIOkT7tOzIsjFIaHAqJPmJ2m68KmO0R67ogV2ljx13hi7k50VNVrNvvxmzKNTT63z4HDOUUSespQSFBKNAWAv7dOwZb//w9toIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgFruGRiftJnZ7CZAz8H6b72biPCQFhsObULOS6z1wY=;
 b=vwufDk5xsmf0yW1ji9Da9h117osruh7JfGtrKym9tK4RT7ggoKh6jAC1aR5BP9nOFp+GDZChRvXb4qqqBUGHHCGrtRy42gA3wW0gkPbqDsvjdmLk+Ge9iDMTJxi9G7WI2OtQ/McteGXncer6muFFAM5F9zVajb6JdVRrAOideQA+kiOAiqxdvSVt2Hjmqp1+tDc6EhcF4Xikmpstr+mqHkviSPltTMFlTgOvWmi5SaHGplQDqcd0CI5bSc6Lghzys9kHbSU8Ej2e53jPnen3gRdJU1Z7MYW5ZInXNfifO2ee3ZvEvd/UQbIKyz0wOo081txkPaNQQWLRmxLXuNrF5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgFruGRiftJnZ7CZAz8H6b72biPCQFhsObULOS6z1wY=;
 b=ZR+cqAM+fLxjEBxrMSA8S7z2P/4jzVRm/1U7VCLMeA4eGo6yBhmh0ZAzDHT825ISsuxDJ4Hnbh/gepr1UjWkor9ssXIIOLL9sLz4E0S/aEZaVXnC3mbCNaAGQzI6nXVEDcj8zUwzdAMFmFcUXm1Zqf5SeBMVFsCw2H2Ec1QCBDqz5YLqGdtd60Qg/pQQCrnFcZToELArzm1UMoGIAQLCtF2FFuFuOfyl16ACh1IHWsR535RRp10O/bh01gBs02ojKLUGoXo1V0l9SFVZkV8MsBWzxj5ayXiH2rIKgyexTHb70ElncYhgIM+uXX3fEus4Hyx1tgZX92KlErLDdwm6aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB9428.eurprd04.prod.outlook.com (2603:10a6:10:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 08:20:12 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 08:20:12 +0000
Date: Fri, 13 Dec 2024 16:17:29 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Hui Wang <hui.wang@canonical.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com
Subject: Re: [PATCH] ARM: dts: nxp: imx6qdl: add dr_mode to usbotg
Message-ID: <20241213081729.ohgs7tyyzywd4uyc@hippo>
References: <20241212043126.73045-1-hui.wang@canonical.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212043126.73045-1-hui.wang@canonical.com>
X-ClientProxiedBy: AS4P195CA0045.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cfd45ba-5e80-4942-6aa7-08dd1b4ef711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mMTM/Xfj4bQH0ivVgetvGRcfyHB6WYPl8pW9cbegVq/wb0+HRnwsHh8NgGPe?=
 =?us-ascii?Q?Ku2VFUdjA4JRhfjtOdgpvukdqr8sqdpnMpBIfRFcK85NEJYwrHfbQ/REIfKz?=
 =?us-ascii?Q?BpKU8tTvW9XbAY3UhikkduWeNCO/+AXzm6nIxqb9t5UkVHWxmXJpRQknhewz?=
 =?us-ascii?Q?zAGQ4/Av7eQw+N5jNSZy3UotucCmMPiEuo/BaA2MsOaciikDeWz/N0nhW4fw?=
 =?us-ascii?Q?ug81r5L7M8msXj4IOsiZr28+go9LWV93W7+mSPLkYfFkY7S9WehKYj9V7+P/?=
 =?us-ascii?Q?R2qqvqWNTiWgon0wca/TMqX38BksrMHduEbYgsu85W2zRuSxc4NnPgVEOmIM?=
 =?us-ascii?Q?33LJ/sbOyOt3MMpicUVIi1bK8nparBYY1Kb35KOCybnerX/CyDpLby4nWui4?=
 =?us-ascii?Q?+6KAMpfvBdIFhO6R9m1steAyhn87s7otjWrc37q18XRPVWpunWIvPzYtPxZl?=
 =?us-ascii?Q?4VJ6xG2ibYXlUESFRJhBDI3EomTPLRzLEu86m9uFnGbRMXuAmvVK3JpYbUTn?=
 =?us-ascii?Q?jf80Bk7/1QsAVQifHoGb/Ulqh5rPkJhpdkOprMcgom6yxyXgBhaOtC6Y3oNJ?=
 =?us-ascii?Q?63ulpvxs+2CrPp5be6ixLH0i3HGGFthMq+yrmhc4YcznQtr/zLphDuaaTXpa?=
 =?us-ascii?Q?6/+pjDUGlIG7y9X9EVGFgonSaPBZL9mkadc8O0ayliTO4e4dkcXGJfz6q88C?=
 =?us-ascii?Q?jHy7tSZdCbVDyQaHAciraFi0sUm11xaPZKA6rixPA+8g/i6Wqeoh1tv/dymv?=
 =?us-ascii?Q?ziPuy/Voaa3xRGwdSfR6ezbdVHRh9If+0xuDBuom0QKRMx7RFwuxfWqqW3EH?=
 =?us-ascii?Q?m5uIiKlxPhAbDvF2HR4AQYXyG4hYh25mrc1PO1htYnYoJvx8xWMJgNViDRt/?=
 =?us-ascii?Q?JOwpIYY7ITyfthTnUE2gmS5/bfZjiRfrbHVRAyb/T5xmxYmJIS2fNudRQlQy?=
 =?us-ascii?Q?XC+jnk5DbUOowaf6DkJNQWPQDk/vtmkpAA+3Wngo/UZ8cqkptSiiRGOuPQna?=
 =?us-ascii?Q?IwBKU7MjKaHp2tazoz89Lp0MrGEdB8vnijnIxHyh2paFFIAgQdao7wd+FEHV?=
 =?us-ascii?Q?vzK/+aQK5waziwsBlVsnKjuzXubE8shnF0LoHde15YprCtxXfhqzKcFBaUhg?=
 =?us-ascii?Q?RBZV9NOg0uIDMoacmx+a9VZz/EOwYpOvjSxIbGRsoJlQL6s24PGpX0YByNPH?=
 =?us-ascii?Q?/M4q0/gGXk5WbLKYbwDhuSAScCTd3hthFQ4ln2Db2qfngPNu0fZKF3ndcyQh?=
 =?us-ascii?Q?1m14T7nEZFp41vszzsV+noaDB1DZ7yun/T5WIkqmnA4kcW5xEosQWt16vCn6?=
 =?us-ascii?Q?63qMHKta2HlPJwGaJIy3GW7OLFB617cSuLYwsE8FVIN3mcLCZVEQov8ckB19?=
 =?us-ascii?Q?KnX6YTIMZ8ZnwikJ2nd3qGi9b5CqgNtJdwLBhCy7mFFpd5PJn5Z3c1zXGujV?=
 =?us-ascii?Q?88HjNbP2xVqKw+OnHPeABGAtaviaKMxM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hopCYBCQU5zidVkoTZIn1sTeLzbyhxssJQlhOOfJU6x52Kgo5zBmOlit0F3S?=
 =?us-ascii?Q?X+91AEevXU4IHsayaClSpPEvm7Gs7CNsXxPT0v1455J9GfdDT1GMKbSoE5KO?=
 =?us-ascii?Q?ppXwVhUsYN4ZCDtSEEsGUnXKBJbdKDbkvtJfq5XSnHA0t9mkTkzcyamLcaQm?=
 =?us-ascii?Q?95kDbizoSE6HiOIyIVUp8JkubvOHme7ly3p7CfRCV7JYi4BANC8kB6h75pGK?=
 =?us-ascii?Q?h4lL//+grjMh6QgrF6hwBnUmk/Ncx9wP/bEm20c/09Ed/t4niyNSdZmPc/j1?=
 =?us-ascii?Q?K3f6/OyHLPrqjPTJi37+rw9fD0exUQnGABFVoh0bD9kx/5mXFcQ6+3lH8I4O?=
 =?us-ascii?Q?1Kh5qRaXJvl1FihSt4zNoMHk8EFVitJqNTIt8426B4FkcdalilqdOooxw6N0?=
 =?us-ascii?Q?e90wgbq7oGDxyguFPT4WxZN0QF5IYgGUbTok2xDOAE512RFFYG5sdPWXlhlL?=
 =?us-ascii?Q?2ebBgHKPwlLJYuynYESW4PI4YhqLM+4qKGuiniBS22ixQTBFDaAM23wOT1Ji?=
 =?us-ascii?Q?rlUBY7UAdVQUMt8x3MrcEC4tX257BREv3NjtHgGtIf2JSvKk31GDsVL+HXv6?=
 =?us-ascii?Q?f1SlNttqJvAphuNSSFTiSntB/8/r2A4FB6IXnJlDnjTU4U2Hteigr13gzDFP?=
 =?us-ascii?Q?cYUj3M4wtSm/5LpG5EkUE0xNjJNy39x2zPmFRBf6a383jQ+z989dlarXNwU8?=
 =?us-ascii?Q?725sT26JVYtsQIlrY2h46NrOXVtzyjoKCK8XR2mobZ9opvSqRvreDs1xHFxU?=
 =?us-ascii?Q?PdKVEDnROqOp7w4+vziAEQD2CxP9i4/7kQGxWtrPIN4Qj+eL5Rtn4ycBo0Tx?=
 =?us-ascii?Q?MrZJqUWRdYEyCPCUWNtojilBBi0okyMw43sO4YULElHwrA8Wxa21PrDwwcXg?=
 =?us-ascii?Q?7i2eaZfF0rl6O0VofQzsa2oUDQ6Xn2isjyttE/VExtgcFn5i+MLjZ10dRTPv?=
 =?us-ascii?Q?4r6nKQTsB3IwKNw5qVAUGHA3e3MFlT55xOcR5dxN1WLPtJiiYXRTGiGChFVJ?=
 =?us-ascii?Q?nvb5LvD0a5PcMMONIhOhcwVjNenChBURpTr9N6bN5t1lmQ8gTUrfuw35NIyr?=
 =?us-ascii?Q?v4h7y/r7Bc/N+j8om/anC6VnVIVnX/iXL9GA4uYn/AWtF++xS5+pkic5lJzp?=
 =?us-ascii?Q?bKuBsPKSrxUq5fiSVcH/tknLISGckqZYwvr/NRl3FLHvtOs/6lok6qjBi/gH?=
 =?us-ascii?Q?YmUDtYRJGWkLzeHYp/SXZlI1Mz+69YB4qCyP43HmwwcYDEDiFDoS/MB2Bizc?=
 =?us-ascii?Q?m4yjTmlg/FIvi530a7oLygcwo27TSyj4rf6GK1FHjPnCyHBg750eTeywPzu6?=
 =?us-ascii?Q?CMBjIcCxVL+7hCmYLopwnDkc4DujLzkNxiv6cvL7WyZBUwG+TLlZhOYSRIzO?=
 =?us-ascii?Q?GZTJtc0ao6jsSDUh5S4XKwpKD0mbKjFQ/dXCI+gZ8eYzclR0maxWlKa8TN4/?=
 =?us-ascii?Q?8z9L05OJHGeHeIA6Ew0fNKRKQ7vWRCqYHEjclCsud3A14QDQgo/KY2xoiSL8?=
 =?us-ascii?Q?9RnZD16A5nX9/VfNHL0N9RGce0vFW4bCbB9soADDShx6kNv+/eZuU6LvjqFZ?=
 =?us-ascii?Q?nYH+UAiyNdWRoWUeLGhNRzBZtMbEAB4H9X6CSzVk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfd45ba-5e80-4942-6aa7-08dd1b4ef711
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 08:20:12.5882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w91MTMXdDUgHbIvUBQlGgT1SngZ9lhVo5jlVS4sIGmCiLvQ0Bej1dQ/JwfqnhjMJG4jD31PR0sD833JdKsD9yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9428

Hi,

On Thu, Dec 12, 2024 at 12:31:26PM +0800, Hui Wang wrote:
> For the chipidea usb driver, if the dr_mode is not set, it will set
> the device to otg mode by default, so here the dr_mode has not been
> set for a long time. But some testcases need to parse the dr_mode from
> DT and decide the follow-up test strategy, here set the dr_mode to otg
> explicitly for QA's testcases.

The dr_mode is board specific property, so we normally don't put it in
dtsi file. Also, imx6qdl.dtsi is a common dtsi, therefore it's not a
correct place. I wonder you don't set dr_mode in other dts file which
include will imx6qdl.dtsi?

Thanks,
Xu Yang

> 
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> index d2200c9db25a..285fb7314a88 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi
> @@ -982,6 +982,7 @@ usbotg: usb@2184000 {
>  				clocks = <&clks IMX6QDL_CLK_USBOH3>;
>  				fsl,usbphy = <&usbphy1>;
>  				fsl,usbmisc = <&usbmisc 0>;
> +				dr_mode = "otg";
>  				ahb-burst-config = <0x0>;
>  				tx-burst-size-dword = <0x10>;
>  				rx-burst-size-dword = <0x10>;
> -- 
> 2.34.1
> 
