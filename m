Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AE3261B80
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 01:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105051; cv=none; b=j/ESGRE+R72A9GDwXJ46M4c1S9O1yDvSYgJAalRfKeQjwfy3sTPAjFp+EjAmvvuv8Lj1AVi9ojUxmFnlk1/dpVlAyChZm8mfwtc540ikctFxbDME5BREXhrp4Zv1YsCejbJClrMYgfAee5d6H6DHFOyd6tJ0AZ2AzXuWyF/K4tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105051; c=relaxed/simple;
	bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W4MfzwgFZXq4ULjqLqyuF2SRpdym5NBOaU7OXimKLTyHRHA9XFoy4cLQafPri2+H6LziAXlZQbqwM4j6v91qA1qMH1ElxwSiPWNkB+0lg1rfgH9p6EMWFyVzIhMBp9m722ZRjJkiPNPFiEezHa2dU3J/oXCJON8Tznf97vJSzTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cqifN+fw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cqifN+fw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773105048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=;
	b=cqifN+fwey2uuNWJKbAsGYioMmWLpfgqH57gQOr1PYOkFE6fvblDYnVtz2nA7OVLf1W5TS
	5pnW1Z3YgQuM3ev3hHmotlAOQD0KB6EBjEz6R/FzU7qYJ9QbgfKpGOIpLLDEWZBdlN8365
	Dn+ceKEbOO7qeSVvEZKcY0r5oYDHTSI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-gtn7gSDwMyi0OkHyYRwI9g-1; Mon, 09 Mar 2026 21:10:47 -0400
X-MC-Unique: gtn7gSDwMyi0OkHyYRwI9g-1
X-Mimecast-MFC-AGG-ID: gtn7gSDwMyi0OkHyYRwI9g_1773105047
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89a304f24a2so263085806d6.0
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 18:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105047; x=1773709847;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=;
        b=DxBwTEPQWZ4txWttt0W4pQJD1S0uUtiqww5gD0CvvLMswr/aufx/yLp9FTK9qjPFXH
         9gYpTkxV5NMrJ3i6JAXiLQF4DysfKP/5y4epXaQ4vbAepTjLv2fYfjDL3Ow0ImSBEgDh
         7Nl1DqA03mjhBZ8Vf1Zj9AZI9HKkxJdixAzJHyRPVoR/UErYaKI0r2+PWT0Jzt1wZ8vO
         fV3wfGUiKLhWQLYUxYM28JVSZzmslLHgWHeAIrVQWHpMkYri534uayPNwZsvveB329PI
         4ozHYaymbfTc11S1o5ltYOXlNi5jMuKPNQMI6LyV39OFeLSOHydvVcjfpMhqSL0F4Wni
         BnZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLvKc+SgbBQ2iK+CxTRwj2A+6TqM9XEaHjb+3Am6iEIVyiS6LiAydcRC5oe96PHtVQ6Ts=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0GcgeA8MK74hNXnL4xQHuNzLFBikN3QbLUJbvKfE8YhsQMFZ7
	81RF7o5YKFCv9xiqB4iSwaDvruPCVWFy2g0U1lCYsIYvoVP4kav20I2BnIGO0KmrDvvruUWgLrs
	7cjStea68cn6ib09p7GHHQpJ3/q1Cf6BFr0FkPZZnHkXo6j2q9FdYCA==
X-Gm-Gg: ATEYQzzBdGI/NuRZ50/MG9cFdrpm4V9XLwyfaHBuDU/MSGwO5ZMyjlNlXNP0h/d3X6X
	naMMf8HhpLgg9Jt82AvolSZU2DVp9Pf1uT+o/wSgJw7/QHBMtsX11ohOZboT5Eo0k4bF6vDrMrL
	MJ6i9J2rGE2/HgZhvTJeONPvco5l4LGplnzB/lXEuEYe+Or6gQ4maynd2f3mqsrTENACC/y2TM3
	Zfx/MCKjSZYUK+PBRJp0s+S9TF6LVg5b6/3TzrW6aak6izhPbM7NbMbVWzp4O549Xxv5Yx5q5wm
	NxPWz5LethRto/LtYNS2rOk35bE96mhIadIIAmmzb/NJqNxqWgdySTSOo+ZX4rwn0dDAdTjOhR4
	UiFNO9lln5TTuyaki6nwcZBJouAty3YWdMNZPd6PVmAMG1D6nXAAWSY4h8bA2iHPHUnw9fGBrMO
	Mu5Mq3Mk5W34jkfQ==
X-Received: by 2002:a05:6214:d8b:b0:89a:258:c1d1 with SMTP id 6a1803df08f44-89a30ad1c78mr197365226d6.42.1773105047118;
        Mon, 09 Mar 2026 18:10:47 -0700 (PDT)
X-Received: by 2002:a05:6214:d8b:b0:89a:258:c1d1 with SMTP id 6a1803df08f44-89a30ad1c78mr197364236d6.42.1773105046575;
        Mon, 09 Mar 2026 18:10:46 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a18252sm10681656d6.10.2026.03.09.18.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:10:45 -0700 (PDT)
Message-ID: <4728554b256f016d9a5f3e019ed831387b0f059b.camel@redhat.com>
Subject: Re: [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
From: Radu Rendec <rrendec@redhat.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Richard Cochran	
 <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Matthew Gerlach	
 <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl	 <martin.blumenstingl@googlemail.com>, Keguang Zhang
 <keguang.zhang@gmail.com>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jan Petrous	 <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois	 <romain.gantois@bootlin.com>, Lad Prabhakar	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner
 <heiko@sntech.de>,  Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Emil Renner Berthing	 <kernel@esmil.dk>, Minda Chen
 <minda.chen@starfivetech.com>, Drew Fustini	 <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Nobuhiro Iwamatsu
 <nobuhiro.iwamatsu.x90@mail.toshiba>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Shuang Liang	
 <liangshuang@eswincomputing.com>, Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, "G. Jaya Kumaran"
 <vineetha.g.jaya.kumaran@intel.com>,  Clark Wang <xiaoning.wang@nxp.com>,
 Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu	
 <david.wu@rock-chips.com>, Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S
 <swathi.ks@samsung.com>, Bartosz Golaszewski	 <brgl@kernel.org>, Mohd Ayaan
 Anwar <mohd.anwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, 	linux-mips@vger.kernel.org,
 imx@lists.linux.dev, 	linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski	
 <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski	
 <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 21:10:41 -0400
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HBi58bPO4dblFZ1yP3Z6WhQA4HQRsTWTPIqZVU6JWhs_1773105047
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-03-06 at 16:46 +0100, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
>=20
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
>=20
> The DTS changes will go in separately.

As Jakub pointed out, it conflicts with the latest net-next, but does
apply cleanly on the latest mainline, so I tested there (on a SA8775P
board running the SCMI firmware).

The two NICs come up as expected. Basic iperf3 throughput and jitter
tests look good. I would offer a Tested-by tag and a summary of the
test results, but I think it's a moot point because you'll have to
submit a new version anyway.

I will wait for you to rebase, then test again and come back with the
results.

--=20
Best regards,
Radu

