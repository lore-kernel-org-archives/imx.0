Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661146;
	b=EuiWSAmfxpiV6Be/+Pzsuf3Pe7/5Dxp2WP7jZ+ARgr9NaEZTzk9+r4QhN9YJ0mqKV5R8
	 0eRJnI6KhzKI7ecFRdemtfM8gA/Cb45Me4Oae/Z31Gp43cixL5mV8xN5UfUOX2gG60/OE
	 9ZpX3bYr7C6ZxA3qMJYzLt4JcXrE4WkHpIOBipk3KHxiLciKRdT7NC4MFO1glm5hxHwt7
	 8E7nhZgyySbh61GhUZgUGbj6Us/uyGzKOc6AUTaA2bkitorpeFQUEPrh/pQWnzNSWD+QD
	 2W4qzXLrsvBEZUPpU9p+Q5Y1rOBNkqc7Qlqem+Mlj5BUeYkTd/yHGfrYOmys6XS4LYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661146;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=P0yLNScvKloWayj6m2JS8KQwpfW0PaSmZECjKePOOcQ=;
	b=CZNlg4a1JjRrOrSvRiOV2px3/iYMBD9mMSPwfHFka9amPHg17j9natCA3P6gUHcm5FDP
	 3rCcDn3AZkIZEYNaXPc7TFWDcT+4TQqDeyDWVVuSFB3ZyJNSyBvyAR3uXxEzFr4vbk2+k
	 0uVaezn+QaaJHSdWjGwlftvgPYa3Ny7iaQmzBOmCRxkWB+lnYu92hvlKedFJNRUg0oh1a
	 LsJbG4rshnzf47WEqDauartnvKMHMBts7FspsxierRHvlqp+EW+oMv1xo9YtqKOahW6Wv
	 Ppd0dshCe1AbV31yASOUXQJJeXylXUPGkLpcxKDQ7VF8OAfZVrSxA/HwwSHREeEEUbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=m3R8cqC9;
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E398E606A31B
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 09:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E398E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=m3R8cqC9
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id ABE0A1F921;
	Thu, 22 Oct 2026 11:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792661141;
	bh=P0yLNScvKloWayj6m2JS8KQwpfW0PaSmZECjKePOOcQ=; h=From:To:Subject;
	b=m3R8cqC9bN5rVAb3hFAteUVOrvqJuH6oDlJJpvVXlBd2+MauylWg+f/aqhz9A0QcA
	 d+OsiaxgschYB0IDOSnkv8s1mse4K9lQTg6WbjqzTuO37lEq+/gleMONdXV5NKwTxC
	 T4Jenk+3pBQoOrN466ELQl4fWydTW2uz9dr2iS2ICkQD72X7+GYQX5m03cFwPgrbV7
	 jjSqCQjxDERBCC4WDQdiyb4Nzia6QVjizaKvZx5iQQMW6eZEhhee4o6n0jOwAkxeNO
	 YVX3LOAYYYNq90P7evM2r98BcmO910JKpFCoR9EcsG3jGHQ0jX4v9byTr3zuV1wb1p
	 mWEi80kUDDNDg==
Date: Thu, 22 Oct 2026 11:25:36 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Marek Vasut <marex@nabladev.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	kernel <kernel@dh-electronics.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
Message-ID: <20261022092536.GA232648@francesco-nb>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
 <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
 <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>

Hello Christoph,

On Thu, Oct 22, 2026 at 09:12:12AM +0000, Christoph Niedermaier wrote:
> From: Marek Vasut <marex@nabladev.com>
> Sent: Wednesday, October 21, 2026 8:56 PM
> > On 10/21/26 8:37 PM, Francesco Dolcini wrote:
> >> On Wed, Oct 21, 2026 at 07:19:30PM +0200, Marek Vasut wrote:
> >>> On 10/21/26 3:44 PM, Christoph Niedermaier wrote:

[...]

> >>>> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> >>>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
> >>>> @@ -60,14 +60,6 @@ &ecspi4 {
> >>>>     pinctrl-0 = <&pinctrl_ecspi4>;
> >>>>     pinctrl-names = "default";
> >>>>     status = "okay";
> >>>
> >>> Drop "status = "okay"" too , since this controller will be unused ?
> >>
> >> you can instantiate a new device on the SPI bus from userspace. up to
> >> you, but if I was a user I would appreciate to have it enabled.
> > Good point -- Christoph, is this the (use)case here , can the user do that?
> 
> I don't think that's the case, since there isn't currently an SPI device
> connected to this interface. Nevertheless, I'd be interested to know how
> to instantiate a new device from user space.

Documentation/spi/instantiating-devices.rst

Francesco

