Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E123CCFD3
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 18:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774289787; cv=fail; b=b2veLXsx8s5MZLUj92THI/MdUI0OOjDEbpYrohCTmTMo7f4GH0bzis4E4dsbiNJK4CfocrwtxbFPRCFbOpCS9tGM8uzkaM6xwOIRCQSapZ0h1U8OjBfbnPK0GQffDcB9U5+a4C9ROp9qXPfbYU0dhypaEuhSj50Gjy4kV0YJLUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774289787; c=relaxed/simple;
	bh=iV9fQF1t4Nb9Dlf0hcOY0Qs3wVavV1rFA4GVujS5cVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sn74Xph9QejlbuPckw9wRnHaO/TKDMAegHjbAOHvO2xTk0CS3L33sJISIO+lUzZ46/zKPlLUHiinJqRaA9ihfPokOiREgFjDFz2fpdpv7bsKpRjwBgRnJv+kVr8Od9lD2aF0NNnT/olB8Y+NW2Jm00BoxQSAO/vdBcz9akAanYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kV1W5syU; arc=fail smtp.client-ip=52.101.70.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kV1W5syU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWxZ1OtvM6TtN02oPpID9Y6qxaEtQWuuYH5uvDx6WJa0vDElzeEkcJF1zOGc6nNtX4dRChvESfB5uZekWb1fokXrTk/lm+MwhU8NzZ0aGM5hUNKRZ2SlBhM+l3HyD1pdJcXwQT3nlxvbEOP7ssZB/JJo1GJbOUjHyziUb/JxOYv9kFeJKYJIMhPCmBUBl4E6lnZfs+KYir34MEl3sf7EppVjObyPfiT87RW7gHJASTQ0a6+nwVY8AeSIjS4sPqd0eBlkFC7Q/MCeNw9bU/2RGE2Tf/mWuhZjxxjTBE4J7ANugf9Z20OqTUpMvMTtrskZsk3AbveAelbo3gnBiKsgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjYX465jYn0oNvm2kCJUUxeptr8CFCBNs9ctWKoUCEA=;
 b=oIdXveUZpTqXrNzv6DfJWOXBv4NRLJ0GG/iPiwFbotVRnYzKve4z60eorn35qu56tBKRi4rB0frRCu6pbT3AjfpbAPTO72/KocPg3abFNZH20CSDpsbqdzMzO4mD46yvPvCk113O0bp/iWbzzeAK7Py812qAs756jxKRGUMDUy6iW9IlDWD7RLRiiWclsjOBPnDYT3Lfb/4MA9FDUz+6LaEcO34Z4jrJBJmvUkrUXXXoibnrxc1oTXwwrle+vlfTr6pFJM94mTVUb2nln1TdfN247n5afa1rlsISan0hJYdhUkuDX+54xzx3YYmw6OYtm3Vec8ON67cGqQLGl+t7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjYX465jYn0oNvm2kCJUUxeptr8CFCBNs9ctWKoUCEA=;
 b=kV1W5syUohXLETtSG2nSL9KaxLcXO+uJU9xzcKt9KlA/bQN9uIWw1US40t8JzCdMWKRXVpLjBau/arR3Qwyt4fZDfcOm+yo90ZwDSpmSc89p7ebDq6WwXIqGTM2H57vax63wudhZSzhOgDu5bLp60l5ze5sjYOOc9U8nW/n2e+AYPBNC/s1jtXAkcmfC5fP5n0+asIyiOOXO0IQtBvmh08uafm+TSsUFV7izQeHWnEa1cmuBbFy3amEN7x2+7zA6w609+t5QQAlZQxPapH99SC4oDEq0nh8h3g/Z4dlYOtsK9S9TV5iEHyt/03YZKomBpbQSRKLTMCePUQkfYhXitA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 18:16:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 18:16:13 +0000
Date: Mon, 23 Mar 2026 14:16:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-mek: switch Type-C connector
 power-role to dual
