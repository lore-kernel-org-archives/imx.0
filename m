Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02CF31691C
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 10:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215570; cv=fail; b=BCm7M6uXp6zQ5gtgsYZohqTX2n1JkpvzVWLQGSOOKTlE6GRO7NBhzLgmv4mHaDTDZXR9u7CA9cVe7oiiND4QiWVetSImVONUcOW98S3NcI5PQeXER4zaJlsnGnLDOsGnlizJZMo52egV6KhD4vq+Nis52jYa/VnqPIMimhjhKU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215570; c=relaxed/simple;
	bh=b7+1GrwfETqMyN0uGLoTTxZpc+/32Bq2IcucCZQqvDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q/6Pfb+CeXG8sTd9ZHONi5J/qkT3WYCukkEvtFldgKiR1Yqzw2aLizK8sAQL3rVEGPBtBcHEmZzn2luGcUs2kmC17MnJjlPlzPbNLoYfrIG1O4S+ocBJR/p85ZjGjWWXOYW2LXY3g43VrQn/Rb/XXRdgjH97ZtOZsrWykr9Qi+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kvw0G1Rw; arc=fail smtp.client-ip=52.101.69.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kvw0G1Rw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prqSR6regcLGluGKS9z/BtmAyg7OnvfCvxDZ6Z6wfhmAlazKNfqODDreUjI1DKQaeZYVtV17WqUm1aBAwwUeJ6WgVpCkvTAlxtcTkBVStgI+huf/Y8GlpLBAi6Kd88B4CIKUwEp4m5LPO9BesnWFgP2vSd23ayWH3NGeaFwX5ZcaUO7Ub8aXzRSE5c8xVif3hFWlNsVmIObu12khfHIJ3U8kys+3rthTakTXdud/UWIa5ONqz0OtV2DRxvIcyk/qfghb5XA6qsQ51CRkapOyJ3iA3g0gq/VrA8/HMWPhQkU1cTHg/oJzUnoTffkaLNh0VnoxQ7P5yYn+QrxC3SMftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aa5v9RCeX5gHVCfH5bN87TaRxORBjug0gy3Jp6/WlkQ=;
 b=vw08gTV2QxtNDs9xbfRlzHhID57P5FDMCQMyHEiLnInTmyxCKnPPYDgkL14SRat4X8Y/ONljz3PHk2+HRlG2KX6pFqu9EQf5+egsVDR5LmE5HK1AHkKT37xmRLCUdeXnN0Njgcyl98uohTqwS7HRtl0vpVHQJfSkDNwoUD80SO9+5xLdm94rJqknpjw+NOn3KW8GTVmfu8y+IfCW19MzAGz1RaSxl8e+sR/HIKA+i0fvdarDdzaLAe34siW8W26Zcei/jbqbc4nif9bqIRA3IPwwBbr8tSfeDVpI4Kt59dgBsBdwawgG7h5ntjOcs3Q4KdCVUA7kHRROA0+UZFlrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aa5v9RCeX5gHVCfH5bN87TaRxORBjug0gy3Jp6/WlkQ=;
 b=kvw0G1RwZJ+5mmkwuVXvDgQchL8mNWoHGSQ+iImNZWPaOWnZZoNOZcP72Elsc3Fxs+VUIUVGAdLUGQ9ByoKVZnUsNov79ABtfVkkw7FgT1bTvTH6tVeUTxGa8oN9v99NpTh6tBxHhv3ODlhdV0xfg4G3ephVP1v15bh7rrM4lpzLpyiU0fbjbseO4huAcXT3J1s1TEPrBUi5xTQ3opdqBqisUSiAFX530a2gEuUVKL9mq7uRQiT+zwNUW2024cES2JbsrFKi2fEA0HlMnPTuYp3lRBKv6TqUh84oFXChkw9k+bB3ViLJitTKkQwDzWVni54MKBgqaUvT2kDLXcAckw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB11634.eurprd04.prod.outlook.com (2603:10a6:150:2cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 10:59:25 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 10:59:25 +0000
Date: Mon, 12 Jan 2026 18:52:10 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <q5h62kleg6uqzbnde3qsrjokhtiorrubatrkf5dopj3q7bhtwm@scv2qudg7feh>
References: <20251224111716.2925597-1-xu.yang_2@nxp.com>
 <9870fd41-bafb-4ab0-91ff-8fcea53ca0a9@lunn.ch>
 <7bbvfiy5wceantklz6lav5rwak53yhasfvzddtsirqorcylrf6@rbcrocqftznj>
 <0b61c962-9aa1-4275-a40a-220f6d7f1210@lunn.ch>
 <6j2yhzqt6x3k55vrqjrol2k2qrhqmobvwjedkujyet4loyajxa@vy55aajfuvxk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6j2yhzqt6x3k55vrqjrol2k2qrhqmobvwjedkujyet4loyajxa@vy55aajfuvxk>
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB11634:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f10855a-ccea-434f-8c6c-08de51c9a5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blA0aE5rY0tyeHhqNEhadEZuQ1piNytOOGVRdlFMdjVKd0ovclZNaDdnQjV3?=
 =?utf-8?B?S0pjNjVDZUhrbnhXUnVjdTlHY2dNZzAwQXBQNFUzNHdDOFlzb0FERlRCNDB0?=
 =?utf-8?B?RzhhLytaZzJ6TGdSSHQwR3RmTC83a25TUGF1c1pOTngrRTl3b0ZEYm1HS081?=
 =?utf-8?B?YWpUb2dUS0sxYm85eGpqKzY0bDNTRDVHMlBPRUdHbWxsbDRYZUh2ejVvMU50?=
 =?utf-8?B?ZzZMeTk2bDBEelY3a2RCVldaYVFTU1dnY1U1QXdJWEo1amtJY1JXdFBxMFRS?=
 =?utf-8?B?aS9KSXl3a2xPTW9ONTJnTmd5eG1UdG1rcGpLVzNuSWd2Vzk4bmROR3g5QUR3?=
 =?utf-8?B?UnV6VXpPNWt5ZWRhSGVVeURDRzFoeUtrVExEVUJPMzJ0T3krMnVRVnliS1I0?=
 =?utf-8?B?K2JWWHNjajNQbWhsbWM5ejBvMEdPREUwQnZsR1hnSVRkb3lFb3ZyVjRVT1RQ?=
 =?utf-8?B?TFROcEdvYkJacFVvT2ZFbzZyZGR0UXgrNHVVQWlkVk9Ob0NrRXJ5SDFRamlK?=
 =?utf-8?B?eU10Qi9LampaTVBYTGYvQWJwUUZLYUdXNlkxNStmVzJzRVN1Z0JzclRXdWt2?=
 =?utf-8?B?TWNhYkxDeEhOaU1oZno1SWdkZFNqWFZ6MkQ5NmhtK0srQXVic1BBLzlkYVI1?=
 =?utf-8?B?b2JGSUxmQWVhTEswRFB1WWJJZ24wTnBSd1VXaUNDYmp0dHFIZldTRmVXVVFt?=
 =?utf-8?B?MlhhSjJaK2JXVVo3YkZzSHNyVVd3bDlOdCtUVTVoVXpWQ24zaHNTUVd6dTl6?=
 =?utf-8?B?QS9WYnlKNGRvekhkUTZJajh5QXZJYWN2R1U2RVd4eHlPL1RzLzFnVENFdFBr?=
 =?utf-8?B?d0FNK3BuUHpBN0dITmpBc0x6b3BIKzd5S1YvQjhweFBBZHFEdEVMK0IyY1Ri?=
 =?utf-8?B?WWVCR3NtK2RiRG1DQWpjZ0hSdTBFWlJPbVRUc1U1UkpqQ2pucXY2QnR0MkR4?=
 =?utf-8?B?YittKzFndzVWNll1RHpqUi9qOSs4eFA5U3ZDRXlHSmlubXhSeFc3OU1QVTZV?=
 =?utf-8?B?WVNhVUY0OTZzNUJ1WmpNbHF2dXI2amptODdHeEdXdlY5T0Q5TmdSQnpRUmo4?=
 =?utf-8?B?SVRQbVB0SEJ0SVI5ZEVZRUVOanU4Nm9BUFVDdUJLaUwrUGVNTitiOUFXQmpI?=
 =?utf-8?B?MXFiS2kzZkt4RW14NHhFeUVqM28reUs5WWo3WXNReFAzMnhSY0ZWMVp2MVlh?=
 =?utf-8?B?TTNvdGNCMURkSTJtcUg1c2YxUFZiWVJQNXpJNzY3VmJybnBxQVZMZERKZGxR?=
 =?utf-8?B?VkRLRjY4UVJ6aUFOWjBmR3NTSG1sTWplVXZ4OW1aeTFHUi9yK0FHbVJ3ekJB?=
 =?utf-8?B?aFpDbTlLNGVtcnRsUUZSK1JMSkJCaWpWUjJzRUdaUmJnYngzSy9uZzgyVEFS?=
 =?utf-8?B?aFlJcVZKbzFXekw0a2kxR1drZDVrMjBRTVpTdTFYNmJtWHJTUWRlL3VTMGVh?=
 =?utf-8?B?K25WQTU5S3hDVE1iUXpjTGdxUktCempOcU9PM0tBOGFxVEJ3RE0wK0M4dHkw?=
 =?utf-8?B?Wi9heGxlMkxuaTJrNEVGeEtpRSs0ZjZsakUvckVoL1ppanREam90TGNVQUxM?=
 =?utf-8?B?T2N0VStyREVLSzQwaGVRazVMRmlUMkVBS0F3eVNNb2lVODlYU25GelVqbytI?=
 =?utf-8?B?M0ZORGl0QXNFOElFSTdhVjNQUXUwdjZVWFUvaTcxcEhkOURNV2dmTkY3Wm9G?=
 =?utf-8?B?K1BEdHYxQmVXV3NRQVZ3Q1dEYTB1YzEwaEtOZlV3cXE0amNaQ2I4ZmpFa21I?=
 =?utf-8?B?U0lYTUgrNEkrN05MWjlzejdaTThEb25mNmtRNU9hN09LU09hcThNUUlESkF3?=
 =?utf-8?B?dTZCaDNnTEx5R05WSUY0VzFGeUVVUk50eFkveXZLajNUOVJOL0p4WXNvZWQ4?=
 =?utf-8?B?bEFSZzZFVk5kWlpKUTR1QWV4QUVuTlJmcFNraVFnamtHY1RoS1RKSVd4dGVJ?=
 =?utf-8?B?dUMwd1FYcEVmV2VHWjNLYmlqV2JWTUdJOVVPc2hyNGFNQ1dzM2NSbVNqMFBp?=
 =?utf-8?B?bnZiM2gyQTZIdWhER0swZW11OWE3WEd2dkRHdXhUWGNncG1hRGhyWXFUeW8y?=
 =?utf-8?Q?EZqD8U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTg2RVJzekZSb1lQZWtQRWJNZUEwZG5Fczg1WkRBem1KVGhjdGpGWEduY2l3?=
 =?utf-8?B?dFAyZlNGcVVaOGhTMWw5R3QyQllZSkI1WlhCdnZyekM4c3p2TFBKL2hvY1Nv?=
 =?utf-8?B?OEVBbjhCWUdYR0tYWWFzOWRVckVKODRQSWw4UW5pMU5Qa0xiQTdoc0loazZJ?=
 =?utf-8?B?SEVCWDd6OEJ0VS9EZ05wRnp6NThIYmNwYWkyOGorendONGxmY1hNNnFHeXkx?=
 =?utf-8?B?RXJmTGIvS0J2aDFwY0xBdVp0Zzg3b2Yva2lJTVV6cXkwL3pIek5IdkRRK0Zu?=
 =?utf-8?B?SEpaUFVERVFWZmhGOTR0eThyVlB0YU03TWE0YSthK1NtbDMrSHVQRldvb3FM?=
 =?utf-8?B?MW1kdUNxRGM4aG5WNkxvYy9na3paS2oydElndURMbkNzeXJSMWp3TWV5Y2ha?=
 =?utf-8?B?N2tYcXpwbTlrV00xUkQ4ZlFETGFWTDIrOU0yczhtSmI1WTUvNkVQV3dHUFpZ?=
 =?utf-8?B?cTE2SGxXaHY1L1ppeUdOeU1jeWtpa2ZEOFRJbnpFTVh0SjI2Tm5wb015M2Zy?=
 =?utf-8?B?TWZXV0k4cFVJa0ozUmloUkYwR0VLM0lkVkpVbzJ3K0crN0VORzM5UUJXajRP?=
 =?utf-8?B?ZitPYjZLTzJrQUs5SnFMeDhxbFo2RjdKLzduS3ZpTHNBU0daOWtUL1NJMTFz?=
 =?utf-8?B?cmtDdUd6ZG1KSGtTTmxYNkVvNHN6bWFRMk5tZ3F6WlNCNUtvNmZRODQwSXRR?=
 =?utf-8?B?SFRiODZSSnVubXJ6VXF3eVNRcFJsRUJuOHE4VExveFhSN0g4aDV3S3VGVlRP?=
 =?utf-8?B?TGtRN2xreDJqUmtlVEsrVlZjWS8xcDV2VUd3di9Fdmw1blFCNmVYdS9qRVZo?=
 =?utf-8?B?d1hlais4ZWdXdHRvVnJ6WlJ3b1hEbVVvcFdoemVlVVg3dGhRd0V0L1lxQnNp?=
 =?utf-8?B?WXozeTU3eGFYekxvQ21mUHVQOW5halhVL1k0bCtMancvOFdmSTJaQzZ6aGVj?=
 =?utf-8?B?UmwxSFhETW9CbjJGZThrOWgzUHNIK3FmMk9QZy9jaWtBMy9ZR3Q1NXJOTG1H?=
 =?utf-8?B?SkkvbUsrZnhZRUZmSGdqNzB1VjFkaENQYkJJVkJXTDlYUWpSTjd6b3lpV255?=
 =?utf-8?B?aW4xV2ZidXdZUnlCZGg3SWhTb2ZkMGEweXlDZmJSOHBFUXVPUWVOTnhrQzQy?=
 =?utf-8?B?TmlmOFdLWVhIU3d6ZjNqNWdNU1VZd2F5eGhQWnpoTUtsMzdXeVBRRDJvb0tX?=
 =?utf-8?B?c1pPOEszRmhXS3FHUWpIcUZXN3BhTUNTVHlvN3YzdGdsRVJOVkg2bmFzSlli?=
 =?utf-8?B?UUtZRndXUnF5QnhnenVMY0Z0WTBNRnl6YjBKc0x1UGNPNnl2QjUwdjZVL21v?=
 =?utf-8?B?bTJoSDI1TUV0YTRiWkhWL3doTjJ6cVE4YVFRdVowWGwrdVVteUxsUVNYTjB4?=
 =?utf-8?B?SFV4eng1MFJDTzB1a2VaNFd6QmJWRVdHNkh4eERTQTlxRnErb0FGaE9tRFNi?=
 =?utf-8?B?aWZRZjY2YnI1NzFkZFZYUmZIaHBQamYreGpQZ3paeEJ1MFZZVWx2ZXpzenA1?=
 =?utf-8?B?N3AxK2pKNndCK3BoNzRHdVRFYkk5RUs5aGVYM3ZpY2NCa3VJek8reVd6bS9q?=
 =?utf-8?B?V25sOVB5SHZpTFRDOXhCK3FVaElRSytDdWwrbXMvMldMMHNtNzlnZlN6czZi?=
 =?utf-8?B?RnlmT1dwU2VLZFJzZjlvbkdUalBSWUxtSmlDcVhVK3ZNMGQyNUM3a1VySUR4?=
 =?utf-8?B?MnhHSnFMa3dSUHBPb3YzTDZselc1Z2loSmQxSjh6Q2FpQStSR3UrRmdoQ0p6?=
 =?utf-8?B?Qy9TVVk1UDNDWWVBNjBPZ2l4K3NUSW9laUQvcExyOE82M2c5d0xhYU10S29M?=
 =?utf-8?B?bW9STlhVQ2xPUXJuZExGdHAzVWtDWjZRc1I0MG54SGo2K1dXRnpXZEZVRE9U?=
 =?utf-8?B?bFFLYlJrcysrN240em5RY1hLR2JnejR6UXA0YWNwalZIYzlLZFJWY1BCYjlB?=
 =?utf-8?B?WXJvd2RiOUVZQ1RHZ09WR2JtN0VNWW4wRjRPSHM1N0xiTjQrM3NicDJSb09q?=
 =?utf-8?B?TkhiZVVjVys5cjRJcWZ4YUVXUkUyS1JBbXM0QUFBNTRNb1JXSklNUHhKWlBr?=
 =?utf-8?B?YktIdTN5SlJJRk40Rk43NWFQSHRwRDR2WDNYdk5GN1JBdlJWbmpucEE0TXd1?=
 =?utf-8?B?VzVSY3FYVkFRbWVBYm1RNnRWOXY1UXhDVHZpaUVRUUFieXpzbHlBMmZ2b0w4?=
 =?utf-8?B?ZS9EMitpM2dwR3pNSktoMWJBNjM3bDJzOGNkYkh3VFhKeGNjRm9OWnhzY2Yv?=
 =?utf-8?B?L2ZNNG9GTHYvcmoxRXhQUitMemlDRTUwd0ltYVdGd2VFWjA5T1M2aFNHZ0J4?=
 =?utf-8?B?RnpBclNXMHE5VWgrVy9wcDNoQjJZNFZlVlRIRVlCbzVMQmp5TCtIQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f10855a-ccea-434f-8c6c-08de51c9a5fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 10:59:25.0988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Go7HHtSVNGCdKEr2+zvRFoq7QojOqSQ44Dl1uzdIWSK+MOdgfN1d6ASQ3+YzcAfMLk4f+5/6TmNGbW9+9QnRSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11634

On Mon, Jan 12, 2026 at 06:35:39PM +0800, Xu Yang wrote:
> On Thu, Jan 08, 2026 at 03:47:17PM +0100, Andrew Lunn wrote:
> > On Thu, Jan 08, 2026 at 04:22:24PM +0800, Xu Yang wrote:
> > > On Wed, Dec 24, 2025 at 02:51:11PM +0100, Andrew Lunn wrote:
> > > > On Wed, Dec 24, 2025 at 07:17:16PM +0800, Xu Yang wrote:
> > > > > The CR port is a simple 16-bit data/address parallel port that is
> > > > > provided for on-chip access to the control registers inside the
> > > > > USB 3.0 femtoPHY. While access to these registers is not required
> > > > > for normal PHY operation, this interface enables you to access
> > > > > some of the PHY’s diagnostic features during normal operation or
> > > > > to override some basic PHY control signals.
> > > > > 
> > > > > 3 debugfs files are created to read and write control registers,
> > > > > all use hexadecimal format:
> > > > > ctrl_reg_base: the register offset to write, or the start offset
> > > > >                to read.
> > > > > ctrl_reg_count: how many continuous registers to be read.
> > > > > ctrl_reg_value: read to show the continuous registers value from
> > > > >                 the offset in ctrl_reg_base, to ctrl_reg_base
> > > > >                 + ctrl_reg_count - 1, one line for one register.
> > > > >                 when write, override the register at ctrl_reg_base,
> > > > >                 one time can only change one 16bits register.
> > > > 
> > > > Are the registers openly documented somewhere? Could you include a
> > > > link in the commit message.
> > > 
> > > We integrate a SNPS PHY in Soc. So the registers are documented
> > > in SNPS doc. Anyway, I can add a link for reference.
> > 
> > Humm, so the registers are defined by a Synopsys databook?
> > 
> > Shouldn't this patch be split into two? The access mechanism to the
> > registers is specific to the imx8mq. But the registers themselves
> > should be part of the generic SNPS PHY driver which should be shared
> > by all devices using this licensed IP?
> 
> This patch mainly contain the access mechanism on i.MX Soc, so:
>  - imx8mq_phy_ctrl_reg_addr()
>  - imx8mq_phy_ctrl_reg_read()
>  - imx8mq_phy_ctrl_reg_write()
> 
> and debugfs function to show them:
>  - ctrl_reg_value_show()
>  - ctrl_reg_value_write()
> 
> Do you mean split above into 2 patches? Put the first part into
> phy-fsl-imx8mq-usb.c and the second part into a SNPS generic driver?
> 
> If so, do you know which generic driver should I use? If no such
> driver, can I put them in phy-fsl-imx8mq-usb.c at the beginning?

Just found the access mechanism part is also described in SNPS databoot.
So the whole thing should be the part of the generic SNPS PHY.

Thanks,
Xu Yang
