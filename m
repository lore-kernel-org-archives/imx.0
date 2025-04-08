Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7189825F78F
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 05:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744091844; cv=none; b=IAnV+ilP+ICdUC8BuDuqY/vRRZGC94/Ku8musfgjlacsqCV36+dgsEFJkk1W7fgRDet3n900TnkKAoDMYIp8+/qC6nK1u9eocOE+RszR2XIF1V1IlKlTCFVMlbbEyLH63lOCBp8prdsT+pZmJcXReXegoYqogFb/R4cr5gg9LY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744091844; c=relaxed/simple;
	bh=8doy6BPiTFR/YKQpo3lR/yUwQX15c/frOMlav3ozNUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkskgR3mog/aKFtM90RZ05McAXvsx1oSCWAL+dkbWRfq8zJ38J8NuizCvciiSbiHQaSZrd1o7mNNkW1fvi1fItI0eTZA5polITPGa2J0Hl+WUREY3JwFw4GcprtAOOKwgol/xYGVAR9FaNAFxgHa4D77Bx8ZDBa1y+phR2cFaks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NTTGhJgn; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NTTGhJgn"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ad51f427054so3461033a12.1
        for <imx@lists.linux.dev>; Mon, 07 Apr 2025 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091841; x=1744696641; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=NTTGhJgnP6gCeq0ZZMQhF1pFOUeDJC/3Qw1uocRvNtYuTRwVn1bDU3fAmQG59NgvLH
         g0nY2gPnYwzu/0a9c5dhRTeKt/o2KZqc8aR/WANw97lf8Z6SULU+iLpEb/yu679zFjgK
         LtetI33eopnSWo6eMipSNrjqDroEeGVCPZugFf3VyLaybTdR3SP0su4Tj0GahbWVxNEe
         tYy+onobnJejqYnKF5Lycn4MIiqItr4SzOWsrTykVVbBdftsW1zn5uxITlILnIBc2ARy
         1KkiSeYj85s0vFirhbsR4WuVJFdypnuemn6bpKKg41KIJX6SSaghJ0qzIWIBtL7kOXWN
         54Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091841; x=1744696641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=W2KTMMNn3Ej/7YS8SHReDf6aL5OjfCXZ4FHRO1Udt9g8lZpba+8/MeBtdXhtRf8Jn4
         0nJ8z/QG2xxQelx3Qop0mQ5TV61J8BJJex/3NFtuHb5eSSFJ/xGTcwnRHkPZk0wGIjG6
         AgMpmOxenWnNqoo/zPP4NY3En3uQs+CBNjrctY6L2ukrtLTGvadx24C+Df6nqhEo97Ms
         P6oLXHT3Bw1NLoD2tGuvbOv/GykX6icSWFqMfy1ruR7+8UPUuzr5Shq0ekop1dl6dnnb
         X69DM9tQndBlOKseVBEPkXGrPdDtaTskHEcPbdP02aX7ltaf1ZnlJMAjBc8dqcCNZz30
         vjog==
X-Forwarded-Encrypted: i=1; AJvYcCWAmlySBlOY8v+jJZNTYrGi8dTWCamfV74CxDkbG1biyxpxN4cacw9fvZ+fJleHwx6MA8Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YykZYuyPbzMH66O96RSdxfwdAb3IV9p4ggYuKmkfvMXqldGEBm1
	NzbLSOnKHi3yLRhOM/4sBFdZJwJvF1wJCOZnGADfhFhMXX4afGvh2Bo9zd1epYc=
X-Gm-Gg: ASbGnctsaZ/OeoGvk/gm8xmyhF1JXY03GHbvDoxo6rDNXnB9AIHC98bG29krpNcmv0q
	rnGxKmfUQznTjQJTToJ+POFtxJ5HkX2/HmL3WrlcrfmjYei1EL1f0EqJ4RJ8+AObmCBm5NQ254B
	6WuhVmPhyYHV+eLb8XXFWT9kG7csCbEQsNjr5+k2ct9xiZc5JGuvS7BQg6PGw4TiNmJ6XU3RNdJ
	9Yi+aRqsd/oewDeFESeo/m/BxAF85JziV7tk0CzIRPbzUOSWCCUtKckz4zQEHSzl1mRy63v8V+I
	IKXmIkDL7aoEOrjOO79IPSlT9BERnapEqbHhwiPA94Z+bw==
X-Google-Smtp-Source: AGHT+IHa7mNtQoh2kE0P3zD2ru6aZMt+A87LdNqpNKujZXMzxAW0s8D/vDJRFgVZKF/JyFi3WYplYw==
X-Received: by 2002:a17:90b:2d08:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-306a4894cd0mr18110280a91.19.1744091840732;
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3140asm10075622a91.29.2025.04.07.22.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:27:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] Arm cpu schema clean-ups
Message-ID: <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>

On 03-04-25, 21:59, Rob Herring (Arm) wrote:
>  .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
>  Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
