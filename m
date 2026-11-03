Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722279;
	b=TmuLFSTnPWrPX51R6PenCDbXBDOn+/x7am5cPmZD++EGpeTwBqrmnxcLt2vFIVU1yfh6
	 Z8XYW5MZECxtab2oeWo8dyzVJjH/AV4gXncbHgvoQUOLqoEOz0w+3sKiJ4OBhz6eipD6v
	 QXmc7GlKsew90HcYGYx6wQj14HV+jXPDxu7GS3pXz3kMlB6cFVWDdowi1x7zICeLx/IJI
	 yxBY2M/EoxtG/I24a/NT0ylrAuBrQ5UOrP5AYi50+CDaOoVD3r1YWIo2OcUyP0toMVtsX
	 7Vf3UP8R1vrio2tJyFBsdj+LPIErVR+R3uWfAix9gMufCDZ1YIf3sNrJOKIA0sidDXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=PIj7HhwpZ8XtcbHSbLxgaAIGiAbevZR/sSo7wwvO8lv+WSZA3eSdQb/eUtav2CTwwh7v
	 OJJBUqf0iPOeYV4TkVZgvciVY7uKMFwwbUtFwMBQtj6nDje2YkuJn0C83bkDfRBG4EYMj
	 i4NpGdAJ+h8HAf6kxa1S7iKzAZysDzCBEypWUvQl3axXpxWwQC/agopM8VzujGuV2mBDi
	 U3LxvCOsw+RHcNVOuNFIBDz1KN3poFiM0AYxORJw6Oakn/eiwPop+tnr0QWBZ5xO6D7N7
	 bTKKGFBJu8aSpLTjpm+absfz6A+8JE/6+hYU88/qSuu3fnFpyHrLdtWS4+apZGdEkcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lONdckTO;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CA76082BD7
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 16:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CA76082BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lONdckTO
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53ec9237600so2447581b6e.3
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 08:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722278; x=1794327078; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=lONdckTOoG17WJ0Hs9xLOkrEG7GXe0m7O3FiD3+uYBUrW/KmNj62wimhT6+cVHakeg
         8LoS7Z4nMsa94U6R2bncUTqgDixkhSc8OvLMtOGjsAmXTFWm+FTcaGKF+RroKx8UGhb2
         cpuP6QVUFzQfyQgCCrwpye0XRcxPXbRvSZHfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722278; x=1794327078;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=uRm6WXwwymGNodNhNjlcCmPvFHH+8NrsemKgB7RwrDaihxnTPFo640GqB99aOU4n7l
         bIe1/HheQIHt9m+TcKd1GpE7fg08PQKth9ZdDtEKk9rWcSuq4Kb+grLIguY9lQc2Kj1E
         LVhYYCHnEhpEF2elhyo8sh5pUs1wxhlh8pN8WUjvZg2WC1ml95MXyDu+yESFPx/oG4+h
         HFouP5BXl1F6vmyDomL1AiY01RVg804boBFos2gRBMSF4JambXRewsJ9BlxvPTfiSWf8
         IKRkeWpVti9c6+/3ZvCTmTJH7MvPEM6NLh7tKh8mpBsyXwy8lU4cn6wuvF6MM1yGl2oW
         r1EA==
X-Forwarded-Encrypted: i=1; AKwUvByGB27MepyMReviBTwGmivdnrYmummJZhlsCv0WPKd5ABZM6AcGPE4df2ZPCO0o59xyOL0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8pcaU9ZPh7OzR37hJo60+vM0OaKoacROXvpgQ+HeCKiZmKVali
	8f1FdzaxWKuCb2pIxtY9z5GfIp7oyB7Xd31OcPlKwbqMbuq4DmvLumfvNzYbGo3QvQ==
X-Gm-Gg: AYBFou1viYt/bmFXTV27vfv1is623+poAbRoAdg/Zm6w/3e9AI7Df3fzLY455ecqfuY
	yjpVjTHuFNLMrgw9CaDKRr3k9fLDMZPeqvyjthp2qJqK/SFpxpXmn/GAW/DXUs7Md1WAYyclH6D
	tf5sHsAWgXgJyC1pbH/2vi95bSQMl7VeyTeC0oNcQeFpEMjRhm8imcPKyjkl5M9cnvD1cbJftx+
	bPJYMwG2XgVgUqKbyHaBz+LoQKX3qSK7tQdYsqM//sImuIKQwv7M04syqe9UTLvP8rVzNmuw5p4
	dco/0MSStCgg4kwEOaiRq8fBfwI2dWdx/Yd/v0OrVp787nDKBbhNghylRmPHvXxyC0U3y4jIf85
	Ugmotq1mUJnBHVLUsCdATSjqH5mO1HR/O0wpxt5qg4PieKLSGcj51+Kg6bu3fgkiUuAZx9WDnYB
	Xyam/f4oRYn1KNwVpwBEPqalXIf7a3/Mlgx3JPmqhBBmLmCbBT7rHg1obxBX5DLbZFNOkx0egqi
	TDLp4cLY/Had/RSnWnS9HJpn6k4oGtq63JkbPNYZzR+llsAkXMwIS37+nH28ILjaee2amvis2P+
	1oioQL8fydnRJFFqGBS2u/nqR+6nQD9FA0zhVd28dRmMQVh02md+2gWZ9xYBB+YD+vI9zxitSBU
	c1fxJ1cMvfhynQck=
X-Received: by 2002:a05:6808:1793:b0:540:5827:6d8c with SMTP id 5614622812f47-5640e032a52mr8860527b6e.57.1793722278097;
        Tue, 03 Nov 2026 08:11:18 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:17 -0800 (PST)
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
Subject: Re: [PATCH v9 5/8] serial: core: allow drivers to reserve flushed transmit storage
Date: Tue,  3 Nov 2026 09:11:01 -0700
Message-ID: <20261103161104.2449407-5-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-5-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-5-9159caade148@gmail.com>
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
