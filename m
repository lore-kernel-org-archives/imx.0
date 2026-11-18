Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795045879;
	b=N4a5o4XvhRlKRGfABRDM+n8AGEIMeGIbl2ILKwfhFMK0Sm+oy964djmP+g87o8OYGYue
	 ewlE+HTueumBBeT7lG/PNRt9l7Q3csw4Oy2TUUMJVlblzqr5YerESaQHUZZDnRNnz0Wcz
	 1iQ+K9f4on9XodquAcsWsuXJ4im0LvqzANEZmHV+wbI32nObXfSSZjxREeq8oRcv9y6u/
	 34pX6b72jILDhBUnmvmf6jLu9uNtF0Ffy5mwJZKXLym32zPvmCgajy9APSa5lUjz3DaAG
	 2uW+B+HTFprIOJBjK0kvA/c93IAULT2UFwsfmuSHdipJkTCSj/YyLt2LWImlJT51FTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045879;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OS2YabY2TxbKlR9jvwOvf0olZyx4xN97j9V8ZiE5ffc=;
	b=ioxI+eruSazPGtAa6NynUcm2jqjvomHDOhbKKqwqetONQz6WZHnYi6gTbJNG+7J71wVu
	 HoTwWhZqoC+/GZVZzMtbAiWY5+UNpaNYxiozOYEuo11+4w7COi5GyZnPFXRdTnOYm8dpa
	 jnYSX2FR7u6tdCZh7n+CI32+Orf9aXM8GQFVWAImH+JAXJZ0/t1ZnDt5jC+ZFUHxpjRzV
	 OKnkc+Mj+SGfGu4a0dtVe8jaUv/w1F515c0A02aVIa61CHxt2at/2sWnIEuwlGbW9XzA1
	 g6qSDNKD2JMAJ3YhEUgss3I3pKyDw8+LoXqyD95ZOtaCHDT5lwWvWj2BIYY9LDCOyaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gVeRSJH4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.54
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013054.outbound.protection.outlook.com [40.107.159.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D453606A32C
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 23:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D453606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=gVeRSJH4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rso8tDTIM81qtHitDMmr9u7DEuR4bGdM0Uz1IT38Wh2c+lTIxas8I85vapI2jNSMIrWdNfTnqrml2MiZbeBOJg4W/10E/orSw3+TojczBzkWojY+5DwdlLaxKKjJzOVYVYgPTo6AsEQ+KtEDNTsSjx1V+kytrrBFQMVnDT0xtndEoVpeLvOHN0AYK1CL4k8ckCOrYtkNV5HsZOrysBsE9xQbWCRs9QKEE8FmBOuVQx7xpH460uChIDmFgFzwoqakdYAirgt/0C8wJGBJtdqO9adc4NRvDW6vSyW7p/MuXxsPsZJcsIHWRq82XLrR4cgyNuoXCOpNlGvAzqxyHx0Zag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OS2YabY2TxbKlR9jvwOvf0olZyx4xN97j9V8ZiE5ffc=;
 b=E7wfWFVhGXY5VkAcDawwkP/g8/RJpQxujPo5vdiJsoEweRIi8C+V3L/MOce5hdrdfpO8Klw7pybbQ4oYhYD8X5HVML1KnwFLMHqHLT0BHB9wDQ+f1yKSozmUIpB4qtxHVUw1w654M5yYP76EgnCHqgSDt6S+0xirK0CwpFn7C77TPyiVTcC+Rm1T7rIh8Zx1g4bBvd/4c2CdlFxdOqFaxQli8XdIYsmJw6iY2AAzrufeyerDSIdp7c8GxuUtEzjjOxKUIkNWgotwo2JaaDe6CiNER7nB1CuW7GvE/HOKTvYS+OEsKRxB9cfqTY2WVLv/IHD3WdQ8fZJPIEYqbPXbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OS2YabY2TxbKlR9jvwOvf0olZyx4xN97j9V8ZiE5ffc=;
 b=gVeRSJH4FEDMrcZsfSKPHHCfokADD4GyOxeSDyf69Byp54CgWPqWw1eJZZDqwKgbvtYn/lNfOT+a6KjyrZlMBSfshowCVq07IQUtOUHkFNxXxBr+nEW92npTR7Sv4wNIwKgoVtGyhCoPTOV/deGCK0Fm4J2kQWNsPTI+/V2qDzOkqTD/+JUtY3p/jPQCy6yvDEAFJzT/PIBKrI6sisA5Sm5Q6JjyUS4xIRBNntAgXasdVDBu2wCcTgK0HMW5P6cvSC5Ze0JPYQAXj9iX6BKQTqzzCfNAxLXqHZeIAKXPWfWNDULD3IGwMA0DDCTFoIAx8Vg5HXuYTIdI4/imWPIZpg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by ZR6PR04MB456611.eurprd04.prod.outlook.com (2603:10a6:910:d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:51:16 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 23:51:16 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 net 3/4] net: enetc: fall back to software TX csum for too long L3 headers
Date: Thu, 19 Nov 2026 01:50:54 +0200
Message-ID: <20261118235055.1225115-4-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
References: <20261118235055.1225115-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::32) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|ZR6PR04MB456611:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ddaec8c-4c4e-47fa-da48-08df45ced60e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|19092799006|10070799003|261102123227099003|10067099003|261021121427099003|56012099006|11063799006|261026121527099003|261102130727099003|261022075727099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AgpCjH0BIGogVR3uolEjPYVcotj6WCt4g8yjcKTM9Rnx7k1v0UH8FcwAmQbLYEsRbKkYpgU+dvQUddSEND2HpmQpwVMyPDk7y7tXNBZzA9uVTQgzoTO8iXdsug+3CjI6h0cZVovjDPT69z5WcJes0z26YhDxKW/KdQK1ap8gt5s82NYPRfusBl9guNE0TlBHMt8MbMTD8Nts5z+PEyOMdOYz2OB9aODZWpEeq7aZSO9Vtz652XeZihg99PougdSfo/wuVkxaHCrYkA/aeDKXcnsk7QmRmm1sZ6XCaQy6blBh7wJOSMkQl4Uj6PNDsF5b4LPYhI50BQ/FGfGgE82AxZEIqUjmMKQNDeb9yzhe4Oi+5ipU/xFADjjVY5eXcC3A3F1oODqI3lq4Ueq9Bt63SqsOFNjhbGI+6IaVih8jy1Jmbddmj1Tawj3TL0ajS7KsTpHnSQ7+mIVra5qQUTjExPcUT9ZhzA4D3v4w2rpyqCfSc4vKnhEK5kVyorVfILjbO8an2fgOyiczLCw/DAuIxlgnIrd0hVKafN1Tq/xEzxTIyNKaXE/jvPVAswazKKAtgJ+JpN6n5Kqj61gxdOhll/0ZMPekAmkcYRat5rN3H0Vrruh25dOI6bWI4Ectb42W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(19092799006)(10070799003)(261102123227099003)(10067099003)(261021121427099003)(56012099006)(11063799006)(261026121527099003)(261102130727099003)(261022075727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DcpC6i9vzEgcpm/0TStkmuF3xDfxZq+v1BzSNqMfAaRiapLiybNOqcvtALjM?=
 =?us-ascii?Q?W5nN52FMhqcljA2F5/1qWK+QbpfEmf3tNbrMSahIMoGWa3jvEVUNr0jUYYhp?=
 =?us-ascii?Q?zOK7NVDTuOZg0InBRFhfEwOYgjuLiQnqoI4zFpdD2o6wkFu/qDbIUBvUIi4N?=
 =?us-ascii?Q?A1hNOevEJ/xe6XZOItivbpfn0NkM73+a1hMncFQqPhZXKrimymqRx7iqNSzq?=
 =?us-ascii?Q?LCp7saQ1H1msT9xe7XZ+WYwyN0t3FkbJ+7L6ixMjBuKwkXv/GLVDPMy/baT5?=
 =?us-ascii?Q?FCe35R7byvMEfWe/SrdRa1oVooGxL2l9Je7/QSkSPkZbt14oCIHL3g9/9xH2?=
 =?us-ascii?Q?tzht0Rux/eUOXlvcwT/yNsRuJbjlJ7HI/OAzcxVZrLEHo6Rx+PcWu53NTy5u?=
 =?us-ascii?Q?VVU3zqWxSy5XYX4Hwp9ovcthw9/3IpgWsEv4bPDTnfPxx3Uo5xOoSss7k//S?=
 =?us-ascii?Q?rnLYcLmNx595rpCcpxZR++0x2O7cyBx37XwLjntxvYllWA3PNMFW8CHnBCPL?=
 =?us-ascii?Q?5zauRNYO5JsTS0kubCRi0wbTIdkOesZFt9qVNfzxUmuDkUZAb/t3z2sVEsa5?=
 =?us-ascii?Q?IIFSXYZDQoAKJBfqE06hH8EMvf3ZtkrRvSkYROTGJqnb0ligsCyTmilprsO2?=
 =?us-ascii?Q?CMMLXlINdErFu4q0CYPYzn9LnFsKjC1NZ/GyC/jZFoitDKmmvD1y74HY/tz/?=
 =?us-ascii?Q?68kyXuY7My9tMXePNUNNBwbgE1/NcRAVuWKxKqos2bvsJ+l1B1aCH8pQfhtY?=
 =?us-ascii?Q?J2gRG2+nC2m1ttydZMv09Op3M4rts0krHkIO31feu8J7Pf3SdzKySUhY22Ye?=
 =?us-ascii?Q?o6WLUsh9n2Q5pYSivwTDIuLyLhZUZac491M38cKBiBF+lWOlAGpBfX3asPjL?=
 =?us-ascii?Q?4LA2bn6t3nxAc3HrUc7yP6zUR580sfMAkQ/jeNagmIPf904+eJagG8Ag1yi3?=
 =?us-ascii?Q?eJg2GiiXtcHszQ9CzBHyvNqfCNhV95GNpc2Nvsasm/t+4lIJP/rKrb4PxHYr?=
 =?us-ascii?Q?UsbqcHrbeo9YQEfxC1RKOtk/iEgrMGnuHcYBzmSfftpRvZrVYMSb4q4szY1z?=
 =?us-ascii?Q?Mvcl+SQUfaeBTGE6mZWG4JD8aN0IYSDrjjl3oxGtdm6352FdpRLpcnr2W12G?=
 =?us-ascii?Q?X3Zxa4pwBpaS7rxO98OTWiRq1IUvSgrvhmRbV5qKNzIodN3TlL8X/U3ebe7n?=
 =?us-ascii?Q?V18RCQhjrKFohO+G4t+I342zSfn0ZfX6qR/bQ2l50XCPi2w8nlqQchWb+aDT?=
 =?us-ascii?Q?9pw+ihZP+B3WgXfpvdGfYFMEms9F2G3cY3gBHHSHTE4+ZqhAgfg308i84wiu?=
 =?us-ascii?Q?8AJj2+kL4G6+pLsqaDANooddI4myYV0Tp790CYW8nU8eB5RcBnEuME2rhvF6?=
 =?us-ascii?Q?/PAA/V2CLkVwN5T2kevK4Wh/hqwYHT2bPUCe8BOypimU9SGYkJXXJsuJwMkG?=
 =?us-ascii?Q?d4p5K1w1jX6N9sRx541OLFFtzf8ECx7WbEQQH2HcfQx1FFKBSwFgb/JhXAh9?=
 =?us-ascii?Q?f0UT7DYszkEyVLpdyidyqxeF0vwZTSiJ1KVdkLEM77QakEWLVK/2hINcxGqp?=
 =?us-ascii?Q?BmQFLe+maEUEoFVcf3pZpxN60fYn5hYynl4EkVXqaaTqolFZUWcoUbQcMs+6?=
 =?us-ascii?Q?4KUiCUbFcrfG/NlapE8vlV/rOCdfXTQB9Wq6NEMg4fMrxOopD7OLlhMMfGJQ?=
 =?us-ascii?Q?/cU0l2DDrM5p1SH26d5fzlx6jVCYBL6dO8Wy3FtE63jg23b17R9eWxb9cXle?=
 =?us-ascii?Q?XbCn4aFdk1ki0bn4ELGC9/lKAqdv7sk+mUOEoEDpCUn48Ch16qdcD5btU/5l?=
X-MS-Exchange-AntiSpam-MessageData-1: WwkogTHyeI5dVw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddaec8c-4c4e-47fa-da48-08df45ced60e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:51:16.7803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bdXequ4fd+JEOiTUjVDo6wApos2dDLhCI00YwXV71rml32eu1XVoCY+uW0nCM3QLcAK1R4ynLedHW92Y2+ZdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR6PR04MB456611

For L4 checksum offload, enetc_map_tx_buffs() programs the following TX
BD fields: ENETC_TX_BD_L3_START <- skb_network_offset(skb) and
ENETC_TX_BD_L3_HDR_LEN <- skb_network_header_len(skb) / 4.

These fields are passed this way so that the hardware simultaneously
knows the L3 header start (for computing the pseudo-header) and the L4
header start (by summing up L3_START + 4 x L3_HDR_SIZE) which is the
csum_start.

Section 106.3.5.1.2.1.3.5 Transmit Checksum Offload of the i.MX95 RM
has this statement:

  BD[L3_START] + (BD[L3_HDR_SIZE] x 4) is set to the offset within the
  packet to begin checksumming. (BD[L3_START] + (BD[L3_HDR_SIZE] x 4) +
  any hardware inserted tags) must be smaller than 127 bytes.

We have no test for this condition, and with IPv6 extension headers it
is possible for that sum to actually exceed 127 bytes. For example, when
using the Segment Routing Header, 4 Segment Identifiers (SIDs) will
produce an L4 header offset of 126 bytes (OK), while 5 SIDs will produce
an L4 offset of 142 bytes (not OK).

The hardware picks up these packets from the TX ring, identifies the
incorrect header length, refuses to send them, updates the TX BD
writeback with the STATUS field set to 1, meaning:

  Programming error
  An error exists in either the Tx BD, the Tx ring registers, or some
  combination of these which meant that this frame could not be
  transmitted.

releases the buffer and updates tx_ring->stats.packets and
tx_ring->stats.bytes as if the packets were sent (but no MAC counter
updates).

This error can only be seen through manual code instrumentation, since
the driver only checks the writeback when it sets tx_swbd->check_wb, and
it does that for taprio offload and for 2-step TX timestamping.

Issue found while investigating Sashiko's question "Can a 256-byte
header still break the hardware LSO path because lso->hdr_len is a u8?":
https://lore.kernel.org/imx/sashiko-outbox-211955@kernel.org/

and was reproduced using:
https://gist.github.com/vladimiroltean/7cecf636b788b29f361a2fbdae646010

Turns out, LSO breaks sooner than the assumed 256 byte limit, because of
the checksum offload feature it depends on.

LS1028A also declares the NETIF_F_HW_CSUM feature in order for GSO to be
passed to the driver for software segmentation, but performs the
checksum in software - either through csum_partial()/csum_block_add()
for GSO, or through skb_checksum_help() for non-GSO. Point being, it
does not use the HW offload engine, does not have the limitation, and is
the reason why we need to discern using the ENETC_F_TXCSUM bit from
priv->active_offloads instead.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v2: patch is new
---
 drivers/net/ethernet/freescale/enetc/enetc.c | 16 ++++++++++++++++
 drivers/net/ethernet/freescale/enetc/enetc.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 7f089a84d9a6..6cc519eea5bd 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -1114,6 +1114,16 @@ netdev_tx_t enetc_xmit(struct sk_buff *skb, struct net_device *ndev)
 }
 EXPORT_SYMBOL_GPL(enetc_xmit);
 
