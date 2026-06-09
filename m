Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C2136897E
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 20:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037600; cv=pass; b=gtqSz+w599cSofg6ocgOEhkUHT/+IH4pmyStTx+1HvIEeDPDZUe66DoPLiMVVk/Ig6ozR39/jlLvyp4Cy8AZdLwxjJT+DeWbHaiKwXdfxX7v+BUmsSI3ff18DKsn5XNRpVKSkXJ8lV3zHTiN5DhaD2fNBsOoph+wv8m55/uitVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037600; c=relaxed/simple;
	bh=SQ4EKhSiwdW2m9zPBFJmKKyZiDpxnfusfBXNXXgOVM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwDef/RCpAF+qIgcjuztilTeQzkQOzDlMPL0b/0WFVwlLeZc2GC1ov8Z9fBnoWx8j5Ldv9Xmro+vBCqdC+F16/WQaLSlt4mp0WoUObWPS7o4fWFb60QIJWQuYUPAEY8dKTC7PbHkJ9UwVA8Twf/CZqiJWiUU/QLE0Y8j1ydvhb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=QhF1JVdr; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=mGxgiW0H; arc=pass smtp.client-ip=185.56.87.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="QhF1JVdr";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="mGxgiW0H"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-ngbh.prod.antispam.mailspamprotection.com; s=arckey; t=1781037597;
	 b=ko8rrK+c8APFWK7PvYW+ReboOWIp19L5vCVVa1LROR70K/GRxvuIzcH5ga8BFyJWiRJFsyHiZ3
	  kEnoKnp2JmutzONSDugjfdQVzuZpR1TqYgnax4Qr6tQJAeWgHE1lJKjkWza+shSJKEhxiQK5d0
	  tY/l33Nzpw1cidv9x0hkv4MSFbnT/n5wFtrqbuLccs6+xtMN1oQddnki9rSAmdOiPxFkZzxRZv
	  6oEMt7cjo/mYpCnZg0qCX+tY3SKhFZl3ofBpBTPFsOSpXOOSjkKwnrWspFtDYmaKATeC4zgvlX
	  rI9AIu5R2J/4QGBtvfO/P6PWQ0ON6sT8/gih0mTcPM8rqA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-ngbh.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-ngbh.prod.antispam.mailspamprotection.com; s=arckey; t=1781037597;
	bh=SQ4EKhSiwdW2m9zPBFJmKKyZiDpxnfusfBXNXXgOVM8=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature:DKIM-Signature;
	b=q6+l7Tyq3A45FReuYCrpVEg7nAfesQQPHjRRipx/jpBoUnRlUKd0aDohIXFYXlNEVHBzcv8Idw
	  QvARC7+F3i1Y+uq39eme7CfIb/X7aLSPPSzQcfPv4J1gUXK0yJ/OonweEfQMWf3Kzv78pdHwkP
	  ZPQJQtV/7rl6bupYEGGOI9xCUbRQZZ1lrMjvA+U7tM5kuIkWpkeNKBBsz9Rns3xnR6kXMkUpBx
	  XFFhPSLyQ3eYZiEbXn6zf4+lQoYI3NOrYigVeoSrmHoh7mi+Zv40K3UoSWIPxBbZEtpxo1Fx6u
	  nkKbdWb6jUsyGY+7lH54ZllrEL+jfK452Y2y0FlUT/hLsg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Reply-To:List-Unsubscribe;
	bh=/CB3uqN+m7C8S/hlT2WiZWa5WYAgtzsD/nbEWBLMncI=; b=QhF1JVdrRyXau7LFiiFigjcub+
	JVOAYz7+29m2rMiGmNF50Bu9PF/OCu8v0mhvAhhNDIkilFiqNLL401ecoLDjzpijq5ChQxFhpaq2p
	ABFyX3IV+/6IeKKdhvmDzWTp4v7Ep7cJZLg00+zHZbu6HUt012GhHajP9XEOuULszTb4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-ngbh.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <francesco@valla.it>)
	id 1wX3Ei-00000008GAh-0PPj
	for imx@lists.linux.dev;
	Tue, 09 Jun 2026 20:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=/CB3uqN+m7C8S/hlT2WiZWa5WYAgtzsD/nbEWBLMncI=; b=mGxgiW0HLd56ARsb448DjEhxTl
	YY/dJOylCz3UmiQSzcTqix8Dnx1fm27hErHNngSJ3m5WjS74Ppog2uePEzTAh7zmr0FGpdnh/2pWd
	2368AnWdWTCS0X+1efQ0XAHr/zxQB+hrpHQbRW9TuA2Mu93IIDSdQmYS+P1vSD0I0qSE=;
Received: from [95.248.69.182] (port=60980 helo=bywater.localnet)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.3)
	(envelope-from <francesco@valla.it>)
	id 1wX3EN-00000000JTf-485z;
	Tue, 09 Jun 2026 20:39:28 +0000
From: Francesco Valla <francesco@valla.it>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 steven.yang@nxp.com
Subject:
 Re: [EXT] Re: [PATCH] arm64: dts: imx93-11x11-frdm: enable additional devices
