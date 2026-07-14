Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B494C77D6
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046956; cv=none; b=L/C0eiH3SmEMIPX25Bjvbjvg8hJAEJlReZhyyAHAX1SOHTM/lYJvzuoVpPaJz6ub492Xe0XteDOFSrb6mj8YxiYS7SW29Azx5+XotIsbPbg/DcNMOEeYoucXOz8jnczOlPFmn3Cyl+1r4o87LOXbt2HpZkrsEbRIpjA9xk1G2Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046956; c=relaxed/simple;
	bh=6z8HsUuKgrLx2/y0WOD8TNbRYLVORNbEn2kqa03cmH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLhK5jXTVw/zSqr0vwDANwRVaix2mHklzNqYSYL1PVgpp9QUe8jnZ5Lkn3zbPv3stxdiALyXzxCknOcODtb0GyvkDHBe9djisN84gWtc0cZAT5wyqMD+r397J+ThFGvpIkBCFxjAzYL/oerNaKqGGWoNHdw0fpdaWLQupGaiij8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tfryIdYr; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tfryIdYr"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so2476234a12.3
        for <imx@lists.linux.dev>; Tue, 14 Jul 2026 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784046954; x=1784651754; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mDfqLI3RfxmSiaSDiydNo7YcWiprzsWXHzTIYi3ikUo=;
        b=tfryIdYrAzlvQLdIznzKed1X3gOZiC/M/M7z9tVzNrLQKFR+lNISrFcbGfP4Hwd3d/
         SCi2s8xXnWM5tm0DKZbL9mDcWKCJWacUdfdS1frvpVqRed5Iee639MqKHZALobrhH16t
         t+l/rCVI9DhactZqbeA7zXDIFn/T/MwWAfW2ddvLqxbNARjyNVE3xqYvn0O757cITHf5
         8rM6pFbdrTQkMLSzoyiOvTYmJanJwNLpenySiFm+Aa6Qk2+/mW4z2O+0Tu0uXdD5yQP3
         HTc2sP+Q2Qhk+IVQ5l8VhjbtbW2DA5ej0lGhKJN3RefF+Vtvq9cv7SqKY2tdwgtCUSXL
         FQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046954; x=1784651754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDfqLI3RfxmSiaSDiydNo7YcWiprzsWXHzTIYi3ikUo=;
        b=Njh1y1VQyGOIXHBXX0peydwDZE9IYPDO2IDFdcEu+meGFmVcV0S1ph96hHyArOkN01
         FK7ibG0JDJ7xGti/Ygq2zr7jvjejuomcoNVuURfLMNjIIIMGkDgyZoZOAZU2mXfW1yja
         /FPm2y+gJHm+AobXBx023/N67n106+Yu2W+IzJKcZBx843PHLYTPQz4MzFcorSqL9TY+
         M7+oFTVdvKksWT7uA/QF8aAjVjEjUzrWLmxyKZXqgirSCiTiU4qZQrlZoKSy7aJHH5ii
         ewvjqNcYyI0RIqDdFylK6dZNm6VkVNqO7Na68/7/pteQ+ur4FRJLPil9SPmlexJnRQMl
         Dh6w==
X-Forwarded-Encrypted: i=1; AHgh+Roa5UPOMuRxZ/NvZF0NMyyyZMuFVZF0DOJvWutVrww1vdzHXoxx95WYfAfUGNOBcoaMlo4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx2lbfRerIM9SERDdrKblPfIOV67KxvzOmy4Ifv/W2dUKNJtA3
	4yK7rx+HpfMxoVJPlV/vERxf7qqEI2kHLme/r/TuytHgMVgp9hwAHJB8tUvgz3VfO1Q=
X-Gm-Gg: AfdE7cnHryV7SLg5bvnox7o3VfAV8Lw1+V9E6Yj2QawClmabJHV3uRuIaAQ/vWLN9Vm
	JXvdgLjvIK4vAr0/FytgVoQo/FDINH1qLLtbQDd2RuC+wRoKYevsXUT18TjQpQI73sFHkUPilmb
	ku8JUdl7cQzEoxNv2wgI8aaltoFWk5EM7GH7JkVq5QvYu9MfG//XofnfXR5pHKgJz+1nmv7AGyI
	n868ce5XBhEeGO0thGTevqf+hLBAO1TYKZPzt9seVjqg+qoEcr/vj2Lf4+Pu8wCbSoD/BZBGLEX
	wQJqQa3l/NDp95HOK/G+5d7WkBpzP+oFxPLFL22ojwefRvnxFjLsBiByGsMLuzf75pI8ZnnWkhT
	gdys9Pxe6CvJBMZDNCewJ4V1uQC1juDEIWNlP+6hOu2c4NNBKeRrSZ7stv3XKl3JbY8qqnjBHZq
	o2cnxnxe+9V83+07dl
