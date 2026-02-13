Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737382080C1
	for <imx@lists.linux.dev>; Fri, 13 Feb 2026 17:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771003053; cv=fail; b=u0RZFxJW1Q+4W6H4NSFPHayOaevobHq0FD7I8/5JPwLzCsMgrEk/rDhlsg3I8hvTQxC/+4WSicS42jiOh+HL8Fg+Ar0TUi3lM5ULX0w0fVk6vH/5IbzvjgJv6NSg6FDJdNGAqcl0J8k7tv9dWDxcbRDmTPiphHrVcWZnvkJ1DYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771003053; c=relaxed/simple;
	bh=kSHWTIiAklnl01mxnANZDxam2DxPfYgzTF6MaOFZ3jU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aUFLp/xF2q8ybtBf1Fx7rXggLbcNBHKT/QO9QBYFRLOl3r7woV1TMo74NJZ4rud3/hIgcbKZrLkCTxd9RmShSKMA6WjD3fG2StE2fy0vHLSM3qJIGbr35DKKevJ637lTH1Zzs0Pm2K2zjcBabhsbwN8HwHoYWPwcRxuNFB6pYzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eP0vHEUh; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eP0vHEUh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5aAhgVVvSXiKSpgTekYcppG4l0RpAVW2zrCdfdZn9WevbDw89wWfvBv8Z2I4R2HTA40v1xqJj84hIq8KPY3JJ3TBGRhHEG1EbEc19tOlplyosevOYRf7AWmA1sgXPmIrcQPtLBOcqwVWndSOmef9dhCpauMYZOA/uqtc6yoamK2krkS3GSvfe55V7NclXHg7ZqQAyHJJ3oDf1NW4yiKA3NdsGW+AjhdHozAjosCafL+/eQjbzXDAjiK+ToJZbMCClrR2vrykmqsHGknORBWsyAwWaDj+7sRlUxBtCzXf4ctfjins/BjOW2eFNo64N4qlS+LlIq2s3y46757MNwdZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8OB00T6SqnqccwRNiZhZD8kBsFSLpzg3/IrcHL/A2g=;
 b=efRhVRacjpY2S1B3Wpv/0DvrGFZ5/0oVlNXc7LW0nLHrH2N+YpsJm/yP+IwsSrUxxnDOdCBqoCaewOWYIlIFvwkwuLx13EuONuWYsqivyqKzQVXkWtruHdwGubYmVPeS+uToG96hQKgy/+IxeE/6rNEpK+wrz9G/39sB3AGvcSBudVuqbyFGbi8KN4X5Tr+7NwInE3iMhWrr5h4cK5SQQ9KttUSMAAauK+lZHv4zV4T6Hi7soQwi0VhlYgwJvandzPmIzWUwDCyDLIK+TRzfU2CEIIv+FkzykrmtH1WI0cRY/ubhfBbfmW4pAQtnsWvrL2IwbsUGrIuE86ZnbOUDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8OB00T6SqnqccwRNiZhZD8kBsFSLpzg3/IrcHL/A2g=;
 b=eP0vHEUhaV5QRsnUfLZTUJsngWEg2uZxl/xCTz9JHWG5oTIGztRyeEIdE2ejFaJQX/CzvfVS2ZQarjimX844cZxLW1PHXwN6TdlKdLYZHBvWjMZfmQx1O+ZVuok7VC53Rp7afRETQhG58Bxcma4G2pCUPZ4N/o0htBUxBWKbvRMGSbIG3e9QjkuGxa0aRcV+zXbRTn+oStf1M81TLHHvO8qaak1TRCZOoiGkL7/3fJEi+90BqcXvq0m2CyadmVDbdsmQI9tRJIzazj7q3nZirO9Amzf89l380bjTtB8MBpP5Eri1dH8ZdrJ9SCNe0HSYQJ7BnjGEqZxxf8QTnuIy/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 17:17:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 17:17:29 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: soc: imx: Add fsl,aipi-bus and fsl,emi-bus
