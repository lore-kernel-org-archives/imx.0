Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241302;
	b=AgdqMZQWPyQ/12naxOq0JAX9mvwvXE/RFaOz3kNBwg0u3Z3fvXtmOFRq7pccW3Rmss8q
	 Ap6FLxiodmOAANurgNbyYCcjduw9X2DjpAjld575TER5AWcaKocFiF8tHFWlo1uT7qz0N
	 u2Lbpxt++a8K6uDHGMmMrgF96vc8AT1eX8FOv+8T1d7KIypSofjEAZbG1JA0g9vAoyTbB
	 I7u5aQlz9Q3jZV64E5EN4zGQOVv4DFMEMG7PAZ7+Ks52ibX5Su0R/BH1H8vrkrXf1JUSi
	 cePztiJhhu9OMHclL6akXe6yIFrncSRRSm0yUq5AnvD62WlmCqMlGYEek5Je6TXIIqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=CdxY6uHpeiCkeRPzXO7bxmD63lFIsoowdqsHISeVNmCfqVoMkKZ8vAY/eP3qB4gcHtHB
	 yTqKMYWLLUToJrDi2yPPt3D3+6Q1VXdFKV5Do5GuZ7rgTYV4X3UH5x+yk061wKGowr5wB
	 w1aFADTTal5J+mwulWVCEM5VpkYKnxF2B6iPxVWnwY5tAjXwAMtC9VOGyTpMm3Kp4Aqu5
	 /1yBhsC7fdYOHnvyZwS+11gc3jdLBG/AE9xu4Ny6SpPpe4OfYycup9JVfryCNKd31W+E1
	 ab7J1kzVeFGe9VAg4e6BDBvZIMa0VAMEGVDF3ykdfbUKS1SWtLxEb9jHt4iuiPufWlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RHsmYArA;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90471606A334
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 16:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90471606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RHsmYArA
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a85c656c58so727117fac.3
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 08:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794241300; x=1794846100; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=RHsmYArAV4NRLnLi0FWhGDF8hFM+72wwHVtYlJuAga33U/1S2Nfp1W6GpZEHTJSs2s
         aZCze3+t2DaxVZ6/3t3Uj3HHfQngdc2Jx2wTfIz0NzPgILa61oUBoLjoCKaOP6a4W0gl
         8OshTL7M6ttATUbyL+d8jyCorSn1Ez4QEd1Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241300; x=1794846100;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=N6pRf24TwbEquBhgou6THGFE0HTQ2jT1Ribct+T0od0Yiva0GSi0WLFHq1ugSewmPQ
         rDB8A9HB2zsQ5WqIDxeFIk8P4IYWm3ibNBngH5lKjFC+0q3k/yhmKggTG1xy7wyyBreZ
         9mugrPILIWbnioCAUO0zyVDDp/bD5zVlcICFMRiPBhEFfqXUjIez04I5h6wv7UObu9cU
         Sh75Nxd31dvKUll+Jy4mcWH+KtvObmvfhyOXlcgBJnNwiAdoVZr9JAzw6Dl7pfL/3QNG
         yvRcIvArTvd77BUsPKuST1OZop09x9Y5bsBUaMwWonDtcFCuFJxEixtcjRG7n25SBD3o
         NK2Q==
X-Forwarded-Encrypted: i=1; AL+hErG42TO0l1Jnsu8j/8zTCzsdWNa+q3UqrAnsLheaFuq3mS4//oCs472IqX9Mf6GpVWx9i5E=@lists.linux.dev
X-Gm-Message-State: APuU4Z+SwpHRky+56oNE/YK1YPZcwqkVEuEBPqk8/A/91YY2HPGuEyF2
	kD/MryHhAIz2wu7GcuGtkxL4/Lh2krxeq7iTQqXDkDxQD0A64yKG6A4UeslePi2Zjg==
X-Gm-Gg: AYBFou143EW7AuQEve/smLv/zrRJEm1AuPJt56+m0OHKdm2bh8ceCqq7RbD5wqAZXkf
	b2OAOJqHcehQoZb4AMeVD2DCUC6ZrMgnYjM+ViU69mZ+Gy+4l7uZL+X0cHDt1dK+V/1/L4hw7o8
	EKCcYXQOzwNIxwem43s/IhsD9j+iRGTKowaY07ghmHRfAotPlb/L8wsuzsKvPcEOULI9RsqN3ye
	xe+JX6x1ptOthAdEdkVtlQf5ZhQrdxUgCbfCH81J39OLlfqtFp6wAEAhEyegFvAjmoQl91qYhSc
	yXpLM3vwsyXiuOIBjSMiHvTTyTAuDb0ecqVGVHfeUFSiLeX6yukS31vSo46lyaimcAXPjhoXMtN
	Hu1Mi+mjAsE+/oPoK39emjdi/T7JqZtGy6B2Z0hiQy+yG3CoWL/X3u5nkXzOavja5rjEZ/8n0gI
	v/rmnsLnaFwR7Wr+u25u5nJS4r1GTsG+xU4R2KkcteYiV5Etl9p8ukmnuXaj5vADwyUJt62j/cN
	J8hT7RUB7Xq/P3/NDpNbaqrHbKlLe4NH2meXZnjNvznnyhZp/YTO2A6WTRK0K7LZey1Js9AdM48
	w2wjq5v6nHFbA5h/GMu36j+EUhWE0h8CWp7yEArvEWNeMwHOAt+9s6SENNOtIFbRyF5GTSdzeDc
	oT0HKMiivkNtmt/m8JELHWVCfBLAAp4Kq5sl7
X-Received: by 2002:a05:6871:3321:b0:4ad:2386:45ca with SMTP id 586e51a60fabf-4adecba6a5bmr2379052fac.55.1794241300604;
        Mon, 09 Nov 2026 08:21:40 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade694062csm5510676fac.8.2026.11.09.08.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:21:39 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Raul E Rangel <rrangel@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v10 8/8] serial: 8250: retain DMA resources when termination fails
Date: Mon,  9 Nov 2026 09:21:35 -0700
Message-ID: <20261109162135.906262-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261108-submit-serial-8250-dma-cancel-v1-v10-8-e6227ddb95b1@gmail.com>
References: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com> <20261108-submit-serial-8250-dma-cancel-v1-v10-8-e6227ddb95b1@gmail.com>
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
