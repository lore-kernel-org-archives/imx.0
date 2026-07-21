Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7912FD1DA
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 03:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784603573; cv=none; b=LrJzvhUJiEXefHHYn8vAAmBnb7eTEEYLh02Bu3aoYFktf+toajB4j2sY6vNqAmEphNb5Q7OT0vSTpueIUtH+wl5YCMgjQb09xiQbJOCKiR8pbgEV/TmaUTBJigAEHhvToeM+noGSyuJ8V0UoaVsIq1VISXRbmcbCum2tdtvqr/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784603573; c=relaxed/simple;
	bh=8vh+hgCu1A0cEENjmWIcM8d6+6hS8xS/7qRjN0xDDsE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rtses78h0jlsBTD2JqnWAOmQY7plEtvR2a9zblve1QF53gzqT/stpsHTvq2zo6IdRMb16vigu2alPTWOPT8/CJOAHIZC0UANdBbWdO1k04RsDLuEeCZhgkt1cb4TVnnrTWan0OS8k6jQSSSYzBNyLXZg9V97nZyAh7wY6LuSHxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQenjo8m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQenjo8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D7B01F000E9;
	Tue, 21 Jul 2026 03:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784603571;
	bh=83NC/emtb84NDgEDY0QxD6XyWIS3uBXtTdyg7pbjsws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SQenjo8m5YIA/oo8G77AA/OCW3KM4CdE2UR2Q+5wlML0wps6vXT59TLtSo0L2yqAT
	 YKqpGBGnIfYxwSqkbvsCBVlDP75iHY8occ/BBd2S9KRonmz4SFmIWsff6iIZI2/8ln
	 wm4ALDLsFNgx56/HLH+bj9XXmnl3+mfIUIE0I9UB0Pl/iYQfovY+bnUMuqgVBilrYU
	 lncMw4jO3OZEFfCTXPaxFCW4s/ujHb+vGRl3fcwWM7PUWLpg1+l6NwqLq4VFcEF3ZF
	 d6QJkc94Ti1RX0KZCxk7Z68slmamXMET1qKF1u1RUGhbi4IGQdYQRjIdqNaigY4fyJ
	 tfl4ZyQDV1sWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V7] Bluetooth: btnxpuart: Add M.2 Bluetooth device
 support using pwrseq
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U2hlcnJ5IFN1biAoT1NTKQ==?= <sherry.sun@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260721030458.1160824-1-sherry.sun@oss.nxp.com>
References: <20260721030458.1160824-1-sherry.sun@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 03:12:50 +0000
Message-Id: <20260721031251.5D7B01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Initialization ordering race in probe where the device is exposed =
to the system before synchronization primitives are fully initialized.
- [High] Teardown ordering bug leading to Use-After-Destroy of synchronizat=
ion primitives during device removal.
--

--- Patch [1]: [PATCH V7] Bluetooth: btnxpuart: Add M.2 Bluetooth device su=
pport using pwrseq ---
commit aa33fbd5b00c9432b2b3b5cc158c49ae5ac11d72
Author: Sherry Sun <sherry.sun@nxp.com>

Bluetooth: btnxpuart: Add M.2 Bluetooth device support using pwrseq
   =20
Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support
for getting the pwrseq device if the OF graph link is present.

> diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
> index 0bb300eef157c..81a11ac051146 100644
> --- a/drivers/bluetooth/btnxpuart.c
> +++ b/drivers/bluetooth/btnxpuart.c

[ ... ]

> @@ -1907,13 +1925,16 @@ static int nxp_serdev_probe(struct serdev_device =
*serdev)
>  	if (bacmp(&ba, BDADDR_ANY))
>  		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
> =20
> -	if (hci_register_dev(hdev) < 0) {
> +	err =3D hci_register_dev(hdev);
> +	if (err < 0) {
>  		dev_err(&serdev->dev, "Can't register HCI device\n");
>  		goto probe_fail;
>  	}
> =20
> -	if (ps_setup(hdev))
> +	if (ps_setup(hdev)) {

[Severity: High]
This isn't a bug introduced by this patch, but does this probe initializati=
on
order expose the device to incoming traffic before its synchronization
primitives are fully set up?

In nxp_serdev_probe(), hci_register_dev() is called before ps_setup().
hci_register_dev() exposes the device and queues the power_on work which
calls hci_dev_do_open() -> btnxpuart_open() -> serdev_device_open().

Once opened, incoming UART data can trigger btnxpuart_receive_buf().
This calls ps_start_timer(), which executes mod_timer(). Because ps_setup()
(which initializes the timer via timer_setup()) hasn't executed yet, could
this cause an Oops on an uninitialized timer?

> +		err =3D -ENODEV;
>  		goto probe_fail_unregister;
> +	}
> =20
>  	hci_devcd_register(hdev, nxp_coredump, nxp_coredump_hdr,
>  			   nxp_coredump_notify);

[ ... ]

> @@ -1952,6 +1976,8 @@ static void nxp_serdev_remove(struct serdev_device =
*serdev)
>  	ps_cleanup(nxpdev);
>  	hci_unregister_dev(hdev);
>  	reset_control_assert(nxpdev->pdn);

[Severity: High]
This is a pre-existing issue, but does this teardown order lead to a
use-after-destroy of the synchronization primitives?

In nxp_serdev_remove(), ps_cleanup() is called before hci_unregister_dev().
ps_cleanup() explicitly destroys psdata->ps_lock and shuts down
psdata->ps_timer.

However, the underlying UART (serdev) is not closed until
hci_unregister_dev() executes (which calls hci_dev_do_close() ->
btnxpuart_close() -> serdev_device_close()).

If UART data arrives in the window between ps_cleanup() and
hci_unregister_dev(), btnxpuart_receive_buf() will run and call
ps_start_timer(), manipulating the destroyed timer. Additionally, it can
trigger btnxpuart_tx_wakeup() -> btnxpuart_tx_work() -> ps_wakeup(), which
attempts to lock the destroyed psdata->ps_lock.

> +	if (nxpdev->pwrseq)
> +		pwrseq_put(nxpdev->pwrseq);
>  	hci_free_dev(hdev);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721030458.1160=
824-1-sherry.sun@oss.nxp.com?part=3D1
