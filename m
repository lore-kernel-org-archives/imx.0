Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255A3EFD0D
	for <imx@lists.linux.dev>; Mon,  4 May 2026 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777922598; cv=none; b=gp08GCeEQXOOajtEg7JH4lqZzAES/deti6tUyL1hUQJ+OoGp7QpQ+ez9Qbmn2UgR+zMALTxJDEAczZjxALB9IYYAI4mU3PA7dz8mE9etdIjMc8ofxRRXsvgKKDhmW+AJCtL7XcECKnv3iBJPfvyD+WuO8q3ZkfoAFlS6pK69/ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777922598; c=relaxed/simple;
	bh=z8TaKiOgbrcO5nVVJrzHc/0z/b/I/wj6aa7blf7/2Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGsANtIzITzcOia6g8Ul3Q56NM/3d6bT+Tg7zsatcDWs3cxEpAIgdXJUR9qHiwxDD+1Xawf1vFQTFHIwDNsNB7S4vsCtcsjZIACBeVQ6nsRO7YuwHBqvl03xGWn2HoItuMESD2OXAiFYUGpe+IylX5dOEGmzBjeWWuUHQLSLYgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iOvgKyc5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iOvgKyc5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-362e30526f8so1834556a91.3
        for <imx@lists.linux.dev>; Mon, 04 May 2026 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777922596; x=1778527396; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F8DW58I56k4HGq4dRxVuBEHA+ztABtCu6lkTMHWYRCo=;
        b=iOvgKyc54u4t2wk9l5fB9P2a2Oh9No2a46x8qYx/TYsi3YtrdX/ajoxa+xh77aeQ9h
         +gBsQR4777wGPEeQXzb+aFpamxmRjfFdHnZhjMaB0q7MXPKx4CelMj2FX3Cigp7YP4Xo
         UKvIXl925LzEwrBDoA+xNArXF3wFQSgNkvfSpGcQKzoco6Drdg5D7NOaiAs1ZiPLSf/f
         ecQ9jMuzEHOeIxLa5hYii5tvfw1B/pzLfYq338nMA2seR+mbVABLuQ9Zk4nSDNuDUnhk
         SJzzMIs1rwLAKqzo7dj3VgfIU+TVsfgwf61qvU4mP/umkAJ6nl2G2CGo3UUCltY5N5N1
         YaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777922596; x=1778527396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8DW58I56k4HGq4dRxVuBEHA+ztABtCu6lkTMHWYRCo=;
        b=LoXUHlC1+QxE1hxGfm+VKYHLSdtJyD2K8tgWV9+jpjRTrIzc4TK7dGUdmhGMbEVE1S
         iunASyP7fawLLbTsQG14Nun3oT7MR+hqdNI5LfTcdu/ZNaERoLuLkm4CTXLp4k957uVa
         WiunAtXoJSVvSlE5ivbWyr7raiOHsiuyMTyW9KQkyNyfYz1ylIj1Zm4WGeyyy16b/89J
         sznGVwt5AVeSYk5F3LLtbqeyGJhB92F/YFB+aZQ0OkTbDptFReyX3gz3kh8Su0zrLSs+
         o2e/wNUBjhWn3S4kzQ1xkSupozLyO6UhDQ7pxdSqqsynnSUiC3ABSAdHMdbn4DOQ1zSy
         K+tg==
X-Forwarded-Encrypted: i=1; AFNElJ/8FVFUbgGHwy+rxF7715m195EtgjHRbP6+KBBq5OPBhkHr6M/JaRjLkLzrzi8uYo3jNRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+hVdQB1Vk1k3QDJW6HDvVqYuIgsDLB0NxAjC5tDLi0Mc4ZlQg
	6x9/p3gznnEMwTG87nb/FTaHjEwrFAHlMXEsE/VQL3oKrNuIWcudxitkqW2T/yms3aw=
X-Gm-Gg: AeBDievb+5wlmCuKBrU6Bv2opG6RTVsqosBmJOzN58+I9E+CPhSW+e4eMfX6iJmvv7J
	C5DaC5jg9bXru3OIbitdXPYXfIFYuLxqgLj5GVbQQ+tClw6UWTJLIIlIQoAmEl25+T41Cr4dc7k
	QSiRkDsKwLqq19h21xblm5GQXGAN0eikxcGh6ixi9xxmPxV6IUosBhW/2PPqltABAbRH1SwTu+0
	MSEGPsdEIScKcqMekidhTjC2+UhzbUHfGYQXflQPFPSpq+sxVtxL5tsLAcrNvvhBLE5H1izxIv4
	OPYh1fHIJhbjEldjUW89gFSkoo1VY//eCEW3rufNGF6HXZ5apKzM/13Vi2R255PIihT4w9JPoQc
	Ma1rJuL1T9z6zkq5bgwia7SmOJdt1lD6UeZxuZmCosgXYYrgIqzanuGRWu2cWKnIqoFh74GhLeu
	i84kKjEOb630xevCMoT9BjiVR+HqxZmoj464//5yi5DAnN3yYO
