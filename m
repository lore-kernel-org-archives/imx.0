Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6E211708
	for <imx@lists.linux.dev>; Wed, 22 Jan 2025 11:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737544426; cv=fail; b=KbWFFdXu0UqBTzdE3SeWHH7wR/ArLZOpb4IByrXA983PbBHTPfdD/+FXAuu1O0m2Q9SLzbnp3Z/xzoQS6GKDYa1UfJaSsSM5l8SW0qN1B+iYPQL/ueiPnTLsNkzOL+FXmieuC9LFY12e19ktp529cmCblFNZ8dZNFxjgyuPL2aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737544426; c=relaxed/simple;
	bh=JshbovnFA4i/zPeI58gwoMcmfO8+1pT2U5Pz20uoXQs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UERN1rvMS55feGDydDgYoT7lShzPfCcV2TVZLeMIcR+uDHBmeBfPixSFg3XiPGo+l7VimUxEkd1U1qTusj6hkx9KULYUnDFP5QvAmCBffiQ1XYyaPuwqpGddA6oMWwZdQ06c6XlHIFDrS6xr87Fg9dis/P5ZhzsGgdLWAZ4l+Vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J1b5f2id; arc=fail smtp.client-ip=52.101.69.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J1b5f2id"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=extpSW3HlRGUBXso9YT8ZB8I3i34+JwLfm0rwJMACVyfTM+smiO/IGNasCJTq5UWkk7GcIe3YPcRJPBH8gomgvHgJXy+Ni6ROH4XO4sRC3N9xaZSNjSU5KN1XPwSW0jmt2ecS7qXJJvDzCgl1DMMGoiXR043iWBYFtwqIPJc0l6ei2OEM1IngGFA4A+wgfm1xd3s5pKhj8ufMvHvMO3KE9BMSf9Hi5nWbx2zEsVslk0ofKh2NTMf7EUlp2PHHd9kCe9z5aNJlRMyuFGTKPPgSFz9tw6AYiYbwwwVTzXtvVGcSRHf2GwSCPg9Oaa4gm+n2RoKaLjamRjpFoEtbnefwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb6JJ23sLfXEzRN09c1n/w3nyenTtTVrHNiP2xJ/h64=;
 b=PgqCNRxRqXCuEEFfKEiWx5anZCL8LgBHc5pMnYyoP+ZEZy1qWfatEcDI3BQ3cnF7ArdEoPCjbFuKqtBuT7ULrd1rB1ozK5Vou+J8MGPjz/SyYk9uMs5fizXNyNS/CvN9Iu51iAkyXRV3RbHkrEnIjxWCS+L89vrPaiv8jxn6Od+MPRoFF6o1xDs0On24JLbxZ2bP+vxgvPFh8SmDt2KhN2YS+c3wfbwFRokjxKu+bjEcc/2bfTmUzPqFeV4aSo89zbxPzf68zPS13FCRIW2JU0XIUJRP2P7L/lZJt8XS4IPxHg4dY8e3AnlURu5CZUpFolSXWPmayVCRdyR8wNpxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tb6JJ23sLfXEzRN09c1n/w3nyenTtTVrHNiP2xJ/h64=;
 b=J1b5f2id0s9RO/BGfRNlZujCCNYVz0DoD9MCYC13X4sXMQpQ0WgEd0Yl3eeCl6z7lIOUQ6rWo43aYnvaD7IHk3pgpSr6Oe+vCfEWX5ZQZkdLqH7seF5Zrzqz2FSCDuIdoB4s+z0gIKyIwg6hNSdR1QlDG4AI+KExh5yUhA2TA4emS+rJCqbCZqfT5SgOeeEq/YVGIwVK8rZctCnokh6g9ift7PWJDMr0MmiNXC63PNoi4Td3ggq59uytezs1fcfY6yXYO2NoxN1zThbAo46sAQbX7XIUGdZOHoATRBwDT0MThSGXZpxgRyaNOtKkkpBC2ZzD9W94sa64l9XSZivJhQ==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS5PR04MB9825.eurprd04.prod.outlook.com (2603:10a6:20b:672::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 11:13:39 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 11:13:39 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v12 4/5] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Topic: [EXT] Re: [PATCH v12 4/5] firmware: imx: add driver for NXP
 EdgeLock Enclave
Thread-Index: AQHbay5xsrxnwIDIm0mBTFCSNYWD5bMfleGAgAF9hZA=
Date: Wed, 22 Jan 2025 11:13:38 +0000
Message-ID:
 <AM9PR04MB860468CF15C1CC4B8EB257A695E12@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
 <20250120-imx-se-if-v12-4-c5ec9754570c@nxp.com>
 <2fb2db33-9d45-442a-bfb9-55173751f20f@kernel.org>
