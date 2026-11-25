Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624121;
	b=BfxHamijY6NIKEbzMnSHrWungfRSJ88oAyhHSS/HgqObQ6AAqTb1NqIEQ51sqTl9cuMc
	 6BpkyDKjY647YKOGPbnThZIDJk5cbVoGCkdAPSrckatvf7wc0CCBLmgOXr+E805uQQRYD
	 LP/FZjANiRaEqwLTfJ9ylW5pa27HEuEOYI3GCNAQcd92mESxYy+FvYxMkDcL15+sHr0Mv
	 O8Hz3WtjfXULZ1URORbwDu7VGPYabZnTVVmlcpE23/lK7zDC2/2nqCzSx6MZ88Hbrvgg7
	 G5XpbJFUwK4E4ExraNTiQY41nb+XkhZ53zHAvSOS5/oiuZxQZoSr39DwLY8oigD5cgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
	b=gVrp0ssCfqJf7YeG7REKR3bCcsnJQsCXqOkKfgk4geMHLHTibk3bzKDctBK9TBa0HFEB
	 oVautuXb04W4HnEXgpNobfpcq3pv7aBlNq1cmGu0Rj0y4wJq1d8u6jnGmwPpxJEBDD+4K
	 bldwNA8VYun+KUSKiXQO3MXj0zkIdrikq3LQ6zEgR/Cvl/9d2FghPEa0vf0GQ/sXfQKzo
	 XjSETdV0ZVYim8NdzkKIbj30MXvNw8K/Mb+LGT/zeuNuxZnOK1Sz3CMB+5/eSAvF8AgCk
	 sYEU+sX8wj1rQ2KFqL1QwboHtaK3nkuR/y/DMm/7/3tzXURUDeTQVHLgTAWLi27YJuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P7k8xwmV;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF47606A334
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF47606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P7k8xwmV
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so64610795e9.0
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795624119; x=1796228919; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
        b=P7k8xwmV5vzq/1hDwwg4/DllkJqnBK8ekpTzxarjCGP4eWw3Khvv8pTHDHM0nFVwaJ
         lXsB7VYwK9VUUXpm3s41fs3Ny9KkN7/Es8bxz578DzoOvc8rgGDreqGoHiO2B4G1gAaU
         eZhls07zhPjSIr3MZuWkzAVbx8zkSxJL4wb9x0KGLDKoxYU6ZWA3pR5/r7GHeqvwmDlR
         S5ujjpe/ww9FEk7B2caJ3daj5kfnJPjM/tsoN1uTA44v3nK1srw5b2yX6aSzuIKTj5tt
         lSDnOXhl6vL96nR3XH2ACYnwI1zQS1l+kKnfFh6hLGKSKhUK1ssc4JW3X4zH3NjZn4iX
         5UJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624119; x=1796228919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFDbeCHQMCzywmdZtzco98P0xWzZOKchEiBzgROq0f4=;
        b=e9ueKFWinDCPX7MpBb+Fqlb9DJbvCTpn748lZMQqPLV6PfFT2XZ3iv74MkgyB8CDdO
         BVaKkNHOWmeK3rz6aEtCDn9cwyM57g+1mRIMqmBUkZk+WykQ6CcrBWheA4iPjUWsbaHP
         ffCFkhHWA0h5ZG3cp3gxWatWenMqCK29YMPclxHeDaPIjnH+QMfZdBRRSD7zwymXPcC0
         X+K8NUuniuu6gxtlebjA4Qx+2KxXWqyO9Asu5arqTP8BrbkKeZH3OZql+T3ZPl7vRpcU
         B8XDIj5Nx4NyMmHg7yCTnddREHh0SRW+M6jDi7wbv4q0A+Y2qhQ47AsnhbQs7TMmIP6t
         GfxA==
X-Forwarded-Encrypted: i=1; AL+hErE0dDe7gF8o3NZbEOyJo2wZN3xHxG+D2fNUg4YKsnOGmJAu+6tz7WkC9iweueCeaGLNxMk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+aooIwY2ZuIwOP6UoGe6cA7nbR2JBEWOgooqucyUA8fN6by32s
	C0s6C7e4hMbLG2p/KtZNdjA7Z1t/6hVBMEwAIyFWpuPPPDBXBo0/47WBCVFrNf4xnH0=
X-Gm-Gg: AZFdTZc/Ss5V1yOZhWdiArXwCpWn/DoIMDMqbMjM8Hrjnod32gVIXieEKZSCPtdJvMy
	w/O3fLuPnKDwOVLhAoIirqhOWsNwNEtO3cu2ZDA63tPF66wRcihfyNlOW1vF40T+81HAYUCfcwq
	fxqbN2nGoLM3b37v/9bJ26Xo/6cEAvyjAyhESM24JYNL8FxyhP0NLnorLGE/vIRdhzySZezVre3
	02tm93C3/lrUgy/HXU/qEdrJu+4RjMtfjaPrc3JhBdO7nTXCR2c541pkwi/FBnUDIcHE+M6tlVu
	SdcZPWGG8Bwy9bTlW4C3j7BgdOWMW9bkWSfrJmawkqdIW9dlzM6z29RWsX8csdJAxldhjGg4f4F
	hyO/daPecoSu13g/mJ7ld2eK7AId9g/s6H6aqjmU75zX4BrDvpa94H7Txy5lO5YLD+F3+DP2jYO
	fOYLkhQ3pMcb2UV6lUaSbnbgvVAVJuC2dn5RWemDLnv6DW9yhiMfh5Y9H8ZodhKU9mJ8ZWLELl9
	86VgE+e6aYFxm6u0/8tMZwOjNxQLc2W6was4DZrmiwOX495wqftS7VBZvUKibkZfNsifGAGqq6K
	a6lO1PhNSiTZj8HTJ8AzgoybzUjUXXOSu7o0MGsL3yD+YA==
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr384806975e9.20.1795624119085;
        Wed, 25 Nov 2026 08:28:39 -0800 (PST)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f716:ba19:8aaa:f1c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm527336375e9.1.2026.11.25.08.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:28:38 -0800 (PST)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 25 Nov 2026 16:28:27 +0000
Subject: [PATCH 01/10] mtd: maps: pismo: Use named initializers for
 i2c_device_id
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-acpi-mtd-v1-1-42ad2f645bee@thegoodpenguin.co.uk>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
In-Reply-To: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Alexander Usyskin <alexander.usyskin@intel.com>, 
 Joern Engel <joern@lazybastard.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
 Shrikanth Hegde <sshegde@linux.ibm.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liang Yang <liang.yang@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, 
 Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
 Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795624113; l=851;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=IHAi0qeArnt0Dz3MPX/pMNLkcr4ipLn3XGqru6V8PMg=;
 b=FYYb5NZv5bMag5GUq5jhUZI3EA/wssPu4IODYyOGaefHzIx0GqzM1xxUbS1yXt9hVm+9RShR6
 U7w6XKaTkOyAdXUAkIbyQhY8qzilz1ISb3JVyfa0dct/S0WrrapbtfS
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the i2c_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/mtd/maps/pismo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/pismo.c b/drivers/mtd/maps/pismo.c
index b0310fddcaa3..babb6d367623 100644
--- a/drivers/mtd/maps/pismo.c
+++ b/drivers/mtd/maps/pismo.c
@@ -250,8 +250,8 @@ static int pismo_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id pismo_id[] = {
-	{ "pismo" },
-	{ },
+	{ .name = "pismo" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pismo_id);
 

-- 
2.53.0

