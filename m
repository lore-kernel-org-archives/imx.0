Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2084.outbound.protection.outlook.com [40.107.241.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676FB1EB36
	for <imx@lists.linux.dev>; Wed,  5 Jun 2024 02:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717553941; cv=fail; b=YrFAUyS1WdAW3EzXDAf7hq73s2Sanwp213ANlLESCptzG9WEDzaBSQdO7CBVzxASxvfhIHeLkVVKslvJRnni1zzlMjeN1qFmh06b+npIHm4U7HN7AXBxuqkTzYnsZpotgCZyCbXFOW2LtdU0j2NFTduBiTFDBYMalwUcmBL8Hck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717553941; c=relaxed/simple;
	bh=g+o7PqaAAz6g51DhI6Ed0cFGVzwxIj7vd0wpi8urgpQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NWqDkHghuzAh+/kN8+i1UCM4DWedSdjl3JnmsA5n0Azi2kgdQ45OCxrwyYsPNx8HBUc6u16qN7JExNjmJHMrGiJ9VzQabyHIXm/m0E8eDLdHjYuQ2vvrJeyAaA+ciGS9Nnkg1W18sjsf6H+PKxA+qrrB71gQz1yQKwXqbLyOVgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=UkXArFGe; arc=fail smtp.client-ip=40.107.241.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="UkXArFGe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbdu1xdTtxQoKmRq31tvRCk9GCwQ4UnKldySPnpGi7GuqivNKQ3yjxf3hNdvZVgKtWlhPi2VSCVss5uFpiPGWYa/Jcb+gcYgyhNHZUkcRfVWkTy4HplPdxLd1L6EDE+/6URH64nN0i+SQAihRjDyFbd+sD7HP13JXqb6rNgpaDh7zf8XfUWaRDM/cgMBh4wosyUF0O1jvMTiTu3DvcHQmm7vzjKChwcjsdfUb/Jr5jrVqkjoymK1BrCZHIPGbgM2bh/hC9v87uQRzKR5LB16vqU1to409+DBvkcexo+4TMToMi/CtMLzq6jTELBzt8j7nnvbi8vfyc8ZclBSp+yd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+o7PqaAAz6g51DhI6Ed0cFGVzwxIj7vd0wpi8urgpQ=;
 b=ep292ME6NtlUN8PJ6/8NXdG8hy3f2V0Fb5F94lgbh3nj6UGIYCSOotIqUYEzJty45xU0VLUZPQ/4+/3NIN2L//IsGYun+yhWtZc8GRpaYU31PcpJBzjg8cw2Qyh3oDflwEK4uyDM4B+7hlRkJ7s+SjXhyQdaCft7Kl6BigRneVBS8jiXhT2l3ZPDrInHJNrGspypkb+Qun1mJZZnkOSD078Cl+KfbdknitvY0JEEj8W3jyBv5AmIyxiq+tmfkSehkAPjY1ty8I6liVgciO6shy87ZWZRn74Kd6+AXSLwmRox9HNsdtsLDe6IbR0yxUwa6HCooIjmuU3vWtXLs1IRNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+o7PqaAAz6g51DhI6Ed0cFGVzwxIj7vd0wpi8urgpQ=;
 b=UkXArFGeW+sQgatOFOPcAfbuuzoZr0FyZhpXn+lWG8dRmdsp7YeDS15c9Q+cl27bGHBphAbE2y6C8hreOSi+0b8QE+wu+rEOHkNl70UfKqTPZJa3IlIsFT1TcY3q05RJo0xb2s7kc2OVUPUORfUyt7VS18lR4wHbs+DgP1a47KQ=
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB9175.eurprd04.prod.outlook.com (2603:10a6:20b:44a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 5 Jun
 2024 02:18:56 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%3]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 02:18:56 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
CC: "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<imx@lists.linux.dev>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: RE: imx93-11x11-evk: SD card is not detected on 6.6
Thread-Topic: imx93-11x11-evk: SD card is not detected on 6.6
Thread-Index: AQHasWbRjLM4mkhcH02QWFHZxMrbU7GtitMQgAD4vACACS0hgIAAQmoAgACHAvA=
Date: Wed, 5 Jun 2024 02:18:56 +0000
Message-ID:
 <DU0PR04MB9496D1E83618D010480E037C90F92@DU0PR04MB9496.eurprd04.prod.outlook.com>
References:
 <CAOMZO5B0+jkaPo_6VKXVGb6SMAa78jLVQU3xUt92BpkAzc5AnQ@mail.gmail.com>
 <DU0PR04MB949617775A095B8DE513D97690F22@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <CAOMZO5B7Zm1RXRLXs=_Re_onUam=RCy_QYUkEtGz+qvKmz=7Ow@mail.gmail.com>
 <CAOMZO5B4cuE5QMkjdWnTJFCs8kY_cK0q5O3xujnetfCfmJQHSg@mail.gmail.com>
 <CAOMZO5BbmTTQ8OAPg8jE8-CB94VmjBB+9+9vmDtQYkL_BBK5Wg@mail.gmail.com>
In-Reply-To:
 <CAOMZO5BbmTTQ8OAPg8jE8-CB94VmjBB+9+9vmDtQYkL_BBK5Wg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AS8PR04MB9175:EE_
x-ms-office365-filtering-correlation-id: d84be5a2-8a3d-4cd0-efcb-08dc8505da1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?SmpaWGhBd3Z6di9YVjRHeUd3amJyUlRMcm9yWlM0a2paUk5YbzJkdmUxZ3Vs?=
 =?utf-8?B?cmtBcjc0SkllNDlCZGx6WlRONkNXSVp5UWh1MGdTUEQ2RFVYaUptUnM4M1dm?=
 =?utf-8?B?VkErOHh5OGcvRmtlbXdHQ0Vla2YvSjNtYnlqUXUzdHkyakxtY0gxdjhIY1NE?=
 =?utf-8?B?bmNmS0FGUGJpUmtTVDJWOFlyL0RHRkt6SVZ1VWtWWTFtQk40cTRVZUF3eitV?=
 =?utf-8?B?Ujk1T0RqRFQ0a3RhT2J6ZDFteGoxV2R3aHlkZFdiaVZ5MFhLZFZLLzN6eVJn?=
 =?utf-8?B?S3V5a2s4K2ozOVdkVnFLR3ZGdFNEbGNCaHIxYUREcEh4Z0tYZTRuV1ZZWXhI?=
 =?utf-8?B?MEJNWHZUcDBmMlloRXh4bHlGRlVVd1dVdVZKR3B2SGg5R1VQQ1JkTzNWdUt2?=
 =?utf-8?B?V1B4MUJRd0lvSHptdHphYVpzTkpGWkVBZ3pIelY5dGFFenlIRWx6SGd6bC8v?=
 =?utf-8?B?WHg0QU9CZktEMXVtYmRLbkc2TnFKS0lqdnFPU3FNZnNjbGtpU2gyWUVUbGk5?=
 =?utf-8?B?akdQRXRtMkNjYmhpd0I0QzhobC8rMGtPOEEwZjlwUlZXOENJR3BVTjBMd3FW?=
 =?utf-8?B?ME1vRDhadmVQRUpDMW9XKzNaaDNyWDhCWEhiKzFJWlc4MFJveVM1dHlad3Va?=
 =?utf-8?B?MWlpMmVFMHFoVTlpQ0JoZ3lySWV0U3QrQ0FpUC92MXlzRWJwUldWbEE4SWJV?=
 =?utf-8?B?eXo1Q2lPSFFMSWtVMFplcUtySG5uZWdxWlV5cWtzMWVyWVk2TFMwSGJ5WTlK?=
 =?utf-8?B?Z1JTZUd1dVNuSTd3UWtLa2tpM2s2Wng1NWRvblhTRE0yZUxmU1Q1aEdYbENm?=
 =?utf-8?B?Z1NNSWoybWtYci9Da1FNK2JxT3BtVFoyOGVoRzVqRXpET2wxQmhGcDl3dFdw?=
 =?utf-8?B?eWo0d2J5bHprWEVTdldOS0xMZGtWb0VFWjJ0UzJHVGR2NzM4VmU2UXF0VGRs?=
 =?utf-8?B?QjgyTGVkRVp1T1VwZUhGeDAxYnArWTh4RnNIZnlaVWxPUHdNeTRJcFIydzVP?=
 =?utf-8?B?ZU5sM3FrbStBTnBWcmF5Y1ZzdUtKWVJlcVcrUVZEWHlLdWRrQTBLN0V5MkRX?=
 =?utf-8?B?aXI0V1g5OXhGVFgwVjZxYU1SR3hIZkVzdFQzbVVwYlgwTXBua2s5SkY1aHcv?=
 =?utf-8?B?SjdKcGxXbTBPeDJ4Tm9lM3VHR0hzVlRoRUUzOHRmRnN0M2hCRFVuL0hHaGJl?=
 =?utf-8?B?OFhoR1lkOG52aTI5eHNqTTJOcVpZL3Q0YlZDeGh4NFRPZmJRZDlISDdVOG1W?=
 =?utf-8?B?OWJMRGlnQTRkQWh2NStMZ2Q1N2JZRFN6aFA5cHJaWk5ZdTZ5cFZZcFRYU3FZ?=
 =?utf-8?B?TDhaalRuUTN1aVFqN2dCdzRoeGJ1aXRxWUxoSFFMMmQyKzd6amlRSHFFSWZJ?=
 =?utf-8?B?OGU4a2JKWmJlc2hGMzlNREJNL2hZdHI3aS9vamNueWVSMFJ0ek1CanI5cHpE?=
 =?utf-8?B?TUVYc2NXdWxRMFkxYVE5TVZoZ1VQQzFZYXgyaGRLNVZpZW1mUU1lZzExOXB2?=
 =?utf-8?B?VDdwNEZsTytPOXVZS2hmdXREcG0zell2S0tCOXNxQkxMSmFFeHdLRlpjenV5?=
 =?utf-8?B?WWMvWThGRUJ2QkxsTkErcmxQdHlqZFo4K1ZDaE8xcWtDOWhPcmRSWG5LUFVx?=
 =?utf-8?B?YTJOSjNXSkVFUm4vNWZ6dEJYYktzeS9VUjhveUxiSkdCNVM0eHJiRzFRUUp2?=
 =?utf-8?B?dVdBblhUUTN4Z0paVk5SRlNUd2kwQ3ZTTVoxVVVGalRUUkpYVDFFNkVRUjJk?=
 =?utf-8?Q?PBb5Qm+QudDdycpn4b/4WsjK4UDFSh4Rll9eqxY?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UzdoWEExT2VPb1BtSDZFa0UvQWt0anljOEVUSnJoMWhUZXlXRkRaL1g0M1lQ?=
 =?utf-8?B?ekRYR1ZPUzltdGtNTEdvYnNjWGY0cnlFanRIaktiOTlrckF6dGZQRmdoSmd1?=
 =?utf-8?B?dUtIS3VLblZYVlJpWUhzV3RESlB4RjFPOVhRSXMramQrSVltby9Ld0FEUTFk?=
 =?utf-8?B?aWpaYXpvNndCb1ZVeWhUeENlbmxXZ29uNmlCZGFGNHNUclNWT1padFhqZEZp?=
 =?utf-8?B?NmJWWC9FNUF5YW93bVdlcEZET0hMakQ4QXFjcmFVYVhFakdKQytWcnZTbGhu?=
 =?utf-8?B?OGZ2NWVLZDdvZzlESnRqUmJXVjdZYTFUOUpyL0Nhcm0rQytzeEkvZW1vSTE1?=
 =?utf-8?B?Wm1EQUZhM1BFU1h6MjRzTXFQWUdHRVprM3lGRnhOcEgyTW4vWjNBa3E3VEpj?=
 =?utf-8?B?SjNmdjl3ZWd1M3dCSkhPa3hBNlBqNDFxYVlhczliQVExaXExOU1OYmdGNmt6?=
 =?utf-8?B?QWpIbk9GTHQya0FMK3VFSEdrM0UweGFwdlBNNXh2U0xERDlZcnhWRmw4aCsr?=
 =?utf-8?B?djJEMmlMVnBxU2lpZ0FMMHFuSmp1dC9UNWdpa2IwYWcwWEgxRGY0YUtXeWda?=
 =?utf-8?B?MHBOblk0blE3dTBicmFmRGR4bXcvT0RKdzVHa2huNlJrMkRkaEhOTmJpUm1E?=
 =?utf-8?B?M0E3cWhLYWowWStVd0s5ZHNrcHA1b0Q4VmRqa2J1QTdQSHdvQ1hSZkR1dDY0?=
 =?utf-8?B?K1RJMlpMT2tJSDFpZFhHa004NHNQSjhkUEtIa1lRTERneHd6YU9KSmRmSVkx?=
 =?utf-8?B?THB0Z2luZkZmbzZib0NqcHlGajRxNXFCajcwY25IY2Vkem5mNFlYWEpOMmtS?=
 =?utf-8?B?akxEV2wyUzBWdnBwQlZJMllWb2hiKzB2dGl3T1FKN0lidFh1dFQrZy9oaGJH?=
 =?utf-8?B?ZC9FRDRyejZTN09BVFpWK1hLNUROUllqZjRZWEp3cGR2Zi9xM3Zqb3dFVlVz?=
 =?utf-8?B?Mm9wai9TMUFsSkNtSG9PS0ZuNlJxajdOY3lPdGFIV2RUT2JIaVJhZDNpRm5q?=
 =?utf-8?B?S3FDdHoyaVZSQzdjc00rVnFnWGRZRitmbUVaamIyVGp3WGxxOWN3YVk5d05J?=
 =?utf-8?B?TzFSczZDM2crUW85WW8zdjNOenVBUk1iaHdoV0p2NHhIcUlCTHIxM3ZMV0Rz?=
 =?utf-8?B?bkY4NHYxZUhmdmI5U1ViS1hyZWliZnd3N3N4a012VmhwVk44ZFRNMWFQWGZX?=
 =?utf-8?B?VnBrVGM1QU53ZzBkaGJTSk5OeFhtQm94Zy8vNkxUZnhIVE1NblpIWXdHMWJK?=
 =?utf-8?B?VC83UmVBR3FOZ25ZNElrT0o4RS9WMzg5ZVdQZ2IzeGJxK2hXMjlsZTY5aVhH?=
 =?utf-8?B?T0IydWYzbGxWV2RIT3JBVlNJNnNKb040ZUlSMXZCVVJ0YXRvY1pPUS9VL3h4?=
 =?utf-8?B?ODBWVzA1eEYycm13UzhGd2hHR0s4Z2U5NkVwU1lvc2llZHNUbGdEMVRxOE1B?=
 =?utf-8?B?ck83dHBjWjM3bEpCRmdBeXhqZDRicDhhbWcwUm1nelV4VTBTUEdaZ2x3N2VB?=
 =?utf-8?B?elpSenFyUEtkYXRBZ05MUlROZWNaRmV0UGRIdTFqcVJYd0hVR1lUVzdGSHJT?=
 =?utf-8?B?VG9Hd0hqcVFCZnhYeFpoTC9NSUlJMGd3V21rcm05WW02YXROYnRPdnY0VlZs?=
 =?utf-8?B?aE0vdWVUZytMMk5mY2ZKUlVRVEFrSVJtTmROdjIrT2k4VlB0bzBCRXdVMitq?=
 =?utf-8?B?a0svN1F5dnlmS2hyYkJHanpUeEVpMHVaTzBrRGU3QXpROVFzcnh5NE55WHhW?=
 =?utf-8?B?a0x1Y3hxdVFvZTdRM3FqVUtFdkNKbjZLRnN4L1JLY2Rhb1hnblowaXlhQTZH?=
 =?utf-8?B?bTBIRFdIb0FBK3pHV3A4UUhUK0xKdEk2d3VtTVdvWmpoS0dac0VUQmZEZCs5?=
 =?utf-8?B?Q3lkR3NaRWo5bmpnZzRDOG5VOERnb3hrc1Z6VVRRZktaL2p5MFpYMjJhZTdq?=
 =?utf-8?B?VWFVY2EwS1lUUTB0Sm5VUFp2a01hRGVvc01sdWFYUlpCRUZnVnJ0QnBrZ1ln?=
 =?utf-8?B?OTErclNUdnh2QUJ1Ny9WSjdsamY0QThMWGJKOWRhYzIyN05CRUlXeGhXWDVJ?=
 =?utf-8?B?b0VEOXFWL3RHQkpIL3FCclpGWXJjNm1hNDkrcTNXL25rQ2Z3dllQVWFuZmU4?=
 =?utf-8?Q?d7lA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84be5a2-8a3d-4cd0-efcb-08dc8505da1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 02:18:56.0393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LliLvYvoCoPHpIf3ZzZNnyRJJPE4yuR8UcpbXfK1WmaShYDPzIMJ9jSf0RlvteVIPX4x2tsd4pFdq8gEWdMM6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9175

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGYWJpbyBFc3RldmFtIDxmZXN0
ZXZhbUBnbWFpbC5jb20+DQo+IFNlbnQ6IDIwMjTlubQ25pyINeaXpSAyOjE0DQo+IFRvOiBCb3Vn
aCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+IENjOiBvcGVuIGxpc3Q6QVJNL0ZSRUVTQ0FM
RSBJTVggLyBNWEMgQVJNIEFSQ0hJVEVDVFVSRQ0KPiA8aW14QGxpc3RzLmxpbnV4LmRldj47IG1v
ZGVyYXRlZCBsaXN0OkFSTS9GUkVFU0NBTEUgSU1YIC8gTVhDIEFSTQ0KPiBBUkNISVRFQ1RVUkUg
PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4NCj4gU3ViamVjdDogUmU6IGlt
eDkzLTExeDExLWV2azogU0QgY2FyZCBpcyBub3QgZGV0ZWN0ZWQgb24gNi42DQo+DQo+IE9uIFR1
ZSwgSnVuIDQsIDIwMjQgYXQgMTE6MTbigK9BTSBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFp
bC5jb20+IHdyb3RlOg0KPg0KPiA+IFRvZGF5IEkgYnVpbHQgNi42LjMyIGFnYWluIGFuZCBjb3Vs
ZCByZXByb2R1Y2UgdGhlIHByb2JsZW06DQo+DQo+IFRoaXMgY29tbWl0IGNhdXNlcyB0aGUgcHJv
YmxlbToNCj4NCj4gaHR0cHM6Ly9naXRodWIuY28vDQo+IG0lMkZ0b3J2YWxkcyUyRmxpbnV4JTJG
Y29tbWl0JTJGMDRjZDQ4MzExNzQ2MjJmNTQ1ZmM3ZWU3OWVhZDM4Y2E3ZmYNCj4gMDRjMGMmZGF0
YT0wNSU3QzAyJTdDaGFpYm8uY2hlbiU0MG54cC5jb20lN0M0MWM1MWFhYWQ4ZjI0NjNlZTZhYQ0K
PiAwOGRjODRjMjFmNjElN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0Mw
JTdDNjM4NTMxDQo+IDIxNjQ3OTM2NDIzNiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpv
aU1DNHdMakF3TURBaUxDSlFJag0KPiBvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2
TW4wJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT04MyUyDQo+IEJPc3RTN2pHJTJGd0xMUmt5c3B2dGtI
ZGQ0ZURKcnd3NzVXbyUyQmxSJTJGcmVZJTNEJnJlc2VydmVkPTANCj4NCj4gSSBhc2tlZCB0aGUg
c3RhYmxlIGZvbGtzIHRvIGFwcGx5IHRoZSBmb2xsb3dpbmcgZml4IHRoZSA2LjYgc3RhYmxlIHRy
ZWU6DQo+DQo+IGh0dHBzOi8vZ2l0aHViLmNvLw0KPiBtJTJGdG9ydmFsZHMlMkZsaW51eCUyRmNv
bW1pdCUyRmE3M2JkYTYzYTEwMmE1ZjFmZWI3MzBkNGQ4MDlkZTA5OGENCj4gM2QxODg2JmRhdGE9
MDUlN0MwMiU3Q2hhaWJvLmNoZW4lNDBueHAuY29tJTdDNDFjNTFhYWFkOGYyNDYzZWU2YQ0KPiBh
MDhkYzg0YzIxZjYxJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3
QzYzODUzDQo+IDEyMTY0NzkzNzgwNzIlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lN
QzR3TGpBd01EQWlMQ0pRDQo+IElqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1u
MCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9eTFpMg0KPiBabCUyRkpvZ3JocmxFY1BVRTdwV0hYN1Zk
b1Z4UFYwZ2xkZlRzJTJGc3BvJTNEJnJlc2VydmVkPTANCj4NCj4gV2l0aCB0aGlzIGZpeCBhcHBs
aWVkIHRvIDYuNi4zMiwgaW14OTMtZXZrIGJvb3RzIHN1Y2Nlc3NmdWxseS4NCg0KSGkgRmFiaW8s
DQoNClRoYW5rcyBmb3IgZGVidWdnaW5nIHRoYXQsIEkgd2lsbCBrZWVwIGFuIGV5ZSBvbiB0aGlz
IGZpeCBmb3Igc3RhYmxlIHRyZWUuDQoNCkJlc3QgUmVnYXJkcw0KSGFpYm8gQ2hlbg0KPg0KPiBU
aGFua3MNCg==
