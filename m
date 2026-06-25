Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E933DE44C;
	Thu, 25 Jun 2026 16:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403435; cv=none; b=kHrm64xwURc+B6hshzb1fR5SH7T8L1S/AjiFjLjn8FvY8DTE55zpx7G4vSyDSyzPsqeif4532Y61YANbwY94NiTrLPNP8viyHNWpNKBu0Rdlwdnds/rzOWJ8+6W3FN8LEsoEl2smF9Kwr/pb22yoD2iFWwrm8rfArA/7hpgd+us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403435; c=relaxed/simple;
	bh=0kBIPaYcVTPtLsKzP7y9AEPSyWpwTPiPVrljFMMzzpg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A4blbif8gUyCxCUjqBAp515oPW9ksTqIPLPRkrNYZZpNhNltLn0BXzTbff0HTPpjIbwNJoffRcciP9Wh4BXKRfuzwOc/uzbx/cTD33ypNfG1tdyIqS1xpGCQyUeloUmyXYBXEYllr5KmzTybA0kQfReSccZCHW9QqQouinP5lVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nbb1m7RR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nbb1m7RR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00FF1F000E9;
	Thu, 25 Jun 2026 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782403429;
	bh=ekQv0KO6FNssdkODIRevoRI79j6ADqNsmkhkyh1hNsI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nbb1m7RR9ORs8Jolk/mu+ZronZHKYwOgNm+dO9hidWhsBvhp4R13helXtfvpPaibg
	 FngLarCPanXaLwmjADmi6JHf6C5BuaW30n7B0fY/RphIccCbzvvY8sixknNFftqq1q
	 kZ7hy+6bstq5A4bF6CFLOZ3G51wi9YJf0Bm1XsGsoSu/GgoGZJCpJmmjJ46VMeV4k4
	 kcES8S9OpZj4jNjbvZT3VgtLN5Xe33WwudbM0pPoz195cXQOk6tlVyzhQj6zRDkaLW
	 jxlVlCaj1RcrZgcPOtwp0QjBxvoKdHa7EoqMFrD9ARWhm1Aql54SOkiApcP96AoMfM
	 yCNhPdotrR09Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-2-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:03:47 +0000
Message-Id: <20260625160348.D00FF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Missing endianness specification and implementation for multi-byte=
 protocol fields.
- [High] The driver's direction_output callback causes hardware glitches by=
 setting the direction before the initial value.
- [Medium] Inconsistent field sizes for REPLY and NOTIFICATION messages tru=
ncate the 'line' field.
- [Low] Incorrect command code in the SET_WAKEUP request diagram.
- [Low] Incorrect Linux error code usage (-ETIMEOUT).
- [Low] Grammatical error in SET_WAKEUP description.
--

commit 7712498eeadf5080c07364375a209ec4b75b63fd
Author: Shenwei Wang <shenwei.wang@nxp.com>
docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus

This commit introduces the documentation for the GPIO RPMSG transport
protocol used over the RPMSG bus. It details the message formats,
command codes, and notification structures for communicating with
remote processors.

> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation=
/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 0000000000000..7d351ff0adb0e
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,271 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG (Remote Processor Messaging) Protocol
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[ ... ]

> +Message Format
> +--------------
> +
> +The RPMSG message consists of a 8-byte packet with the following layout:
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |     cmd     |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+

[Severity: High]
Does this message format lack an explicit endianness specification for the
multi-byte fields (cmd, line, value)?

Without defining the endianness here, the driver implementation in
drivers/gpio/gpio-rpmsg.c:rpmsg_gpio_msg_prepare() assigns native integer t=
ypes
directly:

	msg->type =3D cmd;
	msg->gpio =3D line;
	msg->value =3D val;

Could this cause malformed packets when communicating between a big-endian =
host
and the remote processor?

> +
> +- **cmd**: Command code, used for GPIO_RPMSG_SEND messages.

[ ... ]

> +GPIO Commands
> +-------------
> +
> +Commands are specified in the **Cmd** field.
> +
> +The SEND message is always sent from Linux to the remote firmware. Each
> +SEND corresponds to a single REPLY message. The GPIO driver should
> +serialize messages and determine whether a REPLY message is required. If=
 a
> +REPLY message is expected but not received within the specified timeout
> +period (currently 1 second in the Linux driver), the driver should return
> +-ETIMEOUT.

[Severity: Low]
Should this use the standard Linux kernel error code -ETIMEDOUT instead of
-ETIMEOUT?

> +
> +GET_DIRECTION (Cmd=3D2)

[ ... ]

> +SET_DIRECTION (Cmd=3D3)
> +~~~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      3      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+
> +
> +- **value**: Direction.
> +
> +  - 0: None
> +  - 1: Output
> +  - 2: Input

[Severity: High]
Does this command lack a parameter to specify the initial output level,
requiring a separate SET_VALUE call?

In drivers/gpio/gpio-rpmsg.c:rpmsg_gpio_direction_output(), the driver sends
the SET_DIRECTION command before the SET_VALUE command:

	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION,
			       VIRTIO_GPIO_DIRECTION_OUT);

	ret =3D rpmsg_gpio_send_message(port);
	if (ret)
		return ret;

	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_VALUE, val);

	return rpmsg_gpio_send_message(port);

Could this sequence cause a hardware glitch by driving an unintended default
state on the physical GPIO line during the IPC transit time, before the
SET_VALUE command is processed?

> +
> +**Reply:**

[ ... ]

> +SET_WAKEUP (Cmd=3D16)
> +~~~~~~~~~~~~~~~~~~~
> +
> +**Request:**
> +
> +.. code-block:: none
> +
> +   +------+------+------+------+------+------+------+------+
> +   | 0x00 | 0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 |
> +   |      1      |    line     |           value           |
> +   +------+------+------+------+------+------+------+------+

[Severity: Low]
Does the command field in this diagram say '1' when it should say '16' or
'0x10' to match the SET_WAKEUP (Cmd=3D16) heading?

> +
> +- **value**: Wakeup enable.
> +
> +  The remote system should always aim to stay in a power-efficient state=
 by
> +  shutting down or clock-gating the GPIO blocks that aren't in use. Since
> +  the remoteproc driver is responsible for managing the power states of =
the
> +  remote firmware, the GPIO driver does not require to know the firmware=
's
> +  running states.

[Severity: Low]
Should "does not require to know" be rephrased to "does not need to know" f=
or
better grammar?

> +
> +  When the wakeup bit is set, the remote firmware should configure the l=
ine

[ ... ]

> +Notification Message
> +--------------------
> +
> +Notifications are sent by the remote core and they have
> +**Type=3D2 (GPIO_RPMSG_NOTIFY)**:
> +
> +When a GPIO line asserts an interrupt on the remote processor, the firmw=
are
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
> +   +------+------+--------+
> +   | 0x00 | 0x01 |  0x02  |
> +   |   2  | line | trigger|
> +   +------+------+--------+

[Severity: Medium]
Does this notification message truncate the line index to 8 bits?

The SEND message diagram earlier explicitly defines an 8-byte layout with a
16-bit line field (occupying bytes 0x02 and 0x03). However, this NOTIFICATI=
ON
diagram and the driver's struct rpmsg_gpio_response in
drivers/gpio/gpio-rpmsg.c restrict the line index to an 8-bit __u8:

	struct rpmsg_gpio_response {
		...
		__u8 line;
		...
	};

If an interrupt occurs on a line index greater than 255, could this cause t=
he
driver to mishandle the IRQ due to truncation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625155432.8151=
85-1-shenwei.wang@oss.nxp.com?part=3D1
