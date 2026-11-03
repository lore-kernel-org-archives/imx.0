Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722277;
	b=V18FrlPgAG3ZmYCxPBSXAfsSRLB1nNjt/1CGM+saAW3CgfE+j3BrX4fOQCp22qZUjXE9
	 OfIk2l2YpLyWvTiLcHcYwD9arYU76QGOik2jTgFl2eRi4S7FL1Wn4D7oOedmuvcJ0neCP
	 JcDlhp639BRo8QTShX0K3nsyxp/jerOZ0IxQzYvpnN/MEfNuuSusC6yRSx4aA7zDdwAsa
	 00KQ4A05LJFrBNAHeSttXofjjoNhl2zP/jn8o2P5kXL9TtzVDXO0lP3FQUZUbjjpPscrB
	 iW3d8Y7wcnMSsLAtmWBguChb0s8jB+l/PwRmTDWQOj1AhCaPV9tPekAm2sFnFnSiFfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=cxl0u+DXqC/LtjbFBadlYF8plf4CMoJ0fEkJFi1Y4UG6TkrKV2ih88HxiPw6YB9KSFoZ
	 K1mUpeG/8A6t4l2CY6/KorfHnqszzr4d6iPHXaiGJ6gWCNXt34jijOu+VLd92izYkA6lA
	 EzxWQRpQwKWRRQyx8tcqpC3hYJZqjkSunWjQ1YmCJq9aaKLmOePdJBTnopz6fSk+NW1br
	 zB9MSqtKRezw7s2Ih/OnWGmbP24qz51Xs9T8Cwcb1STMsgGBRbiJDZopk3rbi2Z2BrLK9
	 mvQV1/vhx5iPcCNknFxgo7Brc0M5s+XCBhtuRI4IsHxhbBfe0ElfKdb1MMZ6b3RBjxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U9APNM7i;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62C3606D802
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 16:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A62C3606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=U9APNM7i
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-53c156ba662so2403307b6e.1
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 08:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722276; x=1794327076; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=U9APNM7i8LE24zgbQf7CrkCjghi47CO4iz8pfZHCScdfO3WqtQIbsX8VM3Zq0Za1ES
         vuL+SYky9DvJqXXdFxohR8SYl1WDR3WozBx3PxGPYOgSXhHxuSJ1rKNcY2DT4X3+xH9e
         rjv365rbatdwEna0oTrCiGDrxJ9hVKYAJ/ZYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722276; x=1794327076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=T6SX/KJuLY4lmd1ugvT0//5B49G1Ezwbo0Sr7CPVcfGT/vPt3vr9ckDhznkfZpdx1f
         KoRcCXVYfBWVT8nGDe6aqeewsoTY0kuMEttIw2w0q8ML44BVSso0xk/MpFktEms2qjgJ
         CjCq7SwW0SNCFkwaZu6t9caMT/wIHEzuJtJoEDsBoYHPA45zym/vt6xD/B2ysncrQ5lx
         YTD37gPedfW1qTfMXYhNfudQG7yuUA3prarWu1GYKCOdYHgjbjmQBl4+x0hQev42Wpfk
         P+HhcLg++JCVnBa2NWNwyCNkjcZIG9wz1X7ERLRqTm2TMrEwmKhJQkgKEP+rUFfw4J94
         rImw==
X-Forwarded-Encrypted: i=1; AKwUvBx/gQ3aiTnZhfEqReCgUicocOq08eDdb93v7saMZZ6TogyyRpZlKDOkl+4Wed+k7AJttEY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9nkZ1jYEcTSdglppQxW01mBR+F/JdXWuHW7U2hfg20zgXF0hox
	ws25bqHcHBpL4jruA+AqzzYrySoa1kdl7mU5QsXf2A+fFIckvKvSPz1bKUnw4KwGvQ==
X-Gm-Gg: AYBFou2fcksRmcg2Bk/LVSjdmv7nQyMTvZP7eecMmvRPPb8WQE5Qmp3rvhY4tESbRBW
	3/C52EhR/fahfUQG1idYXqTbxLuFEXueWVsl6lA0uatr0elhgZ8hnXJeDhsHR3mYQfgzj2ouNCK
	st4TrULuMrbALq7F/FfRpXMNpglozgwpCZ0hqtPvhn6ACoSccCVnQBwkHRl6grtbPu1T/Nz7ruQ
	tXcVfvbgEpnb6wN4sfRJCq2l6c9APr9QO5OHHUGVt4MmrTS1y8x/unFXNuqrQ+wNOgvdOqBCtz4
	pnikWn5Gj6BNASAK7nBo/n21afA8oUZIWvwmL6NweuPfCvXy9GfmgGoxNwMEDgi5YkpMRF+RnjO
	uwKGSdEqZ9G8RW6BAGIhaiA2hf8AabUDKeitlnQwQT6VEmOcHDok0Z38dkyMnrGXUE3Uyyvjtvz
	TNevr+MmEvYUn90ehRcccP6Tx6P87/R5JHHx3DnPg5BD6zjXk015EjDRs3l4DwKbwrsQDa+y1iN
	DzbMbI1gA/b15PH7ylg6upOQ4t08W5hXmuNHCalakkItom+DYoe/g+WpF0JTjVqgvuKIehaqfTO
	PNaE9pO9YBw/OJhDp2wg7Ou6KJBrgmutGKjrClFc/2QxMhcO8s2EPLrY8vornzzIheDezikvQaf
	80MFoER1AGZqoQnI=
X-Received: by 2002:a05:6808:1691:b0:4f1:7c39:8a7c with SMTP id 5614622812f47-5640df628e8mr8758951b6e.62.1793722275736;
        Tue, 03 Nov 2026 08:11:15 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:15 -0800 (PST)
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
Subject: Re: [PATCH v9 4/8] serial: 8250_omap: quiesce DMA IRQ handling before shutdown
Date: Tue,  3 Nov 2026 09:11:00 -0700
Message-ID: <20261103161104.2449407-4-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-4-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-4-9159caade148@gmail.com>
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
