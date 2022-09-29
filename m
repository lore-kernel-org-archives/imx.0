Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD4CEA2
	for <imx@lists.linux.dev>; Thu, 29 Sep 2022 03:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EW6mOFWqxmewd21c/K8h0Lfv6AVauc/ytMf6dAS5pkKbQc/bn//aeDLI+NRUXqtOsjrFmz8l8qZQ53f9xOvpEI60wsyg3ii7VEI/N34drHvyXUPgX0OZfahMQCmJaCJNBST42mNs04374M8FAan0iDHAtHSdKSNxIPeVEGu1HVvR3UjrQIIJZM2taHOoBQUz4u4p/w1DbuhiBYo1R/0LlVNgh62R0D2A/fM+3EybYMoNo6tmj0lxbsN62pODQqf3C1/yHxyyuP1Gpl1z/FbWXSBYIy3ZKrrR4bd+RlbTtN4do0Plhesa2XqaLC8y0RborAhlU1W1Nvxo+88fj5W62A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8m9ahOf+UEw5rIF5UfTdjyZuRFhKVV+ngALzJ0Ou6hs=;
 b=DvPgmy23GUNHGpgazNtnYeRxfz+pQGKSa+bxgR6va33Cfoj+d0N4WtYY8wLGYsa56MW05/zglK6y2GuLjLz7udFVfex0BmjqFM+oWN/+V5n2ZTbIi92Comw7dXpgeNNOx7/DU/ui5kiPvKefwOof6R29PaCR0MhHJMZXVM4mEF6G78TNYy0snJMbp3yVGZcRbbxwrfm9oD3H5zAdcCo8NCPz5kdJpLKcwCPOIdqTTtZ92mRUTas2bfAshCRs9XZ5VJcOJcllelgaPBKbpVnr19IfuYJ41Nwt0BsFL+qDYwKNAxl86nudr4VXHhB43jVILXvaTy0KC6stND1ooFnwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m9ahOf+UEw5rIF5UfTdjyZuRFhKVV+ngALzJ0Ou6hs=;
 b=lor7CuOKb7nuhdaKcFSLjBElAhIId4sNp8cbnH6jgG0mTLPWruoX2NhixTtr8R9+GHwvFhQ8ti+LsqlcRsQ5GhliCOaoTLG7Xr21kTM1PbhwroTF4lY0KkkgUjITgaJSeV07DwInR7nLZC/tsgq9yA93EJYhxQGxti4DE47u53A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB8PR04MB7003.eurprd04.prod.outlook.com (2603:10a6:10:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.19; Thu, 29 Sep
 2022 03:46:57 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::a543:fc4e:f6c5:b11f]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::a543:fc4e:f6c5:b11f%9]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 03:46:57 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: imx@lists.linux.dev
