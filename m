Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036722;
	b=St+Y72OikPSqieYKEhVN5fd/doP3XP6xwfToyMWAHbXjURk8GUlruTzNRV6ME9ADHujT
	 e1cZWHkcC/cW0VGq6SeGOT1anPL5XNdopc3MlV32JBle2NVRj6e+4LZBv98kul0Abqgjq
	 HajaBe0uDGu4wwZLgqbMYYUs1PAtzz20/jQDojQLQpJTU9uEI/6vTlL7OEYYetNhDERfZ
	 HSiH9TvsMlUoRGNj7gXtB+ZLoHRO9GtzG7/2wzk7YyXjro39RPiTB90BsaKcMif7F1m03
	 N9RZcWMJPE4USa+f5i/HgAN/9x4gX5m6VG++6EVLcpzyzCWMUDulP4COoaEv2icsZjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036722;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Kl+5DghMKTaZgPNB/B3Ks3HUgsKJJ4T95CFWeDz/JHc=;
	b=Lpn9ynNfWuu3COan16JWmcBiP817C2PHwx3VxjugEd+OsAmBIwixysAP58vyWmS2cpby
	 G0jE7UrCEeNeQCY3XBOidLJCVN/qz0vBssr1pXL6lHAKw/BgJgr61ESi25v1YWxNMfygw
	 hDMCIxjNin+mBsY/5R3+BURQpokmiPSLpWB4J7HYUhZ10IKTBPteEdKybmBqA5nlMrBwt
	 r2zrwQnmK8WSqxpHuZ1ttAGITu4inrdrxTPZUmCutIXTHHuAZhHw22x064XDRvD0juWIU
	 pGIIDtKl/A8gwG1d0G1niWuOp66nin+y5lgNLShY/4qxf3wL78E5GtrSLFaWI7Tsq4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RuI4e2me;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7900D60A2604;
	Wed, 18 Nov 2026 21:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RuI4e2me
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC9C1F000C4;
	Wed, 18 Nov 2026 21:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795036722;
	bh=Kl+5DghMKTaZgPNB/B3Ks3HUgsKJJ4T95CFWeDz/JHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RuI4e2mec3sUPfeNBE8UyWG3m6Z4skLFGEsE1FO//kVaQ7WfnzvPrFxCotQd2MLA5
	 LUCF42/jeOQ1vGSfrcUY31/bjnot37kc4giVZwYN8ak02qNwFtnm0xFc0qjWobMW9a
	 i6e4kNhrEzjJv5TnpSbg9tBqdvdWQ3E3Obf3cleE9lT+xyyw3/186jd250TrFZvg8V
	 rq7k/ApCBEI5iR/OhhbxSV0utbJ30F41VVToezOUWOH42B0QTmfyiuqRSYFm6TzWb1
	 2vHJEm9rB3L18ZRsPSRHYLKKk2qiT+hm+qm7urvwjGeVsT/eB9rGAFJ33xlgLlYEdQ
	 HS78cweMQqG3A==
Date: Wed, 18 Nov 2026 15:18:39 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev, Daniel Baluta <daniel.baluta@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: hwmon: Add National/TI LM77
 temperature sensor
Message-ID: <179503671942.1054722.10836348939766634841.robh@kernel.org>
References: <20261116111802.2442456-1-lukma@nabladev.com>
 <20261116111802.2442456-2-lukma@nabladev.com>
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
In-Reply-To: <20261116111802.2442456-2-lukma@nabladev.com>


On Mon, 16 Nov 2026 12:18:01 +0100, Lukasz Majewski wrote:
> Add binding description for National/TI LM77 temperature sensor.
> When compared to LM75 - it has two output pins one for interrupt
> and another one to signal the critical temperature alarm.
> 
> It also has only two I2C address pins (A0 and A1) - possible I2C
> addresses are: 0x4[89ab].
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v3:
> - New patch, as this IC description is added to Documentation/hwmon
>   as a separate entry and not to trivial devices
> ---
>  .../bindings/hwmon/national,lm77.yaml         | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm77.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

