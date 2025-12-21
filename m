Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023126.outbound.protection.outlook.com [40.107.159.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE0F207A32
	for <imx@lists.linux.dev>; Sun, 21 Dec 2025 11:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.126
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766316556; cv=fail; b=GJGCFfru0WDjJKUBzBlGAMA/TpQuVXvGgFcrGZ3Z7KGqHz3AUfCxNbaBMrIDw/dsNDi56Da0go35QlYyRgj8dLcAYYJ/ZC2rHGxHEMLHql7nhNZEneDxvcDtj71a/t69GseZVQBdYIr5K1OkblLXP8X10XpGR66bi5LNhEBcxbQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766316556; c=relaxed/simple;
	bh=Kl7qs2kRSLFFQpQVSybj78AuKz9DJ9NyJwbCsOe9ybs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=M76qwFQXpc2EejHfq7sfBYIypuYmOoUdd6mIxtngoPevQwr9yyNBQXbfqGqEy+2gmQ/saFwyBWcLrvW+BvHfTNOh3WAl0Sa03MlAHLZdx1VLhZW+67rhXhdHTY8fsWxVceKfHqOPJwciq0VvKU0k9nw44o7D+doK+xL+hWembIA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=AGYV+iB6; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=AGYV+iB6; arc=fail smtp.client-ip=40.107.159.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="AGYV+iB6";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="AGYV+iB6"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mv3OREuPosWso3ctX8G48EbSW0ZOQhxEcL4RW+jTBeQOwHXEpp3LrckanqAyPgcLIePhlkKfVIHbeU9CWn1qUz+wPshel+qkk7zJSd/Al9NnCQx/g5h72IbrZ3jjIxZggVqG1WBSy0WL01NExiuvAHVFYIWCi79qD3VfvyVp+FNec04EIDvjAH08AjDB534l9hFWHazNMS9Twby+ZeJEP/bpuHbzDMyrXJsVni60niHIe2THKpk5XlpQUQ7uXSg6QkfJvTUOjAJJdrZbT8lWhDgn45S3fzhm1I6+DDH5dYcYC41OlUJyQxUcbxpdJdgXB7Ka6lBj31dBOo0SECB84Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Yp5buqUeHaR/ZGsfSU/hrmQtyJHcpVT+Xrpeqg2G34=;
 b=fv1vAMjvuJ2Dudxiq3RYeEKk/M3HpUtTJesNFc8/7pSv2RcUg6g4iLS8TDJY7AujIg5EIx09UiHU9SrvHcaaY9tscOYXvoqjLqk4jSdxOURIO5foPvMgXmKOpmcV8hA5Y86P+SwWEvWAJg4hEIwLOa6zTAOepgn4+dBr+WlR/R3ug3y8G8FXzN9/ro+MI16KgD/Wkg7IrpvyOo77+I/7xa7xpVRZdH5nSiARA776eISDjHyaPPddCUTWamhon1cR0K4uxEFKgIz9ZACnb+92Rp3L+p5iATkzhM+yFrSoV+LQSUWM6rBC4fDr0JqAgsqtmLMVPOXScVdD+AF2jmjPBg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Yp5buqUeHaR/ZGsfSU/hrmQtyJHcpVT+Xrpeqg2G34=;
 b=AGYV+iB6ck1AXZYM8W/d/X2XU6y3V70nFm9+p4S9QHF5DDQtPjALZV9TutkdpueaQhGNgiJ5UsCjXpkTIzA4JZ9E1Wh1GWbLbW7WvioQcvmBC6eLltMJlHyTggOFCwkt65WX5YIQsjNhgQRAhwk1srw4Z4JyLy1wI2zLZJBEtQA=
Received: from AM0PR02CA0110.eurprd02.prod.outlook.com (2603:10a6:20b:28c::7)
 by PA6PR04MB11733.eurprd04.prod.outlook.com (2603:10a6:102:51f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 11:29:09 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::3c) by AM0PR02CA0110.outlook.office365.com
 (2603:10a6:20b:28c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Sun,
 21 Dec 2025 11:29:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Sun, 21 Dec 2025 11:29:09 +0000
Received: from emails-4950292-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-225.eu-west-1.compute.internal [10.20.6.225])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 1EB048003D;
	Sun, 21 Dec 2025 11:29:09 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1766316549; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=5Yp5buqUeHaR/ZGsfSU/hrmQtyJHcpVT+Xrpeqg2G34=;
 b=fooo5Dh4qDvMB9h1WIDyAcIULpQfaAS0bqKmpz81YjePsFomNh8MJIzpXiigMR2iQLLPn
 rxRTMZ0a2QkDU2mbZK/eD8ImTT9FKGI0e/iRhNnPLIzz+ytq+4d75Z9g0EmCKs173utiRtb
 Jckcaerh6KFCFdIsL2yfC85LtWNRNFQ=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1766316549;
 b=WZcNYICaXJ1xTGZoaOVTnM9fX3xRxWXGvttBYoQizXIcU+C/FIURgonZXZ9dvNmTS/iqx
 8W1H/wB6deWrCCkpGjvB4PoXonj3K1r0gy2UZwcYpvEJqqE84V26xiqoSvqk/a/T8P0JF4O
 Ynpd9NiPFmlxZ5pNdRWLOM18a+bvJIU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZGKoh0SB3PTYvJRtcyGE9m8L3w7K/ETI60OMmIbxE1hwWa1LI502DBASH59KdgnU6YgtrULrQUqRSfJjyRWT6CKY8wiB4zH7gNNYAM6uYvRBW4mIW1DbLyLQ77uhx1X4BkCCN7Cn5N6+qNPPogbo09wqIJeFFe4ASJzrcG4fkdQ135lUB7q7Q+p1SZYrlFJsuthocj7Q6ASIUyQQ/6P8BTXMO+uJ5WAdPVa8E0NiSe+a1zhe8JokIO7omUr9hkttmevRJH2beF5T9ikfFytqFl6yGF7ZfbsLZa+Sj9I8zQFu7szcw6aFZPHzKwHnXg3YOqzlhwYmER2p4/HWdywQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Yp5buqUeHaR/ZGsfSU/hrmQtyJHcpVT+Xrpeqg2G34=;
 b=odBOHsZC6cCALn1PI0txcJf8QpR9JX4WREGbtBCXyW9jiClX6U+GZDIYozFE4CX58/usoli7ge82m8msBiMEZqIy8AIWqqx6sJvpplg9l8+WycypFwhCW1l2peSitcox7vxkpzSe2dWL3jySCSZpQP83VzReA536epl2Bz+fWtIWcN4QDj+dh0zsuA8PCZGYWuCUgGo26ZLLgM2AcApiQ3nY69Og8DGNMfbOKu7Mkp73YtU3iFpjeLBunFdmBjPiXcchKqo//BvHi8MRwTyqHeKPOTc0aU/ZsUoF2iO9ODCkoV98i2iCtWrmMbvmOcsOwYndnrVQZvPu6AODhYueuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Yp5buqUeHaR/ZGsfSU/hrmQtyJHcpVT+Xrpeqg2G34=;
 b=AGYV+iB6ck1AXZYM8W/d/X2XU6y3V70nFm9+p4S9QHF5DDQtPjALZV9TutkdpueaQhGNgiJ5UsCjXpkTIzA4JZ9E1Wh1GWbLbW7WvioQcvmBC6eLltMJlHyTggOFCwkt65WX5YIQsjNhgQRAhwk1srw4Z4JyLy1wI2zLZJBEtQA=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Sun, 21 Dec
 2025 11:28:55 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 11:28:55 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 21 Dec 2025 12:28:50 +0100
Subject: [PATCH v5 1/7] dt-bindings: arm: fsl: Add various solidrun i.mx8m
 boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-imx8mp-hb-iiot-v5-1-4a4dad916348@solid-run.com>
References: <20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com>
In-Reply-To: <20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|GV1PR04MB11037:EE_|AM3PEPF0000A79B:EE_|PA6PR04MB11733:EE_
X-MS-Office365-Filtering-Correlation-Id: 2989ff6c-b0c2-4e0f-d4ab-08de408428b4
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OGNIR3U1NGl6a0s5SzRiaitSQ1VSV2E0Mnpnbi9VaHYvWDQ3bFVNSnhFakxH?=
 =?utf-8?B?SUQrMTBkWlQvejlFNXFJMi9iNjVnMTBVY29MMFdzd2RyaGdEelhJUmE1MlZs?=
 =?utf-8?B?eWI3ZW1iYlJsYlVPQ3N2cm9uOTg5SVlmeVE2c2IrQ0ErNFNQc3M3WWJrQnlM?=
 =?utf-8?B?Y044RlVhaGVDS2Jnb3pWMmtWcjIwbi96RFI3MS90NzBrUmhhemhjUGFGMnJu?=
 =?utf-8?B?U2Q4OUVldXdxR3dqOTE0MElLQlEvREgzbTNZQjQySU8rS20yRW9QZmU2NlRa?=
 =?utf-8?B?VzZKbXlIZXZ2TWZJdWdUZTNzWWdLQTVrRnFzU2plcENCWnhTYmk2TElSU3Jn?=
 =?utf-8?B?ekRXYVZsUWxPUWFvQVA3MFN1VDVtRi9HbFc1REFnbmtVeDNFZHozZEV2bW5W?=
 =?utf-8?B?UmNDYkl2R1l2QUpVVDdxUUthVm9HeldlaUt5c1JZcUNxNFlpS1VwZlBqb2xw?=
 =?utf-8?B?Sll5dEh6c2tuQnZHbnVxWGMxVmxpVTlhNjUvV2k5bW9aRnNzS1Rva2FTOUdr?=
 =?utf-8?B?cnNaNDlGM2NjeGlLK1dyNUU5STRxY3BzV2hZMHY0TWszUUpCSHliajRucldk?=
 =?utf-8?B?K0ExRlg0djVXYzBOeDNKN1pyekoyUDkwMXRpWitaMWI5UXdPMENZeE5aQk9Y?=
 =?utf-8?B?ZHRzWjM2MmRjOUhCbklITkduVXRIMWJXK3RCN0lROGpnQUIraXhGcFk3dHZ1?=
 =?utf-8?B?b0tQTHorYWYvbEF2UmpxdG85dlF2MjdMUmhoUWxCdVFCWXk3TStIOWFGUC8r?=
 =?utf-8?B?cE1DMTFwS3VaaEJGR1kzaEk2NHk3Y2QzSnJMbm9Ed1V1ZkZ6eW15Tm0vVGhC?=
 =?utf-8?B?V2RFQkZPWnJTb1hUbGVraVZ2N1dmRlBxRTJNdGNSWDFrSEtCejZaTHltUTVZ?=
 =?utf-8?B?d2h3andWVHp3eFNwTjlOT1RsZXVaZkJnUlcrb1FHRWhkSElrZDJ1OEVFMjVT?=
 =?utf-8?B?NjlDU2dhZGVFVDEzWE54SHNqbllkd0p6dWZXM0RMRmhzMmpwdzBPNUs5SkI2?=
 =?utf-8?B?KzM4Zkt4WjcwV3lqZjRrR0NheFYrWGRSRmVKVWdHWGxLaXdjVURzNFhxcUlT?=
 =?utf-8?B?Rm1mYTBxdEx2cGltZHJjVXc4ZEpuWjR6VFFNbGZwazBkdm9MOU1ySHd6MFJQ?=
 =?utf-8?B?Tzl1dnB4dHdkZ3BjM0pzS3lsREFBZi9xdXFTWXM3QndGaGpSR25FVmZCL2tH?=
 =?utf-8?B?c0tKdm5jSXh1cFVyc2x0VStuSFJhL0MwYXg5cDR2OXZwSis3OUtnMHBtVGlH?=
 =?utf-8?B?cUZvRHkzRlVpM1BZYVV1YzhOUHZ6L1lrYUZMdTNnVE5TUXdxR1k5QVQwN3FY?=
 =?utf-8?B?YVBmYWlqODYvYVpoblh5QUszQUJ6YVNqMG5wS0YzTXVSd0E5UnY3ZUpqN0Y2?=
 =?utf-8?B?ZHpLcWt0OUVwd1h6WEU0dGxzVEQ3Mjg0aFNnVTJCVURMRU12OE13Y3JhV0hZ?=
 =?utf-8?B?bExYS0k5a3duOU9kZGkrMmJ0aGZtUzIxYXRpbGJYVjFaVWlOMXVJWEdxd0ZU?=
 =?utf-8?B?RXVwZklnWG1WNFdxMXFFU0tYc1RHQzRjUFlRSmsvOGc5RzFZUHAzU2h3Njl1?=
 =?utf-8?B?cjJncStPOGkrazhwOHpnMUptN1crZmlVZ3gxWWNURml6RVZ4elVYTHJlbkoy?=
 =?utf-8?B?eERHb0Y4eVlZOGZUNWd0b0Mvd2JJeUQ1QzZBeUJrZlF4UCt0b2Q2WnJjZTUx?=
 =?utf-8?B?djFmZjE0aW1zdzR1UUluR21KbGhPQ0V0bXhWZmhCNE5jSktnZktzU3NjbUZL?=
 =?utf-8?B?WEdFakpBK2U2TDFMRUhpOXZQc3J2QnZjS04zRzlkaTkvMDRuWDNua2RKdFhE?=
 =?utf-8?B?UnFXWmFycnpJVU5NRkJxdVBQRGd6QUlpazgwMjdWVGI0SGlGOGJvNit3RUN3?=
 =?utf-8?B?NDFEbWNBcDUxK0dXeUdSRm5aUEN0N2ZVWkd2S0M2b1E2cGxseUdJeEhvS1dx?=
 =?utf-8?B?dmVuRUh5T3EwejNud0RSR05jeUJvWUx3UFpFT0FXdU9va092d0JONkRMM04r?=
 =?utf-8?B?RjJaZUVXT3R1bjNLNzArbWlLUmg4dHB3KzZ5d2pVcFM5RmMzSFBPZkRpSUVV?=
 =?utf-8?Q?w64RfK?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c841501ffd7b488580703e952efcd860:solidrun,office365_emails,sent,inline:35e54c167aa7ed56355d1a669f216403
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b49dd2c-8de0-4ea3-b452-08de40842001
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|35042699022|82310400026|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?em9aV1RqZEp3VlZpQ05aQUY3dnRkekovSjc1Yk5odFErZjNkTDlVaTV6akxJ?=
 =?utf-8?B?VHJnWENqVmJBMm1UMEd4Zyt3MTV6TmxjWjVRelQ2eDluMWswQitmN0prcFhq?=
 =?utf-8?B?UHhOZG5mTEVFWEVuUXlFczEwcTRCNWxId0xVU2laT1ZBRmw1TDJJTjhycmpu?=
 =?utf-8?B?cVJqV0xUcGFqZEpRWVdkU25UdEVZRzJVWkJJV3RnYWNoZXVxZEI2RjRGbjM2?=
 =?utf-8?B?VXFlNWJGaVJBdGZXeFIwNTl2eDRnVnluU3c4QjRhampXaVNEU3plckNDYnNV?=
 =?utf-8?B?S3NVMkpFNjdzT0RLNXN2c1Qzb0FHeENXVTVDRE1rbnZicmdOV0RtV1ZkbC9m?=
 =?utf-8?B?ZUFVM1dkQVFZSDA0Q21yMmlFTE1adWRhbHc0bVd3bFBOZEs0NXFUZGU4S3ov?=
 =?utf-8?B?cEhkbHpDUXAzTHBoVHJIQ09oVFlBc0dkUXlTUWRBa3ZldkQ5NHpDMktVd3pH?=
 =?utf-8?B?RStYbUJLa3NqRndOVFdJYzM0SjBxUnF1V3JNb25jSUloSTZMd0RaUVFFeHdp?=
 =?utf-8?B?NU84R2dZL1d1NThKYVhLNFBqZUFTeC9EY29hZStFZTg3U3BhRWtOdEVyR0sz?=
 =?utf-8?B?d0ZhV0hUczhDQVRmeE82dW94THM3ZXFIQUNkKzZWWWp6bE5TaDF3NC9aeVB1?=
 =?utf-8?B?aE1OWW94bUtsajNvUCtUYWk3S1Y1cDU3ZzN1b3pNWnhPQTYxajBCU2lIeHlx?=
 =?utf-8?B?SDhnSW9JbXgxN1BVc1I1WUZHU3hkMWh3SzZVN3hmdUFha2V1S0hZQm50Nm5t?=
 =?utf-8?B?VWZoODkzTzZpZk9Kby9NeVg1OTYrMGh1ajl5N054MkVaVFp5VjdrVTJVd1Fy?=
 =?utf-8?B?ZnBTdit1UWpwWHAzU2ZpN2xub3FEdzg1cDRWckl2WTk5dEtDVXgyQy9HTm9q?=
 =?utf-8?B?SWdxRVRNdnpEY1hSY3FIWDBoQ05EOHFUTnR6YnFHZlZ2OFF4Uy9zR3BDN25N?=
 =?utf-8?B?MUhkRFVUM0NtVXpPb1NPdmJkK04zL0FZMmpta1JzRnVWb0xHblNJQ09wV2xG?=
 =?utf-8?B?SHlqSyt1cnBpRjE0cWZkY0FaWmpmTWQydFFqaDlXNmI2Nnp6WVYwNWtHcGtr?=
 =?utf-8?B?U0k0S3hpSEhSem56cTFncjdKbWRzd3FJVHJ6R2VUMXltRzJ4Q2hEQ040Q1hJ?=
 =?utf-8?B?MFA1YmsyY3Zzd2xGVUxFUzRYdTZQZjF6MU1yS2FpR20xNUp3YlJzZ0kydnpj?=
 =?utf-8?B?WEgyZVlWZ1l2bUxuWHZhMnlEU1I5cEJuYlBUVG02Qk0yNTNpU1VxZTlFNnBw?=
 =?utf-8?B?RDFQS1h3K21ZMDZlNmhVZ3EybnNIM3dGRkJ5b1FjR3ZWVTVTT1l4ZGo5M01s?=
 =?utf-8?B?dUdPWlBsSWRDSUNFSllpZ3RWRzVTVHplMmRnd3hjTEwrWlRJNnB0UlQ4MkQw?=
 =?utf-8?B?WFR0ZDN6aWcrTWZ3N3FKS2UzcmxkVnFXOVlHVTE4ZGRxKzNCa2FkRWsyMXZY?=
 =?utf-8?B?NHptZGRDUWd5L3JHNUhrZDkvUGZYcWs1Ykl3eHZSSXF5NEtaUXVqS0MrV0pa?=
 =?utf-8?B?SSt5LzlWdDNYZ0JodkgzYTFKTCtWdGtmZnI1amdFRklhN0U0blNvV2czeTZt?=
 =?utf-8?B?OHlLVWNVYUJWWkpHbUp0QjhNVTZUalVOcjl2dWoySVFpZUtONStxc0JlcUp5?=
 =?utf-8?B?a3ZNL2JicEJ0SmFhSVJwYWFsam1CTzV6Rmt4dnVnbzlqalRxY2ZGb3pjd2w1?=
 =?utf-8?B?dk9QS2F2UWcwNy82c1JmWXhTR1ZrWUY0Qi9iVzdMbHkweEZQN25IdlI5Vmdr?=
 =?utf-8?B?OTVaSTVkdndyTHdzenA2QVpaZGRja2d3dVVabVBhMkJ1TUlEcDFDVTdMeTk2?=
 =?utf-8?B?Myt0MWdvVHd2clE1UWlMNUxoV0t4TmNadG9FVVhtWTFNbWR2c2xJa01HcmNO?=
 =?utf-8?B?UXBnUThYb2ZwQVo2L3FGU2E0RDY0aHd3SjZzNmhDVzY5ZlZHeXRFTm5VMFQr?=
 =?utf-8?B?UnNJZE1BSUhZVXo1RnhCdlgwVmJxVjhCUGpUMFk5dEJWTE54YjAvYi9YVlZ1?=
 =?utf-8?B?YXFQTjEyNEdkYVpwZDE2VTZtYi92Wlk0TWNyQzI3djYxa3UvTEZUMVVNTGRz?=
 =?utf-8?B?Wm5kQnpoeExIVFVnS04wdElzKzBJNWFiV2tRSXBmZ0hmL0E1NitodmhxK1U4?=
 =?utf-8?Q?r/KM=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(35042699022)(82310400026)(1800799024)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 11:29:09.4963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2989ff6c-b0c2-4e0f-d4ab-08de408428b4
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11733

Add bindings for various SolidRun boards:

- i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
- SolidSense N8 - single-board design with i.MX8M Nano
- i.MX8M Mini System on Module
- i.MX8M Mini HummingBoard Ripple

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43b..97144a52d5a67 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1041,6 +1041,13 @@ properties:
           - const: phytec,imx8mm-phycore-som        # phyCORE-i.MX8MM SoM
           - const: fsl,imx8mm
 
+      - description: SolidRun i.MX8MM SoM based boards
+        items:
+          - enum:
+              - solidrun,imx8mm-hummingboard-ripple # SolidRun i.MX8MM SoM on HummingBoard Ripple
+          - const: solidrun,imx8mm-sr-som
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
@@ -1069,6 +1076,7 @@ properties:
               - fsl,imx8mn-ddr4-evk       # i.MX8MN DDR4 EVK Board
               - fsl,imx8mn-evk            # i.MX8MN LPDDR4 EVK Board
               - gw,imx8mn-gw7902          # i.MX8MM Gateworks Board
+              - solidrun,solidsense-n8-compact # SolidRun SolidSense N8 Compact
           - const: fsl,imx8mn
 
       - description: Variscite VAR-SOM-MX8MN based boards
@@ -1208,6 +1216,7 @@ properties:
         items:
           - enum:
               - solidrun,imx8mp-cubox-m             # SolidRun i.MX8MP SoM on CuBox-M
+              - solidrun,imx8mp-hummingboard-iiot   # SolidRun i.MX8MP SoM on HummingBoard IIoT
               - solidrun,imx8mp-hummingboard-mate   # SolidRun i.MX8MP SoM on HummingBoard Mate
               - solidrun,imx8mp-hummingboard-pro    # SolidRun i.MX8MP SoM on HummingBoard Pro
               - solidrun,imx8mp-hummingboard-pulse  # SolidRun i.MX8MP SoM on HummingBoard Pulse

-- 
2.51.0


