Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0553EDABA
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 10:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904831; cv=fail; b=UM7hJ3kqDf07IbkP1LLG9dFTfqhF/NuFts4EKWWNUKgRABta9kHfOF2pIw0eGHQe8L+NVmfb9sSjsQEb+SPmWL6zISLHnh9ZSScWv6GV8yceP5W1VW7DYP7xI1+1QNOHqGq9qSNpcNMQa9QhrjAVvdbiEO3qrn3DBMEH+u94WTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904831; c=relaxed/simple;
	bh=bXgAoAkS9v7RWDGOZt+wBWW/tMz2bcxNsHx4uAD+Vys=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bbnxvUgnfD5VhOYrgRNj5xnRWBf/TxApU6wppwXj8e9YbezfEZBooYD0QJrALpXEYNmOyOvRYaLopNXAtOi0fXREwC7YK5hl4GJdJbXKor2/wIFd1I5OhHtWua6BQZp8Ytt4tbPnMZrXckl1QBvVNd6JmceSKGF06fqRtEH0+Zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dVATh4qk; arc=fail smtp.client-ip=40.107.162.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dVATh4qk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUWs6TkecZa0ZxMyOmUNq54i6e76inGyn/Irl9NXz9KJZn+09Uvu0cXClpPB11HXSvF/Bm7+VoLX+OavZEKdtPDCfFEMy0cFWSYXSp61iah+xRf6fQzqAv+jXF350j3a9nGiWyJOEuyvYvtuRenJFDSpc3tUxZft7PKBaeGq/IVszvMc06AyRyEKxySoLAcNt/2xdyqprA9IGiVtufo7Zrq1Iba7SymPEHmiJMyW+gAH6rqUegqB/HgosPRFCBXU+OOJJDUo9ePnzzXJ9McGfbbGs8iHaerEA8fmapSEl6+3AuHseqEStHQ3gqJ74MOcYHnPzHolOX5nSCnMarSVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIBeeDcxuaNFujZtREIMS5CfxtVEH3E1MmdOVxMp4xQ=;
 b=kKVTvj5YVxf+vRA2axNpIMA4GbFPI68CeEr5Ej/cC09QDlsubgQmrqkgrnZLHo2FmQN3KYRXB6tOH6CHGwKlQyMsRm44T7W4ZXp7SWNyeO8QMG+StbyO2gXOqU/GYREVeMbucpZY6saB4qFPtGcAN7UydRpEcFGeRPHfOmXlhH2vzL/HMz5Wr4SHAqRzcji4vZ4EQcUMNLPT0nZhX5OR4Ss7vq49KUoP5Xhn5u4Iqz06MiOsMN6Y1HCnTr/l+swXSLqOATh7iGvmF5mG76EFwdJPnmYDNCIrgcZG4xX5lfP8KbmdG3SKj/t6u5KNPV1/RkPmgD3zQIoL8uftf5U3OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIBeeDcxuaNFujZtREIMS5CfxtVEH3E1MmdOVxMp4xQ=;
 b=dVATh4qk8AYBZksHtrHppB2qx+1eADmWQXmJGlTDnGU1Bp07F9zAwFeZ+Kou/q2pQE0pBUjzsljUe9BPbS5BiJQNHTSOLkVhO7kU14wGTmLELxyd4wMzny/ke/3j0QoZIvaRHcFfajXHt+Fa3v6a6u7nnZRoX0CvtFuezw9UrAMe4QjHPja5v1etK/0MIUI5kzzVRDK/poVYFrBKNUQDbDjXC2Rhk/N8i1O4tL8I0z2X3VpodOZOmVNJoVIBk1mJPJ2Za2a4X0SFJl511DMvcVCwi1rs+0S7YLprhm38VsTsafdZmVNTtV0FgrbZdFKbj9zoucMV0F5EilMUYIcn7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PAXPR04MB8925.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 20 Jan
 2026 10:27:04 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 10:27:04 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 2/2] arch: arm64: imx93-wevk: Add i.MX93W EVK board support