X-Received: by 2002:a17:90b:4ec5:b0:35f:be11:b3e0 with SMTP id 98e67ed59e1d1-3650cd0818cmr11105828a91.2.1777922595178;
        Mon, 04 May 2026 12:23:15 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6e2e:a9d7:64d6:25af])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36575dee1fdsm108101a91.1.2026.05.04.12.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:23:14 -0700 (PDT)
Date: Mon, 4 May 2026 13:23:11 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com
Subject: Re: [PATCH v13 1/4] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Message-ID: <afjyH5JT0JS2j0L5@p14s>
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
 <20260422212849.1240591-2-shenwei.wang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422212849.1240591-2-shenwei.wang@nxp.com>

On Wed, Apr 22, 2026 at 04:28:46PM -0500, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the remote system and Linux.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  Documentation/driver-api/gpio/gpio-rpmsg.rst | 266 +++++++++++++++++++
>  Documentation/driver-api/gpio/index.rst      |   1 +
>  2 files changed, 267 insertions(+)
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..abfde68c9b0a
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,266 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG (Remote Processor Messaging) Protocol
> +================================================
> +
> +The GPIO RPMSG transport protocol is used for communication and interaction
> +with GPIO controllers on remote processors via the RPMSG bus.
> +
> +Message Format
> +--------------
> +
> +The RPMSG message consists of a 6-byte packet with the following layout:
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   |type |cmd  |port |line |  data    |
> +   +-----+-----+-----+-----+-----+----+

I will take a final decision on the 'port' field when I'm done reading the
thread on how endpoints should be created.

> +
> +- **type (Message Type)**: The message type can be one of:
> +
> +  - 0: GPIO_RPMSG_SEND
> +  - 1: GPIO_RPMSG_REPLY
> +  - 2: GPIO_RPMSG_NOTIFY
> +
> +- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.
> +
> +- **port**: The GPIO port (bank) index.
> +
> +- **line**: The GPIO line (pin) index of the port.
> +
> +- **data**: See details in the command description below.
> +
> +- **reply err**: Error code from the remote core.
> +
> +  - 0: Success
> +  - 1: General error (Early remote software only returns this unclassified error)
> +  - 2: Not supported (A command is not supported by the remote firmware)
> +  - 3: Resource not available (The resource is not allocated to Linux)
> +  - 4: Resource busy (The resource is already in use)
> +  - 5: Parameter error

No.  The virtio-GPIO specification does not define any of these.  We are not
re-inventing the specification, we are only using it on top of RPMSG.  The only
value for 'status' are VIRTIO_GPIO_STATUS_OK and VIRTIO_GPIO_STATUS_ERR.  Modify
the virtio-GPIO specification if you want to do something like this.

> +
> +
> +GPIO Commands
> +-------------
> +
> +Commands are specified in the **Cmd** field for **GPIO_RPMSG_SEND** (Type=0) messages.
> +
> +The SEND message is always sent from Linux to the remote firmware. Each
> +SEND corresponds to a single REPLY message. The GPIO driver should
> +serialize messages and determine whether a REPLY message is required. If a
> +REPLY message is expected but not received within the specified timeout
> +period (currently 1 second in the Linux driver), the driver should return
> +-ETIMEOUT.
> +
> +GET_DIRECTION (Cmd=2)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 2   |port |line | 0   | 0  |
> +   +-----+-----+-----+-----+-----+----+

'line' should be 16 bit followed by a 32 bit value.

> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 2   |port |line | err | dir|
> +   +-----+-----+-----+-----+-----+----+

Same as above, 'line' should be 16 bit.  'err' should be 'status' and 'dir'
should be 'value'.

> +
> +- **err**: See above for definitions.
> +
> +- **dir**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +SET_DIRECTION (Cmd=3)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 3   |port |line | dir | 0  |
> +   +-----+-----+-----+-----+-----+----+


Same as above, i.e 'line' is 16 bit follow by a 32 bit value.

