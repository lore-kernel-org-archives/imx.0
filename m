Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C7E4499B4;
	Sun, 12 Jul 2026 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857959; cv=none; b=TlK88AvL7XOghOxPhH81KYvUj4TPZ1NSqcKbFdmmd2b694rjP16v3vMtTdyxnrE338EF7i/hLSqXYoV8+l3WFHfVXpk9EeKkdJ8m0QUqDUsBaYpAZr3qTAp/j07kyVjYvq1kKoIzELmWOBTrs6e9bOv2Cie51VW8eRD1ZgXvJXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857959; c=relaxed/simple;
	bh=hqUMQ1iK5Qq9dHICmjWGT9HGwjA9VtLe3PS+dyCd/4w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hgZOridvj1l7GrhLJS2HynmPPIv9hS9ND/54bLn6nsW2taNwNUEPr11TVLWdykH6QGOHgoRkOk3yF2XAgfaPNNec5LF+QN4CRWEB9LejboIkhL+EbX8KF1YlZVUqd9OAxVOp/1bzm3uYmEqDI922mqen/xBObl7CVQdQ5KT5Ves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R01vq+q9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R01vq+q9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BB11F000E9;
	Sun, 12 Jul 2026 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783857957;
	bh=Xy9NnUHIoYi3GR+3L/ak76W3rc9pF706KItc4Ml7lkQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R01vq+q93RBezHBtZnHipYbmm5M11pLZA9J12a0/5t2AxEE7pOf4njptfJfDDOa7O
	 RpFZFQVkO4N6s5zG5aC+/Z3v93V/fG+IiUJLV56+rlEIiZW/b6BjIjgWGiy2lUOGIz
	 Sd535rTcJNQS400ZcJMkFZ1DmDN70FsqbwbHAJS38zZr0TO3IVpNffliBsTwmVQBR1
	 LsLd0Pq1nvMhM1Uz9XahB4VTJU3ow708nYskXPh9Vgn3CRbDkbPSyGkDuTABNfmLiy
	 IcvGgZXLzbsTvwXVFo/ZLZlci1qDlhUDABxCmDT/GyqOcoqcwYbIzwS+QM0y/7Knhp
	 9+1DSplaQrISQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/5] arm64: dts: imx8mq-librem5: Correct link
 frequency list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260712115012.91600-6-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
 <20260712115012.91600-6-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 12:05:57 +0000
Message-Id: <20260712120557.75BB11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The link frequency validation loop incorrectly tests dummy modes t=
hat are unsupported by the active MIPI lane configuration, demanding dummy =
frequencies in the device tree.
- [Medium] The driver validates link frequencies before obtaining its clock=
, causing the validation check to evaluate to 0 and silently bypass error h=
andling.
--

--- Patch [5]: [PATCH v5 5/5] arm64: dts: imx8mq-librem5: Correct link freq=
uency list ---
commit 7374317f64e34ad7703aeaa4a94012403d0aca4d
Author: Pengyu Luo <mitltlatltl@gmail.com>

arm64: dts: imx8mq-librem5: Correct link frequency list

This patch updates the link frequencies for the hi846 camera sensor on the
imx8mq-librem5 board to 187.5MHz and 375MHz based on the datasheet.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mq-librem5.dtsi
> index f5d529c5baf3e..cc5604172192c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> @@ -1122,7 +1122,7 @@ port {
>  			camera1_ep: endpoint {
>  				data-lanes =3D <1 2>;
>  				link-frequencies =3D /bits/ 64
> -					<80000000 200000000 300000000>;
> +					<187500000 375000000>;

[Severity: Medium]
Does the driver actually validate these new device tree link frequencies?

Looking at hi846_probe() in drivers/media/i2c/hi846.c, it calls
hi846_parse_dt() before obtaining hi846->clock. During parsing,
hi846_check_link_freqs() calls clk_get_rate(hi846->clock) on a NULL pointer,
returning 0.

When 0 is not found in the DT, it is returned as an unsupported frequency:

drivers/media/i2c/hi846.c:hi846_parse_dt() {
    ...
    if (fq) {
        dev_err(dev, "Link frequency of %lld is not supported\n", fq);
        ret =3D -EINVAL;
        goto check_hwcfg_error;
    }
    ...
}

Since fq evaluates to 0, the error handler is skipped and the driver silent=
ly
bypasses link frequency validation.

[Severity: High]
If the clock ordering bug in the driver is fixed, will probe fatally fail
for this 2-lane configuration?

The librem5 has a 2-lane setup, but hi846_check_link_freqs() in the driver
iterates over all supported_modes without filtering out modes that are
exclusive to 4-lanes:

drivers/media/i2c/hi846.c:hi846_check_link_freqs() {
    ...
    for (i =3D 0; i < freqs_count; i++) {
        link_freq =3D hi846_get_link_freq(hi846, &supported_modes[i]);
    ...
}

For 4-lane modes, the 2-lane divider is a dummy value. This causes
hi846_get_link_freq() to calculate an invalid 750MHz frequency:

drivers/media/i2c/hi846.c:hi846_get_link_freq() {
    ...
    return mul_u64_u32_div(mclk, 90, 3 * mipi_clk_div);
    ...
}

Because 750MHz is rightfully absent from these updated link-frequencies,
probe will abort once the NULL clock issue is resolved. Could the driver
be updated to filter modes by active lane count?

>  				remote-endpoint =3D <&mipi1_sensor_ep>;
>  			};
>  		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712115012.9160=
0-1-mitltlatltl@gmail.com?part=3D5
