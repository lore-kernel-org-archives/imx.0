Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963740;
	b=W86Vd/cgH7T+HXcK4ISPAQ/hmFMsuoeHq66rAmp4bzKHGwdWp4dRokVAW5tvBRmwHaGW
	 DxeODn0VwhvIsAM+kd+3756ej7VA/rFaeviPK7AY2e4k/D7WsEgR+rcN+jc/uqRxSLU4f
	 1ajj+m+xAOWyW2q+KBtR/4/bZDOasS4DubI5xNsLnz3huwnd4IqD63WLlWaxsgEnnDpbR
	 FvqkItn2vSbnYU5eNPDSiGGid6m5DbUqMclMOTjJ4aeZk4cjrw1CUDn8STQrBiJAsL0LQ
	 ioj7p21Y7mr9IEUz4QEqTiDQmrz4jdD0yCl92S9kRxQ9u/e3wBRInzAqvWR2y23hzlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963740;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rJfbMV1D1E09kNxCiZkp8E1nxi77w4UEl1293r+ObvM=;
	b=KG2EI4AYmPxn9U9Z8FMXwUzqKALNUpCaBBiKin1EAu+0dGo0huhzT/QQ3LIDwFzUuWzm
	 6Gvfw/25x2H2U6yLUEv53b+cAjeqOEHksHQseq8cT1qCnG3ZGTk0n1gim5RnTJuw3f0mK
	 Fc8k2VyNO4pfBZl3E8AL4bImsPrNZfA8L6pjG+WTEo02Z+g1nCkHqBsMgszW6zLYodalu
	 dqTt/c0kXCVteCuQ5wyS3UiT4FKyljtmtKv9OfKdhBlOZ/iUW4x/cDZ/35abcW4i3jGOU
	 PlTyBIu0ODkI0mQVO9JEoULJXTpMubTHbyiXPprgXYomDJPseuT/BdsTN/qNTNI81AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="evzH/YNw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.56
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013056.outbound.protection.outlook.com [40.107.162.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272A3606A827
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 11:15:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272A3606A827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=evzH/YNw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVRC5+rX614pvL9pmWYi6nDots4yo+44OWmLSqzr2gbC/BsCTywtIezLaD2qm/uMWSxoEnozVA9Rh6DUtwWJOw2QC/Tm12wJv0cWxoiHffSNEQtLTVx90LfzsVK/fGako8YkJFjbGKE9+brHRYlciz4FlaYy9FD2PpOUcURyJt/QA31dX19lG9NIgTdxi8aZaY3qD3FMO2JevPWh6Nfga7hLfkdeUt0W3MQsVhZhlowUfkmT+M3vgW5ztSnacWcs+mFV3XiNpfDgLLh9rVSA/YgFIst1Ka6253w8V2PUUW7jtSrLhv8Uk7glVfpmGPWhXT2aE6TomdMBtu0d+O5n6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJfbMV1D1E09kNxCiZkp8E1nxi77w4UEl1293r+ObvM=;
 b=WpaYc1WQn7bD3dOqNgiYAN+yOVIPqKtq3joS15dfaTo6rSa8l4G689Ia17Y5yWXpDMpcQMLOHn8Tc5LmHaNV3L5yN2PWQQn8C8CaZ+vCFb9Ot4dTJTzQm1uY8zyeJbl4+yzHaO6RsdQ31rbEDTJzVMBeYRBI1GPN7EyZO5KnNmrwchTmGbOk+yZdaGc6vfVSy9AY/SroskYmIzPbrB42hhwlMmikWyH3zuUwyfueQfsKc8XTi2DAG84DGtxMnXR4bnZAkdGUYmllo8N13Yl+ja9pmIh9xJSm2lI3BQ8EfUtEfm/aMrpWH4fOyfw8o9/5iMfY+NUp0kGw1TEvRFphVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJfbMV1D1E09kNxCiZkp8E1nxi77w4UEl1293r+ObvM=;
 b=evzH/YNwFlnE5Fj5l+7oKvnfdXF1qEoK3zsq7uS0edvhWAGUqMpmsBko5IBsIjl4L3hAzly9Ev/qzf3tkGGktLWdRYItSa1yehCnU9PA83IG66k17m4vHbbevl9MwuhcuvNCiwcC4NrVa56XoAdkF5te0vVSWyyncxkIa/6W1Zd01SmCztwgpkIeUQAzIc8fj1aArqScjqBfEMh1IHykYJjJBYhQqOhXhbMrFEchYtCXLRpUMnmNeUQ4+NFBmCO3RUmyUBM38xWzdet8cMN2lH8CkYrIhylnBNVH0/s96LdEfHJv0ppZNO1niXRmDxkTRejc12LhdMxUYhphLBvyIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DB9PR04MB8251.eurprd04.prod.outlook.com (2603:10a6:10:24f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 11:15:36 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 11:15:36 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH 2/2] usb: dwc3: imx8mp: set needs_full_reinit as true
Date: Fri,  6 Nov 2026 19:19:43 +0800
Message-Id: <20261106111943.2868733-3-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106111943.2868733-1-xu.yang_2@oss.nxp.com>
References: <20261106111943.2868733-1-xu.yang_2@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0045.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::19) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DB9PR04MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c5f768-2a1c-462b-bd3c-08df3bf7482e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|19092799006|261022105027099003|11063799006|56012099006|261026121527099003|261009223027099003|261026140227099003|261102123227099003|261021121427099003|10067099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UlO4GIfKVThnf0GwHIU6rrsSAK2WA1oSDyF57j6KSbn2AX02VrZDrkPnG5oilULEoWoyEl3EOW+4cdiTYV1sLgNbqyiG+0LbwAArWrKgwztRgtaNKCgAHSye+WzLMIeBRrqJGaiYD3a3qGSc6PEM0z0YfZZw3cYS87ptYBRHK0avz92ENUTNAz9OnZLnAYnl7i4RjOPy64PIS0FNALLENqA/SrBGcRN011wW8/dBKrdhyWhqfvOCsaPshsQNlXvx0v5GPd1rHbqOP4H91dMCNITBAhsXTQtIgWVDdul/tStrvFcnnRPijRyoW+xdDC+n0v3T6gkcY6u4acBglA9GRUhf/fQpahTJZyynBOgOKqjhu2XJybccQZ7d+CO2eGjqaSraJ06CXpZQIuophPwZkHdjOiWDNiMOYrXBmbpQvNXO8bvrsm99XXmAq1aj/HE8X/frYZGbk1floWOvw6x5Nz0NrObW5jhEBYjyqpXCwoNaHaYqrTw3eCT0msGOizeQ6QtROF4DalDMt77LCzbB1H53TgjIglLtKJghGKDmIUHsLNi9UY/d8TwCAfoX3Rw2gHztg/VsoUP13Uf7edy5Xa7i9zJPMjXQuEx4v/ONwDjLGOw+hDJ9l9AozDe/L1yD6SHRovE0sJvokFds6w5B6OAlkLogvG82whMI/d0xv7s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(19092799006)(261022105027099003)(11063799006)(56012099006)(261026121527099003)(261009223027099003)(261026140227099003)(261102123227099003)(261021121427099003)(10067099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Za9ZDeJsRYDKRN7xzdhSmw6AJKtZNl4VBTMtEdJujVAifAk3SP/9DNqBqEXI?=
 =?us-ascii?Q?LgTLbEHBoEGK/CR/yE5hgL5VhQPDuKXUND7rRSikd+hAGGvxd0v25BuOedMs?=
 =?us-ascii?Q?QGCJBgM30ntqpBpAn5aJyyTaQ0pYnftMJJbtar236yBkMbc4aNE1Unnni2+g?=
 =?us-ascii?Q?Qfaul7/YD+YVdetuXP9AQY8k2U3XTvCV0cZPRZmgAs1g6DUSQA6weZpq5MXO?=
 =?us-ascii?Q?GcQn2+cyq/YTJETPTcQeNZXl6eT9kz7eqlqtiyNbozoSKoELA2HNQw6LevuC?=
 =?us-ascii?Q?Ge9qAmNkYccFMxE1NMP2lxmXxZ6OfcJ9ep96TJ2oPYAXiu7gc7TZ3yFqEbEn?=
 =?us-ascii?Q?wkFR6UznibbyKk+1GUZvAFRTIn0H96gpwtbFHYFKxGPlVY4d9YFBo3zvZx3k?=
 =?us-ascii?Q?mpADmF0DN0pEd7lEqnX/1e5rmwmCvFzaTndUdK+yfAJuxVzcz/ziuzZ9MA2u?=
 =?us-ascii?Q?6AFOBgUqWs95P2FcplHAZC0tjuSoNNSkZ30AS1d/Xgdv//d0hAHVpTLCIDu1?=
 =?us-ascii?Q?5RbsH3JltrlG2B1FLooUfBNB/RpggFkuKb1aSXZkv8pDJnhjACEyF2u/bgGV?=
 =?us-ascii?Q?S5q51WtSBxY/1O8e+5U6cMS5Sn1zyKfXJmpbYGkqf80YOsE174Dq+Z7tVSpB?=
 =?us-ascii?Q?ysGEQdY7RmM2PEYvq3iKlClgeQA1aeNPIiiV250q/LLM5V571djL5dle8WGB?=
 =?us-ascii?Q?94ELBfROAPDrpAdOliTqgYoWyP0hKkIYZBdQqcG1249LMXXvyCq3+wlN+5Wt?=
 =?us-ascii?Q?E518fQIvQHqwaZUce9BGxlw/t6I8VhX0TVPxTSEDFIhLMPYgVjd0rtMtwNZ9?=
 =?us-ascii?Q?dwGWzLz8gAq6CeCuaVTA/eV5s97RZsOHtKvvMIQTqLT0Z0n65EX4jkvr30b0?=
 =?us-ascii?Q?7vXK4eh5zVu7DS3/TJ2AuU3R/U2K7kCRVx3i13nh6uSaJKUpHMK3RSmeeCyX?=
 =?us-ascii?Q?rCpJrbRMaoNi/zcmo2K5SYogjk0FiHTYFdZI8y2y6oJ0G0N4JXr4cXrVZ7cx?=
 =?us-ascii?Q?OgHHiA/JbK6I/UlIEqG2JirDS95BZ3/2hrQOMXdcIqVQtxo85wen5RNnPNeG?=
 =?us-ascii?Q?OOqyaFVxeDgjLW8JY56tsbEZxICFRz8gNeAfxYsTihREypZ2Livcenai4PiL?=
 =?us-ascii?Q?gJKr5KVr+6u6huxBu/X/rf0YbWGXS+uK4Wc16QZNjtrqaxpHIoAq+2raiGBC?=
 =?us-ascii?Q?f+mCj2B/CqyUbD7oCQknYI+XzzunIWUdhUAy5RE2OQXA4tLXzlcYQx1/Bwr0?=
 =?us-ascii?Q?pZQFDfzHpdlEPelqBnmTzDQ7ZJUXVlEVzUR/oExNQ6v4Tab+a9IYl9MDDx0h?=
 =?us-ascii?Q?EcaGnadi6G9z+2CQqdTHN23r5lWz+ye4KZKYCS5iHMqBHpPxCDzHM/hfOn0b?=
 =?us-ascii?Q?JolqRABdRiBBEuvz1IeN4KYt9WAmle3fzDkfjhXVMHn69894fsPzTsFXj6q2?=
 =?us-ascii?Q?QtTsyLBSvYXVdtE55veQnlfAzeKAQ9ntA+UHW44lax/VWwplavM6Y/IEVFda?=
 =?us-ascii?Q?Rux0ULGDbTLUOUblpBdsjfyIOQjsbyi0ku4gJkdBICVeVyEIyXcov8pZB1Oh?=
 =?us-ascii?Q?OKjXZK9d8ZcbLEEtCz1cUAiuHnB7IV8UghZSnCUOu9zISED0xNvhWDYj30zc?=
 =?us-ascii?Q?bLcgqQ31DgSlY93kuhFKlT44W8dfMng4YS0NPvKzETLKoBl7EZqvI0tKDDVx?=
 =?us-ascii?Q?qY2tomB57jTMIdN7KwsjD3VTQRlpTn1Qv8TgLTvz7Deuu4E9Fazp1BF5TCmi?=
 =?us-ascii?Q?MNsIY+KeIIXUPcGjA1wEOI9vlMvsbcgPq+NeU3K9ASZPdAajgiyE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c5f768-2a1c-462b-bd3c-08df3bf7482e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 11:15:36.5029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAQpAsUwEUieFyRma5gRwmjNbl12SIdejIQhdpQyEJ4TLV0TunHYfP5C93nOkwiLSokGkgBsq10z74jnYmKAfGt0Ws4+idx30/+fTdFiyWNoDjPNjkFq1v5sNhEWWN0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8251

From: Xu Yang <xu.yang_2@nxp.com>

On i.MX8MP Soc, the USB3 Controller power will not be maintained in system
suspened state. Setting dwc3->needs_full_reinit as true to indicate the
controller should be re-initialized after system PM operations.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index ee92a5efaa6e..78cb79fefba2 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -267,6 +267,7 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	}
 
 	dwc3->glue_ops = &dwc3_imx_glue_ops;
+	dwc3->needs_full_reinit = true;
 
 	if (dwc3->dr_mode == USB_DR_MODE_HOST)
 		pm_runtime_dont_use_autosuspend(dwc3->dev);
-- 
2.34.1