In-Reply-To: <2fb2db33-9d45-442a-bfb9-55173751f20f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|AS5PR04MB9825:EE_
x-ms-office365-filtering-correlation-id: 12e937fd-a625-4009-ace5-08dd3ad5d275
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tPf4HCZkZYv9tUmHpqwgoSjsWMGfmMkE6xKjvd44x1+VxwI5wEroiByCJO3w?=
 =?us-ascii?Q?R7yOp+XvnDqm8agZ50qD/i9QE+KXvLVqyXxz7AYha4yp/3YGeUJzlKOmsg91?=
 =?us-ascii?Q?cQlFSZx3tuCMQYWDZ8LXm6KBVU276SpYLwZpLWDE2fpfxaSDLTfmSWRPlxZt?=
 =?us-ascii?Q?X5V7Y9cgF/ngkXzZt36op5XO6q9FytADumZBJTB/6tTtqb3A/5OHsgfxbpRx?=
 =?us-ascii?Q?A7iY9om//hMhuLA5EVvDYjTPfRp/M6MDFuuNtLczBh1j6zNYEsJt5YeFJA1e?=
 =?us-ascii?Q?puPih6gIHzhnom9sQKnVQN1TzW5ARShpXGkJLjGtG3jWAFBddqWNYke0DH8T?=
 =?us-ascii?Q?v4pfw5BvXpTu2RDMjsV3SuqrmSYS4Og1NDJw1PoJ/rSRUKHnsu3rC3DgklLL?=
 =?us-ascii?Q?1LTP7jumSVgM5OuEzPsH3WVnRaV4SSA7qxZfx/RzbkoTgkxBNyed+5kEOBTo?=
 =?us-ascii?Q?8HdDjLAQUweiPH/p726WqqOhi/WlMu6ZYg8ChnYq3S8eEPgjVEmpuqVTE8yH?=
 =?us-ascii?Q?yoa6yOWawtwJYRjSgiq1ut0OzkRbXqDIYF+w/bPboXt6H6Dw+Z44lv7Sdnuf?=
 =?us-ascii?Q?6ZW7Hs0DRa/bKZznvNtXBKnqPWaO0swkK6OVEvbIevXYG9aFqdgLFzQ4hR4H?=
 =?us-ascii?Q?XtR0yj7p9YDHYzzY4GK3EOI8c0v45QklgDZ4fjzFBJkjHdYmI/M1eNbLji9D?=
 =?us-ascii?Q?R76u9RyZMQRi0seV6pgKP9OJAW1aKZnchkDum3HnvRwr6YQNYaX5DJYp4lB0?=
 =?us-ascii?Q?LN0yXbb9PLO3TQ5oLzWB3RdK2S9vx9em48KQqyNG12MH1q4+/SVXsyA6M8WE?=
 =?us-ascii?Q?V5aIlkmmAChjuYS30cj6vLkVTu3R//mu5jrQlGrSFwQJWe7RNnKHrwXVgJcp?=
 =?us-ascii?Q?nhQx2WdkBCeaJgr3+kn9TsXtiAgzAh2fh/6HRUrQEJ9gdM18M10VWmtmUZ9H?=
 =?us-ascii?Q?6tZRZmsNwxJX4B7AaisbdHdh4jjREt34yVCao8+98ii1NsNj5wlv/s9bj77+?=
 =?us-ascii?Q?4da3glHvkGpJAz7KZtmavmrTUTgyAEHu8V/2so9jkEz6kt1j1oFhtK4iazZK?=
 =?us-ascii?Q?TW/6FSi0FsRSkfVSAuwd3iTlHDqebyXMEFbg/EEnsKkb+/2qhJU/xGn0pvtH?=
 =?us-ascii?Q?8rA2Bg1xTpK8x5hEJIoc2o9Ph5NSaexhAA2J1QFL+azwKCO8l6vl2GfvCbZe?=
 =?us-ascii?Q?+xmKu5V8W+mODAVorB9dN4B2PAZgag0HTh/2HIBM6k98eiJqIQ801TC6tLW5?=
 =?us-ascii?Q?qt/qDeXjjiYbF3RAYTmRQpslSIHIpp4M7Z+Dl2oU8sXXL5/KFTHsJogv1n3f?=
 =?us-ascii?Q?kLiLsTZcD8ArkbiIb0CJ32Zt5rT5zMYiW1qc6Wa+YZ9rS8nPn9/axgIryVpF?=
 =?us-ascii?Q?m8sWF4JVbd7xLkE43teF8soddQ7TkZdZZTeKjjDryYl5iH3fLg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ppL9FTHvpLaqlukEEN4vWmqmnA3z47N/UEsTDK0ZSyhzmZaDfQPR7L2pm+Ti?=
 =?us-ascii?Q?qFx7PylCp+romUNUrwHVMrgxP3nBK4z6k71m3kf7W17k8dbDxOOTrMDytpAg?=
 =?us-ascii?Q?kF2zOV76lVVBf4eGOctpn5MADl2vud3Ns/78qIs1oCtE1wI3nIMu6lFectRV?=
 =?us-ascii?Q?XChAqxpOb2ygwn0AsrvB2RSjs0vg6hEB4YAEFbwwnRJtLKC09vytWFLc5dok?=
 =?us-ascii?Q?0YkTrww3eFIhLReIF2kiCNmZUdzq3KVauyHNYXDJLFEfv50RXXdz6tdxDzFc?=
 =?us-ascii?Q?hVekObjSCNuYrhjuBFVKqk+duBVQNVc7YvIy2Pg+xQ/Cut4wb5ZZaAfin//i?=
 =?us-ascii?Q?ECQpC/MfoEiwLcTWAgLQhRODgaA3r9OcA2DVXwPSWLU2JebSALfrExRJAoeZ?=
 =?us-ascii?Q?rjoa9iSkkCL2xpNajP16m9XchOnGAuXcbAacxt/rdLFoeM3J1K2zYOMDQL6t?=
 =?us-ascii?Q?dL8/fuEigXpC1i4xyK9wcZYsVModTb9LGqUMolF6+CaKs6nfiZ7f7Zl/VQ9Z?=
 =?us-ascii?Q?5ZOCt0rEMMtkgpV6O9sHqIPl8CD3prvvFKbs+xYqRP1r83MlY5ajWnk3MPb4?=
 =?us-ascii?Q?z9yH2v5eUYVQD39xJ5r7PZGBf0fh9f3cXGhIZ5AxEiZWj16H4cPIuUKhA1lE?=
 =?us-ascii?Q?EAS0jiWocEq+FL8mY56hZ1Cb3OuYeQfHhDRoS8dhqjpbxFpY9jWx4pwbrUAl?=
 =?us-ascii?Q?qnYiDke22OnXcHjGGFWLH9PGbXxj4Vuvc7jw32e/ijUfHDRJZs2tOXhQ7wC5?=
 =?us-ascii?Q?ij3x+h8SS9+vD0Wq2hA+9uvarOfYLGvjX3aV0JmU4sip9S3VQ2d4TKmKO29Y?=
 =?us-ascii?Q?pmRPxNYG/BeV70G858xKZQHmNMOxFa73ZB78xOogNsZLkyKFIuGxGfXEHnJU?=
 =?us-ascii?Q?vWzuhAStFZ5kSTL0sxAHXU+z3WnefY61+5jWKptZP3kxMwH6fLIOnjfFzwTe?=
 =?us-ascii?Q?K/Zu4Jnez9zCnzoi/Z1cnU6Kinp065SczosWf65jaJfuoaTlizJnm1l1lelV?=
 =?us-ascii?Q?lnAJeI4k0GXxLj1T+u54qvTIQ1bri+HOkWV5A+2Y3Tjnk7UlfOJQT5ytvTjR?=
 =?us-ascii?Q?daOP/m+g9FeitUXpEiFBacBG7dJxwiiHWChdI5deyTHvUzv7SHnEnyaRcBIF?=
 =?us-ascii?Q?z3/pSDSE5wKAeH/3I+kYT4E4xdCMRxKZP7EecirJ0+2GxDEdhqc288CJtQ8M?=
 =?us-ascii?Q?jwyGj97Or/mrFsfd6a9CydRXrXT2lM2sRGa8ESyAFUX9DswM5Q32wgsOgYC+?=
 =?us-ascii?Q?ddLxF/yPDzjIGs43S8kls3IDV4KxnmGggw1KQNgh/P/NUo+gagfJmUt/rWLq?=
 =?us-ascii?Q?Xu3i7bKs+MZxXmkG75Yf0/5sGDJopt/K8gznyDRebU8M1pRVsfWeYSeIwfhW?=
 =?us-ascii?Q?KQiuVWc8ny5GQl6U16IaoveV5RMqwBRKA+gyM51lPJ3omJ/RC/APoRu6u4K7?=
 =?us-ascii?Q?GzC2sKj3AoQvtuMZoMcoTQ2cA+NzVJLf4zA3OhGWnLYPMucqidrsceaSGvr6?=
 =?us-ascii?Q?teSMnxBBrbBmRjhq1HZqCuW54z25K/mPsSsXBpoySvNrvoqFx+Zu8aGrY63m?=
 =?us-ascii?Q?ySsOlKEa2/JPRWe/xA3F4+CLW6Qnn2e2HOPgV2lI?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0090_01DB6CEC.C89F0CF0"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e937fd-a625-4009-ace5-08dd3ad5d275
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 11:13:38.9702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+h2slqLEaOEHQNUKytv/Ra+joAeXYP7UGUf3VJIgu0dTWjK1vOsVIBUDvxUW4Y8n3NLwQuI+B/bwqp4Cztgwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9825

