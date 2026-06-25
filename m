Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E33A1A3B;
	Thu, 25 Jun 2026 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403488; cv=none; b=ND3g5mtxpngALCrBBGbGZGLEH3aY8PrOqXPX5utkUOqvKJ978LnwzmrGU51zY2Waft3d7TY0IyG4Z8Oc9pXgHEdnZohHjJsG6ncAyTpjPpZ/+bdbpTlYd35XfF1DhtZ97EdWFQqit4iiJEGijE3CIlx0AKVrubSasjrRxF3eba4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403488; c=relaxed/simple;
	bh=UMl2ynnlPBw0WUr4C4fKB205gSaMrdmHnBuB3pcb21s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n4LiBk2E26DyEOFYeCTHJ8fLKhsYrPXVq0cKTfHYgc0K8J4lKADMH6TtAs7TTwvp6wHrjpD1vjQt2wDwIEeMi/LzwK8WrJ98H1M2B96V3W1sb5Prmk9infX4bGnKF4pzvsd0/PNb0c6o3KM/Cx7x35MPC6UhWpnsoHHf8Od23D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+/L6BlA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+/L6BlA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B63C1F000E9;
	Thu, 25 Jun 2026 16:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782403480;
	bh=73jA7wU3Uyuu0sS4WJHrAZsJvgB4lxU31+sQr9/PAsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O+/L6BlApGIhbjKWVR78JvNsPfsh7r5h5VSeTmglnGn8YtfoV84918OwtjSi6cO3d
	 Bcx/DEYiY5TqrjnZ3pIbBga3Lnw28Cplt7AOtSC8dSX4TSV2RM5y31Pld0wvA/nPUO
	 GxLpZz47lfGd9oFr7shBawS2lJyMKh2qZYCDOjMe23n857aLEF/zDO6YH4coAwEczi
	 qUWARxBikkhQoDC5qvjHO6IEVPTwm50HRWt6I9DWECS/DAEEApEJCNuRPRGsyu4ww5
	 QLwEjtpHscfuJa+3UYhbR0WVkOiMb3HGGQpuGoFhq99WVLKrlHWRn5XUlKZ4/IPOgQ
	 iwA/eaXeXRolQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 4/5] gpio: rpmsg: add generic rpmsg GPIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com>
 <20260625155432.815185-5-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:04:39 +0000
