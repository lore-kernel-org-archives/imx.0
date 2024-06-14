Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26351922E1
	for <imx@lists.linux.dev>; Fri, 14 Jun 2024 10:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718361329; cv=none; b=bZhe3NDSdFR9MLOWI7qJiRrJyudrwq2/n81cJ6eFOV6qyycCOz2awIL3KVK4zhaCmaVoXYiUBAmKLGyts0aZlqu47DMH1BgHxxpgEc+o75tkVe3EIVc6R1eCbShGH+KESVCvw/2nAYXba0eNHOLWoh6KOTXIau2soRypvmtJ0Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718361329; c=relaxed/simple;
	bh=zQTF8f1f4E4offgF6AppLKOcBdlWwKz4eWbWjGZGOSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orYlWmBIWI6H6SpdGdVzy+E1nbynUGcCy7mEQjN39KXiKsn8qbDPYwgBZvUAWKtaxVAhQFMc64xNOd2rlTc4b36yvN+4qlJvAqwianzLM3hylYcXttDcRRBtqDSU1jaVSeo5SRcu+VTfvNcJZIo/pJ533KJpfCyeocFjFNS28vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DGTNUUfL; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGTNUUfL"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b78ef397bso2885561e87.0
        for <imx@lists.linux.dev>; Fri, 14 Jun 2024 03:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718361324; x=1718966124; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gi0zKyxT3hCd9nb/MhrUUh7myaChKF1I5PdBUyc2GXs=;
        b=DGTNUUfLsGZjEWS3vMNE9mL0s8fQOtGJhf81PkEEQYKurztwDAFRC7nmmRBA8sz7r9
         8bGhkpXa9Zuv2eihhnNDmQmrE46g7183ujzkHfy9XNyAFQU7ymNAkGMoHpcDBPT0URMb
         pw3oVjURDaWvGyXnFOy0dJNTuPY8FzilSmrT5yJ+/t9Dl4yVdasDCHz0eVN0OjZm9Bcl
         gb+EiJRJmr193gaRdjPRZFiTxNkgyBidBSBPLfemuvbgpy3YTNGcTFrPg8bpOd/1zhNO
         cL6WDkJKZ1cQzgsEn5bfGy2DnuUkNXWQ890MChtzJ+IZnLntWqd3PaXyaOBRj0ukHPo1
         i4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718361324; x=1718966124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gi0zKyxT3hCd9nb/MhrUUh7myaChKF1I5PdBUyc2GXs=;
        b=DwHrwgP+uqeG8jsQ5FaXKTXEHAnY/OLMJqVoKtjRi8kOodtqubvHHbiX8LcosSP9NH
         0r4cIIXKleI4l0P5Yh95o5EX84Am2WgEJQHzdt1Y3wx/2iOfbWN4poZ5IVlhSSm7rHn5
         smWRrrDM995CTHOCYU2e4+pg8RTKICJ27nSJO+7TCUOHYuHUqlMD3TEvNNjvHNB4CKRx
         ogLRCfePA8BT91URunfxTXiMBEFoRkd+DFZAfcnsZ34adejzSWWUqX9diY0a7WwDlGw3
         jLCtGPkdC/6v/+i9oPe8YNsn9rdqWesauHdv3ouOkQsZvihcnZdBjY+j1xyaDWWQCfmO
         BiyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBVip2YQxsuu/JfFgHpTmEEVoWm7zdIn9xW55kYoGwMR0txeqrBk26RYcnWmgWJCDod1CuvITS9ESlmZkhHub5t6W/
X-Gm-Message-State: AOJu0YwIhiUSkTLLg9fWS3v1lK6L/JIlaMi6nDCvqvn9DR3rcCFUt98y
	PGH6hixZFHBd2iw8nVBKcEHc3D+jwCqsOtx6Pl5xRX1dMxCBnBt+kAY1GWIkLIo=
X-Google-Smtp-Source: AGHT+IF21atwqR62ijL3XLbekBscy+usmTEKarUelgvxFuWKneWXxFSinPdGquI11kE+MEGG3syk0w==
X-Received: by 2002:ac2:4649:0:b0:52c:94ad:9b26 with SMTP id 2adb3069b0e04-52ca0464493mr1605471e87.30.1718361324088;
        Fri, 14 Jun 2024 03:35:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872578sm468370e87.130.2024.06.14.03.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 03:35:23 -0700 (PDT)
Date: Fri, 14 Jun 2024 13:35:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Anson Huang <Anson.Huang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Amit Kucheria <amitk@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Heiko Stuebner <heiko@sntech.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>, 
	Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, zhanghongchen <zhanghongchen@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 09/22] dt-bindings: thermal: qcom-spmi-adc-tm-hc:
 reference thermal-sensor schema
Message-ID: <mobms3s3tibh6wljulwr3okof2msvewed55ukecj3bkdfbgech@blk6udpuy5ov>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-9-30b25a6ae24e@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-9-30b25a6ae24e@linaro.org>

On Fri, Jun 14, 2024 at 11:46:08AM GMT, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/thermal/qcom-spmi-adc-tm-hc.yaml          | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