Date: Fri, 13 Feb 2026 12:17:11 -0500
Message-ID: <20260213171715.3465064-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: 842d7116-b7b7-46c7-6174-08de6b23c41c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?APlRhWtupLFr0QuVFFTQ8FYXVm5BBuKyl7zJLkJthZAFAFvDJTGJw4zyIag3?=
 =?us-ascii?Q?5VomW8mY2TRE1KZDVNml4fclQEayYFAKLelZmo0/s33yVyxZ/SW/8tIEn+OH?=
 =?us-ascii?Q?Ee8Vl0A/ZOtk1KZiEUgkrb8UqOF1ojLxM9mD0T/cHt3mQOO/trsZdXSAdqkx?=
 =?us-ascii?Q?jHSaqBN+kBP4K9AtSvaw+gAXbY2LdZGA17I/mBgRQwEe6hpGU+RI7Fr0yoFb?=
 =?us-ascii?Q?eB0lA2QkyILapRl8yRiVqhuwkcweMM+/tUnFF06UJ9LyQ/2AatbU1B4B51aO?=
 =?us-ascii?Q?q5G1s/ql1atmApuNdmgrNHDqEm9Oee1607ZVnN8gLDZsRg3ntiGOg89H65TW?=
 =?us-ascii?Q?17NlczhO9ilM4K062fbNSYQWEqWdaZNwNn93rqib9rSc+2bDw48cxeaJszay?=
 =?us-ascii?Q?zn5EIVDeSmHkSBxo0SCZMrtpp/na+BP5ZGUZo+t2eKu7Xz8EHWcnlvN69Tao?=
 =?us-ascii?Q?z36yteJNNuIdaomhe+dyGzBT9rtTvyo20J5Ybxys4CXA8T6/xQKA1eKG9cOI?=
 =?us-ascii?Q?9nqCEPLlgl6Vj7KwY/QPgxH/i1kDhoqNNtTpyfyXj6v4KpavlqnoffG91zqW?=
 =?us-ascii?Q?H8eW65yXaaWaaYgvF44i5lrXG3IiQUIg5afOSmDxwY4tyo8XKDVMfqIMZH8U?=
 =?us-ascii?Q?aiTw2jvHB4/6vf0qHJotppZljyLtG5LFOkhJ51Q13k98lwWsH2NZNry0Bf2L?=
 =?us-ascii?Q?ij5YtsWpSe9cqxT2vmW3eklrOV9U8iAYHfzRV4UoAQTSlrjS0xlYb+oiKzKT?=
 =?us-ascii?Q?znaVvXFwdN04klR122TuQBZQUyXcZLIx7GCBQfG+iMhkSr0g3f/+lr9Unv7y?=
 =?us-ascii?Q?UwchC1TGjigirL7PAYH409VuC+lFAdH1m94Lns8Y3bflBBAe74FDdDl7qG0s?=
 =?us-ascii?Q?w1C+NE6sMWeGobL+ka2a+rbBa2W8FBgouoe7ysZFdmiFFbd7JPIhC3WoKuLX?=
 =?us-ascii?Q?jzgj2RQKf9qnCb4qg7RE9/L8UyqiXuGXWoB16lx1mZGic3JstYd+spfVTIYj?=
 =?us-ascii?Q?wIUanFWdD0BMef0YEDlD6Qpdpvk8B6aX5dzleoC/IrbQn3HXVWmnLNnTyvMn?=
 =?us-ascii?Q?kOLDgQSNJg3N8FJjYR7fM0TfbGnDsFcRZIAdcIC4MPjJ96wkmhuMOOJgqOfq?=
 =?us-ascii?Q?+D9xNJ86XzxX2GiZp1LlvOCH3oJjiGHZZRzHEsHrmTnSH58pJAw9PqkG/bzQ?=
 =?us-ascii?Q?Ksows/o3JBnfUQX/SzPE6ecl2z+PrkzmGJLCyvk1AYYm1RFpFaCipZRVbvA6?=
 =?us-ascii?Q?6KFZRpCkdUAyGWv+VeL/V18mn9JTys6RKcHI60+qK4/u+CwzCBrQ3qMWx7/7?=
 =?us-ascii?Q?xXWRF/w5vhZQ/5PIQWmgdqtanFBX2Wp9BHkdyKHxuuZuGYSleAKt5qvQa2iZ?=
 =?us-ascii?Q?Q2djApLT+5LLyfwSMtkjswuMYS+lvv+cpH9sPvalMepMBJZv88ikaVFDrB6B?=
 =?us-ascii?Q?qBsi0b2zKh9YDyIrCNFXDQI7Osp8Vc5g4atwoom5Rh4Rxi6mbwP3CQl59mYG?=
 =?us-ascii?Q?QN8OPgXA7bIS7rdtKECZxoS7UxzRk9ml1W8PxZ4l1Q9jzH+iGlQB6dMiceQe?=
 =?us-ascii?Q?5BWfkJp/TFrwnWUHvnKT+lueZ+D3D+4Kgl73j++5MWbY0AUCaTRZD3bsFHZ4?=
 =?us-ascii?Q?EvCf5jjnW32cB9CbXazE7K8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cqNq4PCBWKNDIING2t2nV1m8ZTXVM8X24R+ZNyMRpDBY/dSssq+YgMVhkT/Z?=
 =?us-ascii?Q?q6vhYuEsKZRsywO/ntoc08HyGcvR9J14DsShkSjsTm8huByQpqe8lXzueZb+?=
 =?us-ascii?Q?ML5mMB3E29RYmJFKgrwwycES8tgj7vUZDmW3xh4VI5Se3XPsRxLowNYKw0nX?=
 =?us-ascii?Q?alVrA9qmQHuKFx042IcW3Yc581ZNI0rH/SJee6tebzo5jPtt0LIy35As4SCI?=
 =?us-ascii?Q?yIjDUQKEU5DfHVpBnKkQsZIiLI9n4Au78VmAngZFUAyHw6trYpDpQcDkYiNC?=
 =?us-ascii?Q?X0ZZGxnQg0AbrLXm/invvSB3ly/nddoQu3Gw0s2MkeAZEytSXV6MpPuOX3Od?=
 =?us-ascii?Q?k6MUJLVhZHeomdCB1Bsw7ArW510c47v7AUL4tTBgB38D6RraoZ171q1E4EO8?=
 =?us-ascii?Q?0rOKnEbz+34qqIQQJPrQqpd/LmczJWtKb9YCxZB7MfA+5z7dXvVbdfVrmfaK?=
 =?us-ascii?Q?vNnceGO/51Lb1RiyyEXnO573JjCByGrDHbxaoRhdxa2XUWggNp0WsupOofpr?=
 =?us-ascii?Q?gni3FLMlqsj2VJ6kTXGVej7/CZgm0N0Hrp6Ej1afW3eJ2fVXcMhwMBhQPoBw?=
 =?us-ascii?Q?ev8atTvMLffDC7RTKEif5/O0AmJz3PrJMBvvi9FdYLaKs+gi89ROXH9IW6Ze?=
 =?us-ascii?Q?LpRUzsDu7NTJAWvvWF4W0l+iyr7oHMRbX0EXXuvZor/usqnnGHcMIAtjerZw?=
 =?us-ascii?Q?0zq3skFMV0vsmdIy/6lIW2SgCia+TPbf7HwcVhsdqfAklQYH+B8tcpiSnW7s?=
 =?us-ascii?Q?IbrjWT+wLiI227Abd1y5AWv9ZD0CI3IVcwsY4NNg6Wh+yaVeuwg110eFvtHi?=
 =?us-ascii?Q?1YwxvKnW2vu8CgG1sIY9wpMCIh+UAyWQRhBBIPuC80/6rHaFYEoSCwx4Ie+V?=
 =?us-ascii?Q?yYeucezxET2MAzUiZQf3uScPFb1SwRsdpq3uFhcPnz7Yi/O+zzdjc/CbFXOD?=
 =?us-ascii?Q?Kto26nL7YEp+VrKsQ7mmUXpiG0cC42TtMZMv1cHzCf+v6P48ZWDsi8h9I9Hv?=
 =?us-ascii?Q?NoopV48Lu+/NNi8DuzvhX2weOxvuz7ZLdH8vXcAqCdr/B6/jSVIhdTXWXhSb?=
 =?us-ascii?Q?WRIc9qbjIiNzEXkre46J0vnZVySTYyU8+JnEp/Cl5P9FSFnjbjuZMrleBRV1?=
 =?us-ascii?Q?5Obe6PUpBaoOyTPLxdEwzvHOu33I3SxVy8eDa8zdPPIUeNykKJIsn2Y5Nxme?=
 =?us-ascii?Q?lDpzDEZkfA9kjmwo2bggpP+6/eo/lG11BKQpstzCMDzq5cNRBWbRAT0bkRBu?=
 =?us-ascii?Q?TXCA5YzTZgNbTatDckUGOM5mQuQt2I2/+Z2At3vSpy+9FF9JoWkUbG85ozKZ?=
 =?us-ascii?Q?5Q+oK7VZpUJdC0QRyxYgX3iAZYRHjJR6yHzbSvE+vx7ifYHG3qHg0t9yX3ZL?=
 =?us-ascii?Q?7cYuVWeGqDGXvLaLn5NDALqY1oqAeH0qrDWudLBiMFZTtVA1L7PZxJYcGvms?=
 =?us-ascii?Q?NqKCZMCck2xzzinA2zoRQNUlHaw6EDPToyksta+2Xvx3ZD7qJI5lLQPJDMdF?=
 =?us-ascii?Q?PCT6wU3dvkBAsbVZpF0ryfFQrb2cGPeflhn9C0sZ8EDlBMIef9HZoYkuD1WA?=
 =?us-ascii?Q?FWerV49309fB7PBmKJqoqD3Z9PeBgtloztnTOBTITmkJvN+5NO9FaIO7iCag?=
 =?us-ascii?Q?MqmB5DVNQXpy1OB+TRx95lvTiPIuXQXs1W6kDNronSXkrOSGvkcEhAn5SQXK?=
 =?us-ascii?Q?w05iv4XRoTD2wxJYIDuxRVm4nKk04AZPUZoYEthYx4SWYz6075EKqT33bzxC?=
 =?us-ascii?Q?DK2ZH3C51A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842d7116-b7b7-46c7-6174-08de6b23c41c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:17:29.4897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2nFQ42Y4eWP2mJztKsAPmLjhlXwIo3Xv+mofJvqgtIsOAQltMxn6UsZfTCLgf0G7gp+JvPKsc+horaGkRYqcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7135

Add the fsl,aipi-bus and fsl,emi-bus compatible strings for i.MX1 and
i.MX2 variants.

These compatibles are only intended for existing legacy chips (more than 15
years old) and will not be used for new device trees.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2:
- update commit message to show only for legacy chips
---
 Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
index 00bbde203f598..4808065fc9115 100644
--- a/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
+++ b/Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
@@ -26,8 +26,10 @@ select:
     compatible:
       contains:
         enum:
+          - fsl,aipi-bus
           - fsl,aips
           - fsl,emi
+          - fsl,emi-bus
           - fsl,spba-bus
   required:
     - compatible
@@ -39,8 +41,10 @@ properties:
   compatible:
     items:
       - enum:
+          - fsl,aipi-bus
           - fsl,aips
           - fsl,emi
+          - fsl,emi-bus
           - fsl,spba-bus
       - const: simple-bus
 
-- 
2.43.0

