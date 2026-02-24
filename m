Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013050.outbound.protection.outlook.com [52.101.83.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02D1330659
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771964601; cv=fail; b=as0rFlQM/kt9kYTbQzXwtW3dijooulHNKFUMzvLqGfK0qi2E6FglgC+YIO6TNzy1EG3vamYOKnIIozPJu8JqHx+PUGTXkWI7bsrkN4xFfHzNeZTf0sriYsivOlyBifJ+qIjtGEDi/Dhwejb837rozsCJyJhOl6XCE4TPY00pbnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771964601; c=relaxed/simple;
	bh=mudZogJZ/ThfZ1mhz7kvP89PYAhTQVLyN9v3Jqwcz7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tODoiNIZpZxUz7sXyxUrXz+OQA97vS/gu83JTA8zLuOKND0aJXFNy8/EvXulP8s78kenukCrIkLUllUML7O/tjeZ7xlfZEUJU5eKmxSHrmSBOLV3qJMf+T/uI1VRWwNWxto7X6Ispl0L9+l8MK5M9zqSntMCOSJLEZdOqAktnhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cZrXz81f; arc=fail smtp.client-ip=52.101.83.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cZrXz81f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XajpipI6QGJ6jqKYYVPWB2Mu54KzoYsp34TghTbDkpHXR9URAqKhmu8qRPBWNo5yXNOBmQBIOl/Y8XQFWOzZ+XoF1fohdqC0Sd8HWMA/IU95qSMS8zzPVqSJ4RBujzM4f0MtDg6fcis/7elvYPRbIIHr1+tQZMYoIbS5MHVxrpbzwRHAFR5bdNhQ67Q65ntIaCbJjnZuJVHoi0Dsk99S10jJtnqxOJnXgmq8tmMufIoZClKTJF04EBYHtuw7l9mV/akQdiLUjPCNeytu7nJPp0iBvMJ/XicaJXHChef/ZAVzAL4d3DGsQYjn8jnceHMshJ7tAEaZHwFLRf2i5zvgBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mw2wh9YC6w7vsSeNATRu58pp4ndu04uuZLNstV7yrCU=;
 b=nD37thi743IKaiba6tsX1+tEscWtV4TmMaIu9OCTydtRg+fxuMDw2YNeHLnSndIkNTtKPt9ns6vwbfUAAkQmM/3VlA5xDqYmFqYgWPrNnXfELDnky/+ZGdf/eSpQ+U8sAJqGM3G/lvHYhP8BHUAQKS1cCqBsqUeg7pCSq8od6B/AVPUACFIFL6NenGzv/lRvuY50MpX7anMgkEEVEmW3rupY0c7L0yLhIhSGJ9tY9fsWxZD16yoJ/LeQ4G/Kt2B1TdgBU3m+fU2fGNWF3SEJmR0BM1xWjE96Thf5chD5R59TTW9Z9bz6fTVKcRPnWj9/SpNtHAd88hVJ7eN9DSxXlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mw2wh9YC6w7vsSeNATRu58pp4ndu04uuZLNstV7yrCU=;
 b=cZrXz81fIGNaXwU4+Ji6ea+FB8uKQtbWPWWP9EseLSvYSBxTM3ELyp61AKuJHgXCMe3CmHihLM65IAgUC1UcqRIBeT71iKzNmr5VKT3qlu9uS9qCXqTQdhGhE7StbhjW3cfuL9Uvgzt1cXmD0i446EVGw7iJDo7c4mg8gZ7YIorVD3U2KIh5j3iCJPcCOMPVlO5rMufN5a5Y+Tno8TRTbfMaaTws4geNQjC1TbbXqY3oYsbJA5NkHdmZbLvm+yLHuyURTXvzdn4He9Mt+HNhVZqmLJs0TwPHTf7rXm0WVmDVM575UwmqrpkLLILmrJQOd2VzCnvV0f2itZWSac24ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB11848.eurprd04.prod.outlook.com (2603:10a6:10:624::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 20:23:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 20:23:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Wig Cheng <onlywig@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com
Subject: Re: [PATCH v4 0/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Tue, 24 Feb 2026 15:22:57 -0500
Message-ID: <177196457168.3287969.5331427645493529154.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129022910.3942028-1-onlywig@gmail.com>
References: <20260129022910.3942028-1-onlywig@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB11848:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f76b0e-6620-49c4-a2cf-08de73e28a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1F5SFhIV1VNNjIzUnBVak1jbUJQTjQybVFZZWVvaTkvL2czWC90bStpNlcy?=
 =?utf-8?B?Z2RHZjh5d3FNS2FuTHpqR0JRRlhNV0JGUS80dFR3T29vcUJIR1hHd2dCQ0NZ?=
 =?utf-8?B?U1gyeEJhaXV0dDFwVWxOVHlnTWRGMFVrdjJKZ2tLbnNHc2owbVFtRG84cFZ6?=
 =?utf-8?B?Y2RVZndUc0RuZXRNcWhNMUExOElrNllZalNQTUpBNG1qZ2VqeWlYOWpsU2M4?=
 =?utf-8?B?a0JjUUh6RU9LelFwYjB4U3VBdVBYUGhiZmNDV0VneU9taVZ5M3BzaE5uQnZz?=
 =?utf-8?B?TmdOanRsSUthK2syNmtvcnBUM2hSSjd0dTRsaTF3aXJiVVkzaW0wRWhQWmhw?=
 =?utf-8?B?VFBTZy9EKzJCR0FhVGdwOXdiK2p4V0VaS3dMaldYWWVDc2JFOXozdDlDVW9t?=
 =?utf-8?B?MzNxTDRsc2VmNTNxRWlGNGNicE5pWlBXaitOUStRUHgxOVNFQ1ZSUGVGdWVq?=
 =?utf-8?B?bUcrR1gwR2FXNGM1U3RIWXhYM2l4ek4yTUh2LytJdkIrekk4M0lmK1VLWWtR?=
 =?utf-8?B?dTdBVzZ3Ym5qZWtrMEd2VW5aaytmNTI0NmpmcW1wUXAzaFh5V2dmNGs4Wkdt?=
 =?utf-8?B?WXZGZyt2d0tBRHF0NHNWQ0JpT0E4ZjlSR1FvNzAranlIYkRmYTdGZjE1QU9W?=
 =?utf-8?B?MDY0SS81UFpXaVFqS0d3eDBOckNWTEcyWXRxQ2ZBUFJGQU9FdC92MmtiVnAw?=
 =?utf-8?B?Q0pVM0pORzZQb2N0M0JKaE8xQVkzblNtTjVtM0pMZ2d0eGJmQXE0RThPMDZu?=
 =?utf-8?B?MWRiWVFROVJhRk5JVmpHRFdyc1grYzJIV3dEak1QZVdPS0pOcjN2WVpCbmh5?=
 =?utf-8?B?bUNJSjZrQVFySjh2QjgxMW1NeThZUTgxVnNQaHNLVnE4ZDIrQjhaSzNpNGRK?=
 =?utf-8?B?SXBFWld0VXZtRzBQSS91a3gvOWh6M1l2eXlJNFJWZ2tOdkxLaWltUW1IWVo0?=
 =?utf-8?B?UXdTNi9GUVBIKzFGN3JYL2RHSTcvcWdWNE04REdNL2NYU2tNUkR0TUtuemNu?=
 =?utf-8?B?OFBsSUU5THpWanlBbFJ2K3QwNS9WTENnbk8wMm9NVURTYTQ0UUQ4UE56U0lY?=
 =?utf-8?B?UXFjV3pNR3grOTZGd3BESVFmdEpFQ29BSVpZZDhiVVVtb0FjYkJ1Z3RXY3Zv?=
 =?utf-8?B?K1E2V2J3Z21pM1N4TEF5d3ZkL2VtRDVWeS9qdnkrbTEvUm95UUYyMlhzN2Ur?=
 =?utf-8?B?N3Ixak96bS9sWHVhYVFGVHNyemYxQ1ZUUDgxUWFGek5kL0kyK3BJU1NkZG90?=
 =?utf-8?B?VmVCeTBKbUE0Z0RtYlpacHZhZU5RZ3o1U28rdythVHAwY1FZTnhzcWM2UU5t?=
 =?utf-8?B?VXQ3eGNZd09lZkRpTnFYN2Rmb2pURndMOExyMXZ5TWxnWklrejFicGJVbzJK?=
 =?utf-8?B?MTFORG5tVVlHK0VySnI0MHAxSWFES1NHdG50Zk5uM3B5WWxtcTd5b3crNXFU?=
 =?utf-8?B?emNCSXZzWVJPTm1DdDJHekN2VFdxWEtwbVRxUUxyTDZkRDdvbzg1cDNkdTc5?=
 =?utf-8?B?SzZxQkdLenIxaVRpaGVRSERQL29xWVpwdndyMDhHT2tXa2MvNmpuN0NPVUln?=
 =?utf-8?B?ZGVjQVZJSEU3WUs3b05SdnNEengvQnZra1NCdGg5dXVxMkEvTHlBSjJ2R2Iv?=
 =?utf-8?B?WXpPN1JMQTFTSERuV2VScDMyN3VvdncwSlpIRm8zeEhPV1BqVmVac0JkZldN?=
 =?utf-8?B?cG1YeTVaQWZqTStBYzhyZENxK21kMFhpOEY0Y2hyalorSC94MzViYU5yaHh5?=
 =?utf-8?B?ZWhsM2xjQU9RN2F6K1M5MSttR0UvYnNrcDJWODZRNEdVRE5QQ3pjNlBLb2VX?=
 =?utf-8?B?djVwLzJYMU5iWDBtWkNMSXBzaCt1Sk5WYUd5Qlp5SUZweWc0NUVJeXZPbm5i?=
 =?utf-8?B?OXc2Ly9QMkZnSTNaaHFaUmZtSS92NmREcnJpTE4vQVlYZ0VaRWZDL2NBK004?=
 =?utf-8?B?Yyt6amI3alphZXZNaXR2QjdCc251Rk9BNEV0OGVLNGtjZ2sxVTdkZVE4VmNQ?=
 =?utf-8?B?Skx5eVJQOXNCUVpnRXducWRmODl2NWdmcmJYSXVHWEN6WEVsY2pOY1pDaXJ1?=
 =?utf-8?B?OE9vQVIvc1cxMlhNVVQwMXF6cGx1VTl0Wml2RktEc0JkT3krMkQzbkFITU1D?=
 =?utf-8?B?K1h5K095Ti9rUHlaWXpZZ2NxRFUvNHRzblpYOTc3YmJwV1FUNkxyTnNWYTdw?=
 =?utf-8?Q?PebTiE0Z+MAw9YMdt4Y/4jM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUM0VFJPSFFvVmhUTERjK09FUkZOMDZjQU5zdzRuMWdVTG1zRUt3dEtHOXpP?=
 =?utf-8?B?RXhUeEc4NWZTRFZEWWRGMCtWWDB3RzZ6ZzcrbnIyVmJQc1EyL3Y5dEMzbVpM?=
 =?utf-8?B?WDB2R0Y1M3ppZjJCL1JMemcwN0RJN1N4a3ZsZ0grbjR0MWNOVWxqMGxzSnpT?=
 =?utf-8?B?VHBZY2dOdi83Z21BRUVRVU1TK0gzc2FzYTlGQnVSYUhIOWQvajExQlZ0MC9v?=
 =?utf-8?B?UG5nMWRhZm9EM2tTZFBOa3c3NTJ5S1dhMnR3ZlJxcXg2VWpxYUVnZUdXZEJh?=
 =?utf-8?B?dXBMOFhqMDBxNUxMcmFlaTY3ZE9pMm5hTHZreEo0dTd6ckdObmdlSSs4dW1Y?=
 =?utf-8?B?V1BrYnFKNEVZSE9DQmJYM1F2UUlQR1JLOUk4Uk1EemJibEY2bjA3d1BmZG9L?=
 =?utf-8?B?VWNycHZYdEZKdnJ3Y3hUdHgvamlnZjdLTTNqMG9RRDQ4Y084cC9XVG5yNmVI?=
 =?utf-8?B?ZWVUeDVaUkgxT1NuWkJ4MTdRQUtNUllaTVcwaFd3OXhHa05SOVpIb0Q0UVdq?=
 =?utf-8?B?eGpXSnFORUtCRlVYcnBxQTNuTERSOHVKVW1jK0JOeFBkRWQxM0JCYjM0bGJ3?=
 =?utf-8?B?ZGpwdC8vUXRHdFNTMEN2bVZ0elBXVVVIYktwZ3RCZW5FYU0zeCtwdDNLSFlo?=
 =?utf-8?B?cmprK0luREdwdkZPNDYxRmtDQ09mTzlmcytDc1c4ZjJUamVoMWRvSVhoNGZn?=
 =?utf-8?B?dnpmckMwazgzZVRtZHF3YTBIZ00wSUZXU01Ldkl5Tk0zT3c0MnJ6S21QM0pn?=
 =?utf-8?B?UjB5bUp2TTkrKzF0eDMyUTRna0VtK3h4Z01ycEk3UXVNVlJqKzUyUHoycnps?=
 =?utf-8?B?QVFiSWRkcWVpNHpiOGpXU3BQZ2Z5WXBQWTQzVDVEMWZGeHBpZEpCRzRvTHpm?=
 =?utf-8?B?cHg1d2U3djZGNlNSaGRndnk0VHJGbVpzSjF0VjFVSEpyZmVPUEkwK1U3VFdN?=
 =?utf-8?B?emlpWVhtcDNpKzVzMmRRakJDYVZJM080NFNaU096ZVV4OENYNWlRWVFOK0Jt?=
 =?utf-8?B?ME9MVzFDWHVCNlNjZDRRaDkwN0ZYUi9xRU1wNHdHWTcwbGZ2NG1zS0tjNlNa?=
 =?utf-8?B?QmQ5U2F2VHhneUVCSEduV3NyL3dPZjF3L01BSTJFMEVEWHI1SkRwTTFLbDU5?=
 =?utf-8?B?ZTcxUTRidXRSa29PSHlkNFl0RW9qT2dzRVUrMjZwMTdkdDdIZ20rWmg1Nkt1?=
 =?utf-8?B?eU13ZkN3dzVwVjZ3ZjI5RHBVWGpYOVR4UFVRK0tWOCt0UEpzTGJsL1JGaGFS?=
 =?utf-8?B?TnZxbnF4eUNpZmMrVmdzUHYvZ2owRSsxSGlxR0FFTmFjNWp3c2diK1JxWWtU?=
 =?utf-8?B?UUtZSkc1UUFGQi9TdGZIWGlueStPQVpBYTJoTEpuTGdNbVM4Ym92SkhQMFY1?=
 =?utf-8?B?a3JPRWNrU1VWUDY3QlZrTzJUdEFQZXhUN1A0OXA1ZFhPakx2SytyRjFkeUdy?=
 =?utf-8?B?bzFSMGwxVXZ6OEhJUVB6NS8vbVNSTUpKZmpqYWFoaE5oRUFyMTR3eWJYSzhm?=
 =?utf-8?B?VTNFUGRjK1RhODBWWlA2RFdEZFdTVUhDelVMUS9MUGJIVEI2YlJHTDh1RnlQ?=
 =?utf-8?B?WWZXMVIyZ1EvUWdnc3dZclExNXduazN2d0Q2MTRKaElSVHNJTGdHM3lPL3Zl?=
 =?utf-8?B?dkVhcFovRU9VN1NpN29xeFgyQTk1a3Y4ZUMycFY0MERBTGJHeUsyanYyV05O?=
 =?utf-8?B?RWFQdEV0MlB4ZU9VZXVzK0tXSmpOcFdaWGxtT0w4M1BLTmZFQWkxdXQvMHlv?=
 =?utf-8?B?SUJBUTdRcGpQTndXNmhMU3I5aTNkclFKNFhsbTdaVjhQV2lsRjdCbU1xN1FY?=
 =?utf-8?B?Nk1ueVBZRGxkY21MTlJTNjRWQnVNaEc0V0ZUM2VSVldNU1ZhWVROc25tWUhT?=
 =?utf-8?B?bnlOQWNkNGNMdUZadTZnUHB5dFlRZWU4UkVZWTVxaHI5bUVRVDcrTnJjaWxX?=
 =?utf-8?B?Z0h4Y05aTVB4RzZyWmtxYlJhSnB0TWtOK3FpMVpGTnIzNWd5SHJIY1Zpa1ZO?=
 =?utf-8?B?dTExd2poaXQxVitGNUNycTZGKzRpK3VYRWo5VkkyMDljVWRHQlRocU13VUJX?=
 =?utf-8?B?TTlINWp4MDdwOERWbTR1cDducW54NElYNkYzcmFIM1AvaHhBWFJwbm1FeWlY?=
 =?utf-8?B?bzBWVkhBeVgwa1FZTEJlL1NVeVYvWTA5dkd2QjE2NGNVTzRiRFY3ZWVNUzFP?=
 =?utf-8?B?Sm9nM3l3b2w0amNUellSOUdsbW5UZ21CdVp0OVgrSzMwQXF4SURmTlRXMk03?=
 =?utf-8?B?Z0Y0dE9LK1Btb09QaGphMmtCaEg2b0doOHh6ZFhYWjd0WEdFZmwzOTB2M0Yv?=
 =?utf-8?B?MFB6OVJXTEk4ajVqYU90WXNyMVBuOVd5V1pNZFhkYnM4MFRQQlMzZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f76b0e-6620-49c4-a2cf-08de73e28a94
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:23:16.1615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvgQ1grk9iJHIqsqvL3RILJgOpj6+3ImJTY8fYqT9Xnjra0MU5KcZF+YXmeuJDkgDCk7TxCdHkCZ8GjQTjXc1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11848


On Thu, 29 Jan 2026 10:29:09 +0800, Wig Cheng wrote:
> Changes in v4:
> - Drop invalid property
> 
> Changes in v3:
> - Misunderstood reviewer's feedback in v1, improved commit message description
> 
> Changes in v2:
> - Fix Makefile alphabetical ordering
> - Move vendor property before status in device tree
> - Simplify commit message as suggested by reviewer
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>
