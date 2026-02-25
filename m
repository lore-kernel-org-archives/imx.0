Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063728489E
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032669; cv=none; b=hn+st998DbmmXJqmVYHo3qM/1LthQG+iIxeZtnKIdEpZUV24YKMgOOK6B2vT9vUW1+Tsp9n3TVjkbqoyNS5QjYa5TG+udP3R4rwASqByH5jnqg/ivfLcu/t3syvY0q5t2IzId39adqXudiEjY+dj90duBAnbvuRkx7A0NRp2tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032669; c=relaxed/simple;
	bh=fa5Nh4Bii5T8OWE8qdfpKY5+a5tl95xEVLmEJQIMRXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5WS7PP1ckO+evP2AqRzfad0f8RpFUOAJAzG5AIgyR9cPXNQHXj7I+IpUzW2aMqiikBuI9v6dpWoNHkje/ucE3bc+hYD3Z9TYR/R14/k7iuvgGqNsHsKMzn1XK6S0Qitr63lF3Fcqp29I5TTIX5Rco7lYQ4AMvVsYfqo7wbO/vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=eUuKnrqc; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="eUuKnrqc"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-896f5af3d8aso96392716d6.1
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 07:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772032667; x=1772637467; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V7HWUIXt1rQNBWR5hmOyyD7RPaY3LCxJr4Clt2GgSzc=;
        b=eUuKnrqccjK0cdJWCQKBWVOWFVuf5S3nMLRWesqlpMEtkviN7MvAIlS4uF3BWMGGPe
         cnnBwFzK720OwJyK3o61hpd+aZhH0qEL0587Nj054e2Qw8Mhi40TJ/PVAAu1nNSdkxIX
         c3fwkk/Fq0txu2UkFipYxzSdYk9mdVnXM0UUmfX+mHqqYuTvgNR1o4VC+g4/PnFbq2VQ
         nxgDBq8fdopKzHcCSiN2tAKpVQaKk3PAto5GrIfnyAUBUM9LHiRbh65wizTnOdxzPDIR
         DRUX5iLSeGJqMA/vefuECKPf+6H605Up17BE3UTVv5D0hvuqN7CBc2cBQqn1uVjkctjJ
         Vmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032667; x=1772637467;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V7HWUIXt1rQNBWR5hmOyyD7RPaY3LCxJr4Clt2GgSzc=;
        b=Tbn6YbtFLsM2lqNTSAYQ1DF2n5qqaVGQWVAtAtuxE7uhE1fKsscQpTNziVnI3fxvbE
         WMqUIIATwmKl5qqp3iSq593UmY4Hedfe7Qqq/IzmfSX2BBGJ9q5FB4lMFas1nQDfVJsu
         ZSkTIkwlX7SnG2oG0ik0XlpysVAUHUwNbuwRQQSWwIKl0laHjyiNjInCVWW57AK+XIQK
         BhyXN/q7hBw3GucmZO+/CoOMYDrQFcsRZGU3gw/sQY6ItgbNIDPD1CgxBLuJkfdGCZJH
         fTmflUSX19F3vwZv9MoSkD/KW35SAxZAy5r63desneEXgYw8B3G2VcTdKWPegPhngU9Q
         llAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOpHBhfFVv5ub/q8UQy6NXf4v9A/0zZM6plaY9bRfBKqxb+xGciZ9pgYQY82czRytot78=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwJxfwsBIF4yALFD80igVIj3iMd+V4s+G55S4YJNoqHNkgPrk5
	embbNPBanQOZ6c5NXJ2WnY+0PvxNkucLIQEkd/Zse85LSAjPO07EJIBlbJSKUwkiQg==
X-Gm-Gg: ATEYQzxklfdnytDBQg/mk6T/ULWRIHHGUvGySRwDTyZ8ZiBAwUdkVTJuVXhAuDcRa4F
	xb3mOcA9ApxnDbWkbJG0tXyWequOyVj8rjgwwT+VH8D2iUhx5xQlbAo/RmxIQqverSbHzoeIJdT
	xTi9knHPTHliDfPify5HH+Hnh3NYuCW7wyHfcTlqACMzPzJxBhUIqQBzrsiN8JO1J88XJJ/mAMv
	NU+5tJ3z+AflMXr97jcygUAsprNmmPfGELvJ0Hvw0Nq0lScx+MAenwn78KJ+mDdSRwn/8GE27sy
	MkSp5WVaMCpS53p+fP2unL3xYl+W/VdST/JI1WVnt4WNO63hqrhda1m4ZWYcS8RpHstXVbtGQ44
	JykP2Br/ddcDyB2JIcZbUMg7in1KffmbGkCHVd+L1mNlaccAXCPlHdXiWb1XIfoCwGnFgh4X7ea
	n3cQPG6k1GMVZ9qawV9WEkMZvzyX9UmsXFLxfXB/p3KQ==
