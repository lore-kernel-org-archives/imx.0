Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013031.outbound.protection.outlook.com [40.107.162.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE3937B402
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676246; cv=fail; b=Ugm5OprCk79GVUeDifwL0VIJd7wpga1lUyNuj5YhxSZPVwmja3pO3Xyhr+rCx7IOr4ijqBXLUX7O7oJ1pKo2BACTBIBIWqb5cRne5WV0rVH/nTVXxuiXgEsDtTVBVjh0l4h3FGXRHqDg0dD9fPB9987G8H/Bi+Q4Ks54rdDENdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676246; c=relaxed/simple;
	bh=6e8Nm71otxAxgHSv6X3ymTbbBDqHaqDgr6LzYDsktc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H5mQP0tIBpIgmqBF4eO+sX6fXaKHbaz73Y9SBsa6g1sAedejgOpnr4nxmkRwQ4tGkfb8vTMDWT5cwaM3hrUcCwqPMrhu2fEWF1cOwzCHaoa82dvDNgFKSKPnnuiySsQXKBCN0krIjEN8ATu1mh8Dw8fQyITc6K9xguEvTNgJV9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zskd3QMk; arc=fail smtp.client-ip=40.107.162.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zskd3QMk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EirE+D70E8hQV9eTSxF9utBJpY6er5C6hGED2JuO5ajaKQJbLJls+icoVrqMBbfYUyw0+UXJSXS8NT24H9A0i1xirLxdkSSW5iu5947BkN2e9Pa2PCXy/HrA7/tzzMP7QM7AUe3/b+7P0JvEpbtD+zxy3u2fLcJAApYvsjNW6yFNwKn305SP173b8XNIIbbkWjBlXKiCKS1rB6A6aLkyQwdnFVYaK6fQEw4qDEbcYvo49VmOyRVF1NgNDZgjFOWN6m8oTZoeOt6jS3ISqPomM1FK9lXvLBDjr9gY4u1fk3+inxeCN3+sR9bXnyXARbh5ycHoChUapCf+BeOUWZDgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/wF8s9rkdBDnjB16ckKiHFNsTZR/NpN5nS7U70eYEmE=;
 b=krkRrrbMfk89IFICha3rGQSSva59HNZpyWTPKfr9PO7akoycuV44ByETlkk7ThCTzW5jHIUZZGfh4zTvmjPus42G1QjP08JRspPbuuGGGlyfuoxdNxtWb2sJ/w262tKHWKRNIl0OAgSyd7H9/qUa0KxZsKbNEAfx67NJLm+fMHjeReeyLBUlbhr+UfgeXFUUt8tAdO3Pa/rfham/MkVGLzSM8OzZC4RI7k0F9VQuYUyofyXyKG1SpUSxrxIus9oHq/JIOWGdFSimtU5CSiAb+MnaSY/cpNz/cq/h64FPXa2730l1vAb4vSC1lIWTuQ+uoNUQXxNjU/CbVxfieXuNJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/wF8s9rkdBDnjB16ckKiHFNsTZR/NpN5nS7U70eYEmE=;
 b=Zskd3QMkzlpsufyswb2xJpAbJY7lHYDqUzedlA9VXLsNrWn8x2Z5BLjro1FKqW/4lsm8n5yksMXDjSjHfEVMqUIabhNUAOsp6jw1PehVHv/5Cl7SINGpB2zNeHHOjzcTqGchl322aFnqtkY1FzPK8dO7Q+y83nJy0G2l1yQcxENI6Vm2u7XK1gWy/JbnN2+nIw5J1DxBwywkMaCUh8iJ/KCJ94oqxk+2FJwPWdOZfxvEb2rOqIxcBMDoE951Qrbi5pkSBEiRVxsSeSVWjUXJxths62/IU2hQerGJr7JjX8XLO17xwv3ihiAy2H7E5t9B8drdpavqSTI0jtfs+IRhIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8960.eurprd04.prod.outlook.com (2603:10a6:102:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.9; Thu, 29 Jan
 2026 08:44:00 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 08:44:00 +0000
Date: Thu, 29 Jan 2026 16:43:55 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Wig Cheng <onlywig@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	zaq14760@gmail.com
Subject: Re: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
Message-ID: <aXsdyzZEUaVzC34W@shlinux89>
References: <20260129022910.3942028-1-onlywig@gmail.com>
 <20260129022910.3942028-2-onlywig@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129022910.3942028-2-onlywig@gmail.com>
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 97f4f9e6-3b93-40a4-e7de-08de5f128c21
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|7416014|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7whvcWQ5lXLR7z7hBfk2MFeFD+1q1nfTG+6wj6F986ynlEQGtfQzolWf9kH0?=
 =?us-ascii?Q?+uLnLsfH8wHGKyZAFpGfmDOfsNtb7AmKYNtuuKEJFKEZMmA+DaDmIFXSQDYZ?=
 =?us-ascii?Q?q09icImfN9MA82g0XUi5gE/B58WGFxvtsDg39iETTL+xfo/VHHm5CQlPG+cE?=
 =?us-ascii?Q?NX4+Bs0u+V7KkpkLEQOlP9pC1hkrcIN44Ab6S+7xEfu+BluZbT9CZgDnY4L2?=
 =?us-ascii?Q?t8wyX2SSLR4WC4m+vhHQttfmFs2YC6WKjHkU1ppPbh0kWG4V/iZ/t3+4Wabm?=
 =?us-ascii?Q?ZtkWLB+GyTm81GiCGiXzh3X3NdwuTi/e7YFUgX4D91B3jYlj47AbaGdrXNBT?=
 =?us-ascii?Q?SfSl+T/w9dEQ/QDTX9PpjcxkOKVO/Nv+pQUUzKU4W5l4kKCurQYg9adP7Otz?=
 =?us-ascii?Q?strjmdZvTEfW1p76gZtg2BjIdLC+Ifr2jSGjFhrKjgnxHkbWOoJW0HnHIYx1?=
 =?us-ascii?Q?RU4fm2DTMLHPEf1BtEm88piE0VJ7x7NzcVo2Pw/4f4rjgarnlpAbVgun/J3M?=
 =?us-ascii?Q?Gslq+pBPnbBXJN0kOCFetj/lzAhpSJ9wRVCruczoa+fWjQo7oUOI2Sx95ut9?=
 =?us-ascii?Q?gRECJr1u2Qv9kuJXFHMLoQqMswMAIoWuamKTr/oLx23FC/KoShR3VQ9Z5Q7B?=
 =?us-ascii?Q?fmTidutr69LoJL2DOi2O1cpLuLAmZn5y8JYH3rsKY79DtTv+4OE5K9dtsU/M?=
 =?us-ascii?Q?9DZ0OJCbmQ9xr0xGqurwo19ydgrH4EXOE9LEEQIk0DizHxyNRPMmT/loOEm+?=
 =?us-ascii?Q?/n/FasEom4UfwU8NdRROzNQr4jvDWr7R1jdJ6v3t+ObFvia66lHq6VqnxM5r?=
 =?us-ascii?Q?4b6zWLXOZ/7gMC8JmhSekZ6piekvYKegC83Fk2NaXk3+voHrT7yNTYrw7kCM?=
 =?us-ascii?Q?1jA9x43VqPze5/SBfOgGwBJnzMw+kDJAYqXFGely0zaYJCkqAm/OCaHXfuHO?=
 =?us-ascii?Q?+42ifcFuaw7STLaDcI5au5ZLOYEQSHCc0VoHW67BxWsw2/1cRtisnw63fwRn?=
 =?us-ascii?Q?bw4LnfGYlCpYwXhZHGnZSDBFW+5nfdvgX3Tbgu3fOMi5KoamNgCCVd7DV+Im?=
 =?us-ascii?Q?Yk9JFDHkqtAkRIFs/junVLuDJaTCaF4TKXhbddLNJDV+/oF5miAigxHcT6T3?=
 =?us-ascii?Q?KEfycQd3bNMQhdRnSfAyQKbRF8O8J88hEloVtkhvmDQa9ZgCrAXlBjQxYc0I?=
 =?us-ascii?Q?okWb7G9Sd9HltB1fnVyCNr3nMRH5Ol1a2zzA01OJcL4Z9dmSD2nNOkJ+7XPZ?=
 =?us-ascii?Q?A5bLULiOQA14wPQy0PRAwsJvTUMem6+DcH1qamSZnKiBA0VxGdxswh4HqkvJ?=
 =?us-ascii?Q?TSb6r9MnvBpjfC+h20rPetv0rYmovYinl/COWBJ/yucMa1MFfMY8SH7VGVCm?=
 =?us-ascii?Q?fHHHDRMzPgxIpEm54OiiBVsU+zLOjn9QQOIXhvDKNuMT3lwE1IrkNGIBmqgl?=
 =?us-ascii?Q?41SLTYXQddEInDrgiAgd5z957YMYQ0HO3gub1NxE3rL3JDJKjDZD//29uLqr?=
 =?us-ascii?Q?dUkfLStkHDASgZxdsTuIYvO5vhfGBWShU4tgRGDVM0Bub4dd4Te4MePzuTMC?=
 =?us-ascii?Q?FviFgUzC/Wb7M3hrtUUNEcVo/T7fn28RHArdTNz/QldO9PvTxnbmCS9oNdY1?=
 =?us-ascii?Q?altU+OdN0kaXpwy9cIwUfME=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(7416014)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rD/f5tDihzJRVEEKFgvSs8JQktqbu17LOpbpzsp1y9clplLgVHa52STXxqxk?=
 =?us-ascii?Q?+jU0NJ3bjrPiXNS/p3WPrBaVcRGwXwJq+ACxUBzxY90BJKmTKyr5kyvISNdx?=
 =?us-ascii?Q?Z1gb4aPQuhl+H0QiZEEVHglRdi30LZLrAbPBxlQHK5xqBAsC9XrLkIWvjVE6?=
 =?us-ascii?Q?FAizus9tNQBYIeix7QZlPoyIbj/oyu+nRuHb0rkbzokDeUJv5q3rkkzTEfei?=
 =?us-ascii?Q?guxLMaSSmlgOPyLMogh4ro7Cer0gMmB9M+bhJ9vyA+GIcRJvlPW/wxAC0SWi?=
 =?us-ascii?Q?WCiIZvTt5W8Rema/NKwyQNu3IzBRNIJM+lLzBliTLIOdJEiCiikbLbM9Ivul?=
 =?us-ascii?Q?OnkJjB2GR16V8Lbr2iA8bSg1xWJtaEmGE2fSIse72wNfr5ww6hnN/UNo/Dn4?=
 =?us-ascii?Q?I4b+q24HVn9N37ycqDU4FlyFd/2A4cvYbfJ+3XYHvGrZjz6bWhb0rI0Ze/8p?=
 =?us-ascii?Q?zmuOUPFSTK6Z0ITokPkoNANBX+6SMcHKAAX11xsf9zWtH8JWPG87uPQ7uuqn?=
 =?us-ascii?Q?bPt1ZgChvCiY6Y6ZXGCbXJNtcMxB6gSV0qX+H3VuNP9xccfi/4zXFDVEjfyg?=
 =?us-ascii?Q?PJUZeiEZjNVyN92BGgCZWQmYBXqkyKbqUWKicgiyd9ij4HnFQX/K69fkzbxt?=
 =?us-ascii?Q?EtYgTlZ4nIiYPXcG2WxW8q5znPmCxAo8MuyCAygaDSJcYyqnsOE2Ss+s/357?=
 =?us-ascii?Q?x4ea1KQ5VVCxnsdRStHp6GgKXkYF2rhnqNV2k9/a/mmmLNBn4PHXagYf3LWW?=
 =?us-ascii?Q?XgxFYdjdmHuJPt14iX7uh9Uivchb/t9GMMOgaa6Tdd+zagyovrdBPdr1V0Ft?=
 =?us-ascii?Q?E4FbUp5S3GyFRZ8fpO8R3mfF2LqrGKSbjGizFqpiAFQFZbH6axvsk+Y3/k2R?=
 =?us-ascii?Q?wly4dVMi4bIiaEJSEHWOXy7l6qLusSOF4gI35Udy3IFXB+XmXXQH2ZVj23GX?=
 =?us-ascii?Q?FIX8bqaakPn3M7cEmsUtuKKufG1JdyeVBVU5t/EWbupfBeK4MSwt+pDyxBtP?=
 =?us-ascii?Q?m9CX+rPgHN8u7CMkwvlz2uUc4zitl9ms89KEoIt47/Wvb5pKegxc5RroTcQe?=
 =?us-ascii?Q?Vgu2IhQ+SQciI1OZJq8hoa/F7sq0F0B6i4FW1JPsIY2O+PgTOIhf/8umDPnB?=
 =?us-ascii?Q?V1IsBPTEOBNbuwEoCTuOkgF3RJrNEttdpe/9IBL8YDnFZHDV3WkijVZWRO4m?=
 =?us-ascii?Q?wEUZUXQkfPVNzMmO0dYH9tyUxEn5URCLtbYnq6POuo3hfiHh11PYfnJhochO?=
 =?us-ascii?Q?LRFkoYF0D5W5wtOOz6yFcBAX6r3AI6VDqrvWiI6bUbESdS9fKOMaF1XDD6JE?=
 =?us-ascii?Q?RuFzFep61RCIBMVxu6PnrrvD4YCXi3Dq9YCyfDtq8HFrlyhR4GutCR3bhgcb?=
 =?us-ascii?Q?9LMUpLAwgjC2umeDX68SRiy2/rqikIJ+sF8UJ1LXoGoPoqj7FW4JfJUwirU9?=
 =?us-ascii?Q?VpXri/Lkfb7931OCt+cuTGkOCOCLO3BpzpTn/AtHSZkwxR6O4oaazW43GELe?=
 =?us-ascii?Q?ghpjymvgbX1iRvJWR29WWH+G8NvllRfsF6zqyC8gq6i/Ij8usr+OS0NnV1xi?=
 =?us-ascii?Q?9cO8ouPG3jH9VCkQMNpGVLFxOs4IvPs9yDYVMD47lzJcaM8EsG1ksuw6nYym?=
 =?us-ascii?Q?LmCiveivx7fbwYNjL2336TT2IE9OkEr43wPN0KSP6kaGOFbWdw6MeLflAxAW?=
 =?us-ascii?Q?IwRgrqZB6hzUm2nO8QvKICrZq9xgEWgN709TaCbPjTeDRrF3mOAPhojYkBX2?=
 =?us-ascii?Q?mW9lep5sqw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f4f9e6-3b93-40a4-e7de-08de5f128c21
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:44:00.1260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGuCs/HcgLrg11S0MOZcLAhSFihfkq64TF63dmFLS9c9XyXIizat11/s8RqCD0uW5g7HDG94JxhnMUsFemzofA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8960

On Thu, Jan 29, 2026 at 10:29:10AM +0800, Wig Cheng wrote:
>Add device tree overlay to support the MayQueen PixPaper e-paper display
>on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
>interface and uses GPIO pins for reset, busy and DC control.
>
>The overlay configures:
>    - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
>    - PixPaper display device with proper GPIO assignments
>    - SPI frequency set to 5MHz for stable operation
>
>Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.
>
>Signed-off-by: Wig Cheng <onlywig@gmail.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
