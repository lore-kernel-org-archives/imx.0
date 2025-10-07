Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020099.outbound.protection.outlook.com [52.101.84.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E02D4B7A
	for <imx@lists.linux.dev>; Tue,  7 Oct 2025 08:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826486; cv=fail; b=Adow+HjzkibBAh4ebdDRJ1T0Vy81epbi4SI27a3EuM/O+zaXxDtYaHVM9uBfiMrhHTffRdwy1LMbPTUMhu9QmXv3AA48o/GUNzr6Zgi6ZwgPYvpqyc4jAaB1BwXdDdIAAvR5+XcharSBIAB5qVKHjJUVRMsNnBn9I9iby98HfwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826486; c=relaxed/simple;
	bh=Z32QXpIHYsDy+RKSb+gJely9egCTPUJcThNXNGBRMRE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UFZ2RIxFSeQ47CJHeMxgF93zC5KBOmz52XBoV6HujB+zX51mGC1CaLrKAiN2awmvc1Nl9gGc5DM3ky4VFIZecPDizvcm1bHOm52H5EfujonAnx+AhtLeMfgoH7Oz/rN9FTVgXzUIF/5KRJ6dXXNFEToGp8Sj/Z7cpCcCDGCs/gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=nhV3WASB; arc=fail smtp.client-ip=52.101.84.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="nhV3WASB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7wyiZe1GTu5Lbnvo8+Qnldko1MT59VDl37SW8LWd9P0I8rimHWv9NsLWDZa+Ci2hXfTquGBWawcPyEksqp3KF7RhaIoHKjEVAeNshMf3cBXJWeh48ip+6Kjr+A2/sUq0NaSnFzyjQOVuLknxGJYFfeEPVG3RTEYDzWdbmamCeqW4BwA11a3R0Bn07VqJ+a4shBO4JjuUhfQAuLsuVgNW1KAr42mUFpUumr947JDB+OopNmPt2q/HV9X4z5Mx+lhqMlqoG0e4xS/UfJH/XK00W8dFyP84NWXvN24vTUoQ6eitV2q1iHFoSxdtlY7kzP9Mr62tr5timtTxFPHIjm93g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z32QXpIHYsDy+RKSb+gJely9egCTPUJcThNXNGBRMRE=;
 b=L7lQRQoX7yXu6/o6ur4q4uGR4H/nLcyF2WG329Fs2X461eOGL0bmd21Fe+DH7VXrE/PMERt5sjk8lzS6gbcrZvc9zjaLTThl6ebDl2VqCTZkGxYfVECJwQEEJNM71A3hRbZ2qXSD/pyzU8GbzNrmxnYGbKQbh3oCL7Tox5pe11cxcyl7aT2GwiAdeg1ZSh4mve/SxgEqpAmEpj/GiKJDQfGivkTQOL/QjcsTSVUJBLH4/YkjLQcIGTzx62t94KfLCuRLeSgeacxFkSRhfCXdFR3DjhJ5O2jfQAlnmB+7VujK9Md/6dxyoai4qhL9kKShCZ5ks4wxkyyzPjghDn1lDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z32QXpIHYsDy+RKSb+gJely9egCTPUJcThNXNGBRMRE=;
 b=nhV3WASBQ2ncNfxL0jcTV+OUh7W81p0uJeVPOtmN9qASpoqqIxXVHfZ8pOcFLtUhfaGElS535s/JVl6aQ5X578vfpq7PY/q9tZG2/gJN5RDhb3/q/LIEDfBEXGPX7BJ3sTsOtuqGRUo+pWNUea3fqdR16GrbgH3dOnUpw+3nuB9YUobg/ZAo/ALX96JAqH8FDjjMT+VdBZwuyKTQDriZeQQpScHSgl5b34bdwAmBrisWzk1/zeB29kpps/QTANqf5ewTANusqUsoVL3wLloSgeyAkay5TjlPkr36g3bRguflDC9cGYom80F4Xry12TeS0TtuJks2B1bPXDPzrLeLzQ==
Received: from DB9P195MB1228.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:297::14)
 by GV4P195MB2977.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:2ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 08:41:15 +0000
