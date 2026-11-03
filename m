Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722276;
	b=M/ZXZj6dG/sw83MiUObRbKEjBscX65IBP/RbQ9EDIqYTQU/pqL/E/CeZgcNvWQRFowyI
	 QHu8XMfRljLZztC5bOpfey/dLtRUk85cTIAq0dyFme08WLWim+u/fNa0VGAeFdug3xYwV
	 HNFe/0gIli0O7qOZ3m1333mlMLkdWZJI0VSysnf0o4b5k5FDQpWF1R6z+ezIIk3z7Qk7p
	 gDZT2/pa6EtmNqxTrt4hZHeVKwmyt8Y7wzhUy5/e6vNnyXlcrpoMzmcHKnkqtUYkGlVnv
	 03TVcWnAL4gH5IMYM7TimAN6/dl1XfpO79sjtsayuOylhkwtAwdGioEpedmNyNZtYSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=jYaVUFqZmgASiDCWOZ+0EyQ2fOQJuY5/lWcsL8CYHymFrSZgm6q653ifCvgEzkoYgUc8
	 xqGYSdkaeumtVqQif2EuR2lhgguhUCUONGV37zT0dSgMyqCqN/WRDU1sjyzAV1sjDa05x
	 yYJ5bqVDjCsQ8Monq1IyTga+oQrXWFZn4gah0C06CPpXRvfYVZV5SXHsPd5TrU6X2ZPDF
	 48VBwQBk7OJ79lpnTKGXVhKG7wPl1cOFiIlL3RCuZCLUHRQQrPMdXv37r1VTKqPyPnoVN
	 ISDaRnhcWxkxgnTKcW57KG/407cn/bb/j817mp0l+xtDbTp5lAmDcP8DxXi/6MWqmBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="C/VWQbcz";
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753C606EEA7
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 16:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7753C606EEA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=C/VWQbcz
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-56431524c22so970404b6e.0
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 08:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722274; x=1794327074; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=C/VWQbczS1Kb5Ur9ClWYoQpq2W1WnO0za6zEPwNdO/jZOYK/MsuUuxjBgkDuoFa/h+
         kVCXJDX7hKlPX7oMnmw6qgQZ8m4RyQNxIGAYB+nJ07v0A0x8KcvO66tdkHYHJDG5h9Bm
         rj+Svc3lAhdsjhFyAmm03jQA/M1BgQaUfCc50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722274; x=1794327074;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=BD+VbJLwxAgVuV218mPgCfIkKuPHa9lO+9oZzdurh1vcA3teqvEH8NSgDpoGfs77r+
         nEvUXtvp2iduvPVNVb2ukUifCwljEJ0YvPvCdlFgcG39OuvYKlARC1PuHrRrBu71QHoS
         Aiii0IIwrNvNaYJ302a7VdfdoHssOm38kf1W9yoZbF6oVmKn+Zs9NwzE0L29BeV4B/te
         Nss5GPN/COFcpPCIRQqkdNoLKKQFOTWOH4n79lTWU6QTBGtrtZ8EVw3W7RbW1wnbKUAO
         yvtit06v3eyg3P44Qy3udC45oNs/hH4W+9u9bnN3D9kO4t5e1/WhuQkzlykQBKpvrUEq
         gJBg==
X-Forwarded-Encrypted: i=1; AKwUvBxttGMwy5RhDzZY5/Nyb6/SF6oR0O2361BTLTLab/3bObW+95XE5v/CxQdeveud0jLfzys=@lists.linux.dev
X-Gm-Message-State: APuU4Z/P3KjOfLq8iDOglbybvHYD42C25WuZat/P9Y6NHjUQqiOZkVTn
	7H2bYxle1mm5uW6o9dZoCAw+aQnrHPamxlpgDeHveh52uMN4dM0d9tUGUR2eBi1fog==
X-Gm-Gg: AYBFou3atxNxWbd9+ecZI+D6G/vR8mNQJ1Qd6FDWJLvNxMgHocFE09k34JDKP3Eqz6x
	IJZ461pzD6lNqXLThXVBCs6OwtULA2uSwcnc67m28jOIfqJ/feciK2c9cN/HzkXrgk32bKj8y8K
	0qaB36iujgasFfRuy316sgw3z64i7FFMZ5cq3Ianp8wdsgkGrwSrzRZywlqTyVzHRqNwCmcPc/X
	g2TTmzVB8zV2CuPDh61Zwdf8Gs1LKtdxJXU1ZiLt3i5uUgsn1IaRFZHBOAKXoxJOq1L7+X7EpUU
	JPamHxPGX65rsMavh4ydtYten1XVErdaWs57vUiRKm5fw71hvav7XD9cFcfDHl9BXlAyl2RpqD/
	CYdCedbs1bN32GGWI56HFHbpl5qDU71oBlfpRuxLpx4+K74eTGHDogwOIKJXrw/b6nFZj5SbjVs
	gAvcCGaQJk/VeocHEEZSu6Hht89ye3pzkbicP4xDp5FqFsMoS8SLLknvA+lENsUM4ip+nZxyD9L
	wxeNirXWUzxtVaCniNC2zRlOPKvEECRzQklZpE9MV7C7kKF54D+eMY9NlWTVfNd7OfyNuaMhjVW
	6C1+QQqHtttyKZalHkK+VtE68H+M8oHgc8fIQ2SwCAHKuS/yb+CnAxgiikhI1vhTV9ZTM4JNfEB
	R3GcluEcULYQN7tQ=
X-Received: by 2002:a05:6808:17a9:b0:4f5:7723:4c9c with SMTP id 5614622812f47-5640dd9c160mr9485684b6e.30.1793722274540;
        Tue, 03 Nov 2026 08:11:14 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:13 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 3/8] serial: 8250_omap: serialize RX DMA completion and flushing
Date: Tue,  3 Nov 2026 09:10:59 -0700
Message-ID: <20261103161104.2449407-3-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reviewed-by: Raul E Rangel <rrangel@chromium.org>
