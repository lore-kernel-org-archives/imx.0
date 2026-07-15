Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489144A2E21
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784138148; cv=pass; b=qSRDVu6PoJlo/CnVbya+99M8FzYuLUKE3XQ2gPv0gr40S+5e6ynoX92We2Jjx/QIs6UQtd4GDWN6JGvHGBPvb+1qNOJD5yr7/KLVPmq7rhfaEOIltcgr93K1/AJWr5EEgr/CgRuYyJ1D7MzIiNC1exIjssnZ4tFwVQ2/IJmWZ74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784138148; c=relaxed/simple;
	bh=t0NQOLYqHWDz9VsRSjuVoji+SI41r96ungAAD1Kanl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cUgUwJN3IgoMqRzKQzMfson2mgmog3rIYN+MQyY3Dm7y1qaPleltu1HQ/zveGGcdIPUejUhlMPh7sIjVnvsjJz7WzRjE957ybZZmVM5h0QmJ/zgi8kTximwYPYLKCTY00t4xA/6nvAehSOjZnk1aUOQD/odD4xRkT2LtMOL6APc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fb5Uqvq0; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fb5Uqvq0"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6976b0c5adbso12051199a12.2
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 10:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784138143; cv=none;
        d=google.com; s=arc-20260327;
        b=PIRtHIeWZRwgyu7mdipZKgslKTh2yft0n1Q5uhHZL8aLlPehFG7S6PrBHn0Spns6g5
         AsF95y8pYqEm3Waqv9tRFNjxb1n/Cld3JtJfPbFW9KvCu7UOpIxuzYoKyVUSiG7YDogY
         O7Y1D4SVRDMaoS0mR5oWyYkRRzp66gdKuWhu2QWgO/cU/CN6kdGXRNFyYuHhxmPaGcXZ
         27TI5n3k3bRaN6PDZUi3J2XGnDiCZhtx+tnN1oAuheJ1QqFX8mFGdxk0mb8Lc/sfUc0v
         0OImsd/IWFZU7nXa9gYcOebGXsjSl427pwPSkkP0thkNOPRT7sh9M/Zi9yf2ihddksaG
         GzjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        fh=UgAdUiwPmiRs+vH0e5282JrajjK5iu9XCTUbsjgyusQ=;
        b=VPLepwlTVMrGglm8i4WDw25vtwKnVqa7MZxraYen921ChQwvfA5zzlswFfSf1d3z4Q
         drWSu6HudPoLQzsFUUJzzP005jS2F1aoHdedVSA+6Z5RZ2WySQjA4EEEP/cEiAetJosQ
         1Dwiqh5lqlpHI5mSOGLF0O7E/f/5UaX1FYbSdFjHwsqlgno0KMAfMIGIvpfbjUydAgiG
         +xmPVRlfRVQXpGiMWNdd6DvPMYsNV+LKwcVvrp6sRz5K+DzOINvYKMYL8MDP/Ui2hdDu
         gPAtrYMnY3XY3N+3hA3NAyzdRRYhvJcq07h4S8yRRyge2dBgCFxyfVHFL+T/BD8xU3+3
         ymjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784138143; x=1784742943; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        b=fb5Uqvq0/ypm3n8YCz6YyRynhLOF34sq0+OT91jTFqiUXyt56hDSI80ILpX3m4ZiA2
         AwtSr+5ePO0fBjg6WlTpmUlyZhcTwVb5Lk+nSX7hc035wHS56kiV2rZZuGXUu+1NpMBE
         SA0sn7MZ8G6SvodLJzhWczUFxLKRlcU+tIw38SxOouRDbe96stbWxjQQVTKYlXY+msHw
         /4phOXC4Kk0yHP5T1TNt0nOzcxLuCxm9IpD1qu6Y1otcic6fKuBnCmLOxc+pknRUGxdJ
         onapZaUO50MnRkKtf0VvuLOYe9ArkSoyM+4Yo98kYuuJLR9SWLOvrYT2rRLaNTFCTKgt
         ERMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784138143; x=1784742943;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B1fLH5vkVlaT9TAQEnaHfQcEDTexVsSO83pCVpu+qHI=;
        b=osHbtvQ3COEgXKb/4hj2s9ZvVZB6V50tXYaiVPQmzI43THoKudeHyLV+BorrsDVp6N
         pZoe2iRywsMGDEvDrNnHoIztsbStdgvG1B0SEJAkqF9FzWvck+sgE1cEc1roiWv9/3k/
         RLpe2LVhd7p0DAt/SmrjBTDoUMZLorK9TTVb/wNF/w1HD8uCn0Q2ZH9OrfZnAvKEssM5
         xEFq6izzanE8EgngnOoEhLTJLPCknxNFbrYbJ1ScPyX26NbI+nF/iMxzCPuzNKBcwZD8
         //JpU3/4RVIFuuHw8w3tXATeJlXs+QD1m1+UJ2wShzuaLAQniuiDXjrUjTX1vykEoAHy
         kl4g==