Date: Tue, 09 Jun 2026 22:39:27 +0200
Message-ID: <qRn4DwQ2Twuq6ao1_CO5YA@valla.it>
In-Reply-To: <db95fec5-d8ac-4d52-ad2a-75e5593f99ef@nxp.com>
References:
 <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
 <_j4Ik3AsS5yfKb4Y7cSB1w@valla.it>
 <db95fec5-d8ac-4d52-ad2a-75e5593f99ef@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 77f24b8dcaa993a95263856856382abf
X-AntiAbuse: ID - 77f24b8dcaa993a95263856856382abf
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1wX3Ei-00000008GAh-0PPj-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-ngbh.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Joseph,

On luned=C3=AC 8 giugno 2026 07:14:24 Ora legale dell=E2=80=99Europa centra=
le Joseph Guo=20
wrote:
> On 6/5/2026 7:36 PM, Francesco Valla wrote:
> > Caution: This is an external email. Please take care when clicking links
> > or opening attachments. When in doubt, report the message using the
> > 'Report this email' button
> >=20
> >=20
> > Hi Joseph,
> >=20
> > On venerd=C3=AC 5 giugno 2026 10:59:08 Ora legale dell=E2=80=99Europa c=
entrale Joseph
> > Guo>=20
> > wrote:
> >> On Thu, Jan 15, 2026 at 06:11:34PM +0100, Francesco Valla wrote:
> >>> Enable additional devices on the i.MX93 FRDM board:
> >>>   - CAN port and associated transceiver
> >>>   - Bluetooth portion of the IW612 chipset
> >>>   - WiFi SDIO port
> >>>   - user buttons
> >>>=20
> >>> The WiFi portion of the on-board IW612 chipset is still not supported
> >>> upstream, but since SDIO is a discoverable bus it will be probed once=
 it
> >>> is.
> >>>=20
> >>> Signed-off-by: Francesco Valla <francesco@valla.it>
> >>> ---
> >=20
> > [...]
> >=20
> >> Hi Francesco,
> >>=20
> >> Do you ever tried bluetooth feature? The bluetooth failed to scan with
> >> 'device-wakeup-gpios' property.
> >>=20
> >> Regards,
> >> Joseph
> >=20
> > Yes, Bluetooth was tested using bluetoothctl, I just briefly re-tested =
it
> > with latest master branch (7.1.0-rc6).
> >=20
> > Can you clarify what you mean with "The bluetooth failed to scan
> > with 'device-wakeup-gpios' property."?
>=20
> Hi Francesco,
>=20
> If 'device-wakeup-gpios' property is set. The bluetoothctl can work, but
> errors will show up if try to scan the bluetooth devices.
>=20
> [bluetoothctl]> scan on
> SetDiscoveryFilter success
> Failed to start discovery: org.bluez.Error.InProgress
> hci0 class of device changed: 0x000000
> hci0 new_settings: bondable ssp br/edr le secure-conn cis-central
> cis-peripheral iso-broadcaster sync-receiver ll-privacy past-sender
> past-receiver [CHG] Controller 20:BA:36:5C:B0:D8 Class: 0x00000000 (0)
> [CHG] Controller 20:BA:36:5C:B0:D8 Powered: no
> [CHG] Controller 20:BA:36:5C:B0:D8 Discovering: no
> [CHG] Controller 20:BA:36:5C:B0:D8 PowerState: on
> [bluetoothctl]> discoverable on
> Failed to set discoverable on: org.bluez.Error.Failed
>=20
> After remove the 'device-wakeup-gpios' node. The bluetooth can work
> normally.

This is not my experience:

[bluetoothctl]> scan on
SetDiscoveryFilter success
hci0 type 7 discovering on
Discovery started
[CHG] Controller B8:F4:4F:AA:9D:1C Discovering: yes
[NEW] Device C4:DE:E2:52:B9:96 BWT Perla BLue 16L 0025-003A

[bluetoothctl]> discoverable on
hci0 new_settings: powered connectable bondable ssp br/edr le secure-conn c=
is-
central cis-peripheral iso-broadcaster sync-receiver ll-privacy past-sender=
=20
past-receiver=20
[CHG] Controller B8:F4:4F:AA:9D:1C Connectable: yes
hci0 new_settings: powered connectable discoverable bondable ssp br/edr le=
=20
secure-conn cis-central cis-peripheral iso-broadcaster sync-receiver ll-
privacy past-sender past-receiver=20
Changing discoverable on succeeded
[CHG] Controller B8:F4:4F:AA:9D:1C Discoverable: yes


I also enabled the driver debug prints (through #define DEBUG) and can conf=
irm
that the GPIO is being driven:

root@imx93-11x11-frdm:~# dmesg|grep h2c
[   13.524321] hci0: Set Wakeup Method response: status=3D0, h2c_wakeupmode=
=3D4
[   15.586748] hci0: Set h2c_ps_gpio: high
[   28.459963] hci0: Set h2c_ps_gpio: low
[   32.034623] hci0: Set h2c_ps_gpio: high

Maybe we have a different board revision? Do you know if there is a way I c=
an
read mine?


Regards,
=46rancesco




