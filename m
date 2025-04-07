Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021141.outbound.protection.outlook.com [40.107.57.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262E417A2F2
	for <imx@lists.linux.dev>; Mon,  7 Apr 2025 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024230; cv=fail; b=OSiRjDEg6EOmTYJbAJHKNsVTKLxp0RByz02ii2gs9KEMCthM3XCzBwIoLtPnIEMqtw0P836X+f6SvKzWJwAj/CZlFifHpnKjewiIyib5uDZCtXBf5wZkSjDnlTIw+XmGGieHf3FuhcsAQy9wEPTGuKLoGnlgvBQd8w+M2jKnwro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024230; c=relaxed/simple;
	bh=Ey0jc95l9Y+s2ElkRvj7Rb42j9MwjGJRtNWJJxmodfg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gZ5Q4IUiBaI/3VsZxz2zrqc8da4sxgmG1SSl9KN9Vd8wUV24GqQ3yDT5QLXGhkGpqQU4g7ffn7+RsNiYdoc6HFPcDIzHI/RyT5X+dEab9UsM5QgbE/UC+6kJtqt3+MaX2ycQTq1vbXwLFvo3Bhm4R1etvzArOEE+Pm7J84gm3ac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.57.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyeDNLYQxApVrxItyacWH/4qFM/zNXuMbAW03bFvYWXuvwkaGN1k6WgQWoUjEFNLRLc2K9rwesvQjrxHOW7StfggFxc1JfDUK68m8snpZdhCApT+hgw3Rif9iIse6L4hoqGOiRBZtIJXjg8QrZip25PUbdUMEgxi90d7HM/2xXcy/IviY2+lu3nDCuYXaluG9Mt83eoIfyKAJ01k5ORt4Vg3JoX4+K2vXnEDQPxumSWIvxe30XZ7tkO1Y6r4BqehYZMst+jAwQ2cHzQqaF9mbu3ngNL75Ix6UlqX0x3fqY3X7ch8vgEuUJTBaiyb4kRWwfyLVTQMu2KcEBD8cQmYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ey0jc95l9Y+s2ElkRvj7Rb42j9MwjGJRtNWJJxmodfg=;
 b=NC9SfSnWaLY0xJQlTiSea1nRsGyefoG6kwnNk1uOggYC9sdPe+Gdu4ILcrg+6N11lvJn4E8sQW2RNBd0DOCGrVdpJXg+iZEo2GALR2rE6wzjdKZy70rlfQHTt1sZpvrKynU2WTN+1/REhmg+gMSFbuIKl9FK4TDLgbmGOCWl62hB7uv9q3Ifvj4qrQnpiX1nmCelU9Ff6UjJXxsfbkVQMZ3zHGBDsKCEcYc8FOarIdhNo8YpHC+2Lqpb7F8QqzBA8aTJpEFXRDCy135iTWMpM0WUXoPhfaYX2ZZG+Z+vIQe11ZvXzi2m31LRwo/17t5PLp4SnmNnsG2cvB5khPVsHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0110.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 11:10:24 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%2]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 11:10:24 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Need Help Enabling HDMI on Debix Model A
Thread-Topic: Need Help Enabling HDMI on Debix Model A
Thread-Index: AQHbp61bJ8rSy9+zQkebTS5KwgzRBA==
Date: Mon, 7 Apr 2025 11:10:23 +0000
Message-ID:
 <PN3P287MB1829E84B6B79E9C7189D7CB78BAA2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB0110:EE_
