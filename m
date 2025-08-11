Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1286F2D6E5E
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 15:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754927868; cv=none; b=JshEeQ8e92eiuSTxf8gDmLwVLyQs/B0Z++v7Iw4RS0NntYirhfI/WPqmbF1/bHlxqwgrvqfcW6gouO7wTf2fut4Z8eLxe4Db24dNgT0rODx+lrSMPle9KLOG005pkeDwQfmAv4W89SjwHdvWXlwb9ntAujJ+p2GZIOHvnFH8Suo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754927868; c=relaxed/simple;
	bh=07eO2bvYIRsiAjlhL5Ks2RMc74npsOWxeUj+fPHc9EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OPIPorndlwWbZ+BbA0Yauc1sFDtbLkCbOqIm+QxV1uoraSyUCQLMYO7R2QElENuqQoEnlBL962tUEV/OigEHgylZEXw54b2QZlh90XhVQFsnE46D+78t/QEIE9dCBnZgd7xuKckXf2oNzEtaSia6v5MjBKfbI8KudpJ2ctIkN1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GADkeEDf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GADkeEDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754927866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPMcKR4Oi745bR8iqUsDP5qg1uYaCMtbYLompUhICNQ=;
	b=GADkeEDfByVeC/a5PcKeXyKaTJbfXtoO4hJJbqchhHMQyt0IhUKkqVVyScgXQrRyEGZTNi
	MIlqa7zNlxn7EctHSDdvBzF7GHo/K7asxFKizpqD4k2pugOvFV4twJ69HisUeLfw35K2Dl
	bFE7bh+bh7sVTs8buMCAscDp71Z5Nos=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-ZIjvRYeMOlGV46b4iOODyQ-1; Mon, 11 Aug 2025 11:57:43 -0400
X-MC-Unique: ZIjvRYeMOlGV46b4iOODyQ-1
X-Mimecast-MFC-AGG-ID: ZIjvRYeMOlGV46b4iOODyQ_1754927862
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70739ef4ab4so101056646d6.0
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 08:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927862; x=1755532662;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPMcKR4Oi745bR8iqUsDP5qg1uYaCMtbYLompUhICNQ=;
        b=eIAtO9MreuosLtWJF3dWD2R1Afk2IkUmghnHm5A1SYD+SDtwyiNJIDcIDK0J61BVJL
         LgtcGX+yH8wDp3f0aPNChIWqrNgEc6oE0uNV4ZcmjM4XcQpIc8oBuORfBx8sGoU5fODO
         +iatIkkU3xuCZb8+oZYmmj/PXPME0icINUnnfH5QUkjDBwRl5OL9gIyNMOWbRxyTbJy9
         ynwdlGdZdCpdaajCWnpjOMjxK7FtLzJi1xri0wA4qZQddRZKCbwjs+lQSv7iqL8+jfha
         yItOfBmpSPdjqjAqA0siEPaBYd7L0AsCU6os+ixiYiUGdHPI9iKHsYWmZN59V6p7lq0Z
         pccw==
X-Forwarded-Encrypted: i=1; AJvYcCWXJqAAQmT5ghf9PSews9f9Cv/LDAaNtSgz19JFaYNgXvwkZeh2yd87SXOmoub06WDXHhk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoEzUMlSIUijKHuWLjEl7jja4qDSflXBQ44zyQ7fk1ZlM2lprn
	cujWJq3cmHWkkAxu/SKBdDm9PcNkzS2ea0V9MpyATwrxF/vjsm0yp5fSGf6SkHAO0XoHOWgZlyQ
	DUH9psDq6kBOdRS2/jRzgzyxP8xJjpejJGC0EUGNGeWMcrE32YlvFOg==
X-Gm-Gg: ASbGncvgoFWinfRh9Eup/FjQbhfGhgB1ghuNMrTsuqiz5p5i4ZgCi+SosMqDHdHkKjY
	pxy92iSLIFNcP0vjtI7myLu9719cmwN7puByLbCEJXBHNG7rhfkmWJgni+3ORQ3VWp57m36tKAj
	7qSfIm6ekyVnnGMpIHLGpIkCxiR644xOueKzeanTcvJ+LZcYrQqJTTYzl4/OeTKRZRWI+6aEi6P
	omLgkV7A6jyOfe1sf+E+Pzio8PM7MSGiGiJ/Dl6oFmfPanglI9NI9nC33Ox7Oyku3EfDXqiqM5m
	njIZ+ttkSvjX6FCeUO1ML5Z2Wojb6GCVlIuX86J5OZUqrGDesYCjThOfdVSmGf8=
X-Received: by 2002:ad4:5fce:0:b0:707:612d:3adb with SMTP id 6a1803df08f44-709d69b2c0emr1134466d6.18.1754927862097;
        Mon, 11 Aug 2025 08:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE83iNLxuXWBRGJIeIFUZHblancM50VRXiEQcjWFBbyuLTm1IZWPJbr6gZfh6Uj5SzS3+J40w==
X-Received: by 2002:ad4:5fce:0:b0:707:612d:3adb with SMTP id 6a1803df08f44-709d69b2c0emr1133886d6.18.1754927861515;
        Mon, 11 Aug 2025 08:57:41 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5b4esm155566456d6.69.2025.08.11.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:57:40 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:57:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 048/114] clk: sophgo: sg2042-clkgen: convert from
 round_rate() to determine_rate()
Message-ID: <aJoS7twZC0WsIDY5@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
 <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NF6Pc8lY2JSB9c6Pwc56P1budReloMISVp7G4qtp8KQ_1754927862
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 11, 2025 at 05:45:57PM +0200, Alexander Sverdlin wrote:
> On Mon, 2025-08-11 at 11:18 -0400, Brian Masney via B4 Relay wrote:
> > @@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
> >  			bestdiv = readl(divider->reg) >> divider->shift;
> >  			bestdiv &= clk_div_mask(divider->width);
> >  		}
> > -		ret_rate = DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
> > +		ret_rate = DIV_ROUND_UP_ULL((u64)*&req->best_parent_rate, bestdiv);
>                                                  ^^
> May "*&" be redundand?

Yes, I agree that needs dropped and something I missed when I cleaned
things up by hand. I verified that this is the only case in this series,
and all of the other series that I referenced on the cover letter, where
this occurred.

My Coccinelle semantic patch has a case when the parent rate is
dereferenced, and I'm not sure why that wasn't converted here since it
works elsewhere.

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

I'll wait a few weeks to send out a v2 to hopefully let big chunks of
this series get merged so that I don't have to send out 114 patches
again for a v2.

Brian