------=_NextPart_000_0090_01DB6CEC.C89F0CF0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit



-----Original Message-----
From: Krzysztof Kozlowski <krzk@kernel.org>> 
Sent: Monday, January 20, 2025 5:54 PM
To: Pankaj Gupta <pankaj.gupta@nxp.com>>; Jonathan Corbet <corbet@lwn.net>>;
Rob Herring <robh@kernel.org>>; Krzysztof Kozlowski <krzk+dt@kernel.org>>;
Conor Dooley <conor+dt@kernel.org>>; Shawn Guo <shawnguo@kernel.org>>;
Sascha Hauer <s.hauer@pengutronix.de>>; Pengutronix Kernel Team
<kernel@pengutronix.de>>; Fabio Estevam <festevam@gmail.com>>
Cc: linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
devicetree@vger.kernel.org; imx@lists.linux.dev;
linux-arm-kernel@lists.infradead.org
Subject: [EXT] Re: [PATCH v12 4/5] firmware: imx: add driver for NXP
EdgeLock Enclave

Caution: This is an external email. Please take care when clicking links or
opening attachments. When in doubt, report the message using the 'Report
this email' button


On 20/01/2025 17:52, Pankaj Gupta wrote:
>> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are 
>> embedded in the SoC to support the features like HSM, SHE & V2X, using 
>> message based communication interface.