Date: Tue, 20 Jan 2026 18:26:04 +0800
Message-Id: <20260120102604.1989725-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260120102604.1989725-1-sherry.sun@nxp.com>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PAXPR04MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: 18d7de03-ae86-4cbc-46f9-08de580e73c2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|52116014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Qr3w+/hy6Obvxg9YjNZjz6EQC7xP5x+CEsMipc6y03Up9WZwoWzU8pkrm9Su?=
 =?us-ascii?Q?qihQoPMy14dbEzHIbqD9DKRli4sL+B2BwsoC2Y8NEysqcTCDYyYrmblCZ5H2?=
 =?us-ascii?Q?Lycaa+KCIL61OQhWIcgTaJ/6l9Juf4xBoA2r09tg0gA0YvKvCqN46a3VWPVF?=
 =?us-ascii?Q?/1Lre1MwQr/AcLIZj1WLlTCeXgVajbOXjCI5sn/eboc9dMwDDb9kfnEHSF0k?=
 =?us-ascii?Q?7Gs2mgCB64o57smub1Ib6kanTkrq2R6k0sWO7OwRk3Y+McNuouIzeBLBlSkb?=
 =?us-ascii?Q?v3/I+ebto+LVqpgmBjaDZAkdarVKsHnj9yfsZCP/8HFad+6eddmq72TgI5Kq?=
 =?us-ascii?Q?q58u+Nypr9NC2Ly9ii4MwVg5aC1Sm9IZbjLGvsD3vhfhOuZKHfCyZUsuUzx6?=
 =?us-ascii?Q?NrMK8RD3US/6MbA1bn1glAntIKx/9qbHwDjCgHkjpQE9HPgI9ojXuufXL3PM?=
 =?us-ascii?Q?48yVq5BxSjbE3PsEmcD2LBHNKvS4zVCkwgy+9kmGmoBy9IeeBMLrQibKc5Hc?=
 =?us-ascii?Q?fNzGM3H1lpuGz/iHlhodmSFJZXVfO5fIU1c8XqEFkXbr20rUVWwyD586lOXa?=
 =?us-ascii?Q?N5yJY+xnBkaqUhI5773Nyk4EvrZHR5FBcU0a/LaJ07KqOVT/f4d0g2eri3q5?=
 =?us-ascii?Q?4JaqISC7Gj8Ujj4FRW6f5WdYdILPDXwvtIliMLUI7HUA6Ix8umSNLG1bsEKV?=
 =?us-ascii?Q?g4gGMJjIf1LfNk2CVQAP5Bf0ck8JtKKsjGE2u9LRUubzJYcDmRWV9CCoa3YH?=
 =?us-ascii?Q?KmsFtvyEbPhMhVE9Pgk2x7IwVZF5B8OcJ6Q82pAexQU/N0wfa7Ar2jM/Hs2S?=
 =?us-ascii?Q?HsvIE8MqcvE78aZfv325mTWCYR6t1svhj/UqPNpopkObSIgEcqlsoC2c/bqn?=
 =?us-ascii?Q?v38wFGQJNecnV9xpI3BIEhyvZ6poZ2yQX4KmubZlcQBAyvmqtEpSplqDrKNj?=
 =?us-ascii?Q?yNq78EvXhMQE5eWKYaKj+Gxwtgh0SQ7G4H0NFUbAjYbfECAae2P5hYzRK2jE?=
 =?us-ascii?Q?y6Bu+xrWbltyV7SKOmZbOfYTAj+zDOItf/DmgVc9bm/9vSmABfboA7mac18K?=
 =?us-ascii?Q?LFnt1PlK6ob8a8o6EuHRmAPs4rB1HYmAKIdcNDOZf5hFCfWrSR1b0IryjSTT?=
 =?us-ascii?Q?Vmn6XZeZOYbgyzIFlvHkCP9h3e9SCVM3ne2RTG2oDlrb2cMLyuTs4m40lbts?=
 =?us-ascii?Q?9snZ1NYA5FiU+XTwSaF+g5MadEbtXTaG8KSjEbVyjTS/8JRw9lBFYtrULUfV?=
 =?us-ascii?Q?798YhggIWy1yXaHFbsIHZs4+klVRLLKjTkI/VjZyPrOW4wVUJ0ufjdL4KXj6?=
 =?us-ascii?Q?hpdGD59xqL+QLlfU/bUP8d96KyoUZTqBjTTTObaRQqtRxhJt8NzARGvhgGsl?=
 =?us-ascii?Q?lHYLnbMvhk6aaMYeYpmLvsU06VlRN/yImMYF/jI1ubtGFRoHtK9jJKfV4WHs?=
 =?us-ascii?Q?lxupAoJfFwgQMj3xHmdEASb+LMZS882LF+FZT3nl/+oKG7C/6S/qbbw5hWex?=
 =?us-ascii?Q?yXXnNNHjqnkwAUepKjOKGNxoUE5xdq60ueP4NfH+zwwN+fNNQg5WGSjI8i0C?=
 =?us-ascii?Q?dz7e19aeTi3mSl4nqhTka+I7FWv/ILT/HLBdKVtGEH1IwL1uBFNM0EXNqVmL?=
 =?us-ascii?Q?/lbA2RTM63AcdcJJFdaOS2EfUJojRP9eTwUzQ8L9GWdR?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1TipdR102z5r5IzKD06W0l+8bTvwCqZdfqLic1YnNa/Iq70gA8yokq+ZeFGH?=
 =?us-ascii?Q?ZHEms8Z+SHopXEuylgXixQAA7vvYLaU4mIbkQFPnsEoQHGYkBslzLA6yJMxr?=
 =?us-ascii?Q?y75trdnYhacgZ7y9BfZPjg1DLFAATeq9rWaGqAW0Kkiqqd4a3CeBk0fnRQGa?=
 =?us-ascii?Q?MN8dfEkXWQrkIBpWV/TvEB8gIwzB8rr9JP5+D4MvAIz25p9/Pse6a0L50/sP?=
 =?us-ascii?Q?IQV7A/cg1cuF79Dh2/px5lfBmlFYwcduiOfoAqlbs782az2Q2xLOhcSxBp3E?=
 =?us-ascii?Q?usYB5Q/9sO5ZIptj16ZpaWSUN9SDpP/PHRTjsASLu/RcrjYGeEJQzXnlksJN?=
 =?us-ascii?Q?LkErzMo8rY4wTj0nm2+QITYyabUQk1aOI5ef5Rc78XofcwzbStCs/ciwrJnp?=
 =?us-ascii?Q?8RtRpHnkAuuhgD1317ECSTctG0m7RcqbQsS8wMjXguzsaVWLqWh9OIcNb+xz?=
 =?us-ascii?Q?+mTcrI7l1PUPXuEUJqLZFll7CyalatvKiwCui16JL6vlyejnvUmKv4Z+Ga7O?=
 =?us-ascii?Q?xAnyIFZuYVU71e47gOWF0139kmApw6afK84ldoUXdVZ+LMcMvIKDUrPh8IMb?=
 =?us-ascii?Q?HBij1fOkR3nYfaUJUvLvW1YxIaMOP+uSCyDWmonl1kWuWHiyll1Lb1OLydWI?=
 =?us-ascii?Q?xESnj8ywwmTMDnDKam/KEC02FneSYbseIylg7uh/P/xIiautLpJp9YGVnC++?=
 =?us-ascii?Q?758rmHC/Omvs54wCgekWQQprkcvwV0sxMcHP3R0vKpUxZte+VBHbvvW0FXIG?=
 =?us-ascii?Q?BalJVv4Z6U1EMbGQrhxOFYcYh9j8Ov+r3PBr3TT+orquXvb83WAVDdDxYAVo?=
 =?us-ascii?Q?AOq9JSwxRs0ibsCw+qQDQWQuHkEXRn46g9ikq9Jr/IbiTDL964OK22j6NSSN?=
 =?us-ascii?Q?F6uAnPGDL4a95oRZQ3WpP9MyeT9sjZ03nCEZpG9D6UJ6t6uMBp9Pfn9U1xoJ?=
 =?us-ascii?Q?rDxGGx1lOReuLf3mKsvaREoPCyLq2TE2RX+kA95KS+ZGtjz2ejSZTLQaL9oH?=
 =?us-ascii?Q?QAyGoz/IMtvtk/KK8IpBz0pce/HChXxRBZmBp0J4i2fDwOG04c2hWVIsoNN+?=
 =?us-ascii?Q?bfBvKNIT3qebsPOfGHvgXbd3PGxJTHboXzzfOJMyf2uKJ8VjPwRZY+8TXlcQ?=
 =?us-ascii?Q?wOkkvZdCHtKuxuy0zjbRBURNZxaGwX4hIhkI0MNaBmRvozACnmIUTyS5O5sk?=
 =?us-ascii?Q?xLMMk0bY5IywVHjufc9Hpqdi31NPErssYynmC/mquXP6yMFBwggl9zLPrnbo?=
 =?us-ascii?Q?Ul1dSKVCXNhx74Rifj8kLEXiA/HLRJBiR01Hav7jePr191y6YFCVP6jH7DlY?=
 =?us-ascii?Q?0P/diXCJgN3yhd1fn96E7iVQj87bpU8VLefUwcV8kC2EsQnMJCG8ThR6GYGF?=
 =?us-ascii?Q?44XI/AhddUXfjypKm8LVC/s3deeLwCAidroZoR0C02AkatngZv7K2jCzXLWb?=
 =?us-ascii?Q?6VQVOsUdnZuR5FuGbommm/clJSavYIs45NAbi2gWpuKBxFffY7OPNhWXwQlU?=
 =?us-ascii?Q?Cz6/EC7hnavccZ6V6ndjzf2ou5h8r5XyMBz7GdiO01/fMy+Uoez91k2mPp8V?=
 =?us-ascii?Q?EFUYN0q9md+PnVHaoCTe6hEWkMPJ05Sb8hts7Kr4Mj+7778BOgglrWY6fND4?=
 =?us-ascii?Q?2ewydTluPiTeHfZh/A7AwR2NtDleJU8EpmNbhS2hYt8ocpCWiRdOdcRNDkZE?=
 =?us-ascii?Q?8TPeYuEDse0I/unQWq1/TLlb1TinOvT2u/EOWAJtQsC2WfZkzrMVyB1naHsg?=
 =?us-ascii?Q?Xeq3TRQQvQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18d7de03-ae86-4cbc-46f9-08de580e73c2
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:27:03.0693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zs3Rh575nL92s+14+NMtZxDVPCmkiAuh1A5HMJt7IVq0VbGJrZJbwiuNC6EDk+hBj1eKBDdDStVgKJu8Dgtz7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8925