Cc: Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH v1 0/3] Add IMX8 SCU GPIO support
Date: Wed, 28 Sep 2022 22:46:33 -0500
Message-Id: <20220929034633.277985-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0179.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::34) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB8PR04MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fb5537f-abb2-4e7b-6b01-08daa1cd41bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dslv0rc8AXQZj18Tc92GTFID7JPyC8LksgZ6EwqqO3G7cs3ksUUWXOi6tRdn2hrieZw4hN43fhB0pxHbVIe5To0tuotbOlx+DMYNuVO916dJkESIcQbf3Ohgem17fWgPNBUI5g/4KEAoK4K1NAXS7kORC+F6ggGpeeC6GebCZUJ0Bdw2VCeGN67Lv4T/JrkoMe/uwBPjn0sCSyArCJCwsBTgAUTw/jRsW3quVebaLypTL7E3njEtcHSs3SwZ4Tpkud36S2rGLjk1eQ0rI87pEWp9TOEb5oCAfvN0nkBnGq8/Tc6/r+F67EXdrH54ZNDPhW6BGSZll8Pcnlp4VrhbE7OIjTiVh8okc9xVmPKV8CK9usYL/9bP2DrVDfanNVegBSt43FUu0KE0eyn2bg+6YedQUIU3rQEe3R9vr3mhMvjaEt/Ptraa39XGg9lGVNuc7bOnpRao+5KZfDY8A2N3nRRZLLW891ET86OAyRz3N5tMsSFblXhp5ExGF+Rg3QLVRyFoCYkMz0sHY7K3qeSsBDn0E9RDIC0vocspNc2IhD76OICMoD0c7IM4ETSXd4Twx0pMWvxWlaZoYfPo5q4mAVC//BBq2kfwE5dEOKK6Fboi9WNReN3Byy4dXVDeRwqN2Z2hMxnI3k+TMkoMpJyzjP9zKDMvKFPAmZXGlJJSPejpOX31j7gQyVpLsMYBl+4F9GNqn1kFbm3UG6obMufi19MkJ/zfjJ8sRy7x0oMJ8Ye1L3DpjlNY+PPJxMhhU8QfwyLPmIkuALj3VHVTpJtS8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199015)(6666004)(6486002)(8676002)(6506007)(52116002)(478600001)(83380400001)(6512007)(26005)(55236004)(186003)(1076003)(2616005)(4744005)(44832011)(2906002)(6916009)(5660300002)(316002)(66556008)(41300700001)(66476007)(4326008)(8936002)(66946007)(38350700002)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVZQa3N3dWYxK24ycDQvdXhuaXp5RDk4NjdVRVdqdklDUmVUeVFhb0k3eEcx?=
 =?utf-8?B?dk1MQkFrZTI1Y0p2NXNyVFI3OG5GTXRpck9hR0k0ZnJFVnpWQWZDRm9wOG1S?=
 =?utf-8?B?NURNTkFqMjQwbmNhS3hlRHNtOEZ5eDhXd05WSDd3WUFXSEJ0ZW1LZE5uYmFa?=
 =?utf-8?B?eDhLTy9oN2x0MWdOYzFXNHRZSEJOVjhHSU10SHFab2ZOUEh5S2U3V3dTNkxZ?=
 =?utf-8?B?RUVDNk81aFJSa2lUSlRIOGxRcVh0Z1lsMTJMR2tzYTROaW5Ld2pGWXliQjdy?=
 =?utf-8?B?QytpdHViUG4zTFAyWTk3V0V1Q1Y5cnkvS21aQXE1NU5NemFVM3F5UmxaUkNJ?=
 =?utf-8?B?NGJXT09Jbnd3TmpVUzlrVjN6VHlYemVDdFp0bEhBU2h2MzBEM0Y4Nzcybzl1?=
 =?utf-8?B?MmVEaDZ3cEw3TGVWY0RnKy9jSUlrTmFIejRnRnpKTEFuVWRMQTNjZDRZWUNO?=
 =?utf-8?B?SEY4cVYzYXhVVVpPbjBzYnFjREw2K3V3dElJSUZZdTU3K0tEaGE4cnNwSmRB?=
 =?utf-8?B?bm94NGtUdUNTTUtRMEs0aWNYeVpnc3MwNE9OVStnd1NycTlSYTFKcU1LRlV2?=
 =?utf-8?B?MCtkMC94bGluRkJ3MHFYZVJvNjRNNWczSDFwbkJkdTM4YUN6V3J5SytURHpN?=
 =?utf-8?B?eDZFbk5HelNvcW1QUkRsL0xIbXhMQjRjR3lyK2Y5cWQzeHN1YWUyUmFLMnpu?=
 =?utf-8?B?U0M1d3NvTlBTN1VGK29OT3BhSERvSmRjVzdlWW5lbjMzMUc3T0dsZ2E2Q01V?=
 =?utf-8?B?YjVMNmtYZEN4QXZ4SjlKV0s5RDFrRzloYS9DV2VxZGVLMzhmV2NyUFFFZG5W?=
 =?utf-8?B?V0JXelV1dENLMmhSVTZVajBhc1I0R0M1MDlXcEpvWVNKdUZGeUFtQSs5SlJI?=
 =?utf-8?B?ZG10Njh0R2FLWW01V3B0SUw5TmlacmtHTFZUNmF3d0pDNnJSWXZkMXFRMFly?=
 =?utf-8?B?U2xQeFZQdnM3bU96SWJVVEFUSTBoS0FsWlQxdTJKeGtIY2wvdGpjZkJySVNY?=
 =?utf-8?B?b2s4bldTUFB6dUFTL1FDcE1iS0NvZVN4V01pOWI0WUplYkIrS1BzVHk1aDhQ?=
 =?utf-8?B?WHdUL3o2ZHVBVDROczlUV0NLRjZCMTlraEJEM0ZFUk9sZkREbWw0aTNEL1Fx?=
 =?utf-8?B?TTE5djBRbjA5Z2lTd3EvcjZyaHNwTUpBWnJRSmdEN2ZBSUNxNm05dlFWUEx5?=
 =?utf-8?B?WG5hTmRyTy9nT0dDaGVNQURyd1B0UHdBNWpuZkNDQWN5L25ZM3duT1VzMnpG?=
 =?utf-8?B?Tko2SlJsQW13K3Q5V05qeTE3VUg1dWYrQzhYVmwxYkNSdFFLTVZTbzQ0UmpY?=
 =?utf-8?B?TTN5eXYvNWxrYjFlSUo3dHE4MWtpS24rVmpOZ1B0U2g3TVJmZzJ1RWdXdXZW?=
 =?utf-8?B?Z0UycUdQaHd3M1JyK3BoOHRiVWZOdXBSYkYrK1JOWWxNNzFyMWdQeEpEQUty?=
 =?utf-8?B?Q21RZVpBY1FiUU5OaG5ZYzBCeVJJOTBueEpKTUdWaTRMdUR1Z1R4dXgwUWlu?=
 =?utf-8?B?ZVlmT3JMeGVRQ2xkSGNja0tWRTFBeW5mOHFVVnpqNUJ6RjU2S0RIWGZ3RzBP?=
 =?utf-8?B?SlRic2hOU2xIZlpqem9uR3Y4UE1qcmlBZmFzcGNpUjB1SllWaWNSR0VYc2h3?=
 =?utf-8?B?YmYwaXI0UnpnOXFKTHk2OWZDa2NoU01GQ3B6Y0hCN3RhNyt6MzN6SmpvRlNm?=
 =?utf-8?B?dmlWWlduZXl0ODRTUmxvWXNacDlyU2Zscm0xVXpNK2hwZTB5T0JwRHowdnFl?=
 =?utf-8?B?VFVNckdtQXJuVFIrM2VsdzVWcXpIY21WWjk3bDRQcVNRRkRhbFY4N3o5T0JB?=
 =?utf-8?B?aDZkT09rQWVuQnJnWlNhemplOU1ndnJlbDJ4QktrY2ptMVBnK1B0TzFrRkpY?=
 =?utf-8?B?VDBLbjRhNTVhZDAzRURZVytXKzkrUTlBOXpmKzlqWmNxQndaVHdDdlNUOWhL?=
 =?utf-8?B?Uy9FWE0ydEpoM2pYeG5TcCt0U2c5emprZi91b2ZKU2RiYkhvRmcvSkRCZWh6?=
 =?utf-8?B?dVFrVG1PanR2QS90YzJVc0xhN1VuUXdBdGM4ekVoMUJzd09vZEoweUJxRnlV?=
 =?utf-8?B?RVBlUXpTa1NoVU5ZZExlSjlMN0F2dHI2clh3aUdDWjgzUWxFNlFJZU9iTFlG?=
 =?utf-8?Q?sJwlxdcJkadAttFanKKZDUI1e?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb5537f-abb2-4e7b-6b01-08daa1cd41bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 03:46:57.1546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZ6AfFHgoUD0yICOnH/Fh47hIalt/JeMBl9AfbZZXtKxIN6/J5+d80NM6XDIalGX1y0aq2wE8ccSO8SzttpHbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7003

The system controller (SCU) is the central unit to manage the resources
on i.MX8 platforms. The SCU firmware provides a set of APIs to access
the GPIO PINs on the SCU domain.

This patch series implements the standard GPIO driver over the SCU
firmware APIs, so that the GPIOs on the SCU domain could be accessed
like a local GPIO PINs.

Shenwei Wang (3):
  dt-bindings: gpio: Add imx-scu gpio driver bindings
  dt-bindings: firmware: imx: Add imx-scu gpio node
  firmware: imx: add imx-scu GPIO driver

 .../devicetree/bindings/firmware/fsl,scu.yaml |   5 +
 .../bindings/gpio/fsl,imx8-scu-gpio.yaml      |  39 +++++
 drivers/firmware/imx/Kconfig                  |   6 +
 drivers/firmware/imx/Makefile                 |   1 +
 drivers/firmware/imx/imx-scu-gpio.c           | 139 ++++++++++++++++++
 5 files changed, 190 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/fsl,imx8-scu-gpio.yaml
 create mode 100644 drivers/firmware/imx/imx-scu-gpio.c

--
2.25.1