X-Received: by 2002:a05:6214:1251:b0:896:f910:c906 with SMTP id 6a1803df08f44-89979dad256mr225993136d6.66.1772032666317;
        Wed, 25 Feb 2026 07:17:46 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691243sm121256936d6.3.2026.02.25.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:17:45 -0800 (PST)
Date: Wed, 25 Feb 2026 10:17:43 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Fabio Estevam <festevam@gmail.com>, gregkh@linuxfoundation.org,
	m.grzeschik@pengutronix.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: port: add delay after usb_hub_set_port_power()
Message-ID: <d59d063d-4116-4a5c-a29e-6527aa4eadd2@rowland.harvard.edu>
References: <20260224031909.3546487-1-xu.yang_2@nxp.com>
 <CAOMZO5Br6uEJ5ffq4JCary5p3Di+bF4MDmUtOEdDqpU6xs6VJA@mail.gmail.com>
 <2r3pvujs6vdl5si5rnplgnezw4nllyunshipetvztowkngkv3h@glsewrhncjvl>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2r3pvujs6vdl5si5rnplgnezw4nllyunshipetvztowkngkv3h@glsewrhncjvl>

On Wed, Feb 25, 2026 at 03:40:15PM +0800, Xu Yang wrote:
> Hi Fabio,
> 
> On Tue, Feb 24, 2026 at 09:19:51AM -0300, Fabio Estevam wrote:
> > Hi Xu Yang,
> > 
> > On Tue, Feb 24, 2026 at 12:17 AM Xu Yang <xu.yang_2@nxp.com> wrote:
> > >
> > > When a port is disabled, an attached device will be disconnected.  This
> > > causes a port-status-change event, which will race with hub autosuspend
> > > (if the disabled port was the only connected port on its hub), causing
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
> > > [   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> > >
> > > Then, port change bit will be fixed to the final state and
> > > usb_clear_port_feature() can correctly clear it after this period. This
> > > will also avoid usb runtime suspend routine to run because
> > > usb_autopm_put_interface() not run yet.
> > >
> > > Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
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
> > [   28.263516] usb 1-1: new high-speed USB device number 3 using ci_hdrc
> > [   28.466813] usb 1-1: New USB device found, idVendor=0457,
> > idProduct=0151, bcdDevice= 1.00
> > [   28.466949] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > [   28.467039] usb 1-1: Product: USB Mass Storage Device
> > [   28.467086] usb 1-1: Manufacturer: USBest Technology
> > [   28.467126] usb 1-1: SerialNumber: 000000000003FF
> > [   28.501826] usb-storage 1-1:1.0: USB Mass Storage device detected
> > [   28.510452] usb-storage 1-1:1.0: Quirks match for vid 0457 pid 0151: 80
> > [   28.517597] scsi host0: usb-storage 1-1:1.0
> > [   28.524066] usb 1-1: USB disconnect, device number 3
> 
> It's another different problem.
> 
> For ports which VBUS are not controlled by PORTSC.PP (always on VBUS
> regulator or Type-C controlled VBUS), they are still powered on after
> you disable the ports. This will cause PORTSC.CCS still be set after it.

That is arguably a hardware bug.  According to section 11.5.1.2 of the 
USB-2 spec, when a port is in the powered-off state its transmitters and 
receivers are disabled.  This implies that it is unable to tell whether 
a device is connected, so PORTSC.CCS should be clear.

> When usb_autopm_get_interface() gets called, hub_resume will check CCS
> bit and check new connection again. So you see new device is reported.
> 
> Below patch will be a workaround for the issue when you disable the port
> many times:
> https://lore.kernel.org/linux-usb/20260223-v6-16-topic-usb-onboard-dev-v5-1-28d3018a8026@pengutronix.de/
> 
> However, it will still report new device when you "cat usb1-port1/disable".
> To fix the issue completely, I guess the usb core needs some sync with the
> port disabled state. 

Another patch on top of the one you mentioned should be straigtforward.  
Feel like writing one?  All it has to do is make the hub driver skip 
handling connect-status changes for disabled ports.

Alan Stern
