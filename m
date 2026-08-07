Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A909384CD5
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094328; cv=none; b=GT5SgA+zZHFuBE8+Zdt5OfqvCmAcwvdiZe/rxl1kY9ycTNGOsJeGumsvM2z5+u9VqNDZB8UeVmaoNTUeawoagPQ6NFSRgUXpqOxsVru9tDUnE92dJxuMXHS7L2PZ6+EPC/47TvaC+5LMX7+8ctnNwj+omgmcgC7y36rI4lRsvbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094328; c=relaxed/simple;
	bh=R9tVg6B/emm93qciirmN4VDe2Cf9Io1WsPa2DsS9AbY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gOWs4uSwmhGaAIvpeLZ+BQ9uAKiy/IjrCDPI1GtoNbjSYAle4aMHbb0ky+XZb3M6NF/PmQfPeqrXqJ+jYxllhKVhyCDbS6op5mcjBKgXu/X179JASYQbGh+0vaVun9os8vkZCuGImWG5h4KwYKIZ93i6NBP5VVrbLZA2LC55KzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQWuM0V+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQWuM0V+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CCA01F000E9;
	Fri,  7 Aug 2026 09:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786094326;
	bh=Erq/DWV1BDYU+aF7PPap/l4A6hqO2/v/YQFQr1n/RzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FQWuM0V+jgouP+nhBCGmhzxiS1D0cqs9H3YyFVbOZv70+WABPvS5Lx882Od9Llvzz
	 eM8BvA5CYGfvuUam2Xhwq3yzhzSo6v3AR7VtqRgQ21gtqa4joYJNA6jyLK6lNua398
	 sfkgwGnFDQpM5Dw4Irzy5LDu/lKSP/DvxGh+VYtdw3czsvmnrfKrZNOINetnAzmT7p
	 JQlA21NCusEnoIznm9eepsEDrmyuyVtVvWhMZR6KGZhtYuDWBhWuL4TTIPxfixz/4E
	 MEhEZJ2riT/2Cyw3rwkTUDOhz+akcd0ydgFUfAPBgAD9Hev7RVH6ZzuV2hc0RpDT4m
	 Ptxpe82MX571g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] tty: serial: imx: Propagate errors from optional
 IRQ lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260807090945.41690-2-phucduc.bui@gmail.com>
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
 <20260807090945.41690-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 09:18:45 +0000
Message-Id: <20260807091846.2CCA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The global `imx_uart_ports` array retains a dangling pointer to a =
freed `sport` object if `uart_add_one_port()` fails during probe, or after =
device unbind.
--

--- Patch [2]: [PATCH 2/3] tty: serial: imx: Propagate errors from optional=
 IRQ lookup ---
commit 1b33dc8f639bc337c3928860fbfd0de822e373c4
Author: bui duc phuc <phucduc.bui@gmail.com>

tty: serial: imx: Propagate errors from optional IRQ lookup

This commit updates imx_uart_probe() to properly propagate error codes
from platform_get_irq_optional(). It ensures that errors like probe
deferrals are returned rather than ignored.

> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 251a50c8aa387..4224454d360ef 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -2463,7 +2463,11 @@ static int imx_uart_probe(struct platform_device *=
pdev)
>  	if (rxirq < 0)
>  		return rxirq;
>  	txirq =3D platform_get_irq_optional(pdev, 1);
> +	if (txirq < 0 && txirq !=3D -ENXIO)
> +		return txirq;
>  	rtsirq =3D platform_get_irq_optional(pdev, 2);
> +	if (rtsirq < 0 && rtsirq !=3D -ENXIO)
> +		return rtsirq;
> =20
>  	sport->port.dev =3D &pdev->dev;
>  	sport->port.mapbase =3D res->start;

[Severity: High]
This is a pre-existing issue, but looking further down in imx_uart_probe(),
does the error path for uart_add_one_port() leave a dangling pointer in the
global array?

If uart_add_one_port() fails, we see this sequence:

drivers/tty/serial/imx.c:imx_uart_probe() {
    ...
    imx_uart_ports[sport->port.line] =3D sport;
    ...
    ret =3D uart_add_one_port(&imx_uart_uart_driver, &sport->port);

err_clk:
    clk_disable_unprepare(sport->clk_ipg);
    return ret;
}

When this returns an error, devres will free the memory for sport, but
the global imx_uart_ports array still retains the pointer. Can a subsequent
console operation dereference this freed memory?

Additionally, the same issue appears to exist in imx_uart_remove() when
the device is unbound:

drivers/tty/serial/imx.c:imx_uart_remove() {
    struct imx_port *sport =3D platform_get_drvdata(pdev);

    uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
}

Should this removal function explicitly clear the pointer from
imx_uart_ports to avoid leaving a dangling pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807090945.4169=
0-1-phucduc.bui@gmail.com?part=3D2