i.MX93W SiP is created by integrating i.MX93 and IW610 WLCSP (Wi-Fi +
BLE + 802.15.4). And i.MX93W EVK board with the i.MX93W SiP basically
reuse the i.MX93 11x11 EVK board, with some minor functional and pin
connection differences.

Here are the detailed differences between i.MX93W EVK and i.MX93 11x11
EVK board.

Function differences:
Function	i.MX93W EVK			i.MX93 EVK
WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
MQS		N				Y
PDM MIC		N				Y
M.2		N				Y
RPi 40-pin HDR	Limited support(pin conflict) 	Y

Pin connection differences:
Function  Signal name	i.MX93W EVK		i.MX93 EVK
WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
	  SPI_INT	CCM_CLKO1		on-board IO expander
	  NB_WAKE_IN	PDM_CLK			on-module IO expander
	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
	  IND_RST_NB	GPIO_IO28		on-module IO expander
	  PDn		GPIO_IO29		on-module IO expander
	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
	  I2C3_SCL	GPIO_IO01		GPIO_IO29

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |  1 +
 arch/arm64/boot/dts/freescale/imx93w-evk.dts | 73 ++++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ce8f937c2315..5cb1b1d8499f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -399,6 +399,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
new file mode 100644
index 000000000000..c2c758b7f9a4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+#include "imx93-11x11-evk.dts"
+
+/ {
+	model = "NXP i.MX93W EVK board";
+	compatible = "fsl,imx93w-evk", "fsl,imx93";
+
+	/delete-node/ regulator-m2-pwr;
+
+	sound-bt-sco {
+		status = "disabled";
+	};
+
+	sound-micfil {
+		status = "disabled";
+	};
+};
+
+&pcal6524 {
+	/delete-node/ m2-pcm-level-shifter-hog;
+};
+
+&reg_usdhc3_vmmc {
+	/delete-property/ vin-supply;
+	pinctrl-0 = <&pinctrl_reg_usdhc3_vmmc>;
+	pinctrl-names = "default";
+	gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+};
+
+&usdhc3_pwrseq {
+	pinctrl-0 = <&pinctrl_usdhc3_pwrseq>;
+	pinctrl-names = "default";
+	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+};
+
+&micfil {
+	status = "disabled";
+};
+
+&sai1 {
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO00__LPI2C3_SDA			0x40000b9e
+			MX93_PAD_GPIO_IO01__LPI2C3_SCL			0x40000b9e
+		>;
+	};
+
+	pinctrl_reg_usdhc3_vmmc: regusdhc3vmmcgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO29__GPIO2_IO29			0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_pwrseq: usdhc3pwrseqgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3wlangrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO15__GPIO2_IO15			0x31e
+		>;
+	};
+};
-- 
2.37.1

