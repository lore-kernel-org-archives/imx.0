Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722274;
	b=F/SRb5/XiFj/Xw9crm/YPwxJ4ThYnVwIZnt1j6X2b+l6C6qZl1sMimwm+UtYQ47kZMyJ
	 UAxsRySSwrKH0fZkVDtJ+vjCzdvJ7IaPCZbQjOuwAlv7U8epMhxHcg/QxgaSuujzu1ETE
	 ISxs5t8A8Q+hdffeDoIwLlHQMdiaNMR8CKxaXWfLFfWQyWux4yBqU/sBntQIpc6T61K8F
	 nhlD3Av92emYlMp9ozh6RZR9cYKnnIcMJ295UojT3+IbwNIK1KfiKkfy/YGCq3p2ObNFN
	 RjZAAf5Vyk5gDYSipQdxsza7NVlAbwSAH4DOUIrl+gQ2urWK+PnPaIuX+R1sRcIxoHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
	b=D8tn2/s2vkvMpk8zvPCTTEQaHJYAmOD/az2q1FEUQqmW/ucIpUMUAwfJ2MWjh+rdrRWW
	 wdMlgbHJGrACPqqN7Lw6vWM3aSwz/BVXsH/9TfHhO1vXGXcpGI+vZ8l0UJrEFzgB1bY/h
	 7L08qSSm4da16ssHB2CYchV4l+/LmEyyQOJWLOYfkmKMh5anPvR5R7lsz2wa9te48IXeU
	 8uVqcunNdKIS2qlpqp7xHINztvGv4ttEuni3tzqshg1mMAXWWHzAITpseBaQwZWrIGcIh
	 hF+MUfGQEXWv87ukB0lMr6b5OC/FKvrtzABYIcFUFpJXzD7jR07AARycJ+8iJxqyLnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E5u6lUxd;
	arc=none smtp.remote-ip=209.85.167.179
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1D1606D81C
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 16:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1D1606D81C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E5u6lUxd
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4d7034a99a9so2735371b6e.3
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 08:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722273; x=1794327073; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=E5u6lUxd5KfRD6DBJEj2vOhxIm7LQKVCqavBVgBBWQKN5IKn/YXBa1A33embo9AFcX
         G3kmgiHIG4p07opeykLEbC6klBpj2GKoaBzXttAor/tBv78Vi5fsB2iEfu4VvKTBvMgG
         J4cjJhv3leRadWLUfUjHEyQ7LXcHLDyiyx+ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722273; x=1794327073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9QmmCvTtJG0FWP5byFcRaRFelUpQGR0S1hSw8HKBvw=;
        b=DqH9+OBOrAzapaMbtfmynB1SFYjSBIFokLbZMUmkmIx0hNyEuJvdMF0KgUe96cJfqp
         wPbjHwpJXWapOI/XYJUaB9uvWgwZL5xQNfX8fABYDsQQ7haHNDDOhmf58XKnZ73bsqgE
         c1v+wPz9/e05vGDm2R1W38Teg04OSaLWIf5oBcxJ0e2w2uv7s2kGcw9TYcwu+gjv2Fzk
         RJgjbH2+XlA3WUquMeG0yZ8uTxc+EHS6XmSeuL+jiZMjsENGoSXQIjj3d5T1bF5GeSI1
         TmWvnNfepVMEL6XlxxNFar9Q7WHRLFWTzfJ5nwQe1jiGX4qgr9nfSS00SyLNe8W2gQhC
         eHUQ==
X-Forwarded-Encrypted: i=1; AKwUvByz/3s5k0I6p+t9suYxuo6GWX+Au33hdm9pjD5isrdPM4nQ/tqOo60qeXjtYsKiICBClgA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9PCJoJD5fS2D380RbWMlYS2Hti5C5Am2V91IUOZlWF9YLyMc6t
	+SbB7liO7xBEpFh4ZR8r2jbmTxJZpgeno1ZGfNwMdX0Add0QjHcmLp2mMcmgyyIjEA==
X-Gm-Gg: AYBFou2cHcATKNHrpX9AxsyaFU8tD78X4EQBUeM5jrLN0ARdbLDJcXD+kfRk/0QuUTT
	THagKV2ZXzkxnCFSCW+3ocF9RAWaMaPlNCbj+va9bM3eNMRcV1Pfharn9Jb5JhdgHKTJ/HwX/cJ
	VRpweVADXU3c+Kgmt6gl4Bdyv+mXm7cv+Ua3wrywNRFIdr1EYmWaMzy7RyTqdColbnBdhA6WB1t
	LRqbmd6O+3XZy7VjqM9jMvekCHlYYNb0NhFtq0maJrzj2/g1J1AuZBGGTcrkTjKgvqFOCiZhJnM
	5ZIgKFEo7uEOSSmZbj9EiWxfFAfLNAwzHBEcWTBGQA1bsfY9i7LQnB9eZwHZQcr0zvpS5lWWJwh
	34+J4gIUJH3mDkJ3sET2EXevrCJykz2QJmVvTg1uANRmG72UNIcbmHmzA1fNPTNkO8M0WVdBhkZ
	M5q9LTTFRlMowcYJGZdr0675Bm9wP1CLffkYsJapQD1If5zSew/cnHGPrZsMcDEY7agvGzrMdSv
	+d03xod3sJ0RU/wbcjG2qlaCUn5O40cVYFjKYgFrmqzNGc+JgxgLq+TM9Njh7aD+rp/adHWcd+q
	n/LqZ3gqKaxuD0/zDZpvfcS9HvHePzrsRigP3BoO43GLCaeAdYnPE6LXSUvhh3igb1VR3yTX8A1
	Nxrc/nZV6EzLAW4W+
X-Received: by 2002:a05:6808:3a0d:b0:4b9:e6ab:d085 with SMTP id 5614622812f47-5640dd277b1mr9216799b6e.37.1793722273221;
        Tue, 03 Nov 2026 08:11:13 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:12 -0800 (PST)
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
Subject: Re: [PATCH v9 2/8] serial: serialize asynchronous write wakeups with the port lock
Date: Tue,  3 Nov 2026 09:10:58 -0700
Message-ID: <20261103161104.2449407-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-2-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-2-9159caade148@gmail.com>
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