x-ms-office365-filtering-correlation-id: eed83423-2733-427a-1542-08dd75c4cb3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?QbUd3CFIB35OpYJSobdQwTnCbDR8NFH7gBDw1NBx6SoMWZGVSNKZWddj?=
 =?Windows-1252?Q?aaVncL14rL/Es0fB9IdemmhwHJjd5UyvtSHKt8kB1p0g8lAN6BQ6ud8D?=
 =?Windows-1252?Q?KpnQUV/1F9xRfWDLDY5lomrb/PHqT5km35StSeE7MI5aaCKuHV2sdokY?=
 =?Windows-1252?Q?0HR6R37VIrwOgv3LqCL191gIq2kGHClsuJbB4wwfkuhlOKEuiHzifVvI?=
 =?Windows-1252?Q?VswT4/1lh5UuqtCGLCwwwld9/dkk7A8I3vjImvW5MdoAhC1W4wmfH33a?=
 =?Windows-1252?Q?2dn4Ao7SoSiWQpb7cVPDnYejPLTLmZd1QdOk8qZpPwNMfQux6E3vtg1J?=
 =?Windows-1252?Q?/NjlbYTE5F6ydtn4nNS/rUK0yndpxoQvgIdScRh3ak0EDmTs29Jq6pFj?=
 =?Windows-1252?Q?fbHmcl2cYTB4CxG7xqDEeiGeBdElCY26O8aOQLlsG9SmzumAbee7flc8?=
 =?Windows-1252?Q?LjQaM4CeN7HLwLUlvHvBCUwT3S2wmX1CLeU49r5kYprmthKh2iCD4HxR?=
 =?Windows-1252?Q?pyZQvEQBqatnWLPps4dbkcrhUPxC0je+70B3IpDsD3nHaYMiHM6FGXbH?=
 =?Windows-1252?Q?oaIUoQgDamkk0MbnFU8YO6pEDHb7m+YJRPMkTt5ceGVcylhhsVLgdwvb?=
 =?Windows-1252?Q?ctjd0X/LSOW4YGRpgOfT+0lIXIxaT5YNTPi27yodfIpF982FSa8wGUGx?=
 =?Windows-1252?Q?TT4dsUbKW+qutPy50BAONHHmzUzEgc77VdYpUgwLcbjLD+bdNGcbVnca?=
 =?Windows-1252?Q?jDho50eLS0ITmd/h6FB00+zZ/4IC7U8M+C3z+q4zXZmptv9tA+kJtwgv?=
 =?Windows-1252?Q?CZwGyJFo39GMWhvQL0xYLMhOJ9jFDKn8Ukj1J/aVowvSF4KMjsCbcHRT?=
 =?Windows-1252?Q?/jC7mWdDH8miqOdgH6BxG99NVkK4+35PGQBRDghPj9SP6NCp5cQKPTHa?=
 =?Windows-1252?Q?5gqIizgE5aQE9GieST2/GPIIVPhJjIF3JXwWyDA55yJiI7xht1WvBkGS?=
 =?Windows-1252?Q?eV0GUDz0bAoKzD6DIxmvdS9WAKwyC38fpYhMJYPXeLHp6TQv0r9JTrFY?=
 =?Windows-1252?Q?ngRz+wmCgzS8Ps3ahDOkvN4fqTW88EyM28xfDg5yVHubDZfHDdDXLxDJ?=
 =?Windows-1252?Q?7vxHnD2c2mNw1HwDG/RLzWg+zacCnQX/cM4EZls0AglhiQNzTaJRm3A6?=
 =?Windows-1252?Q?ayy+Lu6U0YqOCbQy6TLmxN/k+S1aYJndsRKoX4hbWqRWydsjXGDkNNX6?=
 =?Windows-1252?Q?2CKo/HWc1BoQsYJaSKQ+uvj6tywfUD8ciowJjwcHc2hGPU00+Ap/kWQ6?=
 =?Windows-1252?Q?MwY+Zph0IyKWZDXdcyVuhw88JO8JkR0BR2h9GX0Yi1yK2KIe2napkuVP?=
 =?Windows-1252?Q?w19IyjxDFI1vayeD7qZlqxEvXaKDRss/UoFJ4Rs/7ZSVI4XbohKyXjV9?=
 =?Windows-1252?Q?xa9zSXqurMvbq9vGq5ef0uNdtPA6OTEZsfbcVO8Bs6+/nKgZ36J5cf1W?=
 =?Windows-1252?Q?Vq/ZSQM9e9YdrDP1oD7Zd5wP+eMV7UppbfZGDD0Xru76EcwxnMPejVHN?=
 =?Windows-1252?Q?TuWDMV/8rjLK7d3l6TDB5eMorARB5y983t3kxQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?QwFdbL4sA26kOGSJAEcwTseCOHcFDUnam4eob7dW99FNTBBmdUEuACvx?=
 =?Windows-1252?Q?0UwbGUXFfnA4+gn3bII3aO/A4rmYeGy+rWepU63Ngzev6i9hJ5rPYrpu?=
 =?Windows-1252?Q?P1SlspIs9dIjxNekQVHzxDytff0stJ+t48iJ4PEfreCfNv69r0oAKMpj?=
 =?Windows-1252?Q?NyNqzkyf1yfAkN2WePwm2TxVoXTtYQ0tgwpKBparIVNJIezeuhm5SJLh?=
 =?Windows-1252?Q?fJ6MxWuJvCpvPtpA5F2uxYgpccfGG7V9qTgIntYRQxCpYB/BeuEbNse3?=
 =?Windows-1252?Q?iJ0UtjTupJOwlL0UVXS19oQ2TeKLQJiIKutUMEckkrqhwebXP2s+2oX0?=
 =?Windows-1252?Q?wZYQWJhRZG5NQXV52tcOVuOuKng4I/DY428qacP4NC2A4V+b5MOgPu6p?=
 =?Windows-1252?Q?unNIsRhluGTexc3WWjG7j4mMRqph6q2Kjy28QvZoL793OVkOYy9WXli4?=
 =?Windows-1252?Q?YnA+fnRWzE7qppXJxci6ljGlFNMUdwcyigaP0VqvfL+HzKh69TDY46Ui?=
 =?Windows-1252?Q?fFglV81FwROnwr2YW4yyNy8xsxyY6TfJmw1lL8vzYzime/QnqiZ4qGtv?=
 =?Windows-1252?Q?GW/rO553xCrAEpyq0qiR9v1XZwAQ27Xmbyv7PsHogpEQeuOHv0AIMOo7?=
 =?Windows-1252?Q?Sh5B8oCa7mLq3/H8rKRQ+eRKSq2YTz0pazw44XbAn2nC3xySFu0a+Rmh?=
 =?Windows-1252?Q?3dQ/k+RMao+jm7vpIzSp/M+QKvg9mygzXPs6dOdOVSkUfKy5eYWABJ0+?=
 =?Windows-1252?Q?QOhZpEIv4YU8LQ223h3FaVcdNnOIpWTSGDuoX2jePkUcShpGcpI9Hom9?=
 =?Windows-1252?Q?CFxKRQNFiv32iKCMZlIpMH1sC+dlvwnUwv803FteQ10dc40ZVxBOgEcm?=
 =?Windows-1252?Q?2xxnDs3Nyx98RadhbH8va22snrF8suoOu9yizdncleWLu/2BH/+Eo8/n?=
 =?Windows-1252?Q?gwHfN/vaVagRytHz7vm6koQlM0pIvlcT0mWidK8cwE/s+cbmHlt8TLCn?=
 =?Windows-1252?Q?KXIMQBl6kmD2/HP7cYZGKVh3U8OBGU15KJ2SCT5IIIjDIB1w16z+usm8?=
 =?Windows-1252?Q?HekNaMnFoQL0uKxPQSSypnTLwBIMeLcuplfaR1qxMvSHyruUcLsmkva4?=
 =?Windows-1252?Q?6fGuQIY88IRslgi5rJWixGiGtxXy0H3lv2MM+Z6TwR33erzY049CgxrX?=
 =?Windows-1252?Q?XJ7Dz25FyNBPxRug4xj3HFpDehUGyDZplJ+PZBP5FL+7xWaUuzkOMT0i?=
 =?Windows-1252?Q?6+08ZT9R8iBjqOAz92hrn8/+P2GL0PQqQrrTj5lBXorcjfnRorAIZ5m3?=
 =?Windows-1252?Q?cpC0uBPKs/NqsRRgmFFD/AddVON1oDPbOoXQbNMsGz+uHAJ87cyfEc08?=
 =?Windows-1252?Q?LzRBcDR3NSOPQumZmWfU1JrEMif13wOv1o1H0fXlIYfU9NcfgvDz/LQ7?=
 =?Windows-1252?Q?mJ4gS830K2Th5rpCBh8Bvh7YEf62jASdoyMYDUCFyCbw7VKurltRk1mb?=
 =?Windows-1252?Q?M2Y2AcPSGZfI2XGZ+HBfunzrdVl0SLJuZcIJZZj1Fsbu7FlQyVdESdfg?=
 =?Windows-1252?Q?bNEM0Upb9zJUlKjc9vwf3HuYnm9RKI7Lqk9KsToXQZAYUHm2ZuzRMSBa?=
 =?Windows-1252?Q?Er5QWwCswPJ2NCQvt5CynJcTDHzaO0n7YGcS62zS9g1q22vljxLkCn47?=
 =?Windows-1252?Q?mixRb+Laa9UW+9qZeSFdD0jViKcjkhd7sgUnoP/wL1lpF0O2As0hxQ?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eed83423-2733-427a-1542-08dd75c4cb3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 11:10:23.9908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zs5Z9q8J1QDy0RB9SkaIXL3xTlHLKm37+u+R6uHs9QqdjTZa1AVNnuf/dUBpejZ1sLKde56uA5Krlls1ppHMNNxs3V+O8c/gphEy13Q6GbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0110