+static bool enetc_skb_l4_too_deep(const struct sk_buff *skb)
+{
+	unsigned int l4_offset = skb_checksum_start_offset(skb);
+
+	if (skb_vlan_tag_present(skb))
+		l4_offset += VLAN_HLEN;
+
+	return l4_offset >= ENETC_TX_CSUM_MAX_L4_OFFSET;
+}
+
 netdev_features_t enetc_features_check(struct sk_buff *skb,
 				       struct net_device *ndev,
 				       netdev_features_t features)
@@ -1122,6 +1132,12 @@ netdev_features_t enetc_features_check(struct sk_buff *skb,
 
 	features = vlan_features_check(skb, features);
 
+	if (priv->active_offloads & ENETC_F_TXCSUM &&
+	    skb->ip_summed == CHECKSUM_PARTIAL && enetc_skb_l4_too_deep(skb)) {
+		features &= ~(NETIF_F_CSUM_MASK | NETIF_F_GSO_MASK);
+		return features;
+	}
+
 	if (!skb_is_gso(skb) || enetc_skb_uses_lso(priv, skb))
 		return features;
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 1e3290d1a388..5b8cffd589c7 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -75,6 +75,7 @@ struct enetc_lso_t {
 	int	total_len; /* total data length, not include LSO header */
 };
 
+#define ENETC_TX_CSUM_MAX_L4_OFFSET	127
 #define ENETC_LSO_MAX_DATA_LEN		SZ_256K
 
 #define ENETC_RX_MAXFRM_SIZE	ENETC_MAC_MAXFRM_SIZE
-- 
2.53.0

