Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9A32777F3
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 09:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094225; cv=none; b=RWZHPQcD6zldPmyvNUOEeY0oGnzH0cFLcq6+s/DWi3EehSNUJSM0aq7VQBflGdPmEurUgP2U59dwdYqp/p4rd/vxS/6huTzXnk58cxAHNft1PhQ6kZz2NNk+Dwrq4BJy1vpKyQw84SxWyY5HlRi4/a5wparIgBlHJ4jYG9fcDXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094225; c=relaxed/simple;
	bh=/qXvIsJ8VdYo1za5gDMZF4sR2U7+CYHHQSAB8bTwzG0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RYsDvQGijooTUXmzQTSd3ppks3feCT5kWUxdGMk9v+HE1Oj6sSLA6YJfeRqcMrUH39UKM2+A9tQ/ZBl3mQeuiUiS8jeG2flu9GO/xCuvSXL9LSlIE4V8/04KfVP/UEie9DkLWjapl5U3jkSv/iUMu3npmVWQ8xWegAT22TMmRak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoxuKElW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoxuKElW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C4A1F000E9;
	Fri,  7 Aug 2026 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786094224;
	bh=InCo+iJS66PtA8z9oDPR8rOlElMNo/ABJuPilLnpvus=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZoxuKElWTIEGYcr6TFnMC6VP6CmdrSO/w40+UGcRcRacwSTAL1paohFh0pWyvl7aG
	 tunMG5g4IktUU/mnPjj4/p69YoFuo37a0kDAFET33CDCCb2aTLro16eG32+xyuNNR9
	 NAPQqsFgeBAOS3HM1JI9uwZw9tbdHn/f5rqkVjAbYy4XWYRK/NWUjLbOSzUjR/lWNk
	 p9rjsudBwgZFcqpzmoKvdZAy4K/R1pvzfEkTeA2LP69pDCvppYJAVIkUBLnDhutWWT
	 2uSGKTQjkoeQJXnhXXT15u3d/lz7VQmKVYSFif9BHKwHFjX7msKhvjV2ae97o9Yd7A
	 FimnlOZ06JEkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] serial: qcom-geni: Propagate errors from optional
 IRQ lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260807090945.41690-1-phucduc.bui@gmail.com>
References: <20260807090945.41690-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 09:17:02 +0000
Message-Id: <20260807091703.C7C4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error cleanup path in `qcom_geni_serial_probe()` leaks the IDA=
 allocated for the UART line index, which is severely exacerbated by the ne=
wly added IRQ probe deferral path.
--

--- Patch [1]: [PATCH 1/3] serial: qcom-geni: Propagate errors from optiona=
l IRQ lookup ---
commit 9ec5f0b3d9989a6071c2d4680336709af497a5bf
Author: bui duc phuc <phucduc.bui@gmail.com>

serial: qcom-geni: Propagate errors from optional IRQ lookup

This commit updates qcom_geni_serial_probe() to propagate errors, such as
-EPROBE_DEFER, from platform_get_irq_optional() for the wakeup IRQ.
Previously, errors other than -ENXIO were ignored and probe continued.

> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 7ead87b4eb65b..240a6d67d8475 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1883,8 +1883,13 @@ static int qcom_geni_serial_probe(struct platform_=
device *pdev)
>  	uport->irq =3D irq;
>  	uport->has_sysrq =3D IS_ENABLED(CONFIG_SERIAL_QCOM_GENI_CONSOLE);
> =20
> -	if (!data->console)
> +	if (!data->console) {
>  		port->wakeup_irq =3D platform_get_irq_optional(pdev, 1);
> +		if (port->wakeup_irq < 0 && port->wakeup_irq !=3D -ENXIO) {
> +			ret =3D port->wakeup_irq;
> +			goto error;

[Severity: High]
This is a pre-existing issue, but does this goto error path leak the port I=
DA?

In get_port_from_line(), an IDA is allocated for the UART line index with a
very restricted range:

drivers/tty/serial/qcom_geni_serial.c:get_port_from_line() {
    ...
		if (line < 0)
			line =3D ida_alloc_range(&port_ida, max_alias_num + 1,
					       nr_ports - 1, GFP_KERNEL);
		else
			line =3D ida_alloc_range(&port_ida, line,
					       nr_ports - 1, GFP_KERNEL);
    ...
}

However, when jumping to the error label in qcom_geni_serial_probe(), the
cleanup only detaches PM domains and misses calling ida_free():

drivers/tty/serial/qcom_geni_serial.c:qcom_geni_serial_probe() {
    ...
error:
	dev_pm_domain_detach_list(port->pd_list);
	return ret;
}

Since this patch adds a check that propagates -EPROBE_DEFER when the option=
al
wakeup IRQ is not yet ready, this error path will be frequently hit during
normal boot.

Because the max IDA limit is very small, just a few probe deferrals will
exhaust the available IDs, causing get_port_from_line() to return -ENXIO and
permanently preventing the UART driver from probing on subsequent attempts.

Should ida_free(&port_ida, uport->line) be called before jumping to the err=
or
label, or added to the error label itself, to prevent exhausting the ID spa=
ce?

> +		}
> +	}
> =20
>  	if (of_property_read_bool(pdev->dev.of_node, "rx-tx-swap"))
>  		port->rx_tx_swap =3D true;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807090945.4169=
0-1-phucduc.bui@gmail.com?part=3D1
