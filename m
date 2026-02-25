Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160E9303A0A
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 20:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772050412; cv=pass; b=deIGhHmGmtbwUrL1GKw5y0N5ANZPJQ/RXjUSgrJSVxIaY9VEoCFRXcV7EW3AO/SRrktJ0GxhYI2XKopvO1imxUiOlp8SU3K1OX0Nkn0irxnQaz9pbycAg3XUVDSmr8MgXUVIB2giNOuBqMOdEQXzj8U6LhlEHm4ZL6YElHuoSjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772050412; c=relaxed/simple;
	bh=9q8Y0kUrIRVhPMFVgzKcNNbHUH9mwt1Xes87zJml6Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1PxSt8PUcdIuZN/Ng3dO/2o49tC5JAucp0ijciP3C3nx2ToxocfFMW9uBVji8rQhqn3xg+aV9O9uszM9dZMN3lARA+ymxB1LklM8gbd6sLPkXIi5zuSn4ZvMWMRLTU6N5wX8LcADj44iw7jejdSW2FM/RDVwxoQ9n/xXJF5E8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fmfjdxnj; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fmfjdxnj"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3870c7479c6so1636671fa.3
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 12:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772050409; cv=none;
        d=google.com; s=arc-20240605;
        b=VyKaYuUgqOpic93DM/6r0rEomLDAi7xGAWTqtYY1TVBrmIEQDQKI8tV2Y5S2eFdGe+
         VoFOq6WRRiLUqvzUvZ8k8LFuWI+fZryO7xr8ZRliidSbaO6ts1D/JfUY8rUQD+MlVCY1
         FsIByj3HENSW8BJyo4WDGph8EyqhaYc4d2Y0+2+/cZiB62m6nYS+ZJQob5AZGUp3XFPF
         u7mClrzyXDyM+jHvp8NR4bNoHajtcu4cdOdPeoUSFGEK7iONACfXoXa+eEOEnKPCyQdj
         LG5b9mGZnMXcAsVmNiCHSOAR7eZlYFFPzAz2/FWrCKhDgMiQ3632Q+7mYEt18BBhSM2C
         rgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jSAGY3jaZ3RvEybYcW3gxciDEtD8yNQZ0KpITDOaq5k=;
        fh=Jwxq7fmTWXyV2yDbYz385gkMou2FcmFVICYT628mMYA=;
        b=K8X+9KasRwcfMJ088sIIuy1iTSHU207tepCYnyj7PVv/K92H5trECZE9WUD2RfRu/3
         BVOQcYhHZ7/codwejbvK+F/m8mx9RP8ofVLulzbA7danvvodwQHUFxM7ccVuY9dyM5UL
         bm/vtJX+53n0M3rC4O3bS2gto1u8YcQCaaGcuhoISG6deoN2hSPD3bPyJcI0tSU9TKcJ
         E1IHklBcV+5lVcfffV1iL81NSpT/0sys0v7YWx3XcZjcXU8/+gRv7uCMg09406Zw3xUC
         y4PZfaXoGIMpAvm43LZwDh6Co3ysqvXrLCV/r2TkTEjtoqYLN3pEtqzOe87o04+WPUDv
         ea0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772050409; x=1772655209; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSAGY3jaZ3RvEybYcW3gxciDEtD8yNQZ0KpITDOaq5k=;
        b=FmfjdxnjOX7cyAi2gwffaNn/uQy87a27GO/BVBsaSThdEg0Mbv/xjn8yvlIsznfgzG
         s5MPLb90JithIbs5AqdNbw7fJKS3Oael5J4vJvIJ24vE/Dc+ODHRKutAGbJWwHqeKy6C
         ZPK2I/AZFBfnposVrWCeacu5bWEomEWfkWqT5Ig9Ud6tNZ1CgulW0UnfXsk0Q86NjVpo
         OCc37cW9d+qzBFRqn6pZjd16+DpORJ5hNfRJOjEyriO6OSyIyOkq3qEHYQzs9PBb0Htw
         INeLB04kzF8wi2Q6Fl9Tbg39zy1WKOtCwPvrHsOX8XX1mh+nnAZPnDyg6ktbA5COAQRp
         KGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772050409; x=1772655209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jSAGY3jaZ3RvEybYcW3gxciDEtD8yNQZ0KpITDOaq5k=;
        b=O3gD7rJd3xEbjmKR0cOuadbCutIKhKUcLUfPi64FqM+4SEOBfbS33E5FU41Fssw05/
         c7ncttL43xuuczRMOHLMxM4xR+EKvEm6e7uprRORNIJw0tuHNH41OGSRU1O9iGRd4Wao
         /ybupykcuw7zrkJHhTVp1FEOESEjMwHYDP9qSDAzlxYMdFV+YQIycZwY+RXA+zRIMUNT
         r52wD3DX7OjWWYdrEkg6znYYP6lAEP4W3zRzivuHPxJp5x5YsIzHi1FWrJb0CAMuD45r
         Gw+GdqHDBOV6zSP1JDaKN2XQ9PWJ8XHcoGWhQpdxZ9/WjJosJIZC5e7Aa8tt8mJRSe/j
         3FcA==