Hi Laurent,=0A=
=0A=
I=92m trying to bring up HDMI on the Debix Model A board using the=0A=
mainline kernel, but I=92m currently facing issues.=0A=
=0A=
I saw that you tested the patch for HDMI support on this board in=0A=
mainline, so I am hoping you could help me figure out what might be=0A=
missing.=0A=
=0A=
To clarify =97 I'm using the prebuilt image provided by Debix, but I replac=
ed=0A=
the kernel image and the device tree (DTS) file in the /boot directory with=
=0A=
ones built from the mainline kernel.=0A=
=0A=
I=92ve enabled the following configurations in the kernel:=0A=
CONFIG_DRM_DISPLAY_CONNECTOR=3Dy=0A=
CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=3Dy=0A=
CONFIG_DRM_IMX8MP_HDMI_PVI=3Dy=0A=
CONFIG_DRM_IMX_LCDIF=3Dy=0A=
CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY=3Dy=0A=
=0A=
When I boot the board, I see the following HDMI/DRM related logs:=0A=
debix@imx8mp-debix:~$ dmesg | grep -iE "drm|hdmi"=0A=
[=A0=A0=A0 0.121979] /soc@0/bus@32c00000/display-bridge@32fc4000: Fixed dep=
endency cycle(s) with /soc@0/bus@32c00000/hdmi@32fd8000=0A=
[=A0=A0=A0 0.122164] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dependency cy=
cle(s) with /soc@0/bus@32c00000/display-bridge@32fc4000=0A=
[=A0=A0=A0 0.127417] /soc@0/bus@32c00000/hdmi@32fd8000: Fixed dependency cy=
cle(s) with /hdmi-connector=0A=
[=A0=A0=A0 0.127608] /hdmi-connector: Fixed dependency cycle(s) with /soc@0=
/bus@32c00000/hdmi@32fd8000=0A=
[=A0=A0=A0 1.947962] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HDMI TX cont=
roller v2.13a with HDCP (SAMSUNG HDMI TX PHY)=0A=
[=A0=A0=A0 1.949220] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered DesignWare=
 HDMI I2C bus driver=0A=
