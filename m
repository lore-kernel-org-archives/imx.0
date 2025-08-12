Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C222877D9
	for <imx@lists.linux.dev>; Tue, 12 Aug 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755006847; cv=none; b=gXjIdE59uZKTpbunAFDIrmoHS81i94/JaNJa9UDn45WkqZzJgBcvUW0AelL2u1oVsFrRynx/LRtl8k9PGh/VpZmHIvg1oXTP1BZyagfQ5JvoOfLY0eKK0KdXeP0RE9DnZr7HaviePPr+oRsiLCQnf/qf67Y8FgfQaPXswKOgekc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755006847; c=relaxed/simple;
	bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KVXTxzwKPelxPP2YOGckX+Dwn/cB7kR69zMcN5KsMrJ9EuRFk9P0xhbvY/G19NHWgTKftiVyM1b0dxA0fAT6l+94QreKY3l9Lr4+92wP/dRa3GvGmbR6xn2rmDDHynn5PbNSvMZgXcRZ0ohwvlQQcTCXDYAItRKCAZ89cz/EF6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aaszSW2+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aaszSW2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755006844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=;
	b=aaszSW2+MdZ6asE6thuPpoqkAO2VXGd+Br99klikm9lUtMmtstrBRuTShTts3VnCMfYsmj
	Z9lI4EgZJkg4uuUEozvkrr0b4EvUvPc2iR1pJvwyBW8h7bYdZlU80FX0dUGfsIqqp4j+Sx
	a+8wpCxSed5l5g8qWuRXJfI0JoKhwJ8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-hAGScSNMMUm5-8N5GHCAiQ-1; Tue, 12 Aug 2025 09:54:02 -0400
X-MC-Unique: hAGScSNMMUm5-8N5GHCAiQ-1
X-Mimecast-MFC-AGG-ID: hAGScSNMMUm5-8N5GHCAiQ_1755006842
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b061ad3cc0so167529741cf.0
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 06:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755006842; x=1755611642;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q//s+/zCNBEzjNslOllCQGV4nFuLBeOueQxvALXBZS0=;
        b=E8aS6M2L6o2mRAIcVRsyEmkF6nKVjKWpxDBQagdf+5ysazKeVfafZpl9u5iXo3ZBCO
         nAGKkAHFAm14DFGCwaSItqDfnCi3EyI9OtuU1d2P9x49XDpRb/rQ/MPEzMUm1/S0nmkD
         hIqy5DrruI8p/fG9wU2n5OfBs8M/IsKHU+Wtf+Q3i927v3c0cZsEEzNfl/KFvmm9EDwO
         /JXEeevCRO4H+BQrYtshyKYAoftit8UhAybnrx4zckLtcEZhAG1vk2YSzkfhQHNnCqEZ
         y9jcHGL0VRndBP8sa8z7bEh9R08533mG+cTR8tWHUrjNiRapbVcrFihRlXldocWuMjc1
         beFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1ojBNgvIBj2Sdapy+Qosv0ZMULKjMwrMnf26Xv6AMgIQpuNnRg5NfRAylha8xmrUttfA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfHdWqHRwumkfPQ9a8dcG2AVD75+/246i1uWD1wJ2B+0DHxce0
	orXT9sgqgvkVdk8U+5g/iqkD2Ttixc2pRstK4yzLMdOg3iYS0+SW5Ybo0oT2VL+xJh4iyf2+1Zs
	rsqinuP0LafQvn8tMJoJVtBWltSGWC+bsxaBfV40I0wFD5wcLprKGQw==
X-Gm-Gg: ASbGnct5sVqGWrNr+Hj/hXA1+FkcQIdK0dSIwqp7Ur9Lz7Iip5JHFJXXloxANt+4sFP
	hJUSFF8raxS8MQ82sPOuvkksdf9M8x/SAMQl26ZJzk8QV+NWWCs5k8kJ5HoX4lblWecFdZ+7u41
	zInZnImSdHhJZb24o+lDiyuMPTS9bmD2rJRkIhcovkAGRhzaTFwR/uyJXaGf0wKSy870EDZnDcL
	ZuN9EiwXjg5MZFGJk35spKe/awxHJXHZFwHgcoXL7UlVERhvtHO/RGTBQCAFG18tbIE2E3iuhh8
	rPrP4rLT9TsHTVvngJ0+PA2dg0Bfaa+ZUrY9wf138GuyVPvVAhsH8LXMIsCkLEE=
X-Received: by 2002:a05:622a:30c:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4b0aed36723mr265510411cf.38.1755006841703;
        Tue, 12 Aug 2025 06:54:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL0wdDdlaxY3Jk0TgFfLYMOMEPwCaVnL7cxWLBN3HaRHoOlakRNGI4PvbhwBJNSUpcz9s5eQ==
X-Received: by 2002:a05:622a:30c:b0:4a4:2c4c:ccb3 with SMTP id d75a77b69052e-4b0aed36723mr265508911cf.38.1755006840909;
        Tue, 12 Aug 2025 06:54:00 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0aa1efe78sm75493211cf.8.2025.08.12.06.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:54:00 -0700 (PDT)
Date: Tue, 12 Aug 2025 09:53:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: Icenowy Zheng <uwu@icenowy.me>
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
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <aJtHcs8_671G33Ez@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <a151ed7c1caac83e872cf6075c215fa55bd21f82.camel@icenowy.me>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a151ed7c1caac83e872cf6075c215fa55bd21f82.camel@icenowy.me>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rabxvYdwx48JnPr60BEw8fZqRvg5XtqtdGpnn_os35E_1755006842
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 12, 2025 at 09:39:45PM +0800, Icenowy Zheng wrote:
> I was doing a patch to add divider setting support to clk-th1520-ap
> driver and sent patch now, should I remove round_rate from the next
> revision and just keep determine_rate? Is it safe to do this even if
> this patchset is not merged?

Yes, you only need to implement the determine_rate() clk op. Please
remove any references to the round_rate() clk op from your driver. If
you implement both, then only the determine_rate() clk op is actually
used by the clk core.

> In addition, will the clk_round_rate() API exported to other subsystems
> be affected?

No, that will stay as is, and with the same name. The underlying
implementation in the clk core uses the determine_rate() clk op.

Brian

