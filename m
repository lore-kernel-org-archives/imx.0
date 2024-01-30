Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2054.outbound.protection.outlook.com [40.107.8.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11DB33CD0
	for <imx@lists.linux.dev>; Tue, 30 Jan 2024 01:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.8.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706578020; cv=fail; b=eb5GeQONM9lOwvpt33UvxaMntYQPslaYrxYZ+xgBrWfRJjOWeLqxl3va0HWtQnQhhv+vair3LbfiOyEG4oUXlrFoOv3OSuUD55iGI5tI6JqAForSzqdRYLQuD/6WQOhaNPr6UDk+Tmlfo/6TXUm4gKzvnfVZCK+6T5oe7LlMNnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706578020; c=relaxed/simple;
	bh=6X73SGk9uemcjbT2B/YmeEiQ/PMZES7IpVxuD41+DUc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nqkzq0rsBslbxTIET0cHQ7f0cHwn2bTobqoQOFIN/LSZ/vz0QNDr5irmMTRO4JMv4RsOkNYyS4bR7ZYla0gvZiipWF2VCUano36fMRoMV6P+LTnWeaBDiKd4QDqpXsso/4IkerASofMHwEFckIcFp3AQkYIFi8BUCtmYu6vMS+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=BPBqFwOc; arc=fail smtp.client-ip=40.107.8.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="BPBqFwOc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jq4O/Hm8d5fOpa9AnfE6fz3lKAdaXF2vyoDyEdEAmjtmy0ePuhl5rhkgdnj13u+mcnR7g72dmI3hsNhkGztLQ5n+6KNSi1GQbq2h5fyrljY2x8QmjAc8LfiPtxnevNz7UaHmjF4Kl7DCOoU8EFgUt5umv+DFRZfogkp33ewaLKQtMZU3vuC22ijr+AvNScGx6FyX6cS5EacZCK499cM1n8JWu7nKWKU9V2kOb210s/1mmw0NoZrRUoT9/OS21LoBb2mW1vcyt7qnW66Aw1etwmvQjZuqwxaYGIyUNowUhf71oSmJw20GbhMVPJuzBe6hB9Z62RTbrg7egOmxJpHoHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6X73SGk9uemcjbT2B/YmeEiQ/PMZES7IpVxuD41+DUc=;
 b=iwnmyltxOlwXdoOecReN7WW6vBd7iLnFJZruTMzn1+6tgHN0MmICDFrYnggCbGQdD7Lk8hfr1MAIHtRC0Tzaa6yWLl9vHzrFAtuvuJqC4uKlDmQcHSdOp6gzix6G18+miHEbBL3xseQvU5xQfBUqFsm4CxO2V0zH3cGk7HguMwfVxZr0lEZPjA8ScWG/yuayaM8sugaWhpzFR5XNOges9ej4ESKbFDUX5uR1OcZc/FgGenAI0kKtQsUofzyjvUNWVJYSK9jUK1N5EQ5qlrM+PEcgxTBqR9bfQXUKBd7UjDsZ04ebyUO5IJ80/7xq21WHBiONnvEpwXe89U5hD78FOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6X73SGk9uemcjbT2B/YmeEiQ/PMZES7IpVxuD41+DUc=;
 b=BPBqFwOcppuMtTXizPbyymti2m7xoa1n3YAJooVcRQwe2bMb8jSLfE0hJ6RTeW5cczRz0e6z+10IOzOCjT7RD18VoqwaxXDNja9WmiUTrW6eiynxJLaOyU7XE4UxmwEm4DS7f+HoPeUa5tJ1mrBnoJ5b1w2GKFxJhzIUvLp1cjk=
Received: from DB6PR04MB3141.eurprd04.prod.outlook.com (2603:10a6:6:c::21) by
 AS8PR04MB8817.eurprd04.prod.outlook.com (2603:10a6:20b:42c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 01:26:55 +0000
Received: from DB6PR04MB3141.eurprd04.prod.outlook.com
 ([fe80::4c4f:6b0f:3a10:f5d5]) by DB6PR04MB3141.eurprd04.prod.outlook.com
 ([fe80::4c4f:6b0f:3a10:f5d5%4]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 01:26:54 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Frank Li <frank.li@nxp.com>, "ulf.hansson@linaro.org"
	<ulf.hansson@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com"
	<edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH 2/4] dt-bindings: net: fec: add iommus property
Thread-Topic: [PATCH 2/4] dt-bindings: net: fec: add iommus property
Thread-Index: AQHaUvjHKDb5b7Cwr0muxCn+yVvWb7DxkABw
Date: Tue, 30 Jan 2024 01:26:54 +0000
Message-ID:
 <DB6PR04MB3141280EB0EFE4F09AF05BDC887D2@DB6PR04MB3141.eurprd04.prod.outlook.com>
References: <20240129211837.239683-1-Frank.Li@nxp.com>
 <20240129211837.239683-2-Frank.Li@nxp.com>
In-Reply-To: <20240129211837.239683-2-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR04MB3141:EE_|AS8PR04MB8817:EE_
x-ms-office365-filtering-correlation-id: dfb1bf5e-4793-4108-30c6-08dc21328b3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4Bmb0SHyNXKEa9kGfHgFiUS9ywrlnkUXn22+rWOWZDdPi0XTNo66AxEN4ehAjXKh1z84GvRaxiw4IgKkOTRPCMrFPqyQYsQAfcWdM57s0WD7T1QAdzd0InZI5WDeSzggCl+DmNN/jHO1CidbwOxnoghyTFTHDKsFF3IJ7ySZpymdy3IAWPr1k6eeiFhoOx5ZU/uRlu62Jv2du+D8zqREQpRQOxAfRMyJI3W1rFFosKHypmHnFQCYCuDAphPXwTO0568kafjX/7KB+IcO7pF4v9B1gX56OaWU+Q5rPxLHJv2Wu7RiaNJvxK9o9eFV1Zz1vabtXH99r2pRwL3CZDURzlZdF8Rkp03bes35afOxP8AwCbNel+VeoN958jeOncp3JtAnKUpJqDydWVsxE6dFapsVnsv2lnFbjjvxGChpWqGZaqbrpuH2Bsf/58HrgoqVpOtZ7LUGadwyB0iIDG+TB8q4Dv2Q4qo4rwlX9+uMe+Fx1S5V1Fsu/rkh5KZQ4nbQP0cCVxIjFrO9xpPB7ETv7GtAWJYPI2ARxavpdqZW3j0PK6pkikvh+R+cL+y/zyHmSybKp1HeM1GggvzHinztmjmIP55obIp6Q2Vi/Zr8WuCoevydU1FTaZSs/rxEN85mTfi2WV/I5urTT6yVjWXaiQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR04MB3141.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(346002)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(86362001)(71200400001)(478600001)(53546011)(9686003)(6506007)(7696005)(83380400001)(26005)(38070700009)(66446008)(64756008)(66556008)(76116006)(66946007)(66476007)(55016003)(110136005)(38100700002)(122000001)(44832011)(4744005)(7416002)(2906002)(5660300002)(33656002)(8936002)(8676002)(316002)(52536014)(921011)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?djRIOUx1Ukt4bW9qQ0FhWkRGQXR0WkYwUzEzcnNTclNFd0ttZ1JNZjJYR0ZD?=
 =?gb2312?B?aVFvZmQ0YkluNGgzTkJ5RFphYVl0c1VDaTR0TVFpOTVhTCtROFZCaGc2R3FZ?=
 =?gb2312?B?SlM4Z1RuQVVWZTh5RWYxa1lMcG13T0dwQ0ZrOHhCb2pWNEQ0UExKNjlmT1gr?=
 =?gb2312?B?S1FwTFU4dGMxY2doWmlnU1RVUEozRXRUdXgrdElWaUhPOHFJNGtacXFHdEVW?=
 =?gb2312?B?NTEySDNSN2h2SVVTUVRQNDF1WVBEMkozczJwcklFK3EwSWd5QTE4NlpCWk1O?=
 =?gb2312?B?U1o1Y2x0eEJRZTRaYnFWZERuQUxWYjJOTlhYYVIya0RpUy9nWExtcDg2UEY4?=
 =?gb2312?B?cjVOQXNPK1JXdnVObXdnc2lXOGNkTTY2UnNETVcrNTluL0xvbWZMNEFPdEJG?=
 =?gb2312?B?Z00wRDYveFU1T0lwWklVUVdCYlhOUzFOb256ZGVNb1JCMkdQYm53S2pmZC90?=
 =?gb2312?B?dldoZno0VDVkaVdCblF5OVY2YUw3dS9tMXlpZk43L3liUlB1MHNadG9tOUhI?=
 =?gb2312?B?NURuSFpIRVowSzNwRmxRRnR6aWJxSzlqOVNYT1FSaTVoVzRHRVJpTlJldVdK?=
 =?gb2312?B?cHI3djNNeXVKRUUxZ3hEUE54U3AwMHlyK2JPcUg4alBGWjE3NjhCL0hCSkJz?=
 =?gb2312?B?bjZJczRKMDd0WmtNbm9UY3BlSGJnZ1B3UWJMWmpqMkpBdGg2SDl3eHQwWVgx?=
 =?gb2312?B?VVplWFRodlFuQ1hZMXdxUGlQNG1qRXlnRWxzaE85R0pYRUo2cTBid25VZHBm?=
 =?gb2312?B?REw1UEdOSzRSa2t5bHR2ZkwyREJDMVNhYysyYWVXeTVqSW9rTU9EcnRDajF3?=
 =?gb2312?B?UVpHbTJZZWJkMEZwOWQvbnRQVEZIUmlxUlpqeDBqNXRMRHdMclBHZHBtNHZ4?=
 =?gb2312?B?V3p0ZitIWE05ZnNzSThIWEFmTmVXOFVSMEdUWEppeG95MmthNlJUODFlQ2dB?=
 =?gb2312?B?TUEvK2FuVmc4c1VkZVdwRkt2YXlJSStReUUrRnl3bEd0UjEzTzQ0Tmw4OUVx?=
 =?gb2312?B?SDlDVFNZcDErSEZGVjRaR1lydFNBNnJydy9oblVUL1lzVDhnOW9SSUcwQzJI?=
 =?gb2312?B?eGdSbHlNZWd1S0NsYTl1ZWNRZDVNV0M0Wm5JdDVuSncwazNwNFkyZjdEZVZz?=
 =?gb2312?B?TEZZYkt3eWZtWTBJdk5mTms2K1FnajRveVVWRVZJKzA2d2ttN0FsWmNNcTk4?=
 =?gb2312?B?UWpTVXMwaXhBNnhJM1kvK0Q3RG4zckpsZjIvVTh3OWdUZlJJWUZVNldEdnRB?=
 =?gb2312?B?RU4wcEsxN1ZLTU1nYU81dTNYekNWYXc1STN2akFabkluLzBwbDhpaFRPd01y?=
 =?gb2312?B?anRuN1E4dHNONENRWGVhaG1nTHFxMEhsaURLT2lXZGdUR3pkK0RSamR6bEti?=
 =?gb2312?B?K1NySkRPV1NUUHhIVnVpaHZDWFd2UkRtVlp3SFNzN2hNUmlkWHVtU0hrT1Iy?=
 =?gb2312?B?UGFRZGg5a0tZTk5yb1VScVlGczRna2RJendTYVlTdWNpQTBTVXhvbDVuNlBM?=
 =?gb2312?B?QkR5aXFuL3RiSEJVK0JHNjZGZU5CTG1FWVhoL20rSEt4aUkrVGNHSU53OGVD?=
 =?gb2312?B?eExHNmlWTXlPRU1aZ0JmKytlNEo5cXNWamlQVnRxTXRxbE5vcDJ4akZkTzgy?=
 =?gb2312?B?bllXSVlaNDFNclZMT2oyenk1WUtET09SNm92a0FTWDhvVmNxQ0tiakFGOEJW?=
 =?gb2312?B?Q2RyTU16S3NsNDZ0UW81aGgvSS9aZzRJRGgxb3R0STB6QVBHaTRQZjVvK0JE?=
 =?gb2312?B?ZHlkQnArL3JkbXA0REF5cjQzYy9yaUdNTlBlMFpqWEFlT1hEelNzeTc0azdl?=
 =?gb2312?B?eXNjMjd2MksrUndIUFJTc3hKWVQ3cnQxeXhVR2luR0FTSHQ3bXRoYmVCVTJm?=
 =?gb2312?B?bGt5ck94TlVyYU9JdGFQU0F2S0FETmF5U3FDdnhGVytZSUg1Mmc3MFhkalBN?=
 =?gb2312?B?dThPWmRIOFZmb1NLd0k4RUxSVTYxaWpIZlc1ODBxdkdvUXdUMlBkNnBUUnBO?=
 =?gb2312?B?YkUrOGJ4a1BQSmdMZ2tEaUE5d1g4NU4yQm1rSHpsbUEzUVQ4Y0RoMC81d3FT?=
 =?gb2312?B?bEZQVlp1Tit0MlZpNmZyWGQvd0lTaXlQK21IOUlNRm51RVh2SFVIYUVDbmVa?=
 =?gb2312?Q?quvI=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR04MB3141.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb1bf5e-4793-4108-30c6-08dc21328b3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 01:26:54.7725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R2aWOgt662fGOhy4MyIBK/JlFBinf1EWA8nNMORxQ1+w9gYlM7rdm1hLxiD/dCT8fHbST9DCCHMytLKoXuPH9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8817

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmFuayBMaSA8ZnJhbmsubGlA
bnhwLmNvbT4NCj4gU2VudDogMjAyNMTqMdTCMzDI1SA1OjE5DQo+IFRvOiB1bGYuaGFuc3NvbkBs
aW5hcm8ub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7DQo+IHNo
YXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7IGtlcm5lbEBwZW5ndXRy
b25peC5kZTsNCj4gZmVzdGV2YW1AZ21haWwuY29tOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBu
eHAuY29tPjsgV2VpIEZhbmcNCj4gPHdlaS5mYW5nQG54cC5jb20+OyBTaGVud2VpIFdhbmcgPHNo
ZW53ZWkud2FuZ0BueHAuY29tPjsgQ2xhcmsNCj4gV2FuZyA8eGlhb25pbmcud2FuZ0BueHAuY29t
PjsgZGF2ZW1AZGF2ZW1sb2Z0Lm5ldDsNCj4gZWR1bWF6ZXRAZ29vZ2xlLmNvbTsga3ViYUBrZXJu
ZWwub3JnOyBwYWJlbmlAcmVkaGF0LmNvbTsNCj4gaW14QGxpc3RzLmxpbnV4LmRldg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggMi80XSBkdC1iaW5kaW5nczogbmV0OiBmZWM6IGFkZCBpb21tdXMgcHJvcGVy
dHkNCj4gDQo+IGlNWDk1IGFuZCBpTVg4UU0gaGF2ZSBpb21tdS4gQWRkIHByb2VydHkgJ2lvbW11
cycuDQo+IA0KaS5NWDk1IGRvZXMgbm90IGhhdmUgRkVDIHBvcnQsIHNvIHlvdSBzaG91bGQgcmVt
b3ZlIGlNWDk1IGZyb20gdGhlIGNvbW1pdA0KbWVzc2FnZS4gOikNCg0K