X-Received: by 2002:a05:6a00:124f:b0:846:7507:4e07 with SMTP id d2e1a72fcca58-8488975aac2mr12250820b3a.39.1784046953503;
        Tue, 14 Jul 2026 09:35:53 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:24cc:3af8:4244:12fe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7dada6sm1772036b3a.42.2026.07.14.09.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:35:52 -0700 (PDT)
Date: Tue, 14 Jul 2026 10:35:50 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	"b-padhi@ti.com" <b-padhi@ti.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <alZlZvQQwq-g6VL3@p14s>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
 <alUdg9iTysXCFUa5@p14s>
 <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB91852808D2C7491AEF98CF1589F92@PAXPR04MB9185.eurprd04.prod.outlook.com>

On Tue, Jul 14, 2026 at 02:29:12PM +0000, Shenwei Wang (OSS) wrote:
> 
> 
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Monday, July 13, 2026 12:17 PM
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
> > On Thu, Jun 25, 2026 at 10:54:26AM -0500, Shenwei Wang wrote:
> > > From: Shenwei Wang <shenwei.wang@nxp.com>
> > >
> > > Describes the gpio rpmsg transport protocol over the rpmsg bus between
> > > the remote system and Linux.
> > >
> > > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > > ---
> > >  Documentation/driver-api/gpio/gpio-rpmsg.rst | 271 +++++++++++++++++++
> > >  Documentation/driver-api/gpio/index.rst      |   1 +
> > >  2 files changed, 272 insertions(+)
> > >  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> > >
> > > diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > > b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > > new file mode 100644
> > > index 000000000000..7d351ff0adb0
> > > --- /dev/null
> > > +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> > > @@ -0,0 +1,271 @@
> > > +.. SPDX-License-Identifier: GPL-2.0-or-later
> > > +
> > > +GPIO RPMSG (Remote Processor Messaging) Protocol
> > > +================================================
> > > +
> > > +The GPIO RPMSG transport protocol is used for communication and
> > > +interaction with GPIO controllers on remote processors via the RPMSG bus.
> > > +
> > > +Message Format
> > > +--------------
> > > +
> > > +The RPMSG message consists of a 8-byte packet with the following layout:
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |     cmd     |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
> > > +
> > > +- **line**: The GPIO line (pin) index of the port.
> > 
> > Here and throughout, please remove any mention of 'port'.  This is handled by the
> > endpoint device, i.e one GPIO controller (port) per endpoint.
> > 
> > > +
> > > +- **value**: See details in the command description below.
> > > +
> > > +
> > > +GPIO Commands
> > > +-------------
> > > +
> > > +Commands are specified in the **Cmd** field.
> > > +
> > > +The SEND message is always sent from Linux to the remote firmware.
> > > +Each SEND corresponds to a single REPLY message. The GPIO driver
> > > +should serialize messages and determine whether a REPLY message is
> > > +required. If a REPLY message is expected but not received within the
> > > +specified timeout period (currently 1 second in the Linux driver),
> > > +the driver should return -ETIMEOUT.
> > > +
> > > +GET_DIRECTION (Cmd=2)
> > > +~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      2      |    line     |             0             |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status | value  |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +- **value**: Direction.
> > > +
> > > +  - 0: None
> > > +  - 1: Output
> > > +  - 2: Input
> > > +
> > > +
> > > +SET_DIRECTION (Cmd=3)
> > > +~~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      3      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: Direction.
> > > +
> > > +  - 0: None
> > > +  - 1: Output
> > > +  - 2: Input
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +
> > > +GET_VALUE (Cmd=4)
> > > +~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      4      |    line     |             0             |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status | value  |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +- **value**: Level.
> > > +
> > > +  - 0: Low
> > > +  - 1: High
> > > +
> > > +
> > > +SET_VALUE (Cmd=5)
> > > +~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      5      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: Output level.
> > > +
> > > +  - 0: Low
> > > +  - 1: High
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +
> > > +SET_IRQ_TYPE (Cmd=6)
> > > +~~~~~~~~~~~~~~~~~~~~
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      6      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: IRQ types.
> > > +
> > > +  - 0: Interrupt disabled
> > > +  - 1: Rising edge trigger
> > > +  - 2: Falling edge trigger
> > > +  - 3: Both edge trigger
> > > +  - 4: High level trigger
> > > +  - 8: Low level trigger
> > 
> > I'm in agreement with cmd 3, 4, 5 and 6.
> > 
> 
> How about cmd 2?

Yes, I forgot cmd 2.  

