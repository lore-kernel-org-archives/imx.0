Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378658;
	b=ofpMfj0FkEHOZsw3i4Z5BPv3ImW9TqlovfCTV/O7RHhFg6ZS2b9h6u2NJ0sm7xbkP1kK
	 Jm3d5bK4dEnh5sh2Xtz3DsN+80trJMDiwzUb/y6SghHSFQ5TOB6hrpdUxpxmglBqnuJnC
	 +yU0x01lmn4IWXrwOM6BhATgwP2vJPO8UBoFuKcZMg4fF2c1F3rfAMBc6QBeBrnm9FGdO
	 5VFfNwVFnrVz1NK/Qz5TrwkxBraPwoG3fIY48VB2up9PzR6dyh+oh/lW2OYP1EaBX2A9H
	 ZY7XUCrBwWwQOVIh7iRbN84RT4jrPoFPPUxUYzRpv733ufX2inkWDElIQMbhWF7FQlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
	b=B4mj/TD2db7on+vgErRmUd3a00x7Kl4vo+EPaYUMfuVfKL0QH+ZsX/0y7xlUv7igPEVx
	 a/cQ2p8dgstmPIhhNAKyc7HBsdAzxmZeZLcoualXOKOnYfRshgUkBFvbb6BwCR5CXSSwr
	 HdDSb+vVLGziNgim7C+dFxRAwKrtdQ17Lm22/p02yvdECN+RdeUWPDBw5Xr0d402YUC+e
	 Yb2m+ZrU7jRXJMygSxO9bIMV3VaSq+ijI3ICNfsRaFG/OLZUAOI6rbBcW9RLGiL6rzhDJ
	 90IlzZPtiEUKO0tb7MSjTblvNJM4khRdxSNmRrisf8Ns6Jgic0bRw1l1pdcnbEIPljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itVgzFw2;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D73606A336
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 06:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D73606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itVgzFw2
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5c1479be604so1896436e87.1
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378656; x=1794983456; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=itVgzFw2YGR6mlkCiSze60k/QRsT29lzwxytEXtHg/MbD3G+2M3s5jsYlqMN3g7pI0
         QtmRkYbTBMXbcVxSbV6IBxh2zYi5hTbD7LX55QkoQNWuslsGvhTXlM2FWwqcbiCqvK//
         fzwIRbMuJkZQk4bEIXbSMLKg+jurluarMHRrcCwB89+voUv+PenTDqwFSdf1H5Qv7X0l
         daCyEHhkwJZrDHjNZ4NcUj/rxtFhVeHBDzRuFZjd7qwOja09V7DHcHkVuos9UAZBf7xR
         qAVfPAFjJ1lzFWdf6KJ/qAxpWP33Lw+rhLJrZCZCt82SQ/S4VYTxd9MbH1xGgSO79HwR
         3JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378656; x=1794983456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=V9KfpwexLckgD6xL4HOVmm0pqpB32tbz2vPU4D13YX+ELmfmzeHi6Gv5roDcf59xTO
         R51RucjrjrdwOL6K+g/eZDf9v4TtoOr6dtaJzDW3UFDQGaAq9rWdIV3IPPZh9Pvm/G9V
         wouOxdxrSSN4e+RY8jO3H4h7Wbfxkc25OK/ZtTlwxD9/5JqqONAnXPUxNlcETy45jzTO
         SO9uda+QWnnwbBiD7ulRPiaoEssKVJp5Z2Og2veCl324xyktYtK0xZ5Sja44GkGmUgL3
         yJCkKww1aljH66GD+2OtwERsg199NoOqkdkSJGU0pnKazRPwgMZexOW/zJq001qr5xCq
         Io2Q==
X-Forwarded-Encrypted: i=1; AL+hErFcSxDq/w0YbEX+wE3v+Ltym2HoOUbZ4MvZqWMX8IU/AggTqHVWMeOdodJpIQS4e+9WScQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8r30WSLNJFqgcqs+jpkwXJ5n75g6YOSWJ5eDPK/ENwjWjDg7Au
	Tc3F4zgsGBnN+ngXVtM0K+U0JT3gSCvLmL8ZCsX6Ng03+J4ytasYnEBk
X-Gm-Gg: AYBFou0zL3wydu58VJ7jA2uSB3uTpXGjr7BQqtxy8EyO92H24FPZmQgnwlGNwUyEiX7
	1vpyeBPhv0ab2qNnJsZ6WTT7aXgJCTL5vEJJ7F6VQ2G0kOrSHbleEWqahOKJD71GF+FlY30HK+8
	h/ny6rn6y+A2z4uBfN7/z5iHzJMFbOg9lB0/uK8GMuY2U54Y/b/y06UH9TFbimE1+STrC8YX5Kb
	fm92DzvFP+1CxRO5JDQnAgdO8xkpvMhDUloCTWj53GuEG8sB4NJsDwbHxTSxw6ZWq9QokNDOG3S
	7KqkhyExGHzcazT+gwZOD2mAJgnXO3AK69N89tgStEPewWubITmlJKOl/zD7lx7O22xzrvGxvqP
	iu9Ns/+pK9fG8Ul9pz2zNvq/eJpxqNMN0ZtYohNxe08rhJ9dhFCG5fUb+asJBNTZ+ylYQyz8maW
	3J6tqFpg8uEtNZs9LkmoJF2xEsXWOB07PyOHnOGsEdpiFf6iorAK+WAkyoDsHKQcs7AxjhHTfnP
	aNBBN1D++rWw0GNYhTqDpDVlFZ7McVEJ9zVIB7fmmV9DrddTHK1JJYW9Jl7tEbUc3KsT9c/mKQJ
	6u5FRtN/itt2vUknS/ICNvKbFav8aSn+qWSO6FLKYSNDSdCCcKES/lnOXhjjOkaLmvMMcOl4Lph
	1Z6xAAOAGkg==
X-Received: by 2002:ac2:51ce:0:b0:5c1:5974:8a54 with SMTP id 2adb3069b0e04-5c15d545536mr529421e87.5.1794378655623;
        Tue, 10 Nov 2026 22:30:55 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb7529sm811767e87.66.2026.11.10.22.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:30:54 -0800 (PST)
Message-ID: <0a520efd-ac3a-47bc-b37b-11df8263fb5f@gmail.com>
Date: Wed, 11 Nov 2026 08:30:51 +0200
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/2026 23:54, Uwe Kleine-König (The Capable Hub) wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
> 
>   - no comma after the list terminator;
>   - a comma after an initializer if (and only if) the closing } is not
>     directly following;
>   - no explicit zeros in the list terminator;
>   - a space after an opening { and before a closing }, a single space in
>     the list terminator;
> 
> Adapt the offenders accordingly.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org> # for Maxim MAX77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # max7360
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
