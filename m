Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722277;
	b=SqftwQckEwhfTRgHscH0nmhztlUtyqJQ4RCtThYXinkYTXaijnNV9/utznTtkCO3PKT8
	 UHrtWlVJUfXh2VJ24RlSZSpV7NlQluvdQbWCPRgAEcP/bGAplzNyjEB6g7yUU7UUrx3M0
	 uSIVS6lwEzhkLHUgme7Vshj7ZpXn3GZLcLJePwVI92NHM9B0oCwmmLqdqTp2qQ3euCezR
	 krp4kqPILyfxfcNRnnISpLPBSK37ipDpuRExfr1VSbghYRyaxwbKPVoO1zD9pV7LJsXbU
	 D2DSI7gcvX/fPxNhzY2UdU343LO5mBfd59/zfOKKRSjXTkxIGzcvUoR/GW4nyItx/Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=YI6TVBVMHmWXPTOCFej2tm3dd9eSoSrHADbZzGDWrbhLDgfL71YdEg1Ij9jcrwEOkR46
	 3RE78CySCMzEkDJ5LuEyzJn788T31YJpLmQWFtgld2j7LOKVCguEus0YaHyfnOom+at7U
	 xGQ8OHg+kQgNvb9slpy3AOGlG5VoXMjH7waXfxGzSjioNfMWwwWlbMPxB3O+1nCJuIb6D
	 YOIk0+6zkCpLg8IBm544+B9t2Z9oRIX2BEg4aTiiZ1Rg6SXcvitPIcRpppgxzMB1peTqM
	 Ga/QtJZAreY6ClKr+w0uKHLANNB5cue9AJ9uzItiUb00DQW4eNNktqFOyBESOgWM/oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nN7J4Z+I;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BE3606EE9B
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 16:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BE3606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nN7J4Z+I
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-83bbcfba0ffso3212993a34.0
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722271; x=1794327071; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=nN7J4Z+IJL/HIvZxCIftoCi2f6oaUcDxgnKvsnILTyEvx56+yDOdCSAPgSl40ixiUa
         tK9VKrdyQymfFMtHbngQwzQEV7tFW9ji6o0zim3mIpXQwRKzI+f7eKGBOTte6WrlMnFm
         CO0B2u4t1yXfsFKl+OXqTq77DwmHa9U4XfaHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722271; x=1794327071;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=QodxYe1RGxDqzQGhga0a7IRM/xQYYnNa/6Mtf0pt7g6OSRHXX36PpLQa1fyJA/KhO0
         CERjMjGAq3AWti0BExxRnitzEt+K9t/2wi7FxGFgWRGA3qkJXSabi9w/HIaM9484sNMT
         eOR6S8id4EDdmu2PvuTN1BDyeXAlfQG06jW+C/1ASaWupcNyTwO7/dcPp7CSjo+1g8Tq
         obv5xwzN7WLsyU+MRRaJNvndx4itv61Vtj2pSCzX3Yqw/YkX8tMZ22U7ucqazmyJLjWr
         Mn133wmGCP0t0LoKFHGrhi4tWhTi2fLz4x51bh1jV8Pcl0NRyLWn2wHaxxkrDnQhDkkw
         p7fQ==
X-Forwarded-Encrypted: i=1; AKwUvBymKGjveDvQT5W6l2bLqoo0gip0F8uCNbgLQC0bfwXnyyjnGRz1JSqeNuS4Zs7Q29gtKGc=@lists.linux.dev
X-Gm-Message-State: APuU4Z9cGHUjmRVpgbReUlRiuHBo6g6Tp5H1KFiAW70PgjmYlnlXJAdb
	CL3IsRrSKlumzZKz4QAgcNwekGAeqc6VWhKdNVt94Lvc4McEZh748nL9rglvbbBY+Q==
X-Gm-Gg: AYBFou2+W3oDaDFkAadnClWvjg0mAd2+qAOvisHmPeM8/11Yi7PDSV4VrBHV456+968
	PYN5cTB0P6LnaJThW0SNYtOd1JTM37y62LVmAXdvWroW9ABo+ckTjvq1HXO+yLH++k3uDx6DG0d
	MkAK5n6+J3JUlPv0EIHM/MFQodAcwvQL4HNBntbHELvpI+DXMqyfnKS2Rhqyain5PQTvdzBDA3z
	mE7cAQpLBeZ/w+fPsHIbXxQN0H6EqTM7TYLqL1/JC6mkEFpOmkr2OcikAdv8LcpnLpX4xzFCbUr
	lzmh4TrcSnZrMe0hHK654xB65ZfJbZeRrIBB82q2nofN14OK1Uuw7HX8VbfblH6MBQbxBYTuxVk
	IinuruaDDTHRJEWQn6fh6Fn75XYZSmTykiSh85WeVvixfIkCuO9IoKsO1URfcoiGWN1DmVFAOMq
	0tahWmuj8CbjT9A0VYfIfV9kMPk3qBgj3cppYO0uQKdyJu1oXlgQGckm8BBZ1Sf7d2No67jcMuQ
	q/8mKGcPlxE2XV3pOdQLx2Pns3eUHZS1EznU8PLCtZwwPsRSJ8p+9ZWJpc//GjkzVM9tufgHcNS
	DBxnd2mCZodvvlFmsJVNKd+FDK82YAo2LsLP4SKfbm8aiIem79ZajMr2fBEC3ziwBdY9FBsLPaR
	0YRNNiED5RBVQp176KlYfoy7hZM+Kk7slsHl4
X-Received: by 2002:a05:6808:3a0e:b0:4cb:f21b:6f8b with SMTP id 5614622812f47-5640dd9d763mr8688402b6e.30.1793722270713;
        Tue, 03 Nov 2026 08:11:10 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:08 -0800 (PST)
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
Subject: Re: [PATCH v9 1/8] serial: 8250_omap: separate locked TX DMA completion processing
Date: Tue,  3 Nov 2026 09:10:57 -0700
Message-ID: <20261103161104.2449407-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-1-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-1-9159caade148@gmail.com>
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
