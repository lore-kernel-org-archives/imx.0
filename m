Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4BC2231F;
	Fri, 21 Jun 2024 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981214; cv=none; b=XmiH+oaQZnSVoQKSY6rr4z/PfGP4kM3fY7Lnz59pVm2/WlLKCJBXI5c7yl1KMzmMrggeW993VdWT7JiqfcHRUNgS9/AIPrznW/zbc1HbHpKlVsZZ8TddpH7Tynp8hJhM5hH65Xigj3be+rVOH4jQ4v6FMMAE9A+g+MM8w6/vbPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981214; c=relaxed/simple;
	bh=yQVb2DeThksBLy1v6heanX+uAjJHYjLCnQz2w0NHRqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsYN0QDCK51sXF/xjB0o1FYpRUednVOTLx/eor1UL5Y1ZKqgLuMRMKMJKrMLLrPoBDQbn2StDom56V8LKJ1EvqHDSifQp/qHoyn44LN56EBJfc3yDSb8bMggeFxZBRY9fjjObRS8wbn5wAhQ6Th6V5btMkmHNJeylzVvuSZj3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cccd44570so2468955e87.2;
        Fri, 21 Jun 2024 07:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718981208; x=1719586008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQVb2DeThksBLy1v6heanX+uAjJHYjLCnQz2w0NHRqc=;
        b=wkbVClxjrqq0KJmXb+SLYCBJH6UYnsKAUh/uDo45Q2FnwDeHJHhMxVOox/3l7weq0n
         nYr85KX45XImhJkAN+/7yIMeeawldeSQ4r+/gsJGNkY0Zfy96eMoq62/nYkK+lBCe8EI
         zihkpQB5N/3Qf3J7/W1bXiP4Mj83LT87HH5IO4d6ra/irL6/yhm1PHfxgW7MOoOb+3Am
         258lwd3kre/2fBAOJ6aU8SAIuG3MnEwa3teFIicBTgAlrWL7YLog0RilxXB2Va8ZiMQD
         jZ5E+DdCtrL+/jlvZbMQk5gb8be3tXVcjvf/4mAjfSskZbOvzAO8B/6YLIYkcO4TEMdi
         D6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUcfihWcuWwHpYkHkgClwjZlDLv7sIeJ4oYmfd+apURQP2xo9P3xbWXaRGrrO526ZGDn91tsw1jswLo9TdpSi9t9qIXkMXX4NT/FpvmyDrrG1kreHCUvmpJ7aJMzaPgbxE=
X-Gm-Message-State: AOJu0YyxV/O5zvAIdNznKy1GALVzXIs0MYeNieMElPhnNgAojM6yBBgw
	WNk0M7hjOu6/bz1YIkfJOWN1hJyQu/tV+L1H8mNUvpXbHkd5qEQ+j/jbxf7ESVE=
X-Google-Smtp-Source: AGHT+IHK4MrKEEeFwEq6Dv+vMLkrbgGkMLW7ULAXSLE9vdFlrhFP2fwpq4xkoJXTmJp+zaxhDiDNXw==
X-Received: by 2002:a05:6512:3127:b0:52c:c032:538d with SMTP id 2adb3069b0e04-52ccaa5be51mr5049047e87.27.1718981208042;
        Fri, 21 Jun 2024 07:46:48 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63cbd47sm220773e87.110.2024.06.21.07.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 07:46:47 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso22271411fa.0;
        Fri, 21 Jun 2024 07:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUm5gudhfqfjfewSmXi4BkKDgyUp6jw24blnJ5itauB+vxqxlvv8XoYLPcUx0hbzO/zwc04KPjxaZl4cry6fmlZ5Y7gg8ovPCuEpqBOq0MhE3NkSPAubXGMBhvVDPehIgE=
X-Received: by 2002:a05:651c:104c:b0:2ec:5073:5816 with SMTP id
 38308e7fff4ca-2ec507358edmr10687831fa.31.1718981186574; Fri, 21 Jun 2024
 07:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org> <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-3-30b25a6ae24e@linaro.org>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 21 Jun 2024 22:46:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v65T80TH9HUpny8vK2KNrE6aYQHf4x0CAUrxKWih34TdTA@mail.gmail.com>
Message-ID: <CAGb2v65T80TH9HUpny8vK2KNrE6aYQHf4x0CAUrxKWih34TdTA@mail.gmail.com>
Subject: Re: [PATCH 03/22] dt-bindings: thermal: allwinner,sun8i-a83t-ths:
 reference thermal-sensor schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	zhanghongchen <zhanghongchen@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	imx@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-rpi-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 14, 2024 at 5:46=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
