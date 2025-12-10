Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023088.outbound.protection.outlook.com [40.107.162.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E830100E
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765380012; cv=fail; b=mTYElV9dyfZS5femEOU0XhlxyrYl7sq8UVyq0zretxyHIf0J+AOGw7+GrbNiGcTTinchcxXvn7lUmCQYzqubuai0mRt7S9B4hYP8hxoTf0BiS35W4GrrT7gSXlEsO7CsBMxsM5MwUyQ6ZD/5H1qhoOGG3uu4JjXzujryCCE/hGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765380012; c=relaxed/simple;
	bh=D30yLdQwmcvlyGWvANYIWhO0LiBHep+l9Jxkr9BzkgE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rQE1AljuiMzk4bZdDW3iNiEph3fa1byF3X9msTPGtV66gSe+KiPDSZUJRT0+RCnsk8dkidxNE+YcehikfdhmRmD20Q5nK9JtkFRH9gab2jWlZAiGkaXw0UCnhwPCTYZ+jwdJaF8wwQ+cFjEg+5ufYWReVcX/Joa1f5uYFHNGIMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=UI5h/PlH; arc=fail smtp.client-ip=40.107.162.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="UI5h/PlH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0yplXWDLM0bUH/7KXNN+ETz6p+Hjrl/89MuNQTVIRdxsgQy8In+ccQ+PnEzAMWdslirPWef8XHAXAGR0agAfpndlJHWtxqE+b/Jsx+/p9wUb+u2qM1AcSlHM9PddAEvTl2QEeOZQjXu5djlrgVbbncKg3yvFw+JZf2vujpSK5PArE3XbTOcCPLfwEyntu6sOXT+cBaawrU737ekpjyCjC8elMPKKIOu0jZ7ZfTyEQ/NDkO9gYq3z9WB/cC+RcEUeQui28pJWInp10ErHuCE2KLYp6PWMcCHQRNIkKnMKVrH0GWO4APv4x0dIQV2gXjRrxO1eEBhwtt/7cJVwWTjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAaswHLz8QkSABSkOV8geTMX+d1TZASKowrtq+B0NI4=;
 b=Jjc5FEjbmoH6qemvXyGiANfaz00el27G53iZFQC3m5D6ijtmY8fvS7SsY5RxsOsy/JTFkyM3MR4inhhOqTF9RuwYV/qDXMIOaAhNKhgsYHhDaQisW4fLFRFYAF60vW6Xucr3N0HFQOmJbHiajpMiODND4rwhVhheVXd9F9DJj7zNgxkJWRUVbwvUIYC5otEjQKSUpT8+CdlOpfTZR47ccrGNfK5pVAOeYT/m7tCZwJnfYSh9pN/RqUrz2HhUyZ6MOsqzaR0f12durcv2Fa3p/bubEq0bRwvNKgHNDDe3u3qU6Er3QXOQ8sovZZl2oCEKGCjVrUTKaGg+WOTk5FbYxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAaswHLz8QkSABSkOV8geTMX+d1TZASKowrtq+B0NI4=;
 b=UI5h/PlHb8XJi7hi94oz1otMKzUJPJA2CVuK8XnJG76np6wRpJXfiBS/INkInSK8TAEtauGNtP5jtqXPRSLrcXDtmOb3UBjLIcsaVhVteu7YWxI8DAW6uoa5SuG53Xr6V8zfhJ3o4mI/NiFGZdrKig2Mk8tE23d/vdRFNtHqj7F+xNDoE8LaObyd2peV0LaIcBFjK7uh7oVoHQhzpu9RIFX6YYmh7vrrBAAo482NzLf56QMPXZAiiBiy/RkHhyGoSVRntVgTsSUOc1IoQa7duwdsF5UMsSfZyNR5MVjw74vCCrb/tKuL3EmAPg1MtiXCq5blwf8ZP1u30fPDoG52GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by DU0PR08MB8347.eurprd08.prod.outlook.com (2603:10a6:10:409::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:20:03 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:20:03 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/6] arm64: dts: imx8mp-var-som: align DTS with hardware revision
Date: Wed, 10 Dec 2025 16:19:52 +0100
Message-ID: <20251210152000.42265-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0049.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::18) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|DU0PR08MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: c983bbb9-88a7-403f-4287-08de37ff97b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DoerVYoTacY5TI4fTmcKD+dyfJoaXX9YG9PvuTSfhXPodSaVCMVWzGWQVwr/?=
 =?us-ascii?Q?IJglHEfCtNJ0n5busLcx3yLe3IP50yRcal6mTzOwaJolWFXTRaJag+l8HpbF?=
 =?us-ascii?Q?11q4Yr8OVpy8oiZDOz0ZiWyaRpCvUUawo4UaHdMm0QQyxP3XC76xxCtY+1vO?=
 =?us-ascii?Q?pRYRhJddCNRCTsl8p6WJVUwJ/5rAWI8vuFDPiFzJ7ieVWA3upD1ys/T+4r1F?=
 =?us-ascii?Q?r6yCpE2flqxVnc8D6IpCRDvsfWvAgyxeUni8MnEyBCgDuXf7YifqVeyLERMa?=
 =?us-ascii?Q?DdEjso0/Mt4TDdQAnqCHQng+BtDx+Vf38p2pHnWWp/KaGHrKWiEbIkhVEG0t?=
 =?us-ascii?Q?iXAIzodnCiO2sm40we9uroXVhweg1gqXwdvzYxOmDm6f35/eI5EJ6MBJRB7a?=
 =?us-ascii?Q?rsUEWKHzQ4cRKK2llcJvwH1IzlUWY6tbGt7nQtpc6+cduXO+PSsid1STQhB7?=
 =?us-ascii?Q?3+4jDmU8xAhuQRF0UVusqwxlTlI3YOvHYzIYoTi5+6GZEHklYVa092UF8nS/?=
 =?us-ascii?Q?Eu1s5HKrGESI6PO4vlL7qeWwBN681p+23qcjB6eWhzm7H9R2c/yTeiXNi3Td?=
 =?us-ascii?Q?VCAwSA8G7NlTVp30QIaTT7KYBk3Bo1P4Y7ounvXYcQ5cwqYg40PyWwQF6Fbf?=
 =?us-ascii?Q?fUQRqnCTHpcz3uYg0KSdo+N59YwZBz1KsmZcig3+2lKGmsydUwVtTcaYbEoV?=
 =?us-ascii?Q?Z9b8VfcmnqfzXwINhhotRzkIOJgyh/7KVOCikEZAhp3kTU6rZJRXmNbg91l/?=
 =?us-ascii?Q?hw+mKZWCfNuOfyAjjV5Yi2QavjUgTxJPxrkv3BtgbRoSBLZVe5Mz66CrLLv7?=
 =?us-ascii?Q?V2Hin/I+cL/ScGJEs3UlENgmUTLnyCHhTIgiGdW9dfPKAkFZe+W7NWbEACQd?=
 =?us-ascii?Q?f/ABPifBzgWzWnj1sSQ59Ypnuxnn2Os1X3Lw611K8ccPZWkHU57cEPdRvpsW?=
 =?us-ascii?Q?GvvVjx9U96nOIFZQVi7OIALjP58oLhlHUqfE1s0NPgg1Ux0veBP9fTdPL5N5?=
 =?us-ascii?Q?zDrytYj0UucM+FsrWkg3OONbVWon0FuRrOHmfsD/qVnZcycpBuR99eVEBhbJ?=
 =?us-ascii?Q?94z8b7NHVMrGVYz+PqesUBEGayFFxharNV/87m0twY9eVv9lfuvjgK9ktk1j?=
 =?us-ascii?Q?8YpSt38uHQWSHjYFFp9MdClVBHdH+Xxec0FtWrF4R4Z0RelgjNXdrpzindOl?=
 =?us-ascii?Q?+5VCfqMv9XmJ7/skcuT9Jq86J5a1axuK5Gf/3+COuaKIMn/r1Fp+gLH0eLC0?=
 =?us-ascii?Q?O1Ha/gwPNfBeZc1gdQMoTUvcSmpUr9IgNO3cAuMxqMrnBqjSrrl2sgXjsj/5?=
 =?us-ascii?Q?y+Zcjj3pClQciOuWSpaWwcQXayJC/d5cC2tVfQiXlTLwrG7lsmKxC9iWcnKR?=
 =?us-ascii?Q?mEMXkW6Ufs2tRRVmyTiIEsszYb937L3YFHWQTUiFNccdN23C4URCUZfdIII7?=
 =?us-ascii?Q?bBO7T49MEWjg4RQinuzeg8GKuJkf873I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kB/yJGnHO4icnub2A3gYV8M0yKCd+0a714oVYnRI8dM+pj7oXWklfBGwYVn4?=
 =?us-ascii?Q?Ee4k9Eu9J+VjKxnCIM3lVB5LB4UG/yutrWMqLyrmRJswuBTjELawKydK81Xm?=
 =?us-ascii?Q?9Wpy7ZtfQW6q08fV41s4lcxq0HQl0Yfex+jEHZcNgLoeATpoiRSF3gbHbT6B?=
 =?us-ascii?Q?wkvAliStbPloycIu6PwKx4dbclzpnLeQjeT8nZlT//bEPV+LuT6jbqp+Rs3M?=
 =?us-ascii?Q?ObfkterG6gJjrQmSkFQM6zYnUzo5MmI+ZmdxUHCQudJkaI2M/PkPx1SALFYH?=
 =?us-ascii?Q?CtAoF60bdrcseObSPJXi01x5Trkd/JQMXBpdOtWMcHVTkFMJSYEo32zMtXz+?=
 =?us-ascii?Q?vOIxOYC70TKW2VVJ5IJ+UKFzps9B7E/UdlxpursHcoN2HVkznLd3+d4BQkYS?=
 =?us-ascii?Q?HQtBmfsBYNSAXXgeQo2OroXwJj25ZQj9sSgubTDkrDfb7lGWnSQDHjVrdrjC?=
 =?us-ascii?Q?QYFDoBqmPsX24JMbIXiLMS6v533Ifx5hE6qGKDpymEZdrsfOqNlaSBSTnez7?=
 =?us-ascii?Q?oa35q1HPHPc4uvV0L51z4R0qPVKutQddFxqLu/jLSjwjRupMK568i7quWt7B?=
 =?us-ascii?Q?NNc6OgHBr8QwBf5XczjYviZjtAau6XAQSBvzOj1huBq28B/9UzFwN+BVoedH?=
 =?us-ascii?Q?XYuVndLcubwuSzX+ge/Yx3VnFLtjrO0E2+x9vOOHhy9DE2POgM9+GbpUDscp?=
 =?us-ascii?Q?Hrn4BHwH+/yYy2PmbUN2+ohDy6YiGqkTKdHOWxyPn7JhEzdHpLg9U6N9f/bZ?=
 =?us-ascii?Q?A0CUrerwz3XdSdUjW8RKTA4wkpqhI32xWPBSB4xKFDgrMLo9OhmHd9oomLAK?=
 =?us-ascii?Q?+KkDcOYak5oLzmnk/LM1ZyVZdHvOdtxz6K0ROhorl7PNaZAIixTQ0zenNjtE?=
 =?us-ascii?Q?F4KQhzHyHJaemFF7u7FY/yOcwyGP+MtDN7oRLeX/zphf+xGIZuXjXK7Z/+Qf?=
 =?us-ascii?Q?aD5WJMzIk9O1ML88+tgm6zrHK6wjXsX9HENwhgwQ0/Gt8KoQ0uD+fCwi0Pet?=
 =?us-ascii?Q?Qx6Wq43R1N+bMUi2QeVDOSLi+iYwDm7Hf6o5OKZK367iwUEaqVJNzby2cJyK?=
 =?us-ascii?Q?aV1VhdP7XXsV9K+Et+7mKHBXDGlcByP7kNYHKBQ8LVEWrK7iqGUbYXHgHH2+?=
 =?us-ascii?Q?fxSzbRmwXwNkTpfBpuQ5Pf0Ssd0QU4l32RZoI02fffwHfS4YhT4ZuuMaBr44?=
 =?us-ascii?Q?adOeDwBmOBSndZRu889qrvjxpTTyEonqF9DpVijwXyPWfKs4C19Adn2FXWKN?=
 =?us-ascii?Q?RjoBrGj2JmE36ycJ/JylP4oai3T7nWigVmfkO4vZq1xxKeq/MOO77Vdki9sB?=
 =?us-ascii?Q?zZgYU5b8G3s0LRtNtKef6lAZSDfUurldZAYMtbGQUw3ojZ5Vpsy2hSkW21wv?=
 =?us-ascii?Q?Jm4uRfwwsXU21iHaA57eJRjP71zscT28dkxlhuqT0z5tw86EpBwvalFUl2Fs?=
 =?us-ascii?Q?WYF6U3QN+1/UwY0fMQk5OGH8VYMMlUbE/Xr+R/zvRJKdL/JuQKsid5i2pQRu?=
 =?us-ascii?Q?YCh9q13bDHTMhuNPWFtRCrUB9URjT7skzF1wEpakJHygrYBoFzZOE+r1nt/Q?=
 =?us-ascii?Q?BESdx/yS8crDXSj/jinYy+LHCkP2ITLsKe9OaNLv?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c983bbb9-88a7-403f-4287-08de37ff97b4
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:20:03.5683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cY2J9W1vTrDP+5XFQ4m779uNXXt4Ey/ngr+9BPOVe2Z2ucOKARXkMdZnqJU/2R1m0B9DXofyiHVXHMY9Ym0yMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8347

This patchset updates the device tree support for the VAR-SOM-MX8MP
module by removing nodes for hardware that is not populated on the SOM
and by introducing support for several on-module peripherals.

The first three patches drop USDHC2, the PCA9534 GPIO expander and
UART2, all of which are only present on the Symphony carrier board or
other custom carrier designs, and thus should not appear in the SOM
device tree.

The remaining patches add support for WiFi+Bluetooth connectivity, the
WM8904 audio codec, and the ADS7846 touchscreen controller.

This series ensures that the SOM device tree only describes hardware
that is actually present on the module, while enabling key on-module
features used across multiple designs.

Stefano Radaelli (6):
  arm64: dts: imx8mp-var-som: Remove USDHC2 controller and related
    signals
  arm64: dts: imx8mp-var-som: Remove PCA9534 GPIO expander
  arm64: dts: imx8mp-var-som: Remove UART2 console
  arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
  arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
  arm64: dts: imx8mp-var-som: Add support for ADS7846 touchscreen

 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 332 +++++++++++-------
 1 file changed, 211 insertions(+), 121 deletions(-)


base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
-- 
2.47.3