[=A0=A0=A0 1.956365] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display=
-controller on minor 0=0A=
[=A0=A0=A0 2.016601] imx-lcdif 32fc6000.display-controller: [drm] fb0: imx-=
lcdifdrmfb frame buffer device=0A=
[=A0=A0=A0 8.380915] systemd[1]: Starting Load Kernel Module drm...=0A=
=0A=
=0A=
I also checked that the display's modeline is recognized under sysfs :=0A=
=0A=
root@imx8mp-debix:~# ls /sys/class/drm/card0-HDMI-A-1/=0A=
connector_id=A0 dpms=A0=A0=A0=A0=A0=A0=A0=A0=A0 modes=A0=A0=A0=A0=A0=A0=A0=
=A0 subsystem/=A0=A0=A0=0A=
ddc/=A0=A0=A0=A0=A0=A0=A0=A0=A0 edid=A0=A0=A0=A0=A0=A0=A0=A0=A0 power/=A0=
=A0=A0=A0=A0=A0=A0 uevent=A0=A0=A0=A0=A0=A0=A0=0A=
device/=A0=A0=A0=A0=A0=A0 enabled=A0=A0=A0=A0=A0=A0 status=A0=A0=A0=A0=A0=
=A0=A0=0A=
=0A=
However, there is still no HDMI output on the display. Instead,=0A=
I only see a white blinking cursor on the screen.. I'm not sure=0A=
what I'm missing.=0A=
=0A=
Could you please help me out or point me in the right direction?=0A=
=0A=
Thank you for your time.=0A=
=0A=
Best Regards,=0A=
Tarang=
