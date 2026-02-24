Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6446438BF84
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 12:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935605; cv=pass; b=qrx1dCKrVrUmiqX0VacdMZO+U6horN0v0YIQRVM0oFp+LOB/Sk14Gkz7OgufPW+0PZndEOeHoS7lPJ/DC3weCB+hA2ecYgJUyg5DVjZzHqOlzPeSsNHAk1Wl126qkDAGCpzsfayePm5pE/ek6tgI9Q8Y9AtgO57hp16puv7teyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935605; c=relaxed/simple;
	bh=oUJm9B0gvQB8NRBMVwgcmGcWGlRuXlIpLSIVTM41h1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNXF5i/pVbq2xwz/uF+nr2ZCIZHjB1syMigjAQKvWo07Vl/0fDSZFW3peSL20dwnRfqG2HsEc3d/cZdjyzuosLiDXj9qLb6e9RctH6lGE+PNBF+Fp6WBEDWoqM+/F9WN7ZUgm0lcwYGuushaQBIqaTA4U4kKMBByEBpp6WLTdQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTAarOVX; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTAarOVX"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e4989dacdso5640528e87.1
        for <imx@lists.linux.dev>; Tue, 24 Feb 2026 04:20:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771935602; cv=none;
        d=google.com; s=arc-20240605;
        b=SKLUc8vM0v6sTiNlycL78r9SfKCxe3x0QBL0hOVgjcC9X7RGEa9/gV30KtoTyLkdJZ
         WH/iTv6lvgfsEmuXfxU/HZTWx7DCbDUUipFGPf+YjJirOhbNC5gA7Syp3XjGs5QWV749
         /b9CtSidpI4vHe8noBhRhnPGhL9/HTXye7D07Jqk4+D7HP5h4L+QIzBUgzd/hElCcouK
         Q1/s3MRkD1YpZ9zqdvGYoexg/GYtRNvc2QiMMzyrNfCre4TfDd6yfgwj+JTGEqxqnDIB
         auq9tkZRgcjKLZ2v7d5IpIK3rMhyUEh+9gDL+vynSjggUbEblp4tVRHgQiq/CB6IG5kE
         g9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZOvcOqJz90w9q8QgLeEZ+fcwzfRg6biuVxHTmPnlKrk=;
        fh=GX1HGgddpetZcJwrM+HzJUTi6XSQhIyAiffeK2nsVPo=;
        b=c7FSD+XXDAkhOR5y9QiiSMzZl+7goOBDPSZ8GV2TD0utzjuJ6mwt2XtgXz3T/DnLgG
         wBG2ARmvNfnJnR6OmD++HhQEyX+qW53D6VKJrYRCW2wTE/Sy+ps0H3BSSYQDYD5cH973
         p4sV3fAAhSEwM2k7zwuF8bqXoxWNq3iZ5KxQLa6MHpkN415FfdspKdWCiBfbQgbawsdd
         alskPHOq1U4Esw4C/JenzRAR1qLNyNlvYa4FLgrrDCeLJVz8Ce//F5hX6q6Er/e2kxh3
         WRgkyfJ7YuqkRE6Y5EKl1fBFIai4Blk2nKj3jfP7hu8BsgjcQon3oCI4qjCKCPKrndng
         MFSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771935602; x=1772540402; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOvcOqJz90w9q8QgLeEZ+fcwzfRg6biuVxHTmPnlKrk=;
        b=CTAarOVXoNJsGr8NAFKJqTVKHh9d2U1EK8eCIO4hxdhSG0gs+t3UV2ALFG3/Rh+uur
         o10/VabmZII8iawJZrEjfRmNyiHZy/ojimVVVOxiPzEQT6ufQOg/LMEbqoPjwCoCZB8j
         S2bo6nf024pVtZPijcaU/MT9+CEDXynQQ0LoKpr7WCkPM3s6kftseikaQVstPd5SZc08
         Iu0A8IdnWRcz9SKCDqL3ArgdLA5doHs5CORnbaPCK4nGqHpVwSzjcHtaqu8pN8VM4Nyt
         dbtFnKG76PtSVVdGStg3iaxJnc2V0/iSqRmvquPiWUc2Xjpmbr8VeAJImJp8RiTw6TOy
         zYuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935602; x=1772540402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZOvcOqJz90w9q8QgLeEZ+fcwzfRg6biuVxHTmPnlKrk=;
        b=l7S0b/VZZliAPkG+0vvLqsgo3jqR52mUlirOQERCGcAMnLo4NTvZgr3HAN0Xye3cQQ
         WdbRmTHeYs5xZi8IHiAlhD5Dklm3Z6/NR4OEhzxxmxI4tEoK9lmxkN24XgglqfjoGheS
         HCxy1VvxOpy7v+q5r8izhZoX70hI3sZoqRt0xw7aSLyiPjPnnDjdb3KXUxXeGmRaoyth
         f5VAD64Zau1jFFhHZHlZCukV8TGzHgy80/UDmj27B6UwqleGLZE0GiDbu1NyeDT81fYX
         vtwI5y3n5TDMNT2nJLfdJt1axvhO1XDzp4Dj/3GEiHqsUPe2A7Rp2271gsMSoWWhXtLR
         hjuw==
X-Forwarded-Encrypted: i=1; AJvYcCVW3eS+oAPSbYwFVAewUz6LJLXcxEXuW0F0e8guKYDp/djyYwnBv1tfsOkHsnS8dVHGIRE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6HkZOPE1S7S/RNZKHa+m5cpP/OizXuKDgcLIewmtvQ55VCl2a
	mabf81QLUU5QFwoPbr384exI+KtQrLyHBKjCapbvSXjB9E6b+gOQFyHehc1NaxatlGl5zxWkMv+
	rEGWxsdE0S8dyF7BpQbMc6OnppA8smIU=