X-Forwarded-Encrypted: i=1; AHgh+RoKXJSAHtohE+iOkn//HokcGCm3UKntT76mWrudJ9M199PShjPH8VDrmuyKAmhki66FWw4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEdYLf+5gG90zQHa8o/ec64ErEvNk5JK0wwZxqFbV0201de/kT
	HviQJLcyOQgFGuRDohPiqGC61rL0Ln9pgr3a6H+UfkgcRMoiCAvn7Aiuok+CAxdHm23a+OgPm9N
	5xF1qfR/bhR6PIveUy+W2Za7bM0al6BUFG6UrJ2Z9rg==
X-Gm-Gg: AfdE7cmO7FyJ0Qr2/Grf5yYIOLz9pamFf67eJaLIGJGAfVyqSVQVTAfUAFkh8kwKagE
	6HB3gSh1kXDNLG6ERC6tsepcpsiK/FLK1zV/UgYVIDHf4xHkJ3jhON9+XqbDYHESR1Q5rqAVDcE
	72N7ewClqMgXS4kI+bYq9qApZxiqMsD+VtBA4NTlas6LlNPhkjGajSDDsNpu4xOWPv2ThVRmsk7
	HBVoUggC+14DJKqzf77vdk+hzzA+drHyw1w+ka3WGBiG0zuZyXbBhZ6CbdnsGp+ONZ0jP6TSvV8
	jL74BkSQO1xXn3daL2ugA+hbUkxZ/CI=
X-Received: by 2002:a05:6402:1588:b0:69c:7567:cf5c with SMTP id
 4fb4d7f45d1cf-69cd6ddfb91mr4781134a12.41.1784138143408; Wed, 15 Jul 2026
 10:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com> <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alZlZvQQwq-g6VL3@p14s> <PAXPR04MB9185B1A3F16D82E8C0C76EE689F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <alemgbM2ktRLE9wT@p14s> <PAXPR04MB9185DC31980327326D289C4C89F82@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185DC31980327326D289C4C89F82@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 15 Jul 2026 11:55:32 -0600
