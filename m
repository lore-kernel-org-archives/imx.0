Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084695;
	b=mwv/FraJ5/XQ+c1HxKgM/8LUh3rbb4seLZ4aD6jF0VJc7eExuSASgYO0kl3iCi8AZl+m
	 tbuN6MK5pKcBjhnZqaRo+7psW12pNX9pJ8sw5qk2K8XmSDMwaf6P5/QlYt4Ys/C3qferV
	 8PV7uPAcrgha7/nAwN3JKeLp5yHcm0BYfq4VzhzXLGuBoDUBe9zqlsT5LlxlBO42y/u+C
	 qxFaRku+uR/5y9SkPEbzWDDMp/XIJyYX1IA6EGT0VfDQyMXNbIapfMZvHWdLTkrMuszJW
	 nSARNw0VRRnu6jq64ql82QoQ4O0wa4pDMT05TnoQKLTBgNqlATAVLRIDQiDPa8IIz8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084695;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hb9SBAxjoFg7sCmioO5nEQcXRYJHzr79D+k5eb5o8ZI=;
	b=fjK9spu/TKAlBgjbyaSDJCEm9MFVs7N2DWBDWMCOmylZvxB5xqsPx9rCKhjExOuPpEve
	 yzI0DYTp//wbA+u4Gt9hQKoHQ1MiN1Hp6R6xbGo/UeePLhVyotOyQPUAFbmJsJ/WBeeF5
	 uiUI9toqOe2AFqC/bZS0RmQbzEvwM+3gdcIT1+Hs9zmBRoTLuvrBSVQYH6y2oyN+qqBK0
	 cwHtB6UwDWfdqxKXJeA8aClECHZBFX7bJ9OcnGlqZSseYs8spxDl3T2NCYTEo5dVwg/64
	 tS1XYYD1PcyqJlo6XNkBgAH+pzCoHvlGU0Rsiu8ct1n5K8FEDXmDIYf2D+bMivlR1KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GsWbzdnf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CEC606A320;
	Thu, 19 Nov 2026 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GsWbzdnf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1691F000C8;
	Thu, 19 Nov 2026 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084694;
	bh=hb9SBAxjoFg7sCmioO5nEQcXRYJHzr79D+k5eb5o8ZI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GsWbzdnfXgmMCl/iPSDzYUzKIWamn+EpyMJ/CbOcuuH09IWC2R4Yd+zbrl3A4llls
	 4nXYaae+YogmzOv1w86I0VyYKo4a9hLj4td3aBXXm/UHNSAPnOdh8ncWhYUC9Mn0tS
	 w8ZMV/+LYIGlbeIL0Oivmge2eiYG9Ja0Vh+oLo4JytrX7NtT7UkRzRXNJ589Kvgizm
	 mfagUND3m3vV4eCEKcANcu4b4kokbmVsGU76CjNobTsXlsHRU/ZHFqmq8vXtfbk2FB
	 +VRA314VA6KIR/FyD/1txC5WmVyTCn6aUIeT3Zd6fz3S4J/2qVu/l+hbOBfBL6s4Tl
	 ygIpr7IoLdKmQ==
Message-ID: <sashiko-outbox-222970@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 4/4] ptp: netc: use 133 MHz system clock on
 i.MX952
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frieder Schrempf" <frieder@fris.de>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261118-imx952-enetc-v1-4-25721440602e@kontron.de>
References: <20261118-imx952-enetc-v1-0-25721440602e@kontron.de>
 <20261118-imx952-enetc-v1-4-25721440602e@kontron.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:38:14 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] ptp: netc: divide-by-zero in
  netc_timer_get_reference_clk_source() [1]
--

commit e475f16482c806a640a726db8d69f83db4761a16
Author: Clark Wang <xiaoning.wang@nxp.com>

ptp: netc: use 133 MHz system clock on i.MX952

This commit sets the default NETC timer reference clock frequency to
133 MHz on i.MX952 (NETC revision 4.6) when no reference clock is specified
in the device tree.

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> index 1a327a7561e39..7b9c0a4cbb4c3 100644
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c

[ ... ]

> @@ -858,7 +860,10 @@ static int netc_timer_get_reference_clk_source(struc=
t netc_timer *priv)
> =20
>  	/* Select NETC system clock as the reference clock by default */
>  	priv->clk_select =3D NETC_TMR_SYSTEM_CLK;
> -	priv->clk_freq =3D NETC_TMR_SYSCLK_333M;
> +	if (priv->revision =3D=3D NETC_REV_4_6)
> +		priv->clk_freq =3D NETC_TMR_SYSCLK_133M;
> +	else
> +		priv->clk_freq =3D NETC_TMR_SYSCLK_333M;
> =20
>  	/* Update the clock source of the reference clock if the clock
>  	 * is specified in DT node.

[Severity: High]
This problem wasn't introduced by this patch, but can a reference clock in
the device tree cause a divide-by-zero in
netc_timer_get_reference_clk_source() [1]?

drivers/ptp/ptp_netc.c:netc_timer_get_reference_clk_source() {
    ...
		if (clk) {
			priv->clk_freq =3D clk_get_rate(clk);
			priv->clk_select =3D i ? NETC_TMR_EXT_OSC :
					       NETC_TMR_CCM_TIMER1;
			break;
		}
	}
    ...
	priv->period =3D div_u64((u64)NSEC_PER_SEC << 32, priv->clk_freq);
}

When a DT clock is present, clk_get_rate(clk) overwrites priv->clk_freq
without checking for 0 before dividing by it in div_u64() (and later in
netc_timer_get_gclk_period()).  If an uninitialized or misconfigured clock
provider returns 0 Hz, probe will crash with a divide-by-zero exception.

[1] https://sashiko.dev/#/bug/linux-3717398e-82c6-4e7a-897d-56088b4c53be

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-imx952-ene=
tc-v1-0-25721440602e@kontron.de?part=3D4