Message-Id: <20260625160440.6B63C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] Writing to the `.name` field of the immutable `gpio_rpmsg_irq_=
chip` structure attempts to modify read-only memory, causing a kernel panic.
- [High] Host-endian integers are directly assigned to little-endian protoc=
ol fields, breaking communication on big-endian architectures.
- [High] An RPMSG timeout permanently desynchronizes the request/response s=
tate machine because the driver lacks transaction IDs to discard late repli=
es.
- [High] The RPMSG callback blindly accesses the incoming message without v=
alidating that the payload length is sufficient.
- [High] The driver's GPIO callbacks can sleep, but it fails to set `gc->ca=
n_sleep =3D true`, incorrectly allowing them to be called from atomic conte=
xts.
- [High] Interrupts will be permanently masked after firing once because th=
e driver incorrectly relies on `irq_bus_sync_unlock` to send the unmask com=
mand during normal IRQ flow.
- [Medium] The driver leaks a reference to the `rproc` parent device node.
- [Medium] `rpmsg_gpio_direction_output()` configures the GPIO line as an o=
utput before setting the desired logical value, potentially causing a signa=
l glitch.
--

commit e50fe4c0d14d5e1abdf1ce315d5d9511d01ee66e
Author: Shenwei Wang <shenwei.wang@nxp.com>
Subject: gpio: rpmsg: add generic rpmsg GPIO driver

This commit adds a generic GPIO driver to support controlling GPIO
controllers that reside on a remote processor. It translates standard
Linux GPIO calls into RPMSG protocol messages sent to the remote side.

> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
> new file mode 100644
> index 0000000000000..332e2925a8309
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

[Severity: High]
If rpmsg_send times out, can this permanently desynchronize the request and
response state machine?

If a timeout occurs, rpmsg_gpio_send_message() returns -ETIMEDOUT but leaves
the channel active. Since the rpmsg_gpio_response doesn't appear to contain=
 a
transaction ID, if the remote processor sends a delayed reply to this timed=
-out
command, will rpmsg_gpio_channel_callback() mistakenly accept it as the
completion for the next unrelated command sent by the host?

> +	}
> +
> +	if (unlikely(port->recv_msg->status !=3D VIRTIO_GPIO_STATUS_OK)) {
> +		dev_err(&port->rpdev->dev, "remote core replies an error: cmd=3D%d!\n",
> +			port->send_msg->type);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct virtio_gpio_request *
> +rpmsg_gpio_msg_prepare(struct rpmsg_gpio_port *port, u16 line, u16 cmd, =
u32 val)
> +{
> +	struct virtio_gpio_request *msg =3D port->send_msg;
> +
> +	msg->type =3D cmd;
> +	msg->gpio =3D line;
> +	msg->value =3D val;

[Severity: High]
Are these values being assigned with the correct endianness?

The virtio_gpio_request structure defines these fields as __le16 and __le32,
but this assigns native host-endian integers to them directly. On big-endian
architectures, could this result in the remote processor misinterpreting the
commands?

> +
> +	return msg;
> +}

[ ... ]

> +static int rpmsg_gpio_direction_output(struct gpio_chip *gc, unsigned in=
t line, int val)
> +{
> +	struct rpmsg_gpio_port *port =3D gpiochip_get_data(gc);
> +	int ret;
> +
> +	guard(mutex)(&port->lock);
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_DIRECTION,
> +			       VIRTIO_GPIO_DIRECTION_OUT);
> +
> +	ret =3D rpmsg_gpio_send_message(port);
> +	if (ret)
> +		return ret;
> +
> +	rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_SET_VALUE, val);

[Severity: Medium]
Could configuring the direction before setting the value cause a signal
glitch?

rpmsg_gpio_direction_output() sends VIRTIO_GPIO_MSG_SET_DIRECTION to the
remote processor before VIRTIO_GPIO_MSG_SET_VALUE. If the remote hardware
applies the direction immediately, could this drive the line to its default
or previous state for a short window before the intended new value is appli=
ed?

> +
> +	return rpmsg_gpio_send_message(port);
> +}

[ ... ]

> +static void gpio_rpmsg_unmask_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d);
> +	u32 line =3D d->hwirq;
> +
> +	port->lines[line].irq_unmask =3D 1;
> +}

[Severity: High]
Will interrupts remain permanently masked on the remote processor after they
fire once?

gpio_rpmsg_unmask_irq() updates local memory but does not send an RPMSG
command to unmask the interrupt remotely. While gpio_rpmsg_irq_bus_sync_unl=
ock()
does send the command, the core IRQ subsystem (like handle_level_irq) masks
and unmasks interrupts without invoking bus lock/unlock callbacks during no=
rmal
interrupt dispatch. Does this mean the unmask command is never actually sent
after an interrupt is handled?

[ ... ]

> +static int rpmsg_gpiochip_register(struct rpmsg_device *rpdev,
> +				   struct device_node *np, const char *name)
> +{
> +	struct rpmsg_gpio_port *port;
> +	struct gpio_irq_chip *girq;
> +	struct gpio_chip *gc;
> +	int ret;
> +
> +	port =3D devm_kzalloc(&rpdev->dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
> +		return -ENOMEM;
> +
> +	ret =3D of_property_read_u32(np, "reg", &port->idx);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_mutex_init(&rpdev->dev, &port->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D of_property_read_u32(np, "ngpios", &port->ngpios);
> +	if (ret || port->ngpios > GPIOS_PER_PORT_DEFAULT)
> +		port->ngpios =3D GPIOS_PER_PORT_DEFAULT;
> +
> +	port->send_msg =3D devm_kzalloc(&rpdev->dev,
> +				      sizeof(*port->send_msg),
> +				      GFP_KERNEL);
> +
> +	port->recv_msg =3D devm_kzalloc(&rpdev->dev,
> +				      sizeof(*port->recv_msg),
> +				      GFP_KERNEL);
> +	if (!port->send_msg || !port->recv_msg)
> +		return -ENOMEM;
> +
> +	init_completion(&port->cmd_complete);
> +	port->rpdev =3D rpdev;
> +
> +	gc =3D &port->gc;
> +	gc->owner =3D THIS_MODULE;
> +	gc->parent =3D &rpdev->dev;
> +	gc->fwnode =3D of_fwnode_handle(np);
> +	gc->ngpio =3D port->ngpios;
> +	gc->base =3D -1;
> +	gc->label =3D devm_kasprintf(&rpdev->dev, GFP_KERNEL, "%s-gpio%d",
> +				   name, port->idx);

[Severity: High]
Should gc->can_sleep be explicitly set to true for this gpio_chip?

The .set and .get callbacks in this driver acquire a mutex and wait for
completion, which will sleep. Without setting gc->can_sleep =3D true, the
gpiolib framework treats these GPIOs as atomic. If consumer drivers call
these GPIO operations from within an interrupt handler or a spinlock,
could this trigger a "scheduling while atomic" panic?

> +
> +	gc->direction_input =3D rpmsg_gpio_direction_input;
> +	gc->direction_output =3D rpmsg_gpio_direction_output;
> +	gc->get_direction =3D rpmsg_gpio_get_direction;
> +	gc->get =3D rpmsg_gpio_get;
> +	gc->set =3D rpmsg_gpio_set;
> +
> +	girq =3D &gc->irq;
> +	gpio_irq_chip_set_chip(girq, &gpio_rpmsg_irq_chip);
> +	girq->parent_handler =3D NULL;
> +	girq->num_parents =3D 0;
> +	girq->parents =3D NULL;
> +	girq->chip->name =3D devm_kstrdup(&rpdev->dev, gc->label, GFP_KERNEL);

[Severity: Critical]
Does this attempt to write to read-only memory?

gpio_irq_chip_set_chip() assigns the const structure gpio_rpmsg_irq_chip to
girq->chip. Modifying the .name field of a const structure placed in the
.rodata section will trigger a write-protection page fault and crash the
kernel. Should the irq_chip be dynamically allocated, or should the name be
set differently?

> +
> +	dev_set_drvdata(&rpdev->dev, port);
> +
> +	return devm_gpiochip_add_data(&rpdev->dev, gc, port);
> +}

[ ... ]

> +static struct device_node *
> +rpmsg_get_channel_ofnode(struct rpmsg_device *rpdev, const char *compat,=
 u32 idx)
> +{
> +	struct device_node *np_chan =3D NULL, *np;
> +	struct rproc *rproc;
> +
> +	rproc =3D rproc_get_by_child(&rpdev->dev);
> +	if (!rproc)
> +		return NULL;
> +
> +	np =3D of_node_get(rproc->dev.of_node);
> +	if (!np && rproc->dev.parent)
> +		np =3D of_node_get(rproc->dev.parent->of_node);
> +
> +	if (np)
> +		np_chan =3D rpmsg_find_child_by_compat_reg(np, compat, idx);
> +
> +	return np_chan;

[Severity: Medium]
Does this leak the reference to the parent device node?

rpmsg_get_channel_ofnode() acquires a reference to np using of_node_get(),
but it appears to return without calling of_node_put(np) to release it.

> +}

[ ... ]

> +static int rpmsg_gpio_channel_callback(struct rpmsg_device *rpdev, void =
*data,
> +				       int len, void *priv, u32 src)
> +{
> +	struct rpmsg_gpio_response *msg =3D data;
> +	struct rpmsg_gpio_port *port =3D NULL;
> +
> +	port =3D dev_get_drvdata(&rpdev->dev);
> +
> +	if (!port) {
> +		dev_err(&rpdev->dev, "port is null\n");
> +		return -EINVAL;
> +	}
> +
> +	if (msg->type =3D=3D GPIO_RPMSG_REPLY) {

[Severity: High]
Is there a risk of an out-of-bounds read here if the message is truncated?

rpmsg_gpio_channel_callback() receives a payload of size len, but blindly
dereferences the data pointer as struct rpmsg_gpio_response without
verifying that len >=3D sizeof(struct rpmsg_gpio_response). Could this read
out-of-bounds memory if the remote processor sends a malformed or small
message?

> +		*port->recv_msg =3D *msg;
> +		complete(&port->cmd_complete);
> +	} else if (msg->type =3D=3D GPIO_RPMSG_NOTIFY) {
> +		generic_handle_domain_irq_safe(port->gc.irq.domain, msg->line);
> +	} else {
> +		dev_err(&rpdev->dev, "wrong message type (0x%x)\n", msg->type);
> +	}
> +
> +	return 0;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625155432.8151=
85-1-shenwei.wang@oss.nxp.com?part=3D4