X-Gm-Features: AUfX_mzC-pSYEjUJ9BYRTa4GlO7TcNO2B0DY7O1_KieZEYL7x6Ya_ZTaPmF0Y3w
Message-ID: <CANLsYkww_2d_eFGCTrTvoSavdkfOh41joKHypDnW-z0XUonR1Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com" <b-padhi@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 at 09:55, Shenwei Wang (OSS)
<shenwei.wang@oss.nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, July 15, 2026 10:26 AM
> > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn
> > Andersson <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>; linux-
> > gpio@vger.kernel.org; linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; Shenwei Wang <shenwei.wang@nxp.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Arnaud
> > POULIQUEN <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > <andrew@lunn.ch>
> > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over rpmsg
> > bus
> >
> > On Tue, Jul 14, 2026 at 06:43:30PM +0000, Shenwei Wang (OSS) wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > > Sent: Tuesday, July 14, 2026 11:36 AM
> > > > To: Shenwei Wang (OSS) <shenwei.wang@oss.nxp.com>
> > > > Cc: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski
> > > > <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob Herring
> > > > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor
> > > > Dooley <conor+dt@kernel.org>; Bjorn Andersson
> > > > <andersson@kernel.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > > > <s.hauer@pengutronix.de>; Shuah Khan <skhan@linuxfoundation.org>;
> > > > linux- gpio@vger.kernel.org; linux-doc@vger.kernel.org;
> > > > linux-kernel@vger.kernel.org; Pengutronix Kernel Team
> > > > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > > > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > > > devicetree@vger.kernel.org; linux- remoteproc@vger.kernel.org;
> > > > imx@lists.linux.dev; linux-arm- kernel@lists.infradead.org;
> > > > dl-linux-imx <linux-imx@nxp.com>; Arnaud POULIQUEN
> > > > <arnaud.pouliquen@foss.st.com>; b-padhi@ti.com; Andrew Lunn
> > > > <andrew@lunn.ch>
> > > > Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio
> > > > driver over rpmsg bus
> > > >
> > > > On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
> > > d
> > > > > > > +  - 3: Both edge trigger
> > > > > > > +  - 4: High level trigger
> > > > > > > +  - 8: Low level trigger
> > > > > >
> > > > > > I'm in agreement with cmd 3, 4, 5 and 6.
> > > > > >
> > > > >
> > > > > How about cmd 2?
> > > >
> > > > Yes, I forgot cmd 2.
> > > >
> > > > >
> > > > > > > +
> > > > > > > +**Reply:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+--------+--------+
> > > > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > > > +   |   1  | status |    0   |
> > > > > > > +   +------+--------+--------+
> > > > > > > +
> > > > > > > +- **status**:
> > > > > > > +
> > > > > > > +  - 0: Ok
> > > > > > > +  - 1: Error
> > > > > > > +
> > > > > > > +SET_WAKEUP (Cmd=16)
> > > > > > > +~~~~~~~~~~~~~~~~~~~
> > > > > >
> > > > > > I already commented on messages that are not part of the
> > > > > > virtio-gpio specification.
> > > > > >
> > > > >
> > > > > I don't believe virtio-gpio needs a SET_WAKEUP command.
> > > > >
> > > > > In the RPMSG case, SET_WAKEUP is required because it performs an
> > > > > operation on the remote processor, so the remote side must be
> > > > > explicitly
> > > > notified.
> > > >
> > > > What operations would that be?
> > > >
> > >
> > > The operation is enabling the line as a wakeup source. In practice,
> > > this involves configuring hardware-specific wakeup settings (e.g.,
> > > register bits) on the remote processor, so the remote side must be explicitly
> > notified through SET_WAKEUP.
> > >
> >
> > As I said before, we are not enhancing the virtio-gpio specification.  If the
> > functionality is not part of the specification, it is not part of this protocol.
> >
>
> It's about the functionality, not the specification.
>

No, it's about the specification.

> Without SET_WAKEUP, a virtio-GPIO line can still be used as a wakeup source, but
> an RPMSG implementation cannot because the remote processor is never notified
> to configure its wakeup settings.
>
> So both implementations may follow the same virtio-gpio specification, but they do
> not provide the same wakeup functionality.
>

No.  The kernel treats rpmsg-gpio the same way as virtio-gpio - they
need to provide exactly the same functionality.