> Fix your machine so this is not a "future" work.
Accepted. Correct the m/c time.

>>
>> The secure enclave FW communicates on a dedicated messaging unit(MU) 
>> based interface(s) with application core, where kernel is running.
>> It exists on specific i.MX processors. e.g. i.MX8ULP, i.MX93.
>>
>> This patch adds the driver for communication interface to 
>> secure-enclave,

>Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.boo
tlin.com%2Flinux%2Fv5.17.1%2Fsource%2FDocumentation%2Fprocess%2Fsubmitting-p
atches.rst%23L95&data=05%7C02%7Cpankaj.gupta%40nxp.com%7C82dee31b12c7489b3fc
408dd394d46d1%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63872972623236648
5%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOi
JXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=rzrVqx%2FAmPgI
r7iq4y1duYLgkB4jMm1RVYJfRMSmtJ4%3D&reserved=0

Accepted.
Will replace "This patch adds the driver for communication interface to
secure-enclave", with
"Adds the driver for communication interface to secure-enclave firmware."

>> for exchanging messages with NXP secure enclave HW IP(s) like EdgeLock 
>> Enclave (ELE) from Kernel-space, used by kernel management layers like
>> - DM-Crypt.
>>
>> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>>
>> ---

>> +int ele_fetch_soc_info(struct se_if_priv *priv, void *data) {
>> +     int err;
>> +
>> +     err = ele_get_info(priv, data);
>> +     if (err < 0)
>> +             return err;
>> +
>> +     return err;
>> +}
>> +
>> +int ele_ping(struct se_if_priv *priv) {
>> +     struct se_api_msg *tx_msg __free(kfree) = NULL;
>> +     struct se_api_msg *rx_msg __free(kfree) = NULL;
>> +     int ret = 0;
>> +
>> +     if (!priv) {
>> +             ret = -EINVAL;
>> +             goto exit;

> This does not make sense. return.... but is this even possible?
This is added as part of previously received comment.

>> +     }
>> +
>> +     tx_msg = kzalloc(ELE_PING_REQ_SZ, GFP_KERNEL);
>> +     if (!tx_msg) {
>> +             ret = -ENOMEM;

> return -ENOMEM.
Accepted.
For all the similar changes throughout the driver, will replace this.


>> +             goto exit;

> Please read in coding style how gotos are supposed to be used.
Accepted.
For all the similar changes throughout the driver, will replace this.

>> +     }
>> +
>> +     rx_msg = kzalloc(ELE_PING_RSP_SZ, GFP_KERNEL);
>> +     if (!rx_msg) {
>> +             ret = -ENOMEM;
>> +             goto exit;
>> +     }

Accepted.
For all the similar changes throughout the driver, will replace this.

>> +
>> +     ret = se_fill_cmd_msg_hdr(priv,
>> +                                   (struct se_msg_hdr
*)&tx_msg->>header,
>> +                                   ELE_PING_REQ, ELE_PING_REQ_SZ, 
>> + true);


> Fix your coding style - run checkpatch strict on this.
Accepted.
Ran the checkpatch with --strict option and fixed the issues.

>> +     if (ret) {
>> +             dev_err(priv->>dev, "Error: se_fill_cmd_msg_hdr
failed.\n");
>> +             goto exit;
>> +     }
>> +


...

>> +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info 
>> +*s_info); int ele_fetch_soc_info(struct se_if_priv *priv, void 
>> +*data); int ele_ping(struct se_if_priv *priv); int 
>> +ele_service_swap(struct se_if_priv *priv,
>> +                  phys_addr_t addr,
>> +                  u32 addr_size, u16 flag); int 
>> +ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t addr); 
>> +#endif
>> diff --git a/drivers/firmware/imx/ele_common.c 
>> b/drivers/firmware/imx/ele_common.c
>> new file mode 100644
>> index 000000000000..67d1fa761172
>> --- /dev/null
>> +++ b/drivers/firmware/imx/ele_common.c
>> @@ -0,0 +1,324 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2024 NXP
>> + */
>> +
>> +#include "ele_base_msg.h"
>> +#include "ele_common.h"
>> +
>> +u32 se_add_msg_crc(u32 *msg, u32 msg_len) {
>> +     u32 nb_words = msg_len / (u32)sizeof(u32);
>> +     u32 crc = 0;
>> +     u32 i;
>> +
>> +     for (i = 0; i < nb_words - 1; i++)
>> +             crc ^= *(msg + i);
>> +
>> +     return crc;
>> +}
>> +
>> +int ele_msg_rcv(struct se_if_priv *priv,
>> +             struct se_clbk_handle *se_clbk_hdl) {
>> +     int err = 0;
>> +
>> +     do {
>> +             /* If callback is executed before entrying to wait 
>> + state,

> It is not a networking device. Use Linux coding style.
> You already got such comment long time ago and not much improved.

Will remove the comments from the function body.


>> +
>> +static int se_if_probe(struct platform_device *pdev) {
>> +     const struct se_if_node_info_list *info_list;
>> +     const struct se_if_node_info *info;
>> +     struct device *dev = &pdev->>dev;
>> +     struct se_fw_load_info *load_fw;
>> +     struct se_if_priv *priv;
>> +     u32 idx;
>> +     int ret;
>> +q
>> +     idx = GET_IDX_FROM_DEV_NODE_NAME(dev->>of_node);

> NAK. Node can be called firmware and your entire driver collapes.
The macro is updated to verify the correct-ness of node-name.

+               (!memcmp(dev_of_node->full_name, NODE_NAME,
strlen(NODE_NAME)) ?\
                ((strlen(dev_of_node->full_name) > strlen(NODE_NAME)) ?\
                GET_ASCII_TO_U8((strlen(dev_of_node->full_name) -
strlen(NODE_NAME)),\
                                dev_of_node->full_name[strlen(NODE_NAME) +
1], \
-                               dev_of_node->full_name[strlen(NODE_NAME) +
2]) : 0)
+                               dev_of_node->full_name[strlen(NODE_NAME) +
2]) : 0) : -EINVAL)

>> +     info_list = device_get_match_data(dev);
>> +     if (idx >>= info_list->>num_mu) {
>> +             dev_err(dev,
>> +                     "Incorrect node name :%s\n",
>> +                     dev->>of_node->>full_name);

> Nope. "firmware" or "secure" are correct node names.
New check is added to validate the correctness of the node name for this
driver.
Replaced the message of " Incorrect node name..", with the help message.
-       u32 idx;
+       int idx;
        int ret;
 
        idx = GET_IDX_FROM_DEV_NODE_NAME(dev->of_node);
+       if (idx < 0) {
+               dev_err(dev,
+                       "Use \"secure-enclave-n\" as node name, where n = 0,
1, 2, ... is node-index.");
+               return -EINVAL;
+       }

> Where did you document this ABI?
Will Add new ABI document: "
Documentation/ABI/testing/sysfs-firmware-fsl-se", to reflect this.

+What:          /sys/firmware/devicetree/base/firmware/secure-enclave-[0-9]
+Date:          Jan 2025
+KernelVersion: 6.13
+Contact:       linux-imx@nxp.com, pankaj.gupta@nxp.com
+Description:
+               NXP offers multiple hardware IP(s) for secure enclaves like
EdgeLock-
+               Enclave(ELE), SECO, v2x. The device node must be defined
with name as:
+               "secure-enclave-n", where n is 0, 1, 2, 3 ... index of the
node.

>> +             dev_err(dev,
>> +                     "%s-<index>>, acceptable index range is 0..%d\n",
>> +                     dev->>of_node->>name,
>> +                     info_list->>num_mu - 1);
>> +             ret = -EINVAL;
>> +             return ret;
>> +     }
>> +
>> +     info = &info_list->>info[idx];
>> +     if (!info) {
>> +             ret = -EINVAL;
>> +             goto exit;
>> +     }
>> +
>> +     priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +     if (!priv) {
>> +             ret = -ENOMEM;
>> +             goto exit;

> Nope, You don't get how common exit works. You are supposed to clean up in
comon exit paths, not print error paths, especially ones which are not
welcomed - like here.
Accepted.
Replaced "ret = -ENOMEM; goto exit;" with "return -ENOMEM;"

>> +     }
>> +
>> +     priv->>dev = dev;
>> +     priv->>if_defs = &info->>if_defs;
>> +     dev_set_drvdata(dev, priv);
>> +
>> +     ret = devm_add_action(dev, se_if_probe_cleanup, pdev);
>> +     if (ret)
>> +             goto exit;
>> +
>> +
>> +     /* Mailbox client configuration */
>> +     priv->>se_mb_cl.dev              = dev;
>> +     priv->>se_mb_cl.tx_block         = false;
>> +     priv->>se_mb_cl.knows_txdone     = true;
>> +     priv->>se_mb_cl.rx_callback      = se_if_rx_callback;
>> +
>> +     ret = se_if_request_channel(dev, &priv->>tx_chan,
>> +                     &priv->>se_mb_cl, MBOX_TX_NAME);
>> +     if (ret)
>> +             goto exit;
>> +
>> +     ret = se_if_request_channel(dev, &priv->>rx_chan,
>> +                     &priv->>se_mb_cl, MBOX_RX_NAME);
>> +     if (ret)
>> +             goto exit;
>> +
>> +     mutex_init(&priv->>se_if_cmd_lock);
>> +
>> +     init_completion(&priv->>waiting_rsp_clbk_hdl.done);
>> +     init_completion(&priv->>cmd_receiver_clbk_hdl.done);
>> +
>> +     if (info->>pool_name) {
>> +             priv->>mem_pool = of_gen_pool_get(dev->>of_node,
>> +                                                      info->>pool_name,
0);
>> +             if (!priv->>mem_pool) {
>> +                     dev_err(dev,
>> +                             "Unable to get sram pool = %s\n",
>> +                             info->>pool_name);
>> +                     goto exit;

> Why do you print erros twice?
Accepted. 
Moved the dev_err to dev_dbg.

>> +             }
>> +     }
>> +
>> +     if (info->>reserved_dma_ranges) {
>> +             ret = of_reserved_mem_device_init(dev);
>> +             if (ret) {
>> +                     dev_err(dev,
>> +                             "failed to init reserved memory region
%d\n",
>> +                             ret);
>> +                     goto exit;
>> +             }
>> +     }
>> +
>> +     if (info->>if_defs.se_if_type == SE_TYPE_ID_HSM) {
>> +             ret = se_soc_info(priv);
>> +             if (ret) {
>> +                     dev_err(dev,
>> +                             "failed[%pe] to fetch SoC Info\n",
ERR_PTR(ret));
>> +                     goto exit;
>> +             }
>> +     }
>> +
>> +     /* By default, there is no pending FW to be loaded.*/
>> +     if (info_list->>se_fw_img_nm.prim_fw_nm_in_rfs ||
>> +                     info_list->>se_fw_img_nm.seco_fw_nm_in_rfs) {
>> +             load_fw = get_load_fw_instance(priv);
>> +             load_fw->>se_fw_img_nm = &info_list->>se_fw_img_nm;
>> +             load_fw->>is_fw_loaded = false;
>> +
>> +             if (info_list->>se_fw_img_nm.prim_fw_nm_in_rfs) {
>> +                     /* allocate buffer where SE store encrypted IMEM */
>> +                     load_fw->>imem.buf =
dmam_alloc_coherent(priv->>dev, ELE_IMEM_SIZE,
>> +
&load_fw->>imem.phyaddr,
>> +
GFP_KERNEL);
>> +                     if (!load_fw->>imem.buf) {
>> +                             dev_err(priv->>dev,
>> +                                     "dmam-alloc-failed: To store
encr-IMEM.\n");
>> +                             ret = -ENOMEM;
>> +                             goto exit;
>> +                     }
>> +                     load_fw->>imem_mgmt = true;
>> +             }
>> +     }
>> +     dev_info(dev, "i.MX secure-enclave: %s%d interface to firmware,
configured.\n",
>> +                     SE_TYPE_STR_HSM,
>> +                     priv->>if_defs->>se_instance_id);

> Drop probe success. Useless.
There are multiple SE interfaces.
This message confirms SE communication interface to FW, is successfully
established and configured.

>> +     return ret;
>> +
>> +exit:
>> +     /* if execution control reaches here, if probe fails.
>> +      */

> Obvious comment.
Accepted. Removed.

>> +     return dev_err_probe(dev, ret, "%s: Probe failed.", __func__);

> Drop. I think I asked already long time - like 10 revisiosn ago - to drop
simple function debug messages. Look at other drivers how exit paths are
handled.

Accepted.

Will replace "%s: Probe failed.", with meaningful info "Failed to configure:
i.MX secure-enclave: %s%d interface."


Best regards,
Krzysztof

------=_NextPart_000_0090_01DB6CEC.C89F0CF0
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIImZTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
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
ggEKAoIBAQCsljsxzffby7IAt42e7cJH7K+49RL+7i56h3ORt8dS8WNVSdDlejp6uS6mLk/UX0wn
sSxDK1S5KquGJQzaT/3gxE8tdgvfFNBVdrgr48DeCVwWDr1o/UF3RmGcMdxqRz1M/oLDJ03C8n6h
L/0JXiwsNx0KZJoqDrN/48yX5TkoeKJmHFftZ5Op57xV0WkZJ/yLxSC1Om75jOG/UPdqsDzl+wi7
YVj5egV24hoaXgHBxtCeJzUgsHcJlo9nFtGe11j6H1vqFzkPzN9ydjRmhQATV/WLqpG8uot79u0m
6n7Mjwsd/HmJf+8xpovMcHPO2a0axppssKso/3APP6mR1FuVAgMBAAGjggORMIIDjTAOBgNVHQ8B
Af8EBAMCB4AwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMAwGA1UdEwEB/wQCMAAwHQYD
VR0OBBYEFLNr0DCWM1fCXv4ubOt/elkvcoiaMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRw
YW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFua2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAU5TJ6
9GbBR5Ykf/wngDlY3ysX4rswggFKBgNVHR8EggFBMIIBPTCCATmgggE1oIIBMYaByGxkYXA6Ly8v
Q049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1ubGFtc3BraTAwMDQsQ049Q0RQLENOPVB1
YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2Jp
LERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hjFodHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFAtRW50
ZXJwcmlzZS1DQTQuY3JshjFodHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFAtRW50ZXJwcmlz
ZS1DQTQuY3JsMIIBEAYIKwYBBQUHAQEEggECMIH/MIG7BggrBgEFBQcwAoaBrmxkYXA6Ly8vQ049
TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2Vydmlj
ZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jQUNl
cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTA/BggrBgEF
BQcwAoYzaHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFAtRW50ZXJwcmlzZS1DQTQuY2Vy
MDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRVhu2FOILrmUuaklY/hMbNXILljX4C
AWQCAT8wJwYJKwYBBAGCNxUKBBowGDAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDANBgkqhkiG9w0B
AQsFAAOCAQEAWS4IrHXWhCGNWk5vn20xV7mlLkM7JPwltVJzB6MRzwUB438upbyUMwNHcEgAmHcs
xL9hafErN+n9rLL00wEqZsCV732s7YOxSRRjZTE3CmZQ2+TYjXR7A6AzQKo0fv/x43bpSes8ttQ6
Qtt8nzIbGBkDAcI7wfXsUPF5o0NwLOxre+Z+JCPNH0eaOj2J7EKD2ERLCClmvohrYdlmu85iXfyi
nJo42eq9g08FtnxTXVQSIZCtiETiGtXA7+t2Aa8429XXunsijRznaYw2SwI/s4sVmvaK3XHaif0D
QaUYxQp4s2ctzgz3eU6hK68OnNzbhBtF/lx6PHbifqHDzrtUbzCCB+8wggbXoAMCAQICEy0ACwRu
JYOozH+yQuYAAQALBG4wDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMzEyMjAwOTIw
NDdaFw0yNTEyMTkwOTIwNDdaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAklOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
ODcxNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2JT+kRihW1mBdeZFOoCLGIl4DZ
VL7FWt3V1iFFJJe/bZDw/SUf5z1HeA8xv9+S8rqMyybjlSRHFLgiMm7qrGpVEDniKe8eiqP8Un4Y
3fHgK5FKZIVVn0KlaMuD5G30AMk9HyUdc2MkVRL8YSQCewkQDEVjB8gnx/e6xfbWEVHf5+dOWJoR
aket5+0JKV0l/dPV7cT4hL3BFtiBhq8976Li6rn8gxIi63u0G3qvm9Scqk+EHzemDhw/W+eMmGR4
nwKVLKzumxko8l6EOnnvqqF4vj2hKTpB+2lsEXH1giireMEsvB2RY40lnRUXVQ0FDklOIQV4Qdgi
EJfUdq/ZhCUCAwEAAaOCBA4wggQKMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/gbeCPIPthzICAWQCAT4wEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwHQYDVR0OBBYEFMJ81PK4p3H8Q7gn7u/5OwWx
uAwGMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRwYW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFu
a2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNV
HR8EggE9MIIBOTCCATWgggExoIIBLYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENB
JTIwNSxDTj1ubGFtc3BraTAwMDUsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENO
PVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9o
dHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3
dy5wa2kubnhwLmNvbS9jcmwvTlhQRW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIw
gf8wgbsGCCsGAQUFBzAChoGubGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENO
PUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdiaSxEQz1ueHAsREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1j
ZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29t
L2NlcnRzL05YUC1FbnRlcnByaXNlLUNBNS5jZXIwDQYJKoZIhvcNAQELBQADggEBALwIIuww1PaF
EbpQoy5vgJ/4N3xS+niIpFTKyYNAD0Ar38FcUlSnj0FIHKRj8rUmZP9WTky3U8m5B3LOyhJ14FPh
iy1EwkhZmds9fJiZyEEFiwQWYDG/uknu6zIKOTlLmtlYPfbzfi58keGcjD3T5H8D8DpCGWI1lAwe
clR9fJCbcYnQSQnuicSCfrHjjXiDZ2O8h7WbE1CC6Cj/qwo5nmS0lMv7yoG94rTNBvYe8iqOkcav
7KiZA6SdhXms3ppvFmBukI6pTheMvT39SM0S6E0dgeqZSGSxHrM7dcxUdAL4fnYMv3Sa+GAgyXB6
rihWC11+goz2eawt5TRU2w45TmcxggSzMIIErwIBATCBzjCBtjEcMBoGA1UEAwwTTlhQIEVudGVy
cHJpc2UgQ0EgNDELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5k
aG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJ
kiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MAhM/AAV1goSs
wyqoLYNbAAUABXWCMAkGBSsOAwIaBQCgggK5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTI1MDEyMjExMTMzN1owIwYJKoZIhvcNAQkEMRYEFGrZVts/7H+P5/EztVKL
EXrdWR2RMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
hkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsO
AwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMIHfBgkrBgEEAYI3EAQx
gdEwgc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjCB4QYLKoZIhvcNAQkQAgsx
gdGggc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjANBgkqhkiG9w0BAQEFAASC
AQBZhRAGcgHVAPhDj/aVwUsjBYNZ3Up0wjotGx3a8SCceewNuIqS6HABD6tc+D6KxmqRV5LAO/Xh
BdtI720+shbzPL5/umz7CrxRhjCzKKpVJnxX61MwLtQPJqDcd20m0o3MG2rmqjaGDlECRTZYL5LX
zFvdtknl++UV6IeLr4S3I0HkuEqP/U6YGGIFubOFnQPvGAIGU3Eqc9xgeYA6nB/aBN9sD8wORKp7
/6eN53l44fXwrEQ5Z2pPU9SksCq3eMNMxzbR/BV7i+rj2WTNtehHhGx3GRwQNwWmAZRbB+R5s07C
euhU7zsoBRs46Tf/88XbU73DtqfXXfCKXlBWkPTkAAAAAAAA

------=_NextPart_000_0090_01DB6CEC.C89F0CF0--