Message-ID: <acGDbMKECQ3xPdTA@lizhi-Precision-Tower-5810>
References: <20260323110923.2567366-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323110923.2567366-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH8PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: ae788692-bcc2-472d-d36e-08de89084467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	H8vNJ/aKUBRV42bieOdo/MZ0Ht2noWmke6mfYuxo4EKgdU3XwIilHgXKCJY4ZWlutdhlLYx4rry7zEhPsYmx/4eUSdGWtZ5z/ZNZcm5bAmArwjk4TZecd3w1OywbKd/NEqV3kMu41SlaO5Q5hWuxoEQvJEsAW4y8qfMh4JgAqP/ZDimkhdn/Z3cNnYwWKeKr6jMRV/tFFY4FWoJ31QgvubsPYJSL6aVAx0EpelKBzGNKqaGKC53/l25Mk2aZf+dh7rcorGFI3vuexyy8YDNtTInuj5nbuv0eGkINbTbNqYwcrAeo9p7esFWMyQW6QYrXyiXs1kTGovZOSNQ/knhJFgiRcJW/ef0O7DRfXSnPBl331GE6Idsuuu39czszUIWUlQdklOKibvf+mtk5q5dA1w/WG9NT2sS72I0hIrN7FxQMwm0YB0+Z97sTImj890May6fW1ZvyM5UB1dGdmx09PFJKKuLW5deIbaimuHgcjmnhBTrkKp7LNwx/+qSkqzuIm0LkFd3SWJAblngk4gpDPdsRJr2xd+qM6fcHXd5p1a8qallHlZqQjRmz/YxhYBdK8kMEvg87f8PdFb36M87yBOV0ft32uXauCh4MrqMLy7zoFd+XFEqP1zhUSHxsslxKGWm55KOe3hL+gjFpH5/lygWdUwo55UOK7QJxpjFMvQKYkd/BVLUxIUQwX0qbHpfGgU7NgjO9f64oHfERvriP2Y3/4spW40aJzl6W6UCQWd0rG1dfxyD5pfzu5JInDlGyIKgcp9CftpriD5uujdxpKnUadnLp8mwhYPOZLz9nOwA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SyGr9VyAEiCg7jJjTJnA40uVTv5njAW0ji71cRIdKaWClYv0qJGs6tFU6MQ+?=
 =?us-ascii?Q?sB91xmd49Pq6rKHqvQ2E1GdY6HopwY9OcLDgqxt/32kAwwo74iQAzO19HI5P?=
 =?us-ascii?Q?5kD/vLc1qDfHT8CtpZ/ktYJc1Xtcp20y97fNIn44izRu7+YIF5NKmBx3Ss/d?=
 =?us-ascii?Q?ezyMWZWsikI0s9c4UE7wjkKXwyM9KW2xRrsNzU11oVBjf7vId0INBsDxEQWV?=
 =?us-ascii?Q?8IvCEAujUjzHIvXZQGTGQEha0+O0F9vaA/NKuvYxH5aLEFnNQrCNPcp50Hcr?=
 =?us-ascii?Q?o7wF5ktq57AvLX/+FJ+Lot8jQRnRRPkm4spI4VSZpPE2FJ+R1LA+Re7fzbdr?=
 =?us-ascii?Q?CfezsksxD06PaLUwRmAlcIQgQzX1Sr1xXVwHUzEP17ywAbJmlZaphL5BJ9Ah?=
 =?us-ascii?Q?CX4+7TDn1Et8juL1KphqnMN5c79RW7sFygz1VVsBDz0oqzISliIJ5qmDPPFD?=
 =?us-ascii?Q?ih3T8DfVJc9L2AkvC6jK2SQtANf2CTITslqXRx1BD7EPnlTVLzI656rrw+7D?=
 =?us-ascii?Q?8wyez6ZFbAGgwJg1I2+x5TyIIWdh/I3h6LF5huinnDFeRKmVYiC+77I05kay?=
 =?us-ascii?Q?DLI9hJb2ZbOlHrcwRNlMrsQXK9W5q2dEdOi6hPa+/+ufervXmOxuSABwvl8M?=
 =?us-ascii?Q?UzW4/nL2W6NsSFBsPyBP1CzFMznKErmBYwaiUyurigzKvGn93bATgq3yznLz?=
 =?us-ascii?Q?OSPWxEbvDKo8A7Y5hj0JTYR2GpsKrqi+Yl9xSXMtwt8bB7Bp1D215KIJcf/S?=
 =?us-ascii?Q?ke0VwUIvdGTSxL5UF5KE8D16rSODnz2iSAuoI4iOQq9WhcPpRI7URMsvY1rU?=
 =?us-ascii?Q?RWfOMJHSvukK6fuUf3HndIxxXzuZOsOCc8d/Xxo28kExdKHKg+rC6Em7etO+?=
 =?us-ascii?Q?DRUgz6GkUZASWLf2Uh909q6yPdltY7D4xVC5SvwNTQYFHCZzmEqN0TcjAFVM?=
 =?us-ascii?Q?H/wxUo/4wE9CwiSIBOg830IxEdptI+O2MGDfhPX3jW6j92rIa1iZa3CG6meh?=
 =?us-ascii?Q?kmPDoKLc2bxoxLF1ox3KSUvvJAvik5OyD6xT6oosp9jt4TaSAJOWMmtKXmMc?=
 =?us-ascii?Q?iN9A56G43tC5D9ZDwjY1wKbPCrYs/wTaGWLmF8Wdfk/eC9MqM+VD44liRwE7?=
 =?us-ascii?Q?g1sjHtB4GjDH6nGrUkczWpHdKvf3O4ELBt83Ixzo+4WrFC6Pczvme4nsj+Kw?=
 =?us-ascii?Q?qukRwthps7RUZ40G+jCZ4JsvQtqIhtf+OSq+qc/FUJvoGHRmrMpwvg8B2EMj?=
 =?us-ascii?Q?vZg40MHGP9qCGC/7IIMt3Rrg1j3K1MRmRtWUUyRGHb9Yk/U3ujlqexeKxVha?=
 =?us-ascii?Q?iFC+SRv7L6ulvekZgn5GYzyacJmecWI03apqwDi5Tqe0W9ywakG/hIuGkuMd?=
 =?us-ascii?Q?IZeqBelfvqY+y3471c0vB5fXEi+x7U5l1rPSZ548Zb28QQWIexXcMeaCaM9R?=
 =?us-ascii?Q?CINJK/vODV2axL0AkbVaY2glAiw+imYtE//a+tSeOO+8h1c616QKGdAn3lQW?=
 =?us-ascii?Q?7/MFr3bQdr2y+1bbSr1j2vbE84EFu05R7/+/jbA3gSO1T85oefJyEquELFrp?=
 =?us-ascii?Q?nggWwaXB9P5ow8eK/UnbsbUy5qFPuF5RTpeghYS5Q5ESn7VwQk13OA8XQcL1?=
 =?us-ascii?Q?TPVCcMF29pLHCKURwgk1nauOyAfipDzyrK5XemEnQ0zZ4uNsrSInWZ5uhtX4?=
 =?us-ascii?Q?jTfbrxFp47csVnMvudjy7txZ7/qUdeHlEZWKGdZ9QocS2zsL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae788692-bcc2-472d-d36e-08de89084467
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 18:16:13.5952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cu4VsnC8LgBqX46kvYbYZA20yFF1Sc+P2VTu1J/33AMyC8D/Ek/Lr5xKwMuTR8rbAgf2uSGfRF8p5UJdnhRIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664