> +
> +- **dir**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 3   |port |line | err | 0  |
> +   +-----+-----+-----+-----+-----+----+

Same as my reply for GET_DIRECTION.

The same for all the other messages below.  There should be a direct and obvious
connection between this protocol and virtio-gpio.  In fact I'm starting to
wonder if we should have two endpoints per GPIO controller, one for the requestq
and another one for the eventq.  That would make this entire protocol
unecessary.  I will elaborate more later when I read Beleswar and Arnaud's
conversation on that topic.   

> +
> +- **err**: See above for definitions.
> +
> +
> +GET_VALUE (Cmd=4)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 4   |port |line | 0   | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 4   |port |line | err | val|
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +- **val**: Line level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +SET_VALUE (Cmd=5)
> +~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 5   |port |line | val | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **val**: Output level.
> +
> +  - 0: Low
> +  - 1: High
> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 5   |port |line | err | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +SET_IRQ_TYPE (Cmd=6)
> +~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 6   |port |line | val | wk |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **val**: IRQ types.
> +
> +  - 0: Interrupt disabled
> +  - 1: Rising edge trigger
> +  - 2: Falling edge trigger
> +  - 3: Both edge trigger
> +  - 4: High level trigger
> +  - 8: Low level trigger
> +
> +- **wk**: Wakeup enable.
> +
> +  The remote system should always aim to stay in a power-efficient state by
> +  shutting down or clock-gating the GPIO blocks that aren't in use. Since
> +  the remoteproc driver is responsible for managing the power states of the
> +  remote firmware, the GPIO driver does not require to know the firmware's
> +  running states.
> +
> +  When the wakeup bit is set, the remote firmware should configure the line
> +  as a wakeup source. The firmware should send the notification message to
> +  Linux after it is woken from the GPIO line.
> +
> +  - 0: Disable wakeup from GPIO
> +  - 1: Enable wakeup from GPIO

This is not part of the virtio-GPIO specification.  Again, modify the
virtio-GPIO specification to do this.

> +
> +**Reply:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 1   | 6   |port |line | err | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **err**: See above for definitions.
> +
> +NOTIFY_REPLY (Cmd=10)
> +~~~~~~~~~~~~~~~~~~~~~
> +The reply message for the notification is optional. The remote firmware can
> +implement it to simulate the interrupt acknowledgment behavior.
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 0   | 10  |port |line |level| 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **port**: The GPIO port (bank) index.
> +
> +- **line**: The GPIO line (pin) index of the port.
> +
> +- **level**: GPIO line status.


No.  In accordance with the specification, the only thing a device sends when an
interrupt occurs is VIRTIO_GPIO_IRQ_STATUS_VALID, or
VIRTIO_GPIO_IRQ_STATUS_INVALID to return the buffers back to the driver when
interrupts are disabled.


> +
> +Notification Message
> +--------------------
> +
> +Notifications are sent by the remote core and they have
> +**Type=2 (GPIO_RPMSG_NOTIFY)**:
> +

No.  Once again, we are not re-writing the specification.  Virtio-GPIO doesn't
need this so I don't see whey virtio-rpmsg-gpio would.

> +When a GPIO line asserts an interrupt on the remote processor, the firmware
> +should immediately mask the corresponding interrupt source and send a
> +notification message to the Linux. Upon completion of the interrupt
> +handling on the Linux side, the driver should issue a
> +command **SET_IRQ_TYPE** to the firmware to unmask the interrupt.
> +
> +A Notification message can arrive between a SEND and its REPLY message,
> +and the driver is expected to handle this scenario.
> +
> +.. code-block:: none
> +
> +   +-----+-----+-----+-----+-----+----+
> +   |0x00 |0x01 |0x02 |0x03 |0x04 |0x05|
> +   | 2   | 0   |port |line |type | 0  |
> +   +-----+-----+-----+-----+-----+----+
> +
> +- **port**: The GPIO port (bank) index.
> +
> +- **line**: The GPIO line (pin) index of the port.
> +
> +- **type**: Optional parameter to indicate the trigger event type.
> +
> diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
> index bee58f709b9a..e5eb1f82f01f 100644
> --- a/Documentation/driver-api/gpio/index.rst
> +++ b/Documentation/driver-api/gpio/index.rst
> @@ -16,6 +16,7 @@ Contents:
>     drivers-on-gpio
>     bt8xxgpio
>     pca953x
> +   gpio-rpmsg
>  
>  Core
>  ====
> -- 
> 2.43.0
> 