X-Forwarded-Encrypted: i=1; AJvYcCXCxyOsKabAj92cvAkp/x5bm0ToaMl59JqoMp+wihu/+f+J2buHzt+9bFmfPWmdWpX28RQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrRX5Zg4R7x9Mke7BQcqTW4aYuOOZPJUbo6B86W5vLSU/0daY5
	KGBJ/SUwKjNbrGh7klOGuVrLAZS8c4Q/rYKVGrEv17pT9MeYHkHQywzkPO/7NFzqe+LlmoEuypO
	gVgTTiUwCt4HqzTgXCXAQcTBo2xRUVMU5iYOIpRU=
X-Gm-Gg: ATEYQzyTjH4D9Fty4ypIuzDHH68O8egTKzpJXXjs3Li6e6gGlCjnKjvmZRqcwVrsRZR
	aOUeiQ742RAqIpZsgoqxFEvk2bOx46/rWkfcpY3MZEl5vYU9WSpGhV0yyo9lP0Qw7zOhs1v9soX
	pz1I3e94FiQ4hkxmNMyfBURTd1xH4CmXFHjUxQ0X3yBHVyMp8ri5VFslsMJd1YlMDX6K8DBoPe0
	nZ/xLKSikMi9fbWcS/BZVux4EC93XWcQ/eJ1RUngoqKe9UbdjPPzU/7JgCxZE0B5Qrc5x9vCLFw
	lgRrHqEnvG93wXFcqePiSHrrAcwdsKb49tDE4ubN
X-Received: by 2002:a05:651c:12c9:b0:387:189d:18da with SMTP id
 38308e7fff4ca-389ee27b9cfmr4932171fa.15.1772050408884; Wed, 25 Feb 2026
 12:13:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224031909.3546487-1-xu.yang_2@nxp.com> <CAOMZO5Br6uEJ5ffq4JCary5p3Di+bF4MDmUtOEdDqpU6xs6VJA@mail.gmail.com>
 <2r3pvujs6vdl5si5rnplgnezw4nllyunshipetvztowkngkv3h@glsewrhncjvl>
In-Reply-To: <2r3pvujs6vdl5si5rnplgnezw4nllyunshipetvztowkngkv3h@glsewrhncjvl>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 25 Feb 2026 17:13:17 -0300
X-Gm-Features: AaiRm53JHk978u2bbhFsJ_lOm7BJAyxifLIyYXonISViwgClwT1I3i3YuV5dprg
Message-ID: <CAOMZO5De8a88+1uFzBv_aDNFz7KRd4Y-+AL-eeBcK_d+i+COWA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: port: add delay after usb_hub_set_port_power()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, m.grzeschik@pengutronix.de, 
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com, 
	Marco Felsch <m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu Yang,