> Anyway, if you want to drop the function, the command can be removed.
>
> Shenwei
>
> > >
> > > > >
> > > > > For virtio-gpio, however, everything is handled locally. The other
> > > > > side does not need to perform any action, so sending a SET_WAKEUP
> > > > > command
> > > > appears unnecessary.
> > > >
> > > > What is "everything"?
> > > >
> > >
> > > I mean masking, unmasking, and marking the interrupt as a wakeup
> > > source. All of these operations are handled on local processor.
> >
> > There may be enough capability in your remote processor to do all that, but we
> > can't assume the same applies to all implementations.  rpmsg-gpio is not about
> > inventing a new protocol or delegating actions to the remote processor.  It is
> > about carrying virtio-gpio packets on top of RPMSG.  It needs to operate
> > _exactly_ the same way as virtio-gpio.
> >
> > >
> > > Shenwei
> > >
> > > > >
> > > > >
> > > > > > > +
> > > > > > > +**Request:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+------+------+------+------+------+------+------+
> > > > > > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > > > > > +   |      1      |    line     |           value           |
> > > > > > > +   +------+------+------+------+------+------+------+------+
> > > > > > > +
> > > > > > > +- **value**: Wakeup enable.
> > > > > > > +
> > > > > > > +  The remote system should always aim to stay in a
> > > > > > > + power-efficient state by  shutting down or clock-gating the
> > > > > > > + GPIO blocks that aren't in use. Since  the remoteproc driver
> > > > > > > + is responsible for managing the power states of the  remote
> > > > > > > + firmware, the GPIO driver does not require to know the
> > > > > > > + firmware's
> > > > running states.
> > > > > > > +
> > > > > > > +  When the wakeup bit is set, the remote firmware should
> > > > > > > + configure the line  as a wakeup source. The firmware should
> > > > > > > + send the notification message to  Linux after it is woken from the GPIO
> > line.
> > > > > > > +
> > > > > > > +  - 0: Disable wakeup from GPIO
> > > > > > > +  - 1: Enable wakeup from GPIO
> > > > > > > +
> > > > > > > +**Reply:**
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+--------+--------+
> > > > > > > +   | 0x00 |  0x01  |  0x02  |
> > > > > > > +   |   1  | status |    0   |
> > > > > > > +   +------+--------+--------+
> > > > > > > +
> > > > > > > +- **status**:
> > > > > > > +
> > > > > > > +  - 0: Ok
> > > > > > > +  - 1: Error
> > > > > > > +
> > > > > > > +Notification Message
> > > > > > > +--------------------
> > > > > >
> > > > > > "Interrupt Messages"
> > > > > >
> > > > > > > +
> > > > > > > +Notifications are sent by the remote core and they have
> > > > > > > +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > > > > > +
> > > > > > > +When a GPIO line asserts an interrupt on the remote
> > > > > > > +processor, the firmware should immediately mask the
> > > > > > > +corresponding interrupt source and send a notification
> > > > > > > +message to the Linux. Upon completion of the interrupt
> > > > > > > +handling on the Linux side, the driver should issue a command
> > > > > > > +**SET_IRQ_TYPE** to the firmware to
> > > > unmask the interrupt.
> > > > > > > +
> > > > > > > +A Notification message can arrive between a SEND and its
> > > > > > > +REPLY message, and the driver is expected to handle this scenario.
> > > > > > > +
> > > > > > > +.. code-block:: none
> > > > > > > +
> > > > > > > +   +------+------+--------+
> > > > > > > +   | 0x00 | 0x01 |  0x02  |
> > > > > > > +   |   2  | line | trigger|
> > > > > > > +   +------+------+--------+
> > > > > >
> > > > > > 2 things here:
> > > > > >
> > > > > > 1) You did not include messages that mask and unmask interrupts
> > > > > > at the driver side.
> > > > >
> > > > > Interrupt masking and unmasking are handled entirely on the local
> > processor.
> > > > >
> > > > > When an interrupt occurs, the remote system masks the interrupt
> > > > > and then sends a notification to Linux. After Linux processes the
> > > > > notification, it sends a SET_IRQ_TYPE message back to the remote
> > > > > system,
> > > > which then unmasks the interrupt.
> > > >
> > > > This is the kind of information that should be part of this documentation.
> > > >
> > > > >
> > > > > Thanks,
> > > > > Shenwei
> > > > >
> > > > > >
> > > > > > 2) We are carrying virtio-gpio messages on top of RPMSG and as
> > > > > > such, this whole protocol should be about thar:
> > > > > >
> > > > > > +------+------+--------+--------
> > > > > > | 0x00 |       payload         |
> > > > > > |  Q   |                       |
> > > > > > +------+------+--------+--------
> > > > > >
> > > > > > Q = 0 requestq
> > > > > > Q = 1 eventq
> > > > > >
> > > > > > The "payload" part is simply the format of the messages as found
> > > > > > in the virtio- gpio specification.  From there, the only thing
> > > > > > left to mention is which messages are not supported, i.e get line names.
> > > > > >
> > > > > > > +
> > > > > > > +- **line**: The GPIO line (pin) index of the port.
> > > > > > > +
> > > > > > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > > > > >
> > > > > > Not part of the spec - remove.
> > > > > >
> > > > > > Given the refactoring work that is still needed, I will not look
> > > > > > at the implementation.
> > > > > >
> > > > > > Thanks,
> > > > > > Mathieu
> > > > > >
> > > > > > > +
> > > > > > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > > > > > b/Documentation/driver-api/gpio/index.rst
> > > > > > > index bee58f709b9a..e5eb1f82f01f 100644
> > > > > > > --- a/Documentation/driver-api/gpio/index.rst
> > > > > > > +++ b/Documentation/driver-api/gpio/index.rst
> > > > > > > @@ -16,6 +16,7 @@ Contents:
> > > > > > >     drivers-on-gpio
> > > > > > >     bt8xxgpio
> > > > > > >     pca953x
> > > > > > > +   gpio-rpmsg
> > > > > > >
> > > > > > >  Core
> > > > > > >  ====
> > > > > > > --
> > > > > > > 2.43.0
> > > > > > >