Received: from DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
 ([fe80::389e:cc69:1eab:3c56]) by DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
 ([fe80::389e:cc69:1eab:3c56%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 08:41:15 +0000
From: Teresa Remmet <t.remmet@phytec.de>
To: Janine Hagemann <j.hagemann@phytec.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, Jan Remmet <j.remmet@phytec.de>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] arm64: dts: imx8mm-phyboard-polis: Use
 GPL-2.0-or-later OR MIT
Thread-Topic: [PATCH v2 1/6] arm64: dts: imx8mm-phyboard-polis: Use
 GPL-2.0-or-later OR MIT
Thread-Index: AQHcN2IszJTcAsx/tU6+/q8FD/4xhrS2XYMA
Date: Tue, 7 Oct 2025 08:41:15 +0000
Message-ID: <143bd63e2ed6bf1678c5bb4a710a5e19352cbee8.camel@phytec.de>
References:
 <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
	 <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-1-7e5de62c79bf@phytec.de>
In-Reply-To:
 <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-1-7e5de62c79bf@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9P195MB1228:EE_|GV4P195MB2977:EE_
x-ms-office365-filtering-correlation-id: 89b159dd-6c9d-4793-fb41-08de057d46e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eFJGUUNPV0ZCa3ZGQjgrZ3RFTXFTckdYYXVUWlo5ZzVqcGVBVnBjMVgzbTBJ?=
 =?utf-8?B?aGtLaS9zTzV3VFBqZFR1TnpTOHRMMHdsbXBxdFVOc2RnNU5rR3Y4ejJSWEpz?=
 =?utf-8?B?NjZUWjh0M0t3djZGZU1Edng3NXRNbTNra05RQmZ3bjRMdjkyYzl0UFk2NWpp?=
 =?utf-8?B?VHNoQm1tMTU5YWx2YmRrUzhMWElEWVRFWGJ2dTlMZStRKzRnNGx3Nm1aSlVQ?=
 =?utf-8?B?Z1AwcUlieEd3Q1pEajFKdW1RazQxbzZkNVhOZlh0KzAvVzJGdHVSQ1hzSVc2?=
 =?utf-8?B?WW42dnJKU3RUaXVMWExGMnZNN2pPbkRsLzZtY1F5SDU5S3RmMm9EZnh6aHRN?=
 =?utf-8?B?K1VGRnVTV1hYQmpVMDBFM1VDK3MxeWRMNERMQ1BaTHpGTFpOWWpEaUtqZmlB?=
 =?utf-8?B?SWZYYkNpcCtoVzRCNlNGaHc4dnpEM2lXR0tDVVN6MFNGdkgwMG5ad2FJQ2tn?=
 =?utf-8?B?RmFvU01nK1dFcXh5ejRIZTlpOXlOd1ZHQ1Bzc3pySFRXZHJQeXBIN2xib2F0?=
 =?utf-8?B?YlZUOFpmQXcvc0pXMUlYUFl5TEZ1NmJWamtXaTNjRmhBRndFZWdOa3JHWERx?=
 =?utf-8?B?VWZMbU5yWkFVNnBaODJwUnBKSmtnUWFIc0ZTdkxvajNLTmhoNTN1REpTaXox?=
 =?utf-8?B?WFBsSm5lWnArZ2oyTTRaYW9maWZzOS9QTnQ0eXM4Z3EveWtCSEhLaFhTNzdy?=
 =?utf-8?B?Qkw1NzNybkNRejdhcVg3Z0V3S2I1VGFwamlIUHhjWWlua3FvNnhxZGxOMHQ1?=
 =?utf-8?B?em0xKzJBekxsMWRlSlBJNlNlU1FzekM3Z2xCei9Zc2xEZGNzWmNjbk5rc08x?=
 =?utf-8?B?eXVQckRPSVdJendzWjJJVkdoUG1vclV6dVg1OGo5VVNETzlUTThRV2VCOVFF?=
 =?utf-8?B?Z0lMSjQwQVZWUHVTbGZrVFk1Mlkzdit0NEt4QjRzbGI2RlBIcUlYQ0s4YStS?=
 =?utf-8?B?ZXhIRTgyM2ovTXpqRytKY0J6SFZaU21UVi9BK1phNzFxcGo1REdpb2xMNlJy?=
 =?utf-8?B?YiszTTFycW1TWmpMZTM0QjFQcDhlcXpqMURzeVFMaXdDUU1kMlI4UHFyMHBz?=
 =?utf-8?B?NkxHM21lb0NMQkRPMi8vekFnYmtUaW5KRCttNlFFZHFwcTVaT0lhaHFUY2E2?=
 =?utf-8?B?OXdVNXBUQTlyU3BSaHdXRlZLWGc2QWVnb2ZJNFZwZHhrbHNBVTBUUnd2a1Fk?=
 =?utf-8?B?Mmp0V2ErcURVSjY3bWIwNDN1a0lzbmRQL2hsQi9MOGxxalUwVHNBb3BWUCtB?=
 =?utf-8?B?elkwSlZKWVJWNHY0TmVmWWRnQXNPeGovdEVDYTdyYUZ6R01jNFVkaGpDcnVL?=
 =?utf-8?B?UnZMeTYxUHJIVmJXbjJhdHh0eHFObTBaOFZobm9sTm9GU0E3d3U1ZlJFbXJs?=
 =?utf-8?B?VE1FY0gyS3pNR1Vnc3NaS0NtYXFRL0JvaHFFYXBVYnlEWXUxU0JOdDl0b1dN?=
 =?utf-8?B?N29MVkFzcCs0dzdrNnpSaTlUdlY4R0YzRENGYWQya0xhbWEwM3NISEhQWUdD?=
 =?utf-8?B?SVRSNHJvRnQ4dVZWbWMzbWtnYXhWbXdLT1RKZGtTSzhpWE04VjNrMHZvaEph?=
 =?utf-8?B?dmUvT2ZsNUlpdHZQVzJSRVVDNnp5ckQ2aUFGMVNiRG1wa3ZZR2xob3NieXRk?=
 =?utf-8?B?NG9VNGdUWjdUOEtxVzhCd0pENnBaVSszK2JKaWJ4NTlpOWYxZlcwdVg3Si9y?=
 =?utf-8?B?SWt2K2U4UlBseFdoZEEzaHFaQjJBV3dsa1F0YVF4czNndFhQT1NPRmc1Tmcw?=
 =?utf-8?B?ZGtYWXcrbkdkY1lDZTZmNWlJVnhLT2toS0VWSm5wQS9hOUVKNmxWckUwS1Rw?=
 =?utf-8?B?Wk9oMFQxRENxUUNOcWxaTHBZUkwwSnhzcllPSklCbFlUbzFGTVRIaTNaZ1dh?=
 =?utf-8?B?WDZ4QTk1Q1o1bHVVcnI0dklRN0lDNlNBRHl4dGdlSGpZejIvNHVyVXdaMWlV?=
 =?utf-8?B?TDg2V1NPOFQyWmVoZ0k2VHc5ZEg3dHJxSjB2T1g3WWVvUnAvUzBheTUyYXNQ?=
 =?utf-8?B?TlNKUlQ3aHpTSlhVMlNOY0FPaHEveUlWOVN4VGNwdG1EZjRBdzFKbXVuWWVN?=
 =?utf-8?Q?36Wrve?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P195MB1228.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VnY1anJRRzNWd0ZoS0lzdHFZSTl3WG42Z2cyMmR1bG1JZXBJWlptWUk3QkNK?=
 =?utf-8?B?ekd2bk5PZVhMeC9OWnh1QzIvM1VBTldXdnJBbXNwMVk3cU1ha2lUODBpcTha?=
 =?utf-8?B?eThGekNvS2JCLzlxQldUcmxpZGR6L1dQNTNrNXkvRHJLNk1ZZjhWeDhKLyt3?=
 =?utf-8?B?ZVg3TU1KeEFtcWZkSnRpMXpRT2R3SlpFMmlXcGZoNnJ3dHhZYlc5Y0RSUkY5?=
 =?utf-8?B?NHhyK29QaUc5R0tIWFZCQ0lWTUEvelBGc2JVLys2dy83ckU5alEvOG1QVUJH?=
 =?utf-8?B?ekovWmlscm80eVFQMlNkVk5BbHZVZU5jUUdGWTZpdU03ZVJhSUgzV1ZlYVNR?=
 =?utf-8?B?bFFmcFVxd2FoQ3I0bytUSkV1YmRLNDZWZ08wU1Rwc1lSeE9sQ1ZscWpRSUdG?=
 =?utf-8?B?NzR1M0xFMUZHKzZmeThDaE1TYllFTVFOU2I2MVQrTzc2bm9zUUJSejd3N05s?=
 =?utf-8?B?cm5PS0g2ODBNbC83ZFgvM3hNclViNVBMTEVJRjRpcjV5ZHJDTGxGUTJMdi92?=
 =?utf-8?B?RDljUHBYMmZ4N3VDdXV5RHFya3pzTEZHZTVsdEhpbjBKc2txNk8zZ3IyaHFi?=
 =?utf-8?B?dlFuaUNWTTk1OCtSMEk0UXNJVDhDbm5hdlY4cnI0QkM5RjVsQzlDOHZOMHQ0?=
 =?utf-8?B?blBjWVRhWFY3WWhCM3U1Z1pURjlXb2xLMWQyUjRPWFdjYWtvcXNPejFuT1do?=
 =?utf-8?B?UnA5MFJHek95Zk5lejRTb1pZRmVES0pTL1BkVkQxMDdya25mNjBLU3puTjhJ?=
 =?utf-8?B?eHcxaTlHNGc5emkrZDd2alBWcHYwbUZ1djhZc3F1YXo5azh5U2NNOXM5aWFC?=
 =?utf-8?B?SENKbGRKSFRNanR3bXpXMFZQVUVsS09Qak1UTmw2ZkhFd0JRTGVmL1RGVXU5?=
 =?utf-8?B?UFlvVkhaTXVYbkFKMFNmQ2hLN0ZzUWMzOElTcm1XUUVyd2lHVG9BNmR5eUlQ?=
 =?utf-8?B?RldsWmlUNzhQYngycHpWU1dpbEVRb2prQnpMM1NyV0x1RklUbTZNMTFHbkt0?=
 =?utf-8?B?RTZ4MjNidTB6THhkNTVJSC9UeXNZSDJzZ0wrU3ZVN3IzZ0c0aEgwWTNtNjlG?=
 =?utf-8?B?UGJDTUN6NUI1TWZnREF1N1VlSytKR3N6Vk9TN2FDa3FsNm5wNmZ2WXRObWpv?=
 =?utf-8?B?Si9PUG02WnNXOVVIcDhFQ2JoUDRKaXQ3TUhxSW9wRnRvZWtsSE5heU03akRk?=
 =?utf-8?B?cFpiOXVEc1hEbWFkMlVhZzQ3bExIMzlwbUkwOVI4dHRHaEVmQ1lBTDlCYVdU?=
 =?utf-8?B?c1lZVlhwZktXOUEyU0FPYUduK0lqcWVpdndRU3g2L2pWRFZCUmpSMlFRaVBj?=
 =?utf-8?B?SlRIc3FQQmdFODZyWVRmNWIwQTNtM1dUZEFQTzRMNUx0bkJvaFpIVnBOcVNQ?=
 =?utf-8?B?M3pKTnIwTno2RlYwcFdxNlZkSWxMV2w1Qm9RNTUyZUxTRFN2MzY1MGo3c0JN?=
 =?utf-8?B?bTMzZGhuS3pMZGgwMUZNcXNoT3Z4UytobnRmdGlOT09MTDBhSXZqU3BoaTlS?=
 =?utf-8?B?b2NJa2hTb0FiUE9ucEhFd3FSeHJHb25ZeGllaW9oUWQzVlZMY1d3V3plY0Iv?=
 =?utf-8?B?c3c0TGkrcHlxM1ZZdzdoZDMzeXJaYnUyOXJQdm5oeHQ2VGpRRkY3VmdTNkM5?=
 =?utf-8?B?L1VyRlZqc2pteTBZZ1ZIWDBsbkYzbHFKSWVyQVRXY1VYQ2lXUmRySVh6ZWc2?=
 =?utf-8?B?Zk1NTlc0NlZmN0tTWWxvV3NZREVJaGlSYkZoUzZkTXdqWnlvdFBKSVQrZmQ3?=
 =?utf-8?B?MSs5Qm1VR21DQVBpWW91MXU5TGVtOUJVMUpGcFdXWHhweDc2MWFsNXB2WFRN?=
 =?utf-8?B?TmVIcDY5VklvQ3p6dExndms0TURtZUpKeGxES3ZQeTd5QnpSUlVocVRKNi8y?=
 =?utf-8?B?eGVhazRkdG52angxcE1Ka0dGcVlaRGVZL29keXBndXcrWUI2ZTBXY0ZZbklh?=
 =?utf-8?B?cnFJNUk2U0hCMFN3SnJhL0tDS0l6cW1FcWZMMUUxVkM1TGFkRmcvTk1kU2lL?=
 =?utf-8?B?eUtOdEFrVUtmT0NRSEgzWkZycUJLckt4amM4SUZMY1VvZFlESzFxVFJMUE5x?=
 =?utf-8?B?VGhObUdsMmJ5dEpscjRzRHZmT1l2QU1LbWRka3FqbWZXd21yMHljbmxIbGly?=
 =?utf-8?Q?UFiMoWCSnc6ofxz+zXd1ZL9y8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5291D6D305D36F448BF33A77AF6259F7@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P195MB1228.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b159dd-6c9d-4793-fb41-08de057d46e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 08:41:15.1139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fsQLZL3+6Bn2faAoiocb1aUwF5hX767B4CeoqgTTVR7U81I5QWENjSCbhitRiphSuT8a61VRdBtsMyS8rTeag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P195MB2977

QW0gRGllbnN0YWcsIGRlbSAwNy4xMC4yMDI1IHVtIDEwOjEyICswMjAwIHNjaHJpZWIgSmFuIFJl
bW1ldDoNCj4gVXBkYXRlIGxpY2Vuc2UgYW5kIHJlbW92ZSBpbmRpdmlkdWFsIGF1dGhvcnNoaXAu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gUmVtbWV0IDxqLnJlbW1ldEBwaHl0ZWMuZGU+DQoN
CllvdSBmb3Jnb3QgdG8gYWRkIG15IEFja2VkLWJ5Lg0KSGVyZSBpcyBpdCBhZ2FpbjoNCg0KQWNr
ZWQtYnk6IFRlcmVzYSBSZW1tZXQgPHQucmVtbWV0QHBoeXRlYy5kZT4NCg0KDQpUZXJlc2ENCg0K
DQo+IC0tLQ0KPiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2Fy
ZC1wb2xpcy1wZWItYXYtMTAuZHRzb8KgwqANCj4gfCAzICstLQ0KPiDCoGFyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy1wZWItZXZhbC0wMS5kdHNvDQo+
IHwgMyArLS0NCj4gwqBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Ym9h
cmQtcG9saXMtcmRrLmR0c8KgwqDCoMKgwqDCoMKgwqDCoA0KPiB8IDMgKy0tDQo+IMKgYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWNvcmUtc29tLmR0c2nCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqANCj4gfCAzICstLQ0KPiDCoDQgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy1wZWItDQo+IGF2LTEw
LmR0c28gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Ym9hcmQtcG9s
aXMtcGViLQ0KPiBhdi0xMC5kdHNvDQo+IGluZGV4DQo+IGU1Y2E1YTY2NGI2MWUyMGU5YzMwYzll
NWNhMDFhNmFlNmRhNTc1OTYuLjU5NTVkNDhlMTlhZDAwMzUwMzhlYTRhZDc4Mw0KPiA4YjNlMDlk
MTBiMmVjIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
bW0tcGh5Ym9hcmQtcG9saXMtcGViLWF2LQ0KPiAxMC5kdHNvDQo+ICsrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2FyZC1wb2xpcy1wZWItYXYtDQo+IDEwLmR0
c28NCj4gQEAgLTEsNyArMSw2IEBADQo+IC0vLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9yLWxhdGVyIE9S
IE1JVCkNCj4gwqAvKg0KPiDCoCAqIENvcHlyaWdodCAoQykgMjAyNSBQSFlURUMgTWVzc3RlY2hu
aWsgR21iSA0KPiAtICogQXV0aG9yOiBUZXJlc2EgUmVtbWV0IDx0LnJlbW1ldEBwaHl0ZWMuZGU+
DQo+IMKgICovDQo+IMKgDQo+IMKgL2R0cy12MS87DQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Ym9hcmQtcG9saXMtcGViLQ0KPiBldmFsLTAx
LmR0c28gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Ym9hcmQtcG9s
aXMtDQo+IHBlYi1ldmFsLTAxLmR0c28NCj4gaW5kZXgNCj4gYTI4ZjUxZWNlOTNiYTYyYTdhOTk5
MTgyNmNjYTJlYzc0ZjcwNGJhMi4uMTA1OWMyNjk5MGZlNmViMGQ3YWNkYWQ0ZDMzDQo+IDg2OTQ0
ZjQ2ZWE5OWIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtbS1waHlib2FyZC1wb2xpcy1wZWItZXZhbC0NCj4gMDEuZHRzbw0KPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5Ym9hcmQtcG9saXMtcGViLWV2YWwtDQo+
IDAxLmR0c28NCj4gQEAgLTEsNyArMSw2IEBADQo+IC0vLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9yLWxh
dGVyIE9SIE1JVCkNCj4gwqAvKg0KPiDCoCAqIENvcHlyaWdodCAoQykgMjAyNSBQSFlURUMgTWVz
c3RlY2huaWsgR21iSA0KPiAtICogQXV0aG9yOiBKYW5pbmUgSGFnZW1hbm4gPGouaGFnZW1hbm5A
cGh5dGVjLmRlPg0KPiDCoCAqLw0KPiDCoA0KPiDCoC9kdHMtdjEvOw0KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWJvYXJkLXBvbGlzLQ0KPiBy
ZGsuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWJvYXJkLXBv
bGlzLXJkay5kdHMNCj4gaW5kZXgNCj4gYmU0NzBjZmIwM2Q3NWRlN2Q2ZDNmYmIxYWRkNjVjNzFm
YmU4ZjI4Ni4uY2NiZmQ2OTczNzY5NjhlNDkwNTdmMTAyNTcxDQo+IGEwZjA2Y2IxOWU3MDIgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1waHlib2Fy
ZC1wb2xpcy1yZGsuZHRzDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtbS1waHlib2FyZC1wb2xpcy1yZGsuZHRzDQo+IEBAIC0xLDcgKzEsNiBAQA0KPiAtLy8gU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vci1sYXRlciBPUiBNSVQpDQo+IMKgLyoNCj4gwqAgKiBDb3B5cmlnaHQg
KEMpIDIwMjIgUEhZVEVDIE1lc3N0ZWNobmlrIEdtYkgNCj4gLSAqIEF1dGhvcjogVGVyZXNhIFJl
bW1ldCA8dC5yZW1tZXRAcGh5dGVjLmRlPg0KPiDCoCAqLw0KPiDCoA0KPiDCoC9kdHMtdjEvOw0K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWNv
cmUtc29tLmR0c2kNCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tcGh5
Y29yZS1zb20uZHRzaQ0KPiBpbmRleA0KPiA2NzJiYWJhNGM4ZDA1MjdmMmRlMDAyZDQ5YWE5NmQz
MGE2YWUyMzczLi4xYzQ3MmU5MDEyYzNhZDM0NDVmYzBiMTdlMDMNCj4gOTNhOWMwZTI0MzMyOSAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXBoeWNv
cmUtc29tLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1t
LXBoeWNvcmUtc29tLmR0c2kNCj4gQEAgLTEsNyArMSw2IEBADQo+IC0vLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwt
Mi4wLW9yLWxhdGVyIE9SIE1JVCkNCj4gwqAvKg0KPiDCoCAqIENvcHlyaWdodCAoQykgMjAyMiBQ
SFlURUMgTWVzc3RlY2huaWsgR21iSA0KPiAtICogQXV0aG9yOiBUZXJlc2EgUmVtbWV0IDx0LnJl
bW1ldEBwaHl0ZWMuZGU+DQo+IMKgICovDQo+IMKgDQo+IMKgI2luY2x1ZGUgImlteDhtbS5kdHNp
Ig0KPiANCg0KLS0gDQpQSFlURUMgTWVzc3RlY2huaWsgR21iSCB8IEJhcmNlbG9uYS1BbGxlZSAx
IHwgNTUxMjkgTWFpbnosIEdlcm1hbnkNCg0KR2VzY2jDpGZ0c2bDvGhyZXI6IERpcGwuLUluZy4g
TWljaGFlbCBNaXRlemtpLCBEaXBsLi1JbmcuIEJvZG8gSHViZXIsDQpEaXBsLi1JbmcuIChGSCkg
TWFya3VzIExpY2tlcyB8IEhhbmRlbHNyZWdpc3RlciBNYWlueiBIUkIgNDY1NiB8DQpGaW5hbnph
bXQgTWFpbnogfCBTdC5Oci4gMjYvNjY1LzAwNjA4LCBERSAxNDkwNTk4NTUNCg==
