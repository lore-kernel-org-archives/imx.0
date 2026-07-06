Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E660C2F745E
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357841; cv=none; b=qIEofYtiCuVpgs/jvAEP3Dfr41apCiRgMttbZ2CGY8ENTaflMwUx75bmY5DZUDv+rgTjnxmIZlN6tb8K0gEv4qgM5KsUTK8FT09vZqGU/5PYD88uxTHR4UqhqgVmbX+dQDOMBCrMmeo3sIdcbtzab7eeY83tPgiA9JSFQwYW3VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357841; c=relaxed/simple;
	bh=YwUdG1I8kJNunEWTpdhFYSiUn8LDq7cMo60LuGY0n18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQ69Fi/6+5YSsjDgy8WRUAMJgyo8yv+bIm335GKxGrrgp9vAhxhkkin8i+okmx1dBJPJ1aXynkC50o3SNANQozZY4S5GGUnbaekwJvNOSDcwV5W5nwHmTCI24+wNl3YllwHdcufL1X05FFAoiVvh5vFkUQlQedFl0UukPIAF1SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cRYzLN/y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cRYzLN/y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493d3135f62so11850115e9.2
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783357837; x=1783962637; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwUdG1I8kJNunEWTpdhFYSiUn8LDq7cMo60LuGY0n18=;
        b=cRYzLN/yntD+gRUbedxTtKdzyaRTvvd3SWBC38r8mQuKacuzU7sHtNt6WeaXTalTTU
         vbTK4Y2EgnPGiTglYUCBhZYa/PvmSBwev7TbCDGFnajXA4603AsUouz5yyhmBeMM4VNf
         BWILSnEblPfUo85cFJQlfkSBfwhDkMCjA+b1hik8/4KV9tMrQOfB9JavNDFPWHQ8gYFz
         mNzFAw65InTExF4QVMfeqHW0dEogCA7WA5A3QQDC24gZO/mV06SYJ7gwrMFYhjOVe5yM
         zBUXUVSTChMSp0scYtdiEXyhoMxh5AuPfeZzihnIkiz0UF31jQnK0b3+bfp37Ghvyr48
         S2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357837; x=1783962637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwUdG1I8kJNunEWTpdhFYSiUn8LDq7cMo60LuGY0n18=;
        b=AXVyZ2Ja70lp38F1eJwYlU1IYyebtKSCT484+E09HI9BojVPhYr61K+W5zE8EyfqU/
         5yryH+qy7odsP1qNq2pBM/qsUQoujGckRhdFYqGfjc7LD/bTNOnp5Zxq3edfVNh5bJIQ
         Da2nQxRVKUNrcYAYnzGOdc24qVSLLFsfGJnZCkuHaXe9GUdsxEcTTzVd2b0psgfGRsuN
         skaO/29tJpchbo2odY5nae1YsfGSymxv4YiEAqFUFdgCgfm00gEd9IIA1Rwtw3oubuUS
         mLVubULayVCGnvqM7O0nNSSBTCx7/xGr/TV2NnxXNfzoJhoHqp/gu4ZjeZm9wJPw3RHL
         cvMw==
X-Forwarded-Encrypted: i=1; AHgh+RojkE39nOyxceHasZAH64O+m29DwSdpPae7Tx7A4XdT0LTQpgbFwkF+UNJfTGy/DaOT+sE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4p8OshA11jKqoEPHaridfpqQ1JKvet9oRC7XSRth7NeRnCmoe
	TeRp1xbK9xOSwXkDXma/kKDMc6QswGgQHupm0nRTlMFCN/cFH4Q3jv2JPvLi0U6+kzk=
X-Gm-Gg: AfdE7clfoQBaBOurisnixUqlJuP8Z1g3cOrIvCzcu/+cafs7qIv1pOR/XjXEua0vxHb
	su4FcFDye0bLrYNrUjGKEOmh84ktBF6xs++AdAiESEwVMY8xrqztZ8yAZrRpJbMywQbVLxK/j6+
	KrYn/G8Z80e8HdtuuGe6YztNIe/4f1Vd86x0+rVjIVe37ULehyDFK+8ylVU9ut0//TQfcC04IXt
	xUkmnKRxvkLrTraIoLB3GGH3nNGWIxQKbLKzRJi2FGrtfnfzhA65Ze2xgRPDBxsxYBozEK9dd8N
	5cj1RmtpaYJlPDgw/uyaLE0S4cFbSbrCMYzpWW2ZyB8inXZBKGhFjrbeEXxeT/qC0Vc0VDKdMig
	UDA4LUIByNLVVVuziT/8r2y7Vnx0xQO5jIsEVUmB+ckA0XZPJKa4VRfyxfu849utP4zfB1Qv0pO
	1y0mVzyfbpsOwip76H1+6oIr1q7oAvSg3WMfiwX6l0a3KnBKX3kolhmgymn0raBvbMn9/tJLw+H
	w8=
X-Received: by 2002:a05:600c:548d:b0:493:c478:8744 with SMTP id 5b1f17b1804b1-493df0644a7mr17176475e9.18.1783357837297;
        Mon, 06 Jul 2026 10:10:37 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493df703391sm6037585e9.0.2026.07.06.10.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:10:36 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:10:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Message-ID: <akvhUwQ_FFSJYICA@monoceros>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hya7dxqb4rmwvjro"
Content-Disposition: inline
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>


--hya7dxqb4rmwvjro
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 03:20:17PM +0200, Bartosz Golaszewski wrote:
> +#include <linux/mod_devicetable.h>

Please only include those <linux/device-id/*.h> that you actually need.
I'm actively working on deprecating <linux/mod_devicetable.h>.

Thanks
Uwe

--hya7dxqb4rmwvjro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL4YcACgkQj4D7WH0S
/k57CAf/UgOJNneAcYY3lQuZ+RhwSluKHlS9kU+LP6KfWURj/Pj78uMbougI/MWm
NOPHFAV0gOZPyox4TK4XImoVNCHq9wWJVtMM0UMCguoEBhrqgoeV/Esik9YncvIc
INlZjmDSd0r0OJd9oMZmIM7O1eIZxLQugbLTCT2WK9eW0OCT+20CmmtgHzGHZ7eU
krIfDqpfq0wJOa70OZmh/lowgwbJIjabcxyyCGiY0Scvf4F31ClocQmot5e6gabR
OcwHOulxqkUKBtOVZtPrt5lRsawYjY+ZslpAnnZvlrbrqmj2M9IuVyQGMqEW6kkC
CFP1TQBoEVajey5oRSMzdQ2ZlvM/wA==
=Sskc
-----END PGP SIGNATURE-----

--hya7dxqb4rmwvjro--
