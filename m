Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3249B3002DC
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468689; cv=fail; b=bnuSNk0dXPK8j85ugjCWyrP9Fm0zjZotsVUuALbqfyXXpqoJOFRXB+eA0Al5PFkcvjeQ8hxcNSMk5cEaHIIXY/bnSnIno4++d04eAajw1mZypNxYSt4/eLOk5GZ3sCC5igb9/2IxDcPS+LhsZTy2EBlv8Bnq9WwbPOtD9EHSISk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468689; c=relaxed/simple;
	bh=axKYqMh7er/e5+U+qcR4onW/wwu71bYC8PqOG+A/unk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N2NtQzGtu7vK3bnISKlGOz6mvPnMiDJLTo6zY2mX7wgeCYEUckTJTnr/l2fmJLnklVhSw8laro1KlIR464p+I3xay0i2gYU0RpknbKOS9M5cNaFeQ8q0ghjZMg4UW9h2hTTUhX97x4gTkCZtA/6fi+yYcUlUW0Xn78efGzjrlB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mPDY9wtf; arc=fail smtp.client-ip=52.101.66.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mPDY9wtf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jr2rqPMLLAv+GCYA5W5FkUTUE9nznIiHG7w8DNwjJu9ELnEqyPjnuySgo2UmC9ZK/R01DS3kW9eTVf+82G6xpYi9W1XknOnMK5kujhS9rJzLBjp0lpFJHWDOmXAALrXuTMWc2/STJTN7vPB+1PBHA04wqyZP2ORqJEokldFXWutlsdY0soO29pompBhD287nLcpdtbnUxYvlmMg1Qe21xpRt7P4k8zd40xkj/jl+g0i6IhcFNBVX9AIQ2/NHPqdsXgg+qgp2RFkhcEUGDY/uYSUqceJAOrh6jth6AWzNUKqF19Li/+FoRp8ZyVF/5PzCkNdm146a7kSpUUPw/oDo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CtLCAC5lSN88AT6g+9YRRMw8JODTkDSjjcnjZAU6O2A=;
 b=PRYTLS6SnfpTZZb6uy5yfWwXs3Z08mGMJJz6J1TKegmhZbU/R524bgbKGvXk15IiozyxWqWTeJQvjIwM71Mo3klRijZ+nz+CA4UDxulWcjwhfh64o2oJZHPF07Ec++uhWAEaM1A7ENNVkYd0V7DIlZMHD3E7ZqKK0fu96nVTOWTO7h3UdG1gS65YQDpWwlxLn2/Rbbc/WjgPiKJaatc6iA/aAuY/7HvG/pzjsTTRH0UTyrxq2NM/G/5btdIJixvkWNldWjQiDG5zX41hVDumrnYoZdEc0KtqzGBPHoGZsexOy9FQ+S8+uPd5dGwk1S5VxAjP70rhx+mCSNjh8NeDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtLCAC5lSN88AT6g+9YRRMw8JODTkDSjjcnjZAU6O2A=;
 b=mPDY9wtf+2c41dZYbpKeGWSshZRIXMMLKdU4hbN+EySN6Rldk53y9dBXyxb/TnSHHGf0gTmZGMuwxjqTiic65bOwvINtc0kVm1bblzM8amW0AnMgQwtMSbUVBIXhQ3pZjQAl9OzHzhhzafAD9+nKRl69R+BCrHVCYXu7eXtuMQSJBKrzjtU8eoqLajzsMqsQ/75fOOP2eIMm6QUTSaRh6ZNpTnb1M+Cuy43K4cHN8VdviaKio1JquQhtRj57oF0efiPp22D7YFTfemnAvhaVLzgATOvYplA8TCB+c48E0ynHcf1Vgy5cvEFkYaIL/rs21VeRMRKgkiIz7EM3nOxcDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10705.eurprd04.prod.outlook.com (2603:10a6:150:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 16:24:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:24:43 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: (subset) [PATCH v2 0/3] Add support for Variscite DART-MX91 and Sonata board
Date: Mon,  2 Mar 2026 11:24:23 -0500
Message-ID: <177246864189.2082148.10544989842491208666.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205100125.9095-1-stefano.r@variscite.com>
References: <20260205100125.9095-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0386.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10705:EE_
X-MS-Office365-Filtering-Correlation-Id: 7571f112-4807-470a-6051-08de7878363b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 pe1VRQ777fWnDJJLcNKMO9lUrM5CdOxjUtbTnxo+YZLxvlQ0A/3333u1Y3ASCO6xGYwP1PO1bb59Bgl8y2vOPQDJCtaXGhqo6ZRGYFmNj+vsVQMc0e5Lf77VXqIK0GuWe4k7P0TlsxJTGkDSbQIpGjD7HrFpf2QIkCksVXdZ2Wo0uXsRmxvl0FOFM/3G6hCqTbaQa6BC6ea+sQK3lvIG9O35TiE6JMDj7+vBG5B3epMKVfbtGNZnmMZvm0ck4iBBiryeOQnpq9naXo4oaCrNBqr8VopJQF63BpznN1SQ6XGRlpujIEPOxv6SKFAnYHVllxjXfmlxmyzBXadIbibYynNFzDwRWVQ9ANfzNcVlqXlaZTA/niilQIL8QodGrV5mYmxLHm3H/zsiyeyUraKwtzGftsnD2S3ew/aQb9Qn618FJOBtkqCH+iAFXy9oKD73Wru6wGrOv4r3pqM0lDr6H7JOGHDBrGh8L0guZVoYAcS3f8Dj774+gqkwJzOhaInFDU8YoiWlaF3HzjyZQi/0LN+RKzU95aR1CO0jniFEMktQVBg0B16x1JtloogGIylpMoqKFN0GGfeObskYvGFVyYhoSNKHkoBQ4h+xANK/HOzOE9j37jj/TCQ6269NNhRGQZ0T0wFTTWgyu+MAVX2V33E94jg+BPrZWWrAb+rcP0jetjGZvedXiDjAg3zrSXGmP9WPnm8FIb0hHCBUHUZkje4VyjuC6K7DZBunFdblzquSdu06vIZkWKY10mR6NyV6upT1CbUxZpFt2C3OjtEFO4ReIuaWj3XhrQzulJqaU4XC6LW2fTYrMy7saYerfeNc
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UldZNmliTmhLeGJCRjdSWitqbktNcTkwdkIrVDNxQUxpdDJ1UmxueHpYcW03?=
 =?utf-8?B?KzdDZjJ0OWp5RmVUKzVtaWliSmc3d2RCUW45dHBFT3dJQlQ0RWhMWWthdC82?=
 =?utf-8?B?OGtMa0JWQlBROFg2RlhPZmI0NENseUY4eWx5QVF6Y2pkNUIyTzlhZGRVN0V1?=
 =?utf-8?B?TGFueUZzTisrTE94Y2FGRXh3dE5McDJycmFZNUNqY2VzSDRlcXVkMmNKU1dP?=
 =?utf-8?B?elMyVElNU3JicTZ5alY0Z3VFL2JUOFZaaFIzMzFJRVBJUk5sUHNkdFpkYVJB?=
 =?utf-8?B?d0V1U1ZZV2EyMEFBVzBUNnllTW9yc2Q1R2owdmZqeVcvWDlGNlBUd0dsaEZQ?=
 =?utf-8?B?dzRHTkNDWFgwZThxYUNiYTBjQVZkczRNRkFHQkp6TVFJMklmN0Q0cVRJamN2?=
 =?utf-8?B?Y1pRU0hrRGtPYk9lWWViQ3NEUDhyR1VLd2x3bkVESEdHUUtqVzd4cTJLUE1Q?=
 =?utf-8?B?OGNndUtNSzZBNnRuOXltNzVWZGdIZE5PV1l3d0dlMVo1UUpFSnpyNnQ0SHlk?=
 =?utf-8?B?MDhQY0p2Q3k4ZkRhY3ZGVVlQZ21sMkxjTjlQU3FJS2Z5cjZ2NmhXK0UzSUo3?=
 =?utf-8?B?R0xIRW9iNkVwbmNvQ0E4cWU3Sm0rcHpJMndGbG5SYzB4RUpYaWVKRlRtRXBL?=
 =?utf-8?B?bTczbFhYTkJzUnBSS0JSVzY2ZnE1TkwwdXN3aTdQQWpISFB1WjROL3FmeW5z?=
 =?utf-8?B?Tm5kc1ZIUWNJTCtjZzhlYUZvcUdNMEcyc3VrNDJBZndWck1TZnVtaXpiWFU3?=
 =?utf-8?B?Ui9SY2ExWVQ4QVNJYU1iNUF0MisyaGZwVXc4L21zbm5idHBYWHZZQnR4K1pM?=
 =?utf-8?B?a25keS90SkY3MUxXblVUMUhRVW5mUzkyUEtET0FZSWVoTGt0VEZuY2ZLUlFy?=
 =?utf-8?B?bkpSZFdBMnJQbjFSc09Vb1J1QnIzMlBVOG91SElkSU01blM1aWthZWlERlVC?=
 =?utf-8?B?ajlBbDRIcTZ3YUZ6a0xlYngva2dWLzJRd1pDTVJtNUtta0NOaEUxZmY4bEE5?=
 =?utf-8?B?OGFJQzdmZFI2c1BaZkw2QndvTDF6MGROeXFITXR1N3hFbk16ZjhraE02QnpE?=
 =?utf-8?B?UnY5TVJuMWExYWhXbDZQN2tKWDR0ZjFpQWdNM3gzUTRiUWpYV2lONjZBN0JN?=
 =?utf-8?B?Zk9DT3Nvc0tHTTVYdVFqck9MNGVMcDJyZlVkb1p0a21JNWpVUmtwMDNhVG1o?=
 =?utf-8?B?KzVVSjB1bG9xck10dnBVU2hvd1F2b1daaWVrT1FXYVE2a0xXK01aNHVvSkRW?=
 =?utf-8?B?RXRnazNaKzJZRVJpNndTT0RBWjl5ZlJiU25lMTMxMHdqd3ZXaHdVSnRrTHoz?=
 =?utf-8?B?Znc1L0RJaE1oaXU2SHJrdGNUdG1UZUZKYTE0a1JJcUVvRHRxaVNjZWdzUUFH?=
 =?utf-8?B?dXc3RGJUM1JqQVo2b3RLN2NaWEppZERmUEJUd2k4Z2tLRzhULzdTTjAvTHk5?=
 =?utf-8?B?TTZlSVRNU3F5c1BodHBBRWtGS1huMkRpTUVvdUVrSEl3ZTRUQnR3aUVrUity?=
 =?utf-8?B?UlRmOU9oY2pyam5mVlVQYllrTWtYMVQ4aGQyb1hnSkhyRDBJTG1xekpKVWJz?=
 =?utf-8?B?VFpmS2VTRHlhT1l1b0FZcGxzOWR6ZlVLekh3RXVpd0JaanUyeGx0VXVQa2h6?=
 =?utf-8?B?Ynp5RkNZa2hPSHpmZUU3UERuUDVuVjhOVGRPRC9hc1J4ekZueURiRmt3SFg3?=
 =?utf-8?B?cUZ5VTJyaWRWdERTZlJLUHZsMlJ6NTlvd2F3OENTY3FYQ3dBSDc2MTM4NHRW?=
 =?utf-8?B?RjZBejRjbEtjOWtxWFBHZ2VlWW5HcUZzTkdMcmdXNmtTZlJ0dnFNczFFQjlL?=
 =?utf-8?B?eGZUNjFtMk1mY1prUE5SWHpobWZHcktxMzltWEU3K2V5Y2dYQnNZdDk2RlQ0?=
 =?utf-8?B?dFVKN09TY1ZnUlEyZjMyVUxxekRjVGhhNTVXdGl2Qms0ckxvZG5FM0tQZnZs?=
 =?utf-8?B?aENGdVh2QmVQSmRablVSdHF6K0NZc0hXbmJ6QjREVzhCaEhTTVU0N3ZzYlZ0?=
 =?utf-8?B?T1Y2eGFzQ2RieDNHS1d0UHN5dDQ5a09hbTIwWDRGSFVlL1JCZjJ2UWNZcmhL?=
 =?utf-8?B?eTlQelR6SFBNQUhLc2QwN1VoblhoVnlOQjlDYUlYTVR6M25reFRDanlmWkw5?=
 =?utf-8?B?TitjSEhBWlhuMktHdTNJdFVpNFZOQktqUEowOTQ3U05TQ1BBbzN6eXN2TlpZ?=
 =?utf-8?B?T1REc2pYdDcvZmFKajh0cWpDb0F5VG15SG1Fd0J1M1ZpQjdPSVQ0K3hkWUY5?=
 =?utf-8?B?MTcyeHpuYXRyKzlEN1lURlBoWEFvLzlzRDNhMGtoNlJ1MSttTTM4d1NOQ1gy?=
 =?utf-8?B?ZU1vMkdHUm5US2hIUWFMSm1nblZjZWNoWGJxb3ZvLzRkNmNrVWg2Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7571f112-4807-470a-6051-08de7878363b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:24:43.7631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yzz/Amw/tIk0D6TRv7UGVjXmz/qYO/fyiR/5M2ySxpKesdp9c3QIPbfKu9zeP5QYBHIBvJcl0/HusRBPyQirjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10705


On Thu, 05 Feb 2026 11:01:22 +0100, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX91 system on
> module and the Sonata carrier board.
> 
> The series includes:
> - Device tree bindings documentation for both SOM and carrier board
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>
