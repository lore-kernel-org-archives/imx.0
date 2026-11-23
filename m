Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443990;
	b=l2o1sZR1IVfIg8I7ltycv3hhXEwV36iyS0H4FupPYkAyrr0+U4gfAKvoeJAFcK0lDnND
	 owWlvgTpP+Ouhbd6ECEaS1w8KvNw+kSATEqpTQ7fUxNkbuwsAn87Z1HF4KQNAyZ/OIHSN
	 wBSEaBd0RhomEhiVEzB21TcRP/gEK38ba1kfJyobMh7Ji2y3VA9Cxs7jaiuNtVDcdUSde
	 SP7O9TlV+eULMSX06fOhbGnQtQ1vx3JfIMUOyVv2NPBXVEdRg5NAhJ5ULcbYq/U96pDIO
	 JOWyZHcH3iA+HEJDghrE+SoiqrXHKVzM1S/7Xaxz6HHRSUeyp8yWGAKWmK+U0SSb07g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
	b=1j7juYRzJxQjZnbrz84rYmW80OILAWe8jaVCDjInX9JpZz1bS63YSi3XPShhsnI+UigS
	 10cGbh191oYeRnp5lOcMPei/RQAKw0WQUkVKc5gAGL/XNDQMDup2hHrFxcqLWj0Cq+PNo
	 Bf4p3TdUB2Rvi2NWFkLYc9BSeAxZGK/vbOal3X7dFwbsSLU4/UN1J0rVJKpOFyv327WhH
	 JPLjrF8KGL7GMcVrlkdFz+KoJRxZvU6DO3faum+LSiVx4oMzIJHLiKmMy4R4m8I2WJ2sd
	 qvsW3KS6PtxIaOfWgEX+3Uld4hZeX+waEZ4lVYDAxES7Io4+uxGfYwqjN5HX1Tou8Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFZYB39J;
	arc=none smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2DD606A32E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 14:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B2DD606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qFZYB39J
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ae81ae52ffso22823381fa.2
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443988; x=1796048788; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
        b=qFZYB39JOxl3PRFP/x3IhXtjnOHBjd9TAksIg1AwS3Ljodv8z5QfXQxyDEPsHjcUC3
         TT9jr/6Ma5C8vzrA+gxK4woC/6JtuYzoPtdmIBTEIIG5/sBkv5RbQB4uJWjFM/kpwgOg
         UBM0vYLXME4ryz2liB3XxnqKUYPo/SXR0p2ddYC8icI4Gm45w2p9anfqvFD2UeUWIqsa
         pclWcxLUxNheZurhxS818bMvMmC9c2CIFNRgysgykjl5Oy9yurkE5K6oCjsuAAzpSKKE
         3EjPW397+btEK8jbYtmZVvHIjWCUXxH59Y3bGrUb9nyDmtTS/lSQj65w8CZCHSP3wxDl
         DZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443988; x=1796048788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
        b=oKPy3OFaEUthcmoQd63y+dpG0rromBYh6XkZGQ3dDz3AI4GLgGYu73QtfdJ/BfnTKd
         Ar9bVQQHk7LIivsBP23+nJLr6rKa8egRlU5OucjFrNqsI8iqFUjdCz+v6KoZuNInUi03
         WFSA97RAKu3wPjwUdGfy1iXPD69+J5xmakGG0FgHnm0gX3lPNP4gqj0FBKKRmc5ivdPt
         pU90bOSvuwWBPvutUwbkIBkoc7tBrw9cI4iX2tfcCPN268UBuWmTZc1LCdKQNEbW2ykB
         4vYtASSA2d+w+uiPn8o0DtiJNpTStJ16HCht9ziaZCOKha7tN2zV2WKdK9QXwLUWhWa/
         EYwg==
X-Forwarded-Encrypted: i=1; AL+hErGpGpk3T5JLMG0EXMD1bw+ZjBrY+6sz9LLJJ9qAijqONwBKBvBu1wB8ELSzkkEtqjcyaRQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8tcOlVB4FO51wLYHzYt8BM24u2HXzrpBuMl3deft3kKEiM+na/
	2xLspSXsZoTilkBdSH2Z5cwFZjEtFCoUI/unvVEmaQ/LRkrssmh34fuj
X-Gm-Gg: AZFdTZfakej8eQUubhD9STo2vsUojRPU0aka6/PwoFZF4N50lHmeJCT3YN/ffiouWwl
	wwR4PL69WMdqMevcwYtjsZxFeBpp63XW4EAS3CNpo1OMUBpPPrRS2riht8QCYlt7E4Xy6n8BBUD
	ry32AT6es7L7/AyiK9zQv6HgvPWqWn2wLDPci6liFxoOSkDNHR+Nsaa9xksZBexpt4+k7gotmp1
	/E9BhcfVLY1maPFH3OEOGejX4b1kZo3Pm9SgUBYgriSdnueHE+OXEiHf7WPqcl8cv/2nWON8J4k
	jpBPNAIVnyWP9WEFuRw6vvh6LTNQPRnmozdpjMIfCH51siGeN8DZmJpe4chiLZ3D2y4SH64EcHe
	zjgvUhnxcHcpt3m9SIW12VyHGn8zkOo69Tc9emf7C92AA+ul+W+yOegtmFBRZ9epzzWEPUsmpQq
	L2mY6aScS93p82Rba0uvZSKlvDKEGDgich/3D1ZJwX1HbAMemkz886XRCol5jXOcIsOm8btuKJp
	kTgqms0TSpePM5ZwItA53+TbVz0YDvC5eUsp/LID2F2+46Ka6NqPrGORWvPit7Jk+d80fLGySxG
	lqkOIVtFS4OSf8i7OSGCaHqRk992rHeeYdZXAvVEDamW1Wnb5J61yscCdpgIBn08LBXrz0GCTKt
	FoutBDgQrvg==
X-Received: by 2002:a2e:ab0a:0:b0:3ac:e4b6:b93d with SMTP id 38308e7fff4ca-3ae7f9a072fmr31420641fa.8.1795443988058;
        Mon, 23 Nov 2026 06:26:28 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80536529sm33679491fa.27.2026.11.23.06.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:26:27 -0800 (PST)
Message-ID: <bc178673-54dd-4811-acdf-cb6327ec2417@gmail.com>
Date: Mon, 23 Nov 2026 16:26:25 +0200
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
Subject: Re: [PATCH v5 16/17] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Lee Jones <lee@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
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
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
 <b69bcdcc394e46e0eb60947f23923e6241d24ff4.1795431460.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <b69bcdcc394e46e0eb60947f23923e6241d24ff4.1795431460.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/11/2026 13:18, Uwe Kleine-König wrote:
> From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> 
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

Reviewed-by: Matti Vaittinen <mazziesaccountw@gmail.com> # rohm

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductor
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
