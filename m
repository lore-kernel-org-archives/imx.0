Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013024.outbound.protection.outlook.com [52.101.67.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BC417B4E5
	for <imx@lists.linux.dev>; Tue, 17 Sep 2024 15:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726587883; cv=fail; b=F3s1JmWScihKf+ZYVuxiyzSWguFxWLBp3F+IO6Ufv68J5IIx8koCSkYhJZE4x7H/QE7y+9/x6jrl5T6kihGVxwASffnl5HMF6I1Uw4Dov/Y+IlhYnzCA7Xk1WSYarlzKrXVSE8hxp48nwnVmubsDXh0Qfpqa09/x+hlWjK+Cygg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726587883; c=relaxed/simple;
	bh=dHwZl3yJ4HDHrCSlwRzqvYwYhXw2cba90lCqzKU80eQ=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=RxOaSyHoszgKHrVqIRDs7AqjUzyNTIJRq6PuHqLVg7ZNW46iHGjtyx49OZqn+3Zmeh3J6dPUTk2lbmOuW6f8SEZTyJLkoVw7LM3M4F7l25S0wwL5xEubcdlQ7hpa6nqRklxYTRHpH18LVsg9HSgG6DPCtcIRGlsgr9dQV98XCDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EQUwViiG; arc=fail smtp.client-ip=52.101.67.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EQUwViiG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeLCUMy8HcxBLRUibEtk12sKLYQ8uUyDJgw3KyyUK4+TuN/pAPXOEVnyy82KKBwAjNPrtBCY5copwELSOGofDdaWtvFJr6m3n55cQjEoHHbxP7dNAdvx+QkvMQgLkASu4Sfgoe0hVYIm1tvQ3eIAkgdwNOSqNhxwCY4kvJilpudWOxBioUZxbdUwwEc4gzm2uHR9fW55/sIT4uRP0QeoIRjl+2vp812WK2SD23KSJWtMnRDB8O04iaTVNXKsbT8BoQg0co5wEOPr6oHhvrfaQ0nR5Yfy9kUHkjBYJ3Y7GADkUrMBQ+HzfyQ9oHfy32JfJmpR6HJVmdpnDk78rf/FNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VYH/EQaUpkcPZdbQgxLDRE+ONFWu6JPJh91Yu+R8VCA=;
 b=RSwYwa0Fd2qTPvkt0bJpsY/bOyQsHXJo5pAwG3yAh8D+rpZd0Lo9Fe62WbcFJWRi3SfpmUa7SfKymzU5RUCfAOwDi2Cdo3p8jLZdbsGcImiGL8SS/4gppZoArOBviYbLo409FX/NZeZOyK2KOZG56jkoURF+5y8dVGljcJ9gofFPaYwTna0vW6l//TiTxvFSrb/B2PLZzQs/oypE2f4u9IdbtuRV4XM9TyRgdjHX0FIHit3I3vbALU3DaixUuRaR9jRUov/QS5zIdVwxm8yHCGID878ZnftvByiIHYxsGCiJwd0SDCNDpMC5RyacXL8uEBlrkNgpIVfsPfZxKeEUbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYH/EQaUpkcPZdbQgxLDRE+ONFWu6JPJh91Yu+R8VCA=;
 b=EQUwViiGBKjN9RZxto3UmN9GSgfFGaxVUT5xBKXbIWdgjLX5G9lJcgCx+TXcIwXVK7ofMQV+Alll54cySiFHFJc80g2CYHxA5HVO6vjxpCkGn1cv3sC7yk7hbOZoA/Xi8H8aI0PdXPS4k7TwXB/cTEtQHKPtAjESiEONHenPc6zc943+7wumRfVI4mFi44UTiCxFkV+g+5MDWEpDd9VFY64Srylx17v4MAgCD8FiKJQrgeH5UeuCCsUBOb/rGTWeo2dF8X1hYd388oHJHf1rRr2o7Wg2ZSzko2ld7TRNtMDa6euxcZqY065TKJVq94ocfeRyY1CvP0p/3rZ/2P4xKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8720.eurprd04.prod.outlook.com (2603:10a6:102:21f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 17 Sep
 2024 15:43:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 15:43:59 +0000
Date: Tue, 17 Sep 2024 11:43:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: conor+dt@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, krzk+dt@kernel.org, robh@kernel.org,
	shawnguo@kernel.org, festevam@gmail.com
Subject: Device tree node order sort tool
Message-ID: <ZumjueKy+tvkODnB@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0269.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: a11e2912-e63a-4c1a-af27-08dcd72f8c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rK/l9bCJt82BGBD90H5G4HRccnETImYf9KWEU29d3184Mtpxq2SsNS4cVOFc?=
 =?us-ascii?Q?TG4gOMINJn/YPSBhfTzVt54t7qmgN+pleoz80rkMpHLfXSuiOpmZt7VKZjB0?=
 =?us-ascii?Q?Ud1WlU6bsMomvnQckZTTED5cmq3ru/Bp4SAY6/1TdmRHWn7bDmuXgfJMZ8UO?=
 =?us-ascii?Q?Qqp0S+wOoH6F/+zH2c0KjmD6WQOkhH6HMJWXm0LkQRpg3vxL4rCp/j9wrueJ?=
 =?us-ascii?Q?ZgamCn4ED2GlGkAbP3+p3gjH/Z+g+c5AZwRZ/a0oLyjhxROlbLL4fTcJWkvQ?=
 =?us-ascii?Q?5lA7sTTthnO5Zozuen0Lkw3eIkvpQsHXFEtjD2y3OrBPpuqTcetIGEPx13r2?=
 =?us-ascii?Q?DkV6jRiaIVhCdwU//yYkqzbMTBaCRaEsv06IfNgjYU+TEoDWT11NrHZwpEWi?=
 =?us-ascii?Q?iDBArOQszXzx4tjRtIN9i4OiF6No4X6AXGqeDH4QuFKJbbgdl8UYYD+AkuFM?=
 =?us-ascii?Q?xNL4geZNL+I//oqa8TbJB+A7+I9VOBBzL1ur95JsyTeIx+uRK/4c4sW3obm8?=
 =?us-ascii?Q?1QZl70+S3mKGx1k6po+0gZYU9KkeNjmR4PNPtG/kyErldmAK0K3Y1bbWfO+u?=
 =?us-ascii?Q?dDDnijL/ULdI6/agJ5UT6QbIFRqz8DmjfQ3aOYrx3NaMaEb48T/HrXeFMZML?=
 =?us-ascii?Q?qJaUNzJfDvDrlooIWfugqbRV0G04dJ9c/4U88Q4kdadGz6bvzeqLvznO8tb1?=
 =?us-ascii?Q?nzGPeszp6ML1R3MSy5FDcCUx57TNMxekAlNWj0W7+OsNZ1ryICSV5/iHeTaK?=
 =?us-ascii?Q?vKhenrsXxdPs8PUsZp28ZxkHBzXH9/R+Fl9DxwZbGMJPgi+M6ulq21zuvGP2?=
 =?us-ascii?Q?5p61ajCbb1O3mr/+Tt1ToedZfHufxPm9SzPupr6DusX9PBsaJXbZJV8lxBt0?=
 =?us-ascii?Q?gGO/wj93qFBum6FccPbtRwCflyqwzjQ+2ZfjlgNBl4WV60r8W/24BJ7lyORb?=
 =?us-ascii?Q?/iGGTaIXfiqQk4CoCDHbOmXb1aI2NJzuuoLameKA/O+kjbiSeS2mBx2KuyZC?=
 =?us-ascii?Q?Il24v3kQHWNX2+6AkQChbnam+EcGzwzCzJp4PGVf2X7QuTkX2+/H+c99jAv2?=
 =?us-ascii?Q?DEQpgd0hp31UrDb5Uvk/s45FMcSt8YXmG0vfHbPjUjpbsBhfQkL9HQlqU495?=
 =?us-ascii?Q?evmtHH66diDvhOXOj4/jW3CB+u8EF/YOiUuUe/GY6Ol5fZH7xQLCUC+hLW9K?=
 =?us-ascii?Q?JeAIPBgx4lOYay/sAejB9THJwHui2rrnGw/0IqDoTXQgWValA3weu87CIc67?=
 =?us-ascii?Q?ASLjqHcmDIdSi5vV7NjLZGDGTKSYqAHQwoYVa0RDMbJecJMo15B0Bx99fDMI?=
 =?us-ascii?Q?ZK/Y+/I8HzPZ/P1DqpndbJbaPS7MgCgL/3Lq7kgCefBRGKyuKr0SSDGAm4ZD?=
 =?us-ascii?Q?Fb4f/p9Iezdr9suoJ7Eh6wcwoHqjVmxWjIubRD079I84LheTJA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/J3gAzDjK5lW3fB7XkqG32TwbS0Lr1l4Q8BI99h0EiErhBFzjGL+wXMn7+7h?=
 =?us-ascii?Q?Grk76SFJOm7l2E6GbNXHnc97pABcONTwA95j9WheD8kH/H6gm9/9X4SGQLi4?=
 =?us-ascii?Q?GHQUE2XVqFj0Spg28/FfYU59w2DZE7IV8ITZs3NoVSlNMUBLnF3pW5jHZaqZ?=
 =?us-ascii?Q?CaQI+8GMQFhxUQoC/4TIPLtfgWJfaMCDT9piCV0eM/CzYMEdakYH5cGnwU41?=
 =?us-ascii?Q?mRHmAf4NuqdAYvVN26GWYym9zypdmWFhfpxc7LzrZs9ekoZbpJzDyzJbMg9n?=
 =?us-ascii?Q?+RrrsLpo6tEvoNps8QYUuPwZW8viswikD/NcaD4T87DduyyEwsxzxN7DcVp6?=
 =?us-ascii?Q?03JIeoG0mhG0LidTUchSNu2mYhBw+QEdrUQEcRDVZfWd/VW24p9NMXKvJtHJ?=
 =?us-ascii?Q?u6fK/raFEM7Ss17iI2dC1nyPrjEjL7oZfAjpWjDLcuDNnLcYtWpehzmggQ1i?=
 =?us-ascii?Q?GGX3S+Vwbhy8W5tVW+6pqOxVgMaN3gK7U3790FQt/TVZqW1kG31FQ3OmUuC7?=
 =?us-ascii?Q?HGNqf0duK883Z1NdH3K/R4yav35pjVyNv34QY/6grn8/8kfaMygNNPdsfmPs?=
 =?us-ascii?Q?IrIDGEFuH+L8oLXE7gWWLpn25ilsqzPSEDaxrr57/4PacTNLjEH2/W9j4A+7?=
 =?us-ascii?Q?iiymjQhbMGfoAQQWoDX2DhyNmpEQqSQbG0eZNqc9k4RHZvxuVVeA1y5eTi7Y?=
 =?us-ascii?Q?DMvcJ2NLe1F6Y5OMWZcRmB4GFFZs8GjlBzG6dvpfX6LEIY47EYt82tGvxu7F?=
 =?us-ascii?Q?KkMiVF6V+0hBnRnKJY25zcFQa/rOdwEAUNN13abAC902H5fY08ivHWMokjf9?=
 =?us-ascii?Q?ebHG3pqK/tBE8iFOEreqaL4sEGSCtxS5Yzr6HggrTBwuWi3Lc2xfv5yFH1+j?=
 =?us-ascii?Q?pj3JmjKiUtFbnyikyztSET1VivNyF6Db8Ap599iDfcWYQCSEA42W/iBg+9C4?=
 =?us-ascii?Q?hPFRc3YV119BNq5/YoeAyMvFCq38+5zBkvD5FgBkJ/fv+mKphhKUa0moGSIP?=
 =?us-ascii?Q?iVHXs+rvkIco0ZCnJbIBaEPfRWy6I8n4xCHNq4pUIg+/kjVCaH73OcCZE0yB?=
 =?us-ascii?Q?4gdrYMUHcGBpc9yIIW4E3PKvhKEGBu0EqbXizFYDKU7RDQNZbBzKwqj9qywM?=
 =?us-ascii?Q?cfbdwuk4+qGPCQLeVWyVeNg4M7vaeqmsQ5kUMFFxcb6RrZLyzVUlyRoUe4bg?=
 =?us-ascii?Q?WlDRmsZDGQcCnyNLgUqpJcgguCImE0FxMjYxC9YbjDbzdKhMr34+1f4dCcT/?=
 =?us-ascii?Q?5pZ096Z2y0sF18DYGNFERaaezaN8UqvhzS9sSRX5Uf0UXuzsS4NRj7IsU7fD?=
 =?us-ascii?Q?hAtOwOwML5Uk/B5atNb9XHqq0Vcc4IU4jfZr/AwpSrXxt/takS2Q/2JFtNrk?=
 =?us-ascii?Q?08u7iJIOPhd47BhLzVTfZxso8jxr3OC/xh6EArG1texE6cUWLYNj3a3zhV1f?=
 =?us-ascii?Q?S8wCFy8xzGMl2q9KryZHxUNZB5GHBQjvIBwRG0VU4711SehSKDf9MI6hkFsw?=
 =?us-ascii?Q?tcjlIh4VI2h4hOfXzBbsF/QTyktHlyZQpDqecD8aOxXW9M+GSyQhWPLqHxHe?=
 =?us-ascii?Q?9nb/2UW6oYfh05RbUEHD6JK0quuGupqzJys2511I?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11e2912-e63a-4c1a-af27-08dcd72f8c02
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 15:43:59.3358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qON6apraG4m8TldoQk1QYuZnEHhZ2b9q+wmYC37Gx4MXUyACVH1HeVYC84e5q9ms1HbVIVz9sm2uUyv4N33qBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8720

All:
	I write a simple tools to sort device tree to make sure nodes and
properties sort as correct order.
	https://github.com/lznuaa/dt-format

	There are many dt files, which have node order trivial issue, when
try to upstream. To reduce reviewer's time, dt-format can help correct the
order.

	I just want to make sure my understand about node order is correct.

	Rule 1: node@hexvalue,  	order by hexvalue
	Rule 2: label: node,  		order by node name
	Rule 3: node, 			order by node name
	Rule 3: &label			order by label
	Rule 4: children node already after property
	Rule 5: "status" always is last one.
	Rule 6: property order as below list[unfinished], otherwise, order
	        by name.

compatible
reg
reg-names
ranges
#interrupt-cells
interrupt-controller
interrupts
interrupt-names
#gpio-cells
gpio-controller
gpio-ranges
#address-cells
#size-cells
clocks
clock-names
assigned-clocks
assigned-clock-parents
assigned-clock-rates
dmas
dma-names

Frank
