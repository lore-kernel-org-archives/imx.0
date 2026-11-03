Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722281;
	b=mLCty1HWBndWMZKYfzquZOjFajduqflyK7PzSpZIX5Qdl/vbNXNvs0VZVXLqOt7H/Woh
	 T7E4RI+fIcmgK1CejxUS6WyG7X9P6tpPaJAy/zwDKNxMIMn9BViEdBzWPFBvYXDZC5vIj
	 svfAL0Jk2lqcKH2QoxA9wEAsJbq6pp3TAOMEyWBX8Tqmyx/YduDLK/0fl3W8Ly7mmS31N
	 1DgJBeEVNrJSQ3wDYMKYBOJzxVbNpHURpVXXnFszWLCPdBuDRLGI4KZBObhpyzxhqST7p
	 zBzjUrmD7NIwpdvwMEd07oNPVGrYxKkqxIQOayiGjP2mQAjTA8IuTiSAPtCXLcsRMPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=gS5ojnRmMoc3OlDBvvN5AGCgvVpUT0ifQ82HWsLXoCUksta/Xn1uoJLXwWl2HiFFXdZ4
	 3kAYDUYq2vbbQ2ymptbBktQKdvDlgEvj617bPzUpEMbfBasol9k/l0rLFim8u95f6m8Ee
	 taPGLwV8XYqmV75J/qbPjqyJ/BG24wyuYBQ/kYP5MXrlBXNxJMQxodL+DWlX74Z9NUTKM
	 L3Lrjgf2g/d2x4MFueUgdbWyv7DG/08VY2bp1wyLcmKmnLMGiblBRoN/9VzeH0RtN4KPT
	 2735r5ktFXKC26RrWF+TzHxt0qAAij26x387FjgCzqgs7aKLm0waQ5wjNkGqZU0ljmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CTiddayT;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918AB606D82A
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 16:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 918AB606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CTiddayT
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4a76f63b243so711532fac.0
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722279; x=1794327079; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=CTiddayTC06eUC3+YTQlvWEJspnMJnBDpQF8OkcoCxbCIqPVz5m6VwBfQCw/0FxOnr
         SC5g/bh9lx6HIjjRp/UvwR7Yy8ci3S10DjtNpLV9wpgpS+WMLyUGyHifQFYN/BRNPTxF
         QyE4aX0QROemHG0v8sdzHEMuuHuBsFdV9Xzuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722279; x=1794327079;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=pbKfMekO4XYxVk36OKtLj7nu5tVt/egCbtAs53LaQLK8nulhvcX1ZdEJkcR/LccJ0b
         9VgCR6N2iYp2lBLDQ7iOuSY6ydyFRjUmfVAWp2UfodekmzoGplNWAQdfIS/O8hhJYOop
         2eIMlWYyhFeIDxCmctGUnRBfQMrS9FMbdcnxnVXN0gOQT1+zMlCD0V8Sv1XyZk5gw/kj
         VIsTum95B1pHXKXeWdCfidf0DpbtvEPTwSbPFwGAsszD9tsHhc3qbo9w4pCvaIrGLI3h
         buZnjyRn3/YKPAtchFgfKsx+xyvwv4PINeLtSl/U3EGp3AwSz8NoQMgXfwid81VLYE7k
         gd6A==
X-Forwarded-Encrypted: i=1; AKwUvBz/42ptax6yPImK82LGKDmPvOwg6C4ALze3YVxkv/GJSmJ8m4CEvXyM+vi4sMvLpmBF19g=@lists.linux.dev
X-Gm-Message-State: APuU4Z9eOsci12/FwzgzbgI8KbjNtvW0c/wm4qOZvEvqB4CKSz8Ddpoi
	JNG9cZ283byElaICzv9RtBn3TNpXcSwi2FXuROZhSKbD6VSZ9bm0K4oFKQA/M4oITQ==
X-Gm-Gg: AYBFou2EAmHTeSFoOzxeXEU1fTMlpj9ylkq+Rf/mWTQrRdF6m9PT2BaqpHo++CHgNWQ
	Tw1K5f3jmfOL1TrInOBiw9K5vmBLpaO27+DYDU5LXoxD8/IAQfWo74DpA5TnT85WCLGRr89dPG8
	S5GzK6+ilwdBOre/BqZGKFXJ0CKTmMmf9CCk+c2BkRQVc4YrMp7OWHD6QCQH2hA2hzME20jy38z
	Mu6tKcgK3fl/YCZQX1l/DXNqEpegE0D3JyF/rjnZjGnU8Er4kJx7ewcsj9eQmZQ0LGYTYfqZYxf
	cz6buok5tpmYs3+zAm/RAYPvghX51gtpifUlwpT0oDvJPaN2gSL963MyCPmmSAs+2h7YTr8aDwE
	Bs20VUECZAoFPkX/3HG6KrQS4Vk6NiYudrowqUPCT7K8aAj6QES/H/Ma3LsaQjXvtxs1fQujswd
	1T+Bd9A7mw0wBTROmWt7TbPuYZ3/Jwda1dYrIPCRiuTRk0C6oG4PAX8ApeQFQ6imZjAONQHbhK9
	MbhCfHs5BgEAxZuHSq1kk5q6iIYfOhqtprCOpmMPpD/AsQlSN8qulMkw2U9e4Q7F1/w9MMipBAJ
	rPBdlWE7gG+i1MBKRKblB0DzQcoqxUF5O6cjOF+P7vFzbGIk8nK3Opzez0J250jnPIHOMahijam
	B2htt/cWAJSSpWX8=
X-Received: by 2002:a05:6808:10ce:b0:4b8:46e3:e220 with SMTP id 5614622812f47-5640de87067mr5635130b6e.12.1793722279518;
        Tue, 03 Nov 2026 08:11:19 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:18 -0800 (PST)
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
Subject: Re: [PATCH v9 6/8] serial: 8250: drain canceled TX DMA before reusing its buffer
Date: Tue,  3 Nov 2026 09:11:02 -0700
Message-ID: <20261103161104.2449407-6-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-6-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-6-9159caade148@gmail.com>
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
