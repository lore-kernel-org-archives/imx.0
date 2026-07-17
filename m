Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011030.outbound.protection.outlook.com [40.107.130.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9B442D779
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 15:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784301455; cv=fail; b=NOy7s5u1Is7CzDqfPbFnsukVc4jywgDb5UnnBeySIEvOR5Ykhnl7FdA21seZWSAs+b0z8UL8H/qkoNWgN/0QsHHawKmxCfse1b86+hGT0OA6R41tpfoZ7B3wF+2PZ26Sv/yPIMrRMWFZjWz9qYqll69tCj2FggxxUE4jBol83ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784301455; c=relaxed/simple;
	bh=2HgQ8tfVwGAQidBv7ilOYkVRuFtrjTydnLVNVOM6QdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FX0YDSF/xTJ8WI0xJs614Q/IJM7ugFJEBMG2HlRn/KI/jzXLSjfRARDnsi5y8ubv8F12nhxim46GBY/gb3csmL+A/t/TyO/EZSUVa2Eg5oVzoKDXujXfC30WSdYuIQs0Ck4D+tYIdFuHoYglzLJbCDhbuVnJK4zMgKRMUHIUwec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pmK8xLIB; arc=fail smtp.client-ip=40.107.130.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pmK8xLIB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvqRrrsLeKps25tszwCnxCr1nsUgp3BLgBqxXY/sFArK6OeDIHDZaDI3+LvO0HNtlDl0CMzV3GKlYRYmxqDWhTjh4R64yiUSern/6HY3EOOnl9q13nfs8/AHIZow9BBSGGg7KQe8g+kMn2bc2BrSGDvUwyeOSPJEBm8Uzt14UuHfCXb0Bdiuaql7fqOugCP/3nUU5VUm9jq/MP6eYiQhaOt4yMOOUo5PE8DtGIPQw51mR+ybGhiDl9U5FoaYGl8gsVofn9/VaMG8EOfKpio2a5wDchTRqqS0Cvrzu5EoMuceExJOQ5zzXIYhDfquaLuXoImYy37mwdhIfkh/p/jIrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5+QwYymGVI2D6DWeugMkEnRrkVBITrzmJURdHYhuRk=;
 b=V5JSbPm4ucWH691hNFISp4MBGy5l36ntxKcVI5+EPA3Sh2RRK06OP6xAKGo7wif7iZQbVbpOTvy7uvbAudKZ78/u/5PF2pQlKtZzVQCOnDtN/ZnJuYXjlgUhx53Md8vhazahO9Gf/mWOyu5UebETP0q0ZRMO18Oc0PJbf76Uk3n5dcQPT4SkNAYcV1U+bL9kNrliqb1lrXUFsvE/3wARzd43an5yL1TKU/5VXg/XoUhzoniVyeBdSIw10/C158XjuP0Ry1NMxpxstamZZ336SNaj8eUBGc770bcSGQEomgGd+MrWCAIT+qZ/ub0CgcYiRl+BnH+iRa76wbTiz0Ft+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5+QwYymGVI2D6DWeugMkEnRrkVBITrzmJURdHYhuRk=;
 b=pmK8xLIBoCiMULtz1OZJLkUrYrW+WGGXTUUWBJBl1UcQEvP4wbXfc/ELDoBCI54h1R/8pnq/SWzJCET9Jak9DfvsfY459LtIYkrF7f7oVYhtPqBu4UP4alejKVG6FpR98rGfwOAh7nBGefEHrpHfcBH42V8g4Q9oqu6dPObukCccWaArRPqVDlSNv2MWbrPKMZC3sBHSLt2+FH0hsPqes2aCWMNyyIym6yKbN7d7fhZkw3CYg16qJH+AUs7QntcIvwj9+s4XAP0mxqtNHn9nqcBNAuELu9Dccu6N/4tXOy4I/WUoOZJlbRjgD9KpV3gGyMErAc3JgP1CjZir+mzwQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PR3PR04MB7484.eurprd04.prod.outlook.com (2603:10a6:102:8d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 15:17:30 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 15:17:30 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 00/15] arm64: dts: freescale: imx8mn-var-som: Align SOM and Symphony DTSs
Date: Fri, 17 Jul 2026 11:17:21 -0400
Message-ID: <178430141528.572101.4937363620489388293.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR22CA0008.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PR3PR04MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a1f6bce-a30e-4cce-01bc-08dee41684b6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|7416014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 UGmWzsU1oTHywJn9LeHRAKYR4Ap4Emr6w/O0HHNX/HEwAUpVtlvRJKO+LeVF9XNfmcm5io3vhCAuksyJYORsL7rFZbqLGdS0iJenZKN0RUWiCOWC/dXE9hobWMAZ6IASHXzgjrqB3N+5UOAXu0JKMrsn6wzxn/rtjkUFZVid7X4LNy9pqwe7iKur+EWDg5NA30jNiEz8WuANCQZR6c77Z/Bfjd6xzcXoSPGFBdEG2Z8cvJpAtjYZhGCZQ95YQ6dniDi9oZ34pHK5Aebs2Euioht+AbgaBX426Dva2xnrPaiwljPHo/8CIKSGPwAG1QgWuHMR+eB6Daxas3uKgizsUhZHV2KlK/+nBqyq9hq2VYQirp21pijuP3SP3cl7S/Isaj/4ieSyYoZEAqCP8qwcx4eDind1fYY1VXB55fHXwH7Qv1pF2rlSuqCGfBP2SkBjKGN+kWSMPGoxWfHWJzEE1c32t91wHnCqBtgF6Qn6W8edM2zx68YTda+FGCKcJaSzk3MKrglGSR+JwjGt5grC+MgHJwJyxZMLqiETOmbmN6zwfznuFWrKja7FtVJH9U52JN2vqnlRB3XE/sZ7M+18V66HVgYyVWp2rl7OX9zVjc3N+N5GEKCHqrnvYFHz1nVc1QXq0EaWWJgFppygIyavGVWKvjHNDRs8qtWbIhkGMkQ=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(7416014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UXlCTm0zL25mYU8zakJaSGcrVnJqSnYxN1NXbFg1azQ4MGNjbDZ2L1M0Z3V2?=
 =?utf-8?B?VjV1NWNlNlRGRnl5NERaRG5jYVE4M1pjZmtiYm9CM1plUWtTdTJ3Q1RUWHZC?=
 =?utf-8?B?bFIxcWpPVm45SlJubms1S0gyeVhmSGQvU2hVZlcyUkNHR094SUJsaVI1YXB5?=
 =?utf-8?B?bk40Y3hMR2hQNGlqdTlGYkJHcDRRNVg0c2ZiWW12QWk3ZHE0U0tIYkw3UjVI?=
 =?utf-8?B?Y3ZKQ2xNTnVMQjZEUXMvQkUvSnIvVWZIZVZacnhEdzVtY0ljMHdEZU9WR0Vt?=
 =?utf-8?B?aUJwci90QVZPMmpiRW1HRlZuWGExbFhORlpKeDlzZENoUUthMm1ZRHRzdGtV?=
 =?utf-8?B?Y1hubkJZODVBVXo2bG1vTndIQnpYOVdRTFFXNmtFWE5RVjB3WFg5d1Bad01y?=
 =?utf-8?B?cUp4TlBobnFHQ3JEN1ZTK1hqL3Fvd3paa1lTSllobi9iSU9oay9hQ21RS2pr?=
 =?utf-8?B?VW9sZXpDaXhwK01Kc2k2LzBrMzhOa0JNTW5SSWY0L01sVEM4Nmx3bDFhWWNZ?=
 =?utf-8?B?ZzVaTmN0QWtjNSs3Z3RnWnIyRkY5T2JpMHZGYm9GVExiS3h2TFF4aUFnT1lj?=
 =?utf-8?B?UUh5Ukl0ZkRCZGMyYzU3Skp6TitQSWVGNWhzS0xta05OOHk3Sk1YZVZleFlD?=
 =?utf-8?B?amVNVXdyb2NBaFRKUk01Z1hGTVZMOWlaYlhJbHc3ZHB0clVxOWs1VHVsZUZt?=
 =?utf-8?B?Q2JwbGZGVU9STXBPTGMrQXhlajJFUUxWWHZWUU1mSG1VNHIvNnhqUzd2ZmZa?=
 =?utf-8?B?Q2VURjhycWhzakRtVnZZRHh3NS9TNXcyMkE3VWRUd0t6dFRNeVdRbDlsdnRo?=
 =?utf-8?B?bUJWL285QkMzSXh2UnRDOHgrTUVuVDVxTkJDUW0wQktOcis2OFpnOEpPY2F2?=
 =?utf-8?B?R0tKMXd1Q1dTei91QVNkWnVRa05lTU9yN1hBZVR4VFptb2ZRdUZHdmU3SVVN?=
 =?utf-8?B?dGtkMUtrZzZpQ0RkOVRmYjBLdkY5UURjTVdiMTJxNk9rbXdhc2xNbldRblBw?=
 =?utf-8?B?blc3SlRXWVpsOGY0UEJNazJ4Z2EySmZlOHdCUExwK3NNN0w5ZEZKZGVkc0hO?=
 =?utf-8?B?M05OcUp5ZGdYaEZKWS9IaGlqSGNhLzA2dmJTanMxWG8xdG5hampMdFV1Wlh3?=
 =?utf-8?B?d05OYWZvSEFWT1N4VEJYbDY1WWd2a1I3anlpN29yb1FMM1BqdkxxZFM1eTZO?=
 =?utf-8?B?cnNNRXoxcUhqd2RqR010SkhmempSTHNZUXZsS0dXUTZIeHV6RWk1LzdXWkxD?=
 =?utf-8?B?OHdLRWxxR1VVbnp3Yjh4WVhIWGt2Y2ZXcEdyNXd0dVZROWNkSjFTT2drRDFX?=
 =?utf-8?B?UnNKM1BjSlVsaCsySVRVc1lNWVZtcXRUSHJWeUZETkUrZkthVDdCQ3MvZTFr?=
 =?utf-8?B?cndyRWFvTjhmMERJMmVSK2xCVzJaYkJoYXRoRGU1RGRYeHYrcDE4VzhFRnZm?=
 =?utf-8?B?V0d3bnRxZGV1QU1FZVhXdG5KMGsrOUhHMSs4Mk9COWE4aWdLcURKbCticko5?=
 =?utf-8?B?VytpQXFXWWRCcmFjaDFvSnZ1YVZMZENiTE51bkdIWkUxZ2krQjZMdWFBOXRZ?=
 =?utf-8?B?ckoyUHZMdUt6VEdLQkw4ZDhzaGdQNWVLN1hJTEExTWhCaGhWdUEyY2pBaVl2?=
 =?utf-8?B?dkxadnBWeHd6bmJYOE9Ua1ROYm9vNkgzUjR3TzFhMmtIUlpSOERzWXYzZUM1?=
 =?utf-8?B?bStyT1Z2R1J6VjQ5WnNGQW8veml3UEp5WmZqYnJxR20xNUlPbWd4UEVCT2lU?=
 =?utf-8?B?WDdNYXlNWWJia3NpTmhiYUs2RDNtcFYwSjg1alkzbEczSU1mR2FCQ1lBSHdZ?=
 =?utf-8?B?MW9zdy8vSWFOUmZOaEFOV3RoMWc1L25XTTlVR1B1ZzVIeDIvV1BDcjdOYk1y?=
 =?utf-8?B?SktoWHRGSnpoNGREcFcrVjkzTXltN0ZOdTVNNk14WGhhL0RQMzltczBCVFZV?=
 =?utf-8?B?SnhiZDhHT2RrN0R0Y3RhTWJrbytDbm5vZW5GeFdTSjBndGdIV3AwWnB5WTFx?=
 =?utf-8?B?cy9icUJPUnBjN1RZdzVlU3FQc01HS3U5dFQ3UUhocVYyVG1jWTJaSWpjYm05?=
 =?utf-8?B?Y0FXQkpGZUhCaG9ucjJVZ0FObWVKUlVhWWVPb1A2Zk9oYXVlS0t2QkZUcFN6?=
 =?utf-8?B?Y2tVUHlGK3NJenk3NzZQUXhNeE84MG1rMTdkNmx4K3ZQMzhsN2pZQVpwWEdx?=
 =?utf-8?B?UFMwUk9QV2toN2ZOTU80K2hoNEtGWVZ0MW43bWRzc20xeVIyRHdYNnc1YjVp?=
 =?utf-8?B?T2J1cU1OelR5SU92ck5BUllEQjVubmdSVmZXM0duNG42Y0RjWWFaRlg0cWw3?=
 =?utf-8?B?amJETWJJVUcyZkxSazVMbk9pc2NibVVSVjJMamNkODVQM2xzVElaTGwyWHJI?=
 =?utf-8?Q?BmArNgN0USi7U6hzBnwUF7rMOnJikMfohToxk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1f6bce-a30e-4cce-01bc-08dee41684b6
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 15:17:30.2396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWrj0jnMjW+Ww7W3BRqHB2Ij2XYZ31paZlVvWky2v9IWdAyjzC1PoI97L7lZ0JsCcR5i0aCJ5XLmR7LsHieHHO0sbJuCFkPMJb5nlu17jhwzR8WSTfF+4/qiM0Jb+lA/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7484

From: Frank Li <Frank.Li@nxp.com>


On Mon, 06 Jul 2026 11:34:30 +0200, Stefano Radaelli wrote:
> This series aligns the i.MX8MN VAR-SOM and VAR-SOM Symphony device
> trees with the latest hardware revisions.
> 
> As the i.MX8MN device tree hierarchy closely mirrors the i.MX8MM one,
> this series applies the same alignment already accepted for the i.MX8MM
> platform, ensuring a consistent hardware description across both
> families.
> 
> [...]

Applied, thanks!

[01/15] arm64: dts: freescale: imx8mn-var-som: Move UART4 description to Symphony
        commit: 259bd77e9f635e058c045a880427570e534c8737
[02/15] arm64: dts: freescale: imx8mn-var-som: move uSD support to carrier boards
        commit: bc5217a4e354ebe0a2f52d2188ef952fd630defc
[03/15] arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
        commit: 763a267bc2ccf637bd0f35492ca1e6ab6c9dc13b
[04/15] arm64: dts: freescale: imx8mn-var-som: Update FEC support with MaxLinear PHY
        commit: a6c8d4f9c2db6254681d78ec93f5bd944a0cf89d
[05/15] arm64: dts: freescale: imx8mn-var-som: Add support for WM8904 audio codec
        commit: ed99c5c5c5e88f31ed8de6eff9c3da2ca188d947
[06/15] arm64: dts: freescale: imx8mn-var-som: Add MCP251xFD CAN controller
        commit: 42a066c24cc673b4317acb382597c0a3230b9f6f
[07/15] arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy dts
        commit: 040bf14c102570fee953fc2124737a988c3fb6a6
[08/15] arm64: dts: freescale: imx8mn-var-som: drop duplicate USB OTG node
        commit: 0504e4d12fd3c3b5062b49086ce17a2743c60658
[09/15] arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
        commit: 5580a6278c5ce77a8492d76571929321894934f3
[10/15] arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
        commit: 8576126c7ccf632c8edeeb69f57f17ee5e125de5
[11/15] arm64: dts: imx8mn-var-som-symphony: Enable I2C4
        commit: ab80a67f5cdb42797d0a92d7951242291bb97f3a
[12/15] arm64: dts: imx8mn-var-som-symphony: add wakeup sources
        commit: e2e47af10c90f4c5eaf415fa98f6ca2f33ef30da
[13/15] arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
        commit: 164cb0d61a3fd0d9376005aae3b112a3dbba2e07
[14/15] arm64: dts: imx8mn-var-som-symphony: enable PWM1
        commit: 8a6c812cd5a721aa0af9b7dd35b43d12c831349e
[15/15] arm64: dts: imx8mn-var-som-symphony: Disable internal RTC
        commit: be578db51f789f0b88ec4f5e5f78e232b42c6b15

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
