Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ED94ACC8F;
	Wed, 23 Sep 2026 18:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189704; cv=none; b=PnqGACI3Szp64YyKvIE6Rz+jOoozwYHaeNOhmqpZjbq/WWmiq8HVL1JXpn7ZXFY+z6mYEfHUo5Sq4J7suUQX49JhNE4J1XYhoaSp9pD4oZKe7n0klhMm/VJBMZBQnUe2IYpXDP2AUKXlLQZ+yjVMgRfxO6Af3kOrTFuHK5yFC5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189704; c=relaxed/simple;
	bh=QAL4WxhOfhuLB/6XDHiHfq6EuzWQbCIqdwUrIMvgXKk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WZNJO67Wthfc7pgI7UwhhIzJyM8wZyyc0TFs75itj19wTQrVa9uMcciZvhBQ1nLAO4ndz3C3Xdu/6fbcLBuw468OOMbklT0f9ekLfu3Ywgi6T91ipQkslK5/R0CLDFKf5rWSnsRF/wopXCtCEvbhtD9rPrtdGH8oYxoeLVgfzvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCRCYgz3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCRCYgz3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908631F000FF;
	Wed, 23 Sep 2026 18:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790189699;
	bh=b6+Y0yhQ6ZjrW4BiPts3+hvlMSV68xHnnpXIu46/k9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gCRCYgz3z7OU7EK77Ln+YaOjzw6AAAsq20PSkmRZEJleKhIbaZQ4iWPVlvuF/dn7p
	 jMhoh9oRhoXpl8PVB9tdci1Lrip6Q98kz3bibdFHNE4JKRgP/tMdMmMSzMVwUl9Yf7
	 CHd4QUWvvP6AdAXnR59HMKZJlLh9leyuLBlOkboYaXyQSvscDMO6SAaYaxjVrLMP2T
	 NdwCYu516zhZ/w1ZBed2oSzRl9suP4LkX6zaXAPk0eH5dSbEmvlao3/54wtzxGMhck
	 o3+ocKFIiNQuIZGtsKx+4SYf4GXYAzHZ5scLchlDpQkA4V+rmBBgJiEjchpB+NPvkF
	 /0DwokUUZfH8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 5/5] arm64: dts: imx8ulp: Add rpmsg node under
 imx_rproc
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenwei Wang" <shenwei.wang@oss.nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260923184255.299034-6-shenwei.wang@oss.nxp.com>
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
 <20260923184255.299034-6-shenwei.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 18:54:58 +0000
Message-Id: <20260923185458.908631F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: lost EOI due to race between set_bit() and bitmap_zero()
- [High] gpio: out-of-bounds read in rpmsg_gpio_channel_callback()
--

commit aea7aeffb6bed8da7df793b582974e6352af17db
Author: Shenwei Wang <shenwei.wang@nxp.com>

gpio: rpmsg: add generic rpmsg GPIO driver

On an AMP platform, the system may include multiple processors communicating
via the RPMSG protocol. This driver implements the standard GPIO interface,
allowing the Linux side to control GPIO controllers on the remote processor.

> diff --git a/drivers/gpio/gpio-rpmsg.c b/drivers/gpio/gpio-rpmsg.c
> new file mode 100644
> index 0000000000000..076af781f3bfb
> --- /dev/null
> +++ b/drivers/gpio/gpio-rpmsg.c

[ ... ]

> +static void gpio_rpmsg_eoi_irq(struct irq_data *d)
> +{
> +	struct rpmsg_gpio_port *port =3D irq_data_get_irq_chip_data(d);
> +
> +	set_bit(d->hwirq, port->pending_eoi);
> +	schedule_work(&port->eoi_work);
> +}

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
Does this code lose EOI events in port->pending_eoi?

In gpio_rpmsg_eoi_irq(), set_bit() is used to atomically record an EOI for a
specific GPIO line in port->pending_eoi. However, bitmap_zero() performs a
non-atomic memory clear.=20

If set_bit() executes after the workqueue reads the bitmap in bitmap_copy(),
but before or during the non-atomic bitmap_zero(), won't the newly set bit
be overwritten with zero and lost?

> +
> +	for_each_set_bit(line, pending, port->ngpios) {
> +		rpmsg_gpio_msg_prepare(port, line, VIRTIO_GPIO_MSG_IRQ_TYPE,
> +				       port->lines[line].irq_type);

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

[Severity: High]
Does this code read beyond the data buffer?

The callback casts the data pointer to struct rpmsg_gpio_response and
immediately accesses msg->type, or copies the entire struct.

Since the len parameter is not validated, if a truncated packet with a leng=
th
smaller than sizeof(struct rpmsg_gpio_response) is received, couldn't this
result in an out-of-bounds read?

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

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923184255.2990=
34-1-shenwei.wang@oss.nxp.com?part=3D5