On Wed, Feb 25, 2026 at 4:47=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Hi Fabio,
>
> On Tue, Feb 24, 2026 at 09:19:51AM -0300, Fabio Estevam wrote:
> > Hi Xu Yang,
> >
> > On Tue, Feb 24, 2026 at 12:17=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wr=
ote:
> > >
> > > When a port is disabled, an attached device will be disconnected.  Th=
is
> > > causes a port-status-change event, which will race with hub autosuspe=
nd
> > > (if the disabled port was the only connected port on its hub), causin=
g
> > > an immediate resume and a second autosuspend.  Both of these can be
> > > avoided by adding a short delay after the call to
> > > usb_hub_set_port_power().
> > >
> > > Below log shows what is happening:
> > >
> > > $ echo 1 > usb1-port1/disable
> > > [   37.958239] usb 1-1: USB disconnect, device number 2
> > > [   37.964101] usb 1-1: unregistering device
> > > [   37.970070] hub 1-0:1.0: hub_suspend
> > > [   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
> > > [   37.974412] usb usb1: bus auto-suspend, wakeup 1
> > > [   37.988175] usb usb1: suspend raced with wakeup event         <---
> > > [   37.993947] usb usb1: usb auto-resume
> > > [   37.998401] hub 1-0:1.0: hub_resume
> > > [   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
> > > [   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> > > [   38.118645] hub 1-0:1.0: hub_suspend
> > > [   38.122963] usb usb1: bus auto-suspend, wakeup 1
> > > [   38.200368] usb usb1: usb wakeup-resume
> > > [   38.204982] usb usb1: usb auto-resume
> > > [   38.209376] hub 1-0:1.0: hub_resume
> > > [   38.213676] usb usb1-port1: status 0101 change 0001
> > > [   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
> > > [   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
> > > [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_h=
drc
> > >
> > > Then, port change bit will be fixed to the final state and
> > > usb_clear_port_feature() can correctly clear it after this period. Th=
is
> > > will also avoid usb runtime suspend routine to run because
> > > usb_autopm_put_interface() not run yet.
> > >
> > > Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port =
power")
> > > Cc: stable@kernel.org
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > On an imx6x-sdb board, I still get the inconsistency below even after
> > applying your patch:
> >
> > # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> > [   20.656414] usb 1-1: USB disconnect, device number 2
> >
> > # echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
> > [   28.263516] usb 1-1: new high-speed USB device number 3 using ci_hdr=
c
> > [   28.466813] usb 1-1: New USB device found, idVendor=3D0457,
> > idProduct=3D0151, bcdDevice=3D 1.00
> > [   28.466949] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> > [   28.467039] usb 1-1: Product: USB Mass Storage Device
> > [   28.467086] usb 1-1: Manufacturer: USBest Technology
> > [   28.467126] usb 1-1: SerialNumber: 000000000003FF
> > [   28.501826] usb-storage 1-1:1.0: USB Mass Storage device detected
> > [   28.510452] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151:=
 80
> > [   28.517597] scsi host0: usb-storage 1-1:1.0
> > [   28.524066] usb 1-1: USB disconnect, device number 3
>
> It's another different problem.
>
> For ports which VBUS are not controlled by PORTSC.PP (always on VBUS
> regulator or Type-C controlled VBUS), they are still powered on after
> you disable the ports. This will cause PORTSC.CCS still be set after it.
>
> When usb_autopm_get_interface() gets called, hub_resume will check CCS
> bit and check new connection again. So you see new device is reported.
>
> Below patch will be a workaround for the issue when you disable the port
> many times:
> https://lore.kernel.org/linux-usb/20260223-v6-16-topic-usb-onboard-dev-v5=
-1-28d3018a8026@pengutronix.de/

I applied Marco's patch, and it fixes the inconsistent state that I
reported before on the imx6sx-sdb:

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
[  110.494838] usb 1-1: USB disconnect, device number 3
# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable

Now I want the USB OTG2 VBUS to be turned off.

I understand that the chipidea driver does not turn off VBUS when
vbus-supply is passed, so I tried using the pin as
MX6SX_PAD_GPIO1_IO12__USB_OTG2_PWR:

--- a/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi
@@ -70,17 +70,6 @@ reg_usb_otg1_vbus: regulator-usb-otg1-vbus {
                enable-active-high;
        };

-       reg_usb_otg2_vbus: regulator-usb-otg2-vbus {
-               compatible =3D "regulator-fixed";
-               pinctrl-names =3D "default";
-               pinctrl-0 =3D <&pinctrl_usb_otg2>;
-               regulator-name =3D "usb_otg2_vbus";
-               regulator-min-microvolt =3D <5000000>;
-               regulator-max-microvolt =3D <5000000>;
-               gpio =3D <&gpio1 12 GPIO_ACTIVE_HIGH>;
-               enable-active-high;
-       };
-
        reg_psu_5v: regulator-psu-5v {
                compatible =3D "regulator-fixed";
                regulator-name =3D "PSU-5V0";
@@ -347,7 +336,8 @@ &usbotg1 {
 };

 &usbotg2 {
-       vbus-supply =3D <&reg_usb_otg2_vbus>;
+       pinctrl-names =3D "default";
+       pinctrl-0 =3D <&pinctrl_usb_otg2>;
        dr_mode =3D "host";
        status =3D "okay";
 };
@@ -636,7 +626,7 @@ MX6SX_PAD_GPIO1_IO10__ANATOP_OTG1_ID        0x17059

        pinctrl_usb_otg2: usbot2ggrp {
                fsl,pins =3D <
-                       MX6SX_PAD_GPIO1_IO12__GPIO1_IO_12       0x10b0
+                       MX6SX_PAD_GPIO1_IO12__USB_OTG2_PWR      0x10b0
                >;
        };

This works in the opposite way:

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
# [   48.509650] mxs_phy 20c9000.usbphy: vbus is not valid
[   48.940605] usb 1-1: new high-speed USB device number 3 using ci_hdrc
[   49.144001] usb 1-1: New USB device found, idVendor=3D0457,
idProduct=3D0151, bcdDevice=3D 1.00
[   49.144133] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   49.144225] usb 1-1: Product: USB Mass Storage Device
[   49.144273] usb 1-1: Manufacturer: USBest Technology
[   49.144314] usb 1-1: SerialNumber: 000000000003FF
[   49.179136] usb-storage 1-1:1.0: USB Mass Storage device detected
[   49.188023] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151: 80
[   49.195308] scsi host0: usb-storage 1-1:1.0
[   50.252746] scsi 0:0:0:0: Direct-Access     Ut163
USB2FlashStorage 0.00 PQ: 0 ANSI: 2
[   50.291866] sd 0:0:0:0: [sda] 248000 512-byte logical blocks: (127
MB/121 MiB)
[   50.301593] sd 0:0:0:0: [sda] Write Protect is off
[   50.308917] sd 0:0:0:0: [sda] Asking for cache data failed
[   50.309042] sd 0:0:0:0: [sda] Assuming drive cache: write through
[   50.342155]  sda: sda1
[   50.345288] sd 0:0:0:0: [sda] Attached SCSI removable disk

#
#
# echo 0 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
# [   57.161272] usb 1-1: USB disconnect, device number 3

Then I passed the 'power-active-high' property, but it failed:

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
[   16.892793] usb 1-1: USB disconnect, device number 2
# [   18.330848] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[   19.240797] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[   19.248159] usb usb1-port1: attempt power cycle
[   20.520852] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[   21.430861] usb usb1-port1: Cannot enable. Maybe the USB cable is bad?
[   21.437883] usb usb1-port1: unable to enumerate USB device

Any ideas on how to properly turn off the OTG2 VBUS?

Thanks
