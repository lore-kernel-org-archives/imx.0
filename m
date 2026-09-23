Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A9E538D88;
	Wed, 23 Sep 2026 18:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189856; cv=none; b=hJkfAmV11skjChq8HYPzaVcDkSQt1SWOF6KA3kvh9WgTorsGiXMqKAQKx5Di86vP+TLGEZBvyLFCJQzcI3X0L0VV5dvxlZpTRJCLFCTe5jCY1VRU307YPOSaa4tX/Roq3SBSWdUq7AHbwKDeRPVG36QYmr1n/f9HNIZlxiNEMqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189856; c=relaxed/simple;
	bh=wnvd4rfDSyiIHvkwrXj/Or1gORtahHb9hq+YfUqXKXQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GSRR7PJBk4Ohul5Mog5007lLmzlfaOpXrL7aCsQ65Epkx+aF0Ahjwr3HKl+2JkHqniQs0rry/VGc+H9Oc7R+NsyU6kOCsm9kMSLA7s4dquIvNI/BHB9WyxpuKwQ1sj3jllCodWBH3TVPpDXOfamqwNACTlwERFo4LEPXqLuJI7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzEa9puI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzEa9puI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25EA1F000FF;
	Wed, 23 Sep 2026 18:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790189851;
	bh=KxmnboSLuJ/lqO+MIB6mb1W7WReWxofGWxOwlyLzy+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BzEa9puI4r1d4GhmwTSM0ganO6zuV7ztGrfMafT4Ajx2OL396h/zH/ZxzUOoC6Bnj
	 W4w/jthFUnLNEg1IIdPZ54gve4vAmCdUQbxu2Z+Kow5qgz/W5+SVUF7qcrVImTB4Q5
	 C9U7s6ErWTmfFi0aoP866Oa+vx0j70FoCSd0TqjOilgoBI6L7XZMT3ldY/VUvMB9W1
	 A//IeR9ZkG9RHMov3QMEEqWwjAUsKkzg8JZhkNz4cT+vC8h3Mun4oT+NRY8O0O1T9F
	 7VJ3s7lkdyJ5jIT6Mbxfj7xy7Zpf7gGwR8AxauZQX2F8HlnPnhsA3HZ0vdSZ5hNEx0
	 LBdTWOIxTknyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260923184255.299034-5-shenwei.wang@oss.nxp.com>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-5-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:57:30 +0000
Message-Id: <20260923185730.A25EA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] gpio: rpmsg: non-atomic bitmap_zero() clobbers concurrent set_bit(=
) updates
- [High] gpio: rpmsg: premature cancel_work_sync() causes UAF on port struct
- [High] gpio: rpmsg: RPC timeouts break request-response synchronization
- [High] gpio: rpmsg: early drvdata setup causes NULL pointer dereference i=
n probe
- [Medium] gpio: rpmsg: out-of-bounds read in callback due to missing lengt=
h check
- [Medium] gpio: rpmsg: eoi_work() unmasks interrupts that were just shut d=
own
--

commit aea7aeffb6bed8da7df793b582974e6352af17db
Author: Shenwei Wang <shenwei.wang@nxp.com>
Subject: gpio: rpmsg: add generic rpmsg GPIO driver

This commit adds a generic RPMSG GPIO driver allowing Linux to control
remote processor GPIOs via RPMSG.

> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
> new file mode 100644
> index 0000000000000..076af781f3bfb
> --- /dev/null
> +++ b/drivers/gpio/gpio-rpmsg.c
[ ... ]
> +static int rpmsg_gpio_send_message(struct rpmsg_gpio_port *port)
> +{
> +	int ret;
> +
> +	reinit_completion(&port->cmd_complete);
> +
> +	ret =3D rpmsg_send(port->rpdev->ept, port->send_msg, sizeof(*port->send=
_msg));
> +	if (ret) {
> +		dev_err(&port->rpdev->dev, "rpmsg_send failed: cmd=3D%d ret=3D%d\n",
> +			port->send_msg->type, ret);
> +		return ret;
> +	}
> +
> +	ret =3D wait_for_completion_timeout(&port->cmd_complete,
> +					  msecs_to_jiffies(RPMSG_TIMEOUT));
> +	if (ret =3D=3D 0) {
> +		dev_err(&port->rpdev->dev, "rpmsg_send timeout! cmd=3D%d\n",
> +			port->send_msg->type);
> +		return -ETIMEDOUT;
> +	}

[Severity: High]
Is it possible for a delayed reply to break the request-response
synchronization?

If wait_for_completion_timeout() times out, the driver aborts the current
request but leaves the channel active. If a new request is subsequently
sent, could a late reply from the timed-out request overwrite *port->recv_m=
sg
in rpmsg_gpio_channel_callback() and falsely wake up the completion for the
new request?

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
Could bitmap_zero() clobber concurrent updates?

Since bitmap_zero() expands to a non-atomic memory store, if a new
interrupt arrives and calls set_bit() in gpio_rpmsg_eoi_irq() while this
zeroing is executing, won't the new hardware interrupt get permanently lost?

> +
> +	for_each_set_bit(line, pending, port->ngpios) {
> +		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
> +				       port->lines[line].irq_type);

[Severity: Medium]
Does this blindly re-enable interrupts that were just shut down?

If free_irq() calls gpio_rpmsg_irq_shutdown() to mask the interrupt right
before or while this async work is executing, could this
VIRTIO_GPIO_MSG_IRQ_TYPE command override the shutdown and cause spurious
wakeups on the remote end?

> +
> +		if (rpmsg_gpio_send_message(port))
> +			dev_err(&port->rpdev->dev, "EOI error for line %u\n", line);
> +	}
> +}
[ ... ]
> +static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev, u32 idx,
> +				   struct device_node *np, const char *name)
> +{
[ ... ]
> +	girq =3D &gc->irq;
> +	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
> +	girq->parent_handler =3D NULL;
> +	girq->num_parents =3D 0;
> +	girq->parents =3D NULL;
> +	girq->default_type =3D IRQ_TYPE_NONE;
> +	girq->handler =3D handle_fasteoi_irq;
> +
> +	dev_set_drvdata(&rpdev->dev, port);
> +
> +	return devm_gpiochip_add_data(&rpdev->dev, gc, port);
> +}

[Severity: High]
Is there a risk of a NULL pointer dereference here if an early interrupt
arrives?

The call to dev_set_drvdata() exposes the port structure to the active RPMSG
endpoint before devm_gpiochip_add_data() initializes port->gc.irq.domain.

If the remote processor sends an interrupt notification at this exact momen=
t,
rpmsg_gpio_channel_callback() could retrieve the port and pass a still-NULL
IRQ domain to generic_handle_domain_irq_safe().

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
Is there a missing bounds check on len?

If the remote processor sends a payload smaller than
sizeof(struct rpmsg_gpio_response), this assignment will perform an
out-of-bounds memory read, potentially processing garbage data. Should we
verify len before dereferencing msg?

> +		complete(&port->cmd_complete);
> +	} else if (msg->type =3D=3D GPIO_RPMSG_NOTIFY) {
> +		line =3D le16_to_cpu(msg->line);
> +		generic_handle_domain_irq_safe(port->gc.irq.domain, line);
> +	} else {
> +		dev_err(&rpdev->dev, "wrong message type (0x%x)\n", msg->type);
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static void rpmsg_gpio_channel_remove(struct rpmsg_device *rpdev)
> +{
> +	struct rpmsg_gpio_port *port =3D dev_get_drvdata(&rpdev->dev);
> +
> +	cancel_work_sync(&port->eoi_work);
> +}

[Severity: High]
Could this lead to a use-after-free on the port struct when the driver is
unbound?

While cancel_work_sync() runs here, the RPMSG endpoint remains active until
devres tears it down later. If an interrupt arrives immediately after remov=
e()
returns:

rpmsg_gpio_channel_callback()
  -> gpio_rpmsg_eoi_irq()
     -> schedule_work(&port->eoi_work);

This would queue work on a struct that devres is about to free, leaving a
freed work_struct linked in the kernel's workqueue. Should the endpoint be
explicitly disabled before canceling the work?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923184255.2990=
34-1-shenwei.wang@oss.nxp.com?part=3D4