X-Gm-Gg: ATEYQzxKfU86w/oQWopeXp4Zc/xd9J153WDrDORKBB4OuXU1bymW1GY8mYy3A7n1bMD
	gpjXSSTjCFYJzxPUEvTujfKIprdcTEQbiFVuDEEQrWhPkTMy2HPCBC+kzpclECZE7ApNlbYyDvS
	8FlxyyuJlGUQm0tbHFDo2v90scTm25dFBpaX5owsHOTMZgXw6jerE/jH5nnfifNTAeBAymuXh1L
	9C6jEAIHU2TuDSpMWBDIULZDrn/QlAW/O7H576CG3k4detB35X3x+9kGuAcwfVisCwXluBZDxkC
	GWvosDWkSWIVcF0qiixRtaBgdR316D5FW7BjUQrzFcAPv27mfX0=
X-Received: by 2002:a05:6512:230f:b0:59d:dcd9:73ac with SMTP id
 2adb3069b0e04-5a0ed9a798bmr3979014e87.42.1771935602204; Tue, 24 Feb 2026
 04:20:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260224031909.3546487-1-xu.yang_2@nxp.com>
In-Reply-To: <20260224031909.3546487-1-xu.yang_2@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 24 Feb 2026 09:19:51 -0300
X-Gm-Features: AaiRm52IlpDEEvd2-2SNJFOqNqDwt1rexyZirHla9Ws4CPVXDlvxN5dyhmI6YxQ
Message-ID: <CAOMZO5Br6uEJ5ffq4JCary5p3Di+bF4MDmUtOEdDqpU6xs6VJA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: port: add delay after usb_hub_set_port_power()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, m.grzeschik@pengutronix.de, 
	stern@rowland.harvard.edu, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xu Yang,

On Tue, Feb 24, 2026 at 12:17=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> When a port is disabled, an attached device will be disconnected.  This
> causes a port-status-change event, which will race with hub autosuspend
> (if the disabled port was the only connected port on its hub), causing
> an immediate resume and a second autosuspend.  Both of these can be
> avoided by adding a short delay after the call to
> usb_hub_set_port_power().
>
> Below log shows what is happening:
>
> $ echo 1 > usb1-port1/disable
> [   37.958239] usb 1-1: USB disconnect, device number 2
> [   37.964101] usb 1-1: unregistering device
> [   37.970070] hub 1-0:1.0: hub_suspend
> [   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
> [   37.974412] usb usb1: bus auto-suspend, wakeup 1
> [   37.988175] usb usb1: suspend raced with wakeup event         <---
> [   37.993947] usb usb1: usb auto-resume
> [   37.998401] hub 1-0:1.0: hub_resume
> [   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
> [   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
> [   38.118645] hub 1-0:1.0: hub_suspend
> [   38.122963] usb usb1: bus auto-suspend, wakeup 1
> [   38.200368] usb usb1: usb wakeup-resume
> [   38.204982] usb usb1: usb auto-resume
> [   38.209376] hub 1-0:1.0: hub_resume
> [   38.213676] usb usb1-port1: status 0101 change 0001
> [   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
> [   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
> [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc
>
> Then, port change bit will be fixed to the final state and
> usb_clear_port_feature() can correctly clear it after this period. This
> will also avoid usb runtime suspend routine to run because
> usb_autopm_put_interface() not run yet.
>
> Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port powe=
r")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

On an imx6x-sdb board, I still get the inconsistency below even after
applying your patch:

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
[   20.656414] usb 1-1: USB disconnect, device number 2

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
[   28.263516] usb 1-1: new high-speed USB device number 3 using ci_hdrc
[   28.466813] usb 1-1: New USB device found, idVendor=3D0457,
idProduct=3D0151, bcdDevice=3D 1.00
[   28.466949] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   28.467039] usb 1-1: Product: USB Mass Storage Device
[   28.467086] usb 1-1: Manufacturer: USBest Technology
[   28.467126] usb 1-1: SerialNumber: 000000000003FF
[   28.501826] usb-storage 1-1:1.0: USB Mass Storage device detected
[   28.510452] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151: 80
[   28.517597] scsi host0: usb-storage 1-1:1.0
[   28.524066] usb 1-1: USB disconnect, device number 3

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
# [   35.323593] usb 1-1: new high-speed USB device number 4 using ci_hdrc
[   35.526916] usb 1-1: New USB device found, idVendor=3D0457,
idProduct=3D0151, bcdDevice=3D 1.00
[   35.527054] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[   35.527150] usb 1-1: Product: USB Mass Storage Device
[   35.527198] usb 1-1: Manufacturer: USBest Technology
[   35.527239] usb 1-1: SerialNumber: 000000000003FF
[   35.562024] usb-storage 1-1:1.0: USB Mass Storage device detected
[   35.570430] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151: 80
[   35.577562] scsi host0: usb-storage 1-1:1.0
[   36.645798] scsi 0:0:0:0: Direct-Access     Ut163
USB2FlashStorage 0.00 PQ: 0 ANSI: 2

# [   36.682705] sd 0:0:0:0: [sda] 248000 512-byte logical blocks:
(127 MB/121 MiB)
[   36.691645] sd 0:0:0:0: [sda] Write Protect is off
[   36.697915] sd 0:0:0:0: [sda] Asking for cache data failed
[   36.697981] sd 0:0:0:0: [sda] Assuming drive cache: write through
[   36.735520]  sda: sda1
[   36.739376] sd 0:0:0:0: [sda] Attached SCSI removable disk

# echo 1 >  /sys/bus/usb/devices/1-0\:1.0/usb1-port1/disable
[   39.423511] usb 1-1: USB disconnect, device number 4

Please try disabling the port several times in a row.
