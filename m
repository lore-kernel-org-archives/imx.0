Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BC1284B54
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288627; cv=none; b=Yt0jcm/Mq3Fx1UxKwKVWKOTpFUetLAMvxzQQ6qDvHhxDu32mXdRQwfR4ugYSQN1HCljI9D7/gY9Qw5PwHxcl/cZDJznFtZ3gvDkg0f9b0fjxCUaPYxWpwcQlPt3Clhv+EAJimYEeaFrqMZRXW/Td2gR20i0IkF+gjECCp0Hxjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288627; c=relaxed/simple;
	bh=ABz4cDqiNS3kQXrpTOAbpSPw5QYVtGShy0gfjNUg76g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AUexvdIoG+Ijl4ker+YmRPkZtu13vlNanFiuTlAj1jam9K64diNPxD850EQWCTBEjY3PJ6nw1aHwKJri2km8o/kHOSPBHosJD3HquQCgR0EkzhAfMDRodl0OpC17dcLefS+eaX9JkXt1uHf0DJF9POZucnCNgpelp3gFIJc3HcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tbrzCnaZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tbrzCnaZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0782d787so5361135e9.0
        for <imx@lists.linux.dev>; Thu, 10 Apr 2025 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744288623; x=1744893423; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=;
        b=tbrzCnaZjHoA/gYJaxMuRWfgDPa+1OaKZnixB/fyiXQaWoEl2rY+0HRynA+Ghwp+tX
         CykRf1JiuM3HBu068VDK+FpsqI/4AdUebJWRzzTWtHATJ1FOqTG2mh7HOex101fdqPKF
         MKnCwSGBwrwL4KeXbU9kgrfyg9N/POUL1YsP9ohf5BzANPwWmGtJtZZMHrZwkH1TzmWo
         e9qYBun1+gmUWNYmwMUzqI9ZlHjbJZF1cyltrKWtRkB4aw2cGDmdTu6abxiExxfBTMoP
         7O3Yl7oo5uEEvEa2UUmDTFS3JqF5fuEF61snH336UEazu4BVEirezIO43JHLo9kAGlEW
         Frnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288623; x=1744893423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VoKRS+yOUVccmHWqHCUYdtGt2QnJX1Av3s20gfz76g=;
        b=lhSHf7/rIDwsYaPBT+oul7T1pKKgeqRbiMvfWOhRYjSJ4uPl6H7Bge6w2iHX8tOo/G
         MdyHl3j2Pk1HpyEUYNLsIbgnVY6SRnCESSfz4Mr73t0cSZCIwnrSBiVNfJijzUCTTB7/
         9Z1t22OUPnkAEwejyS5U+0sH9qP1ym82I3YY8oavlkTcVRaHBlF+vNcA5qyUBoM0W0jv
         rTJWGeQnZHOMLUSOlndq33vh/8KZEVtVdRJaYgoVsk3Q5B7fWslQzmKg2rCjpdY9e6zr
         atHiTdxK9K32AF9QEp7oP/51jx54PgXkmglsDw95czWZ2svabbLYj/2NUI322nErXeTY
         1kJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeL75udIOmw+RsKly7yFGLnmgQ5CwVlu6nGhDirpn3fpyC5amZSSIfA8UarsLwHz+ZdYg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxO/a5CWmjChp+Swi3JdvYiNHrLxLEl8yWOGj1To8KB9MgFGT9n
	s9jHs5keV+n/QJjW4VvSMjN3X1+Wh1rNPE2dvI89qaMEBYMLV0BjkUBaTSwxqVo=
X-Gm-Gg: ASbGncv/or3j/mdP+LFPEth8Onlcga5pQc50ID5zhiAzkghHN9LL7eJsnY8jcUYF/RD
	dbf757Ej1iN0NVyWGqGiLOj4JrpVfw6cPHwbBC+yY/VxmnWvzLer+UYvEabsz27pCsR2yuYG/UI
	dLKP6/bQTjry87VNK0agJwvL+FtIhWwFx5LrZKzTDoHiVrH1TS3AbagrJhg44hFk52Uo0cPFI2U
	ioOqvz6Q0ANjjYhAHNT/MYaP0HhUOO4AsSAy+Huz43VAkqEdfG/4PHcL758mfHb+E8xNTUv72s7
	54/c14B3QOgvXIkTvvntYA3V7cjjg4+/WqvyJ8fBeDIEBCy47hMbO0PQIla/XtOhTOuO3ueZsAp
	PQYDHEevCBAg6PA==
X-Google-Smtp-Source: AGHT+IGMoIZKu18tKxGlE0nCM035PBeR69RdqmMHuq8h1Eu58CnOlQWvz4UQddkUAElDY1GsfzU8ew==
X-Received: by 2002:a05:600c:348a:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43f2fdceccfmr22721935e9.6.1744288622955;
        Thu, 10 Apr 2025 05:37:02 -0700 (PDT)
Received: from [192.168.69.238] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207cb88asm53015095e9.37.2025.04.10.05.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 05:37:02 -0700 (PDT)
Message-ID: <20de7ce7-1cfc-40bb-9457-84e462cf4483@linaro.org>
Date: Thu, 10 Apr 2025 14:37:00 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/19] arm64: dts: morello: Fix-up cache nodes
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Conor Dooley <conor@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-3-076be7171a85@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/4/25 04:59, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> The L3 cache is not part of cpu@0/l2-cache as it is shared among all
> cores. Move it to /cpus node which is the typical place for shared
> caches.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   arch/arm64/boot/dts/arm/morello.dtsi | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

