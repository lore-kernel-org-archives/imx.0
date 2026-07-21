Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFF645DF5C;
	Tue, 21 Jul 2026 21:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667758; cv=none; b=pzpIUXh1qie9wfXu9MjQ/6DFLz6yvoHs07Fx4iPk2A7Wg1ZwHl7mmWmTmVJmy4V60aqDhnyyV/crBAAehVKqI9BNTBcjzmWr29zPWtssNoUO8e5d+x2ZXmgYEJZt2qPsXT1VmWwdP1gwNqbMaMs/5qVCz9D6ffsXJh6boOj7UCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667758; c=relaxed/simple;
	bh=D1AfetnminDL8zMg+HV11XUeR2zX74dz2xzmL4NZ8Jk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RfPjwK77BriLFK05ZrlHmzodS6EvskzXwZnjK5v8VfGj47f3jP8Mbe+BtOOjSPW4QYcMO+wSJMM+z45/CH3y+6bCZrla1Xxnu+PrrsG0kveVIYND8JJx8eZPPcYjpGxhZbQeB4UWbtevaogEImD3JkhGCssT693pJHjU5h0ZaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQI1btu0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQI1btu0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA2D1F00A3A;
	Tue, 21 Jul 2026 21:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784667751;
	bh=NVV/pWhOZrG6JJxmlSr8aaR0EitqasKNH3vf3Kp3gkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RQI1btu0QN5Cu6iRknqvsWH3oIMvYbf8Aqp1r2KJi757rcS1Bm1ZSSCGHWYvsAlYB
	 MQwG62xtgLOqrG2mvBzTj4E6CJ7hrRfsdxK8OwIZ4SV0OaPIJiC0qY0yk5mIcvxlhp
	 A+2h7YTVUs4TmFVKl2zj/k7DOf9rjIm36q5t6W8w6O4sRyv3U0jmQa2uFfzqedf+Tm
	 Ig4FoiGvtHLdr09g4/5aTPfMFYznXUbQDLtrMn+78lz8U/VsP1VqfnoN755mCQcM74
	 kVrJO7zxQH7QzOU0y8340AMf7113sUEtdg2harf1KYPCXY+VfcWNsKFfj4CR9cOaJx
	 Ah+Bwuz2hI0Xg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260721204704.400781-5-shenwei.wang@oss.nxp.com>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-5-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 21:02:30 +0000
Message-Id: <20260721210231.0CA2D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Data race between `gpio_rpmsg_eoi_irq()` and `gpio_rpmsg_eoi_work(=
)` causes lost End-Of-Interrupt (EOI) signals.
- [High] Explicitly disabling an IRQ fails to mask it on the remote hardwar=
e and causes an infinite interrupt storm.
- [High] A timeout in `rpmsg_gpio_send_message()` permanently corrupts the =
request/response synchronization of the RPMSG channel.
- [High] Use-After-Free vulnerability due to incorrect teardown ordering be=
tween `devm_gpiochip_add_data`, `cancel_work_sync`, and the RPMSG endpoint.
- [High] Missing `gc->can_sleep =3D true` causes "scheduling while atomic" =
panics.
- [Medium] The RPMSG callback does not validate the incoming message length=
, risking out-of-bounds memory reads.
- [Medium] Implicit padding in `struct rpmsg_gpio_response` breaks cross-pl=
atform IPC.
--

--- Patch [4]: [PATCH v15 4/5] gpio: rpmsg: add generic rpmsg GPIO driver -=
--
commit 1ad498fb1fd9abd6b832044bd985e9e16c8577db
Author: Shenwei Wang <shenwei.wang@nxp.com>
Subject: gpio: rpmsg: add generic rpmsg GPIO driver

On an AMP platform, the system may include multiple processors communicating
via the RPMSG protocol. The driver implements the standard GPIO interface,
allowing the Linux side to control GPIO controllers which reside in the
remote processor via RPMSG protocol.

diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
new file mode 100644
index 0000000000000..5d2d59e6314b5
--- /dev/null
+++ b/drivers/gpio/gpio-rpmsg.c
@@ -0,0 +1,587 @@
[ ... ]
> +struct rpmsg_gpio_response {
> +	__u8 type;
> +	union {
> +		/* command reply */
> +		struct {
> +			__u8 status;
> +			__u8 value;
> +		};
> +
> +		/* interrupt notification */
> +		struct {
> +			__le16 line;
> +		};
> +	};
> +};

[Severity: Medium]
Does the implicit padding inserted after type break cross-platform IPC if
the remote firmware uses packed structures or a compiler with different
padding rules?

