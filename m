Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6105A20127A;
	Thu, 10 Apr 2025 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267440; cv=none; b=uUKodYrurUHmqyeJronsCZjcp8D47/J1pGCYMjehkSCzpYVhya+HjCmvRMcRxmwJF97UOjTbhHKidt8whu8zKnEcYr99WneiqDXkj4pbH2I74SFPGuN7IPFm2jxnTHuRi95VRARa4YBrkTmKAvkvmet3+XPNDXEfx+DsXmxYu9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267440; c=relaxed/simple;
	bh=YV128qhGuAyvX2XLDTOXX2NTQVmvho5pgSBUUl0uM3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rFlb1sEgCEVwv9/hPR3pnpd4zBQfSTEFwB9h9ERkeDzeUz8D5ped3wIW9Lr/nvDrn5RhkOcJzPYw9ntp1+7FTsQcHyxPznsEpm/4ws9sp4orIhDrxAxGUpmj0I6a2doCb+Vw+7NBMvTXnitH43h8wB8qjHps0ZjRMkP8nNPk4iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxNYmiI2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxNYmiI2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0618746bso3004405e9.2;
        Wed, 09 Apr 2025 23:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744267437; x=1744872237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV128qhGuAyvX2XLDTOXX2NTQVmvho5pgSBUUl0uM3I=;
        b=kxNYmiI2CGbxQH0K8LSV87pxVYdJV62HLiKwrpTOMNL9CN6O5fYY0JQzYYLt5ywxNG
         2m7dZSIezt+/UWnuy7avwNkYn9Kr3eWeqi3ncn5vkefsmMdiYfewT97590y9GsKnFvuF
         hfQb3+TUULTLhquAWRiCea0uw98/+iSnTJdKElPC6sQ4fqc4vBB/Jpj3W7T2ryN91mQj
         CkPHGTEn+hpe5vvN0dlJj/1e2DHGAGayZcyQq2u5Xx3h5fxqIGH325u5h/TxpD2h9b7p
         6w2hPWN88oC2D+PVCTt15evhFU8fgY9tnGc6Dw3j8xR/QkDYl5mfwkv+dnQ3B9RoC/xq
         44/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267437; x=1744872237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YV128qhGuAyvX2XLDTOXX2NTQVmvho5pgSBUUl0uM3I=;
        b=xE6RNvvohf95Hkdvu4coOAv0rE+21sRSvSIZ1z/ujW2NAi2sE7G2A4DvsUC0phx+hX
         JPaWMeE1TT/5FvgllH/zhlXs/pAJ7O7WywZjvDaKF8/QKktKP5JAb/B2+91T4A2BG4+9
         ycHiYmbPNCJpv4sc/uDBwaTZKHPrhjWdSQwLlNMo/9BeMYVUJxn+HU0O3VmISFvQEjZ9
         YNSAWdyGPX8NjkVA27s2aKnhijB/Nfz9Fc28vj9c6wUxtOnE5MxVRXQzA+QJoCIOQq/g
         xYGhzy2GvO2eOu0BTT6jN7KiKum/CEVSIsvZgzzfibkCyqklT72BUx0gRlkfq8bZpuKH
         OBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUptestTlKfL/GZjE+aEkbFhL72FFkGGw3rxEDua25PqEUieI5KlMIPZAV6ym3KIQuYYRQ8a+EqarPziAk=@lists.linux.dev, AJvYcCW85OXLB53CqJ2mllkh5cfh7U2i28ukWF2AJG5k8K1pX/W5pn9iSyN03NzzK3YnE/Ec3uo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBw24O6aBlthlMeCYXfISzihSNC1AzFwhyo3XztzKxghcps4ge
	0vEWPIJaIXDKeSBPvF5brKQgEaDBWisvuDe889BpbCSGn2iPDkA1
X-Gm-Gg: ASbGnct52GmmNG1ZJ21DG6A8JvG9X5QJjdpHBtOwzWn5kbrQwLDkt77dlsKc2JuM2Tj
	Zc/BnRznCn2KNHf3rmRD2BF55vcChLMXE/oCbqVJdzo6dmE2EaEflrXw7BcTEUoE91S3dsJMqjA
	mzlauQo+FHaOgxnppROcIBe66pp+q3DEcyDdnVZDmPjrqcUEJeUzSzHoINMXHNAe8PpdGniDuGz
	FVUIrPw8IU40ysSegiV7Aw8SShXuqWKepioL7qZk16Ze+JHiFk6DZon9e6+BsiF7pqfKNydeMwu
	Y6r+HyZFDp1EQsmYs/y5RzUQpty2Yl9qb0UNHZF2Jbud3N/rkcngNevP8Rdb+ZlSwIxfkS9GFgm
	mp94JsaFW0MNNiN5Y
X-Google-Smtp-Source: AGHT+IEL1gPJzOAzRp7flPkyN4Ef+Ndtjxrjlvobznu4GMFiYPht20jH1k+dVvg8c3EBb+I0DiJViw==
X-Received: by 2002:a05:600c:3512:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43f2d7e9229mr11997625e9.19.1744267436516;
        Wed, 09 Apr 2025 23:43:56 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207cb692sm46662105e9.40.2025.04.09.23.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:43:56 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
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
 Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject:
 Re: [PATCH 01/19] arm64: dts: allwinner: h5/h6: Drop spurious
 'clock-latency-ns' properties
Date: Thu, 10 Apr 2025 08:43:52 +0200
Message-ID: <4999502.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20250403-dt-cpu-schema-v1-1-076be7171a85@kernel.org>
References:
 <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-1-076be7171a85@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 4. april 2025 ob 04:59:22 Srednjeevropski poletni =C4=8Das je Ro=
b Herring (Arm) napisal(a):
> 'clock-latency-ns' is not a valid property for CPU nodes. It belongs in
> OPP table (which has it). Drop them from the CPU nodes.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