> 
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +SET_WAKEUP (Cmd=16)
> > > +~~~~~~~~~~~~~~~~~~~
> > 
> > I already commented on messages that are not part of the virtio-gpio
> > specification.
> > 
> 
> I don't believe virtio-gpio needs a SET_WAKEUP command.
> 
> In the RPMSG case, SET_WAKEUP is required because it performs an operation on the 
> remote processor, so the remote side must be explicitly notified.

What operations would that be?

> 
> For virtio-gpio, however, everything is handled locally. The other side does not need to 
> perform any action, so sending a SET_WAKEUP command appears unnecessary.

What is "everything"?

> 
> 
> > > +
> > > +**Request:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+------+------+------+------+------+------+
> > > +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> > > +   |      1      |    line     |           value           |
> > > +   +------+------+------+------+------+------+------+------+
> > > +
> > > +- **value**: Wakeup enable.
> > > +
> > > +  The remote system should always aim to stay in a power-efficient
> > > + state by  shutting down or clock-gating the GPIO blocks that aren't
> > > + in use. Since  the remoteproc driver is responsible for managing the
> > > + power states of the  remote firmware, the GPIO driver does not
> > > + require to know the firmware's  running states.
> > > +
> > > +  When the wakeup bit is set, the remote firmware should configure
> > > + the line  as a wakeup source. The firmware should send the
> > > + notification message to  Linux after it is woken from the GPIO line.
> > > +
> > > +  - 0: Disable wakeup from GPIO
> > > +  - 1: Enable wakeup from GPIO
> > > +
> > > +**Reply:**
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+--------+--------+
> > > +   | 0x00 |  0x01  |  0x02  |
> > > +   |   1  | status |    0   |
> > > +   +------+--------+--------+
> > > +
> > > +- **status**:
> > > +
> > > +  - 0: Ok
> > > +  - 1: Error
> > > +
> > > +Notification Message
> > > +--------------------
> > 
> > "Interrupt Messages"
> > 
> > > +
> > > +Notifications are sent by the remote core and they have
> > > +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> > > +
> > > +When a GPIO line asserts an interrupt on the remote processor, the
> > > +firmware should immediately mask the corresponding interrupt source
> > > +and send a notification message to the Linux. Upon completion of the
> > > +interrupt handling on the Linux side, the driver should issue a
> > > +command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
> > > +
> > > +A Notification message can arrive between a SEND and its REPLY
> > > +message, and the driver is expected to handle this scenario.
> > > +
> > > +.. code-block:: none
> > > +
> > > +   +------+------+--------+
> > > +   | 0x00 | 0x01 |  0x02  |
> > > +   |   2  | line | trigger|
> > > +   +------+------+--------+
> > 
> > 2 things here:
> > 
> > 1) You did not include messages that mask and unmask interrupts at the driver
> > side.
> 
> Interrupt masking and unmasking are handled entirely on the local processor.
> 
> When an interrupt occurs, the remote system masks the interrupt and then sends a notification 
> to Linux. After Linux processes the notification, it sends a SET_IRQ_TYPE message back to the 
> remote system, which then unmasks the interrupt.

This is the kind of information that should be part of this documentation.

> 
> Thanks,
> Shenwei
> 
> > 
> > 2) We are carrying virtio-gpio messages on top of RPMSG and as such, this whole
> > protocol should be about thar:
> > 
> > +------+------+--------+--------
> > | 0x00 |       payload         |
> > |  Q   |                       |
> > +------+------+--------+--------
> > 
> > Q = 0 requestq
> > Q = 1 eventq
> > 
> > The "payload" part is simply the format of the messages as found in the virtio-
> > gpio specification.  From there, the only thing left to mention is which messages
> > are not supported, i.e get line names.
> > 
> > > +
> > > +- **line**: The GPIO line (pin) index of the port.
> > > +
> > > +- **trigger**: Optional parameter to indicate the trigger event type.
> > 
> > Not part of the spec - remove.
> > 
> > Given the refactoring work that is still needed, I will not look at the
> > implementation.
> > 
> > Thanks,
> > Mathieu
> > 
> > > +
> > > diff --git a/Documentation/driver-api/gpio/index.rst
> > > b/Documentation/driver-api/gpio/index.rst
> > > index bee58f709b9a..e5eb1f82f01f 100644
> > > --- a/Documentation/driver-api/gpio/index.rst
> > > +++ b/Documentation/driver-api/gpio/index.rst
> > > @@ -16,6 +16,7 @@ Contents:
> > >     drivers-on-gpio
> > >     bt8xxgpio
> > >     pca953x
> > > +   gpio-rpmsg
> > >
> > >  Core
> > >  ====
> > > --
> > > 2.43.0
> > >