On Mon, Mar 23, 2026 at 07:09:22PM +0800, Xu Yang wrote:
> When attach to PC Type-A port, the USB device controller does not function
> at all. Because it is configured as source-only and a Type-A port doesn't
> support PD capability, a data role swap is impossible.
>
> Actually, PTN5110THQ is configured for DFP/Source role only at POR, but
> after POR it can operate as a DRP. By switching the power-role to dual,
> the port can operate as a sink and enter device mode when attached to
> Type-A port.

when first use term DFP/DRP,
	DFP (Downstream Facing Port)  ...

Except well known term, like POR.

>
> Since the board design uses EN_SRC to control the 5V VBUS path and EN_SNK
> to control the 12V VBUS output,

I remember a hardware rework to fix this problem.

> to avoid outputting a higher VBUS when in
> sink role, we set the operation current limit to 0mA so that SW will not
> control EN_SNK at all.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index dadc136aec6e..8a832a0e105d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -611,9 +611,13 @@ ptn5110: tcpc@51 {
>  		usb_con1: connector {
>  			compatible = "usb-c-connector";
>  			label = "USB-C";
> -			power-role = "source";
> +			power-role = "dual";
>  			data-role = "dual";
> +			try-power-role = "sink";
>  			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
> +			op-sink-microwatt = <0>;

Need comment here.

Frank
> +			self-powered;
>
>  			ports {
>  				#address-cells = <1>;
> --
> 2.34.1
>
