Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870205;
	b=uIkfQweVCZmMnfSiefe4NJ8MWVlpuwnZcf/5QJNigmcW+usVWGuqmoYciJOuhbjDq1uq
	 3j1ThEHm5e3wJDOL95Uq3BERlXnZk0GGDmjKNLIC8JMYpjpM2GdWpvA/MIBMerBVpaX+J
	 DgA9MzZRX879Tg/FBeM5/E5Eb+zI6pxd3vOyTP4SIFDvoENPGkmCeg392joR2TQiJYwX1
	 ax6WYRPz05GbzBcJxmLx1JZ/Qk7HIEDS7eEMOANsyNz8BctwPWRu7GQ5rr9wxW/lJae1E
	 FNB3OsoWY8OS+he3wp1g1CoAuaBeZ4ssPsb/ACIaRvoMG5j+yOqaYTvHS4aCB2C3S7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870205;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
	b=EJsLFuCqEHDtnUp4zrcIDByLYbBTLjJKoi1PGHQcnt2LtLJJmFjj1r8Jx0jxoAjO/ASd
	 56oXbiY1MI2bdwlPQWMeDr5jbbBWIi/DJN/DdOfMZCULocLskuAE+g/yQKwa7wb+VGPSS
	 ace6l2YrfZfAYvnXEUjx+sDjI8QNNrFK9dFEXvEFgEFB9kZX8/fXFHWsovtYzvzbBPCLe
	 h8JumzpfD7aBgwSP8AO2h1ltEljNnZFvwheSoDl8MdQb4ByZqIyevLjmGL5MGNOC9/A3m
	 PpoKDTtOnsZNqeUEV5Q4ogVxDvuejm6xcNkACgPYIQZqMl0os1Xh+X1FnG4Mnj98LJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF18606A31B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 09:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FF18606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e7ad9f78dso196176385a.1
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 01:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870204; x=1794475004;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
        b=WYuQFQC7L++cnjI/9eOPyEvKVklMba1gDjv+gaxc1Fd8ZkEllfcJcj8iN0WicPWb9t
         4xeYB7Tkp/UePXsbOfpHdZlFIzSINlSvrMGUd2X50rGjsZ7vKLq99nOaMwqLIiF2ioBP
         T12el/wmGyZ0jaKWbkHMy3CccljWZKo+FqIvbbx+bqJmS64FDZzMZXVM9hbUi59cSuV5
         aAD6HrSpw7KFONgeyaC8dFHm66OJyHwEwM3LlTLRt+CKp3PSBRrsxfUDyeDcGGff1hz+
         sdPk/9t979HAXk5AxVRfwq1Ft3AaiDcTZGh0ad6rKWfqMuW3r8Dw2jG4juZx5CK4q54Q
         spSg==
X-Forwarded-Encrypted: i=1; AKwUvBwjnPRuPqag/TJgI+bThjN2H2fTTDWTpcg2dzvcmdyOv2nu1FDQREUlK21pUNWeEOG0TpY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ou/xuw0yPm+xyPsXCHGGJtwxhsmGsDHUoyQ/Wbf+hZAHdjOeH
	9KcfhA1QBedj25ZAFaPddMEPwdFIc2hc5wIDRkj6VCcGicI5YrtajsKnyFE5Ip/x/TU=
X-Gm-Gg: AYBFou0mkyUVFK+2mMOOMry7iq8s7/X0GWUUju6SszqquKDP939ZSQlJMiTnv+h84AO
	MtjtQTuvIZdbu0K6OHT7Sdjo6O6SF2Uh8SB/nKF/ohjtE+co+Z+boFLKwvC3LNEtiA6fdm3PDkj
	alydSJoFtRw1fE0NwLUyZHW+YZF8twWi6cp5clZF/qzjSiPmsk9HJrymkk0yJFxuc1mUfluyDYS
	SRT0c7FG6karCRc4miUQtrxZHupmWS0SB2fhYgdH8Y9CNmZd7qIhwSiH5EgNeobyVt1Iv5cQqgS
	+leRntejoTbtnV/E4dzhhA2O9OyVtTDOk+QLzkXhepSyIbmN+W8UzF+dY+7z1D2mqlBy3D1o/kO
	MjMsrcASWp0Z6Tbjk3d6bFOpSz9eEEdRvsSXFmUWtW+BWABpkavl8sgaod+PkM3kEf4V4ljCO2r
	kzwofTcylWlTayYW10O8pFY6GGBHfm+SpWwTlHYaI1Q92U4J/xi+p6QsTGkiVsJsGAp0sFhZ+mP
	aDutadan1MpP/5xcJU1efGSJaglDgfveTaoNMbHNYYZ81hX5s6gtyRphI+ejGydq5XvR53DPYPw
	Ymg57tKf57k7vQALS99i4mnQquCRajOA8BLQOxud/3dqLaikB3L9QbP/TTJqDw4h8Q==
X-Received: by 2002:a05:620a:318e:b0:93f:5f83:2ca3 with SMTP id af79cd13be357-944217b2723mr3149253785a.54.1793870204262;
        Thu, 05 Nov 2026 01:16:44 -0800 (PST)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488e442sm416515885a.40.2026.11.05.01.16.44
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:16:44 -0800 (PST)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91b8306b9f8so25312246d6.3
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 01:16:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzUI//7acNK8/SN1fdZftmfBL941WGj0J/gh9fOuhV3A1GWP1/SKgdGc0zRQ7kz5JbC9Vg=@lists.linux.dev
X-Received: by 2002:a05:6102:c4f:b0:7cc:3eb0:6ece with SMTP id
 ada2fe7eead31-7d072d53fa3mr9146730137.33.1793869733877; Thu, 05 Nov 2026
 01:08:53 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:08:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
X-Gm-Features: AclHuK-Joxo1A4dnmlO7hQLoxC6QCg3Be9nelvt7mgpbpsg01EIWZ9Dok6aJ4CQ
Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Cunhao Lu <1579567540@qq.com>, 
	Raul E Rangel <rrangel@chromium.org>, Yenchia Chen <yenchia.chen@mediatek.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Carlo Caione <ccaione@baylibre.com>, 
	Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Fan Wu <fanwu01@zju.edu.cn>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Sherry Sun <sherry.sun@nxp.com>, John Ogness <john.ogness@linutronix.de>, 
	Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>, Robin Gong <yibin.gong@nxp.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Zhaoyang Yu <2426767509@qq.com>, 
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Myeonghun Pak <mhun512@gmail.com>, 
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 18:56, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across serial drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

>  drivers/tty/serial/sh-sci.c         | 9 +++------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh-sci

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
