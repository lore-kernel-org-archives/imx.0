Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206240;
	b=KjD1FrpBJr3hWQ5qLM7oztov5m6Axy2LnOvRrsLuEeOKLnCP81YNkHpg0FAAHJLFiJ0z
	 Uo2ao27QpZOa5vsQQEySE4NcPjBV5P3EySR02jL9YD0OuOiMY7A3H8WIpDfScf9yZ5oFw
	 DJeFkNWrEwXGh/KoNm7imn7z0qbLdyqSYAfNCBNVRW00SfgxiZeZlsgHJ5JXtsxRIsDn8
	 xB59hd8Ek2Iw4TQ1gFTJEPv5K8gzE8zszbDMbVYfWNY+DbTvj+8yQq8vu6gmaLHrnC7UI
	 5LSgPScM+HYUibLu7j1X+kN8hY9y2r7oxeq/PzZU3tNTvRQVLSoEFD6HFQuFzfBB1tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
	b=4b7g4xTY5ciu187oOcEIzJmH9kQpN19+EqPDVkXUQrFcVw6K6shhqsz6+EAxg1atP7zQ
	 a/BfyyJMBTZWZr08jRmIyQ3G+kJsI8NnwX84gpT+UyHNS6deEHRihhXTDxkx0D1wih3KV
	 gIZBR5eXPaity9QdETT7ZW6mnmJCZrJbimRRJ5gkKbwFxdKzRArV8iDN4g+mZH8VsmWQX
	 WJ/4r3GfDwWwVXnhJ8v9whyfSFmUA88xQXJn2UCQMwggbqqywlIIt4revEXeomuFVsPqR
	 ai5SaXLlUse5Ao10gvdWpYAOviJPH82HrRjZR4wf2/8bRW1+9PZ1q3/KCWiOjZ4tohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQgMSfx0;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB5C606A327
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 16:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB5C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TQgMSfx0
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13630535e9.2
        for <imx@lists.linux.dev>; Wed, 28 Oct 2026 09:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206239; x=1793811039; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=TQgMSfx06ZDWhnNfuqi5zL4HTjxDpjHfYOaIYBU+YqTdtgb7esXOZUXYIS952XspC+
         JQlQCPZa5hHXiSeK2YKvmQ7l/CSUy3DfrvAhkFcHQ2TZi9BfTF83fxA8rlA01Ks83+cp
         jN2yKmezmA5+K4vdnOPunrvauggKw9qYItbQaSc+qhGfZoIZ/iV37YNqY5D8fueLih4O
         805bpXejF2394C+gkJBotjT9P566fey44KCWFGIgIrKH5EaZoAfsK/9tfre9UJg/6UVS
         Oaz4d+hEFLeAKpWkzftge0PG1c6yc9qEw4qxDpz16aztF4ieGtuOD541jTnvpMTibhHU
         sz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206239; x=1793811039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4bFPaFC4sn5I0ZmpvEnIMtoAAhYqi+gI/vKT8dEg8LI=;
        b=Trii1qICBOQgkOQ0RCrXoibsjIjJHAkC3d3tYkFrs5qlK3qP/tyB3apRBtzaNeSz78
         V8rVGBE2PUyrEaCayNYy8cIyRss9zLq5oORxbF9ml1qExCZQhLP8C7HoI681DzQLNNYK
         fx9XaJ+0uUXKDGGoTm4/OZZsK4wGPmybCyW0NS7dUH2thMWnaMczxN+3JmCX5z8Fr94y
         9cq/S/dErtoEQPeeTLxxrVw5FkaVTb+dduqUZaVObCdwrgTKhhUQAM+hfGbX45zCTn+I
         9b++7MsBrgYljmylg+xv4RG7/PoEbWfhaEBUya6rjEsKfoPTpAhiuRENpBcGdzd5E+eL
         QHpg==
X-Forwarded-Encrypted: i=1; AKwUvByjA9sK3GXO57YDUsiHlTs+/3QeL0wBxFT5vDl3m6K4dbXn5Qy0eeeLszECEDDpImIRWsI=@lists.linux.dev
X-Gm-Message-State: AFq9FYJQFQLJXp0KnflS3OYDCRMtM0MzPO11pSq6Rt/zzOyEjLm8vWKR
	1opSsV88ROCXPdYVaarZrqIh0BVCd7HKmn4JVdbIqBKCGzpnmyN+VmQh
X-Gm-Gg: AYBFou3yxYj8w3dZafXtX2SCDjKn5z39vmdLCf1+vKu9EsAqOtYEJt3FPzRTc23Zm9r
	ui3wOT1MsaTV6RZwer68r1Vpi0IyhjZp25ZI4PUw03co/uu2lyCcVCW+BNHWFw7EKMtq+Q+JFnY
	cDJikK97LR49a+L6DNycpUc9sjGcW+LIBHuEfvDXJHpr+3F9Ko9d/a6LlNkUgJNqPaK/FeNlz7T
	rUzWQd/TiIe+E+HiX5vwlt32rHvxFNcTUDkGPZv2e4Gmms1ROCGM33Ljv/j7KL/Ih5tgNOXgJQO
	l0yrmF1wFjRdMPe7laggfYR6eIMgy2I2rRED9qlEaAebEfGB4ZNFdFKzmY6FRXkjDPa3k320ONr
	VZADx+5K2aatAm8dcdTE5UK478Rz0rGRZhHdnaxiHzZJdLte5iCvvzzXrFc0kC+9jrQff3gH85n
	M6yZLMwnvv/xs6gOW0aSG6pOi3lBvpo4HBG67c5MJc3xObmUSDl+5Peu2aSbsZfa34Fcg6TE4xC
	iJR2CDE5I+403fbjdoFuNdSTPQK/u2TUDBgBBe+tuE80PA0WKvVDsA1S14FxvRMXeuIRF5nnacl
	mZbykH8+yJRStY39ZfHRHep6kTn/i5jEO0Qn+t25Dr2uVPd+fiFSOrHIGN/XFV0SSC89MAgV/76
	k9P7X7yG69OQ7e80i
X-Received: by 2002:a05:600c:630e:b0:4a6:7d6:821f with SMTP id 5b1f17b1804b1-4a9678bff9cmr62960175e9.29.1793206238343;
        Wed, 28 Oct 2026 09:50:38 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc4d76sm29895785f8f.12.2026.10.28.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 09:50:37 -0700 (PDT)
Message-ID: <6ae227dd.6c7231db.220083.ae75@mx.google.com>
X-Google-Original-Message-ID: <auIn2SfzeFL2CJn-@Ansuel-XPS.>
Date: Wed, 28 Oct 2026 17:50:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eric Anholt <eric@anholt.net>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Peng Fan <peng.fan@nxp.com>,
	Aakarsh Jain <aakarsh.jain@samsung.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	freedreno@lists.freedesktop.org, imx@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Fix property name typos in if/then schemas
References: <20261028120216.2657397-1-robh@kernel.org>
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
In-Reply-To: <20261028120216.2657397-1-robh@kernel.org>

On Wed, Oct 28, 2026 at 07:02:12AM -0500, Rob Herring (Arm) wrote:
> Property names within if/then schemas currently go unchecked whether
> they have a type defined or match what's in the top-level schema. Adding
> a check finds a number of instances of typos. The typos result in the
> schema having no effect on constraints.
> 
> With this, fix the mediatek,vcodec-encoder 'clocks' count constraint
> exposed by the name correction.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For KPSS:

Reviewed-by: Christian Marangi <ansuelsmth@gmail.com>

-- 
	Ansuel
