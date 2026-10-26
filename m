Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792999884;
	b=x/Dikui249C+NGGtPWiicqTdfqukwdiklw81Qh8TADXGeEurNgX/yzwtc/BGTxLncT/0
	 8oGkDcLobzgeoXbzy/aYzMH7kOLTdedQG4TuEND9PfB5aIJGNLOPY1TZE9PJSOnZ3w26p
	 cIueUdGe3AV+ZdvXUrgXKgoWDPCrGKkLkQEv9yLZtGMmYE30VD8/pAmEfHnB/PTiLWYpw
	 guEqGXiSmIPF6cZD8d5oSEmVSUQ1bzlSzNaCSFm++kgjKCPHwWeuGxpjnU+DrQ/1LHZ6k
	 gx0vQZ8q36LeOnKGJptNfjlKUcau2weIZ/duCMY7SeoWgWwDC0gv+XtwX05I9FsWHsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792999884;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3k2gQfSx3BsVVF9yxHoO/WKzvaeGtbZNRBYzH/o7M2o=;
	b=G/hjWvenOCRU0QUW2lfQ/nXwXsa/6GPXTM12ArHqyZ45VdfTPv+8O4XQuWIGAtlmhvqn
	 6h/m9M9iI1n2h96ECPbJiS0zagbdHOv312tfsqOivoKlF9t1xW6MQxBIXW388YGHn6ks9
	 sI6xtSHE1q18u/rv73U1WliMg2+7NeLUlrvA5L74kUQpUoWvUemdh2txWCV7jbBArKZbH
	 rg3/ltIDybVeeql197Tn/CS0gqc6zof/Vjfin8uzHfL7stGyWx8UpCnlh9ZueML8/e/g+
	 ntJ7/IuVWUUP+1DRGiylmlf9KfopyjFf0I+TjmGo+NJxa3si4vGc+dZJQgrt2jstjfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=MfO+ce5I;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B63606A31A
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 07:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B63606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=MfO+ce5I
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xLFAq-00000000iQa-055N
	for imx@lists.linux.dev;
	Mon, 26 Oct 2026 08:31:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=3k2gQfSx3BsVVF9yxHoO/WKzvaeGtbZNRBYzH/o7M2o=; t=1792999876; x=1794209476; 
	b=MfO+ce5IE8ZYeww2C8XZCprTmTqvcE2oaCU6S66hgYHTRThb+zG9yOxa9XZ2eRI2m8rCzN1+6kV
	O78dJ50PPAa8VflKkcV5KUTo/mQuV4gt9P7rMbOLiHYEAJPpTTOJelZIc55hN7thqk/Lbi73i6s+4
	hOyVeuT2a7hMelfgCw5ERClXLN4FSAT54SMqMKO2XZFqAKpEoyLfaooun1G7WgGKUmWY95ccFsbrP
	o5MunfcI+9PitA2beAvRl82oTWI7q5CYd70FCPuMNjHh2WkPfpd1anYnJ56mbxvbvm06A1tSEshmu
	BHY/18QniGDPLONSO9iHPQL6Kt7d6cVP4zAQ==;
Date: Mon, 26 Oct 2026 08:30:58 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
Message-ID: <20261026083058.04173f10@kemnade.info>
In-Reply-To: <20261026003918.155321-2-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
	<20261026003918.155321-2-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 00:39:12 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

> The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
> Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
> always-on before the driver stops doing it.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
>  arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> index dc7ff108aa85..bd9c6c6fa117 100644
> --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> @@ -154,6 +154,7 @@ sy7636: pmic@62 {
>  		regulators {
>  			reg_epdpmic: vcom {
>  				regulator-name = "vcom";
> +				regulator-always-on;
>  			};
>  		};
>  	};
No, please not. That regulator is in practice used with a not yet upstreamed
driver for the EPDC on that platform used to deal with the current kernels
fp9931 / tps65185 drivers. So it is very welcome to have it not always turned
on.


> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> index ff9d50942884..6cf5603c0752 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
> @@ -327,6 +327,7 @@ sy7636a: pmic@62 {
>  		regulators {
>  			reg_epdpmic: vcom {
>  				regulator-name = "vcom";
> +				regulator-always-on;
>  				regulator-boot-on;
>  			};
>  		};


Here the situation is a bit different. If I remember correctly, there
is some special EPD logic in userspace on top of some ordinary kernel
display driver. But thesse things are missing is devicetree?! But
that might need to learn to deal with regulator enabling/disabling.

Regulator always on is probably not desired here, either.

Regards,
Andreas
