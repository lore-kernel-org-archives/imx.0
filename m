Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD513AE6E6
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 07:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773299658; cv=fail; b=Jap3DJqY5uHBMGx2QljXwsrXVJyOP/8bMas2cRWd+d7sD1TSFnv3pjFgxN6AdC6zu8Cho0DXHxDVPfwwKRnbx4QfQHIWCUFE9Bbp+LjcWHTxa29p6onUyyJgNqESN2o6LgUFNeO0m8J/7HDMcn6+2y6mFmbr081z1ZSH37+hTPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773299658; c=relaxed/simple;
	bh=lbFYeOhJ/JLRLbc0NS/Z24mSvwGUJbNV0FbZkWwyjsg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=D6V00h7CpSwOrOngPyaX90bNWntDpx6VhtFajyEH/XeCGEH/IXcUWXvB6Q8TbI4Z6fFKKdB5hh9TgR8CnY9YwLpbeCmfHbbkfAQdTqNscxkCLcgAxb3/wy8Vcd2gXBO/w8UvGuYoZjO3xzKwq1Jun79MsJK4fZZwMy/5S4sswyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MTY15eck; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MTY15eck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zz66EkKWtx//sDS9MQ70aIUKpHh/dKIuyqAnBOoDl/SnI1L9qyUhaCCdnzjCT/PxjrfapIWnKyddsZbKw9VtDV0xoaT/pKsdqwBdGyO0JEkZHvUo/kjcUVXZfqihCN5Jq++w8RYMmGgDVj19xfCkrTPOk9bZITXYk1zccUzQmp8j7ObUJNzbVH5XEbZjMQoYXzQkCzRB5i8LNUxvFA2JPDIyZCvnAwoCL44BzyrwNv9BNTf2BXQy//w56u+WszqN9FlWMHYih4/FYTPjlXDBnCyPqBmbv4Lh0aKBAAtQM53DrnLfpYfezXWMZYP7V8Fk17bKfwvIoS+I4FeKTGACxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZXF0I45hQkqt8lWDDxGEQ+YsuF/rNDk6KX7xqlIIyc=;
 b=GdukpGytFK+Bkz3M+b14OOcU56AH1Kr5s2QmuT8ylY/Yg3E0xcHh+GvTcaLpoyIa5wiDIcJXnEcwx3vww8pXPUik4457EASLQlCq/06iYnAFQAZ27Lq8ryZDhkDqhS9bFpFcR3vTr8eQMAvGobcWOBpB8wDLslrAhftxQ02vhfK5/aBvsj/wxXvvcQN3T/dY6gbrtvZDtJ9iwNM0MyvrZd9b1NcZMQ3i9N9rfTVTDETFekwodvHMeNiEnckYPH5l6mIHHjm3uWmwVI4oqk62w5M+VGQbpxJplvFPtyblvxVKpI2K5z15KqvAiUZ2CwRwXaKajOfnYvYSRSw3jDcAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZXF0I45hQkqt8lWDDxGEQ+YsuF/rNDk6KX7xqlIIyc=;
 b=MTY15eckT1Pht/CZOLSejnfy4XPLWEKfOe0d7/BSYI/d8kMx8Y5xW/ho3sa5A/bRgCm09xUACekBc66tyqpVtm4/Bbqn8cgiF7zqEz3MjSx/fGqDcdwzWhb76A1S6v3LCCe9x5PzJ++UERrg8fjRxrNNSWvNdOCv2+5lSvRk9h1nSdHi199K7B0J29Kg79/R7WV8foxBBAvlIiXJe5td1vL+1mUFuBPVa2Py061VQ/ar6Fx5MttM6D+eNPqfYzCko6JZ7Z742zD7lJwleEZwLXc9y4vaSwjgBeGAla1OWpQH+8xcJHq4MIWzxVJ4B+gWIX+v9hE8LHqfJiahDcUHXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AM8PR04MB7746.eurprd04.prod.outlook.com (2603:10a6:20b:235::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 07:14:14 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 07:14:06 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	amitsd@google.com,
	gregkh@linuxfoundation.org,
	kyletso@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: connector: add pd-disable dependency
Date: Thu, 12 Mar 2026 15:16:08 +0800
Message-Id: <20260312071609.388047-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0181.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::13) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AM8PR04MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 07880f06-0129-460b-3034-08de8006f288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|19092799006|18002099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	v2u/kRnon1GZUxwskQTeMFOGR2Cew6ZsfQaumozBGDbsEFTnIPDou15gtbT53La7GeuCjVxGi0Rr2JicDO7cwWlMt57W36s85GfIRnsJ4lhvXTEPIpNizva6e/feN+K+ZJjKCGurE+Udv9WSdzYOsJ3A75jkStSfIdJGvQNCtZ9kdszLD1DgV986RRovB0oB+/OFiTG25uSDhLXZudeBPEJ7I4V2me0i+seIHCioCnAuOfzMapGLB4f2MvJa+PT6Y890fJMmSG0aGU3LJ+fmkcGv1dsjY4XszekvojT74oCm5N5jaXfQ81C2AWYQsqHpugzHB8oI4Jt9w8zKjL9fMETxGdfBax40sAjtVFQ7lITURmHHx9zpyF9oPnuyQAAhi7xspC56MammkUyqDeGeX0zejj+1vPxQ3RPdcRSjOkhAPJIqqcio0QpHha0J5s9sv84Z5oOSfgr+jey2UHIC/+YLQ7plHBpHrSDDK2iewci2fv9yH+zX/Hlz6BTBdIaQLp48er4J2riEsx0sL67CR+nWG+nRn9rPoKA5KKFr7G6UHcuURMuccOVVMSn/CG97iB4M3h9Kk1dtmWtSffcAgIdhQTMxSNtkPBHr/yUP9b9ebz3rznOLtyX/nF1Ac7I5DD2zU3sUEiJEoneBki4RvTQiieRPnj5ugXyWrKtjQ91mSiWziKPJJTkmUSrDUD8b7Gb9sLuLPA0vo2IYFJzMSIEJCoAHmlytUIMtvSr0vnkNKt/5FqzBplakvMJupzCnB3Yrd6iCywfnuuVukRQp89Hm6CRcRMTggbC9NJ61CzpuWmfJEIR6BwcH4JRkl2db
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(19092799006)(18002099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FgITm2t6eXbi4lm5Bexlvn9IpO4gOEur+R67q9gtpya0rYkq5cVCe0cG/eMF?=
 =?us-ascii?Q?OzcW9/3BYXdELrSk6+1lB4O8YDqCWDnas9MR/WsQXQUASG2eBmr/vgJimCb0?=
 =?us-ascii?Q?RObnIqkmfvwiN8L0Mth1kSMr1ZgYRiMNhw7XS0UWmj5hpPb11MHZd0CqlGM3?=
 =?us-ascii?Q?Ha6du3t7GxS4myCOrFDj9a41um3mWjdkFXjFy1UX7rNF7nOdaakWlp+//Vs/?=
 =?us-ascii?Q?L5fm+106wkeZ7GY51C9Rfx4QsORp2aKnNoTcvIVp5QV2t+sdPrbCywZkfelZ?=
 =?us-ascii?Q?82kTjbI2FM++K8ZIJwgDyXAYkLA+58d1VX6CH+WCB2Bvuftv5iHjf/vC4kLv?=
 =?us-ascii?Q?lDIM3gU0KGiHUuhz2CCKQS3sXFHCMmjMTzXZALLisNxyTxjbEjTeHcfSPbFC?=
 =?us-ascii?Q?FIEQIX9lLMulCJR9Xi6k864A0O7uq75k5avRBiQFFvWAIe4ycE2lAk0lexM3?=
 =?us-ascii?Q?zHfDz6vC/IX0KDNB3XaeRWWw2f3ZQuAEOFoivxmoHrXZ9at0LkaGXoJIKIqS?=
 =?us-ascii?Q?L13Op5v421XUQ/c6ruJNw9FgEzvzfyzFXJJwT5Zqa1RliRhvzFFuF2W2xefg?=
 =?us-ascii?Q?6W2XKebaBuqr3muwbF+XUfELn+0Jn738PJQTwR5z3nvXXU9ZTstsEBzv3BJL?=
 =?us-ascii?Q?56p0Tpl9vQdVWFgb/f0+OyASMXZsVNqpR0JcZmezhuc3tLKx1JpcIqm2g/Gv?=
 =?us-ascii?Q?3FEEdju+H4MdmFcm4rP2qeAiF7BUnu7ISQMt1biAhENwKZa8clE6pej93y50?=
 =?us-ascii?Q?sZf/dK6w+eKW+BU8QOYlr5yUUWF6vuTDX0Vlsa07yOrDboLQ3q2WnwhdaywF?=
 =?us-ascii?Q?xmR/PtWppnhwOeOWXwzKEhTngSlPKSwVqya3SQ+8RqiVTOt8R7BhNRIGl2nF?=
 =?us-ascii?Q?397RgBVNZfEYrwUUuJcNfNUUzYWz2LIZSU4IEHiXy/wGbhwEQa3vD+OOmmtc?=
 =?us-ascii?Q?N1FGSPxnw28PCFfNOZ+UwHfx33WcLYs6c6bCd654lxp3EgYpXUAqZiCABK8k?=
 =?us-ascii?Q?PqW0Ze8wqYh77H62CH3xNb+CsBciemcJJ3drk3sbndKo9wh6ylsPBBrta69o?=
 =?us-ascii?Q?wKJfEaPDcjIaVlvlZKxn62ib6iGJjfAQsEFvXyeyyAecfS1PDKQy3dePZx/k?=
 =?us-ascii?Q?1SGbhoH2bB3muGq+Db23ft4ndNCK6u11+P8bcwHz9m8MuW5vamt6q6AOB/bU?=
 =?us-ascii?Q?GBc++ZnI3/QkI3negBkcHbZYFWKr1nyxA4+SWPuaTxfL3FCqdrI8gXZNk1BI?=
 =?us-ascii?Q?FCu7HAUpAqDRVAoHY1Wh5QWc2KqjGrincQ+oiBVs9xVGH/uLEZ4WLakriduL?=
 =?us-ascii?Q?snH0DpPZuskOCjEfqLcjePEY4A78ItBLpF9bceo4r0IlL51dIwyLchIQdcPP?=
 =?us-ascii?Q?xZfrnOh91QLRA+Ev/UypPGnmyKNbjT24ADbH9jdi6jj0VljYgzG/FoyLPzpt?=
 =?us-ascii?Q?vm1OFNtRFE7qgMdhltS52ZNm+45wWc4pf0jHJUukd2FQjJEnryuSVd3zsBER?=
 =?us-ascii?Q?yNNX+IEDU3dVLj9WlvVwEhIIArjim8mssLNOdyqnvjuCK9HoAv937TEuE9S0?=
 =?us-ascii?Q?+UNZL7CX3xGUhRFNZvHNpvYbfX8KowItZY+3AEMK/cr0mL99Zg83P9E+y4jq?=
 =?us-ascii?Q?uSXWRr39BaJZIKlsm5p050sfshoHQT5OFYJpGbKab0uE256hDmnzb1ACJFwu?=
 =?us-ascii?Q?JtkquGDyOQWeX35sQsy1H++0RFwZzXz2KfPxHQNrb1Lk2HtiSOul0q9E/1iw?=
 =?us-ascii?Q?mqwbhuTnPQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07880f06-0129-460b-3034-08de8006f288
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 07:14:06.4954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbbIGvntAshyQ8m2sXEsqdh/2laYHfVSxgsSJ6zcitZfMSSia71KZRHo8RNzIdIE75liLtK/+XIC6Yc2lnUkwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7746

When Power Delivery is not supported, the source is unable to obtain the
current capability from the Source PDO. As a result, typec-power-opmode
needs to be added to advertise such capability.

Fixes: 7a4440bc0d86 ("dt-bindings: connector: Add pd-disable property")
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 Documentation/devicetree/bindings/connector/usb-connector.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 901986de3e2b..671d7775b635 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -335,6 +335,7 @@ properties:
     maximum: 100000
 
 dependencies:
+  pd-disable: [typec-power-opmode]
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
 
-- 
2.34.1