[ ... ]
> +static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port)
> +{
[ ... ]
> +	ret =3D wait_for_completion_timeout(&port->cmd_complete,
> +					  msecs_to_jiffies(RPMSG_TIMEOUT));
> +	if (ret =3D=3D 0) {
> +		dev_err(&port->rpdev->dev, "rpmsg_send timeout! cmd=3D%d\n",
> +			port->send_msg->type);
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
If the remote processor replies after this timeout, won't the next request
immediately complete using the stale response?

Since the protocol lacks transaction IDs, a single delayed response might
permanently break the channel synchronization for all future transactions.

[ ... ]
> +static void gpio_rpmsg_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d);
> +	u32 line =3D d->hwirq;
> +
> +	/*
> +	 * For mask irq, do nothing here.
> +	 * The remote system will mask interrupt after an interrupt occurs,
> +	 * and then send a notification to Linux system. After Linux system
> +	 * handles the notification, it sends an rpmsg back to the remote
> +	 * system to unmask this interrupt again.
> +	 */
> +	if (port->lines[line].irq_mask && !port->lines[line].irq_unmask) {
> +		port->lines[line].irq_mask =3D 0;
> +		mutex_unlock(&port->lock);
> +		return;
> +	}

[Severity: High]
When Linux explicitly disables an IRQ via disable_irq(), it sets the mask
flag. Will returning early here without sending a hardware mask command
cause the remote processor to endlessly send interrupts, creating an
interrupt storm?

[ ... ]
> +static void gpio_rpmsg_eoi_work(struct work_struct *work)
> +{
> +	struct rpmsg_gpio_port *port =3D
> +		container_of(work, struct rpmsg_gpio_port, eoi_work);
> +	unsigned long pending[BITS_TO_LONGS(GPIOS_PER_PORT_MAX)];
> +	unsigned int line;
> +
> +	guard(mutex)(&port->lock);
> +
> +	bitmap_copy(pending, port->pending_eoi, port->ngpios);
> +	bitmap_zero(port->pending_eoi, port->ngpios);

[Severity: High]
Can this non-atomic clearing race with gpio_rpmsg_eoi_irq()?

If a new interrupt fires and calls set_bit(d->hwirq, port->pending_eoi)
between this bitmap_copy() and bitmap_zero(), won't the new
end-of-interrupt signal be unconditionally overwritten and lost, locking
up that GPIO line?

[ ... ]
> +static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev, u32 idx,
> +				   struct device_node *np, const char *name)
> +{
[ ... ]
> +	gc->direction_input =3D rpmsg_gpio_direction_input;
> +	gc->direction_output =3D rpmsg_gpio_direction_output;
> +	gc->get_direction =3D rpmsg_gpio_get_direction;
> +	gc->get =3D rpmsg_gpio_get;
> +	gc->set =3D rpmsg_gpio_set;

[Severity: High]
Since the get and set callbacks wait on a completion and use a mutex (both
of which can sleep), should gc->can_sleep be set to true?

Without it, gpiolib might allow atomic fast-path accesses, which could
trigger scheduling while atomic panics.

[ ... ]
> +static int rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void =
*data,
> +				       int len, void *priv, u32 src)
> +{
> +	struct rpmsg_gpio_response *msg =3D data;
> +	struct rpmsg_gpio_port *port =3D NULL;
> +	u32 line;
> +
> +	port =3D dev_get_drvdata(&rpdev->dev);
> +
> +	if (!port) {
> +		dev_err(&rpdev->dev, "port is null\n");
> +		return -EINVAL;
> +	}
> +
> +	if (msg->type =3D=3D GPIO_RPMSG_REPLY) {
> +		*port->recv_msg =3D *msg;

[Severity: Medium]
Is there a risk of an out-of-bounds read here if the remote processor
sends a malformed message smaller than sizeof(struct rpmsg_gpio_response)?

[ ... ]
> +static void rpmsg_gpio_channel_remove(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_gpio_port *port =3D dev_get_drvdata(&rpdev->dev);
> +
> +	cancel_work_sync(&port->eoi_work);
> +}

[Severity: High]
Does the use of devm_gpiochip_add_data() during registration cause the GPIO
chip to remain active after rpmsg_gpio_channel_remove() completes?

If an interrupt arrives right after this cancel_work_sync(), couldn't the
work be re-queued and executed on freed memory once devres finally cleans
up the port?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721204704.4007=
81-1-shenwei.wang@oss.nxp.com?part=3D4
